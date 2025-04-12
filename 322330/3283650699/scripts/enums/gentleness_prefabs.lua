----
---文件处理时间:2024-07-01 23:48:41
---
local HH_UTILS = require("utils/gentleness_utils")
local SKIN_CONFIG = require("enums/gentleness_skin")
local pick_black_list = {
    ["flower"] = true,
    ["mandrake_planted"] = true,
    ["medal_wormwood_flower"] = true,
    ["gentleness_flower"] = true,
}
local base_time = 480 * 3
local com_assets = {
    Asset("ANIM", "anim/gentleness_items.zip"),
}
local box_assets = { Asset("ANIM", "anim/gentleness_box_build.zip"), Asset("ANIM", "anim/gentleness_items.zip"), }
local com_item_xml = "images/gentleness_image/gentleness_items.xml"
local extra_xml = "images/gentleness_image/gentleness_items_extra.xml"
local back_ui_list = {
    ["gentleness_back"] = true,
    ["gentleness_back_skin"] = true,
    ["gentleness_back_pink"] = true,
}

local function updateBackUi(inst, name)
    local ui_name = name
    if inst and inst["g_net_ui"] then
        local net_ui_name = inst["g_net_ui"]:value()
        if back_ui_list[net_ui_name] then
            ui_name = net_ui_name
        end
    end
    inst["replica"]["container"]:WidgetSetup(ui_name)
end

--gentleness_cat_box
local cat_ui_list = {
    ["gentleness_cat_box"] = true,
    ["gentleness_cat_box_skin_black"] = true,
    ["gentleness_cat_box_skin_white"] = true,
}
local function updateCatBoxUi(inst, name)
    local ui_name = name
    if inst and inst["g_net_ui"] then
        local net_ui_name = inst["g_net_ui"]:value()
        if cat_ui_list[net_ui_name] then
            ui_name = net_ui_name
        end
    end
    inst["replica"]["container"]:WidgetSetup(ui_name)
end
local chest_skin_ui_list = {
    ["gentleness_chest_cw"] = true,
    ["gentleness_chest_cw_skin_1"] = true,
    ["gentleness_chest_cw_skin_2"] = true,
    ["gentleness_chest_ice"] = true,
    ["gentleness_chest_ice_skin_1"] = true,
    ["gentleness_chest_ice_skin_2"] = true,
    ["gentleness_chest_fire"] = true,
    ["gentleness_chest_fire_skin_1"] = true,
    ["gentleness_chest_fire_skin_2"] = true,
    ["gentleness_chest_money"] = true,
    ["gentleness_chest_money_skin_1"] = true,
    ["gentleness_chest_money_skin_2"] = true,
}
local function updateChestBoxSkinUi(inst, name)
    local ui_name = name
    if inst and inst["g_net_ui"] then
        local net_ui_name = inst["g_net_ui"]:value()
        if chest_skin_ui_list[net_ui_name] then
            ui_name = net_ui_name
        end
    end
    inst["replica"]["container"]:WidgetSetup(ui_name)
end
local function book_client(inst)
    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    inst:AddTag("CLASSIFIED")
end
local function launchItem(item, angle)
    if not item["Physics"] then
        return
    end
    local speed = math["random"]() * 4 + 2
    angle = (angle + math["random"]() * 60 - 30) * DEGREES
    item["Physics"]:SetVel(speed * math["cos"](angle), math["random"]() * 2 + 8, speed * math["sin"](angle))
end
local function GetItemSkinName(inst)
    local base = inst["prefab"]
    if HH_UTILS:IsHHType(inst["g_item_skin"], "string") then
        base = inst["g_item_skin"]
    end
    return tostring(base)
end

local function GetSkinConfig(prefab_id, skin_id)
    if not HH_UTILS:IsHHType(SKIN_CONFIG[prefab_id], "table") then
        return {}
    end
    for i, v in ipairs(SKIN_CONFIG[prefab_id]) do
        if HH_UTILS:IsHHType(v, "table") and v["skin_id"] == skin_id and HH_UTILS:IsHHType(skin_id, "string") then
            return v
        end
    end
    return {}
end
local function handleTimeCom(inst, com_name, time_name)
    if inst["components"][com_name] ~= nil and inst["components"][com_name]:TimerExists(time_name) then
        inst["components"][com_name]:StopTimer(time_name)
        inst:PushEvent("timerdone", { name = time_name })
    end
end

local function spawnMagicFx(inst, player)
    if not inst or not inst["Transform"]
            or not player or not player["Transform"]
    then
        return
    end
    local prefab_id = inst["prefab"]
    local x, y, z = player["Transform"]:GetWorldPosition()
    local fx = SpawnPrefab("gentleness_magic_fx")
    if fx and fx["Transform"] then
        fx["Transform"]:SetPosition(x, y, z)
        fx["AnimState"]:OverrideSymbol("gentleness_bird", "gentleness_magic_fx", prefab_id)
    end
end

local function tryGrowth(inst, player)
    if not inst or inst:IsInLimbo() then
        return
    end
    if HH_UTILS:HasComponents(inst, "pickable") then
        if inst:HasTag("sunflower") and TUNING["SUNFLOWER_REGROW_TIME"] then
            inst["time"] = GetTime() - TUNING["SUNFLOWER_REGROW_TIME"]
        end
        if inst["components"]["pickable"]:CanBePicked() and inst["components"]["pickable"]["caninteractwith"] then
            return
        end
        local hh_nomagic = nil
        if inst["components"]["pickable"]["nomagic"] then
            inst["components"]["pickable"]["nomagic"] = nil
            hh_nomagic = true
        end
        inst["components"]["pickable"]:FinishGrowing()
        inst["components"]["pickable"]["nomagic"] = hh_nomagic
    end
    if inst["components"]["crop"] ~= nil then
        inst["components"]["crop"]:DoGrow(TUNING["TOTAL_DAY_TIME"] * 6, true)
    end
    handleTimeCom(inst, "timer", "grow")
    handleTimeCom(inst, "timer", "growth")
    handleTimeCom(inst, "worldsettingstimer", "grow")
    handleTimeCom(inst, "worldsettingstimer", "growth")
    if HH_UTILS:HasComponents(inst, "crop_legion") and inst["components"]["crop_legion"]["DoGrow"] then
        inst["components"]["crop_legion"]:DoGrow(TUNING["TOTAL_DAY_TIME"] * 6, true)
    end
    if player then
        if inst["components"]["perennialcrop"] ~= nil and inst["components"]["perennialcrop"]["DoMagicGrowth"] then
            --inst["components"]["perennialcrop"]:DoGrowth()
            inst["components"]["perennialcrop"]:DoMagicGrowth(player, TUNING["TOTAL_DAY_TIME"] * 3)
        end
        if inst["components"]["perennialcrop2"] ~= nil and inst["components"]["perennialcrop2"]["DoMagicGrowth"] then
            --inst["components"]["perennialcrop2"]:DoGrowth()
            inst["components"]["perennialcrop2"]:DoMagicGrowth(player, TUNING["TOTAL_DAY_TIME"] * 3)
        end
    end
    if HH_UTILS:HasComponents(inst, "growable")
            and (inst:HasTag("tree")
            or inst:HasTag("peachtree")
            or inst:HasTag("plant")
            or inst:HasTag("winter_tree")
            or inst:HasTag("boulder")
            or inst["components"]["growable"]["magicgrowable"]) then
        local stage = inst["components"]["growable"]["stage"]
        local maxstage = #inst["components"]["growable"]["stages"]
        if inst:HasTag("evergreens") then
            maxstage = maxstage - 1
        end
        if inst:HasTag("siving_derivant") then
            inst["components"]["growable"]:DoGrowth()
            inst["components"]["growable"]:DoMagicGrowth()
            inst["components"]["growable"]:DoMagicGrowth()
            inst["components"]["growable"]:DoMagicGrowth()
        else
            if stage == maxstage then
                inst["components"]["growable"]:Pause()
            elseif stage == maxstage - 1 then
                inst["components"]["growable"]:DoGrowth()
                inst["components"]["growable"]:Pause()
            else
                inst["components"]["growable"]:DoGrowth()
            end
        end
    end
    if inst["components"]["harvestable"] ~= nil and inst:HasTag("mushroom_farm") then
        if inst["components"]["harvestable"]["task"] then
            inst["components"]["harvestable"]:Grow()
            inst["components"]["harvestable"]:Grow()
            inst["components"]["harvestable"]:Grow()
            inst["components"]["harvestable"]:Grow()
            inst["components"]["harvestable"]:Grow()
            inst["components"]["harvestable"]:Grow()
        end
    end
