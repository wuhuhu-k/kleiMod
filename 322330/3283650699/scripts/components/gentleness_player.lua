----
---文件处理时间:2024-07-01 23:48:41
---
local HH_UTILS = require("utils/gentleness_utils")

local ability_config = {
    ["unlock_more_tool"] = 0,
    ["unlock_more_magic"] = 0,
    ["immune_cold"] = 0,
    ["immune_hot"] = 0,
    ["immune_sleep"] = 0,
    ["immune_freeze"] = 0,
    ["immune_sandstorm"] = 0,
    ["atk_aoe"] = 0,
    ["miss_damage"] = 0,
    -----2025-03-25单个盲盒解锁魔法
    ["magic_plant"] = 0,
    ["magic_fertilizer"] = 0,
    ["magic_rain"] = 0,
    ["magic_bird"] = 0,
    ["magic_sleep"] = 0,
    ["magic_moon"] = 0,
    ["magic_fish"] = 0,
    ["magic_lighting"] = 0,

}
local function checkBuilder(player)
    return HH_UTILS:HasComponents(player, "builder")
            and HH_UTILS:HasComponents(player, "sanity")
end

local function unLockRecipe(player, recipe_id, say_str)
    if not HH_UTILS:IsHHType(recipe_id, "string") then
        return
    end
    if checkBuilder(player) then
        player["components"]["builder"]:UnlockRecipe(recipe_id)
    end
    if say_str then
        HH_UTILS:HHSay(player, say_str)
    end
end
local recipe_ability = {
    ["unlock_more_tool"] = function(player)
        if checkBuilder(player) then
            player["components"]["builder"]:UnlockRecipe("gentleness_tool_a")
            player["components"]["builder"]:UnlockRecipe("gentleness_fan")
        end
    end,

    ["unlock_more_magic"] = function(player)
        if checkBuilder(player) then
            player["components"]["builder"]:UnlockRecipe("gentleness_plant")
            player["components"]["builder"]:UnlockRecipe("gentleness_fertilizer")
            player["components"]["builder"]:UnlockRecipe("gentleness_rain")
            player["components"]["builder"]:UnlockRecipe("gentleness_bird")
            player["components"]["builder"]:UnlockRecipe("gentleness_sleep")
            player["components"]["builder"]:UnlockRecipe("gentleness_moon")
            player["components"]["builder"]:UnlockRecipe("gentleness_fish")
            player["components"]["builder"]:UnlockRecipe("gentleness_lighting")
        end
    end,
    ["magic_plant"] = function(player)
        unLockRecipe(player, "gentleness_plant", "生长魔法已解锁")
    end,
    ["magic_fertilizer"] = function(player)
        unLockRecipe(player, "gentleness_fertilizer", "施肥魔法已解锁")
    end,
    ["magic_rain"] = function(player)
        unLockRecipe(player, "gentleness_rain", "雨书魔法已解锁")
    end,
    ["magic_bird"] = function(player)
        unLockRecipe(player, "gentleness_bird", "唤鸟魔法已解锁")
    end,
    ["magic_sleep"] = function(player)
        unLockRecipe(player, "gentleness_sleep", "催眠魔法已解锁")
    end,
    ["magic_moon"] = function(player)
        unLockRecipe(player, "gentleness_moon", "月黑魔法已解锁")
    end,
    ["magic_fish"] = function(player)
        unLockRecipe(player, "gentleness_fish", "鱼群魔法已解锁")
    end,
    ["magic_lighting"] = function(player)
        unLockRecipe(player, "gentleness_lighting", "闪电魔法已解锁")
    end,
}

local ability_fn_list = {
    ["immune_sandstorm"] = function(player)
        if HH_UTILS:HasComponents(player, "playervision") then
            player:AddTag("g_immune_sandstorm")
            player["components"]["playervision"]:ForceGoggleVision(true)
        end
    end,
}

local function checkLevel(inst)
    if inst["level"] and inst["level"] == 3 then
        return true
    end
    return false
end

