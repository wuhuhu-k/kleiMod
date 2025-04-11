----
---文件处理时间:2024-07-01 23:48:41
---
local HH_UTILS = require("utils/gentleness_utils")
local amulet_id = "gentleness_amulet"

local function hookFastAction(sg, act_id)
    local oldPick = sg["actionhandlers"][act_id]["deststate"]
    sg["actionhandlers"][act_id]["deststate"] = function(inst, action)
        local new_sg = "doshortaction"
        if inst and inst["prefab"] == "gentleness" then
            return new_sg
        end
        return oldPick(inst, action)
    end
end
AddStategraphPostInit("wilson", function(sg)
    local bundle_sg = sg["actionhandlers"][ACTIONS["BUNDLE"]]
    local oldGetSgId = bundle_sg["deststate"]
    bundle_sg["deststate"] = function(inst, action)

        if action and action["invobject"] and action["invobject"]["prefab"] == amulet_id
                and inst and inst["prefab"] ~= "gentleness" then
            return "give"
        end
        return oldGetSgId(inst, action)
    end
    local oldAction = bundle_sg["action"]
    local oldFn = oldAction["fn"]
    oldAction["fn"] = function(act, ...)
        local target = act["invobject"] or act["target"]
        local player = act["doer"]
        if target and target["prefab"] == amulet_id and player and player["prefab"] ~= "gentleness" then
            HH_UTILS:HHSay(player, "这不是我能使用的东西")
            return true
        end
        return oldFn(act, ...)
    end
    local sleep_event = { "knockedout", "yawn", }
    for i, v in ipairs(sleep_event) do
        local knockedout_sg = sg["events"][v]
        if knockedout_sg and knockedout_sg["fn"] then
            local oldSleepFn = knockedout_sg["fn"]
            knockedout_sg["fn"] = function(inst, ...)
                if HH_UTILS:HasComponents(inst, "gentleness_player") and inst["components"]["gentleness_player"]:HasAbility("immune_sleep") then
                    return
                end
                if oldSleepFn then
                    oldSleepFn(inst, ...)
                end
            end
        end
    end
    hookFastAction(sg, ACTIONS["COOK"])
    hookFastAction(sg, ACTIONS["HARVEST"])
end)
AddStategraphPostInit("wilson_client", function(sg)
    local bundle_sg = sg["actionhandlers"][ACTIONS["BUNDLE"]]
    local oldGetSgId = bundle_sg["deststate"]
    bundle_sg["deststate"] = function(inst, action)
        if action and action["invobject"] and action["invobject"]["prefab"] == amulet_id
                and inst and inst["prefab"] ~= "gentleness" then
            return "give"
        end
        return oldGetSgId(inst, action)
    end
    hookFastAction(sg, ACTIONS["COOK"])
    hookFastAction(sg, ACTIONS["HARVEST"])
end)

local function handleSgTargetAnim(inst, bool)
    if HH_UTILS:IsHHType(inst, "table") then
        if not bool and inst["Hide"] then
            inst:Hide()
        end
        if bool and inst["Show"] then
            inst:Show()
        end
    end

end
local function getSgAnim(inst)
    if inst["prefab"] == "gentleness_andwobble" then
        return "gentleness_riding"
    elseif inst["prefab"] == "gentleness_carousel" then
        return "gentleness_carousel"
    end
    return "gentleness_riding"
end
local function updateScale(player)
    if HH_UTILS:IsHHType(player, "table") and player["Transform"] then
        local scale_num = 1
        if player["prefab"] == "gentleness" then
            scale_num = 0.8
        end
        player["Transform"]:SetScale(scale_num, scale_num, scale_num)
        player["Transform"]:SetFourFaced()
    end
end
--优化下秋千下来时的坐标
local function updateStartPos(player, pos_list)
    if HH_UTILS:IsHHType(pos_list, "table")
            and HH_UTILS:IsHHType(pos_list["x"], "number")
            and HH_UTILS:IsHHType(pos_list["y"], "number")
            and HH_UTILS:IsHHType(pos_list["z"], "number")
            and player and player["Transform"]
    then
        player["Transform"]:SetPosition(pos_list["x"], pos_list["y"], pos_list["z"])
    end
end
--上帝模式-gentleness_carousel 旋转木马
local function handleSetInvincible(chair, player, boolean)
    if HH_UTILS:IsHHType(chair, "table") and chair["prefab"] == "gentleness_carousel"
            and HH_UTILS:IsHHType(player, "table") and HH_UTILS:HasComponents(player, "health") and HH_UTILS:NotIsDead(player)
    then
        player["components"]["health"]:SetInvincible(boolean)
    end
