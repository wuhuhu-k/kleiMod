----
---文件处理时间:2024-07-01 23:48:41
---
require("prefabutil")
local HH_UTILS = require("utils/gentleness_utils")
local MAX_PICK_NUM = 9999999
local assets = {
    Asset("ANIM", "anim/mushroom_farm.zip"),
    Asset("ANIM", "anim/gentleness_mushroom_red.zip"),
    Asset("ANIM", "anim/gentleness_mushroom_blue.zip"),
    Asset("ANIM", "anim/gentleness_mushroom_green.zip"),
    Asset("ANIM", "anim/gentleness_mushroom_moon.zip"),

    Asset("ANIM", "anim/gentleness_farm_moon_build.zip"),
    Asset("ANIM", "anim/gentleness_farm_green_build.zip"),
    Asset("ANIM", "anim/gentleness_farm_blue_build.zip"),
    Asset("ANIM", "anim/gentleness_farm_red_build.zip"),
}

local prefabs = {
    "red_cap",
    "green_cap",
    "blue_cap",
    "moon_cap",
    "collapse_small",
    "spore_tall",
    "spore_medium",
    "spore_small",
}

local symbol_config = {
    ["gentleness_mushroom_red"] = "gentleness_farm_red_build",
    ["gentleness_mushroom_blue"] = "gentleness_farm_blue_build",
    ["gentleness_mushroom_green"] = "gentleness_farm_green_build",
    ["gentleness_mushroom_moon"] = "gentleness_farm_moon_build",
}
local produce_config = {
    ["gentleness_mushroom_red"] = "red_cap",
    ["gentleness_mushroom_blue"] = "blue_cap",
    ["gentleness_mushroom_green"] = "green_cap",
    ["gentleness_mushroom_moon"] = "moon_cap",
}

local levels = {
    { ["amount"] = 6, ["grow"] = "mushroom_4", ["idle"] = "mushroom_4_idle", ["hit"] = "hit_mushroom_4" }, 
    { ["amount"] = 4, ["grow"] = "mushroom_3", ["idle"] = "mushroom_3_idle", ["hit"] = "hit_mushroom_3" }, 
    { ["amount"] = 2, ["grow"] = "mushroom_2", ["idle"] = "mushroom_2_idle", ["hit"] = "hit_mushroom_2" },
    { ["amount"] = 1, ["grow"] = "mushroom_1", ["idle"] = "mushroom_1_idle", ["hit"] = "hit_mushroom_1" },
    { ["amount"] = 0, ["idle"] = "idle", ["hit"] = "hit_idle" },
}


local spore_to_cap = {
    ["spore_tall"] = "blue_cap",
    ["spore_medium"] = "red_cap",
    ["spore_small"] = "green_cap",
}
local FULLY_REPAIRED_WORKLEFT = 3

local function DoMushroomOverrideSymbol(inst, product)
    if symbol_config[inst["prefab"]] then
        inst["AnimState"]:OverrideSymbol("swap_mushroom", symbol_config[inst["prefab"]], "swap_mushroom")
    end
end
local function StartGrowing(inst)
    if inst["components"]["harvestable"] ~= nil then
        
        local max_produce = levels[1]["amount"]
        
        local productname = produce_config[inst["prefab"]] or "green_cap"
        local grow_time_percent = 1.0
        local grow_time = grow_time_percent * TUNING["MUSHROOMFARM_FULL_GROW_TIME"]
        DoMushroomOverrideSymbol(inst, productname)
        inst["components"]["harvestable"]:SetProduct(productname, max_produce)
        inst["components"]["harvestable"]:SetGrowTime(grow_time / max_produce)
        inst["components"]["harvestable"]:Grow()
        
    end
end