local kill_target = {
    ["moose"] = { ["target_id"] = "spring_boss", },
    ["lightninggoat"] = { ["target_id"] = "lighting_goat", },
    ["dragonfly"] = { ["target_id"] = "dragonfly", },
    ["deerclops"] = { ["target_id"] = "deerclops", },
    ["mutateddeerclops"] = { ["target_id"] = "mutateddeerclops", },
    ["bearger"] = { ["target_id"] = "bearger", },
    ["mutatedbearger"] = { ["target_id"] = "mutatedbearger", },
    ["crabking"] = { ["target_id"] = "crabking", },
    ["antlion"] = { ["target_id"] = "antlion", },
    ["beequeen"] = { ["target_id"] = "beequeen", },
    ["stalker_atrium"] = { ["target_id"] = "stalker_atrium", ["check_fn"] = function(inst)
        return not inst["atriumdecay"]
    end, },

    ["shadow_bishop"] = { ["target_id"] = "shadow_bishop", ["check_fn"] = checkLevel, },
    ["shadow_rook"] = { ["target_id"] = "shadow_rook", ["check_fn"] = checkLevel, },
    ["shadow_knight"] = { ["target_id"] = "shadow_knight", ["check_fn"] = checkLevel, },
}
local harvest_task = {
    ["grass"] = "grass",
    ["sapling"] = "twigs",
    ["berrybush"] = "berrybush",
    ["berrybush2"] = "berrybush",
    ["berrybush_juicy"] = "berrybush",
    ["flower_cave"] = "lightbulb",
    ["flower_cave_double"] = "lightbulb",
    ["flower_cave_triple"] = "lightbulb",
    ["reeds"] = "reed",
    ["monkeytail"] = "reed",
    ["gentleness_jasmine"] = "jasmine_bush",
}

local HH_TREE = {
    ["evergreen"] = true,
    ["evergreen_sparse"] = true,
}
local task_target_config = {

    ["grass"] = { ["current"] = 0, ["max"] = 80, ["box_prefab"] = "gentleness_box_spring_a", },
    ["twigs"] = { ["current"] = 0, ["max"] = 80, ["box_prefab"] = "gentleness_box_spring_b", },
    ["berrybush"] = { ["current"] = 0, ["max"] = 40, ["box_prefab"] = "gentleness_box_spring_c", },
    ["lightbulb"] = { ["current"] = 0, ["max"] = 20, ["box_prefab"] = "gentleness_box_spring_d", },
    ["jasmine_bush"] = { ["current"] = 0, ["max"] = 20, ["box_prefab"] = "gentleness_box_spring_e", },
    ["reed"] = { ["current"] = 0, ["max"] = 20, ["box_prefab"] = "gentleness_box_spring_f", },
    ["tree"] = { ["current"] = 0, ["max"] = 100, ["box_prefab"] = "gentleness_box_spring_g", },
    ["stone"] = { ["current"] = 0, ["max"] = 100, ["box_prefab"] = "gentleness_box_spring_h", },

    ["harvest"] = { ["chance"] = 0.01, ["box_prefab"] = "gentleness_box_christmas_a", },
    ["fertilize"] = { ["current"] = 0, ["max"] = 100, ["box_prefab"] = "gentleness_box_christmas_b", },
    ["spring_boss"] = { ["chance"] = 0.2, ["box_prefab"] = "gentleness_box_christmas_c", },
    ["bird"] = { ["chance"] = 0.01, ["box_prefab"] = "gentleness_box_christmas_d", },
    ["emote_sleep"] = { ["current"] = 0, ["max"] = 1, ["box_prefab"] = "gentleness_box_christmas_e", },
    ["shadow_bishop"] = { ["current"] = 0, ["max"] = 1, ["box_prefab"] = "gentleness_box_christmas_f", },
    ["shadow_rook"] = { ["current"] = 0, ["max"] = 1, ["box_prefab"] = "gentleness_box_christmas_f", },
    ["shadow_knight"] = { ["current"] = 0, ["max"] = 1, ["box_prefab"] = "gentleness_box_christmas_f", },
    ["fish"] = { ["current"] = 0, ["max"] = 50, ["box_prefab"] = "gentleness_box_christmas_g", },
    ["lighting_goat"] = { ["current"] = 0, ["max"] = 5, ["box_prefab"] = "gentleness_box_christmas_h", },

    ["dragonfly"] = { ["current"] = 0, ["max"] = 1, ["box_prefab"] = "gentleness_box_valentine_a", },
    ["deerclops"] = { ["current"] = 0, ["max"] = 1, ["box_prefab"] = "gentleness_box_valentine_b", },
    ["mutateddeerclops"] = { ["current"] = 0, ["max"] = 1, ["box_prefab"] = "gentleness_box_valentine_b", },
    ["bearger"] = { ["current"] = 0, ["max"] = 1, ["box_prefab"] = "gentleness_box_valentine_c", },
    ["mutatedbearger"] = { ["current"] = 0, ["max"] = 1, ["box_prefab"] = "gentleness_box_valentine_c", },
    ["crabking"] = { ["current"] = 0, ["max"] = 1, ["box_prefab"] = "gentleness_box_valentine_d", },
    ["antlion"] = { ["current"] = 0, ["max"] = 1, ["box_prefab"] = "gentleness_box_valentine_e", },

    ["beequeen"] = { ["current_kill_index"] = 1, ["max_kill_index"] = 8, ["max_kill_index_chance"] = 0.05, ["box_prefab"] = "gentleness_box_new_year_", },

    ["stalker_atrium"] = { ["current_kill_index"] = 1, ["max_kill_index"] = 8, ["max_kill_index_chance"] = 0.05, ["box_prefab"] = "gentleness_box_halloween_", },

}
local function checkComponents(inst)
    return HH_UTILS:HasComponents(inst, "gentleness_player")