end
local function magic_plant(_inst, player)
    spawnMagicFx(_inst, player)
    local x, y, z = player["Transform"]:GetWorldPosition()
    local ents = TheSim:FindEntities(x, y, z, 60, nil, { "pickable", "stump", "withered", "INLIMBO" })
    if #ents > 0 then
        tryGrowth(table["remove"](ents, math["random"](#ents)), player)
        if #ents > 0 then
            local timevar = 1 - 1 / (#ents + 1)
            for i, v in ipairs(ents) do
                v:DoTaskInTime(timevar * math["random"]() / 3, function()
                    if v and player then
                        tryGrowth(v, player)
                    end
                end)
            end
        end
    end
    _inst:Remove()
end

local function magic_fertilizer(_inst, player)
    spawnMagicFx(_inst, player)
    local x, y, z = player["Transform"]:GetWorldPosition()
    local ents = TheSim:FindEntities(x, y, z, 30, nil, { "FX", "DECOR", "INLIMBO", "burnt" })
    for i, v in ipairs(ents) do
        if v["components"]["burnable"] ~= nil then
            if HH_UTILS:HasComponents(v, "witherable") then

                v["components"]["witherable"]:Protect(TUNING["FIRESUPPRESSOR_PROTECTION_TIME"])
            end
            if HH_UTILS:HasComponents(v, "burnable") then

                if v["components"]["burnable"]:IsBurning() then
                    v["components"]["burnable"]:Extinguish(true, TUNING["WATERINGCAN_EXTINGUISH_HEAT_PERCENT"])
                elseif v["components"]["burnable"]:IsSmoldering() then
                    v["components"]["burnable"]:Extinguish(true)
                end
            end
        end
    end
    for k1 = -28, 28, 4 do
        for k2 = -28, 28, 4 do
            local tile = TheWorld["Map"]:GetTileAtPoint(x + k1, 0, z + k2)
            if tile == GROUND["FARMING_SOIL"] then
                TheWorld["components"]["farming_manager"]:AddSoilMoistureAtPoint(x + k1, 0, z + k2, 100)
                local tile_x, tile_z = TheWorld["Map"]:GetTileCoordsAtPoint(x + k1, 0, z + k2)
                TheWorld["components"]["farming_manager"]:AddTileNutrients(tile_x, tile_z, 100, 100, 100)
            end
        end
    end
    _inst:Remove()
end

local function magic_rain(_inst, player)
    spawnMagicFx(_inst, player)
    if TheWorld["state"]["precipitation"] ~= "none" then
        TheWorld:PushEvent("ms_forceprecipitation", false)
    else
        TheWorld:PushEvent("ms_forceprecipitation", true)
    end
    local x, y, z = player["Transform"]:GetWorldPosition()
    local size = TILE_SCALE
    for i = x - size, x + size do
        for j = z - size, z + size do
            if TheWorld["Map"]:GetTileAtPoint(i, 0, j) == WORLD_TILES["FARMING_SOIL"] then
                TheWorld["components"]["farming_manager"]:AddSoilMoistureAtPoint(i, y, j, 100)
            end
        end
    end
    _inst:Remove()
end

local function magic_bird(_inst, player)
    spawnMagicFx(_inst, player)
    local birdspawner = TheWorld["components"]["birdspawner"]
    if birdspawner == nil then
        _inst:Remove()
        return
    end
    local pt = player:GetPosition()
    local ents = TheSim:FindEntities(pt["x"], pt["y"], pt["z"], 20, { "magicalbird" })

    if #ents > 30 then
        _inst:Remove()
        return
    end
    local num = math["random"](20, 30)
    local success = false
    local delay = 0
    for k = 1, num do
        local pos = birdspawner:GetSpawnPoint(pt)
        if pos ~= nil then
            local bird = birdspawner:SpawnBird(pos, true)
            if bird ~= nil then
                bird:AddTag("magicalbird")
                bird["sg"]:GoToState("delay_glide", delay)
                delay = delay + 0.034 + 0.033 * math["random"]()
            end
        end
    end
    _inst:Remove()
end

local function magic_sleep(_inst, player)
    spawnMagicFx(_inst, player)
    local x, y, z = player["Transform"]:GetWorldPosition()
    local range = 30
    local SLEEPTARGET_PVP_ONEOF_TAGS = { "sleeper", "player" }
    local SLEEPTARGET_NOPVP_MUST_TAGS = { "sleeper" }
    local SLEEPTARGET_CANT_TAGS = { "playerghost", "FX", "DECOR", "INLIMBO" }
    local ents = TheNet:GetPVPEnabled() and
            TheSim:FindEntities(x, y, z, range, nil, SLEEPTARGET_CANT_TAGS, SLEEPTARGET_PVP_ONEOF_TAGS) or
            TheSim:FindEntities(x, y, z, range, SLEEPTARGET_NOPVP_MUST_TAGS, SLEEPTARGET_CANT_TAGS)
    if #ents == 0 then
        _inst:Remove()
        return
    end
    for i, v in ipairs(ents) do
        if v ~= player and
                not (v["components"]["freezable"] ~= nil and v["components"]["freezable"]:IsFrozen()) and
                not (v["components"]["pinnable"] ~= nil and v["components"]["pinnable"]:IsStuck()) and
                not (v["components"]["fossilizable"] ~= nil and v["components"]["fossilizable"]:IsFossilized()) then
            local ismount, mount
            if v["components"]["rider"] ~= nil then
                ismount = v["components"]["rider"]:IsRiding()
                mount = v["components"]["rider"]:GetMount()
            end
            if mount ~= nil then
                mount:PushEvent("ridersleep", { ["sleepiness"] = 10, ["sleeptime"] = 20 })
            end
            if v["components"]["sleeper"] ~= nil then
                v["components"]["sleeper"]:AddSleepiness(10, 20)
            elseif v["components"]["grogginess"] ~= nil then
                v["components"]["grogginess"]:AddGrogginess(10, 20)
            else
                v:PushEvent("knockedout")
            end
            local fx = SpawnPrefab(ismount and "fx_book_sleep_mount" or "fx_book_sleep")
            fx["Transform"]:SetPosition(v["Transform"]:GetWorldPosition())
            fx["Transform"]:SetRotation(v["Transform"]:GetRotation())
        end
    end
    _inst:Remove()
end

local function magic_black_moon(_inst, player)
    spawnMagicFx(_inst, player)
    if TheWorld:HasTag("cave") then
        HH_UTILS:HHSay(player, "洞穴中无法将当晚变成月黑之夜")
        _inst:Remove()
        return
    elseif TheWorld["state"]["moonphase"] == "new" then
        HH_UTILS:HHSay(player, "当前世界状态已经是月黑")
        _inst:Remove()
        return
    end
    TheWorld:PushEvent("ms_setclocksegs", { ["day"] = 0, ["dusk"] = 0, ["night"] = 16 })
    TheWorld:PushEvent("ms_setmoonphase", { ["moonphase"] = "new", ["iswaxing"] = true })
    _inst:Remove()
end

local function magic_fish(_inst, player)
    spawnMagicFx(_inst, player)
    if not HH_UTILS:HasComponents(TheWorld, "schoolspawner") then
        HH_UTILS:HHSay(player, "当前世界无法生成鱼群")
        _inst:Remove()
        return
    end
    local schoolspawner = TheWorld["components"]["schoolspawner"]

    local FISH_SPAWN_OFFSET = 10
    local x, y, z = player["Transform"]:GetWorldPosition()
    local delta_theta = PI2 / 18
    local failed_spawn = 0

    for i = 1, 3 do
        local theta = math["random"]() * 2 * PI
        local failed_attempts = 0
        local max_failed_attempts = 36

        while failed_attempts < max_failed_attempts do
            local spawn_offset = Vector3(math["random"](1, 3), 0, math["random"](1, 3))
            local spawn_point = Vector3(x + math["cos"](theta) * FISH_SPAWN_OFFSET, 0, z + math["sin"](theta) * FISH_SPAWN_OFFSET)
            local num_fish_spawned = schoolspawner:SpawnSchool(spawn_point, nil, spawn_offset)

            if num_fish_spawned == nil or num_fish_spawned == 0 then
                theta = theta + delta_theta
                failed_attempts = failed_attempts + 1
                if failed_attempts >= max_failed_attempts then
                    failed_spawn = failed_spawn + 1
                end
            else

                local random_index = math["random"]()
                if random_index < 0.1 then
                    local spawn_random = math.random(1, 2)
                    local spawn_monster
                    if spawn_random < 2 then
                        spawn_monster = SpawnPrefab("shark")
                    else
                        spawn_monster = SpawnPrefab("gnarwail")
                    end
                    if spawn_monster then
                        spawn_monster["Transform"]:SetPosition(spawn_point["x"], spawn_point["y"], spawn_point["z"])

                        if HH_UTILS:HasComponents(spawn_monster, "combat") and player then
                            spawn_monster["components"]["combat"]:SetTarget(player)
                        end
                    end
                end

                break
            end
        end
    end
    _inst:Remove()
end

local function magic_lighting(_inst, player)
    spawnMagicFx(_inst, player)
    local pt = player:GetPosition()
    local num_lightnings = 16
    player:StartThread(function()
        for k = 0, num_lightnings do
            local rad = math["random"](8, 15)
            local angle = k * 4 * PI / num_lightnings
            local pos = pt + Vector3(rad * math["cos"](angle), 0, rad * math["sin"](angle))
            TheWorld:PushEvent("ms_sendlightningstrike", pos)
            Sleep(0.3 + math["random"]() * 0.2)
        end
    end)
    _inst:Remove()
end

local function replaceFoodClientFolder(inst, name)
    inst["AnimState"]:SetBank("gentleness_items")
    inst["AnimState"]:SetBuild("gentleness_items")
    inst["AnimState"]:PlayAnimation("idle")
    inst["AnimState"]:OverrideSymbol("base_folder", "gentleness_items", name)
    inst:AddTag("gentleness_food")
    inst:AddTag("g_special_food")

    MakeInventoryPhysics(inst)
    MakeInventoryFloatable(inst, "med", 0.3, 0.8)
end

local function replaceBoxClientFolder(inst, name)
    inst["AnimState"]:SetBank("gentleness_items")
    inst["AnimState"]:SetBuild("gentleness_items")
    inst["AnimState"]:PlayAnimation("idle")
    inst["AnimState"]:OverrideSymbol("base_folder", "gentleness_items", name)
    inst:AddTag("gentleness_box")
    MakeInventoryPhysics(inst)
    MakeInventoryFloatable(inst, "med", 0.3, 0.8)
end

local function replaceItemFolder(inst, name)
    inst["AnimState"]:SetBank("gentleness_items")
    inst["AnimState"]:SetBuild("gentleness_items")
    inst["AnimState"]:PlayAnimation("idle")
    inst["AnimState"]:OverrideSymbol("base_folder", "gentleness_items", name)
    inst:AddTag(name)
    MakeInventoryPhysics(inst)
    MakeInventoryFloatable(inst, "med", 0.3, 0.8)
end

local function tool_use_fn(_inst)
    if not _inst["tool_index"] or _inst["tool_index"] >= 3 then
        _inst["tool_index"] = 1
    else
        _inst["tool_index"] = _inst["tool_index"] + 1
    end
    if _inst["UpdateTool"] then
        _inst:UpdateTool()
    end
end
local function update_tool_fn(_inst)
    local prefab_id = _inst["prefab"]
    local name_str = STRINGS["NAMES"][string["upper"](tostring(prefab_id))] or "未定义"
    if HH_UTILS:HasComponents(_inst, "tool") then
        _inst:RemoveComponent("tool")
    end
    if HH_UTILS:HasComponents(_inst, "spellcaster") then
        _inst:RemoveComponent("spellcaster")
    end
    if _inst["tool_index"] == 1 then
        _inst:AddComponent("tool")
        _inst["components"]["tool"]:SetAction(ACTIONS["MINE"], 12)
        _inst["components"]["tool"]:SetAction(ACTIONS["CHOP"], 10)
        _inst["components"]["tool"]:SetAction(ACTIONS["HAMMER"], 1)
        _inst["components"]["tool"]:SetAction(ACTIONS["DIG"], 10)
        _inst["components"]["tool"]:SetAction(ACTIONS["NET"], 1)
        _inst["components"]["tool"]:EnableToughWork(true)--稿力提升
        name_str = name_str .. "\n当前:多用工具"
    elseif _inst["tool_index"] == 2 then
        _inst:AddTag("quickcast")
        name_str = name_str .. "\n当前:耕地模式"
        _inst:AddComponent("spellcaster")
        _inst["components"]["spellcaster"]:SetSpellFn(function(hh_inst, target, pos, caster)
            if not caster or not caster["Transform"] then
                return
            end
            local x, y, z = caster.Transform:GetWorldPosition()
            if pos then
                x, y, z = pos:Get()
            end

            for k1 = -10, 10, 4 do
                for k2 = -10, 10, 4 do
                    local tile = TheWorld["Map"]:GetTileAtPoint(x + k1, 0, z + k2)
                    if tile == GROUND["FARMING_SOIL"] then
                        local x1, y1, z1 = TheWorld["Map"]:GetTileCenterPoint(x + k1, y, z + k2)
                        local spacing = 1.3
                        local farm_plant_pos = {}

                        local ents = TheWorld["Map"]:GetEntitiesOnTileAtPoint(x1, 0, z1)
                        for _, ent in ipairs(ents) do
                            if ent:HasTag("soil") then
                                ent:PushEvent("collapsesoil")
                            end
                        end

                        for i = 0, 2 do
                            for j = 0, 2 do
                                local nx = x1 + spacing * i - spacing
                                local nz = z1 + spacing * j - spacing
                                if TheWorld["Map"]:IsDeployPointClear(Vector3(nx, 0, nz), nil, GetFarmTillSpacing(), nil, nil, nil,
                                        { "NOBLOCK", "player", "FX", "INLIMBO", "DECOR", "WALKABLEPLATFORM", "soil", "medal_farm_plow" }) then
                                    SpawnPrefab("farm_soil")["Transform"]:SetPosition(nx, 0, nz)
                                end
                            end
                        end
                    end
                end
            end
        end)
        _inst["components"]["spellcaster"]["canuseonpoint"] = true
        _inst["components"]["spellcaster"]["canuseonpoint_water"] = true
        _inst["components"]["spellcaster"]["quickcast"] = true
    elseif _inst["tool_index"] == 3 then
        _inst:AddTag("quickcast")
        name_str = name_str .. "\n当前:灭火/采集"
        _inst:AddComponent("spellcaster")
        _inst["components"]["spellcaster"]:SetSpellFn(function(hh_inst, target, pos, caster)

            if not caster or not caster["Transform"] or not HH_UTILS:HasComponents(caster, "inventory") then
                return
            end
            local x, y, z = caster["Transform"]:GetWorldPosition()
            if pos then
                x, y, z = pos:Get()
            end
            local fire_ents = TheSim:FindEntities(x, y, z, 10, nil, { "FX", "DECOR", "INLIMBO", "burnt" })
            local pick_ents = TheSim:FindEntities(x, y, z, 10, nil, { "INLIMBO", "NOCLICK", "catchable", "fire", "notdevourable" },
                    { "_inventoryitem", "pickable", "harvestable", "readyforharvest", "donecooking", "dried", "takeshelfitem", "stump" })
            if fire_ents and #fire_ents > 0 then
                for i, v in ipairs(fire_ents) do
                    if HH_UTILS:HasComponents(v, "burnable") then

                        if v["components"]["burnable"]:IsBurning() then
                            v["components"]["burnable"]:Extinguish(true, TUNING["WATERINGCAN_EXTINGUISH_HEAT_PERCENT"])
                        elseif v["components"]["burnable"]:IsSmoldering() then
                            v["components"]["burnable"]:Extinguish(true)
                        end
                    end
                end
            end
            if pick_ents and #pick_ents > 0 then
                for i, v in ipairs(pick_ents) do
                    local item_prefab = v["prefab"]
                    if HH_UTILS:HasComponents(v, "pickable") and v:HasTag("pickable") then
                        if not pick_black_list[item_prefab] then
                            v["components"]["pickable"]:Pick(caster)
                        end
                    end
                end
            end
            local all_items = TheSim:FindEntities(x, y, z, 10, { "_inventoryitem" }, { "locomotor", "INLIMBO", "_health", "_combat", "NOCLICK" })
            if all_items and #all_items > 0 then
                for i, v in ipairs(all_items) do
                    if HH_UTILS:HasComponents(v, "inventoryitem") and v["components"]["inventoryitem"]:GetGrandOwner() == nil
                            and not HH_UTILS:HasComponents(v, "health")
                            and not HH_UTILS:HasComponents(v, "combat")
                            and HH_UTILS:HasComponents(caster, "inventory")
                            and HH_UTILS:NotIsDead(caster)
                            and v["GetPosition"]
                            and not v:HasTag("locomotor")
                            and not v:IsInLimbo()
                    then
                        local inst_pos = v:GetPosition()
                        caster["components"]["inventory"]:GiveItem(v, nil, inst_pos)
                    end
                end
            end
        end)
        _inst["components"]["spellcaster"]["canuseonpoint"] = true
        _inst["components"]["spellcaster"]["canuseonpoint_water"] = true
        _inst["components"]["spellcaster"]["quickcast"] = true
    end
    if HH_UTILS:HasComponents(_inst, "named") then
        _inst["components"]["named"]:SetName(name_str)
        if HH_UTILS:HasComponents(_inst, "inventoryitem")
                and _inst["components"]["inventoryitem"]["owner"]
        then
            local player = _inst["components"]["inventoryitem"]["owner"]
            HH_UTILS:HHSay(player, name_str)
        end
    end
end
local function save_tool(_inst, save_data)
    if save_data then
        save_data["tool_index"] = _inst["tool_index"]
    end
end
local function load_tool(_inst, save_data)
    if save_data then
        _inst["tool_index"] = save_data["tool_index"] or 1
        if _inst["UpdateTool"] then
            _inst:UpdateTool()
        end
    end
end

local function onDeploySeed(inst, pt, deployer)
    local tree = SpawnPrefab("gentleness_jasmine")
    if tree ~= nil then
        tree["Transform"]:SetPosition(pt:Get())
        inst["components"]["stackable"]:Get():Remove()
        if deployer ~= nil and deployer["SoundEmitter"] ~= nil then
            deployer["SoundEmitter"]:PlaySound("dontstarve/common/plant")
        end
    end
end

local function onDeployPlant(inst, pt, deployer)
    local tree = SpawnPrefab("gentleness_jasmine")
    if tree ~= nil then
        tree["Transform"]:SetPosition(pt:Get())
        inst["components"]["stackable"]:Get():Remove()

        if tree["components"]["pickable"] ~= nil then
            tree["components"]["pickable"]:OnTransplant()
        end
        if deployer ~= nil and deployer["SoundEmitter"] ~= nil then
            deployer["SoundEmitter"]:PlaySound("dontstarve/common/plant")
        end
    end
end

local function client_jasmine_seed(inst, name)
    inst["entity"]:AddSoundEmitter()
    inst["AnimState"]:SetBank("gentleness_items")
    inst["AnimState"]:SetBuild("gentleness_items")
    inst["AnimState"]:PlayAnimation("idle")
    inst["AnimState"]:OverrideSymbol("base_folder", "gentleness_items", name)
    inst["Transform"]:SetScale(0.5, 0.5, 0.5)
    MakeInventoryPhysics(inst)
    MakeInventoryFloatable(inst, "med", 0.3, 0.8)
end
local function client_jasmine_plant(inst, name)
    inst["entity"]:AddSoundEmitter()
    inst["AnimState"]:SetBank("gentleness_items")
    inst["AnimState"]:SetBuild("gentleness_items")
    inst["AnimState"]:PlayAnimation("idle")
    inst["AnimState"]:OverrideSymbol("base_folder", "gentleness_items", name)
    inst["Transform"]:SetScale(0.5, 0.5, 0.5)
    MakeInventoryPhysics(inst)
    MakeInventoryFloatable(inst, "med", 0.3, 0.8)
end

local function addInvCom(inst, name, image_xml)
    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst["components"]["inventoryitem"]["imagename"] = name
    inst["components"]["inventoryitem"]["atlasname"] = image_xml or com_item_xml
end

local function addDepCom(inst, dep_fn)
    inst:AddComponent("deployable")
    inst["components"]["deployable"]["ondeploy"] = dep_fn or onDeployPlant
    inst["components"]["deployable"]:SetDeployMode(DEPLOYMODE["PLANT"])
end

local function addStackCom(inst, stack_num)
    inst:AddComponent("stackable")
    inst["components"]["stackable"]["maxsize"] = stack_num or TUNING["STACK_SIZE_SMALLITEM"]
end

local function addFuelCom(inst, fuel_num)
    inst:AddComponent("fuel")
    inst["components"]["fuel"]["fuelvalue"] = fuel_num or TUNING["LARGE_FUEL"]
    MakeMediumBurnable(inst, TUNING["LARGE_BURNTIME"])
end

local function addPerishCom(inst, perish_time, spoil_item)
    local hh_time = perish_time or TUNING["PERISH_SUPERFAST"]
    local hh_item_id = spoil_item or "spoiled_food"
    inst:AddComponent("perishable")
    inst["components"]["perishable"]:SetPerishTime(hh_time)
    inst["components"]["perishable"]:StartPerishing()
    inst["components"]["perishable"]["onperishreplacement"] = hh_item_id
end

local base_hat_armor = 0.6
local function updateHatArmor(inst, player, items)
    local current_level = inst["g_level"]
    local armor_com = inst["components"]["armor"]
    local absorb_percent = armor_com:GetAbsorption() or 0
    if not HH_UTILS:IsHHType(absorb_percent, "number") then
        HH_UTILS:HHSay(player, "升级护甲值失败，护甲属性被篡改")
        return
    end

    if player then
        inst["g_level"] = current_level + 1
    end
    local new_level = inst["g_level"]
    local add_armor = 0
    if new_level <= 5 then
        add_armor = new_level * 3
    else
        add_armor = 15 + (new_level - 5)
    end
    local new_absorb = math["min"](base_hat_armor + add_armor / 100, TUNING["GENTLENESS_HAT_ARMOR"] / 100)
    inst["components"]["armor"]:InitIndestructible(new_absorb)
    if items and items["prefab"] == "alterguardianhat" then
        inst["g_moon"] = true
    end
    if inst["g_moon"] then
        inst:AddTag("gestaltprotection")
    else
        inst:RemoveTag("gestaltprotection")
    end
    if HH_UTILS:HasComponents(inst, "named") then
        local name_str = STRINGS["NAMES"][string["upper"]("gentleness_hat")] or "未定义"
        name_str = string["format"]("%s\n等级:%s(猪皮头/沙币)", name_str, tostring(inst["g_level"]))
        name_str = string["format"]("%s\n免疫月灵(%s)", name_str, inst["g_moon"] and "已解锁" or "启迪之冠解锁")
        inst["components"]["named"]:SetName(name_str)
    end
end
local function checkHatLevel(inst, items, player)
    if not items or not items["prefab"] or not HH_UTILS:IsHHType(inst["g_level"], "number") then
        return false, "装备参数错误"
    end
    if items["prefab"] == "alterguardianhat" then
        if inst["g_moon"] then
            return false, "启迪之冠能力已解锁"
        else
            return true, "正确"
        end
    end
    local armor_com = inst["components"]["armor"]
    local absorb_percent = armor_com:GetAbsorption() or 0
    if not HH_UTILS:IsHHType(absorb_percent, "number") then
        return false, "护甲属性被篡改"
    end
    if absorb_percent >= TUNING["GENTLENESS_HAT_ARMOR"] / 100 then
        return false, "护甲已到达上限"
    end
    local item_id = items["prefab"]
    local current_level = inst["g_level"]
    local leve_bool = current_level >= 5
    if leve_bool then
        if item_id == "gentleness_coin" then
            return true, "正确"
        end
        return false, "当前升级道具:沙币"
    else
        if item_id == "footballhat" then
            return true, "正确"
        end
        return false, "当前升级道具:猪皮头盔"
    end
    return false, "不允许交易"
end
local function save_hat(_inst, save_data)
    if save_data then
        save_data["g_level"] = _inst["g_level"]
        save_data["g_moon"] = _inst["g_moon"] or false
    end
end
local function load_hat(_inst, save_data)
    if save_data then
        _inst["g_level"] = save_data["g_level"] or 0
        _inst["g_moon"] = save_data["g_moon"] or false
        updateHatArmor(_inst)
    end
end
local function addHatFn(inst, name)
    inst:AddComponent("named")
    inst:AddComponent("equippable")
    inst["components"]["equippable"]["equipslot"] = EQUIPSLOTS["HEAD"]
    inst["components"]["equippable"]["restrictedtag"] = "gentleness"
    inst["components"]["equippable"]:SetOnEquip(function(weapon_inst, owner)
        if not HH_UTILS:HasComponents(owner, "gentleness_player") then
            return
        end
        local skin_build = GetItemSkinName(weapon_inst)
        local skin_config = GetSkinConfig(weapon_inst["prefab"], skin_build)
        if HH_UTILS:IsHHType(skin_config, "table") then
            if HH_UTILS:IsHHType(skin_config["equip_fn"], "function") then
                skin_config["equip_fn"](weapon_inst, owner, skin_build)
            end
        end
        owner["AnimState"]:OverrideSymbol("hair", skin_build, "hair")
        owner["AnimState"]:OverrideSymbol("hair_hat", skin_build, "hair_hat")
        owner["AnimState"]:OverrideSymbol("headbase", skin_build, "headbase")
        owner["AnimState"]:OverrideSymbol("headbase_hat", skin_build, "headbase_hat")
    end)
    inst["components"]["equippable"]:SetOnUnequip(function(weapon_inst, owner)
        if not HH_UTILS:HasComponents(owner, "gentleness_player") then
            return
        end
        local skin_build = GetItemSkinName(weapon_inst)
        owner["AnimState"]:OverrideSymbol("hair", "gentleness", "hair")
        owner["AnimState"]:OverrideSymbol("hair_hat", "gentleness", "hair_hat")
        owner["AnimState"]:OverrideSymbol("headbase", "gentleness", "headbase")
        owner["AnimState"]:OverrideSymbol("headbase_hat", "gentleness", "headbase_hat")
        local skin_config = GetSkinConfig(weapon_inst["prefab"], skin_build)
        if HH_UTILS:IsHHType(skin_config, "table") then
            if HH_UTILS:IsHHType(skin_config["un_equip_fn"], "function") then
                skin_config["un_equip_fn"](weapon_inst, owner, skin_build)
            end
        end
    end)
    inst["components"]["equippable"]["walkspeedmult"] = 1.1
    inst["components"]["equippable"]["dapperness"] = TUNING["DAPPERNESS_SMALL"] * 2
    inst["components"]["equippable"]["insulated"] = true
    inst:AddComponent("armor")
    inst["components"]["armor"]:InitIndestructible(base_hat_armor)
    inst:AddComponent("waterproofer")
    inst["components"]["waterproofer"]:SetEffectiveness(1)

    inst["g_level"] = 0

    inst:AddComponent("trader")
    inst["components"]["trader"]["acceptnontradable"] = true

    inst["components"]["trader"]:SetAcceptTest(function(_inst, items, player)
        local check_item = checkHatLevel(_inst, items, player)
        return check_item
    end)
    inst["components"]["trader"]["onaccept"] = function(_inst, player, items)
        updateHatArmor(_inst, player, items)
    end
    inst["components"]["trader"]["onrefuse"] = function(_inst, giver, item)
        local is_success, message = checkHatLevel(_inst, item, giver)
        if not is_success then
            HH_UTILS:HHSay(giver, tostring(message))
        end
    end
    inst["g_moon"] = false
    updateHatArmor(inst)
    inst["OnSave"] = save_hat
    inst["OnLoad"] = load_hat
end

local level_back_list = {
    ["honeycomb"] = 5,
    ["feather_canary"] = 10,
    ["feather_crow"] = 10,
    ["feather_robin"] = 10,
}

local function checkBackTar(inst, item, player)
    if not inst or not item or not level_back_list[item["prefab"]] then
        return false, "错误的材料"
    end
    local item_id = item["prefab"]
    local has_data = inst["g_save"] or {}
    local has_item_num = has_data[item_id] or 0
    if has_item_num >= level_back_list[item_id] then
        return false, "当前材料已经到达上限"
    end
    return true, "校验成功"
end
local function checkXk(inst)
    local save_list = inst["g_save"] or {}
    local num_feather_canary = save_list["feather_canary"] or 0
    local num_feather_crow = save_list["feather_crow"] or 0
    local num_feather_robin = save_list["feather_robin"] or 0
    return num_feather_canary >= 10 and num_feather_crow >= 10 and num_feather_robin >= 10
end
local function UpdateAbility(inst)
    local save_list = inst["g_save"] or {}
    local num_honey = save_list["honeycomb"] or 0
    if num_honey >= 5 and HH_UTILS:HasComponents(inst, "preserver") then
        inst["components"]["preserver"]:SetPerishRateMultiplier(-1)
    end
    if HH_UTILS:HasComponents(inst, "named") then
        local name_str = STRINGS["NAMES"][string["upper"]("gentleness_back")] or "未定义"
        local format_str = "%s\n返鲜:%s/5(蜂巢)\n踏水:金色羽毛%s/10 黑色羽毛%s/10 红色羽毛%s/10"
        inst["components"]["named"]:SetName(string["format"](format_str, name_str, tostring(num_honey),
                tostring(save_list["feather_canary"] or 0),
                tostring(save_list["feather_crow"] or 0),
                tostring(save_list["feather_robin"] or 0))
        )
    end
end

local function save_back(_inst, save_data)
    if save_data then
        save_data["g_save"] = _inst["g_save"]
    end
end
local function load_back(_inst, save_data)
    if save_data then
        _inst["g_save"] = save_data["g_save"] or {}
        if _inst["UpdateAbility"] then
            _inst:UpdateAbility()
        end
    end
end

local function SpawnWaterFx(player)
    if not player or not player["sg"] or player:HasTag("playerghost") then
        return
    end
    local is_moving = player["sg"]:HasStateTag("moving")
    local is_running = player["sg"]:HasStateTag("running")
    if (is_moving or is_running) and HH_UTILS:HasComponents(player, "drownable")
            and player["components"]["drownable"]:IsOverWater()
    then
        SpawnPrefab("weregoose_splash_less" .. tostring(math["random"](2)))["entity"]:SetParent(player["entity"])
    end
end
local function addBackFn(inst, name)
    inst["components"]["inventoryitem"]["cangoincontainer"] = false
    inst:AddComponent("named")
    inst:AddComponent("equippable")
    inst["components"]["equippable"]["equipslot"] = EQUIPSLOTS["BACK"] or EQUIPSLOTS["BODY"]
    inst["components"]["equippable"]["restrictedtag"] = "gentleness"
    inst["components"]["equippable"]:SetOnEquip(function(weapon_inst, owner)
        if not HH_UTILS:HasComponents(owner, "gentleness_player") then
            return
        end
        local skin_build = GetItemSkinName(weapon_inst)
        owner["AnimState"]:OverrideSymbol("swap_body", skin_build, "swap_body")
        if weapon_inst["components"]["container"] ~= nil then
            weapon_inst["components"]["container"]:Open(owner)
        end

        if checkXk(weapon_inst) and owner and owner["Physics"] then
            if owner["components"]["drownable"] then
                owner["components"]["drownable"]["enabled"] = false
            end
            HH_UTILS:HHKillTask(owner, "g_spawn_fx_task")
            owner["g_can_in_water"] = true
            owner["Physics"]:ClearCollisionMask()
            owner["Physics"]:CollidesWith(COLLISION["GROUND"])

            owner["Physics"]:CollidesWith(COLLISION["SMALLOBSTACLES"])
            owner["Physics"]:CollidesWith(COLLISION["CHARACTERS"])
            owner["Physics"]:CollidesWith(COLLISION["GIANTS"])
            owner["Physics"]:Teleport(owner["Transform"]:GetWorldPosition())
            owner["g_spawn_fx_task"] = owner:DoPeriodicTask(0.3, function(player)
                SpawnWaterFx(player)
            end)
        end
    end)
    inst["components"]["equippable"]:SetOnUnequip(function(weapon_inst, owner)
        if not HH_UTILS:HasComponents(owner, "gentleness_player") then
            return
        end
        owner["AnimState"]:ClearOverrideSymbol("swap_body")
        if weapon_inst["components"]["container"] ~= nil then
            weapon_inst["components"]["container"]:Close(owner)
        end
        if owner["components"]["drownable"] then
            owner["components"]["drownable"]["enabled"] = true
        end
        HH_UTILS:HHKillTask(owner, "g_spawn_fx_task")
        owner["g_can_in_water"] = false
        if owner["Physics"] then
            owner["Physics"]:ClearCollisionMask()
            owner["Physics"]:CollidesWith(COLLISION["WORLD"])
            owner["Physics"]:CollidesWith(COLLISION["OBSTACLES"])
            owner["Physics"]:CollidesWith(COLLISION["SMALLOBSTACLES"])
            owner["Physics"]:CollidesWith(COLLISION["CHARACTERS"])
            owner["Physics"]:CollidesWith(COLLISION["GIANTS"])
            owner["Physics"]:Teleport(owner["Transform"]:GetWorldPosition())
        end
    end)
    inst["components"]["equippable"]:SetOnEquipToModel(function(weapon_inst, owner, from_ground)
        if weapon_inst["components"]["container"] ~= nil then
            weapon_inst["components"]["container"]:Close(owner)
        end
    end)
    inst["components"]["equippable"]["walkspeedmult"] = 1.1
    inst:AddComponent("container")
    inst["components"]["container"]:WidgetSetup(name)
    inst["components"]["container"]["skipclosesnd"] = true
    inst["components"]["container"]["skipopensnd"] = true
    inst["g_save"] = {}
    inst:AddComponent("trader")
    inst["components"]["trader"]["acceptnontradable"] = true
    inst["components"]["trader"]:SetAcceptTest(function(_inst, items, player)
        local check_item = checkBackTar(_inst, items, player)
        return check_item
    end)
    inst["components"]["trader"]["onaccept"] = function(_inst, player, items)
        local item_id = items["prefab"]
        if not _inst["g_save"][item_id] then
            _inst["g_save"][item_id] = 0
        end
        local max_num = level_back_list[item_id] or 0
        local current_num = _inst["g_save"][item_id]
        _inst["g_save"][item_id] = math["min"](current_num + 1, max_num)
        if _inst["UpdateAbility"] then
            _inst:UpdateAbility()
        end
    end
    inst["components"]["trader"]["onrefuse"] = function(_inst, giver, item)
        local check_item, message = checkBackTar(_inst, item, giver)
        if not check_item then
            HH_UTILS:HHSay(giver, message)
        end
    end
    inst:AddComponent("preserver")
    inst["components"]["preserver"]:SetPerishRateMultiplier(0.8)
    inst["UpdateAbility"] = UpdateAbility
    inst["OnSave"] = save_back
    inst["OnLoad"] = load_back
end

local function checkArmorLevelItem(inst, items, player)
    if not items or not items["prefab"] or not HH_UTILS:IsHHType(inst["g_body_level"], "number") then
        return false, "装备参数错误"
    end
    if items["prefab"] == "armordragonfly" then
        if not HH_UTILS:IsHHType(inst["g_fire_level"], "number") then
            return false, "鳞甲参数错误"
        end
        if inst["g_fire_level"] >= 1 then
            return false, "防火已解锁"
        end
        return true, "解锁防火能力"
    end
    local armor_com = inst["components"]["armor"]
    local absorb_percent = armor_com:GetAbsorption() or 0
    if not HH_UTILS:IsHHType(absorb_percent, "number") then
        return false, "护甲属性被篡改"
    end
    if absorb_percent >= TUNING["GENTLENESS_BODY_ARMOR"] / 100 then
        return false, "护甲已到达上限"
    end
    local item_id = items["prefab"]
    local current_level = inst["g_body_level"]
    local leve_bool = current_level >= 5
    if leve_bool then
        if item_id == "gentleness_coin" then
            return true, "正确"
        end
        return false, "当前升级道具:沙币"
    else
        if item_id == "armormarble" then
            return true, "正确"
        end
        return false, "当前升级道具:大理石甲"
    end
    return false, "不允许交易"
end
local function updateArmorName(inst)
    if HH_UTILS:HasComponents(inst, "named") then
        local name_str = STRINGS["NAMES"][string["upper"]("gentleness_armor")] or "未定义"
        name_str = string["format"]("%s\n等级:%s(大理石甲/沙币) 防火:%s/1(鳞甲)", name_str, tostring(inst["g_body_level"] or 0), tostring(inst["g_fire_level"] or 0))
        inst["components"]["named"]:SetName(name_str)
    end
end
local function updateBodyArmor(inst, player, item)
    local current_level = inst["g_body_level"]
    local armor_com = inst["components"]["armor"]
    local absorb_percent = armor_com:GetAbsorption() or 0
    if not HH_UTILS:IsHHType(absorb_percent, "number") then
        HH_UTILS:HHSay(player, "升级护甲值失败，护甲属性被篡改")
        return
    end
    if item and item["prefab"] == "armordragonfly" then
        if not HH_UTILS:IsHHType(inst["g_fire_level"], "number") or (inst["g_fire_level"] >= 1) then
            updateArmorName(inst)
            return
        end
        inst["g_fire_level"] = 1
        if HH_UTILS:HasComponents(inst, "equippable")
                and inst["components"]["equippable"]:IsEquipped()
                and HH_UTILS:HasComponents(inst, "inventoryitem")
        then
            local owner = inst["components"]["inventoryitem"]["owner"]
            if HH_UTILS:NotIsDead(owner) and owner:HasTag("gentleness") then
                owner["components"]["health"]["externalfiredamagemultipliers"]:SetModifier(owner, 0, "armor_ability")
            end
        end
        updateArmorName(inst)
        return
    end

    if player then
        inst["g_body_level"] = current_level + 1
    end
    local new_level = inst["g_body_level"]
    local add_armor = 0
    if new_level <= 5 then
        add_armor = new_level * 3
    else
        add_armor = 15 + (new_level - 5)
    end
    local new_absorb = math["min"](base_hat_armor + add_armor / 100, TUNING["GENTLENESS_BODY_ARMOR"] / 100)
    inst["components"]["armor"]:InitIndestructible(new_absorb)
    updateArmorName(inst)
end

local function save_body(_inst, save_data)
    if save_data then
        save_data["g_body_level"] = _inst["g_body_level"]
        save_data["g_fire_level"] = _inst["g_fire_level"]
    end
end
local function load_body(_inst, save_data)
    if save_data then
        _inst["g_body_level"] = save_data["g_body_level"] or 0
        _inst["g_fire_level"] = save_data["g_fire_level"] or 0
        updateBodyArmor(_inst)
    end
end
local function addArmorBody(inst, name)
    inst:AddComponent("named")
    inst:AddComponent("equippable")
    inst["components"]["equippable"]["equipslot"] = EQUIPSLOTS["BODY"]
    inst["components"]["equippable"]["restrictedtag"] = "gentleness"
    inst["components"]["equippable"]:SetOnEquip(function(weapon_inst, owner)
        local skin_build = GetItemSkinName(weapon_inst)
        if skin_build == weapon_inst["prefab"] then
            skin_build = "gentleness"
        end
        HH_UTILS:HHKillTask(owner, "g_replace_body_task")
        owner["g_replace_body_task"] = owner:DoTaskInTime(0, function(player)
            if player then
                player["AnimState"]:OverrideSymbol("arm_lower", skin_build, "arm_lower")
                player["AnimState"]:OverrideSymbol("torso", skin_build, "torso")
                player["AnimState"]:OverrideSymbol("arm_upper_skin", skin_build, "arm_upper_skin")
                player["AnimState"]:OverrideSymbol("leg", skin_build, "leg")
            end
        end)
        if weapon_inst["g_fire_level"] and weapon_inst["g_fire_level"] >= 1
                and HH_UTILS:HasComponents(owner, "health") then
            owner["components"]["health"]["externalfiredamagemultipliers"]:SetModifier(owner, 0, "armor_ability")
        end
    end)
    inst["components"]["equippable"]:SetOnUnequip(function(weapon_inst, owner)
        if HH_UTILS:HasComponents(owner, "health") then
            owner["components"]["health"]["externalfiredamagemultipliers"]:RemoveModifier(owner, "armor_ability")
        end
        HH_UTILS:HHKillTask(owner, "g_replace_body_task")
        owner["AnimState"]:OverrideSymbol("arm_lower", "gentleness", "arm_lower")
        owner["AnimState"]:OverrideSymbol("torso", "gentleness", "torso")
        owner["AnimState"]:OverrideSymbol("arm_upper_skin", "gentleness", "arm_upper_skin")
        owner["AnimState"]:OverrideSymbol("leg", "gentleness", "leg")
    end)
    inst:AddComponent("armor")
    inst["components"]["armor"]:InitIndestructible(base_hat_armor)
    inst["g_body_level"] = 0
    inst["g_fire_level"] = 0
    inst:AddComponent("trader")
    inst["components"]["trader"]["acceptnontradable"] = true
    inst["components"]["trader"]:SetAcceptTest(function(_inst, items, player)
        local check_item = checkArmorLevelItem(_inst, items, player)
        return check_item
    end)
    inst["components"]["trader"]["onaccept"] = function(_inst, player, items)
        updateBodyArmor(_inst, player, items)
    end
    inst["components"]["trader"]["onrefuse"] = function(_inst, giver, item)
        local is_success, message = checkArmorLevelItem(_inst, item, giver)
        if not is_success then
            HH_UTILS:HHSay(giver, tostring(message))
        end
    end
    updateBodyArmor(inst)
    inst["OnSave"] = save_body
    inst["OnLoad"] = load_body
end

local function addAmuletFn(inst, name)
    inst:AddComponent("equippable")
    inst["components"]["equippable"]["equipslot"] = EQUIPSLOTS["NECK"] or EQUIPSLOTS["BODY"]
    inst["components"]["equippable"]["restrictedtag"] = "gentleness"
    inst["components"]["equippable"]:SetOnEquip(function(weapon_inst, owner)
        if not weapon_inst["hh_light_fx"] then
            weapon_inst["hh_light_fx"] = SpawnPrefab("gentleness_amulet_light")
            weapon_inst["hh_light_fx"]["entity"]:SetParent(owner["entity"])
        end
    end)
    inst["components"]["equippable"]:SetOnUnequip(function(weapon_inst, owner)
        HH_UTILS:HHRemoveFx(weapon_inst, "hh_light_fx")
    end)
    inst["components"]["equippable"]["walkspeedmult"] = 1.1
    inst:AddComponent("bundlemaker")
    inst["components"]["bundlemaker"]:SetBundlingPrefabs("gentleness_amulet_container", "gentleness_bundle_gif")

    inst:AddComponent("planardefense")
    inst["components"]["planardefense"]:SetBaseDefense(20)
end

local function save_bundle(inst, save_data)
    if save_data then
        save_data["save_pack_item"] = inst["save_pack_item"]
    end
end
local function load_bundle(inst, save_data)
    if save_data then
        inst["save_pack_item"] = save_data["save_pack_item"] or {}
        if inst["UpdateBundleName"] then
            inst:UpdateBundleName()
        end
    end
end
local function UpdateBundleName(inst)
    local save_list = inst["save_pack_item"]
    if not HH_UTILS:IsHHType(save_list, "table")
            or not save_list["item_save"]
    then
        return
    end
    local player_name = save_list["player_name"] or "？"
    local item_name = save_list["item_name"] or "？"
    if HH_UTILS:HasComponents(inst, "named") then
        inst["components"]["named"]:SetName(string["format"]("打包后的%s\n打包人:%s", tostring(item_name), tostring(player_name)))
    end
end
local function SaveBundleItem(inst, target, player)


    if not HH_UTILS:HasComponents(TheWorld, "gentleness_world") then
        return false, "当前世界不允许打包物品"
    end
    if not target or target:HasTag("FX") or target:HasTag("NOCLICK") or target:HasTag("CLASSIFIED") then
        return false, "特效类实体不允许打包"
    end
    local world_id = TheWorld["components"]["gentleness_world"]:GetUid()
    local player_name = player and player["name"] or player["prefab"]
    local item_name = target and target["name"] or target["prefab"]

    if HH_UTILS:HasComponents(target, "container") then
        target["components"]["container"]:Close()
    end

    if HH_UTILS:HasComponents(target, "leader") then
        local hh_follower = target["components"]["leader"]["followers"]
        if HH_UTILS:IsHHType(hh_follower, "table") then
            for i, v in pairs(hh_follower) do
                if v and HH_UTILS:IsHHType(v, "table") and v["persists"] and v["Remove"] then
                    v:Remove()
                end
            end
        end
    end
    local save_pos = nil
    local new_tel = nil

    if HH_UTILS:HasComponents(target, "teleporter")
            and target["components"]["teleporter"]:GetTarget()
    then
        local other_tel = target["components"]["teleporter"]:GetTarget()
        if not other_tel or not other_tel["Transform"] or not other_tel["GetPosition"] then
            return false, "未找到匹配的传送点坐标"
        end
        local other_x, other_y, other_z = other_tel["Transform"]:GetWorldPosition()
        save_pos = { ["x"] = other_x, ["y"] = other_y, ["z"] = other_z, }
        new_tel = other_tel:GetSaveRecord()
        other_tel:Remove()
    end
    local item_data = target:GetSaveRecord()
    inst["save_pack_item"] = {
        ["world_id"] = tostring(world_id),
        ["item_save"] = item_data,
        ["item_name"] = tostring(item_name),
        ["player_name"] = tostring(player_name),
        ["wormhole"] = new_tel,
        ["wormhole_pos"] = save_pos,
    }
    target:Remove()
    if inst["UpdateBundleName"] then
        inst:UpdateBundleName()
    end
    return true, "打包成功"
end
local function bundleDeploy(inst, pt, deployer)
    if inst["Physics"] ~= nil then
        inst["Physics"]:Teleport(pt:Get())
    else
        inst["Transform"]:SetPosition(pt:Get())
    end
    local save_list = inst["save_pack_item"]
    if not HH_UTILS:IsHHType(save_list, "table")
            or not save_list["item_save"]
    then
        HH_UTILS:HHSay(deployer, "里面是空的")
        inst:Remove()
        return
    end
    if not HH_UTILS:HasComponents(TheWorld, "gentleness_world") then
        HH_UTILS:HHSay(deployer, "当前世界禁止打包")
        return
    end
    local world_id = TheWorld["components"]["gentleness_world"]:GetUid()
    if save_list["wormhole_pos"] then
        if world_id ~= save_list["world_id"] then
            HH_UTILS:HHSay(deployer, "打包的物品不允许在其他世界种植")
            return
        end
    end
    local copy_item = SpawnSaveRecord(save_list["item_save"])
    if copy_item and copy_item["Transform"] then
        copy_item["Transform"]:SetPosition(pt:Get())
        if HH_UTILS:HasComponents(copy_item, "teleporter")
                and save_list["wormhole_pos"] and save_list["wormhole"]
        then
            local new_tel = SpawnSaveRecord(save_list["wormhole"])
            if new_tel and HH_UTILS:HasComponents(new_tel, "teleporter") then
                local other_pos = save_list["wormhole_pos"]
                local new_x, new_y, new_z = tonumber(other_pos["x"]) or 0, tonumber(other_pos["y"]) or 0, tonumber(other_pos["z"]) or 0
                new_tel["Transform"]:SetPosition(new_x, new_y, new_z)
                new_tel["components"]["teleporter"]:Target(copy_item)
                copy_item["components"]["teleporter"]:Target(new_tel)
            end
        end
        inst:Remove()
    end
end
local function bundleFn(inst, name)

    inst:AddComponent("deployable")
    inst["components"]["deployable"]["ondeploy"] = bundleDeploy
    inst["components"]["deployable"]:SetDeploySpacing(DEPLOYSPACING["NONE"])

    inst["save_pack_item"] = {}
    inst["UpdateBundleName"] = UpdateBundleName
    inst["SaveBundleItem"] = SaveBundleItem
    inst["OnSave"] = save_bundle
    inst["OnLoad"] = load_bundle
end

local function addMLKX(inst, name)
    inst:AddComponent("equippable")
    inst["components"]["equippable"]["restrictedtag"] = "gentleness"
    inst["components"]["equippable"]:SetOnEquip(function(weapon_inst, owner)
        owner["AnimState"]:OverrideSymbol("swap_object", "gentleness_items", "gentleness_mlkx")
        owner["AnimState"]:Show("ARM_carry")
        owner["AnimState"]:Hide("ARM_normal")
    end)
    inst["components"]["equippable"]:SetOnUnequip(function(weapon_inst, owner)
        owner["AnimState"]:Hide("ARM_carry")
        owner["AnimState"]:Show("ARM_normal")
    end)
end

local function clientChest(inst, name)
    inst["AnimState"]:SetBank("gentleness_chest")
    inst["AnimState"]:SetBuild("gentleness_chest")
    inst["AnimState"]:PlayAnimation("idle")
    inst["Transform"]:SetScale(0.8, 0.8, 0.8)
    --MakeObstaclePhysics(inst, 0.5)
    inst:AddTag("structure")
end
local function addComFood(inst, data)
    inst:AddComponent("tradable")
    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst["components"]["inventoryitem"]["imagename"] = data["name"] or "beard_monster"
    inst["components"]["inventoryitem"]["atlasname"] = data["xml"] or com_item_xml
    inst:AddComponent("stackable")
    inst["components"]["stackable"]["maxsize"] = TUNING["STACK_SIZE_SMALLITEM"]
    inst:AddComponent("edible")
    inst["components"]["edible"]["healthvalue"] = data["health"] or 0
    inst["components"]["edible"]["hungervalue"] = data["hunger"] or 0
    inst["components"]["edible"]["sanityvalue"] = data["sanity"] or 0
    inst["components"]["edible"]["foodtype"] = data["foodtype"] or "VEGGIE"
    if HH_UTILS:IsHHType(data["magic"], "number") then
        local add_magic = data["magic"]
        inst["components"]["edible"]["oneaten"] = function(_inst, eater)
            if HH_UTILS:HasComponents(eater, "gentleness_magic") then
                eater["components"]["gentleness_magic"]:DoDelta(add_magic)
            end
        end
    end
    if not data["not_need_perishable"] then
        inst:AddComponent("perishable")
        inst["components"]["perishable"]:SetPerishTime(data["perishable_date"] or TUNING["PERISH_SLOW"])
        inst["components"]["perishable"]:StartPerishing()
        inst["components"]["perishable"]["onperishreplacement"] = "spoiled_food"
    end
end
local function addComBoxServer(inst, data)
    inst:AddComponent("tradable")
    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst["components"]["inventoryitem"]["imagename"] = data["name"] or "beard_monster"
    inst["components"]["inventoryitem"]["atlasname"] = data["xml"] or com_item_xml
    inst:AddComponent("stackable")
    inst["components"]["stackable"]["maxsize"] = TUNING["STACK_SIZE_SMALLITEM"]
    if data["box_type"] then
        inst["box_type"] = data["box_type"]
    end
    if data["box_ability"] then
        inst["ability_id"] = data["box_ability"]
    end
end

local function handleBoxBuildClient(inst, data)
    inst["AnimState"]:SetBank("gentleness_box_build")
    inst["AnimState"]:SetBuild("gentleness_box_build")
    inst["AnimState"]:PlayAnimation("idle")
    MakeObstaclePhysics(inst, 1)
    inst:AddTag("structure")
    inst["entity"]:AddLight()
    inst["Light"]:SetFalloff(1)
    inst["Light"]:SetIntensity(0.5)
    inst["Light"]:SetRadius(2)
    inst["Light"]:SetColour(1, 1, 1)
    inst["Light"]:Enable(false)
end
local function checkBoxTrader(_inst, items, giver)
    if not giver or not giver["userid"] then
        return false, "玩家参数为空"
    end
    if _inst["owner_id"] and _inst["owner_id"] ~= giver["userid"] then
        return false, "展示柜已经关联其他玩家"
    end
    if not (_inst["box_type"] and items and (items["box_type"] == _inst["box_type"])) then
        return false, "不是一种类型的盲盒"
    end
    local hh_list = _inst["box_list"] or {}

    if #hh_list >= 8 then
        return false, "盲盒已满"
    end

    local item_prefab = items["prefab"]
    for i, v in ipairs(_inst["box_list"]) do
        if v == item_prefab then
            return false, "此盲盒已拥有"
        end
    end
    return true, "存储成功"
end
local replace_folder = {
    "item_a",
    "item_b",
    "item_c",
    "item_d",
    "item_e",
    "item_f",
    "item_g",
    "item_h",
}
local function onHitChest(inst, worker)
    if inst["components"]["container"] ~= nil then
        inst["components"]["container"]:DropEverything()
        inst["components"]["container"]:Close()
    end
end
local function addComWorkable(inst, work_num)
    inst:AddComponent("workable")
    inst["components"]["workable"]:SetWorkAction(ACTIONS["HAMMER"])
    inst["components"]["workable"]:SetWorkLeft(work_num or 4)
    inst["components"]["workable"]:SetOnFinishCallback(function(inst, worker)
        if inst["components"]["lootdropper"] ~= nil then
            inst["components"]["lootdropper"]:DropLoot()
        end
        if inst["components"]["container"] ~= nil then
            inst["components"]["container"]:DropEverything()
            inst["components"]["container"]:Close()
        end
        local fx = SpawnPrefab("collapse_small")
        fx["Transform"]:SetPosition(inst["Transform"]:GetWorldPosition())
        fx:SetMaterial("stone")
        inst:Remove()
    end)
    inst["components"]["workable"]:SetOnWorkCallback(onHitChest)
end
local function handleBoxBuildServer(inst, data)
    if inst["Light"] then
        inst["Light"]:Enable(true)
    end
    inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
    addComWorkable(inst)
    inst["components"]["workable"]:SetOnFinishCallback(function(inst, worker)
        if inst["components"]["lootdropper"] ~= nil then
            inst["components"]["lootdropper"]:DropLoot()
        end
        if inst["components"]["container"] ~= nil then
            inst["components"]["container"]:DropEverything()
            inst["components"]["container"]:Close()
        end
        local x, y, z = inst["Transform"]:GetWorldPosition()
        local fx = SpawnPrefab("collapse_small")
        fx["Transform"]:SetPosition(x, y, z)
        fx:SetMaterial("stone")
        --if HH_UTILS:IsHHType(inst["box_list"], "table") then
        --    for i, v in ipairs(inst["box_list"]) do
        --        if HH_UTILS:IsHHType(v, "string") then
        --            local spawn_box = SpawnPrefab(v)
        --            if spawn_box and spawn_box["Transform"] then
        --                spawn_box["Transform"]:SetPosition(x, y, z)
        --                local random_angle = math["random"](1, 360)
        --                launchItem(spawn_box, random_angle)
        --            end
        --        end
        --    end
        --end
        inst:Remove()
    end)
    if data["box_type"] then
        inst["box_type"] = data["box_type"]
    end
    if data["box_ability_id"] then
        inst["box_ability_id"] = data["box_ability_id"]
    end
    inst["box_list"] = {}
    inst["owner_id"] = nil
    inst:AddComponent("trader")
    inst["components"]["trader"]["acceptnontradable"] = true

    inst["components"]["trader"]:SetAcceptTest(function(_inst, items, player)
        local is_success = checkBoxTrader(_inst, items, player)
        return is_success
    end)
    inst["components"]["trader"]["onaccept"] = function(_inst, player, items)
        table["insert"](_inst["box_list"], items["prefab"])
        if not _inst["owner_id"] then
            _inst["owner_id"] = player["userid"]
        end
        if _inst["ReplaceBox"] then
            _inst:ReplaceBox()
        end

        if items["ability_id"] and HH_UTILS:HasComponents(player, "gentleness_player") then
            player["components"]["gentleness_player"]:UnLockAbility(items["ability_id"], true)
        end
    end
    inst["components"]["trader"]["onrefuse"] = function(_inst, giver, item)
        local is_success, message = checkBoxTrader(_inst, item, giver)
        if not is_success then
            HH_UTILS:HHSay(giver, tostring(message))
        end
    end
    inst["ReplaceBox"] = function(_inst)
        if not HH_UTILS:IsHHType(_inst["box_list"], "table") then
            return false
        end
        for i, v in ipairs(_inst["box_list"]) do
            if replace_folder[i] and HH_UTILS:IsHHType(v, "string") then
                _inst["AnimState"]:OverrideSymbol(replace_folder[i], "gentleness_items", v)
            end
        end

        if #_inst["box_list"] >= 8 then
            _inst:AddTag("gentleness_ability")
        end
    end
    inst:AddComponent("named")

    inst["OnBuiltFn"] = function(_inst, player)
        _inst["owner_id"] = player["userid"]
        local player_name = player["name"]
        local item_name = STRINGS["NAMES"][string["upper"](_inst["prefab"] or "gentleness")] or "未定义"
        if HH_UTILS:HasComponents(_inst, "named") then
            _inst["components"]["named"]:SetName(string["format"]("%s\n归属:%s", item_name, player_name))
        end
    end
    inst["OnSave"] = function(_inst, save_data)
        if save_data then
            save_data["box_list"] = _inst["box_list"]
            save_data["owner_id"] = _inst["owner_id"]
        end
    end
    inst["OnLoad"] = function(_inst, save_data)
        if save_data then
            _inst["owner_id"] = save_data["owner_id"]
            _inst["box_list"] = save_data["box_list"] or {}
            if _inst["ReplaceBox"] then
                _inst:ReplaceBox()
            end
        end
    end
end

local NOTAGS = { "FX", "NOCLICK", "DECOR", "INLIMBO", "burnt", "player", "monster", "campfire" }
local NONEMERGENCYTAGS = { "witherable", "fire", "smolder" }
local function sf(inst, doer)
    if inst and HH_UTILS:HasComponents(inst, "pickable") then
        if inst["components"]["pickable"]:CanBeFertilized() then
            inst["components"]["pickable"]:Fertilize(inst)
            TheWorld:PushEvent("CHEVO_fertilized", { ["target"] = inst, ["doer"] = doer })
        end
    end
end
local function checkBadEntity(inst)
    if not inst or not inst["Transform"] then
        return
    end
    local base_range = 60
    local x, y, z = inst["Transform"]:GetWorldPosition()
    local fire_entity = TheSim:FindEntities(x, y, z, base_range, nil, NOTAGS, NONEMERGENCYTAGS)
    if fire_entity then
        for i, v in ipairs(fire_entity) do
            if HH_UTILS:HasComponents(v, "burnable") then

                if v["components"]["burnable"]:IsBurning() then
                    v["components"]["burnable"]:Extinguish(true, TUNING["WATERINGCAN_EXTINGUISH_HEAT_PERCENT"])
                elseif v["components"]["burnable"]:IsSmoldering() then
                    v["components"]["burnable"]:Extinguish(true)
                end
            end
        end
    end
    local plant_entity = TheSim:FindEntities(x, y, z, base_range, nil, NOTAGS, { "fertile", "infertile", "barren", "fertilizable" })
    if plant_entity then
        for i, v in ipairs(plant_entity) do
            pcall(sf, v, inst)
        end
    end
    local lunarthrall_plant = TheSim:FindEntities(x, y, z, base_range, nil, NOTAGS, { "lunarthrall_plant" })
    if lunarthrall_plant then
        for i, v in ipairs(lunarthrall_plant) do
            if v and v["prefab"] == "lunarthrall_plant" and HH_UTILS:HasComponents(v, "health")
                    and HH_UTILS:NotIsDead(v)
            then
                v["components"]["health"]:Kill()
            end
        end
    end
end

local function replacePotion(inst, name)
    inst["AnimState"]:SetBank("gentleness_potion")
    inst["AnimState"]:SetBuild("gentleness_potion")
    inst["AnimState"]:PlayAnimation("idle")
    inst["AnimState"]:OverrideSymbol("gentleness_potion_mca", "gentleness_potion", name)
    inst["Transform"]:SetScale(0.3, 0.3, 0.3)
    inst:AddTag("g_special_food")
    MakeInventoryPhysics(inst)
    MakeInventoryFloatable(inst, "med", 0.3, 0.8)
end

local function create_light(eater, lightprefab)
    if eater["wormlight"] ~= nil then
        if eater["wormlight"]["prefab"] == lightprefab then
            eater["wormlight"]["components"]["spell"]["lifetime"] = 0
            eater["wormlight"]["components"]["spell"]:ResumeSpell()
            return
        else
            eater["wormlight"]["components"]["spell"]:OnFinish()
        end
    end

    local light = SpawnPrefab(lightprefab)
    light["components"]["spell"]:SetTarget(eater)
    if light:IsValid() then
        if light["components"]["spell"]["target"] == nil then
            light:Remove()
        else
            light["components"]["spell"]:StartSpell()
        end
    end
end
local World_MTL_POS = {}
local function addMTLPos(inst)
    if not inst or not inst["Transform"] then
        return
    end
    local x, y, z = inst["Transform"]:GetWorldPosition()
    local target_uid = inst["GUID"]
    local key = string["format"]("MTL_%s", tostring(target_uid))
    if not World_MTL_POS[key] then
        World_MTL_POS[key] = {
            x = x,
            y = y,
            z = z,
        }
    end
end
local function RemoveMTLPos(inst)
    if not inst or not inst["Transform"] then
        return
    end
    local target_uid = inst["GUID"]
    local key = string["format"]("MTL_%s", tostring(target_uid))
    if World_MTL_POS[key] then
        World_MTL_POS[key] = nil
    end
end
local function retNum(num)
    return tonumber(num) or 0
end
local function GNewApplyDamage(self, damage, attacker, weapon, spdamage, ...)
    local target = self["inst"]
    if target["gentlenes_has_hook_absorb"] == 1 then
        return damage, spdamage
    end
    if self["ApplyDamage_gentlenes"] ~= nil then
        return self["ApplyDamage_gentlenes"](self, damage, attacker, weapon, spdamage, ...)
    end
    return damage, spdamage
end
local function combat_mult_RecalculateModifier_l(inst)
    local m = inst["_base"]
    for source, src_params in pairs(inst["_modifiers"]) do
        for k, v in pairs(src_params["modifiers"]) do
            if v > 1 then
                m = inst["_fn"](m, v)
            end
        end
    end
    inst["_modifier_gentlenes"] = m
end
local function combat_mult_Get_l(self, ...)
    local target = self["inst"]
    if target["gentlenes_has_hook_absorb"] == 1 then
        return self["_modifier_gentlenes"] or 1
    end
    if self["Get_gentlenes"] ~= nil then
        return self["Get_gentlenes"](self, ...)
    end
    return 1
end

local function combat_mult_SetModifier_l(self, ...)
    if self["SetModifier_gentlenes"] ~= nil then
        self["SetModifier_gentlenes"](self, ...)
    end
    combat_mult_RecalculateModifier_l(self)
end

local function combat_mult_RemoveModifier_l(self, ...)
    if self["RemoveModifier_gentlenes"] ~= nil then
        self["RemoveModifier_gentlenes"](self, ...)
    end
    combat_mult_RecalculateModifier_l(self)
end
local function combat_GetAttacked_l(self, ...)
    local notblocked
    if self["GetAttacked_gentlenes"] ~= nil then
        notblocked = self["GetAttacked_gentlenes"](self, ...)
    end
    local target = self["inst"]
    if target["gentlenes_has_hook_absorb"] == 1 then
        target["gentlenes_has_hook_absorb"] = 0
    end
    return notblocked
end
local function health_DoDelta_player(self, amount, overtime, cause, ignore_invincible, afflicter, ignore_absorb, ...)
    if self["DoDelta_gentlenes"] ~= nil then
        local target = self["inst"]
        if target["gentlenes_has_hook_absorb"] == 1 then
            ignore_absorb = true
        end
        return self["DoDelta_gentlenes"](self, amount, overtime, cause, ignore_invincible, afflicter, ignore_absorb, ...)
    end
    return amount
end
local function health_DoDelta_l(self, amount, overtime, cause, ignore_invincible, afflicter, ignore_absorb, ...)
    if self["DoDelta_gentlenes"] ~= nil then
        local target = self["inst"]
        if target["gentlenes_has_hook_absorb"] == 1 then
            ignore_invincible = true
            ignore_absorb = true
        end
        return self["DoDelta_gentlenes"](self, amount, overtime, cause, ignore_invincible, afflicter, ignore_absorb, ...)
    end
    return amount
end
local function health_IsInvincible_l(self, ...)
    local target = self["inst"]
    if target["gentlenes_has_hook_absorb"] == 1 then
        return target["sg"] and target["sg"]:HasStateTag("temp_invincible")
    end
    if self["IsInvincible_gentlenes"] ~= nil then
        return self["IsInvincible_gentlenes"](self, ...)
    end
end
local function planarentity_AbsorbDamage_l(self, damage, attacker, weapon, spdmg, ...)
    if self["AbsorbDamage_gentlenes"] == nil then
        return damage, spdmg
    end
    local target = self["inst"]
    if target["gentlenes_has_hook_absorb"] == 1 then
        local damage2, spdamage2 = self["AbsorbDamage_gentlenes"](self, damage, attacker, weapon, spdmg, ...)
        if damage2 < damage then
            return damage, spdamage2
        else
            return damage2, spdamage2
        end
    end
    return self["AbsorbDamage_gentlenes"](self, damage, attacker, weapon, spdmg, ...)
end

local function GetResist_l(self, attacker, weapon, ...)
    local mult = 1
    if self["GetResist_gentlenes"] ~= nil then
        local mult2 = self["GetResist_gentlenes"](self, attacker, weapon, ...)
        local target = self["inst"]
        if target["gentlenes_has_hook_absorb"] == 1 then
            if mult2 < 1 then
                mult2 = 1
            end
        end
        mult = mult * mult2
    end
    return mult
end
--copy by legion
local function hookTargetHealthAbsorb(inst, data)
    if not data or not data["target"] then
        return
    end
    local target = data["target"]
    if not (HH_UTILS:HasComponents(target, "health") and HH_UTILS:HasComponents(target, "combat")) or target["prefab"] == "laozi" then
        return
    end
    if not target["gentlenes_has_hook_absorb"] then
        if HH_UTILS:HasComponents(target, "inventory") then
            local inventory_com = target["components"]["inventory"]
            if not HH_UTILS:IsHHType(inventory_com["ApplyDamage_gentlenes"], "function") then
                inventory_com["ApplyDamage_gentlenes"] = inventory_com["ApplyDamage"]
                inventory_com["ApplyDamage"] = GNewApplyDamage
            end
        end
        if HH_UTILS:HasComponents(target, "combat") then
            local combat_com = target["components"]["combat"]
            local extra_absorb_fns = combat_com["externaldamagetakenmultipliers"]
            extra_absorb_fns["Get_gentlenes"] = extra_absorb_fns["Get"]
            extra_absorb_fns["Get"] = combat_mult_Get_l
            extra_absorb_fns["SetModifier_gentlenes"] = extra_absorb_fns["SetModifier"]
            extra_absorb_fns["SetModifier"] = combat_mult_SetModifier_l
            extra_absorb_fns["RemoveModifier_gentlenes"] = extra_absorb_fns["RemoveModifier"]
            extra_absorb_fns["RemoveModifier"] = combat_mult_RemoveModifier_l
            combat_mult_RecalculateModifier_l(extra_absorb_fns)
            if combat_com["GetAttacked_gentlenes"] == nil then
                combat_com["GetAttacked_gentlenes"] = combat_com["GetAttacked"]
                combat_com["GetAttacked"] = combat_GetAttacked_l
            end
        end
        local healthcpt = target["components"]["health"]
        if healthcpt ~= nil then
            if healthcpt["DoDelta_gentlenes"] == nil then
                healthcpt["DoDelta_gentlenes"] = healthcpt["DoDelta"]
                if target:HasTag("player") then
                    healthcpt["DoDelta"] = health_DoDelta_player
                else
                    healthcpt["DoDelta"] = health_DoDelta_l
                end
            end
            if healthcpt["IsInvincible_gentlenes"] == nil and not target:HasTag("player") then
                healthcpt["IsInvincible_gentlenes"] = healthcpt["IsInvincible"]
                healthcpt["IsInvincible"] = health_IsInvincible_l
            end
        end
        if HH_UTILS:HasComponents(target, "planarentity") and target["components"]["planarentity"]["AbsorbDamage_gentlenes"] == nil then
            target["components"]["planarentity"]["AbsorbDamage_gentlenes"] = target["components"]["planarentity"]["AbsorbDamage"]
            target["components"]["planarentity"]["AbsorbDamage"] = planarentity_AbsorbDamage_l
        end

        --修改防御的标签系数机制
        if HH_UTILS:HasComponents(target, "damagetyperesist") and target["components"]["damagetyperesist"]["GetResist_gentlenes"] == nil then
            target["components"]["damagetyperesist"]["GetResist_gentlenes"] = target["components"]["damagetyperesist"]["GetResist"]
            target["components"]["damagetyperesist"]["GetResist"] = GetResist_l
        end
    end
    target["gentlenes_has_hook_absorb"] = 1
end
local function staffEquip(inst, owner)

    owner["AnimState"]:Show("ARM_carry")
    owner["AnimState"]:Hide("ARM_normal")
    HH_UTILS:HHRemoveFx(owner, "hh_follow_fx")
    owner["AnimState"]:OverrideSymbol("swap_object", "gentleness_items", "gentleness_staff_cat")
    local spawn_fx_id = "gentleness_staff_color_cat_fx"
    if HH_UTILS:HasComponents(owner, "gentleness_player")
            and owner["components"]["gentleness_player"]:HasAbility("atk_aoe")
    then
        spawn_fx_id = "gentleness_staff_white_cat_fx"
    end
    owner["hh_follow_fx"] = SpawnPrefab(spawn_fx_id)
    if owner["hh_follow_fx"] then
        owner["hh_follow_fx"]["entity"]:AddFollower()
        owner["hh_follow_fx"]["entity"]:SetParent(owner["entity"])
        owner["hh_follow_fx"]["Follower"]:FollowSymbol(owner["GUID"], "swap_object", nil, nil, nil, true)
    end
    HH_UTILS:HHKillTask(owner, "spawn_drop_task")
    owner["spawn_drop_task"] = owner:DoPeriodicTask(1, function(player)
        if not player or not player["Transform"] or not player["entity"]:IsVisible() then
            HH_UTILS:HHKillTask(player, "spawn_drop_task")
            return
        end
        local x, y, z = player["Transform"]:GetWorldPosition()
        if player["sg"] ~= nil and player["sg"]:HasStateTag("moving") then
            local theta = -player["Transform"]:GetRotation() * DEGREES
            local speed = player["components"]["locomotor"]:GetRunSpeed() * 0.1
            x = x + speed * math["cos"](theta)
            z = z + speed * math["sin"](theta)
        end
        local mounted = player["components"]["rider"] ~= nil and player["components"]["rider"]:IsRiding()
        local map = TheWorld["Map"]
        local offset = FindValidPositionByFan(
                math["random"]() * TWOPI, (mounted and 1 or 0.5) + math["random"]() * 0.5, 4,
                function(offset)
                    local pt = Vector3(x + offset["x"], 0, z + offset["z"])
                    return map:IsPassableAtPoint(pt:Get()) and not map:IsPointNearHole(pt)
                            and #TheSim:FindEntities(pt["x"], 0, pt["z"], 0.7, { "gentleness_staff_drop_fx" }) <= 0
                end)
        if offset ~= nil then
            local drop_fx = SpawnPrefab("gentleness_staff_drop_fx")
            if drop_fx and drop_fx["Transform"] then
                drop_fx["Transform"]:SetPosition(x + offset["x"], y + 2, z + offset["z"])

            end
        end
    end)
    owner:ListenForEvent("onattackother", hookTargetHealthAbsorb)
end
local function staffUnEquip(inst, owner)
    owner["AnimState"]:Hide("ARM_carry")
    owner["AnimState"]:Show("ARM_normal")
    HH_UTILS:HHRemoveFx(owner, "hh_follow_fx")
    HH_UTILS:HHKillTask(owner, "spawn_drop_task")
    owner:RemoveEventCallback("onattackother", hookTargetHealthAbsorb)
end
local function hookProject(inst)
    local oldLaunchProjectile = inst["components"]["weapon"]["LaunchProjectile"]
    inst["components"]["weapon"]["LaunchProjectile"] = function(self, attacker, target, ...)
        if attacker and target and target["Transform"] then
            if self["inst"]["atk_task"] then
                return
            end
            HH_UTILS:HHKillTask(self["inst"], "hh_atk_task")
            local spawn_num = 0
            local hh_target = target
            local hh_attacker = attacker
            self["inst"]["hh_atk_task"] = self["inst"]:DoPeriodicTask(0, function(weapon_inst)
                if not (HH_UTILS:NotIsDead(hh_target) and HH_UTILS:NotIsDead(hh_attacker)) then
                    HH_UTILS:HHKillTask(weapon_inst, "hh_atk_task")
                    return
                end
                local proj = SpawnPrefab("gentleness_project")
                if proj then
                    if proj["components"]["projectile"] ~= nil then
                        local x, y, z = hh_attacker["Transform"]:GetWorldPosition()
                        local hh_pos = hh_attacker:GetPosition()
                        local hh_target_pos = hh_target:GetPosition()
                        local run_angle = hh_attacker["Transform"]:GetRotation()
                        local target_angle = hh_attacker["Transform"]:GetRotation()
                        local hh_distance = hh_pos:Dist(hh_target_pos)
                        if run_angle < 0 then
                            run_angle = run_angle + 360
                        end
                        if target_angle < 0 then
                            target_angle = target_angle + 360
                        end
                        proj["Transform"]:SetPosition(x, y, z)
                        local add_ange = 140
                        local add_ange2 = 75
                        if spawn_num == 1 then
                            add_ange = -140
                            add_ange2 = -75
                        end
                        local offset_num = math["min"](10, hh_distance)
                        local offset_num2 = math["min"](10, hh_distance) * 1.5
                        local offset_vector = Vector3(offset_num * math["cos"](-(run_angle + add_ange) * DEGREES), 0, offset_num * math["sin"](-(run_angle + add_ange) * DEGREES))
                        local offset_vector_2 = Vector3(offset_num2 * math["cos"](-(run_angle + add_ange2) * DEGREES), 0, offset_num2 * math["sin"](-(run_angle + add_ange2) * DEGREES))
                        proj["components"]["projectile"]:SetBezier3(hh_pos + offset_vector, hh_pos + offset_vector_2)
                        proj["components"]["projectile"]:SetBezierCalcDist(hh_distance)
                        proj["components"]["projectile"]:Throw(weapon_inst, hh_target, hh_attacker)
                        proj["g_fx_1"] = proj:SpawnChild("gentleness_fx_cat")
                    end
                end
                spawn_num = spawn_num + 1
                if spawn_num >= 2 then
                    HH_UTILS:HHKillTask(weapon_inst, "hh_atk_task")
                end
            end, 0)
        else
            return oldLaunchProjectile(self, attacker, target, ...)
        end
    end
end
local staff_item = {
    ["goldnugget"] = 800,
    ["purebrilliance"] = 50,
    ["horrorfuel"] = 40,
    ["deerclops_eyeball"] = 5,
    ["cane"] = 5,

}
local function checkItemStaff(inst, items, player)
    if not items or not items["prefab"] then
        return false, "装备参数错误"
    end
    local item_id = items["prefab"]
    local item_index = "g_" .. item_id .. "_level"
    if not staff_item[item_id] or not HH_UTILS:IsHHType(inst[item_index], "number") then
        return false, "升级参数错误"
    end
    local max_level = staff_item[item_id]
    local current_level = inst[item_index]
    if current_level >= max_level then
        return false, "当前道具达到交易上限"
    end
    return true, "符合条件"
end
local function handleStaffLevel(inst, key)
    if inst and HH_UTILS:IsHHType(inst[key], "number") then
        return math["max"](inst[key], 0)
    end
    return 0
end
local staff_damage = 68
local staff_range = 2
local function updateStaffAbility(inst)
    local hh_g_goldnugget_level = handleStaffLevel(inst, "g_goldnugget_level")
    local hh_g_purebrilliance_level = handleStaffLevel(inst, "g_purebrilliance_level")
    local hh_g_horrorfuel_level = handleStaffLevel(inst, "g_horrorfuel_level")
    local hh_g_deerclops_eyeball_level = handleStaffLevel(inst, "g_deerclops_eyeball_level")
    local hh_g_cane_level = handleStaffLevel(inst, "g_cane_level")
    inst["components"]["weapon"]:SetDamage(math["min"](staff_damage + hh_g_goldnugget_level / 20, 108))
    if HH_UTILS:HasComponents(inst, "planardamage") then
        inst["components"]["planardamage"]:SetBaseDamage(hh_g_horrorfuel_level / 2)
    end
    local hh_range = math["min"](staff_range + hh_g_deerclops_eyeball_level * 1.6, 10)
    inst["components"]["weapon"]:SetRange(hh_range, hh_range + 2.5)
    inst["components"]["equippable"]["walkspeedmult"] = 1 + (hh_g_cane_level * 10) / 100
    if HH_UTILS:HasComponents(inst, "named") then
        local name = STRINGS["NAMES"][string["upper"](tostring(inst["prefab"]))] or "未定义"
        inst["components"]["named"]:SetName(string.format(
                "%s\n金块:%s纯粹辉煌:%s纯粹恐惧:%s\n巨鹿眼球:%s步行手杖:%s", name,
                hh_g_goldnugget_level,
                hh_g_purebrilliance_level,
                hh_g_horrorfuel_level,
                hh_g_deerclops_eyeball_level,
                hh_g_cane_level
        ))
    end
end
local function updateStafflevel(inst, item, player)
    local check_result, message = checkItemStaff(inst, item, player)
    if not check_result then
        return
    end
    local item_id = item["prefab"]
    local item_index = "g_" .. item_id .. "_level"
    local max_level = staff_item[item_id]
    local current_level = inst[item_index]
    if current_level >= max_level then
        return
    end
    inst[item_index] = current_level + 1
    updateStaffAbility(inst)
end

local function updateGoldLevel(inst, player, count)
    if not HH_UTILS:IsHHType(count, "number") or count <= 0 then
        return false
    end
    local item_index = "g_goldnugget_level"
    local max_level = staff_item["goldnugget"]
    local current_level = inst[item_index]
    if current_level >= max_level then
        return false
    end
    inst[item_index] = math["min"](current_level + count, max_level)
    updateStaffAbility(inst)
    return true
end
local function addStaffTrader(inst)
    inst:AddComponent("trader")
    local trader_com = inst["components"]["trader"]
    trader_com["acceptnontradable"] = true
    trader_com:SetAcceptTest(function(_inst, items, player)
        local check_item = checkItemStaff(_inst, items, player)
        return check_item
    end)
    trader_com["onaccept"] = function(_inst, player, items)
        updateStafflevel(_inst, items, player)
    end
    trader_com["onrefuse"] = function(_inst, giver, item)
        local is_success, message = checkItemStaff(_inst, item, giver)
        if not is_success then
            HH_UTILS:HHSay(giver, tostring(message))
        end
    end
    local oldAcceptGift = trader_com["AcceptGift"]
    trader_com["AcceptGift"] = function(self, giver, item, count, ...)
        if item and item["prefab"] == "goldnugget" and HH_UTILS:HasComponents(item, "stackable") then
            if not self:AbleToAccept(item, giver, count) then
                return false
            end
            if self:WantsToAccept(item, giver, count) then
                local staff_inst = self["inst"]
                local gold_num = item["components"]["stackable"]["stacksize"] or 1
                local current_level = staff_inst["g_goldnugget_level"] or 0
                local max_level = staff_item["goldnugget"]
                local need_num = max_level - current_level
                local add_level = 0
                if gold_num >= need_num then
                    add_level = need_num
                else
                    add_level = gold_num
                end
                local success = updateGoldLevel(staff_inst, giver, add_level)
                if success then
                    local current_gold_num = gold_num - add_level
                    if current_gold_num <= 0 then
                        item:Remove()
                    else
                        item["components"]["stackable"]:SetStackSize(current_gold_num)
                    end
                else
                    return false
                end
                self["inst"]:PushEvent("trade", { ["giver"] = giver, ["item"] = item })
                return true
            end
        end
        return oldAcceptGift(self, giver, item, count, ...)
    end
end
local function save_staff(inst, save_data)
    if save_data then
        save_data["g_goldnugget_level"] = inst["g_goldnugget_level"]
        save_data["g_purebrilliance_level"] = inst["g_purebrilliance_level"]
        save_data["g_horrorfuel_level"] = inst["g_horrorfuel_level"]
        save_data["g_deerclops_eyeball_level"] = inst["g_deerclops_eyeball_level"]
        save_data["g_cane_level"] = inst["g_cane_level"]
    end
end
local function load_staff(inst, save_data)
    if save_data then
        inst["g_goldnugget_level"] = save_data["g_goldnugget_level"] or 0
        inst["g_purebrilliance_level"] = save_data["g_purebrilliance_level"] or 0
        inst["g_horrorfuel_level"] = save_data["g_horrorfuel_level"] or 0
        inst["g_deerclops_eyeball_level"] = save_data["g_deerclops_eyeball_level"] or 0
        inst["g_cane_level"] = save_data["g_cane_level"] or 0
        updateStaffAbility(inst)
    end
end
local function weaponStaffFn(inst)
    inst:AddComponent("named")
    inst:AddComponent("equippable")
    inst["components"]["equippable"]["restrictedtag"] = "gentleness"
    inst["components"]["equippable"]:SetOnEquip(staffEquip)
    inst["components"]["equippable"]:SetOnUnequip(staffUnEquip)
    inst:AddComponent("weapon")
    inst["components"]["weapon"]:SetRange(staff_range, staff_range + 2.5)
    inst["components"]["weapon"]:SetDamage(staff_damage)
    inst["components"]["weapon"]:SetProjectile("gentleness_project")
    inst["components"]["weapon"]:SetOnAttack(function(inst, attacker, target)
        local hh_g_purebrilliance_level = handleStaffLevel(inst, "g_purebrilliance_level")
        if hh_g_purebrilliance_level <= 0 then
            return
        end
        if attacker and target and HH_UTILS:NotIsDead(target)
                and HH_UTILS:HasComponents(attacker, "combat")
                and HH_UTILS:HasComponents(target, "combat")
                and HH_UTILS:CanHitTarget(attacker, target) then
            local hh_current_health = target["components"]["health"]["currenthealth"]
            local percent_num = math["min"](hh_g_purebrilliance_level * 0.02 / 100, 0.01)
            target["components"]["combat"]:GetAttacked(attacker, hh_current_health * percent_num)
        end
    end)
    inst:AddComponent("planardamage")
    inst["components"]["planardamage"]:SetBaseDamage(0)
    hookProject(inst)
    inst["g_goldnugget_level"] = 0

    inst["g_purebrilliance_level"] = 0

    inst["g_horrorfuel_level"] = 0

    inst["g_deerclops_eyeball_level"] = 0

    inst["g_cane_level"] = 0
    addStaffTrader(inst)
    inst["OnSave"] = save_staff
    inst["OnLoad"] = load_staff
end

local machine_item_list = {
    "gentleness_box_spring_a",
    "gentleness_box_spring_b",
    "gentleness_box_spring_c",
    "gentleness_box_spring_d",
    "gentleness_box_spring_e",
    "gentleness_box_spring_f",
    "gentleness_box_spring_g",
    "gentleness_box_spring_h",
    "gentleness_box_christmas_a",
    "gentleness_box_christmas_b",
    "gentleness_box_christmas_c",
    "gentleness_box_christmas_d",
    "gentleness_box_christmas_e",
    "gentleness_box_christmas_f",
    "gentleness_box_christmas_g",
    "gentleness_box_christmas_h",
    "gentleness_box_valentine_a",
    "gentleness_box_valentine_b",
    "gentleness_box_valentine_c",
    "gentleness_box_valentine_d",
    "gentleness_box_valentine_e",
    "gentleness_box_new_year_a",
    "gentleness_box_new_year_b",
    "gentleness_box_new_year_c",
    "gentleness_box_new_year_d",
    "gentleness_box_new_year_e",
    "gentleness_box_new_year_f",
    "gentleness_box_new_year_g",
    "gentleness_box_new_year_h",
    "gentleness_box_halloween_a",
    "gentleness_box_halloween_b",
    "gentleness_box_halloween_c",
    "gentleness_box_halloween_d",
    "gentleness_box_halloween_e",
    "gentleness_box_halloween_f",
    "gentleness_box_halloween_g",
    "gentleness_box_halloween_h",
}
local function machineCheckAcceptFn(inst, items, player)
    return items and items["prefab"] == "gentleness_coin" and not inst["g_is_trader_task"] or false
end
local machine_food_list = {
    "gentleness_food_yan",
    "gentleness_food_tian",
    "gentleness_food_you",
}
local function machineSpawnBox(inst)
    if not inst["g_is_trader_task"] then
        return
    end
    if not inst["g_save_chance"] then
        inst["g_save_chance"] = 0
    end
    local add_chance = inst["g_save_chance"] * 5 / 100
    local current_chance = 0.05 + add_chance
    local random_num = math["random"]()
    if random_num <= current_chance then
        inst["g_save_chance"] = 0
        local random_index = math["random"](1, #machine_item_list)
        local box_id = machine_item_list[random_index]
        local box_spawn = SpawnPrefab(box_id)
        local x, y, z = inst["Transform"]:GetWorldPosition()
        if box_spawn and box_spawn["Transform"] then
            box_spawn["Transform"]:SetPosition(x, 4, z)
            local random_angle = math["random"](1, 360)
            launchItem(box_spawn, random_angle)
        end
    else
        local box_spawn = SpawnPrefab(machine_food_list[math["random"](1, #machine_food_list)])
        local x, y, z = inst["Transform"]:GetWorldPosition()
        if box_spawn and box_spawn["Transform"] then
            box_spawn["Transform"]:SetPosition(x, 4, z)
            local random_angle = math["random"](1, 360)
            launchItem(box_spawn, random_angle)
        end
        inst["g_save_chance"] = inst["g_save_chance"] + 1
    end
    HH_UTILS:HHKillTask(inst, "g_is_trader_task")
end
local function machineAcceptFn(inst, player, items)
    if inst["g_is_trader_task"] then
        return
    end
    inst["AnimState"]:PlayAnimation("choujiang_1")
    inst["AnimState"]:PushAnimation("idle")
    inst["g_is_trader_task"] = inst:DoPeriodicTask(4.5, function(machine)
        if not machine or not machine["AnimState"] then
            HH_UTILS:HHKillTask(machine, "g_is_trader_task")
            return
        end
        machineSpawnBox(machine)
    end)
end
local function machineRefuseFn(inst, giver, item)
    if inst["g_is_trader_task"] then
        HH_UTILS:HHSay(giver, "等上一个抽完")
    else
        HH_UTILS:HHSay(giver, "请投入沙币")
    end
end
local function hitMachineFn(inst)
    inst["AnimState"]:PlayAnimation("hit")
    inst["AnimState"]:PushAnimation("idle")
    machineSpawnBox(inst)
end
local function save_machine(inst, save_data)
    if save_data then
        save_data["g_save_chance"] = inst["g_save_chance"]
    end
end
local function load_machine(inst, save_data)
    if save_data then
        inst["g_save_chance"] = save_data["g_save_chance"] or 0
    end
end
local function addMachineFn(inst)
    addComWorkable(inst)
    inst["components"]["workable"]:SetOnWorkCallback(hitMachineFn)
    inst:AddComponent("trader")

    inst["components"]["trader"]:SetAcceptTest(machineCheckAcceptFn)
    inst["components"]["trader"]["onaccept"] = machineAcceptFn
    inst["components"]["trader"]["onrefuse"] = machineRefuseFn
    inst["g_save_chance"] = 0
    inst["OnSave"] = save_machine
    inst["OnLoad"] = load_machine
end

local function OnUpgrade(inst, performer, upgraded_from_item)
    local numupgrades = inst["components"]["upgradeable"]["numupgrades"]
    if numupgrades == 1 then
        inst["_chestupgrade_stacksize"] = true
        if inst["components"]["container"] ~= nil then
            -- NOTES(JBK): The container component goes away in the burnt load but we still want to apply builds.
            inst["components"]["container"]:Close()
            inst["components"]["container"]:EnableInfiniteStackSize(true)
        end
        if upgraded_from_item then
            local x, y, z = inst["Transform"]:GetWorldPosition()
            local fx = SpawnPrefab("chestupgrade_stacksize_fx")
            if fx then
                fx["Transform"]:SetPosition(x, y, z)
            end
        end
    end
    inst["components"]["upgradeable"]["upgradetype"] = nil
    if inst["components"]["lootdropper"] ~= nil then
        inst["components"]["lootdropper"]:SetLoot({ "alterguardianhatshard" })
    end
end
local function regular_OnLoad(inst, data, newents)
    if inst["components"]["upgradeable"] ~= nil and inst["components"]["upgradeable"]["numupgrades"] > 0 then
        OnUpgrade(inst)
    end
end

local function regular_ShouldCollapse(inst)
    if inst["components"]["container"] and inst["components"]["container"]["infinitestacksize"] then
        local overstacks = 0
        for k, v in pairs(inst["components"]["container"]["slots"]) do
            local stackable = v["components"]["stackable"]
            if stackable then
                overstacks = overstacks + math["ceil"](stackable:StackSize() / (stackable["originalmaxsize"] or stackable["maxsize"]))
                if overstacks >= TUNING["COLLAPSED_CHEST_EXCESS_STACKS_THRESHOLD"] then
                    return true
                end
            end
        end
    end
    return false
end

local function regular_OnDecontructStructure(inst, caster)
    if inst["components"]["upgradeable"] ~= nil and inst["components"]["upgradeable"]["numupgrades"] > 0 then
        if inst["components"]["lootdropper"] ~= nil then
            inst["components"]["lootdropper"]:SpawnLootPrefab("alterguardianhatshard")
        end
    end
    if regular_ShouldCollapse(inst) then
        inst["components"]["container"]:DropEverythingUpToMaxStacks(TUNING["COLLAPSED_CHEST_MAX_EXCESS_STACKS_DROPS"])
        if not inst["components"]["container"]:IsEmpty() then
            inst["no_delete_on_deconstruct"] = true
            return
        end
    end
    inst["no_delete_on_deconstruct"] = nil
end

local function chestCanUpdate(inst)
    --local upgradeable = inst:AddComponent("upgradeable")
    --upgradeable["upgradetype"] = UPGRADETYPES["CHEST"]
    --upgradeable:SetOnUpgradeFn(OnUpgrade)
    --inst:ListenForEvent("ondeconstructstructure", regular_OnDecontructStructure)
    --inst["OnLoad"] = regular_OnLoad
    inst["components"]["container"]:EnableInfiniteStackSize(true)
end
local function showChestItemImage(inst)
    if not HH_UTILS:HasComponents(inst, "container") then
        return
    end
    if inst["components"]["container"]:IsEmpty() then
        inst["AnimState"]:Hide("show_item")
        inst["AnimState"]:Hide("show_item_back")
        return
    end
    local com_container = inst["components"]["container"]
    local slot_num = com_container:GetNumSlots()
    if not HH_UTILS:IsHHType(slot_num, "number") or slot_num <= 0 then
        return
    end
    local can_show = false
    for i = 1, slot_num do
        local item = com_container:GetItemInSlot(i)
        if HH_UTILS:HasComponents(item, "inventoryitem") then
            local atlas, bgimage, bgatlas
            local image = FunctionOrValue(item["drawimageoverride"], item, inst)
                    or (#(item["components"]["inventoryitem"]["imagename"] or "") > 0 and item["components"]["inventoryitem"]["imagename"])
                    or item["prefab"] or nil
            if image ~= nil then
                atlas = FunctionOrValue(item["drawatlasoverride"], item, inst)
                        or (#(item["components"]["inventoryitem"]["atlasname"] or "") > 0 and item["components"]["inventoryitem"]["atlasname"]) or nil
                if item["inv_image_bg"] ~= nil and item["inv_image_bg"]["image"] ~= nil and item["inv_image_bg"]["image"]:len() > 4 and item["inv_image_bg"]["image"]:sub(-4):lower() == ".tex" then
                    bgimage = item["inv_image_bg"]["image"]:sub(1, -5)
                    bgatlas = item["inv_image_bg"]["atlas"] ~= GetInventoryItemAtlas(item["inv_image_bg"]["image"]) and item["inv_image_bg"]["atlas"] or nil
                end
                if atlas ~= nil then
                    atlas = resolvefilepath_soft(atlas)
                end
                inst["AnimState"]:Show("show_item")
                inst["AnimState"]:OverrideSymbol("show_item", atlas or GetInventoryItemAtlas(image .. ".tex"), image .. ".tex")
                can_show = true
                if bgimage ~= nil then
                    if bgatlas ~= nil then
                        bgatlas = resolvefilepath_soft(bgatlas)
                    end
                    inst["AnimState"]:Show("show_item_back")
                    inst["AnimState"]:OverrideSymbol("show_item_back", bgatlas or GetInventoryItemAtlas(bgimage .. ".tex"), bgimage .. ".tex")
                else
                    inst["AnimState"]:Hide("show_item_back")
                end
            end
            break
        end

    end
    if not can_show then
        inst["AnimState"]:Hide("show_item")
        inst["AnimState"]:Hide("show_item_back")
    end
end

local function addChestSlotImage(inst)
    inst["AnimState"]:Hide("show_item")
    inst["AnimState"]:Hide("show_item_back")
    inst:ListenForEvent("itemget", showChestItemImage)
    inst:ListenForEvent("itemlose", showChestItemImage)
end
local GroundTiles = require("worldtiledefs")
-----------茉莉团团
local function startsWithTurf(str)
    return string["match"](str, "^turf_") ~= nil
end
local function weaponTitleStaffFn(inst)
    inst:AddComponent("equippable")
    inst["components"]["equippable"]["restrictedtag"] = "gentleness"
    inst["components"]["equippable"]:SetOnEquip(function(_inst, owner)
        owner["AnimState"]:Show("ARM_carry")
        owner["AnimState"]:Hide("ARM_normal")
        owner["AnimState"]:OverrideSymbol("swap_object", "gentleness_fan", "gentleness_fan")
        if _inst["components"]["container"] ~= nil then
            _inst["components"]["container"]:Open(owner)
        end
        HH_UTILS:HHRemoveFx(owner, "g_add_light_fx")
        owner["g_add_light_fx"] = SpawnPrefab("gentleness_turf_staff_light")
        if owner["g_add_light_fx"] then
            owner["g_add_light_fx"]["entity"]:SetParent(owner["entity"])
        end
    end)
    inst["components"]["equippable"]:SetOnUnequip(function(_inst, owner)
        owner["AnimState"]:Hide("ARM_carry")
        owner["AnimState"]:Show("ARM_normal")
        if _inst["components"]["container"] ~= nil then
            _inst["components"]["container"]:Close()
        end
        HH_UTILS:HHRemoveFx(owner, "g_add_light_fx")
    end)
    inst["components"]["equippable"]["walkspeedmult"] = 1.25
    inst:AddComponent("weapon")
    inst["components"]["weapon"]:SetRange(1)
    inst["components"]["weapon"]:SetDamage(17)
    inst:AddComponent("spellcaster")
    --右键拆解
    inst["components"]["spellcaster"]:SetSpellFn(function(hh_inst, target, pos, caster)
        if not HH_UTILS:IsHHType(GroundTiles, "table") or not HH_UTILS:IsHHType(GroundTiles["turf"], "table") then
            HH_UTILS:HHSay(caster, "读取地皮常量错误")
            return
        end
        local all_turf_config = GroundTiles["turf"]

        if target and target:IsValid() then
            pos = target:GetPosition()
        end
        if not HH_UTILS:IsHHType(pos, "table") or not pos["Get"] then
            return
        end
        local targetTile = TheWorld["Map"]:GetTileAtPoint(pos["x"], pos["y"], pos["z"])
        --print("地皮编号", targetTile)
        local hh_slot_item = hh_inst["components"]["container"]:GetItemInSlot(1)
        if not HH_UTILS:IsHHType(hh_slot_item, "table") or not hh_slot_item["prefab"] then
            HH_UTILS:HHSay(caster, "请放入地皮进行操作")
            return
        end
        local item_id = hh_slot_item["prefab"]
        if not (startsWithTurf(item_id) or item_id == "gentleness_food_yan") then
            HH_UTILS:HHSay(caster, "容器内非常规地皮/茉嫣，无法操作")
            return
        end
        local base_turf_id = WORLD_TILES["QUAGMIRE_SOIL"]
        local can_replace = false
        if item_id == "gentleness_food_yan" then
            can_replace = true
            base_turf_id = WORLD_TILES["OCEAN_COASTAL"]
        else

            for i, v in pairs(all_turf_config) do
                if HH_UTILS:IsHHType(v, "table") and HH_UTILS:IsHHType(v["name"], "string") then
                    if item_id == ("turf_" .. v["name"]) and i then
                        can_replace = true
                        base_turf_id = i
                        break
                    end
                end
            end
        end
        if not can_replace then
            HH_UTILS:HHSay(caster, "常规地皮库中未查询到对应地皮")
            return
        end
        if targetTile > 255 then
            HH_UTILS:HHSay(caster, "无法虚空拓展")
            return
        end
        if targetTile == base_turf_id then
            HH_UTILS:HHSay(caster, "同一个地皮无法进行替换")
            return
        end
        local x, y = TheWorld["Map"]:GetTileCoordsAtPoint(pos:Get())
        TheWorld["Map"]:SetTile(x, y, base_turf_id)
        if HH_UTILS:HasComponents(hh_slot_item, "stackable") and hh_slot_item["components"]["stackable"]:IsStack() then
            hh_slot_item["components"]["stackable"]:Get():Remove()
        else
            hh_slot_item:Remove()
        end
    end)
    inst["components"]["spellcaster"]["canuseontargets"] = true
    inst["components"]["spellcaster"]["canuseonpoint"] = true
    inst["components"]["spellcaster"]["canuseonpoint_water"] = true
    inst["components"]["spellcaster"]["quickcast"] = true
end
---------------------------------------------------------------------
local inst_config = {
    --工具
    ["gentleness_cat_land_test_a"] = { ["name"] = "原点_a", },
    ["gentleness_cat_land_test_b"] = { ["name"] = "原点_b", },
    ["gentleness_cat_land_test_c"] = { ["name"] = "原点_c", },
    ["gentleness_cat_land_test_d"] = { ["name"] = "原点_d", },
}
local function createChildPrefab(data)
    local hh_name = data["name"] or "--"
    local hh_color = data["color"] or { 1, 1, 1 }
    local hh_scale = data["scale"] or 16
    local inst = CreateEntity()
    inst["entity"]:AddTransform()
    inst["entity"]:AddLabel()
    inst:AddTag("CLASSIFIED")
    inst:AddTag("NOCLICK")

    inst["Label"]:SetFontSize(hh_scale)
    inst["Label"]:SetFont(CODEFONT)
    inst["Label"]:SetWorldOffset(0, 2, 0)
    inst["Label"]:SetUIOffset(0, 2, 0)
    inst["Label"]:Enable(true)
    inst["Label"]:SetText(tostring(hh_name))
    inst["Label"]:SetColour(unpack(hh_color))
    inst["persists"] = false
    return inst
end
---------------------------------------------------------------------
--猫咪帐篷
local function PlaySleepLoopSoundTask(inst, stopfn)
    if inst["SoundEmitter"] then
        inst["SoundEmitter"]:PlaySound("dontstarve/common/tent_sleep")
    end
end

local function onignite(inst)
    inst["components"]["sleepingbag"]:DoWakeUp()
end
local function OnFinishedSound(inst)
    if inst["SoundEmitter"] then
        inst["SoundEmitter"]:PlaySound("dontstarve/common/tent_dis_twirl")
    end
end
local function StopSleepSound(inst)
    if inst["sleep_tasks"] ~= nil then
        for i, v in ipairs(inst["sleep_tasks"]) do
            v:Cancel()
        end
        inst["sleep_tasks"] = nil
    end
end
local function StartSleepSound(inst, len)
    StopSleepSound(inst)
    inst["sleep_tasks"] = {
        inst:DoPeriodicTask(len, PlaySleepLoopSoundTask, 33 * FRAMES),
        inst:DoPeriodicTask(len, PlaySleepLoopSoundTask, 47 * FRAMES),
    }
end
local function DoDeltaTentValue(player)
    if not HH_UTILS:NotIsDead(player) then
        return
    end
    if HH_UTILS:HasComponents(player, "gentleness_magic") then
        player["components"]["gentleness_magic"]:DoDelta(10)
    end
    --恢复血上限
    if HH_UTILS:HasComponents(player, "health") then
        --player["components"]["health"]:DoDelta(5)
        player["components"]["health"]:DeltaPenalty(-5)
    end
    --if HH_UTILS:HasComponents(player, "sanity") then
    --    player["components"]["sanity"]:DoDelta(5)
    --end
end
local function OnSleepCatTent(_inst, sleeper)
    sleeper:ListenForEvent("onignite", onignite, _inst)
    if _inst["sleep_anim"] ~= nil then
        _inst["AnimState"]:PlayAnimation(_inst["sleep_anim"], true)
        StartSleepSound(_inst, _inst["AnimState"]:GetCurrentAnimationLength())
    end
    HH_UTILS:HHKillTask(sleeper, "g_tent_task")
    sleeper["g_tent_task"] = sleeper:DoPeriodicTask(1, DoDeltaTentValue)
end
local function OnWakeCatTent(inst, sleeper, nostatechange)
    sleeper:RemoveEventCallback("onignite", onignite, inst)

    if inst["sleep_anim"] ~= nil then
        inst["AnimState"]:PushAnimation("idle", true)
        StopSleepSound(inst)
    end
    HH_UTILS:HHKillTask(sleeper, "g_tent_task")
    inst["components"]["finiteuses"]:Use()
end
--睡的定时任务
local function TemperatureTickCatTent(inst, sleeper)
    if sleeper["components"]["temperature"] ~= nil then
        if inst["is_cooling"] then
            if sleeper["components"]["temperature"]:GetCurrent() > TUNING["SLEEP_TARGET_TEMP_TENT"] then
                sleeper["components"]["temperature"]:SetTemperature(sleeper["components"]["temperature"]:GetCurrent() - TUNING["SLEEP_TEMP_PER_TICK"])
            end
        elseif sleeper["components"]["temperature"]:GetCurrent() < TUNING["SLEEP_TARGET_TEMP_TENT"] then
            sleeper["components"]["temperature"]:SetTemperature(sleeper["components"]["temperature"]:GetCurrent() + TUNING["SLEEP_TEMP_PER_TICK"])
        end
    end
end

local function OnBuiltCatTent(inst)
    inst["AnimState"]:PlayAnimation("place")
    inst["AnimState"]:PushAnimation("idle", true)
    inst["SoundEmitter"]:PlaySound("dontstarve/common/tent_craft")
end

local function OnSaveCatTent(inst, data)
    if inst:HasTag("burnt") or (inst["components"]["burnable"] ~= nil and inst["components"]["burnable"]:IsBurning()) then
        data["burnt"] = true
    end
end

local function OnLoadCatTent(inst, data)
    if data ~= nil and data["burnt"] then
        inst["components"]["burnable"]["onburnt"](inst)
    end
end
--破损修复映射
local construction_data = {
    ["gentleness_fountain_broken"] = "gentleness_fountain",
    ["gentleness_cat_swing_broken"] = "gentleness_cat_swing",
    ["gentleness_andwobble_broken"] = "gentleness_andwobble",
    ["gentleness_carousel_broken"] = "gentleness_carousel",
}
CONSTRUCTION_PLANS["gentleness_fountain_broken"] = {
    Ingredient("ice", 20),
    Ingredient("cutstone", 20),
    Ingredient("fireflies", 20),
}
CONSTRUCTION_PLANS["gentleness_cat_swing_broken"] = {
    Ingredient("transistor", 5),
    Ingredient("gentleness_coin", 5),
    Ingredient("marble", 5),
}
CONSTRUCTION_PLANS["gentleness_andwobble_broken"] = {
    Ingredient("transistor", 2),
    Ingredient("gentleness_coin", 2),
    Ingredient("marble", 2),
}
CONSTRUCTION_PLANS["gentleness_carousel_broken"] = {
    Ingredient("transistor", 10),
    Ingredient("gentleness_coin", 10),
    Ingredient("marble", 10),
}

local function repairBuild(_inst, doer)
    if not HH_UTILS:IsHHType(CONSTRUCTION_PLANS[_inst["prefab"]], "table") then
        return
    end
    local recipe_list = CONSTRUCTION_PLANS[_inst["prefab"]]
    local concluded = true
    for _, v in ipairs(recipe_list) do
        --读容器内道具数量
        if _inst["components"]["constructionsite"]:GetMaterialCount(v["type"]) < v["amount"] then
            concluded = false
            break
        end
    end
    if concluded then
        local new_house = ReplacePrefab(_inst, _inst["_construction_product"])
        local x, y, z = _inst.Transform:GetWorldPosition()
        local base_fx = "collapse_big"
        if _inst["g_is_small_fx"] then
            base_fx = "collapse_small"
        end
        local spawn_fx = SpawnPrefab(base_fx)
        if spawn_fx and spawn_fx["Transform"] then
            spawn_fx["Transform"]:SetPosition(x, y, z)
        end
    end
end

local function onRemoveChair(inst)
    if HH_UTILS:NotIsDead(inst["user"]) and inst["user"]["sg"] and inst["user"]["sg"]:HasStateTag("gentleness_sit") then
        local player = inst["user"]
        player["sg"]["statemem"]["sittarget"] = nil
        player:GoToState("idle")
    end
end
---双人猫咪秋千
local function checkSwingPlayer(inst)
    if not HH_UTILS:IsHHType(inst["g_sit_players"], "table") then
        return false
    end
    local current_players = inst["g_sit_players"]
    --人满啦
    if current_players["left"] and current_players["right"] then
        return false
    end
    return true
end
local function getSwingSitPlayer(inst, sit_type)
    if not HH_UTILS:IsHHType(inst["g_sit_players"], "table") then
        return nil
    end
    local current_players = inst["g_sit_players"]
    return current_players[sit_type]
end
local function addSwingPlayer(inst, player)
    if not HH_UTILS:IsHHType(inst["g_sit_players"], "table") then
        return
    end
    if not inst["g_sit_players"]["left"] then
        inst["g_sit_players"]["left"] = player
        return
    end
    if not inst["g_sit_players"]["right"] then
        inst["g_sit_players"]["right"] = player
        return
    end
    --print("坐玩家")
    --HH_UTILS:HHPrint(inst["g_sit_players"])
end

local function removeSwingPlayer(inst, player, sit_type)
    if player and HH_UTILS:NotIsDead(player) and player["sg"] and player["sg"]:HasStateTag("gentleness_sit_swing") then
        player["sg"]["statemem"]["sittarget"] = nil
        player["sg"]:GoToState("idle")
        if HH_UTILS:IsHHType(inst["g_sit_players"], "table") then
            inst["g_sit_players"][sit_type] = nil
        end
    end
end
local function OnRemovePlayer(inst)
    local left_player = getSwingSitPlayer(inst, "left")
    local right_player = getSwingSitPlayer(inst, "right")
    removeSwingPlayer(inst, left_player, "left")
    removeSwingPlayer(inst, right_player, "right")
end
local function updateSwingAnim(_inst)
    local player_left = getSwingSitPlayer(_inst, "left")
    local player_right = getSwingSitPlayer(_inst, "right")
    local anim_name = "idle"
    if player_right and player_left then
        anim_name = "idle_f"
    elseif player_right and not player_left then
        anim_name = "idle_r"
    elseif player_left and not player_right then
        anim_name = "idle_l"
    else
        anim_name = "idle"
    end
    --print("更新", anim_name)
    --HH_UTILS:HHPrint(_inst["g_sit_players"])
    _inst["AnimState"]:PlayAnimation(anim_name)

end

------------------------------------------2025-------------------------------------
require("prefabutil")
local cooking = require("cooking")
local function GetRecipe(prefab)
    if HH_UTILS:IsHHType(cooking["recipes"], "table") then
        for cooker, recipes in pairs(cooking["recipes"]) do
            if HH_UTILS:IsHHType(recipes, "table") and recipes[prefab] then
                return recipes[prefab]
            end
        end
    end
    return nil
end

local function IsModCook(prefab)
    if HH_UTILS:IsHHType(cooking["recipes"], "table") then
        for cooker, recipes in pairs(cooking["recipes"]) do
            if IsModCookingProduct(cooker, prefab) then
                return true
            end
        end
    end
    return false
end
local function getFoodBuild(item)
    --神话
    if HH_UTILS:IsHHType(item["Get_Myth_Food_Table"], "function") then
        return item:Get_Myth_Food_Table()
    end
    local food_id = item["prefab"]
    --是调过味的把id裁成原料理id
    if item:HasTag("spicedfood") then
        local recipe = GetRecipe(item["prefab"])
        if not HH_UTILS:IsHHType(recipe, "table") then
            return nil, nil, nil
        end
        local start = string["find"](food_id, "_spice")
        if start ~= nil then
            food_id = string["sub"](food_id, 1, start - 1)
        end
    end
    local recipe = GetRecipe(food_id)
    local build = (recipe ~= nil and recipe["overridebuild"]) or "cook_pot_food"
    local overridesymbol = (recipe ~= nil and recipe["overridesymbolname"]) or food_id
    return build, overridesymbol, nil
end

local function addComTurf(inst, turf_id, is_server)
    if not is_server then
        inst["tile"] = WORLD_TILES[string["upper"](turf_id)]
        MakeInventoryPhysics(inst)
        MakeInventoryFloatable(inst, "med", 0.3, 0.8)
        inst:AddTag("groundtile")
        inst:AddTag("molebait")
    else
        addStackCom(inst, TUNING["STACK_SIZE_SMALLITEM"])
        inst:AddComponent("bait")
        inst:AddComponent("fuel")
        inst["components"]["fuel"]["fuelvalue"] = TUNING["TINY_FUEL"]
        inst:AddComponent("deployable")
        inst["components"]["deployable"]:SetDeployMode(DEPLOYMODE["TURF"])
        inst["components"]["deployable"]["ondeploy"] = function(_inst, pt, deployer)
            if deployer ~= nil and deployer["SoundEmitter"] ~= nil then
                deployer["SoundEmitter"]:PlaySound("dontstarve/wilson/dig")
            end
            local map = TheWorld["Map"]
            local x, y = map:GetTileCoordsAtPoint(pt:Get())
            map:SetTile(x, y, WORLD_TILES[string["upper"](turf_id)])
            _inst["components"]["stackable"]:Get():Remove()
        end
        inst["components"]["deployable"]:SetUseGridPlacer(true)
    end
end
------------------------茉莉描述---------------------------
local function getJasmineDesc()
    local table_length = #TUNING["GENTLENESS_JASMINE_DESC"]
    local random_index = math["random"](1, table_length)
    return TUNING["GENTLENESS_JASMINE_DESC"][random_index] or "再见，就是一定会再次相见"
end
------------------------茉莉描述---------------------------
local HH_PREFAB = {


    ["gentleness_plant"] = {
        ["client_fn"] = book_client,
        ["server_fn"] = function(inst)
            inst["persists"] = false

            inst["OnBuiltFn"] = magic_plant
        end,
    },

    ["gentleness_fertilizer"] = {
        ["client_fn"] = book_client,
        ["server_fn"] = function(inst)
            inst["persists"] = false
            inst["OnBuiltFn"] = magic_fertilizer
        end,
    },

    ["gentleness_rain"] = {
        ["client_fn"] = book_client,
        ["server_fn"] = function(inst)
            inst["persists"] = false
            inst["OnBuiltFn"] = magic_rain
        end,
    },

    ["gentleness_bird"] = {
        ["client_fn"] = book_client,
        ["server_fn"] = function(inst)
            inst["persists"] = false
            inst["OnBuiltFn"] = magic_bird
        end,
    },

    ["gentleness_sleep"] = {
        ["client_fn"] = book_client,
        ["server_fn"] = function(inst)
            inst["persists"] = false
            inst["OnBuiltFn"] = magic_sleep
        end,
    },

    ["gentleness_moon"] = {
        ["client_fn"] = book_client,
        ["server_fn"] = function(inst)
            inst["persists"] = false
            inst["OnBuiltFn"] = magic_black_moon
        end,
    },

    ["gentleness_fish"] = {
        ["client_fn"] = book_client,
        ["server_fn"] = function(inst)
            inst["persists"] = false
            inst["OnBuiltFn"] = magic_fish
        end,
    },

    ["gentleness_lighting"] = {
        ["client_fn"] = book_client,
        ["server_fn"] = function(inst)
            inst["persists"] = false
            inst["OnBuiltFn"] = magic_lighting
        end,
    },


    ["gentleness_potion_mca"] = {
        ["assets"] = { Asset("ANIM", "anim/gentleness_potion.zip"), },
        ["xml"] = extra_xml,
        ["name"] = "茉纯爱", ["recipe_str"] = "三大谎言之流年恋爱篇", ["desc"] = "悬溺一响，流年登场",
        ["client_fn"] = replacePotion,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, extra_xml)
            inst:AddComponent("stackable")
            inst["components"]["stackable"]["maxsize"] = TUNING["STACK_SIZE_SMALLITEM"]
            inst:AddComponent("edible")
            inst["components"]["edible"]["healthvalue"] = 0
            inst["components"]["edible"]["hungervalue"] = 0
            inst["components"]["edible"]["sanityvalue"] = -30
            inst["components"]["edible"]["foodtype"] = "VEGGIE"
        end,
    },
    ["gentleness_potion_mgz"] = {
        ["assets"] = { Asset("ANIM", "anim/gentleness_potion.zip"), },
        ["xml"] = extra_xml,
        ["name"] = "茉瓜子", ["recipe_str"] = "三大谎言之秋梦篇", ["desc"] = "上厕所记得带个小被儿",
        ["client_fn"] = replacePotion,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, extra_xml)
            inst:AddComponent("stackable")
            inst["components"]["stackable"]["maxsize"] = TUNING["STACK_SIZE_SMALLITEM"]
            inst:AddComponent("edible")
            inst["components"]["edible"]["healthvalue"] = 0
            inst["components"]["edible"]["hungervalue"] = 150
            inst["components"]["edible"]["sanityvalue"] = 0
            inst["components"]["edible"]["foodtype"] = "VEGGIE"
            inst["components"]["edible"]["oneaten"] = function(_inst, eater)
                if not eater or not eater:HasTag("player") then
                    return
                end
                if HH_UTILS:HasComponents(eater, "debuffable") and HH_UTILS:NotIsDead(eater) then
                    eater["components"]["debuffable"]:AddDebuff("g_spawn_poop_buff", "g_spawn_poop_buff")
                end
            end
        end,
    },
    ["gentleness_potion_msh"] = {
        ["assets"] = { Asset("ANIM", "anim/gentleness_potion.zip"), },
        ["xml"] = extra_xml,
        ["name"] = "茉深海", ["recipe_str"] = "三大谎言之猴哥篇", ["desc"] = "我电脑装好就来玩饥荒",
        ["client_fn"] = replacePotion,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, extra_xml)
            inst:AddComponent("stackable")
            inst["components"]["stackable"]["maxsize"] = TUNING["STACK_SIZE_SMALLITEM"]
            inst:AddComponent("edible")
            inst["components"]["edible"]["healthvalue"] = 1
            inst["components"]["edible"]["hungervalue"] = 1
            inst["components"]["edible"]["sanityvalue"] = 1
            inst["components"]["edible"]["foodtype"] = "VEGGIE"
            inst["components"]["edible"]["oneaten"] = function(_inst, eater)
                if not eater or not eater:HasTag("player") then
                    return
                end
                if HH_UTILS:HasComponents(eater, "debuffable") and HH_UTILS:NotIsDead(eater) then
                    eater["components"]["debuffable"]:AddDebuff("g_no_target_buff", "g_no_target_buff")
                end
            end
        end,
    },
    ["gentleness_potion_mxc"] = {
        ["assets"] = { Asset("ANIM", "anim/gentleness_potion.zip"), },
        ["xml"] = extra_xml,
        ["name"] = "茉星辰", ["recipe_str"] = "三大谎言之宇浩篇", ["desc"] = "我5点半下班",
        ["client_fn"] = replacePotion,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, extra_xml)
            inst:AddComponent("stackable")
            inst["components"]["stackable"]["maxsize"] = TUNING["STACK_SIZE_SMALLITEM"]
            inst:AddComponent("edible")
            inst["components"]["edible"]["healthvalue"] = 1
            inst["components"]["edible"]["hungervalue"] = 1
            inst["components"]["edible"]["sanityvalue"] = 1
            inst["components"]["edible"]["foodtype"] = "VEGGIE"
            inst["components"]["edible"]["oneaten"] = function(_inst, eater)
                if not eater or not eater:HasTag("player") then
                    return
                end
                create_light(eater, "wormlight_light_lesser")
            end
        end,
    },
    ["gentleness_potion_msn"] = {
        ["assets"] = { Asset("ANIM", "anim/gentleness_potion.zip"), },
        ["xml"] = extra_xml,
        ["name"] = "茉蒜泥", ["recipe_str"] = "三大谎言之saber篇", ["desc"] = "我去吃个饭，一会儿就回来",
        ["client_fn"] = replacePotion,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, extra_xml)
            inst:AddComponent("stackable")
            inst["components"]["stackable"]["maxsize"] = TUNING["STACK_SIZE_SMALLITEM"]
            inst:AddComponent("edible")
            inst["components"]["edible"]["healthvalue"] = 0
            inst["components"]["edible"]["hungervalue"] = 30
            inst["components"]["edible"]["sanityvalue"] = 0
            inst["components"]["edible"]["foodtype"] = "VEGGIE"
            inst["components"]["edible"]["oneaten"] = function(_inst, eater)
                if not eater or not eater:HasTag("player") then
                    return
                end
                local random_num = math["random"]()
                if random_num > 0.01 then
                    return
                end

                local copy_table = HH_UTILS:HHCopyTable(World_MTL_POS)
                local pos_list = {}
                for i, v in pairs(copy_table) do
                    if HH_UTILS:IsHHType(v, "table") and v["x"] and v["y"] and v["z"] then
                        table["insert"](pos_list, {
                            retNum(v["x"]),
                            retNum(v["y"]),
                            retNum(v["z"]),
                        })
                    end
                end
                if #pos_list <= 0 then
                    HH_UTILS:HHSay(eater, "未查询到摩天轮")
                    return
                end
                local random_index = math["random"](1, #pos_list)
                if eater["Physics"] ~= nil then
                    eater["Physics"]:Teleport(unpack(pos_list[random_index]))
                else
                    eater["Transform"]:SetPosition(unpack(pos_list[random_index]))
                end
            end
        end,
    },


    ["gentleness_food_yan"] = {

        ["assets"] = com_assets,
        ["client_fn"] = replaceFoodClientFolder,
        ["server_fn"] = function(inst, name)
            addComFood(inst, { ["name"] = name,
                               ["health"] = 30,
                               ["hunger"] = 30,
                               ["sanity"] = 30,
                               ["magic"] = 30,
                               ["perishable_date"] = base_time * 4,
            })
        end,
    },
    ["gentleness_food_tian"] = {

        ["assets"] = com_assets,
        ["client_fn"] = replaceFoodClientFolder,
        ["server_fn"] = function(inst, name)
            addComFood(inst, { ["name"] = name,
                               ["health"] = 50,
                               ["hunger"] = 50,
                               ["sanity"] = 50,
                               ["magic"] = 50,
                               ["perishable_date"] = base_time * 2, })
        end,
    },
    ["gentleness_food_you"] = {

        ["assets"] = com_assets,
        ["client_fn"] = replaceFoodClientFolder,
        ["server_fn"] = function(inst, name)
            addComFood(inst, { ["name"] = name,
                               ["health"] = 150,
                               ["hunger"] = 150,
                               ["sanity"] = 150,
                               ["magic"] = 150,
                               ["perishable_date"] = base_time * 8 / 3, })
        end,
    },

    ["gentleness_drink_yang"] = {

        ["assets"] = com_assets,
        ["client_fn"] = replaceFoodClientFolder,
        ["server_fn"] = function(inst, name)
            addComFood(inst, { ["name"] = name,
                               ["not_need_perishable"] = true,
            })
            inst["components"]["edible"]["oneaten"] = function(_inst, eater)
                if not eater or not eater:HasTag("player") then
                    return
                end
                if HH_UTILS:HasComponents(eater, "debuffable") and HH_UTILS:NotIsDead(eater) then
                    eater["components"]["debuffable"]:AddDebuff("g_add_attack_buff", "g_add_attack_buff")
                end
            end
        end,
    },
    ["gentleness_drink_duo"] = {

        ["assets"] = com_assets,
        ["client_fn"] = replaceFoodClientFolder,
        ["server_fn"] = function(inst, name)
            addComFood(inst, { ["name"] = name,
                               ["not_need_perishable"] = true, })
            inst["components"]["edible"]["oneaten"] = function(_inst, eater)
                if not eater or not eater:HasTag("player") then
                    return
                end
                if HH_UTILS:HasComponents(eater, "debuffable") and HH_UTILS:NotIsDead(eater) then
                    eater["components"]["debuffable"]:AddDebuff("g_add_speed_buff", "g_add_speed_buff")
                end
            end
        end,
    },
    ["gentleness_drink_yuan"] = {

        ["assets"] = com_assets,
        ["client_fn"] = replaceFoodClientFolder,
        ["server_fn"] = function(inst, name)
            addComFood(inst, { ["name"] = name,
                               ["not_need_perishable"] = true, })
            inst["components"]["edible"]["oneaten"] = function(_inst, eater)
                if not eater or not eater:HasTag("player") then
                    return
                end
                if not HH_UTILS:HasComponents(eater, "gentleness_magic") then
                    return
                end
                if HH_UTILS:HasComponents(eater, "debuffable") and HH_UTILS:NotIsDead(eater) then
                    eater["components"]["debuffable"]:AddDebuff("g_add_magic_buff", "g_add_magic_buff")
                end
            end
        end,
    },


    ["gentleness_staff_cat"] = {

        ["assets"] = com_assets,
        ["xml"] = extra_xml,
        ["client_fn"] = function(inst, name)
            inst["entity"]:AddSoundEmitter()

            inst["AnimState"]:SetBank("gentleness_items")
            inst["AnimState"]:SetBuild("gentleness_items")
            inst["AnimState"]:PlayAnimation("idle")
            inst["AnimState"]:OverrideSymbol("base_folder", "gentleness_items", "gentleness_staff_color_cat_ground")
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "med", 0.3, 0.8)
            inst:AddTag("weapon")
            inst:AddTag("sharp")
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, extra_xml)
            weaponStaffFn(inst)
        end,
    },
    ["gentleness_project"] = {
        ["assets"] = { Asset("ANIM", "anim/gentleness_project.zip"), },
        ["client_fn"] = function(inst, name)
            MakeInventoryPhysics(inst)
            RemovePhysicsColliders(inst)
            inst["AnimState"]:SetBank("gentleness_project")
            inst["AnimState"]:SetBuild("gentleness_project")

            inst["AnimState"]:PlayAnimation("idle_color")
            inst:AddTag("projectile")
            inst:AddTag("FX")
            inst:AddTag("NOBLOCK")
            inst["Transform"]:SetScale(1.5, 1.5, 1.5)
        end,
        ["server_fn"] = function(inst, name)
            inst["persists"] = false
            inst:AddComponent("projectile")

            HH_UTILS:HookProject(inst["components"]["projectile"])
            inst["components"]["projectile"]:SetLaunchOffset(Vector3(0.8, 2.25, 0))
            inst["components"]["projectile"]:SetSpeed(15)
            inst["components"]["projectile"]["onhit"] = function(inst, owner, target)
                local spawn_fx = SpawnPrefab("gentleness_hit_fx")
                if target and spawn_fx then
                    local x, y, z = target["Transform"]:GetWorldPosition()
                    spawn_fx["Transform"]:SetPosition(x, y + 1, z)
                end
                inst:Remove()
            end
            inst["components"]["projectile"]:SetOnMissFn(inst["Remove"])

            inst["components"]["projectile"]:SetStimuli("fire")
        end,
    },
    ["gentleness_hit_fx"] = {
        ["assets"] = { Asset("ANIM", "anim/gentleness_hit_fx.zip"), },
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_hit_fx")
            inst["AnimState"]:SetBuild("gentleness_hit_fx")
            inst["AnimState"]:PlayAnimation("idle")
            inst:AddTag("FX")
            inst:AddTag("NOBLOCK")
        end,
        ["server_fn"] = function(inst, name)
            inst["persists"] = false
            inst:ListenForEvent("animover", function(_inst)
                _inst:Remove()
            end)
        end,
    },
    ["gentleness_magic_fx"] = {
        ["assets"] = { Asset("ANIM", "anim/gentleness_magic_fx.zip"), },
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_magic_fx")
            inst["AnimState"]:SetBuild("gentleness_magic_fx")
            inst["AnimState"]:PlayAnimation("idle")
            inst["AnimState"]:SetOrientation(ANIM_ORIENTATION["OnGround"])
            inst["AnimState"]:SetLayer(LAYER_BACKGROUND)
            inst["AnimState"]:SetSortOrder(3)
            inst:AddTag("CLASSIFIED")
            inst:AddTag("FX")
            inst:AddTag("NOBLOCK")
            inst["Transform"]:SetScale(1.3, 1.3, 1.3)
            inst["AnimState"]:SetDeltaTimeMultiplier(2)
        end,
        ["server_fn"] = function(inst, name)
            inst["persists"] = false
            --inst:ListenForEvent("animover", function(_inst)
            --    _inst:Remove()
            --end)
            inst:DoTaskInTime(1, function(_inst)
                _inst:Remove()
            end)
        end,
    },

    ["gentleness_staff_drop_fx"] = {
        ["assets"] = { Asset("ANIM", "anim/gentleness_project.zip"), },
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_project")
            inst["AnimState"]:SetBuild("gentleness_project")
            inst["AnimState"]:PlayAnimation("idle_color")
            inst["AnimState"]:SetBloomEffectHandle("shaders/anim.ksh")
            inst["Transform"]:SetScale(0.6, 0.6, 0.6)
            inst:AddTag("FX")
            inst:AddTag("NOBLOCK")
            inst:AddTag("gentleness_staff_drop_fx")
            MakeInventoryPhysics(inst)
            inst["entity"]:AddLight()
            inst["Light"]:SetRadius(0.4)
            inst["Light"]:SetFalloff(0.7)
            inst["Light"]:SetIntensity(0.65)
            inst["Light"]:SetColour(223 / 255, 208 / 255, 69 / 255)
            inst["Light"]:Enable(false)
        end,
        ["server_fn"] = function(inst, name)
            inst["persists"] = false
            inst["Light"]:Enable(true)
            inst:DoTaskInTime(1.5, inst["Remove"])
        end,
    },
    ["gentleness_weapon_flower_a"] = {
        ["assets"] = { Asset("ANIM", "anim/gentleness_weapon_flower.zip"), }, ["xml"] = com_item_xml,
        ["name"] = "手捧花", ["recipe_str"] = "我有六种形态哦", ["desc"] = "它能让我跑的更快",
        ["client_fn"] = function(inst, name)
            inst["entity"]:AddSoundEmitter()
            inst["AnimState"]:SetBank("gentleness_weapon_flower")
            inst["AnimState"]:SetBuild("gentleness_weapon_flower")
            inst["AnimState"]:PlayAnimation("idle")
            inst["AnimState"]:OverrideSymbol("gentleness_weapon_flower_idle_a", "gentleness_weapon_flower", "gentleness_weapon_flower_idle_a")
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "med", 0.3, 0.8)
            inst:AddTag("weapon")
            inst:AddTag("sharp")
            inst:AddTag("show_spoilage")
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, com_item_xml)
            --addPerishCom(inst, TUNING["PERISH_SUPERFAST"], "spoiled_food")

            inst:AddComponent("equippable")
            inst["components"]["equippable"]:SetOnEquip(function(weapon_inst, owner)
                local skin_build = GetItemSkinName(weapon_inst)
                owner["AnimState"]:OverrideSymbol("swap_object", "gentleness_weapon_flower", skin_build)
                owner["AnimState"]:Show("ARM_carry")
                owner["AnimState"]:Hide("ARM_normal")
            end)
            inst["components"]["equippable"]:SetOnUnequip(function(weapon_inst, owner)
                owner["AnimState"]:Hide("ARM_carry")
                owner["AnimState"]:Show("ARM_normal")
            end)
            inst["components"]["equippable"]["walkspeedmult"] = 1.25
            inst:AddComponent("weapon")
            inst["components"]["weapon"]:SetRange(1, 2)
            inst["components"]["weapon"]:SetDamage(17)
        end,
    },


    ["gentleness_tool_a"] = {
        ["assets"] = com_assets, ["xml"] = extra_xml,
        ["name"] = "茉莉柠木", ["recipe_str"] = "作为一名合格的打工人必备品", ["desc"] = "好用爱用天天用",
        ["client_fn"] = function(inst, name)
            inst["entity"]:AddSoundEmitter()
            inst["AnimState"]:SetBank("gentleness_items")
            inst["AnimState"]:SetBuild("gentleness_items")
            inst["AnimState"]:PlayAnimation("idle")
            inst["AnimState"]:OverrideSymbol("base_folder", "gentleness_items", "gentleness_tool_a_ground")
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "med", 0.3, 0.8)
            inst:AddTag("weapon")
            inst:AddTag("sharp")
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, extra_xml)
            inst:AddComponent("equippable")
            inst["components"]["equippable"]["restrictedtag"] = "gentleness"
            inst["components"]["equippable"]:SetOnEquip(function(weapon_inst, owner)
                local skin_build = GetItemSkinName(weapon_inst)
                owner["AnimState"]:OverrideSymbol("swap_object", "gentleness_items", skin_build)
                owner["AnimState"]:Show("ARM_carry")
                owner["AnimState"]:Hide("ARM_normal")
            end)
            inst["components"]["equippable"]:SetOnUnequip(function(weapon_inst, owner)
                owner["AnimState"]:Hide("ARM_carry")
                owner["AnimState"]:Show("ARM_normal")
            end)
            inst:AddComponent("weapon")
            inst["components"]["weapon"]:SetRange(1, 2)
            inst["components"]["weapon"]:SetDamage(17)
            inst["tool_index"] = 1
            inst:AddComponent("fishingrod")
            inst["components"]["fishingrod"]:SetWaitTimes(0, 1)
            inst["components"]["fishingrod"]:SetStrainTimes(0, 1)
            inst:AddComponent("named")
            inst["AcrRight"] = tool_use_fn
            inst["UpdateTool"] = update_tool_fn
            inst["OnSave"] = save_tool
            inst["OnLoad"] = load_tool
        end,
    },

    ["gentleness_hat"] = {
        ["name"] = "茉莉暖瑾", ["recipe_str"] = "带上贝雷帽是淑女了吧", ["desc"] = "喵，这是悠的帽子", ["xml"] = extra_xml,
        ["client_fn"] = function(inst, name)
            inst["entity"]:AddSoundEmitter()
            inst["AnimState"]:SetBank("gentleness_hat")
            inst["AnimState"]:SetBuild("gentleness_hat")
            inst["AnimState"]:PlayAnimation("idle")
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "med", 0.3, 0.8)
            inst:AddTag("hide_percentage")
            inst:AddTag("goggles")
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, extra_xml)
            addHatFn(inst, name)
        end,
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_hat.zip"),
            Asset("ANIM", "anim/gentleness_hat_skin.zip"),
            Asset("ANIM", "anim/gentleness_hat_skin_black.zip"),
            Asset("ANIM", "anim/gentleness_hat_skin_purple.zip"),
        },
    },
    ["gentleness_back"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_back.zip"),
            Asset("ANIM", "anim/gentleness_back_skin.zip"),
            Asset("ANIM", "anim/gentleness_ui_blue.zip"),
        },
        ["name"] = "茉莉九觅", ["recipe_str"] = "喵，这是悠的背包", ["desc"] = "喵，这是悠的背包", ["xml"] = extra_xml,
        ["client_fn"] = function(inst, name)
            inst["entity"]:AddSoundEmitter()
            inst["AnimState"]:SetBank("gentleness_back")
            inst["AnimState"]:SetBuild("gentleness_back")
            inst["AnimState"]:PlayAnimation("idle")
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "med", 0.3, 0.8)
            inst:AddTag("backpack")

            inst["g_net_ui"] = net_string(inst["GUID"], "g_net_ui", "g_net_ui")
            inst:ListenForEvent("g_net_ui", function(back_inst)
                updateBackUi(back_inst, name)
            end)
            if not TheWorld["ismastersim"] then
                inst["OnEntityReplicated"] = function(_inst)
                    updateBackUi(_inst, name)
                end
            end
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, extra_xml)
            addBackFn(inst, name)
            inst["components"]["container"]:EnableInfiniteStackSize(true)
            inst["G_UpdateContainer"] = function(back_inst, ui_name)
                if back_ui_list[ui_name] then

                    if back_inst["components"]["container"] ~= nil then
                        back_inst["components"]["container"]:Close()
                    end
                    if back_inst["g_net_ui"] then
                        back_inst["g_net_ui"]:set(ui_name)
                    end
                    back_inst["components"]["container"]:WidgetSetup(ui_name)
                end

            end
            if inst["UpdateAbility"] then
                inst:UpdateAbility()
            end
        end,
    },
    ["gentleness_armor"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_armor.zip"),
            Asset("ANIM", "anim/gentleness_armor_skin_a.zip"),
            Asset("ANIM", "anim/gentleness_armor_skin_b.zip"),
            Asset("ANIM", "anim/gentleness_armor_skin_black.zip"),
            Asset("ANIM", "anim/gentleness_armor_skin_pueple.zip"),
        },
        ["name"] = "茉莉暖阳", ["recipe_str"] = "就喜欢白色的小裙子", ["desc"] = "喵，这是悠的裙子", ["xml"] = extra_xml,
        ["client_fn"] = function(inst, name)
            inst["entity"]:AddSoundEmitter()
            inst["AnimState"]:SetBank("gentleness_armor")
            inst["AnimState"]:SetBuild("gentleness_armor")
            inst["AnimState"]:PlayAnimation("idle", true)
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "med", 0.3, 0.8)
            inst:AddTag("hide_percentage")
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, extra_xml)
            addArmorBody(inst, name)
        end,
    },
    ["gentleness_mlkx"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_items.zip"),
        },
        ["name"] = "茉莉空心", ["recipe_str"] = "茉莉空心", ["desc"] = "茉莉空心", ["xml"] = extra_xml,
        ["client_fn"] = function(inst, name)
            inst["entity"]:AddSoundEmitter()
            inst["AnimState"]:SetBank("gentleness_items")
            inst["AnimState"]:SetBuild("gentleness_items")
            inst["AnimState"]:PlayAnimation("idle")
            inst["AnimState"]:OverrideSymbol("base_folder", "gentleness_items", "gentleness_mlkx_ground")
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "med", 0.3, 0.8)
            inst["Transform"]:SetScale(0.5, 0.5, 0.5)
            inst:AddTag("weapon")
            inst:AddTag("sharp")
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, extra_xml)
            addMLKX(inst, name)
            inst:AddComponent("weapon")
            inst["components"]["weapon"]:SetRange(1, 1.5)
            inst["components"]["weapon"]:SetDamage(42.5)
        end,
    },
    ["gentleness_amulet"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_amulet.zip"),
            Asset("ANIM", "anim/gentleness_amulet_skin_1.zip"),
            Asset("ANIM", "anim/gentleness_amulet_skin_2.zip"),
        },
        ["name"] = "茉莉时夕", ["recipe_str"] = "你是我的生命", ["desc"] = "喵，这是悠的东西", ["xml"] = extra_xml,
        ["client_fn"] = function(inst, name)
            inst["entity"]:AddSoundEmitter()
            inst["AnimState"]:SetBank("gentleness_amulet")
            inst["AnimState"]:SetBuild("gentleness_amulet")
            inst["AnimState"]:PlayAnimation("idle", true)
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "med", 0.3, 0.8)
            inst["AnimState"]:SetDeltaTimeMultiplier(0.3)
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, extra_xml)
            addAmuletFn(inst, name)
        end,
    },
    ["gentleness_amulet_light"] = {
        ["name"] = "光", ["recipe_str"] = "光", ["desc"] = "光",
        ["client_fn"] = function(inst, name)
            inst["entity"]:AddLight()
            inst:AddTag("FX")
            inst["Light"]:SetRadius(15)
            inst["Light"]:SetFalloff(0.5)
            inst["Light"]:SetIntensity(0.8)
            inst["Light"]:SetColour(180 / 255, 195 / 255, 150 / 255)
            inst["Light"]:Enable(false)
        end,
        ["server_fn"] = function(inst, name)
            inst["persists"] = false
            inst["Light"]:Enable(true)
        end,
    },
    ["gentleness_amulet_container"] = {
        ["name"] = "打包容器", ["recipe_str"] = "打包容器", ["desc"] = "打包容器",
        ["client_fn"] = function(inst, name)
            if not TheWorld["ismastersim"] then
                inst["OnEntityReplicated"] = function(_inst)
                    _inst["replica"]["container"]:WidgetSetup(name)
                end
            end
        end,
        ["server_fn"] = function(inst, name)
            inst["persists"] = false
            inst:AddComponent("container")
            inst["components"]["container"]:WidgetSetup(name)
        end,
    },
    ["gentleness_bundle_a"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_bundle.zip"),
        },
        ["name"] = "打包包裹", ["recipe_str"] = "打包包裹", ["desc"] = "打包包裹", ["xml"] = extra_xml,
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_bundle")
            inst["AnimState"]:SetBuild("gentleness_bundle")
            inst["AnimState"]:PlayAnimation("idle")
            inst["AnimState"]:OverrideSymbol("gentleness_bundle_a", "gentleness_bundle", name)
            inst:AddTag(name)
            inst:AddTag("g_bundle")
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "med", 0.3, 0.8)
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("named")
            addInvCom(inst, name, extra_xml)
            bundleFn(inst, name)
        end,
    },
    ["gentleness_bundle_paper_a"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_bundle.zip"),
        },
        ["name"] = "打包纸", ["recipe_str"] = "小伙伴都可以用的打包纸", ["desc"] = "都可以打包哦", ["xml"] = extra_xml,
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_bundle")
            inst["AnimState"]:SetBuild("gentleness_bundle")
            inst["AnimState"]:PlayAnimation("idle")
            inst["AnimState"]:OverrideSymbol("gentleness_bundle_a", "gentleness_bundle", name)
            inst:AddTag(name)
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "med", 0.3, 0.8)
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, extra_xml)
            addStackCom(inst)
        end,
    },
    ["gentleness_bundle_gif"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_bundle.zip"),
        },
        ["name"] = "打包后的礼物", ["recipe_str"] = "打包后的礼物", ["desc"] = "打包后的礼物",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_bundle")
            inst["AnimState"]:SetBuild("gentleness_bundle")
            inst["AnimState"]:PlayAnimation("idle")
            inst["AnimState"]:OverrideSymbol("gentleness_bundle_a", "gentleness_bundle", "gentleness_bundle_a")
            inst:AddTag(name)
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "med", 0.3, 0.8)
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, "gentleness_bundle_a", extra_xml)
            inst:AddComponent("unwrappable")
            inst["components"]["unwrappable"]:SetOnWrappedFn(function()

            end)
            inst["components"]["unwrappable"]:SetOnUnwrappedFn(function(b_inst)
                local spawn_fx = SpawnPrefab("gift_unwrap")
                if spawn_fx and spawn_fx["Transform"] then
                    local x, y, z = b_inst["Transform"]:GetWorldPosition()
                    spawn_fx["Transform"]:SetPosition(x, y, z)
                end
                b_inst:Remove()
            end)
        end,
    },


    ["gentleness_chest_cw"] = {
        ["xml"] = extra_xml, ["assets"] = { Asset("ANIM", "anim/gentleness_chest.zip"), },
        ["name"] = "茉莉花韵", ["recipe_str"] = "用来存放物资", ["desc"] = "不要乱放东西哦",
        ["client_fn"] = function(inst, name)
            clientChest(inst, name)
            inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", "gentleness_chest_d")
            inst["g_net_ui"] = net_string(inst["GUID"], "g_net_ui", "g_net_ui")
            inst:ListenForEvent("g_net_ui", function(back_inst)
                updateChestBoxSkinUi(back_inst, name)
            end)
            if not TheWorld["ismastersim"] then
                inst["OnEntityReplicated"] = function(_inst)
                    updateChestBoxSkinUi(_inst, name)
                end
            end
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst:AddComponent("lootdropper")
            addComWorkable(inst, 5)
            inst:AddComponent("container")
            inst["components"]["container"]:WidgetSetup(name)
            inst["components"]["container"]["skipclosesnd"] = true
            inst["components"]["container"]["skipopensnd"] = true
            chestCanUpdate(inst)
            inst["G_UpdateContainer"] = function(back_inst, ui_name)
                if chest_skin_ui_list[ui_name] then
                    if back_inst["components"]["container"] ~= nil then
                        back_inst["components"]["container"]:Close()
                    end
                    if back_inst["g_net_ui"] then
                        back_inst["g_net_ui"]:set(ui_name)
                    end
                    back_inst["components"]["container"]:WidgetSetup(ui_name)
                end
            end
            addChestSlotImage(inst)
        end,
    },
    ["gentleness_chest_ice"] = {
        ["xml"] = extra_xml, ["assets"] = { Asset("ANIM", "anim/gentleness_chest.zip"), },
        ["name"] = "茉莉飘香", ["recipe_str"] = "用来存放食物", ["desc"] = "不要饿到肚子哦",
        ["client_fn"] = function(inst, name)
            clientChest(inst, name)
            inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", "gentleness_chest_a")
            inst["g_net_ui"] = net_string(inst["GUID"], "g_net_ui", "g_net_ui")
            inst:ListenForEvent("g_net_ui", function(back_inst)
                updateChestBoxSkinUi(back_inst, name)
            end)
            if not TheWorld["ismastersim"] then
                inst["OnEntityReplicated"] = function(_inst)
                    updateChestBoxSkinUi(_inst, name)
                end
            end
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst:AddComponent("lootdropper")
            addComWorkable(inst, 5)
            inst:AddComponent("container")
            inst["components"]["container"]:WidgetSetup(name)
            inst["components"]["container"]["skipclosesnd"] = true
            inst["components"]["container"]["skipopensnd"] = true
            inst:AddComponent("preserver")
            inst["components"]["preserver"]:SetPerishRateMultiplier(-1)
            chestCanUpdate(inst)
            inst["G_UpdateContainer"] = function(back_inst, ui_name)
                if chest_skin_ui_list[ui_name] then
                    if back_inst["components"]["container"] ~= nil then
                        back_inst["components"]["container"]:Close()
                    end
                    if back_inst["g_net_ui"] then
                        back_inst["g_net_ui"]:set(ui_name)
                    end
                    back_inst["components"]["container"]:WidgetSetup(ui_name)
                end
            end
            addChestSlotImage(inst)
        end,
    },
    ["gentleness_chest_fire"] = {
        ["xml"] = extra_xml, ["assets"] = { Asset("ANIM", "anim/gentleness_chest.zip"), },
        ["name"] = "茉莉桃花", ["recipe_str"] = "用来烧掉基础物资", ["desc"] = "不要烫到手哦",
        ["client_fn"] = function(inst, name)
            clientChest(inst, name)
            inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", "gentleness_chest_c")
            inst["g_net_ui"] = net_string(inst["GUID"], "g_net_ui", "g_net_ui")
            inst:ListenForEvent("g_net_ui", function(back_inst)
                updateChestBoxSkinUi(back_inst, name)
            end)
            if not TheWorld["ismastersim"] then
                inst["OnEntityReplicated"] = function(_inst)
                    updateChestBoxSkinUi(_inst, name)
                end
            end
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst:AddComponent("lootdropper")
            inst:AddComponent("container")
            inst["components"]["container"]:WidgetSetup(name)
            inst["components"]["container"]["skipclosesnd"] = true
            inst["components"]["container"]["skipopensnd"] = true
            addComWorkable(inst, 5)
            chestCanUpdate(inst)
            inst["G_UpdateContainer"] = function(back_inst, ui_name)
                if chest_skin_ui_list[ui_name] then
                    if back_inst["components"]["container"] ~= nil then
                        back_inst["components"]["container"]:Close()
                    end
                    if back_inst["g_net_ui"] then
                        back_inst["g_net_ui"]:set(ui_name)
                    end
                    back_inst["components"]["container"]:WidgetSetup(ui_name)
                end
            end

            inst:ListenForEvent("itemget", function(c_inst, data)
                if c_inst["g_fire_task"] then
                    return
                end

                c_inst["g_fire_task"] = c_inst:DoTaskInTime(0.1, function(chest)
                    if not HH_UTILS:HasComponents(chest, "container") or not chest["Transform"]
                            or not chest["GetPosition"]
                    then
                        return
                    end
                    local container_components = chest["components"]["container"]
                    local slot_num = container_components:GetNumSlots()
                    for i = 1, slot_num do
                        local hh_slot_item = container_components:GetItemInSlot(i)
                        if hh_slot_item then
                            local spawn_num = nil
                            local spawn_id = nil
                            local slot_id = hh_slot_item["prefab"]
                            if slot_id == "twigs" or slot_id == "cutgrass" then
                                spawn_num = 1
                                if HH_UTILS:HasComponents(hh_slot_item, "stackable") then
                                    spawn_num = hh_slot_item["components"]["stackable"]["stacksize"] or 1
                                end
                                spawn_id = "ash"
                            elseif slot_id == "log" then
                                spawn_num = 1
                                if HH_UTILS:HasComponents(hh_slot_item, "stackable") then
                                    spawn_num = hh_slot_item["components"]["stackable"]["stacksize"] or 1
                                end
                                spawn_id = "charcoal"
                            end
                            if spawn_id and spawn_num then
                                local new_spawn = SpawnPrefab(spawn_id)
                                if new_spawn then
                                    if HH_UTILS:HasComponents(new_spawn, "stackable")
                                            and HH_UTILS:HasComponents(new_spawn, "inventoryitem")
                                    then

                                        new_spawn["components"]["stackable"]:SetStackSize(math["max"](spawn_num, 1))
                                        hh_slot_item:Remove()

                                        local x, y, z = chest["Transform"]:GetWorldPosition()

                                        if chest["components"]["container"]:IsFull() then
                                            new_spawn["Transform"]:SetPosition(x, y, z)
                                            launchItem(new_spawn, math["random"](1, 360))
                                        else
                                            local chest_pos = chest:GetPosition()
                                            chest["components"]["container"]:GiveItem(new_spawn, nil, chest_pos)
                                        end
                                    else

                                        new_spawn:Remove()
                                    end
                                end
                            end
                        end
                    end
                    HH_UTILS:HHKillTask(chest, "g_fire_task")
                end)
            end)
            addChestSlotImage(inst)
        end,
    },
    ["gentleness_chest_money"] = {
        ["xml"] = extra_xml, ["assets"] = { Asset("ANIM", "anim/gentleness_chest.zip"), },
        ["name"] = "茉莉向钱", ["recipe_str"] = "用来转换物资", ["desc"] = "看我72变",
        ["client_fn"] = function(inst, name)
            clientChest(inst, name)
            inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", "gentleness_chest_b")
            inst["g_net_ui"] = net_string(inst["GUID"], "g_net_ui", "g_net_ui")
            inst:ListenForEvent("g_net_ui", function(back_inst)
                updateChestBoxSkinUi(back_inst, name)
            end)
            if not TheWorld["ismastersim"] then
                inst["OnEntityReplicated"] = function(_inst)
                    updateChestBoxSkinUi(_inst, name)
                end
            end
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst:AddComponent("lootdropper")
            inst:AddComponent("container")
            inst["components"]["container"]:WidgetSetup(name)
            inst["components"]["container"]["skipclosesnd"] = true
            inst["components"]["container"]["skipopensnd"] = true
            addComWorkable(inst, 5)
            chestCanUpdate(inst)
            inst["G_UpdateContainer"] = function(back_inst, ui_name)
                if chest_skin_ui_list[ui_name] then
                    if back_inst["components"]["container"] ~= nil then
                        back_inst["components"]["container"]:Close()
                    end
                    if back_inst["g_net_ui"] then
                        back_inst["g_net_ui"]:set(ui_name)
                    end
                    back_inst["components"]["container"]:WidgetSetup(ui_name)
                end
            end
            addChestSlotImage(inst)
        end,
    },

    ["gentleness_lamp_base"] = {
        ["xml"] = extra_xml, ["assets"] = { Asset("ANIM", "anim/gentleness_lamp.zip"), },
        ["name"] = "装饰彩灯", ["recipe_str"] = "一个装饰小灯", ["desc"] = "这个也太可爱了吧",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_lamp")
            inst["AnimState"]:SetBuild("gentleness_lamp")
            inst["AnimState"]:PlayAnimation("idle")
            MakeObstaclePhysics(inst, 0.1)
            inst:AddTag("structure")
            inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", "gentleness_lamp_base")
            inst["entity"]:AddLight()
            inst["Light"]:SetFalloff(0.7)
            inst["Light"]:SetIntensity(0.5)
            inst["Light"]:SetRadius(0.5)
            inst["Light"]:SetColour(1, 1, 1)
            inst["Light"]:Enable(false)

        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst["Light"]:Enable(true)
            inst:AddComponent("lootdropper")
            inst:AddComponent("workable")
            inst["components"]["workable"]:SetWorkAction(ACTIONS["HAMMER"])
            inst["components"]["workable"]:SetWorkLeft(4)
            inst["components"]["workable"]:SetOnFinishCallback(function(inst, worker)
                if inst["components"]["lootdropper"] ~= nil then
                    inst["components"]["lootdropper"]:DropLoot()
                end
                local fx = SpawnPrefab("collapse_small")
                fx["Transform"]:SetPosition(inst["Transform"]:GetWorldPosition())
                fx:SetMaterial("stone")
                inst:Remove()
            end)
        end,
    },
    ["gentleness_mmg"] = {
        ["xml"] = "images/gentleness_image/gentleness_mmg.xml", ["assets"] = { Asset("ANIM", "anim/gentleness_mmg.zip"), },
        ["name"] = "猫猫糕", ["recipe_str"] = "猫猫糕", ["desc"] = "猫猫糕",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_mmg")
            inst["AnimState"]:SetBuild("gentleness_mmg")
            inst["AnimState"]:PlayAnimation("idle")
            MakeObstaclePhysics(inst, 0.1)
            inst:AddTag("structure")
            inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", "gentleness_mmg")
            inst["entity"]:AddLight()
            inst["Light"]:SetFalloff(0.7)
            inst["Light"]:SetIntensity(0.5)
            inst["Light"]:SetRadius(0.5)
            inst["Light"]:SetColour(1, 1, 1)
            inst["Light"]:Enable(false)
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst["Light"]:Enable(true)
            inst:AddComponent("lootdropper")
            inst:AddComponent("workable")
            inst["components"]["workable"]:SetWorkAction(ACTIONS["HAMMER"])
            inst["components"]["workable"]:SetWorkLeft(4)
            inst["components"]["workable"]:SetOnFinishCallback(function(inst, worker)
                if inst["components"]["lootdropper"] ~= nil then
                    inst["components"]["lootdropper"]:DropLoot()
                end
                local fx = SpawnPrefab("collapse_small")
                fx["Transform"]:SetPosition(inst["Transform"]:GetWorldPosition())
                fx:SetMaterial("stone")
                inst:Remove()
            end)
        end,
    },
    ["gentleness_staff_white_cat_fx"] = {
        ["assets"] = { Asset("ANIM", "anim/gentleness_staff_white_cat.zip"), },
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_staff_white_cat")
            inst["AnimState"]:SetBuild("gentleness_staff_white_cat")
            inst["AnimState"]:PlayAnimation("idle", true)
            inst:AddTag("FX")
            inst:AddTag("NOCLICK")
        end,
        ["server_fn"] = function(inst, name)
            inst["persists"] = false
        end,
    },
    ["gentleness_staff_color_cat_fx"] = {
        ["assets"] = { Asset("ANIM", "anim/gentleness_staff_color_cat.zip"), },
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_staff_color_cat")
            inst["AnimState"]:SetBuild("gentleness_staff_color_cat")
            inst["AnimState"]:PlayAnimation("idle", true)
            inst:AddTag("FX")
            inst:AddTag("NOCLICK")
        end,
        ["server_fn"] = function(inst, name)
            inst["persists"] = false
        end,
    },
    ["gentleness_ferris_wheel"] = {
        ["xml"] = extra_xml,
        ["assets"] = { Asset("ANIM", "anim/gentleness_ferris_wheel.zip"), },
        ["name"] = "茉天轮", ["recipe_str"] = "保持快乐的秘诀", ["desc"] = "无所谓，没必要，不至于",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_ferris_wheel")
            inst["AnimState"]:SetBuild("gentleness_ferris_wheel")
            inst["AnimState"]:PlayAnimation("idle", true)
            inst["AnimState"]:SetDeltaTimeMultiplier(1.5)
            inst["Transform"]:SetScale(2, 2, 2)
            MakeObstaclePhysics(inst, 3)
            inst:AddTag("lightningrod")
            inst["entity"]:AddLight()
            inst["Light"]:SetFalloff(2)
            inst["Light"]:SetIntensity(0.5)
            inst["Light"]:SetRadius(15)
            inst["Light"]:SetColour(1, 1, 1)
            inst["Light"]:Enable(false)
        end,
        ["server_fn"] = function(inst, name)
            inst["Light"]:Enable(true)
            inst:AddComponent("inspectable")
            --inst:AddComponent("lootdropper")
            --addComWorkable(inst, 4)

            inst["g_check_task"] = inst:DoPeriodicTask(3, checkBadEntity)
            inst:DoTaskInTime(0, addMTLPos)
            inst:ListenForEvent("onremove", RemoveMTLPos)
        end,
    },

    ["gentleness_flower"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_flower.zip"),
        },
        ["name"] = "花", ["recipe_str"] = "可以建造一个花园哦", ["desc"] = "是悠喜欢的花呢", ["xml"] = extra_xml,
        ["client_fn"] = function(inst, name)
            inst["entity"]:AddSoundEmitter()
            inst["AnimState"]:SetBank("gentleness_flower")
            inst["AnimState"]:SetBuild("gentleness_flower")
            inst["AnimState"]:PlayAnimation("idle")
            inst["AnimState"]:OverrideSymbol("gentleness_bh", "gentleness_flower", "gentleness_bh")
            inst:AddTag("flower")
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst:AddComponent("pickable")
            inst["components"]["pickable"]["picksound"] = "dontstarve/wilson/pickup_plants"
            inst["components"]["pickable"]:SetUp("petals", 10)

            inst["components"]["pickable"]["remove_when_picked"] = true
            inst["components"]["pickable"]["quickpick"] = true
            inst["components"]["pickable"]["wildfirestarter"] = true
        end,
    },

    ["gentleness_xb"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_xb.zip"),
        },
        ["name"] = "茉莉香包", ["recipe_str"] = "悠真的很喜欢蝴蝶", ["desc"] = "可以种很多悠喜欢的花了", ["xml"] = extra_xml,
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_xb")
            inst["AnimState"]:SetBuild("gentleness_xb")
            inst["AnimState"]:PlayAnimation("idle")
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, extra_xml)
            addDepCom(inst, function(_inst, pt, deployer)
                for i = 1, 10 do
                    local butterfly = SpawnPrefab("butterfly")
                    if butterfly and butterfly["Transform"] then
                        local x, y, z = pt:Get()
                        local angle = math["random"](1, 360)
                        x = math["cos"](angle * DEGREES) + x
                        z = math["sin"](angle * DEGREES) + z
                        butterfly["Transform"]:SetPosition(x, 1, z)
                    end
                end
                if HH_UTILS:HasComponents(_inst, "stackable") and _inst["components"]["stackable"]:IsStack() then
                    _inst["components"]["stackable"]:Get():Remove()
                else
                    _inst:Remove()
                end
            end)
            addStackCom(inst)
        end,
    },

    ["gentleness_machine"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_machine.zip"),
        },
        ["name"] = "盲盒抽奖机", ["recipe_str"] = "就爱做赌狗", ["desc"] = "哪有小孩天天哭，哪有赌徒天天输", ["xml"] = extra_xml,
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_machine")
            inst["AnimState"]:SetBuild("gentleness_machine")
            inst["AnimState"]:PlayAnimation("idle")
            MakeObstaclePhysics(inst, 1)
            inst:AddTag("structure")
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst:AddComponent("lootdropper")
            addMachineFn(inst)
        end,
    },
    ["gentleness_cat_box"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_cat_box.zip"),
        },
        ["xml"] = "images/gentleness_image/gentleness_cat_box.xml",
        ["name"] = "随身小猫包", ["recipe_str"] = "随身小猫包", ["desc"] = "随身小猫包",
        ["client_fn"] = function(inst, name)
            inst["entity"]:AddSoundEmitter()
            inst["AnimState"]:SetBank("gentleness_cat_box")
            inst["AnimState"]:SetBuild("gentleness_cat_box")
            inst["AnimState"]:PlayAnimation("idle")
            inst["AnimState"]:OverrideSymbol("gentleness_cat_box", "gentleness_cat_box", "gentleness_cat_box")
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "med", 0.3, 0.8)
            inst["g_net_ui"] = net_string(inst["GUID"], "g_net_ui", "g_net_ui")
            inst:ListenForEvent("g_net_ui", function(back_inst)
                updateCatBoxUi(back_inst, name)
            end)
            if not TheWorld["ismastersim"] then
                inst["OnEntityReplicated"] = function(_inst)
                    updateCatBoxUi(_inst, name)
                end
            end
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, "images/gentleness_image/gentleness_cat_box.xml")
            --inst["components"]["inventoryitem"]["cangoincontainer"] = false
            inst["components"]["inventoryitem"]:SetOnPutInInventoryFn(function(_inst)
                _inst["components"]["container"]:Close()
            end)
            inst:AddComponent("container")
            inst["components"]["container"]:WidgetSetup(name)
            inst["components"]["container"]["skipclosesnd"] = true
            inst["components"]["container"]["skipopensnd"] = true
            inst["G_UpdateContainer"] = function(back_inst, ui_name)
                if cat_ui_list[ui_name] then
                    if back_inst["components"]["container"] ~= nil then
                        back_inst["components"]["container"]:Close()
                    end
                    if back_inst["g_net_ui"] then
                        back_inst["g_net_ui"]:set(ui_name)
                    end
                    back_inst["components"]["container"]:WidgetSetup(ui_name)
                end

            end
        end,
    },
    --------------------------------------------------------------------------------------------------------
    ["gentleness_box_build_a"] = {
        ["assets"] = box_assets, ["xml"] = com_item_xml,
        ["name"] = "展示柜-春季猫咪", ["recipe_str"] = "展示柜-春季猫咪", ["desc"] = "展示柜-春季猫咪",
        ["client_fn"] = function(inst, name)
            handleBoxBuildClient(inst, {})
            inst["AnimState"]:OverrideSymbol("chest_red", "gentleness_box_build", "chest_green")
        end,
        ["server_fn"] = function(inst, name)
            handleBoxBuildServer(inst, {
                ["box_type"] = "gentleness_box_spring",
                ["box_ability_id"] = "unlock_more_tool",
            })
        end,
    },
    ["gentleness_box_build_b"] = {
        ["assets"] = box_assets, ["xml"] = com_item_xml,
        ["name"] = "展示柜-圣诞猫咪", ["recipe_str"] = "展示柜-圣诞猫咪", ["desc"] = "展示柜-圣诞猫咪",
        ["client_fn"] = function(inst, name)
            handleBoxBuildClient(inst, {})
            inst["AnimState"]:OverrideSymbol("chest_red", "gentleness_box_build", "chest_blue")
        end,
        ["server_fn"] = function(inst, name)
            handleBoxBuildServer(inst, {
                ["box_type"] = "gentleness_box_christmas",
                ["box_ability_id"] = "unlock_more_magic",
            })
        end,
    },
    ["gentleness_box_build_c"] = {
        ["xml"] = com_item_xml, ["assets"] = box_assets,
        ["name"] = "展示柜-情人节猫咪", ["recipe_str"] = "展示柜-情人节猫咪", ["desc"] = "展示柜-情人节猫咪",
        ["client_fn"] = function(inst, name)
            handleBoxBuildClient(inst, {})
            inst["AnimState"]:OverrideSymbol("chest_red", "gentleness_box_build", "chest_pink")
        end,
        ["server_fn"] = function(inst, name)
            handleBoxBuildServer(inst, {
                ["box_type"] = "gentleness_box_valentine",
                ["box_ability_id"] = "test",
            })
        end,
    },
    ["gentleness_box_build_d"] = {
        ["xml"] = com_item_xml, ["assets"] = box_assets,
        ["name"] = "展示柜-新年猫咪", ["recipe_str"] = "展示柜-新年猫咪", ["desc"] = "展示柜-新年猫咪",
        ["client_fn"] = function(inst, name)
            handleBoxBuildClient(inst, {})
            inst["AnimState"]:OverrideSymbol("chest_red", "gentleness_box_build", "chest_red")
        end,
        ["server_fn"] = function(inst, name)
            handleBoxBuildServer(inst, {
                ["box_type"] = "gentleness_box_new_year",
                ["box_ability_id"] = "atk_aoe",
            })
        end,
    },
    ["gentleness_box_build_e"] = {
        ["assets"] = box_assets, ["xml"] = com_item_xml,
        ["name"] = "展示柜-万圣节猫咪", ["recipe_str"] = "展示柜-万圣节猫咪", ["desc"] = "展示柜-万圣节猫咪",
        ["client_fn"] = function(inst, name)
            handleBoxBuildClient(inst, {})
            inst["AnimState"]:OverrideSymbol("chest_red", "gentleness_box_build", "chest_yellow")
        end,
        ["server_fn"] = function(inst, name)
            handleBoxBuildServer(inst, {
                ["box_type"] = "gentleness_box_halloween",
                ["box_ability_id"] = "miss_damage",
            })
        end,
    },
    ["gentleness_box_random"] = {
        ["assets"] = com_assets, ["xml"] = com_item_xml,
        ["name"] = "随机盲盒", ["recipe_str"] = "随机盲盒", ["desc"] = "随机盲盒",
        ["client_fn"] = replaceItemFolder,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, com_item_xml)
            inst:AddComponent("tradable")

            inst["G_Right_Act"] = function(box, player)
                if box and player and player["Transform"] then
                    local x, y, z = player["Transform"]:GetWorldPosition()
                    local random_index = math["random"](1, #machine_item_list)
                    local box_id = machine_item_list[random_index]
                    local back_inst = SpawnPrefab(box_id)
                    if back_inst and back_inst["Transform"] then
                        back_inst["Transform"]:SetPosition(x, 2, z)
                        local random_angle = math["random"](1, 360)
                        launchItem(back_inst, random_angle)
                    end
                    box:Remove()
                end
            end
        end,
    },
    ["gentleness_coin"] = {
        ["assets"] = com_assets, ["xml"] = extra_xml,
        ["name"] = "沙币", ["recipe_str"] = "没错，你没看错，就叫沙币！", ["desc"] = "没错，你没看错，就叫沙币！",
        ["client_fn"] = function(inst, name)
            replaceItemFolder(inst, name)
            inst["Transform"]:SetScale(2, 2, 2)
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, extra_xml)
            addStackCom(inst, TUNING["STACK_SIZE_SMALLITEM"])
            inst:AddComponent("tradable")
        end,
    },

    ["gentleness_jasmine_flower"] = {
        ["xml"] = extra_xml, ["assets"] = com_assets,
        ["name"] = "茉莉花", ["recipe_str"] = "茉莉莫离，莫离茉莉", ["desc"] = "茉莉莫离，莫离茉莉",
        ["client_fn"] = client_jasmine_plant,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, extra_xml)
            addStackCom(inst, TUNING["STACK_SIZE_SMALLITEM"])
            inst:AddComponent("edible")
            inst["components"]["edible"]["healthvalue"] = 3
            inst["components"]["edible"]["hungervalue"] = 3
            inst["components"]["edible"]["sanityvalue"] = 3
            inst["components"]["edible"]["foodtype"] = "VEGGIE"
            inst["components"]["edible"]["oneaten"] = function(_inst, eater)
                if not eater or not eater:HasTag("player") then
                    return
                end
                local random_desc = getJasmineDesc()
                HH_UTILS:HHSay(eater, random_desc)
                if HH_UTILS:HasComponents(eater, "gentleness_magic") then
                    eater["components"]["gentleness_magic"]:DoDelta(3)
                end
            end
            inst:AddComponent("perishable")
            inst["components"]["perishable"]:SetPerishTime(TUNING["PERISH_SUPERFAST"])
            inst["components"]["perishable"]:StartPerishing()
            inst["components"]["perishable"]["onperishreplacement"] = "spoiled_food"
            inst["components"]["inspectable"]:SetDescription(getJasmineDesc())
        end,
    },
    ["gentleness_jasmine_seed"] = {
        ["assets"] = com_assets, ["xml"] = extra_xml,
        ["name"] = "茉莉种子", ["recipe_str"] = "再见，就是一定会再次相见", ["desc"] = "再见，就是一定会再次相见",
        ["client_fn"] = client_jasmine_seed,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, extra_xml)
            addDepCom(inst, onDeploySeed)
            addStackCom(inst, TUNING["STACK_SIZE_SMALLITEM"])
            addFuelCom(inst)
            inst:AddComponent("edible")
            inst["components"]["edible"]["healthvalue"] = 3
            inst["components"]["edible"]["hungervalue"] = 3
            inst["components"]["edible"]["sanityvalue"] = 3
            inst["components"]["edible"]["foodtype"] = "VEGGIE"
            inst["components"]["edible"]["oneaten"] = function(_inst, eater)
                if not eater or not eater:HasTag("player") then
                    return
                end
                if HH_UTILS:HasComponents(eater, "gentleness_magic") then
                    eater["components"]["gentleness_magic"]:DoDelta(3)
                end
            end
            inst:AddComponent("perishable")
            inst["components"]["perishable"]:SetPerishTime(TUNING["PERISH_SLOW"] * 3)
            inst["components"]["perishable"]:StartPerishing()
            inst["components"]["perishable"]["onperishreplacement"] = "spoiled_food"
            inst["components"]["inspectable"]:SetDescription(getJasmineDesc())
        end,
    },
    ["gentleness_jasmine_withered"] = {
        ["name"] = "茉莉花从", ["recipe_str"] = "送君茉莉，愿君莫离", ["desc"] = "送君茉莉，愿君莫离",
        ["xml"] = extra_xml, ["assets"] = com_assets,
        ["client_fn"] = function(inst, name)
            inst["entity"]:AddSoundEmitter()
            inst["AnimState"]:SetBank("gentleness_items")
            inst["AnimState"]:SetBuild("gentleness_items")
            inst["AnimState"]:PlayAnimation("idle")
            inst["AnimState"]:OverrideSymbol("base_folder", "gentleness_items", name)
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "med", 0.3, 0.8)
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, extra_xml)
            addDepCom(inst, onDeployPlant)
            addStackCom(inst, TUNING["STACK_SIZE_SMALLITEM"])
            addFuelCom(inst)
            inst["components"]["inspectable"]:SetDescription(getJasmineDesc())
        end,
    },
    ["gentleness_statue_platform"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_statue_platform.zip"),
        },
        ["name"] = "雕像展示台", ["recipe_str"] = "雕像展示台", ["desc"] = "雕像展示台",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_statue_platform")
            inst["AnimState"]:SetBuild("gentleness_statue_platform")
            inst["AnimState"]:PlayAnimation("idle")
            inst["entity"]:AddMiniMapEntity()
            inst["MiniMapEntity"]:SetIcon("gentleness_statue_platform.tex")
            --MakeObstaclePhysics(inst, 0.2)
            inst["entity"]:AddLight()
            inst["Light"]:SetFalloff(0.5)
            inst["Light"]:SetIntensity(0.75)
            inst["Light"]:SetRadius(1)
            inst["Light"]:SetColour(1, 1, 1)
            inst["Light"]:Enable(false)
        end,
        ["server_fn"] = function(inst, name)
            inst["Light"]:Enable(true)
            inst:AddComponent("inspectable")
            inst:AddComponent("lootdropper")
            inst["show_statue"] = nil
            inst["statue_type"] = "marble"
            inst["GReplaceImage"] = function(_inst)
                if not _inst or not _inst["AnimState"] then
                    return
                end
                local build_id = "gentleness_statue_platform"
                if HH_UTILS:IsHHType(_inst["show_statue"], "string") then
                    build_id = string["format"]("swap_%s_%s", tostring(_inst["show_statue"]), tostring(_inst["statue_type"]))
                    _inst["AnimState"]:OverrideSymbol("statue", build_id, "swap_body")
                    _inst:AddTag("g_has_statue")
                else
                    _inst["AnimState"]:OverrideSymbol("statue", build_id, "statue")
                    _inst:RemoveTag("g_has_statue")
                end
            end
            inst["GReplaceAct"] = function(_inst, chess_id, chess_type)
                if not _inst or not _inst["AnimState"] or not HH_UTILS:IsHHType(chess_id, "string")
                        or not HH_UTILS:IsHHType(chess_type, "string")
                then
                    return false, "参数错误"
                end
                if HH_UTILS:IsHHType(_inst["show_statue"], "string") and _inst["GTakeOutStatue"] then
                    _inst:GTakeOutStatue()
                end
                _inst["show_statue"] = chess_id
                _inst["statue_type"] = chess_type
                if _inst["GReplaceImage"] then
                    _inst:GReplaceImage()
                end
                return true, "展示成功"
            end
            inst["GTakeOutStatue"] = function(_inst)
                if _inst and _inst["Transform"] and HH_UTILS:IsHHType(_inst["show_statue"], "string")
                        and HH_UTILS:IsHHType(_inst["statue_type"], "string")
                then
                    local spawn_chess = SpawnPrefab(_inst["show_statue"])
                    if spawn_chess and spawn_chess["Transform"] then
                        local x, y, z = _inst["Transform"]:GetWorldPosition()
                        local build_id = string["format"]("swap_%s_%s", tostring(_inst["show_statue"]), tostring(_inst["statue_type"]))
                        spawn_chess["AnimState"]:SetBuild(build_id)
                        spawn_chess["Transform"]:SetPosition(x + math["random"]() * 2, y, z + math["random"]() * 2)
                        if HH_UTILS:HasComponents(spawn_chess, "symbolswapdata") and HH_UTILS:HasComponents(spawn_chess, "inventoryitem") then
                            spawn_chess["components"]["symbolswapdata"]:SetData(build_id, "swap_body")
                            local image_name = tostring(_inst["show_statue"])
                            local image_name_type = ""
                            local materialid_index = 1
                            if _inst["statue_type"] ~= "marble" then
                                image_name_type = "_" .. _inst["statue_type"]
                            end
                            if _inst["statue_type"] == "stone" then
                                materialid_index = 2
                            elseif _inst["statue_type"] == "moonglass" then
                                materialid_index = 3
                            end
                            spawn_chess["components"]["inventoryitem"]:ChangeImageName(image_name .. image_name_type)
                            spawn_chess["materialid"] = tonumber(materialid_index) or 1
                        end
                    end
                    _inst["show_statue"] = nil
                    _inst["statue_type"] = "marble"
                    if _inst["GReplaceImage"] then
                        _inst:GReplaceImage()
                    end
                end
            end
            addComWorkable(inst)
            inst["components"]["workable"]:SetOnFinishCallback(function(_inst, worker)
                if _inst and _inst["GTakeOutStatue"] then
                    _inst:GTakeOutStatue()
                end
                if _inst["components"]["lootdropper"] ~= nil then
                    _inst["components"]["lootdropper"]:DropLoot()
                end
                local fx = SpawnPrefab("collapse_small")
                fx["Transform"]:SetPosition(_inst["Transform"]:GetWorldPosition())
                fx:SetMaterial("stone")
                _inst:Remove()
            end)
            inst["OnSave"] = function(_inst, save_data)
                if save_data then
                    save_data["show_statue"] = _inst["show_statue"]
                    save_data["statue_type"] = _inst["statue_type"]
                end
            end
            inst["OnLoad"] = function(_inst, save_data)
                if save_data then
                    _inst["show_statue"] = save_data["show_statue"]
                    _inst["statue_type"] = save_data["statue_type"]
                    if _inst["GReplaceImage"] then
                        _inst:GReplaceImage()
                    end
                end
            end

            inst:DoTaskInTime(0.1, function(_inst)
                local fx = SpawnPrefab("gentleness_statue_fx")
                if fx then
                    fx["entity"]:AddFollower()
                    fx["entity"]:SetParent(_inst["entity"])
                    fx["Follower"]:FollowSymbol(_inst["GUID"], "statue", 0, 0, 0)
                end
            end)

        end,
    },
    ["gentleness_statue_fx"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_statue_fx.zip"),
        },
        ["name"] = "雕像展示台_fx", ["recipe_str"] = "雕像展示台_fx", ["desc"] = "雕像展示台_fx",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_statue_fx")
            inst["AnimState"]:SetBuild("gentleness_statue_fx")
            inst["AnimState"]:PlayAnimation("idle", true)
            inst:AddTag("CLASSIFIED")
            inst:AddTag("FX")
            inst:AddTag("NOBLOCK")
        end,
        ["server_fn"] = function(inst, name)
            inst["persists"] = false
        end,
    },
    ["gentleness_fan"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_fan.zip"),
        },
        ["xml"] = "images/gentleness_image/gentleness_fan.xml",
        ["name"] = "茉莉团团", ["recipe_str"] = "茉莉团团", ["desc"] = "茉莉团团",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_fan")
            inst["AnimState"]:SetBuild("gentleness_fan")
            inst["AnimState"]:PlayAnimation("idle", true)
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "med", 0.3, 0.8)
            inst:AddTag("weapon")
            inst:AddTag("sharp")
            inst:AddTag("allow_action_on_impassable")
            if not TheWorld["ismastersim"] then
                inst["OnEntityReplicated"] = function(_inst)
                    _inst["replica"]["container"]:WidgetSetup(name)
                end
            end
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, "images/gentleness_image/gentleness_fan.xml")
            weaponTitleStaffFn(inst)
            inst:AddComponent("container")
            inst["components"]["container"]:WidgetSetup(name)
            inst["components"]["container"]["skipclosesnd"] = true
            inst["components"]["container"]["skipopensnd"] = true
        end,
    },
    ["turf_gentleness_green"] = {
        ["assets"] = {
            Asset("ANIM", "anim/turf_gentleness.zip"),
        },
        ["xml"] = "images/gentleness_image/turf_gentleness_green.xml",
        ["name"] = "花花地皮", ["recipe_str"] = "花花地皮", ["desc"] = "花花地皮",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("turf_gentleness_green")
            inst["AnimState"]:SetBuild("turf_gentleness")
            inst["AnimState"]:PlayAnimation("idle")
            addComTurf(inst, "gentleness_green", false)
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, "images/gentleness_image/turf_gentleness_green.xml")
            addComTurf(inst, "gentleness_green", true)
        end,
    },

    ["gentleness_cat_swing"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_cat_swing.zip"),
        },
        ["name"] = "双人猫咪秋千", ["recipe_str"] = "双人猫咪秋千", ["desc"] = "双人猫咪秋千",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_cat_swing")
            inst["AnimState"]:SetBuild("gentleness_cat_swing")
            inst["AnimState"]:PlayAnimation("idle")
            inst["Transform"]:SetTwoFaced()
            MakeObstaclePhysics(inst, 3)
        end,
        ["server_fn"] = function(inst, name)
            inst["Transform"]:SetTwoFaced()
            inst:AddComponent("inspectable")
            inst["g_sit_players"] = {
                ["left"] = nil,
                ["right"] = nil,
            }

            inst["AddSitPlayer"] = function(_inst, player)
                if not checkSwingPlayer(_inst) then
                    HH_UTILS:HHSay(player, "坐不下啦")
                    return
                end
                local next_anim = nil
                local left_player = getSwingSitPlayer(_inst, "left")
                local right_player = getSwingSitPlayer(_inst, "right")
                if left_player then
                    next_anim = "idle_a_only"
                end
                if right_player then
                    next_anim = "idle_b_only"
                end
                if not left_player and not right_player then
                    next_anim = "idle_b_only"
                end
                addSwingPlayer(_inst, player)
                updateSwingAnim(_inst)
                if player["sg"] then
                    player["sg"]:GoToState("gentleness_sit_swing", {
                        target = _inst,
                        anim = next_anim,
                    })
                end
            end
            inst["ReduceSitPlayer"] = function(_inst, player)
                if not player then
                    return
                end
                local left_player = getSwingSitPlayer(_inst, "left")
                local right_player = getSwingSitPlayer(_inst, "right")
                if left_player and player["userid"] == left_player["userid"] then
                    removeSwingPlayer(_inst, left_player, "left")
                    updateSwingAnim(_inst)
                    return
                end
                if right_player and player["userid"] == right_player["userid"] then
                    removeSwingPlayer(_inst, right_player, "right")
                    updateSwingAnim(_inst)
                    return
                end
                updateSwingAnim(_inst)
            end
            inst:ListenForEvent("onremove", OnRemovePlayer)
        end,
    },
    ["gentleness_cat_swing_broken"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_cat_swing.zip"),
        },
        ["name"] = "破损的双人猫咪秋千", ["recipe_str"] = "破损的双人猫咪秋千", ["desc"] = "破损的双人猫咪秋千",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_cat_swing")
            inst["AnimState"]:SetBuild("gentleness_cat_swing")
            inst["AnimState"]:PlayAnimation("broken")
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst["_construction_product"] = construction_data["gentleness_cat_swing_broken"]
            inst:AddComponent("constructionsite")
            inst["components"]["constructionsite"]:SetConstructionPrefab("construction_container")
            inst["components"]["constructionsite"]:SetOnConstructedFn(repairBuild)
        end,
    },

    ["gentleness_andwobble_broken"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_andwobble_broken.zip"),
        },
        ["name"] = "破损的摇摇马", ["recipe_str"] = "破损的摇摇马", ["desc"] = "破损的摇摇马",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_andwobble_broken")
            inst["AnimState"]:SetBuild("gentleness_andwobble_broken")
            inst["AnimState"]:PlayAnimation("idle")
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst["g_is_small_fx"] = true
            inst["_construction_product"] = construction_data["gentleness_andwobble_broken"]
            inst:AddComponent("constructionsite")
            inst["components"]["constructionsite"]:SetConstructionPrefab("construction_container")
            inst["components"]["constructionsite"]:SetOnConstructedFn(repairBuild)
        end,
    },

    ["gentleness_andwobble"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_andwobble.zip"),
            Asset("ANIM", "anim/gentleness_andwobble_build.zip"),
        },
        ["name"] = "摇摇马", ["recipe_str"] = "摇摇马", ["desc"] = "摇摇马",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_andwobble")
            inst["AnimState"]:SetBuild("gentleness_andwobble_build")
            inst["AnimState"]:PlayAnimation("idle")
            inst["Transform"]:SetFourFaced()
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst["PlayerStartSit"] = function(chair, doer)
                chair:Hide()
                chair["user"] = doer
                chair:ListenForEvent("onremove", onRemoveChair)
                chair:RemoveFromScene()
            end
            inst["PlayerStopSit"] = function(chair, doer)
                chair:ReturnToScene()
                chair["user"] = nil
                chair:RemoveEventCallback("onremove", onRemoveChair)
                chair:Show()
            end
        end,
    },

    ["gentleness_tent"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_tent.zip"),
            Asset("ANIM", "anim/tent.zip"),
        },
        ["name"] = "猫咪帐篷", ["recipe_str"] = "猫咪帐篷", ["desc"] = "猫咪帐篷",
        ["client_fn"] = function(inst, name)
            inst["entity"]:AddSoundEmitter()
            inst["AnimState"]:SetBank("tent")
            inst["AnimState"]:SetBuild("gentleness_tent")
            inst["AnimState"]:PlayAnimation("idle")
            --inst["AnimState"]:PlayAnimation("enter",true)
            inst["Transform"]:SetScale(2, 2, 2)
            inst:SetDeploySmartRadius(1.6)
            MakeObstaclePhysics(inst, 1)
            inst:AddTag("tent")
            inst:AddTag("structure")
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst:AddComponent("lootdropper")
            inst:AddComponent("workable")
            inst["components"]["workable"]:SetWorkAction(ACTIONS["HAMMER"])
            inst["components"]["workable"]:SetWorkLeft(4)
            inst["components"]["workable"]:SetOnFinishCallback(function(_inst, worker)
                if _inst["components"]["burnable"] ~= nil and _inst["components"]["burnable"]:IsBurning() then
                    _inst["components"]["burnable"]:Extinguish()
                end
                _inst["components"]["lootdropper"]:DropLoot()
                local fx = SpawnPrefab("collapse_big")
                if fx then
                    fx["Transform"]:SetPosition(_inst["Transform"]:GetWorldPosition())
                    fx:SetMaterial("wood")
                end
                _inst:Remove()
            end)
            inst["components"]["workable"]:SetOnWorkCallback(function(_inst, worker)
                if not _inst:HasTag("burnt") then
                    StopSleepSound(_inst)
                    _inst["AnimState"]:PlayAnimation("hit")
                    _inst["AnimState"]:PushAnimation("idle", true)
                end
                if _inst["components"]["sleepingbag"] ~= nil and _inst["components"]["sleepingbag"]["sleeper"] ~= nil then
                    _inst["components"]["sleepingbag"]:DoWakeUp()
                end
            end)
            inst:AddComponent("finiteuses")
            inst["components"]["finiteuses"]:SetOnFinished(function(inst)
                if not inst:HasTag("burnt") then
                    StopSleepSound(inst)
                    inst["AnimState"]:PlayAnimation("destroy")
                    inst:ListenForEvent("animover", inst["Remove"])
                    inst["SoundEmitter"]:PlaySound("dontstarve/common/tent_dis_pre")
                    inst["persists"] = false
                    inst:DoTaskInTime(16 * FRAMES, OnFinishedSound)
                end
            end)
            inst["components"]["finiteuses"]:SetMaxUses(30)
            inst["components"]["finiteuses"]:SetUses(30)

            inst:AddComponent("sleepingbag")
            inst["components"]["sleepingbag"]["onsleep"] = OnSleepCatTent
            inst["components"]["sleepingbag"]["onwake"] = OnWakeCatTent
            inst["components"]["sleepingbag"]["health_tick"] = 5
            inst["components"]["sleepingbag"]["sanity_tick"] = 5
            --干燥
            inst["components"]["sleepingbag"]["dryingrate"] = math["max"](0, -TUNING["SLEEP_WETNESS_PER_TICK"] / TUNING["SLEEP_TICK_PERIOD"])
            inst["components"]["sleepingbag"]:SetTemperatureTickFn(TemperatureTickCatTent)
            inst["sleep_anim"] = "sleep_loop"
            inst["components"]["sleepingbag"]["hunger_tick"] = -1
            inst:ListenForEvent("onbuilt", OnBuiltCatTent)
            MakeSmallBurnable(inst, nil, nil, true)
            --MakeLargeBurnable(inst, nil, nil, true)
            MakeMediumPropagator(inst)
            MakeHauntableWork(inst)
            inst["OnSave"] = OnSaveCatTent
            inst["OnLoad"] = OnLoadCatTent
        end,
    },


    ["gentleness_fountain"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_fountain_new.zip"),
        },
        ["name"] = "猫咪喷泉", ["recipe_str"] = "猫咪喷泉", ["desc"] = "猫咪喷泉",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_fountain_new")
            inst["AnimState"]:SetBuild("gentleness_fountain_new")
            inst["AnimState"]:PlayAnimation("idle", true)
            MakeObstaclePhysics(inst, 2)
            inst:AddTag("lightningrod")
            inst["entity"]:AddLight()
            inst["Light"]:SetFalloff(2)
            inst["Light"]:SetIntensity(0.5)
            inst["Light"]:SetRadius(15)
            inst["Light"]:SetColour(1, 1, 1)
            inst["Light"]:Enable(false)
        end,
        ["server_fn"] = function(inst, name)
            inst["Light"]:Enable(true)
            inst:AddComponent("inspectable")
            inst:AddComponent("watersource")
            inst["g_check_task"] = inst:DoPeriodicTask(3, checkBadEntity)
        end,
    },
    ["gentleness_fountain_broken"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_fountain.zip"),
        },
        ["name"] = "破损的猫咪喷泉", ["recipe_str"] = "破损的猫咪喷泉", ["desc"] = "破损的猫咪喷泉",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_fountain")
            inst["AnimState"]:SetBuild("gentleness_fountain")
            inst["AnimState"]:PlayAnimation("broken")
            MakeObstaclePhysics(inst, 2)
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst["_construction_product"] = construction_data["gentleness_fountain_broken"]
            inst:AddComponent("constructionsite")
            inst["components"]["constructionsite"]:SetConstructionPrefab("construction_container")
            inst["components"]["constructionsite"]:SetOnConstructedFn(repairBuild)
        end,
    },
    ["gentleness_carousel_broken"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_carousel.zip"),
            Asset("ANIM", "anim/gentleness_carousel_a.zip"),
            Asset("ANIM", "anim/gentleness_carousel_b.zip"),
        },
        ["name"] = "破损的旋转木马", ["recipe_str"] = "破损的旋转木马", ["desc"] = "破损的旋转木马",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_carousel")
            inst["AnimState"]:SetBuild("gentleness_carousel_a")
            inst["AnimState"]:PlayAnimation("broken")
            inst["AnimState"]:AddOverrideBuild("gentleness_carousel_b")
            MakeObstaclePhysics(inst, 2)
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst["_construction_product"] = construction_data["gentleness_carousel_broken"]
            inst:AddComponent("constructionsite")
            inst["components"]["constructionsite"]:SetConstructionPrefab("construction_container")
            inst["components"]["constructionsite"]:SetOnConstructedFn(repairBuild)
        end,
    },

    ["gentleness_carousel"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_carousel.zip"),
            Asset("ANIM", "anim/gentleness_carousel_a.zip"),
            Asset("ANIM", "anim/gentleness_carousel_b.zip"),
        },
        ["name"] = "旋转木马", ["recipe_str"] = "旋转木马", ["desc"] = "旋转木马",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_carousel")
            inst["AnimState"]:SetBuild("gentleness_carousel_a")
            inst["AnimState"]:PlayAnimation("idle")
            inst["AnimState"]:AddOverrideBuild("gentleness_carousel_b")
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst["PlayerStartSit"] = function(chair, doer)
                chair:Hide()
                chair["user"] = doer
                chair:ListenForEvent("onremove", onRemoveChair)
                chair:RemoveFromScene()
            end
            inst["PlayerStopSit"] = function(chair, doer)
                chair:ReturnToScene()
                chair["user"] = nil
                chair:RemoveEventCallback("onremove", onRemoveChair)
                chair:Show()
            end
        end,
    },


    ["gentleness_color_land"] = {
        ["assets"] = { Asset("ANIM", "anim/gentleness_color_land.zip"), },
        ["name"] = "彩虹路地板", ["recipe_str"] = "彩虹路地板", ["desc"] = "彩虹路地板",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_color_land")
            inst["AnimState"]:SetBuild("gentleness_color_land")
            inst["AnimState"]:PlayAnimation("idle")
            inst["AnimState"]:SetOrientation(ANIM_ORIENTATION["OnGround"])
            inst["AnimState"]:SetLayer(LAYER_BACKGROUND)
            inst["AnimState"]:SetSortOrder(3)
            --inst["Transform"]:SetScale(1.3, 1.3, 1.3)
            --inst["AnimState"]:SetDeltaTimeMultiplier(2)
            inst:AddTag("DECOR")
            inst:AddTag("NOCLICK")
            inst:AddTag("NOBLOCK")
            inst:AddTag("gentleness_color_land")
        end,
        ["server_fn"] = function(inst, name)
            --inst:AddComponent("inspectable")
            inst:AddComponent("savedrotation")
        end,
    },
    ["gentleness_color_land_item"] = {
        ["assets"] = { Asset("ANIM", "anim/gentleness_color_land.zip"), },
        ["xml"] = "images/gentleness_image/gentleness_color_land_item.xml",
        ["name"] = "彩虹路地板", ["recipe_str"] = "彩虹路地板", ["desc"] = "彩虹路地板",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_color_land")
            inst["AnimState"]:SetBuild("gentleness_color_land")
            inst["AnimState"]:PlayAnimation("item")
            inst["Transform"]:SetScale(0.5, 0.5, 0.5)
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "med", 0.3, 0.8)
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, "images/gentleness_image/gentleness_color_land_item.xml")
            addStackCom(inst, TUNING["STACK_SIZE_SMALLITEM"])

            inst:AddComponent("deployable")
            --inst["components"]["deployable"]:SetDeployMode(DEPLOYMODE["TURF"])
            inst["components"]["deployable"]["ondeploy"] = function(_inst, pt, deployer, rot)
                local pot = SpawnPrefab("gentleness_color_land")
                if pot and pot["Transform"] and HH_UTILS:IsHHType(pt, "table") then
                    pot["Transform"]:SetPosition(pt["x"], 0, pt["z"])
                    if HH_UTILS:IsHHType(rot, "number") then
                        pot["Transform"]:SetRotation(rot)
                    end
                end
            end
            --inst["components"]["deployable"]:SetUseGridPlacer(true)
        end,
    },

    ["gentleness_trashcan"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_trashcan.zip"),
        },
        ["name"] = "猫咪垃圾桶", ["recipe_str"] = "猫咪垃圾桶", ["desc"] = "猫咪垃圾桶",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_trashcan")
            inst["AnimState"]:SetBuild("gentleness_trashcan")
            inst["AnimState"]:PlayAnimation("close")
            inst["entity"]:AddSoundEmitter()
            MakeObstaclePhysics(inst, 0.1)
            inst["Transform"]:SetScale(0.5, 0.5, 0.5)
            if not TheWorld["ismastersim"] then
                inst["OnEntityReplicated"] = function(_inst)
                    _inst["replica"]["container"]:WidgetSetup("dragonflyfurnace")
                end
            end
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst:AddComponent("container")
            inst["components"]["container"]:WidgetSetup("dragonflyfurnace")
            inst["components"]["container"]["onopenfn"] = function(_inst)
                _inst["AnimState"]:PlayAnimation("open")
            end
            inst["components"]["container"]["onclosefn"] = function(_inst)
                _inst["AnimState"]:PlayAnimation("close")
            end

            inst:AddComponent("incinerator")
            inst["components"]["incinerator"]:SetOnIncinerateFn(function(_inst)
            end)
            inst["components"]["incinerator"]:SetShouldIncinerateItemFn(function(_inst, item)
                local incinerate = true
                if item["prefab"] == "winter_food4" then
                    incinerate = false
                elseif item:HasTag("irreplaceable") then
                    incinerate = false
                elseif item["components"]["container"] ~= nil and not item["components"]["container"]:IsEmpty() then
                    incinerate = false
                end
                return incinerate
            end)
        end,
    },

    ["gentleness_streetlight"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_streetlight.zip"),
        },
        ["name"] = "猫咪路灯", ["recipe_str"] = "猫咪路灯", ["desc"] = "猫咪路灯",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_streetlight")
            inst["AnimState"]:SetBuild("gentleness_streetlight")
            inst["AnimState"]:PlayAnimation("idle")
            MakeObstaclePhysics(inst, 0.1)
            inst:AddTag("lightningrod")
            inst["entity"]:AddLight()
            inst["Light"]:SetFalloff(2)
            inst["Light"]:SetIntensity(0.5)
            inst["Light"]:SetRadius(5)
            inst["Light"]:SetColour(1, 1, 1)
            inst["Light"]:Enable(false)
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst:AddComponent("lootdropper")
            inst["Light"]:Enable(true)
            addComWorkable(inst, 4)
        end,
    },
    ------------------------------------------2025-------------------------------------
    ["gentleness_food_tray"] = {
        ["xml"] = "images/gentleness_image/gentleness_food_tray.xml",
        ["assets"] = { Asset("ANIM", "anim/gentleness_food_tray.zip"), },
        ["name"] = "野餐托盘", ["recipe_str"] = "野餐托盘", ["desc"] = "野餐托盘",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_food_tray")
            inst["AnimState"]:SetBuild("gentleness_food_tray")
            inst["AnimState"]:PlayAnimation("idle")
            MakeObstaclePhysics(inst, 0.1)
            if not TheWorld["ismastersim"] then
                inst["OnEntityReplicated"] = function(_inst)
                    _inst["replica"]["container"]:WidgetSetup("gentleness_food_tray")
                end
            end
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst:AddComponent("lootdropper")
            addComWorkable(inst, 4)
            inst:AddComponent("container")
            inst["components"]["container"]:WidgetSetup("gentleness_food_tray")
            inst["components"]["container"]:EnableInfiniteStackSize(true)
            inst:AddComponent("preserver")
            inst["components"]["preserver"]:SetPerishRateMultiplier(0)
            inst:ListenForEvent("itemget", function(_inst, data)
                if not data or not data["item"] or not data["slot"] then
                    return
                end
                local build, symbol, spice = getFoodBuild(data["item"])
                if build and symbol then
                    _inst["AnimState"]:OverrideSymbol("food_" .. tostring(data["slot"]), build, symbol)
                else
                    _inst["AnimState"]:OverrideSymbol("food_" .. tostring(data["slot"]), "gentleness_food_tray", "food_" .. tostring(data["slot"]))
                end
            end)
            inst:ListenForEvent("itemlose", function(_inst, data)
                if not data or not data["slot"] then
                    return
                end
                _inst["AnimState"]:OverrideSymbol("food_" .. tostring(data["slot"]), "gentleness_food_tray", "food_" .. tostring(data["slot"]))
            end)

        end,
    },
    ["turf_gentleness_strawberry"] = {
        ["assets"] = {
            Asset("ANIM", "anim/turf_gentleness_strawberry.zip"),
        },
        ["xml"] = "images/gentleness_image/turf_gentleness_strawberry.xml",
        ["name"] = "草莓地皮", ["recipe_str"] = "草莓地皮", ["desc"] = "草莓地皮",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("turf_gentleness_strawberry")
            inst["AnimState"]:SetBuild("turf_gentleness_strawberry")
            inst["AnimState"]:PlayAnimation("idle")
            addComTurf(inst, "gentleness_strawberry", false)
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, "images/gentleness_image/turf_gentleness_strawberry.xml")
            addComTurf(inst, "gentleness_strawberry", true)
        end,
    },
    ["turf_gentleness_star"] = {
        ["assets"] = {
            Asset("ANIM", "anim/turf_gentleness_star.zip"),
        },
        ["xml"] = "images/gentleness_image/turf_gentleness_star.xml",
        ["name"] = "星星地皮", ["recipe_str"] = "星星地皮", ["desc"] = "星星地皮",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("turf_gentleness_star")
            inst["AnimState"]:SetBuild("turf_gentleness_star")
            inst["AnimState"]:PlayAnimation("idle")
            addComTurf(inst, "gentleness_star", false)
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, "images/gentleness_image/turf_gentleness_star.xml")
            addComTurf(inst, "gentleness_star", true)
        end,
    },
    ["gentleness_wooden_board"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_wooden_board.zip"),
        },
        ["name"] = "装饰木牌", ["recipe_str"] = "装饰木牌", ["desc"] = "装饰木牌",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_wooden_board")
            inst["AnimState"]:SetBuild("gentleness_wooden_board")
            inst["AnimState"]:PlayAnimation("idle")
            --MakeObstaclePhysics(inst, 0.1)
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst:AddComponent("lootdropper")
            addComWorkable(inst, 4)
        end,
    },
    ["gentleness_fruit_basket"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_fruit_basket.zip"),
        },
        ["name"] = "野餐果篮", ["recipe_str"] = "野餐果篮", ["desc"] = "野餐果篮",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_fruit_basket")
            inst["AnimState"]:SetBuild("gentleness_fruit_basket")
            inst["AnimState"]:PlayAnimation("empty")
            inst["Transform"]:SetScale(0.5, 0.5, 0.5)
            --MakeObstaclePhysics(inst, 0.1)
            if not TheWorld["ismastersim"] then
                inst["OnEntityReplicated"] = function(_inst)
                    _inst["replica"]["container"]:WidgetSetup("gentleness_fruit_basket")
                end
            end
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst:AddComponent("lootdropper")
            addComWorkable(inst, 4)

            inst:AddComponent("container")
            inst["components"]["container"]:WidgetSetup("gentleness_fruit_basket")
            inst["components"]["container"]:EnableInfiniteStackSize(true)
            inst:AddComponent("preserver")
            inst["components"]["preserver"]:SetPerishRateMultiplier(0)
            inst["CheckBasketContainer"] = function(_inst)
                if not HH_UTILS:HasComponents(_inst, "container") then
                    return
                end
                if _inst["components"]["container"]:IsEmpty() then
                    _inst["AnimState"]:PlayAnimation("empty")
                else
                    _inst["AnimState"]:PlayAnimation("full")
                end
            end
            inst:ListenForEvent("itemget", inst["CheckBasketContainer"])
            inst:ListenForEvent("itemlose", inst["CheckBasketContainer"])
            inst:DoTaskInTime(0, inst["CheckBasketContainer"])

        end,
    },
    ["gentleness_gril"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_gril.zip"),
        },
        ["name"] = "野餐烧烤架", ["recipe_str"] = "野餐烧烤架", ["desc"] = "野餐烧烤架",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_gril")
            inst["AnimState"]:SetBuild("gentleness_gril")
            inst["AnimState"]:PlayAnimation("empty")
            inst["Transform"]:SetScale(0.5, 0.5, 0.5)
            --MakeObstaclePhysics(inst, 0.1)
            if not TheWorld["ismastersim"] then
                inst["OnEntityReplicated"] = function(_inst)
                    _inst["replica"]["container"]:WidgetSetup("gentleness_gril")
                end
            end
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst:AddComponent("lootdropper")
            addComWorkable(inst, 4)

            inst:AddComponent("container")
            inst["components"]["container"]:WidgetSetup("gentleness_gril")
            inst["components"]["container"]:EnableInfiniteStackSize(true)
            inst:AddComponent("preserver")
            inst["components"]["preserver"]:SetPerishRateMultiplier(0)
            inst["CheckBasketContainer"] = function(_inst)
                if not HH_UTILS:HasComponents(_inst, "container") then
                    return
                end
                if _inst["components"]["container"]:IsEmpty() then
                    _inst["AnimState"]:PlayAnimation("empty")
                else
                    _inst["AnimState"]:PlayAnimation("full")
                end
            end
            inst["G_ItemCook"] = function(_inst, data)
                if data and data["item"] and data["slot"] then
                    local slot_item = _inst["components"]["container"]:GetItemInSlot(data["slot"])
                    if HH_UTILS:HasComponents(slot_item, "cookable")
                            and HH_UTILS:IsHHType(slot_item["components"]["cookable"]["product"], "string")
                    then
                        local new_spawn_id = slot_item["components"]["cookable"]["product"]
                        local old_num = HH_UTILS:HasComponents(slot_item, "stackable") and slot_item["components"]["stackable"]["stacksize"] or 1
                        local new_spawn = SpawnPrefab(new_spawn_id)
                        if new_spawn then
                            if HH_UTILS:HasComponents(new_spawn, "inventoryitem") then
                                if HH_UTILS:HasComponents(new_spawn, "stackable") then
                                    new_spawn["components"]["stackable"]:SetStackSize(old_num)
                                end
                                _inst["components"]["container"]:RemoveItemBySlot(data["slot"])
                                local chest_pos = _inst:GetPosition()
                                local slot_index = data["slot"]
                                --延迟一帧同步ui
                                _inst:DoTaskInTime(0, function(chest)
                                    chest["components"]["container"]:GiveItem(new_spawn, slot_index, chest_pos)
                                end)
                            else
                                new_spawn:Remove()
                            end
                        end
                    end
                end
                _inst:CheckBasketContainer()
            end
            inst:ListenForEvent("itemget", inst["G_ItemCook"])
            inst:ListenForEvent("itemlose", inst["CheckBasketContainer"])
            inst:DoTaskInTime(0, inst["CheckBasketContainer"])

        end,
    },

    ["gentleness_flower_basket"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_flower_basket.zip"),
        },
        ["name"] = "装饰花篮", ["recipe_str"] = "装饰花篮", ["desc"] = "装饰花篮",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_flower_basket")
            inst["AnimState"]:SetBuild("gentleness_flower_basket")
            inst["AnimState"]:PlayAnimation("empty")
            inst["Transform"]:SetScale(0.5, 0.5, 0.5)
            --MakeObstaclePhysics(inst, 0.1)
            if not TheWorld["ismastersim"] then
                inst["OnEntityReplicated"] = function(_inst)
                    _inst["replica"]["container"]:WidgetSetup("gentleness_flower_basket")
                end
            end
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst:AddComponent("lootdropper")
            addComWorkable(inst, 4)

            inst:AddComponent("container")
            inst["components"]["container"]:WidgetSetup("gentleness_flower_basket")
            inst["components"]["container"]:EnableInfiniteStackSize(true)
            inst:AddComponent("preserver")
            inst["components"]["preserver"]:SetPerishRateMultiplier(0)
            inst["CheckBasketContainer"] = function(_inst)
                if not HH_UTILS:HasComponents(_inst, "container") then
                    return
                end
                if _inst["components"]["container"]:IsEmpty() then
                    _inst["AnimState"]:PlayAnimation("empty")
                else
                    _inst["AnimState"]:PlayAnimation("full")
                end
            end
            inst:ListenForEvent("itemget", inst["CheckBasketContainer"])
            inst:ListenForEvent("itemlose", inst["CheckBasketContainer"])
            inst:DoTaskInTime(0, inst["CheckBasketContainer"])

        end,
    },
    ["gentleness_carpet"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_carpet.zip"),
        },
        ["name"] = "野餐地毯", ["recipe_str"] = "野餐地毯", ["desc"] = "野餐地毯",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_carpet")
            inst["AnimState"]:SetBuild("gentleness_carpet")
            inst["AnimState"]:PlayAnimation("idle")
            inst["AnimState"]:SetOrientation(ANIM_ORIENTATION["OnGround"])
            inst["AnimState"]:SetLayer(LAYER_BACKGROUND)
            inst["AnimState"]:SetSortOrder(3)
            inst:AddTag("NOBLOCK")
            inst:AddTag("DECOR")
            inst["Transform"]:SetScale(2, 2, 2)
        end,
        ["server_fn"] = function(inst, name)
            inst:AddComponent("inspectable")
            inst:AddComponent("lootdropper")
            addComWorkable(inst, 2)
            inst:AddComponent("savedrotation")
        end,
    },
    ------------------------------------------2025-------------------------------------
    -------------------------------------------2025-03-25---------------------------------------

    ["gentleness_cat_biscuit"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_cat_food.zip"),
        },
        ["xml"] = "images/gentleness_image/gentleness_cat_biscuit.xml",
        ["name"] = "猫饼", ["recipe_str"] = "猫饼", ["desc"] = "猫饼",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_cat_food")
            inst["AnimState"]:SetBuild("gentleness_cat_food")
            inst["AnimState"]:PlayAnimation("gentleness_cat_biscuit")
            inst:AddTag("g_special_food")
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "med", 0.3, 0.8)
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, "images/gentleness_image/gentleness_cat_biscuit.xml")
            inst:AddComponent("stackable")
            inst["components"]["stackable"]["maxsize"] = TUNING["STACK_SIZE_SMALLITEM"]
            inst:AddComponent("edible")
            inst["components"]["edible"]["healthvalue"] = 2
            inst["components"]["edible"]["hungervalue"] = 3
            inst["components"]["edible"]["sanityvalue"] = 3
            inst["components"]["edible"]["foodtype"] = "VEGGIE"
        end,
    },
    ["gentleness_cat_doughnut"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_cat_food.zip"),
        },
        ["xml"] = "images/gentleness_image/gentleness_cat_doughnut.xml",
        ["name"] = "猫咪清补凉", ["recipe_str"] = "猫咪清补凉", ["desc"] = "猫咪清补凉",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_cat_food")
            inst["AnimState"]:SetBuild("gentleness_cat_food")
            inst["AnimState"]:PlayAnimation("gentleness_cat_doughnut")
            inst:AddTag("g_special_food")
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "med", 0.3, 0.8)
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, "images/gentleness_image/gentleness_cat_doughnut.xml")
            inst:AddComponent("stackable")
            inst["components"]["stackable"]["maxsize"] = TUNING["STACK_SIZE_SMALLITEM"]
            inst:AddComponent("edible")
            inst["components"]["edible"]["healthvalue"] = 2
            inst["components"]["edible"]["hungervalue"] = 3
            inst["components"]["edible"]["sanityvalue"] = 3
            inst["components"]["edible"]["foodtype"] = "VEGGIE"
        end,
    },
    ["gentleness_cat_relieve_hot"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_cat_food.zip"),
        },
        ["xml"] = "images/gentleness_image/gentleness_cat_relieve_hot.xml",
        ["name"] = "猫咪甜甜圈", ["recipe_str"] = "猫咪甜甜圈", ["desc"] = "猫咪甜甜圈",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_cat_food")
            inst["AnimState"]:SetBuild("gentleness_cat_food")
            inst["AnimState"]:PlayAnimation("gentleness_cat_relieve_hot")
            inst:AddTag("g_special_food")
            MakeInventoryPhysics(inst)
            MakeInventoryFloatable(inst, "med", 0.3, 0.8)
        end,
        ["server_fn"] = function(inst, name)
            addInvCom(inst, name, "images/gentleness_image/gentleness_cat_relieve_hot.xml")
            inst:AddComponent("stackable")
            inst["components"]["stackable"]["maxsize"] = TUNING["STACK_SIZE_SMALLITEM"]
            inst:AddComponent("edible")
            inst["components"]["edible"]["healthvalue"] = 2
            inst["components"]["edible"]["hungervalue"] = 3
            inst["components"]["edible"]["sanityvalue"] = 3
            inst["components"]["edible"]["foodtype"] = "VEGGIE"
        end,
    },
    ["gentleness_chair"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_chair.zip"),
        },
        ["name"] = "野餐椅", ["recipe_str"] = "野餐椅", ["desc"] = "野餐椅",
        ["client_fn"] = function(inst, name)
            inst["entity"]:AddSoundEmitter()
            inst["AnimState"]:SetBank("gentleness_chair")
            inst["AnimState"]:SetBuild("gentleness_chair")
            inst["AnimState"]:PlayAnimation("idle")
            inst["AnimState"]:Hide("gentleness_chair_back")
            inst["AnimState"]:SetFinalOffset(1)
            inst["Transform"]:SetFourFaced()
            inst:AddTag("faced_chair")
            inst:AddTag("rotatableobject")
        end,
        ["server_fn"] = function(inst, name)
            inst["back"] = SpawnPrefab("gentleness_chair_back_fx")
            if inst["back"] then
                inst["back"]["entity"]:SetParent(inst["entity"])
            end
            inst:AddComponent("inspectable")
            inst:AddComponent("sittable")
        end,
    },
    ["gentleness_chair_back_fx"] = {
        ["assets"] = {
            Asset("ANIM", "anim/gentleness_chair.zip"),
        },
        ["name"] = "野餐椅-背面特效", ["recipe_str"] = "野餐椅", ["desc"] = "野餐椅",
        ["client_fn"] = function(inst, name)
            inst["AnimState"]:SetBank("gentleness_chair")
            inst["AnimState"]:SetBuild("gentleness_chair")
            inst["AnimState"]:PlayAnimation("idle")
            inst["AnimState"]:SetFinalOffset(-1)
            inst["Transform"]:SetFourFaced()
            inst["AnimState"]:Hide("gentleness_chair_a")
            inst["AnimState"]:Hide("gentleness_chair_b")
            inst["AnimState"]:Hide("gentleness_chair_c")
            inst:AddTag("FX")
        end,
        ["server_fn"] = function(inst, name)
            inst["persists"] = false
        end,
    },
    -------------------------------------------2025-03-25---------------------------------------
}