end
----开坐
AddStategraphState("wilson", State {
    ["name"] = "gentleness_sit",
    ["tags"] = { "busy", "gentleness_sit", "notalking" },
    ["onenter"] = function(inst, target)
        if not target then
            return
        end
        inst["components"]["locomotor"]:Stop()
        inst["sg"]["statemem"]["sittarget"] = target
        inst["Transform"]:SetPosition(target["Transform"]:GetWorldPosition())
        inst["AnimState"]:PlayAnimation(getSgAnim(target), true)
        inst["Transform"]:SetScale(1, 1, 1)
        inst["Physics"]:SetMass(0)
        handleSetInvincible(target, inst, true)
    end,

    ["timeline"] = {
        TimeEvent(0.2, function(inst)
            inst["sg"]:RemoveStateTag("busy")
        end),
    },

    ["events"] = {
        EventHandler("onremove", function(inst)
            local chair = inst["sg"]["statemem"]["sittarget"]
            handleSetInvincible(chair, inst, false)
            if chair ~= nil and chair["PlayerStopSit"] then
                chair:PlayerStopSit()
            end
            updateScale(inst)
        end),
    },
    ["onexit"] = function(inst)
        inst["Physics"]:SetMass(75)
        local chair = inst["sg"]["statemem"]["sittarget"]
        handleSetInvincible(chair, inst, false)
        if chair ~= nil and chair["PlayerStopSit"] then
            chair:PlayerStopSit()
        end
        updateScale(inst)
    end,
})
local function getSwingAnim(inst)
    HH_UTILS:HHPrint(inst["g_sit_players"])
    if not inst["g_sit_players"] then
        return nil
    end
    if inst["g_sit_players"]["left"] and not inst["g_sit_players"]["right"] then
        return "idle_b_only"
    end
    if not inst["g_sit_players"]["right"] and not inst["g_sit_players"]["left"] then
        return "idle_b_only"
    end
    if inst["g_sit_players"]["right"] and not inst["g_sit_players"]["left"] then
        return "idle_a_only"
    end
    return "idle_a_only"
end
AddStategraphState("wilson", State {
    ["name"] = "gentleness_sit_swing",
    ["tags"] = { "busy", "gentleness_sit_swing", "notalking" },
    ["onenter"] = function(inst, data)
        if not HH_UTILS:IsHHType(data, "table") then
            return
        end
        local target = data["target"]
        if not target or not target["AddSitPlayer"] then
            return
        end
        inst["components"]["locomotor"]:Stop()
        inst["sg"]["statemem"]["sittarget"] = target
        local inst_x, inst_y, inst_z = inst["Transform"]:GetWorldPosition()
        inst["sg"]["statemem"]["sit_start_pos"] = {
            ["x"] = inst_x,
            ["y"] = inst_y,
            ["z"] = inst_z,
        }
        inst["Transform"]:SetPosition(target["Transform"]:GetWorldPosition())
        inst["Transform"]:SetTwoFaced()
        inst["Transform"]:SetScale(1, 1, 1)
        inst["Physics"]:SetMass(0)

        local angle = target["Transform"]:GetRotation()
        inst["Transform"]:SetRotation(angle)
        --local new_anim = getSwingAnim(target)
        if HH_UTILS:IsHHType(data["anim"], "string") then
            inst["AnimState"]:PlayAnimation(data["anim"], true)
        end
        inst:AddTag("gentleness_swing_sit")
    end,

    ["timeline"] = {
        TimeEvent(0.2, function(inst)
            inst["sg"]:RemoveStateTag("busy")
        end),
    },

    ["events"] = {
        EventHandler("onremove", function(inst)
            HH_UTILS:HHKillTask(inst, "g_sg_task")
            local chair = inst["sg"]["statemem"]["sittarget"]
            if chair ~= nil and chair["ReduceSitPlayer"] then
                chair:ReduceSitPlayer(inst)
            end
            updateStartPos(inst, inst["sg"]["statemem"]["sit_start_pos"])
            updateScale(inst)
            inst:RemoveTag("gentleness_swing_sit")
        end),
    },
    ["onexit"] = function(inst)
        HH_UTILS:HHKillTask(inst, "g_sg_task")
        inst["Physics"]:SetMass(75)
        local chair = inst["sg"]["statemem"]["sittarget"]
        if chair ~= nil and chair["ReduceSitPlayer"] then
            chair:ReduceSitPlayer(inst)
        end
        updateStartPos(inst, inst["sg"]["statemem"]["sit_start_pos"])
        updateScale(inst)
        inst:RemoveTag("gentleness_swing_sit")
    end,
})