end
local function pickSomething(inst, data)
    if not data or not data["object"] then
        return
    end
    if not checkComponents(inst) then
        return
    end
    local hh_target = data["object"]
    if harvest_task[hh_target["prefab"]] then
        inst["components"]["gentleness_player"]:AddTaskTarget(harvest_task[hh_target["prefab"]])
    end
    inst["components"]["gentleness_player"]:AddTaskTarget("harvest")
end
local function onAttackOther(inst, data)
    if not data or not data["target"] or not data["target"]["Transform"] then
        return
    end
    if not checkComponents(inst) then
        return
    end
    if not inst["components"]["gentleness_player"]:HasAbility("atk_aoe") then
        return
    end

    if inst["hh_aoe_cd"] then
        return false
    end
    inst["hh_aoe_cd"] = true
    if not inst["hh_aoe_cd_task"] then
        inst["hh_aoe_cd_task"] = inst:DoTaskInTime(0.3, function(hh_inst)
            hh_inst["hh_aoe_cd"] = false
            HH_UTILS:HHKillTask(hh_inst, "hh_aoe_cd_task")
        end)
    end
    local hh_target = data["target"]
    local x, y, z = hh_target["Transform"]:GetWorldPosition()

    local hand_weapon = inst["components"]["inventory"]:GetEquippedItem(EQUIPSLOTS["HANDS"])
    if not hand_weapon then
        return
    end
    local ents = TheSim:FindEntities(x, 0, z, 3.5, { "_combat" },
            {
                "INLIMBO", "NOCLICK", "notarget", "player",
                "noattack", "playerghost", "wall", "structure", "balloon",
                "companion", "glommer", "friendlyfruitfly", "abigail", "shadowminion"
            })
    if not ents then
        return
    end
    for k, ent in ipairs(ents) do
        if HH_UTILS:HasComponents(ent, "combat")
                and ent ~= hh_target and HH_UTILS:NotIsDead(ent)
                and HH_UTILS:CanHitTarget(inst, ent)
                and inst["components"]["combat"]:IsValidTarget(ent)
        then
            local weapon_damage = inst["components"]["combat"]:CalcDamage(ent, hand_weapon)
            if HH_UTILS:IsHHType(weapon_damage, "number") then
                ent["components"]["combat"]:GetAttacked(inst, weapon_damage * 0.75)
            end
        end
    end

end
local function hookInventory(player)
    if not HH_UTILS:HasComponents(player, "inventory") then
        return
    end
    local oldApplyDamage = player["components"]["inventory"]["ApplyDamage"]
    player["components"]["inventory"]["ApplyDamage"] = function(self, damage, attacker, weapon, spdamage, ...)
        local hh_player = self["inst"]
        if HH_UTILS:HasComponents(hh_player, "gentleness_player")
                and hh_player["components"]["gentleness_player"]:HasAbility("miss_damage")
                and HH_UTILS:NotIsDead(hh_player)
        then

            if not hh_player["hh_miss_damage_cd"] and not hh_player["hh_refrigeration_task"] then
                if not hh_player["hh_miss_damage_cd_task"] then
                    hh_player["hh_miss_damage_cd_task"] = hh_player:DoTaskInTime(0.33, function(_inst)
                        hh_player["hh_miss_damage_cd"] = true
                        HH_UTILS:HHKillTask(_inst, "hh_miss_damage_cd_task")
                        HH_UTILS:HHKillTask(_inst, "hh_refrigeration_task")
                        hh_player["hh_refrigeration_task"] = hh_player:DoTaskInTime(5, function(_player)
                            hh_player["hh_miss_damage_cd"] = false
                            HH_UTILS:HHKillTask(_player, "hh_refrigeration_task")
                        end)
                    end)
                end

                local hh_spawn = SpawnPrefab("shadow_shield1")
                if hh_spawn and hh_spawn["Transform"] then
                    local x, y, z = hh_player["Transform"]:GetWorldPosition()
                    hh_spawn["Transform"]:SetPosition(x, y, z)
                end
                return 0, nil
            end
        end

        return oldApplyDamage(self, damage, attacker, weapon, spdamage, ...)
    end
