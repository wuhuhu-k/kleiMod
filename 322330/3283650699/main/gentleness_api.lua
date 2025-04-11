----
---文件处理时间:2024-07-01 23:48:41
---
local HH_UTILS = require("utils/gentleness_utils")
AddPrefabPostInit("world", function(inst)
    if not TheWorld["ismastersim"] then
        return inst
    end
    inst:AddComponent("gentleness_world")
end)
local HH_ALL_PREFABS = require("enums/gentleness_prefabs")
local inv_list = {}
for i, v in pairs(HH_ALL_PREFABS) do
    if v and v["xml"] then
        inv_list[i] = v["xml"]
    end
end
local function draw(inst)
    if inst["components"]["drawable"] then
        local oldOnDrawnFn = inst["components"]["drawable"]["ondrawnfn"] or nil
        inst["components"]["drawable"]["ondrawnfn"] = function(_inst, image, src, atlas, bgimagename, bgatlasname, ...)
            if oldOnDrawnFn ~= nil then
                oldOnDrawnFn(_inst, image, src, atlas, bgimagename, bgatlasname, ...)
            end

            if image ~= nil and inv_list[image] then

                if atlas == nil then
                    atlas = inv_list[image]
                end
                local atlas_path = resolvefilepath_soft(atlas)
                if atlas_path then
                    _inst["AnimState"]:OverrideSymbol("SWAP_SIGN", atlas_path, string["format"]("%s.tex", image))
                end
            end
        end
    end
end
AddPrefabPostInit("minisign", draw)
AddPrefabPostInit("minisign_drawn", draw)
AddPrefabPostInit("decor_pictureframe", draw)

AddComponentPostInit("combat", function(self)
    local oldSetTarget = self["SetTarget"]
    self["SetTarget"] = function(self, target, ...)
        if target and target:HasTag("g_no_target_buff") then
            return false
        end
        return oldSetTarget(self, target, ...)
    end
    local oldCanTarget = self["CanTarget"]
    self["CanTarget"] = function(self, target, ...)
        if target and target:HasTag("g_no_target_buff") then
            return false
        end
        return oldCanTarget(self, target, ...)
    end
end)
AddComponentPostInit("pickable", function(self)
    local oldFertilize = self["Fertilize"]
    self["Fertilize"] = function(self, item, player, ...)
        if HH_UTILS:HasComponents(player, "gentleness_player") then
            player["components"]["gentleness_player"]:AddTaskTarget("fertilize")
        end
        return oldFertilize(self, item, player, ...)
    end
end)
AddPrefabPostInit("birdcage", function(inst)
    if HH_UTILS:HasComponents(inst, "trader") then
        local trader_com = inst["components"]["trader"]
        local oldOnAccept = trader_com["onaccept"]
        trader_com["onaccept"] = function(inst, giver, item, ...)
            if HH_UTILS:HasComponents(item, "edible") and HH_UTILS:HasComponents(giver, "gentleness_player") then
                giver["components"]["gentleness_player"]:AddTaskTarget("bird")
            end
            oldOnAccept(inst, giver, item, ...)
        end
    end
end)
--
AddPlayerPostInit(function(inst)
    inst["AnimState"]:AddOverrideBuild("gentleness_andwobble_build")
    inst["AnimState"]:AddOverrideBuild("gentleness_carousel_a")
    inst["AnimState"]:AddOverrideBuild("gentleness_carousel_b")
    inst["AnimState"]:AddOverrideBuild("gentleness_cat_swing_build")

end)
local function addActCom(inst)
    if not TheWorld["ismastersim"] then
        return inst
    end
    inst:AddComponent("gentleness_act")
end
AddPrefabPostInit("pitchfork", addActCom)
AddPrefabPostInit("goldenpitchfork", addActCom)


--锅兼容
--AddSimPostInit(function ()
--    if rawget(_G, "AddCookingPot") then
--        _G.AddCookingPot("gentleness_cook_pot")
--    end
--end)
--local cookware_morphs = {
--    cookpot = {
--        gentleness_cook_pot = true,
--    },
--    portablecookpot = { -- What morph is it (one of [cookpot, portablecookpot, portablespicer])
--        gentleness_cook_pot = true, -- Your cookware name
--    }
--}
--local AUTO_COOKING_COOKWARES = rawget(_G, "AUTO_COOKING_COOKWARES") or {}
--_G.AUTO_COOKING_COOKWARES = AUTO_COOKING_COOKWARES
--for base, morphs in pairs(cookware_morphs) do
--    AUTO_COOKING_COOKWARES[base] = shallowcopy(morphs, AUTO_COOKING_COOKWARES[base])
--end
local gl_containers = {
    "gentleness_chest_cw",
    "gentleness_chest_ice",
    "gentleness_chest_fire",
    "gentleness_chest_money",
}
for k, mod in pairs(ModManager["mods"]) do
    if mod and mod["SHOWME_STRINGS"] then
        if mod["postinitfns"] and mod["postinitfns"]["PrefabPostInit"] and mod["postinitfns"]["PrefabPostInit"]["treasurechest"] then
            for _, v in ipairs(gl_containers) do
                mod["postinitfns"]["PrefabPostInit"][v] = mod["postinitfns"]["PrefabPostInit"]["treasurechest"]
            end
        end
    end
end
TUNING["MONITOR_CHESTS"] = TUNING["MONITOR_CHESTS"] or {}
for _, v in ipairs(gl_containers) do
    TUNING["MONITOR_CHESTS"][v] = true
end