----
---文件处理时间:2024-07-01 23:48:41
---
local HH_UTILS = require("utils/gentleness_utils")
local GENTLENESS_ACT_TOOL = Action({ ["priority"] = 999, ["mount_valid"] = false })
GENTLENESS_ACT_TOOL["id"] = "GENTLENESS_ACT_TOOL"
GENTLENESS_ACT_TOOL["str"] = "切换"
GENTLENESS_ACT_TOOL["fn"] = function(act)
    local player = act["doer"]
    local item = act["invobject"]
    if item and item["AcrRight"] then
        item:AcrRight()
    end
    return true
end
AddAction(GENTLENESS_ACT_TOOL)
local GENTLENESS_ACT_SELL = Action({ ["priority"] = 999, ["mount_valid"] = false })
GENTLENESS_ACT_SELL["id"] = "GENTLENESS_ACT_SELL"
GENTLENESS_ACT_SELL["str"] = "全部出售"
GENTLENESS_ACT_SELL["fn"] = function(act)
    local player = act["doer"]
    local item = act["invobject"]
    if HH_UTILS:HasComponents(player, "inventory") and HH_UTILS:HasComponents(item, "stackable") then
        local spawn_num = item["components"]["stackable"]["stacksize"] or 1
        local spawn_coin = SpawnPrefab("gentleness_coin")
        if spawn_coin then
            if HH_UTILS:HasComponents(spawn_coin, "stackable") then
                spawn_coin["components"]["stackable"]:SetStackSize(spawn_num)
                player["components"]["inventory"]:GiveItem(spawn_coin)
                HH_UTILS:HHSay(player, "出售成功")
                item:Remove()
            else
                spawn_coin:Remove()
            end
        end
    end
    return true
end
AddAction(GENTLENESS_ACT_SELL)

local GENTLENESS_ACT_RANDOM_BOX = Action({ ["priority"] = 999, ["mount_valid"] = false })
GENTLENESS_ACT_RANDOM_BOX["id"] = "GENTLENESS_ACT_RANDOM_BOX"
GENTLENESS_ACT_RANDOM_BOX["str"] = "随机开盒"
GENTLENESS_ACT_RANDOM_BOX["fn"] = function(act)
    local player = act["doer"]
    local item = act["invobject"]
    if player and item and item["G_Right_Act"] then
        item:G_Right_Act(player)
    end
    return true
end
AddAction(GENTLENESS_ACT_RANDOM_BOX)
AddComponentAction("INVENTORY", "inventoryitem", function(inst, doer, actions, right)
    if doer:HasTag("player") then
        if inst["prefab"] == "gentleness_tool_a"
                and HH_UTILS:HasReplica(inst, "equippable") and inst["replica"]["equippable"]:IsEquipped() then
            table["insert"](actions, ACTIONS["GENTLENESS_ACT_TOOL"])
        elseif inst:HasTag("gentleness_box") then
            table["insert"](actions, ACTIONS["GENTLENESS_ACT_SELL"])
        elseif inst["prefab"] == "gentleness_box_random" then
            table["insert"](actions, ACTIONS["GENTLENESS_ACT_RANDOM_BOX"])
        end
    end
end)
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS["GENTLENESS_ACT_TOOL"], "give"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS["GENTLENESS_ACT_TOOL"], "give"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS["GENTLENESS_ACT_SELL"], "give"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS["GENTLENESS_ACT_SELL"], "give"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS["GENTLENESS_ACT_RANDOM_BOX"], "dolongaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS["GENTLENESS_ACT_RANDOM_BOX"], "dolongaction"))

local bundle_black_list = {
    ["gentleness_bundle_a"] = true,
    ["gentleness_bundle_paper_a"] = true,
    ["gentleness_amulet"] = true,
}