end

local function hookTemperature(player)
    if not HH_UTILS:HasComponents(player, "temperature") then
        return
    end
    local oldSetTemperature = player["components"]["temperature"]["SetTemperature"]
    player["components"]["temperature"]["SetTemperature"] = function(self, value, ...)
        local hh_player = self["inst"]
        if HH_UTILS:HasComponents(hh_player, "gentleness_player")
                and HH_UTILS:IsHHType(value, "number")
        then
            if hh_player["components"]["gentleness_player"]:HasAbility("immune_cold") then
                if value < 15 then
                    value = 15
                end
            end
            if hh_player["components"]["gentleness_player"]:HasAbility("immune_hot") then
                if value > 50 then
                    value = 50
                end
            end
        end
        if oldSetTemperature then
            oldSetTemperature(self, value, ...)
        end
    end
end

local function hookGrogginess(player)
    if not HH_UTILS:HasComponents(player, "grogginess") then
        return
    end
    local oldAddGrogginess = player["components"]["grogginess"]["AddGrogginess"]
    player["components"]["grogginess"]["AddGrogginess"] = function(self, ...)
        local hh_player = self["inst"]
        if HH_UTILS:HasComponents(hh_player, "gentleness_player")
                and hh_player["components"]["gentleness_player"]:HasAbility("immune_sleep")
        then
            return
        end
        return oldAddGrogginess(self, ...)
    end
end

local function onKilled(inst, data)
    local victim = data["victim"]
    if victim:IsValid() and not victim:HasTag("player")
            and HH_UTILS:HasComponents(inst, "gentleness_player")
    then
        local victim_prefab = victim["prefab"]

        if victim_prefab == "deerclops" and checkBuilder(inst) then
            inst["components"]["builder"]:UnlockRecipe("gentleness_hat")
            inst["components"]["builder"]:UnlockRecipe("gentleness_amulet")
            inst["components"]["builder"]:UnlockRecipe("gentleness_armor")
            inst["components"]["builder"]:UnlockRecipe("gentleness_staff_cat")
        end
        if kill_target[victim_prefab] then

            if kill_target[victim_prefab]["check_fn"] then
                local check_result = kill_target[victim_prefab]["check_fn"](victim)
                if not check_result then
                    return
                end
            end
            inst["components"]["gentleness_player"]:AddTaskTarget(kill_target[victim_prefab]["target_id"])
        end
    end
end
local function hookDrownable(player)
    if HH_UTILS:HasComponents(player, "drownable") then
        local oldShouldDrown = player["components"]["drownable"]["ShouldDrown"]
        player["components"]["drownable"]["ShouldDrown"] = function(self, ...)
            if self["inst"] and self["inst"]["g_can_in_water"] then
                self["enabled"] = false
                return false
            end
            return oldShouldDrown(self, ...)
        end
    end
end
local function finishedWork(inst, data)
    if not data or not data["target"] or not data["action"] then
        return
    end
    if not HH_UTILS:HasComponents(inst, "gentleness_player") then
        return
    end
    local hh_target = data["target"]
    local hh_action = data["action"]
    if not hh_target then
        return
    end
    local hh_prefab = hh_target["prefab"]
    if hh_action == ACTIONS["CHOP"] and not hh_target:HasTag("burnt") then
        if HH_TREE[hh_prefab] then
            inst["components"]["gentleness_player"]:AddTaskTarget("tree")
        end
    elseif hh_action == ACTIONS["MINE"] and hh_target and hh_target["prefab"] ~= "rock_avocado_fruit" then
        inst["components"]["gentleness_player"]:AddTaskTarget("stone")
    end
end
local function buildItem(inst, data)
    if data and data["item"] then
        local spawn_item = data["item"]
        if spawn_item["prefab"] == "panflute" and HH_UTILS:HasComponents(inst, "gentleness_player") then
            inst["components"]["gentleness_player"]:AddTaskTarget("emote_sleep")
        end
    end
