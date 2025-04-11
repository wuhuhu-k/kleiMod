----
---文件处理时间:2024-07-01 23:48:41
---
local HH_UTILS = require("utils/gentleness_utils")

local function OnTimerDone(inst, data)
    if data.name == "buffover" then
        inst.components.debuff:Stop()
    end
end

local function MakeBuff(name, onattachedfn, onextendedfn, ondetachedfn, duration, priority, prefabs)
    local ATTACH_BUFF_DATA = {
        buff = "ANNOUNCE_ATTACH_BUFF_" .. string.upper(name),
        priority = priority
    }
    local DETACH_BUFF_DATA = {
        buff = "ANNOUNCE_DETACH_BUFF_" .. string.upper(name),
        priority = priority
    }

    local function OnAttached(inst, target)
        inst.entity:SetParent(target.entity)
        inst.Transform:SetPosition(0, 0, 0) 
        inst:ListenForEvent("death", function()
            inst.components.debuff:Stop()
        end, target)

        
        if onattachedfn ~= nil then
            onattachedfn(inst, target)
        end
    end

    local function OnExtended(inst, target)
        if duration then
            inst.components.timer:StopTimer("buffover")
            inst.components.timer:StartTimer("buffover", duration)
        end
        
        if onextendedfn ~= nil then
            onextendedfn(inst, target)
        end
    end

    local function OnDetached(inst, target)
        if ondetachedfn ~= nil then
            ondetachedfn(inst, target)
        end
        
        inst:Remove()
    end
    local function fn()
        local inst = CreateEntity()
        if not TheWorld.ismastersim then
            inst:DoTaskInTime(0, inst.Remove)
            return inst
        end
        inst.entity:AddTransform()
        inst.entity:Hide()
        inst.persists = false
        inst:AddTag("CLASSIFIED")

        inst:AddComponent("debuff")
        inst.components.debuff:SetAttachedFn(OnAttached)
        inst.components.debuff:SetDetachedFn(OnDetached)
        inst.components.debuff:SetExtendedFn(OnExtended)
        inst.components.debuff.keepondespawn = true

        if duration ~= nil then
            inst:AddComponent("timer")
            inst.components.timer:StartTimer("buffover", duration)
            inst:ListenForEvent("timerdone", OnTimerDone)
        end

        return inst
    end
    return Prefab(name, fn, nil, prefabs)
end
local buff_pre = {}
local function launchItem(item, angle)
    if not item["Physics"] then
        return
    end
    local speed = math["random"]() * 4 + 2
    angle = angle * DEGREES
    item["Physics"]:SetVel(speed * math["cos"](angle), math["random"]() * 2 + 8, speed * math["sin"](angle))
end
local function spawnPoop(player)
    if not player or not HH_UTILS:NotIsDead(player) or not player["Transform"] then
        return
    end
    local random_num = math["random"]()
    if random_num > 0.4 then
        return
    end
    HH_UTILS:HHSay(player, "等一下")
    if HH_UTILS:HasComponents(player, "hunger") then
        player["components"]["hunger"]:DoDelta(-3)
    end
    local x, y, z = player["Transform"]:GetWorldPosition()
    local face_angle = player["Transform"]:GetRotation()
    if face_angle < 0 then
        face_angle = face_angle + 360
    end
    local poop_inst = SpawnPrefab("poop")
    if poop_inst then
        poop_inst["Transform"]:SetPosition(x, 1, z)
        launchItem(poop_inst, -face_angle + 180)
    end
end
local function removeNoTargetBuff(player)
    if HH_UTILS:HasComponents(player, "debuffable") then
        player["components"]["debuffable"]:RemoveDebuff("g_no_target_buff")
    end
end
local buff_config = {
    
    ["g_spawn_poop_buff"] = {
        ["time"] = 120,
        ["start_fn"] = function(inst, player)
            if not player or not HH_UTILS:NotIsDead(player) then
                return
            end
            HH_UTILS:HHKillTask(player, "g_spawn_poop_buff_task")
            player["g_spawn_poop_buff_task"] = player:DoPeriodicTask(2, function(_player)
                spawnPoop(_player)
            end)
        end,
        
        ["extended_fn"] = function(inst, player)
        end,
        ["end_fn"] = function(inst, player)
            HH_UTILS:HHKillTask(player, "g_spawn_poop_buff_task")
            inst:Remove()
        end,
    },
    ["g_no_target_buff"] = {
        ["time"] = nil,
        ["start_fn"] = function(inst, player)
            if not player or not HH_UTILS:NotIsDead(player) then
                return
            end
            player:AddTag("g_no_target_buff")
            player:ListenForEvent("onattackother", removeNoTargetBuff)
        end,
        
        ["extended_fn"] = function(inst, player)
        end,
        ["end_fn"] = function(inst, player)
            if player then
                player:RemoveTag("g_no_target_buff")
                player:RemoveEventCallback("onattackother", removeNoTargetBuff)
            end
            inst:Remove()
        end,
    },
    ["g_add_attack_buff"] = {
        ["time"] = 480,
        ["start_fn"] = function(inst, player)
            if not player or not HH_UTILS:NotIsDead(player) then
                return
            end
            if HH_UTILS:HasComponents(player, "combat") then
                player["components"]["combat"]["externaldamagemultipliers"]:SetModifier(inst, 1.5, inst["prefab"])
            end
        end,
        
        ["extended_fn"] = function(inst, player)
        end,
        ["end_fn"] = function(inst, player)
            if HH_UTILS:HasComponents(player, "combat") then
                player["components"]["combat"]["externaldamagemultipliers"]:RemoveModifier(inst, inst["prefab"])
            end
            inst:Remove()
        end,
    },
    ["g_add_speed_buff"] = {
        ["time"] = 480,
        ["start_fn"] = function(inst, player)
            if not player or not HH_UTILS:NotIsDead(player) then
                return
            end
            if HH_UTILS:HasComponents(player, "locomotor") then
                player["components"]["locomotor"]:SetExternalSpeedMultiplier(inst, inst["prefab"], 1.5)
            end
        end,
        
        ["extended_fn"] = function(inst, player)
        end,
        ["end_fn"] = function(inst, player)
            if HH_UTILS:HasComponents(player, "locomotor") then
                player["components"]["locomotor"]:RemoveExternalSpeedMultiplier(inst, inst["prefab"])
            end
            inst:Remove()
        end,
    },
    ["g_add_magic_buff"] = {
        ["time"] = 480,
        ["start_fn"] = function(inst, player)
            if not player or not HH_UTILS:NotIsDead(player) then
                return
            end
            if HH_UTILS:HasComponents(player, "gentleness_magic") then
                HH_UTILS:HHKillTask(player, "buff_add_magic_task")
                player["buff_add_magic_task"] = player:DoPeriodicTask(1, function(_player)
                    if HH_UTILS:HasComponents(_player, "gentleness_magic") then
                        _player["components"]["gentleness_magic"]:DoDelta(5)
                    end
                end)
            end
        end,
        
        ["extended_fn"] = function(inst, player)
        end,
        ["end_fn"] = function(inst, player)
            HH_UTILS:HHKillTask(player, "buff_add_magic_task")
            inst:Remove()
        end,
    },
}
for i, v in pairs(buff_config) do
    table["insert"](buff_pre, MakeBuff(i, v["start_fn"], v["extended_fn"], v["end_fn"], v["time"], 1))
end
return unpack(buff_pre)