local bundle_skin = {
    ["gentleness_amulet"] = "gentleness_bundle_a",
    ["gentleness_amulet_skin_1"] = "gentleness_bundle_b",
    ["gentleness_amulet_skin_2"] = "gentleness_bundle_c",
    ["gentleness_bundle_paper_a"] = "gentleness_bundle_a",
    ["gentleness_bundle_paper_b"] = "gentleness_bundle_b",
    ["gentleness_bundle_paper_c"] = "gentleness_bundle_c",
}
local GENTLENESS_ACT_PACK = Action({ ["priority"] = 5, ["mount_valid"] = false })
GENTLENESS_ACT_PACK["id"] = "GENTLENESS_ACT_PACK"
GENTLENESS_ACT_PACK["str"] = "打包"
GENTLENESS_ACT_PACK["fn"] = function(act)
    local player = act["doer"]
    local item = act["invobject"]
    local target = act["target"]
    if not TUNING["GENTLENESS_AMULET_CONFIG"] then
        HH_UTILS:HHSay(player, "当前配置禁止打包道具")
        return true
    end
    if item and item["Transform"] and item["prefab"] and target and not bundle_black_list[target["prefab"]] then
        local item_id = item["prefab"]

        if item_id == "gentleness_amulet" then
            if not HH_UTILS:HasComponents(player, "gentleness_magic") then
                HH_UTILS:HHSay(player, "不是我的道具")
                return true
            end
            -- local current_magic = player["components"]["gentleness_magic"]:GetCurrentMagic()
            -- if not current_magic or current_magic < 20 then
            --     HH_UTILS:HHSay(player, "当前魔法值不够")
            --     return true
            -- end
        end
        local spawn_bundle = SpawnPrefab("gentleness_bundle_a")

        if item["g_item_skin"] and bundle_skin[item["g_item_skin"]] then
            if HH_UTILS:HasComponents(player, "gentleness_skin") then
                local skin_id = bundle_skin[item["g_item_skin"]]
                local success, message = player["components"]["gentleness_skin"]:BuildChangeSkin(spawn_bundle, skin_id)
            end
        end
        if spawn_bundle and spawn_bundle["Transform"] then
            local x, y, z = target["Transform"]:GetWorldPosition()
            spawn_bundle["Transform"]:SetPosition(x, y, z)
            if spawn_bundle["SaveBundleItem"] then
                local success, message = spawn_bundle:SaveBundleItem(target, player)
                if not success then
                    HH_UTILS:HHSay(player, message)
                else

                    if item_id == "gentleness_amulet" then
                        if HH_UTILS:HasComponents(player, "gentleness_magic") then
                            -- player["components"]["gentleness_magic"]:DoDelta(-20)
                        end
                    else

                        if HH_UTILS:HasComponents(item, "stackable") and item["components"]["stackable"]:IsStack() then
                            item["components"]["stackable"]:Get():Remove()
                        else
                            item:Remove()
                        end
                    end
                end
            else
                spawn_bundle:Remove()
            end
        end
        return true
    end
    return false
end
AddAction(GENTLENESS_ACT_PACK)

local level_back_list = {
    ["honeycomb"] = 5,
    ["feather_canary"] = 10,
    ["feather_crow"] = 10,
    ["feather_robin"] = 10,
}
local GENTLENESS_BACK_LEVEL = Action({ ["priority"] = 5, ["mount_valid"] = false })
GENTLENESS_BACK_LEVEL["id"] = "GENTLENESS_BACK_LEVEL"
GENTLENESS_BACK_LEVEL["str"] = "升级"
GENTLENESS_BACK_LEVEL["fn"] = function(act)
    local player = act["doer"]
    local item = act["invobject"]
    local target = act["target"]
    if HH_UTILS:HasComponents(target, "trader") and item and HH_UTILS:HasComponents(player, "gentleness_magic") then
        target["components"]["trader"]:AcceptGift(player, item, 1)
    end
    return true
end
AddAction(GENTLENESS_BACK_LEVEL)

