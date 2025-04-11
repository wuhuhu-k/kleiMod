----
---文件处理时间:2024-07-01 23:48:41
---
GLOBAL.setmetatable(env, { __index = function(t, k)
    return GLOBAL.rawget(GLOBAL, k)
end })

PrefabFiles = {
    "gentleness", 
    "gentleness_none", 
    "gentleness_cook_pot",
    "gentleness_prefab",
    "gentleness_jasmine",
    "gentleness_buff",
    "gentleness_lz_fx",
    "gentleness_mushroom",
    "gentleness_fence",
    "gentleness_lantern_post",
}
modimport("main/gentleness_asserts.lua")
modimport("main/gentleness_tuning.lua")
modimport("main/gentleness_string.lua")
modimport("main/gentleness_recipes.lua")
modimport("main/gentleness_food.lua")
modimport("main/gentleness_ui.lua")
modimport("main/gentleness_act.lua")
modimport("main/gentleness_sg.lua")
modimport("main/gentleness_api.lua")
modimport("main/gentleness_skin.lua")
modimport("main/gentleness_rpc.lua")