end
local function fishingCancel(inst)
    if HH_UTILS:HasComponents(inst, "gentleness_player") then
        inst["components"]["gentleness_player"]:AddTaskTarget("fish")
    end
end
local function hookFreeze(player)
    if not HH_UTILS:HasComponents(player, "freezable") then
        return
    end
    local oldFreeze = player["components"]["freezable"]["Freeze"]
    player["components"]["freezable"]["Freeze"] = function(self, ...)
        local g_player = self["inst"]
        if HH_UTILS:HasComponents(g_player, "gentleness_player") then
            if g_player["components"]["gentleness_player"]:HasAbility("immune_freeze") then
                if HH_UTILS:HasComponents(g_player, "colouradder") then
                    g_player["components"]["colouradder"]:PopColour("freezable")
                end
                return
            end
        end
        if oldFreeze then
            oldFreeze(self, ...)
        end
    end
end
local function checkMonkeyItem(item)
    return item and HH_UTILS:HasComponents(item, "curseditem")
            and item["components"]["curseditem"]["curse"] == "MONKEY"
end
local function fuckMonkey(player)
    if not HH_UTILS:HasComponents(player, "cursable") then
        return
    end
    local g_com = player["components"]["cursable"]
    local oldIsCursable = g_com["IsCursable"]
    g_com["IsCursable"] = function(self, item, ...)
        if checkMonkeyItem(item) then
            return false
        end
        return oldIsCursable(self, item, ...)
    end
    local oldApplyCurse = g_com["ApplyCurse"]
    g_com["ApplyCurse"] = function(self, item, ...)
        if checkMonkeyItem(item) then
            item:RemoveTag("applied_curse")
            item["components"]["curseditem"]["cursed_target"] = nil
            return
        end
        return oldApplyCurse(self, item, ...)
    end
    local oldForceOntoOwner = g_com["ForceOntoOwner"]
    g_com["ForceOntoOwner"] = function(self, item, ...)
        if checkMonkeyItem(item) then
            return
        end
        return oldForceOntoOwner(self, item, ...)
    end
end
local function addAmuletLightInventory(player)
    if HH_UTILS:HasComponents(player, "gentleness_player") and HH_UTILS:NotIsDead(player) then
        HH_UTILS:HHRemoveFx(player, "hh_light_fx")
        if HH_UTILS:HasComponents(player, "inventory")
                and player["components"]["inventory"]:Has("gentleness_amulet", 1)
        then
            player["hh_light_fx"] = SpawnPrefab("gentleness_amulet_light")
            player["hh_light_fx"]["entity"]:SetParent(player["entity"])
        end
    end
end
local function getItem(player)
    addAmuletLightInventory(player)
end

local function loseItem(player)
    addAmuletLightInventory(player)
end
local HH_COM = Class(function(self, inst)
    self["inst"] = inst
    self["task_target"] = HH_UTILS:HHCopyTable(task_target_config)
    self["ability"] = HH_UTILS:HHCopyTable(ability_config)

    hookInventory(self["inst"])
    hookTemperature(self["inst"])
    hookGrogginess(self["inst"])
    hookDrownable(self["inst"])
    hookFreeze(self["inst"])
    fuckMonkey(self["inst"])
    self["inst"]:ListenForEvent("picksomething", pickSomething)
    self["inst"]:ListenForEvent("onattackother", onAttackOther)
    self["inst"]:ListenForEvent("killed", onKilled)
    self["inst"]:ListenForEvent("finishedwork", finishedWork)
    self["inst"]:ListenForEvent("builditem", buildItem)
    self["inst"]:ListenForEvent("fishingcatch", fishingCancel)
    self["inst"]:ListenForEvent("itemget", getItem)
    self["inst"]:ListenForEvent("itemlose", loseItem)
end)

function HH_COM:UnLockAbility(ability_id, need_fn)
    local ability_table = self["ability"] or {}
    if not ability_config[ability_id] or not HH_UTILS:IsHHType(ability_table[ability_id], "number") then
        return false, "未知能力解锁失败"
    end
    if ability_table[ability_id] > 0 then
        return true, "当前能力已解锁"
    end

    if need_fn and recipe_ability[ability_id] then
        recipe_ability[ability_id](self["inst"])
    end

    if ability_fn_list[ability_id] then
        ability_fn_list[ability_id](self["inst"])
    end
    self["ability"][ability_id] = 1
    return true, "解锁成功"