local G_GIVE_FOOD = Action({ ["priority"] = 5, ["mount_valid"] = false })
G_GIVE_FOOD["id"] = "G_GIVE_FOOD"
G_GIVE_FOOD["str"] = "喂养"
G_GIVE_FOOD["fn"] = function(act)
    local player = act["doer"]
    local item = act["invobject"]
    local target = act["target"]
    if target and target:IsValid() and HH_UTILS:NotIsDead(target) and target:HasTag("player") and not target:HasTag("playerghost")
            and target["sg"] and target["sg"]:HasStateTag("idle") and
            not (target["sg"]:HasStateTag("busy") or target["sg"]:HasStateTag("attacking") or target["sg"]:HasStateTag("sleeping") or target:HasTag("playerghost")
                    or target:HasTag("wereplayer")) and
            target.components.eater ~= nil and
            item.components.edible ~= nil and
            target.components.eater:CanEat(item) and
            (TheNet:GetPVPEnabled() or
                    (target:HasTag("strongstomach") and
                            item:HasTag("monstermeat")) or
                    (item:HasTag("spoiled") and target:HasTag("ignoresspoilage") and not
                    (item:HasTag("badfood") or item:HasTag("unsafefood"))) or
                    not (item:HasTag("badfood") or
                            item:HasTag("unsafefood") or
                            item:HasTag("spoiled"))) then
        if target.components.eater:PrefersToEat(item) then
            local food = item.components.inventoryitem:RemoveFromOwner()
            if food ~= nil then
                target:AddChild(food)
                food:RemoveFromScene()
                food.components.inventoryitem:HibernateLivingItem()
                food.persists = false
                target["sg"]:GoToState(
                        food.components.edible.foodtype == FOODTYPE.MEAT and "eat" or "quickeat",
                        { feed = food, feeder = player }
                )
                return true
            end
        end
    end
    return false
end
AddAction(G_GIVE_FOOD)
AddComponentAction("USEITEM", "inventoryitem", function(inst, doer, target, actions, right)
    if doer:HasTag("player") and target and not target:HasTag("player")
            and not target:HasTag("FX")
            and not target:HasTag("NOCLICK")
            and not target:HasTag("CLASSIFIED")
            and not target:HasTag("NOBLOCK")
            and not target:HasTag("g_bundle")
            and target["Transform"] and inst
    then
        local can_add_act = false
        if (inst["prefab"] == "gentleness_amulet" and doer["prefab"] == "gentleness")
                or inst["prefab"] == "gentleness_bundle_paper_a" then
            can_add_act = true
        end
        if can_add_act then
            table["insert"](actions, ACTIONS["GENTLENESS_ACT_PACK"])
        end
    end
    if doer:HasTag("player") and target and target["prefab"] == "gentleness_back"
            and inst and level_back_list[inst["prefab"]]
            and HH_UTILS:HasReplica(target, "equippable") and not target["replica"]["equippable"]:IsEquipped()
    then
        table["insert"](actions, ACTIONS["GENTLENESS_BACK_LEVEL"])
    end
    if right and inst:HasTag("g_special_food")
            and doer:HasTag("player") and not doer:HasTag("playerghost")
            and target:HasTag("player") and not target:HasTag("playerghost")
    then
        table["insert"](actions, ACTIONS["G_GIVE_FOOD"])
    end
end)
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS["GENTLENESS_ACT_PACK"], "give"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS["GENTLENESS_ACT_PACK"], "give"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS["GENTLENESS_BACK_LEVEL"], "give"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS["GENTLENESS_BACK_LEVEL"], "give"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS["G_GIVE_FOOD"], "give"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS["G_GIVE_FOOD"], "give"))

local GENTLENESS_ACT_MTL = Action({ ["priority"] = 999, ["mount_valid"] = true })
GENTLENESS_ACT_MTL["id"] = "GENTLENESS_ACT_MTL"
GENTLENESS_ACT_MTL["str"] = "开始抽奖"
GENTLENESS_ACT_MTL["fn"] = function(act)
    local player = act["doer"]
    local target = act["target"]
    if not HH_UTILS:HasComponents(player, "gentleness_player") then
        HH_UTILS:HHSay(player, "这不是我能用的")
        return true
    end

    HH_UTILS:HHClientRpc(player, "g_open_shop_ui", "Y")
    HH_UTILS:HHKillTask(player, "g_check_coin_task")
    player["g_check_coin_task"] = player:DoPeriodicTask(1, function(doer)
        if not HH_UTILS:HasComponents(doer, "inventory") or not HH_UTILS:NotIsDead(doer) then
            HH_UTILS:HHKillTask(player, "g_check_coin_task")
            return
        end
        local inv_slot_num = doer["components"]["inventory"]:GetNumSlots()
        if inv_slot_num <= 0 then
            return
        end
        local has_num = 0
        for i = 1, inv_slot_num do
            local slot_item = doer["components"]["inventory"]:GetItemInSlot(i)
            if slot_item and slot_item["prefab"] == "gentleness_coin" then
                if HH_UTILS:HasComponents(slot_item, "stackable") then
                    has_num = has_num + (slot_item["components"]["stackable"]["stacksize"] or 1)
                else
                    has_num = has_num + 1
                end
            end
        end
        HH_UTILS:HHClientRpc(doer, "g_coin_num", has_num)
    end)
    return true
