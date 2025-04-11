----
---文件处理时间:2024-07-01 23:48:41
---
local MakePlayerCharacter = require("prefabs/player_common")

local HH_UTILS = require("utils/gentleness_utils")
local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
}
local prefabs = {}

local start_inv = { "gentleness_mlkx" }

local function onbecamehuman(inst)

    inst["components"]["locomotor"]:SetExternalSpeedMultiplier(inst, "gentleness_speed_mod", 1.2)
end

local function onbecameghost(inst)

    inst["components"]["locomotor"]:RemoveExternalSpeedMultiplier(inst, "gentleness_speed_mod")
end

local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end
local function onNewSpawn(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
    inst:DoTaskInTime(0.1, function(player)
        local x, y, z = player["Transform"]:GetWorldPosition()
        local back_inst = SpawnPrefab("gentleness_back")
        if back_inst and HH_UTILS:HasComponents(player, "inventory") then
            --player["components"]["inventory"]:GiveItem(back_inst)
            player["components"]["inventory"]:Equip(back_inst)
        end
    end)
end
local function hookBundler(com_self)
    local oldStopBundling = com_self["StopBundling"]

    com_self["StopBundling"] = function(self, ...)

        if self["itemprefab"] and self["itemprefab"] == "gentleness_amulet" then
            if self["bundlinginst"] ~= nil then
                if self["bundlinginst"]["components"]["container"] ~= nil then
                    if self["inst"]["components"]["inventory"] ~= nil then
                        local pos = self["bundlinginst"]:GetPosition()
                        for i = 1, self["bundlinginst"]["components"]["container"]:GetNumSlots() do
                            local item = self["bundlinginst"]["components"]["container"]:RemoveItemBySlot(i)
                            if item ~= nil then
                                item["prevcontainer"] = nil
                                item["prevslot"] = nil
                                self["inst"]["components"]["inventory"]:GiveItem(item, nil, pos)
                            end
                        end
                    else
                        self["bundlinginst"]["components"]["container"]:DropEverything()
                    end
                end
                self["bundlinginst"]:Remove()
                self["bundlinginst"] = nil
            end
            self["itemprefab"] = nil
            self["wrappedprefab"] = nil
            self["wrappedskinname"] = nil
            self["wrappedskin_id"] = nil
            return
        end
        if oldStopBundling then
            oldStopBundling(self, ...)
        end
    end
end

local common_postinit = function(inst)

    inst["MiniMapEntity"]:SetIcon("gentleness.tex")

    inst:AddTag("plantkin")

    inst:AddTag("masterchef")
    inst:AddTag("professionalchef")

    inst:AddTag("fastpicker")

    inst:AddTag("bookbuilder")
    inst:AddTag("reader")

    inst:AddTag("handyperson")

    inst:AddTag("fastbuilder")
    inst:AddTag("basicengineer")

    inst:AddTag("gentleness")

    inst["gentleness_magic_num"] = net_int(inst["GUID"], "inst.gentleness_magic_num", "gentleness_magic_num")
    inst["Transform"]:SetScale(0.8, 0.8, 0.8)
end

local master_postinit = function(inst)

    inst["soundsname"] = "willow"

    inst:AddComponent("reader")

    inst["components"]["builder"]["science_bonus"] = 1

    inst["components"]["health"]:SetMaxHealth(TUNING["GENTLENESS_HEALTH"])
    inst["components"]["hunger"]:SetMax(TUNING["GENTLENESS_HUNGER"])
    inst["components"]["sanity"]:SetMax(TUNING["GENTLENESS_SANITY"])

    inst["g_plant_task"] = inst:DoPeriodicTask(5, function(player)
        local x, y, z = player["Transform"]:GetWorldPosition()
        local ents=TheSim:FindEntities(x, y, z, 8, nil, { "INLIMBO", "FX" }, { "tendable_farmplant", "trap_bramble" })
        for _, v in pairs(ents) do
            if v["components"]["farmplanttendable"] then
                v["components"]["farmplanttendable"]:TendTo(player)
            end
        end
    end)

    inst["components"]["health"]["externalabsorbmodifiers"]:SetModifier(inst, 0.05, "gentleness_absorb")

    inst["components"]["locomotor"]:SetExternalSpeedMultiplier(inst, "gentleness_speed_mod", 1.2)

    inst:AddComponent("gentleness_magic")
    inst["components"]["gentleness_magic"]:SetMaxMagic(TUNING["GENTLENESS_MAGIC_MAX"])
    inst:AddComponent("gentleness_player")

    local bundler_com = inst["components"]["bundler"]
    if bundler_com then
        hookBundler(bundler_com)
    end
    inst["OnLoad"] = onload
    inst["OnNewSpawn"] = onNewSpawn

end
return MakePlayerCharacter("gentleness", prefabs, assets, common_postinit, master_postinit, start_inv)