local function setlevel(inst, level, dotransition)
    if inst["anims"] == nil then
        inst["anims"] = {}
    end
    if inst["anims"]["idle"] == level["idle"] then
        dotransition = false
    end

    inst["anims"]["idle"] = level["idle"]
    inst["anims"]["hit"] = level["hit"]

    if inst["remainingharvests"] == 0 then
        inst["anims"]["idle"] = "expired"
        inst["components"]["trader"]:Enable()
        inst["components"]["harvestable"]:SetGrowTime(nil)
        inst["components"]["workable"]:SetWorkLeft(1)
    elseif inst["components"]["harvestable"]:CanBeHarvested() then
        inst["components"]["trader"]:Disable()
    else
        inst["components"]["trader"]:Enable()
        inst["components"]["harvestable"]:SetGrowTime(nil)
    end
    if dotransition then
        inst["AnimState"]:PlayAnimation(level["grow"])
        inst["AnimState"]:PushAnimation(inst["anims"]["idle"], false)
        inst["SoundEmitter"]:PlaySound(level ~= levels[1] and "dontstarve/common/together/mushroomfarm/grow" or "dontstarve/common/together/mushroomfarm/spore_grow")
    else
        inst["AnimState"]:PlayAnimation(inst["anims"]["idle"])
    end
end

local function updatelevel(inst, dotransition)
    for k, v in pairs(levels) do
        if inst["components"]["harvestable"]["produce"] >= v["amount"] then
            setlevel(inst, v, dotransition)
            break
        end
    end
end

local function onharvest(inst, picker)
    
    inst["remainingharvests"] = inst["remainingharvests"]
    updatelevel(inst)
    StartGrowing(inst)
end

local function ongrow(inst, produce)
    updatelevel(inst, true)
    
    if produce == levels[1]["amount"] then
        if math["random"]() <= TUNING["MUSHROOMFARM_SPAWN_SPORE_CHANCE"] then
            for k, v in pairs(spore_to_cap) do
                if v == inst["components"]["harvestable"]["product"] then
                    inst["components"]["lootdropper"]:SpawnLootPrefab(k)
                    break
                end
            end
        end
    end
end

local function onhammered(inst, worker)
    inst["components"]["lootdropper"]:DropLoot()
    local fx = SpawnPrefab("collapse_small")
    fx["Transform"]:SetPosition(inst["Transform"]:GetWorldPosition())
    fx:SetMaterial("wood")
    inst:Remove()
end

local function onhit(inst, worker)
    inst["AnimState"]:PlayAnimation(inst["anims"]["hit"])
    inst["AnimState"]:PushAnimation(inst["anims"]["idle"], false)
end

local function onbuilt(inst)
    inst["AnimState"]:PlayAnimation("place")
    inst["AnimState"]:PushAnimation("idle", false)
    inst["SoundEmitter"]:PlaySound("dontstarve/common/together/mushroomfarm/craft")
    StartGrowing(inst)
end

local function getstatus(inst)
    if inst["components"]["harvestable"] == nil then
        return nil
    end
    return inst["remainingharvests"] == 0 and "ROTTEN"
            or inst["components"]["harvestable"]["produce"] == levels[1]["amount"] and "STUFFED"
            or inst["components"]["harvestable"]["produce"] == levels[2]["amount"] and "LOTS"
            or inst["components"]["harvestable"]:CanBeHarvested() and "SOME"
            or "EMPTY"
end

local function lootsetfn(lootdropper)
    local inst = lootdropper["inst"]

    local loot = {}
    for i = 1, inst["components"]["harvestable"]["produce"] do
        table["insert"](loot, inst["components"]["harvestable"]["product"])
    end
    lootdropper:SetLoot(loot)
end


local function accepttest(inst, item, giver)
    HH_UTILS:HHSay(giver, "不允许交易")
    return false
end

local function onacceptitem(inst, giver, item)
    if inst["remainingharvests"] == 0 then
        inst["remainingharvests"] = MAX_PICK_NUM
        inst["components"]["workable"]:SetWorkLeft(FULLY_REPAIRED_WORKLEFT)
        updatelevel(inst)
    else
    end
end

local function onsave(inst, data)
    if inst["components"].harvestable ~= nil then
        data["growtime"] = inst["components"]["harvestable"]["growtime"]
        data["product"] = inst["components"]["harvestable"]["product"]
        data["maxproduce"] = inst["components"]["harvestable"]["maxproduce"]
        data["remainingharvests"] = inst["remainingharvests"]
    end
end

local function onload(inst, data)
    if data ~= nil then
        inst["components"]["harvestable"]["growtime"] = data["growtime"]
        inst["components"]["harvestable"]["product"] = data["product"]
        inst["components"]["harvestable"]["maxproduce"] = data["maxproduce"]
        inst["remainingharvests"] = data["remainingharvests"] or MAX_PICK_NUM
        if inst["components"]["harvestable"]["product"] ~= nil then
            DoMushroomOverrideSymbol(inst, inst["components"]["harvestable"]["product"])
        end
        updatelevel(inst)
    end