end
AddAction(GENTLENESS_ACT_MTL)
local GENTLENESS_ACT_BOX = Action({ ["priority"] = 999, ["mount_valid"] = true })
GENTLENESS_ACT_BOX["id"] = "GENTLENESS_ACT_BOX"
GENTLENESS_ACT_BOX["str"] = "契约"
GENTLENESS_ACT_BOX["fn"] = function(act)
    local player = act["doer"]
    local target = act["target"]
    if player and player["userid"] and target and target["owner_id"] ~= player["userid"] then
        HH_UTILS:HHSay(player, "这不是我的柜子")
        return true
    end
    if HH_UTILS:HasComponents(player, "gentleness_player") and target and target["box_ability_id"] then

        local result, message = player["components"]["gentleness_player"]:UnLockAbility(target["box_ability_id"], true)
        HH_UTILS:HHSay(player, message)
    end
    return true
end
AddAction(GENTLENESS_ACT_BOX)
local function startsWith(str, word)
    return string["match"](str, "^" .. word) ~= nil
end

local GENTLENESS_ACT_GIVE_STATUE = Action({ ["priority"] = 999, ["mount_valid"] = true, ["encumbered_valid"] = true })
GENTLENESS_ACT_GIVE_STATUE["id"] = "GENTLENESS_ACT_GIVE_STATUE"
--GENTLENESS_ACT_GIVE_STATUE["str"] = "展示"
GENTLENESS_ACT_GIVE_STATUE["strfn"] = function(act)
    local target = act["target"]
    local act_str_id = "SHOW"
    if not target then
        return act_str_id
    end
    if target:HasTag("g_has_statue") then
        act_str_id = "REPLACE"
    end
    return act_str_id
end
GENTLENESS_ACT_GIVE_STATUE["fn"] = function(act)
    local player = act["doer"]
    local target = act["target"]
    if not player or not HH_UTILS:NotIsDead(player) or not HH_UTILS:HasComponents(player, "inventory") then
        return true
    end
    if not HH_UTILS:IsHHType(EQUIPSLOTS, "table") then
        HH_UTILS:HHSay(player, "装备栏被删了？")
        return true
    end
    if not HH_UTILS:IsHHType(target, "table") or not target["AnimState"] then
        HH_UTILS:HHSay(player, "这是啥？")
        return true
    end

    for i, v in pairs(EQUIPSLOTS) do
        if HH_UTILS:IsHHType(v, "string") and v ~= EQUIPSLOTS["HANDS"] and v ~= EQUIPSLOTS["HEAD"]
                and v ~= EQUIPSLOTS["BEARD"]
        then
            local chesspiece_inst = player["components"]["inventory"]:GetEquippedItem(v)
            if HH_UTILS:IsHHType(chesspiece_inst, "table") and chesspiece_inst["prefab"] then
                local prefab_id = chesspiece_inst["prefab"]
                if startsWith(prefab_id, "chesspiece_") then
                    local build = tostring(chesspiece_inst["AnimState"]:GetBuild())
                    local base_type = "marble"
                    if string["find"](build, "_stone") then
                        base_type = "stone"
                    elseif string["find"](build, "_moonglass") then
                        base_type = "moonglass"
                    end
                    local success, message = false, "展示失败"
                    if target["GReplaceAct"] then
                        success, message = target:GReplaceAct(prefab_id, base_type)
                    end
                    if success and chesspiece_inst["Remove"] then
                        chesspiece_inst:Remove()
                    end
                    HH_UTILS:HHSay(player, tostring(message))
                    return true
                end
            end
        end
    end

    if target:HasTag("g_has_statue") and target["GTakeOutStatue"] then
        target:GTakeOutStatue()
        HH_UTILS:HHSay(player, "雕像已取出")
        return true
    end
    HH_UTILS:HHSay(player, "什么事都没有发生")
    return true
