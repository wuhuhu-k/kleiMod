----
---文件处理时间:2024-07-01 23:48:41
---
require("prefabutil")
local cooking = require("cooking")
local HH_UTILS = require("utils/gentleness_utils")
local SKIN_CONFIG = require("enums/gentleness_skin")
local two_list = {
    ["gentleness_drink_yang"] = true,
    ["gentleness_drink_duo"] = true,
    ["gentleness_drink_yuan"] = true,
}

local function GetItemSkinName(inst)
    local base = inst["prefab"]
    if type(inst["g_item_skin"]) == "string" then
        base = inst["g_item_skin"]
    end
    return tostring(base)
end
local skin_config_item = {
    ["gentleness_cook_pot_item"] = "gentleness_cook_pot",
    ["gentleness_cook_pot"] = "gentleness_cook_pot_item",
    ["gentleness_cook_pot_skin_1"] = "gentleness_cook_pot_build_skin_1",
    ["gentleness_cook_pot_build_skin_1"] = "gentleness_cook_pot_skin_1",
}
local assets = {
    Asset("ANIM", "anim/cook_pot.zip"),
    Asset("ANIM", "anim/cook_pot_food.zip"),
    Asset("ANIM", "anim/cook_pot_food2.zip"),
    Asset("ANIM", "anim/cook_pot_food3.zip"),
    Asset("ANIM", "anim/cook_pot_food4.zip"),
    Asset("ANIM", "anim/cook_pot_food5.zip"),
    Asset("ANIM", "anim/cook_pot_food6.zip"),
    Asset("ANIM", "anim/ui_cookpot_1x4.zip"),

    Asset("ANIM", "anim/gentleness_cook_pot.zip"),
    Asset("ANIM", "anim/gentleness_cook_pot_skin_1.zip"),
}

local prefabs = {
    "collapse_small",
}
for k, v in pairs(cooking["recipes"]["cookpot"]) do
    table["insert"](prefabs, v["name"])
    if v["overridebuild"] then
        table["insert"](assets, Asset("ANIM", "anim/" .. v["overridebuild"] .. ".zip"))
    end
end

for k, v in pairs(cooking["recipes"]["portablecookpot"]) do
    table["insert"](prefabs, v["name"])

    if v["overridebuild"] then
        table["insert"](assets, Asset("ANIM", "anim/" .. v["overridebuild"] .. ".zip"))
    end
end
local function SetProductSymbol(inst, product, overridebuild)
    local recipe = cooking["GetRecipe"](inst["prefab"], product)
    local potlevel = recipe ~= nil and recipe["potlevel"] or nil
    local build = (recipe ~= nil and recipe["overridebuild"]) or overridebuild or "cook_pot_food"
    local overridesymbol = (recipe ~= nil and recipe["overridesymbolname"]) or product
    if potlevel == "high" then
        inst["AnimState"]:Show("swap_high")
        inst["AnimState"]:Hide("swap_mid")
        inst["AnimState"]:Hide("swap_low")
    elseif potlevel == "low" then
        inst["AnimState"]:Hide("swap_high")
        inst["AnimState"]:Hide("swap_mid")
        inst["AnimState"]:Show("swap_low")
    else
        inst["AnimState"]:Hide("swap_high")
        inst["AnimState"]:Show("swap_mid")
        inst["AnimState"]:Hide("swap_low")
    end
    inst["AnimState"]:OverrideSymbol("swap_cooked", build, overridesymbol)
end
local function IsNativeCookingProduct(name, ismaster)

    if not ismaster then
        for k, v in pairs(require("preparedfoods")) do
            if name == v["name"] then
                return true
            end
        end
    end

    for k, v in pairs(require("preparedfoods_warly")) do
        if name == v["name"] then
            return true
        end
    end
    return false
end
local function ShowProduct(inst)
    if not inst:HasTag("burnt") then
        local product = inst["components"]["stewer"]["product"]
        SetProductSymbol(inst, product, not IsNativeCookingProduct(product) and product or nil)
    end
end

local function ChangeToItem(inst)
    if inst["components"]["stewer"]["product"] ~= nil and inst["components"]["stewer"]:IsDone() then
        inst["components"]["stewer"]:Harvest()
    end
    if inst["components"]["container"] ~= nil then
        inst["components"]["container"]:DropEverything()
    end
    local item = SpawnPrefab("gentleness_cook_pot_item")
    if item then
        local item_skin = GetItemSkinName(inst)
        local item_prefab = item["prefab"]
        if skin_config_item[item_skin] and HH_UTILS:IsHHType(SKIN_CONFIG[item_prefab], "table") then
            local new_skin=skin_config_item[item_skin]
            for i, v in ipairs(SKIN_CONFIG[item_prefab]) do
                if HH_UTILS:IsHHType(v, "table") and v["skin_id"] == new_skin and v["skin_server"] then
                    v["skin_server"](item, new_skin)
                end
            end
        end
        item["Transform"]:SetPosition(inst["Transform"]:GetWorldPosition())
        item["AnimState"]:PlayAnimation("collapse")
        item["SoundEmitter"]:PlaySound("dontstarve/common/together/portable/cookpot/collapse")
    end