end

function HH_COM:HasAbility(ability_id)
    return HH_UTILS:IsHHType(self["ability"][ability_id], "number") and self["ability"][ability_id] > 0
end

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

function HH_COM:AddTaskTarget(target_id)
    if not HH_UTILS:NotIsDead(self["inst"]) or not HH_UTILS:HasComponents(self["inst"], "inventory") then
        return false, "当前人物状态不能进行操作"
    end
    local target_config = self["task_target"]
    if not target_config[target_id] then
        return false, "非法任务目标"
    end
    local task_config = target_config[target_id]
    local spawn_item_id = task_config["box_prefab"]
    local can_spawn_item = true

    if task_config["current"] then
        local max_target_num = task_config["max"] or 100
        local current_target_num = task_config["current"]
        task_config["current"] = current_target_num + 1

        if task_config["current"] < max_target_num then
            can_spawn_item = false
        else
            task_config["current"] = 0
        end
    end

    if task_config["chance"] then
        local random_num = math["random"]()

        if random_num > task_config["chance"] then
            can_spawn_item = false
        end
    end

    if task_config["current_kill_index"] and spawn_item_id then
        local current_index = task_config["current_kill_index"]
        local max_index = task_config["max_kill_index"] or 8
        if current_index > max_index then
            task_config["current_kill_index"] = 1
        end
        if current_index == max_index and HH_UTILS:IsHHType(task_config["max_kill_index_chance"], "number") then
            local random_num = math["random"]()
            if random_num > task_config["max_kill_index_chance"] then


                spawn_item_id = "gentleness_box_random"
            else
                spawn_item_id = spawn_item_id .. tostring(box_id_list[task_config["current_kill_index"]] or "a")
                task_config["current_kill_index"] = task_config["current_kill_index"] + 1
            end
        else
            spawn_item_id = spawn_item_id .. tostring(box_id_list[task_config["current_kill_index"]] or "a")
            task_config["current_kill_index"] = task_config["current_kill_index"] + 1
        end
    end

    if spawn_item_id and can_spawn_item then
        local spawn_item = SpawnPrefab(spawn_item_id)
        if spawn_item and HH_UTILS:HasComponents(spawn_item, "inventoryitem") then
            self["inst"]["components"]["inventory"]:GiveItem(spawn_item)
        end
    end
    return true, "执行成功"
end
function HH_COM:BuyBox(item_id, item_value)
    if not (HH_UTILS:IsHHType(item_value, "number") and item_value > 0) then
        return false
    end
    local player = self["inst"]
    if not HH_UTILS:HasComponents(player, "inventory") or not HH_UTILS:NotIsDead(player) then
        HH_UTILS:HHSay(player, "who are you")
        return false
    end
    if not player["components"]["inventory"]:Has("gentleness_coin", item_value) then
        HH_UTILS:HHSay(player, string["format"]("物品栏沙币数量不足 最低%s个", tostring(item_value)))
        return false
    end
    local spawn_box = SpawnPrefab(item_id)
    if not spawn_box then
        HH_UTILS:HHSay(player, "错误的道具 购买失败")
        return false
    end
    if spawn_box["Remove"] and not spawn_box["Transform"] then
        spawn_box:Remove()
        HH_UTILS:HHSay(player, "非法道具")
        return false
    end
    if HH_UTILS:HasComponents(spawn_box, "inventoryitem") then
        player["components"]["inventory"]:GiveItem(spawn_box)
    else
        local player_x, player_y, player_z = player["Transform"]:GetWorldPosition()
        spawn_box["Transform"]:SetPosition(player_x, player_y, player_z)
    end
    player["components"]["inventory"]:ConsumeByName("gentleness_coin", item_value)
    HH_UTILS:HHSay(player, "购买成功")
    return true
end
function HH_COM:OnSave()
    return {
        ["task_target"] = self["task_target"],
        ["ability"] = self["ability"],
    }
end

function HH_COM:OnLoad(data)
    if not data then
        return
    end
    local target_list = data["task_target"] or {}
    for i, v in pairs(target_list) do
        if self["task_target"] and self["task_target"][i] then
            self["task_target"][i] = v
        end
    end
    local ability_list = data["ability"] or {}
    for i, v in pairs(ability_list) do
        if HH_UTILS:IsHHType(v, "number") and v > 0 then
            self:UnLockAbility(i)
        end
    end
end
return HH_COM