end
AddAction(GENTLENESS_ACT_GIVE_STATUE)

STRINGS["ACTIONS"]["GENTLENESS_ACT_GIVE_STATUE"] = {
    ["SHOW"] = "展示",
    ["REPLACE"] = "取出",
}

local GENTLENESS_ACT_SIT_YYM = Action({ ["priority"] = 999, ["mount_valid"] = true, ["encumbered_valid"] = true })
GENTLENESS_ACT_SIT_YYM["id"] = "GENTLENESS_ACT_SIT_YYM"
GENTLENESS_ACT_SIT_YYM["str"] = "坐"
GENTLENESS_ACT_SIT_YYM["fn"] = function(act)
    local player = act["doer"]
    local target = act["target"]
    if not player or not target or not player["sg"] then
        return false
    end
    if target["user"] then
        HH_UTILS:HHSay(player, "已经有其他人在使用啦")
        return true
    end

    if HH_UTILS:HasComponents(player, "rider") and player["components"]["rider"]:IsRiding() then
        HH_UTILS:HHSay(player, "骑乘状态下无法使用")
        return true
    end
    if target["prefab"] == "gentleness_cat_swing" then
        --增加内置cd
        if target["hh_rpc_cd"] then
            HH_UTILS:HHSay(player, "点太快了!!!")
            return true
        end
        if target["AddSitPlayer"] then
            target:AddSitPlayer(player)
        end
        target["hh_rpc_cd"] = true
        target:DoTaskInTime(1, function()
            target["hh_rpc_cd"] = false
        end)
        return true
    end
    if target["PlayerStartSit"] then
        player["sg"]:GoToState("gentleness_sit", target)
        target:PlayerStartSit(player)
    else
        HH_UTILS:HHSay(player, "上马失败")
    end
    return true
end
AddAction(GENTLENESS_ACT_SIT_YYM)
local sit_prefab_list = {
    ["gentleness_andwobble"] = true,
    ["gentleness_carousel"] = true,
    ["gentleness_cat_swing"] = true,
}
AddComponentAction("SCENE", "inspectable", function(inst, doer, actions, right)
    if right and inst and doer:HasTag("player") and not doer:HasTag("playerghost") then
        if doer["prefab"] == "gentleness" then
            if inst["prefab"] == "gentleness_ferris_wheel" then
                table["insert"](actions, ACTIONS["GENTLENESS_ACT_MTL"])
            elseif inst:HasTag("gentleness_ability") then
                table["insert"](actions, ACTIONS["GENTLENESS_ACT_BOX"])
            elseif inst["prefab"] == "gentleness_statue_platform" then
                table["insert"](actions, ACTIONS["GENTLENESS_ACT_GIVE_STATUE"])
            end
        else
            if inst["prefab"] == "gentleness_statue_platform" then
                table["insert"](actions, ACTIONS["GENTLENESS_ACT_GIVE_STATUE"])
            end
        end
        if sit_prefab_list[inst["prefab"]] and not doer:HasTag("gentleness_swing_sit") then
            table["insert"](actions, ACTIONS["GENTLENESS_ACT_SIT_YYM"])
        end
    end
end)

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS["GENTLENESS_ACT_MTL"], "give"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS["GENTLENESS_ACT_MTL"], "give"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS["GENTLENESS_ACT_BOX"], "give"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS["GENTLENESS_ACT_BOX"], "give"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS["GENTLENESS_ACT_GIVE_STATUE"], "give"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS["GENTLENESS_ACT_GIVE_STATUE"], "give"))
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS["GENTLENESS_ACT_SIT_YYM"], "give"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS["GENTLENESS_ACT_SIT_YYM"], "give"))

local GENTLENESS_ACT_PICK_LAND = Action({ priority = 3 })
GENTLENESS_ACT_PICK_LAND["id"] = "GENTLENESS_ACT_PICK_LAND"
GENTLENESS_ACT_PICK_LAND["str"] = "挖"
GENTLENESS_ACT_PICK_LAND["fn"] = function(act)
    local player = act["doer"]
    local target = act["target"]
    local hand_equip = act["invobject"]
    if HH_UTILS:HasComponents(hand_equip, "gentleness_act") and player then
        return hand_equip["components"]["gentleness_act"]:PickColorLand(act:GetActionPoint(), player)
    end
    return false