end

local function domagicgrowth(inst, doer)
    if inst["components"].harvestable:Grow() then
        inst["components"].harvestable:Disable()
        inst["components"]["trader"]:Disable()
        inst:DoTaskInTime(0.5, domagicgrowth)
    else
        inst["components"].harvestable:Enable()
    end
end

local function MakeMushRoom(name, product, symbol)

    local function mush_fn()
        local inst = CreateEntity()

        inst["entity"]:AddTransform()
        inst["entity"]:AddAnimState()
        inst["entity"]:AddSoundEmitter()
        inst["entity"]:AddMiniMapEntity()
        inst["entity"]:AddNetwork()

        inst:SetDeploySmartRadius(1) 
        MakeObstaclePhysics(inst, 0.5)
        inst["MiniMapEntity"]:SetIcon(name .. ".tex")

        inst["AnimState"]:SetBank("mushroom_farm")
        inst["AnimState"]:SetBuild(name)
        inst["AnimState"]:PlayAnimation("idle")

        inst:AddTag("structure")
        inst:AddTag("playerowned")
        inst:AddTag("mushroom_farm")

        inst:AddTag("trader")
        inst:AddTag("alltrader")

        MakeSnowCoveredPristine(inst)

        inst["entity"]:SetPristine()

        if not TheWorld["ismastersim"] then
            return inst
        end
        
        inst:AddComponent("harvestable")
        inst["components"]["harvestable"]:SetOnGrowFn(ongrow)
        inst["components"]["harvestable"]:SetOnHarvestFn(onharvest)
        inst["components"]["harvestable"]:SetDoMagicGrowthFn(domagicgrowth)
        local oldHarvest = inst["components"]["harvestable"]["Harvest"]
        inst["components"]["harvestable"]["Harvest"] = function(self, player, ...)
            if player and self["produce"] == 1 then
                HH_UTILS:HHSay(player, "第一阶段不允许采摘")
                return true
            end
            return oldHarvest(self, player, ...)
        end
        

        inst:AddComponent("trader")
        inst["components"]["trader"]:SetAbleToAcceptTest(accepttest)
        inst["components"]["trader"]["onaccept"] = onacceptitem
        inst["components"]["trader"]["acceptnontradable"] = true

        inst:AddComponent("inspectable")
        inst["components"]["inspectable"]["getstatus"] = getstatus

        inst:AddComponent("lootdropper")
        inst["components"]["lootdropper"]:SetLootSetupFn(lootsetfn)

        inst:AddComponent("workable")
        inst["components"]["workable"]:SetWorkAction(ACTIONS["HAMMER"])
        inst["components"]["workable"]:SetWorkLeft(FULLY_REPAIRED_WORKLEFT)
        inst["components"]["workable"]:SetOnFinishCallback(onhammered)
        inst["components"]["workable"]:SetOnWorkCallback(onhit)
        MakeSnowCovered(inst)
        inst:ListenForEvent("onbuilt", onbuilt)
        
        inst["remainingharvests"] = MAX_PICK_NUM
        inst["OnSave"] = onsave
        inst["OnLoad"] = onload
        updatelevel(inst)

        
        inst:DoTaskInTime(1, function(mushroom)
            if HH_UTILS:HasComponents(mushroom, "harvestable")
                    and mushroom["components"]["harvestable"]["produce"] == 0
            then
                StartGrowing(mushroom)
            end

        end)
        return inst
    end
    return Prefab(name, mush_fn, assets, prefabs)
end
return
MakeMushRoom("gentleness_mushroom_red"),
MakeMushRoom("gentleness_mushroom_blue"),
MakeMushRoom("gentleness_mushroom_green"),
MakeMushRoom("gentleness_mushroom_moon"),
MakePlacer("gentleness_mushroom_red_placer", "mushroom_farm", "gentleness_mushroom_red", "idle"),
MakePlacer("gentleness_mushroom_blue_placer", "mushroom_farm", "gentleness_mushroom_blue", "idle"),
MakePlacer("gentleness_mushroom_green_placer", "mushroom_farm", "gentleness_mushroom_green", "idle"),
MakePlacer("gentleness_mushroom_moon_placer", "mushroom_farm", "gentleness_mushroom_moon", "idle")