local box_type_list = {
    ["spring"] = { ["name"] = "春季猫咪盲盒", },
    ["christmas"] = { ["name"] = "圣诞猫咪盲盒", },
    ["valentine"] = { ["name"] = "情人节猫咪盲盒", },
    ["new_year"] = { ["name"] = "新年猫咪盲盒", },
    ["halloween"] = { ["name"] = "万圣节猫咪盲盒", },
}
local box_id_list = {
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
}
local box_ability = {
    ["gentleness_box_valentine_a"] = "immune_cold",
    ["gentleness_box_valentine_b"] = "immune_hot",
    ["gentleness_box_valentine_c"] = "immune_sleep",
    ["gentleness_box_valentine_d"] = "immune_freeze",
    ["gentleness_box_valentine_e"] = "immune_sandstorm",
    --2025-03-25 圣诞猫咪盲盒增加单个魔法解锁
    ["gentleness_box_christmas_a"] = "magic_plant",
    ["gentleness_box_christmas_b"] = "magic_fertilizer",
    ["gentleness_box_christmas_c"] = "magic_rain",
    ["gentleness_box_christmas_d"] = "magic_bird",
    ["gentleness_box_christmas_e"] = "magic_sleep",
    ["gentleness_box_christmas_f"] = "magic_moon",
    ["gentleness_box_christmas_g"] = "magic_fish",
    ["gentleness_box_christmas_h"] = "magic_lighting",

}
for i, v in pairs(box_type_list) do
    for ii, vv in ipairs(box_id_list) do
        local box_id = "gentleness_box_" .. i .. "_" .. vv
        local box_name = string.format("%s%s", v and v["name"] or "未知", ii)
        local box_type = "gentleness_box_" .. i
        HH_PREFAB[box_id] = {
            ["name"] = box_name, ["recipe_str"] = box_name, ["desc"] = box_name, ["assets"] = com_assets, ["xml"] = com_item_xml,
            ["client_fn"] = replaceBoxClientFolder,
            ["server_fn"] = function(inst, name)
                addComBoxServer(inst, { ["name"] = name, ["box_type"] = box_type, ["box_ability"] = box_ability[box_id] })
            end,
        }
    end

end
return HH_PREFAB