end
AddAction(GENTLENESS_ACT_PICK_LAND)
AddComponentAction("POINT", "gentleness_act", function(inst, doer, pos, actions, right, target)
    if right and inst and doer:HasTag("player") and not doer:HasTag("playerghost") then
        local x, y, z = pos:Get()
        if #TheSim:FindEntities(x, y, z, 2, { "gentleness_color_land" }, { "INLIMBO" }, nil) > 0 then
            table["insert"](actions, ACTIONS["GENTLENESS_ACT_PICK_LAND"])
        end
    end
end)

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS["GENTLENESS_ACT_PICK_LAND"], "terraform"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS["GENTLENESS_ACT_PICK_LAND"], "terraform"))

_G["G_WORLD"] = function()
    if not ThePlayer then
        print("???")
        return
    end
    local x, y, z = ThePlayer["Transform"]:GetWorldPosition()
    local all_items = TheSim:FindEntities(x, y, z, 200, nil, { "FX", "INLIMBO", "NOCLICK", "player" })
    if not all_items then
        return
    end
    print("实体数量", #all_items)
    --矩形筛选范围
    local base_x_min, base_x_max, base_y_min, base_y_max = 0, 0, 0, 0
    local land_item_num = 0
    local a_start_x, a_start_y = 0, 0
    local save_item_table = {}
    for i, v in ipairs(all_items) do
        if v and v["prefab"] and v["Transform"] and STRINGS["NAMES"][string["upper"](v["prefab"])] then
            local pos_x, pos_y, pos_z = v["Transform"]:GetWorldPosition()
            if TheWorld["Map"]:IsPassableAtPoint(pos_x, 0, pos_z)
                    and not TheWorld["Map"]:IsOceanTileAtPoint(pos_x, 0, pos_z)
            then
                local prefab_id = v["prefab"]
                local prefab_name = STRINGS["NAMES"][string["upper"](prefab_id)]
                --print(prefab_id, prefab_name)
                land_item_num = land_item_num + 1
                table["insert"](save_item_table, {
                    ["name"] = tostring(prefab_name),
                    ["type"] = v["prefab"],
                    ["pos_x"] = pos_x,
                    ["pos_y"] = pos_y,
                    ["pos_z"] = pos_z,
                })
            end
            if v["prefab"] == "gentleness_cat_land_test_a" then
                base_x_min = pos_x
                base_y_max = pos_z
                a_start_x, a_start_y = pos_x, pos_z
            end
            if v["prefab"] == "gentleness_cat_land_test_c" then
                base_x_max = pos_x
                base_y_min = pos_z
            end
        end
    end
    print("岛上实体数量", land_item_num)
    print(string.format("实体坐标范围x[%s-%s],z[%s-%s]", base_x_min, base_x_max, base_y_min, base_y_max))
    local true_item_num = 0
    for i, v in ipairs(save_item_table) do
        if HH_UTILS:IsHHType(v, "table") and v["pos_x"] and v["pos_z"] then
            local pos_x, pos_z = v["pos_x"], v["pos_z"]
            if (pos_x > base_x_min) and (pos_x < base_x_max) and (pos_z > base_y_min) and (pos_z < base_y_max) then
                true_item_num = true_item_num + 1
                --print(v["name"], v["type"])
                --地图一格地皮换算坐标对应4*4的一格
                local map_x, map_y = 250 + 16 * math.abs(pos_x - a_start_x), 1472 + 16 * math.abs(pos_z - a_start_y)
                local str = HH_UTILS:TableToStr({
                    ["[\"name\"]"] = tostring(v["name"]),
                    ["[\"type\"]"] = tostring(v["type"]),
                    ["[\"shape\"]"] = "rectangle",
                    ["[\"x\"]"] = map_x,
                    ["[\"y\"]"] = map_y,
                    ["[\"width\"]"] = 64,
                    ["[\"height\"]"] = 64,
                    ["[\"visible\"]"] = true,
                    ["[\"properties\"]"] = {},
                })
                print(str .. ",")
            end
        end
    end
    print("实际符合条件的物品数量", true_item_num)
end