end
return
Prefab("gentleness_cook_pot", function()
    local inst = CreateEntity()

    inst["entity"]:AddTransform()
    inst["entity"]:AddAnimState()
    inst["entity"]:AddSoundEmitter()
    inst["entity"]:AddMiniMapEntity()
    inst["entity"]:AddLight()
    inst["entity"]:AddDynamicShadow()
    inst["entity"]:AddNetwork()

    inst:SetPhysicsRadiusOverride(.5)
    MakeObstaclePhysics(inst, inst["physicsradiusoverride"])

    inst["MiniMapEntity"]:SetIcon("portablecookpot.png")

    inst["Light"]:Enable(false)
    inst["Light"]:SetRadius(.6)
    inst["Light"]:SetFalloff(1)
    inst["Light"]:SetIntensity(.5)
    inst["Light"]:SetColour(235 / 255, 62 / 255, 12 / 255)

    inst["DynamicShadow"]:SetSize(2, 1)
    inst:AddTag("structure")

    inst:AddTag("stewer")

    inst["AnimState"]:SetBank("portable_cook_pot")
    inst["AnimState"]:SetBuild("gentleness_cook_pot")
    inst["AnimState"]:PlayAnimation("idle_empty")

    inst:SetPrefabNameOverride("gentleness_cook_pot_item")

    inst["entity"]:SetPristine()
    if not TheWorld["ismastersim"] then
        inst["OnEntityReplicated"] = function(_inst)
            _inst["replica"]["container"]:WidgetSetup("portablecookpot")
        end
        return inst
    end

    inst:AddComponent("portablestructure")
    inst["components"]["portablestructure"]:SetOnDismantleFn(function(_inst)
        ChangeToItem(_inst)
        _inst:Remove()
    end)

    inst:AddComponent("stewer")
    local stewer_com = inst["components"]["stewer"]
    stewer_com["cooktimemult"] = TUNING["PORTABLE_COOK_POT_TIME_MULTIPLIER"]
    stewer_com["onstartcooking"] = function(_inst)
        if not _inst:HasTag("burnt") then
            _inst["AnimState"]:PlayAnimation("cooking_loop", true)
            _inst["SoundEmitter"]:KillSound("snd")
            _inst["SoundEmitter"]:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
            _inst["Light"]:Enable(true)
        end
    end
    stewer_com["oncontinuecooking"] = function(_inst)
        if not _inst:HasTag("burnt") then
            _inst["AnimState"]:PlayAnimation("cooking_loop", true)
            _inst["Light"]:Enable(true)
            _inst["SoundEmitter"]:KillSound("snd")
            _inst["SoundEmitter"]:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
        end
    end
    stewer_com["oncontinuedone"] = function(_inst)
        if not _inst:HasTag("burnt") then
            _inst["AnimState"]:PlayAnimation("idle_full")
            ShowProduct(_inst)
        end
    end
    stewer_com["ondonecooking"] = function(_inst)
        if not _inst:HasTag("burnt") then
            _inst["AnimState"]:PlayAnimation("cooking_pst")
            _inst["AnimState"]:PushAnimation("idle_full", false)
            ShowProduct(_inst)
            _inst["SoundEmitter"]:KillSound("snd")
            _inst["SoundEmitter"]:PlaySound("dontstarve/common/cookingpot_finish")
            _inst["Light"]:Enable(false)
        end
    end
    stewer_com["onharvest"] = function(_inst)
        if not _inst:HasTag("burnt") then
            _inst["AnimState"]:PlayAnimation("idle_empty")
            _inst["SoundEmitter"]:PlaySound("dontstarve/common/cookingpot_close")
        end
    end
    stewer_com["onspoil"] = function(_inst)
        if not _inst:HasTag("burnt") then
            _inst["components"]["stewer"]["product"] = _inst["components"]["stewer"]["spoiledproduct"]
            SetProductSymbol(_inst, _inst["components"]["stewer"]["product"])
        end
    end
    local oldHarvest = stewer_com["Harvest"]
    stewer_com["Harvest"] = function(self, player, ...)
        if player and player["prefab"] == "gentleness"
                and self["product"] and two_list[self["product"]]
                and player["components"] and player["components"]["inventory"]
        then
            local spawn_food = SpawnPrefab(self["product"])
            if spawn_food then
                player["components"]["inventory"]:GiveItem(spawn_food)
            end
        end
        return oldHarvest(self, player, ...)
    end

    inst:AddComponent("container")
    inst["components"]["container"]:WidgetSetup("portablecookpot")
    inst["components"]["container"]["onopenfn"] = function(_inst)
        if not _inst:HasTag("burnt") then
            _inst["AnimState"]:PlayAnimation("cooking_pre_loop")
            _inst["SoundEmitter"]:KillSound("snd")
            _inst["SoundEmitter"]:PlaySound("dontstarve/common/cookingpot_open")
            _inst["SoundEmitter"]:PlaySound("dontstarve/common/cookingpot", "snd")
        end
    end
    inst["components"]["container"]["onclosefn"] = function(_inst)
        if not _inst:HasTag("burnt") then
            if not _inst["components"]["stewer"]:IsCooking() then
                _inst["AnimState"]:PlayAnimation("idle_empty")
                _inst["SoundEmitter"]:KillSound("snd")
            end
            _inst["SoundEmitter"]:PlaySound("dontstarve/common/cookingpot_close")
        end
    end
    inst["components"]["container"]["skipclosesnd"] = true
    inst["components"]["container"]["skipopensnd"] = true

    inst:AddComponent("inspectable")
    inst["components"]["inspectable"]["getstatus"] = function(_inst)
        return (_inst:HasTag("burnt") and "BURNT")
                or (_inst["components"]["stewer"]:IsDone() and "DONE")
                or (not _inst["components"]["stewer"]:IsCooking() and "EMPTY")
                or (_inst["components"]["stewer"]:GetTimeToCook() > 15 and "COOKING_LONG")
                or "COOKING_SHORT"
    end

    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst["components"]["workable"]:SetWorkAction(ACTIONS["HAMMER"])
    inst["components"]["workable"]:SetWorkLeft(2)
    inst["components"]["workable"]:SetOnFinishCallback(function(_inst)
        if _inst["components"]["burnable"] ~= nil and _inst["components"]["burnable"]:IsBurning() then
            _inst["components"]["burnable"]:Extinguish()
        end
        if _inst:HasTag("burnt") then
            _inst["components"]["lootdropper"]:SpawnLootPrefab("ash")
            local fx = SpawnPrefab("collapse_small")
            fx["Transform"]:SetPosition(_inst["Transform"]:GetWorldPosition())
            fx:SetMaterial("metal")
        else
            ChangeToItem(_inst)
        end

        _inst:Remove()
    end)
    inst["components"]["workable"]:SetOnWorkCallback(function(_inst)

        if not _inst:HasTag("burnt") then
            if _inst["components"]["stewer"]:IsCooking() then
                _inst["AnimState"]:PlayAnimation("hit_cooking")
                _inst["AnimState"]:PushAnimation("cooking_loop", true)
                _inst["SoundEmitter"]:PlaySound("dontstarve/common/cookingpot_close")
            elseif _inst["components"]["stewer"]:IsDone() then
                _inst["AnimState"]:PlayAnimation("hit_full")
                _inst["AnimState"]:PushAnimation("idle_full", false)
            else
                if _inst["components"]["container"] ~= nil and _inst["components"]["container"]:IsOpen() then
                    _inst["components"]["container"]:Close()
                else
                    _inst["SoundEmitter"]:PlaySound("dontstarve/common/cookingpot_close")
                end
                _inst["AnimState"]:PlayAnimation("hit_empty")
                _inst["AnimState"]:PushAnimation("idle_empty", false)
            end
        end
    end)

    return inst
end, assets, prefabs),
MakePlacer("gentleness_cook_pot_item_placer", "portable_cook_pot", "gentleness_cook_pot", "idle_empty"),
Prefab("gentleness_cook_pot_item", function()
    local inst = CreateEntity()

    inst["entity"]:AddTransform()
    inst["entity"]:AddAnimState()
    inst["entity"]:AddSoundEmitter()
    inst["entity"]:AddNetwork()

    MakeInventoryPhysics(inst)

    inst["AnimState"]:SetBank("portable_cook_pot")
    inst["AnimState"]:SetBuild("gentleness_cook_pot")
    inst["AnimState"]:PlayAnimation("idle_ground")
    inst:AddTag("portableitem")

    MakeInventoryFloatable(inst, "med", 0.1, 0.8)

    inst["entity"]:SetPristine()
    if not TheWorld["ismastersim"] then
        return inst
    end
    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst["components"]["inventoryitem"]["imagename"] = "gentleness_cook_pot_item"
    inst["components"]["inventoryitem"]["atlasname"] = "images/gentleness_image/gentleness_items.xml"

    inst:AddComponent("deployable")

    inst["components"]["deployable"]["ondeploy"] = function(_inst, pt, deployer)
        local pot = SpawnPrefab("gentleness_cook_pot")
        if pot ~= nil then
            local pot_skin = GetItemSkinName(_inst)
            if skin_config_item[pot_skin] and HH_UTILS:HasComponents(deployer, "gentleness_skin") then
                local success, message = deployer["components"]["gentleness_skin"]:BuildChangeSkin(pot, skin_config_item[pot_skin])
            end
            pot["Physics"]:SetCollides(false)
            pot["Physics"]:Teleport(pt["x"], 0, pt["z"])
            pot["Physics"]:SetCollides(true)
            pot["AnimState"]:PlayAnimation("place")
            pot["AnimState"]:PushAnimation("idle_empty", false)
            pot["SoundEmitter"]:PlaySound("dontstarve/common/together/portable/cookpot/place")
            _inst:Remove()
            PreventCharacterCollisionsWithPlacedObjects(pot)
        end
    end
    return inst
end, assets, { "gentleness_cook_pot", })
