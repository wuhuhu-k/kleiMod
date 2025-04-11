----
---文件处理时间:2024-07-01 23:48:41
---
GLOBAL.setmetatable(env, { __index = function(t, k)
    return GLOBAL.rawget(GLOBAL, k)
end })
require("map/tasks")
require("map/lockandkey")

local Layouts = require("map/layouts").Layouts
local StaticLayout = require("map/static_layout")
AddRoom("G_MOLI_ROOM",
        {
            ["colour"] = { r = 0.8, g = 1, b = 0.8, a = 0.50 },
            ["value"] = GROUND["DECIDUOUS"],
            ["contents"] = {
                ["countprefabs"] = {
                    ["gentleness_jasmine"] = function()
                        return 5 + math["random"](0, 3)
                    end,
                },
                ["countstaticlayouts"] = {
                    ["WormholeGWorm"] = 1,
                },
                ["distributepercent"] = 0.2,
                ["distributeprefabs"] = {
                    ["fireflies"] = 0.1,
                    ["flower"] = 0.35,
                    ["flower_rose"] = 0.35,
                    ["deciduoustree"] = 0.52,
                    ["catcoonden"] = 0.05,
                    ["red_mushroom"] = 0.21,
                    ["sapling"] = 0.2,
                },
            }
        })
AddTaskPreInit("Speak to the king", function(task)

    task["room_choices"]["G_MOLI_ROOM"] = 1
end)

local TileRanges = {
    ["LAND"] = "LAND", --陆地
    ["NOISE"] = "NOISE", --噪波
    ["OCEAN"] = "OCEAN", --海
    ["IMPASSABLE"] = "IMPASSABLE", --不可逾越
}
local function addComTurf(turf_id, texture_id, mini_map)
    local turf_green = turf_id
    AddTile(string["upper"](turf_green), --地皮名称  注意这个是唯一的，不要和其他的重复 必须为大写
            TileRanges["LAND"], --地皮类型
    -- {ground_name = "Blue Mosaic", old_static_id = GROUND.MOSAIC_BLUE},
            {
                ["ground_name"] = "悠-绿色地皮", --自定义名字，随便填
                -- old_static_id = GROUND.MOSAIC_BLUE,  --旧版地皮编号 由于旧版地皮范围只能在0~255，已经不用了容易冲突，现在会自动给地皮分配编号，而且最大可以到8448。
                -- 如果想要获取你的地皮编号可以 控制台输入  print(WORLD_TILES[你的地皮名称])
                -- 示例
                -- print( WORLD_TILES['SOVO_SBL'] )
            },
            {
                ["name"] = "gentleness_jungle", --边缘样式 比如 牛毛地毯carpet 棋盘blocky 也可以自己做。这里设置为我们文件里的

                ["noise_texture"] = texture_id, --这里是图片

                --定义在地皮上行走的声音
                ["runsound"] = "dontstarve/movement/run_carpet", --
                ["walksound"] = "dontstarve/movement/walk_carpet", --
                ["snowsound"] = "dontstarve/movement/run_ice",
                ["mudsound"] = "dontstarve/movement/run_mud",

                ["flooring"] = false, --标记为true则上面不能生长植物
                ["hard"] = false, --标记为true则上面不可种植植物
                ["roadways"] = false, --标记为true则玩家在上面可以加速，类似于卵石路
                ["cannotbedug"] = nil, --标记为true则不能挖掉
            },
            {
                ["name"] = "map_edge",
                ["noise_texture"] = mini_map, --小地图图片
            },
    --挖掉的定义，如果这个表为空则挖掉之后不掉地皮
            {
                ["name"] = turf_green, -- 掉落物的代码
                ["anim"] = "turf_gentleness", -- Ground item
                ["bank_build"] = "turf_gentleness", --zip的name
                ["pickupsound"] = "vegetation_grassy",
            }
    )
    ChangeTileRenderOrder(WORLD_TILES[string["upper"](turf_green)], WORLD_TILES["FARMING_SOIL"])
end
--print(WORLD_TILES[string["upper"]("gentleness_green")])
addComTurf("gentleness_green", "Ground_gentleness_green", "mini_cobblestone_noise")
addComTurf("gentleness_strawberry", "Ground_gentleness_strawberry", "mini_deciduous_noise")
addComTurf("gentleness_star", "Ground_gentleness_star", "mini_forest_noise")

Layouts["gentleness_cat_land"] = StaticLayout["Get"]("map/static_layouts/gentleness_cat", {
    ["start_mask"] = PLACE_MASK["IGNORE_IMPASSABLE_BARREN_RESERVED"],
    ["fill_mask"] = PLACE_MASK["IGNORE_IMPASSABLE_BARREN_RESERVED"],
    ["layout_position"] = LAYOUT_POSITION["CENTER"],
    ["disable_transform"] = true,
})
--宇宙无敌超级霹雳闪电暴风那珂珂珂珂珂珂珂珂珂珂
Layouts["gentleness_cat_land"]["ground_types"] = {
    WORLD_TILES[string["upper"]("gentleness_green")],
    --WORLD_TILES[string["upper"]("beard_rug")],
}

AddLevelPreInitAny(function(level)
    if level["location"] == "forest" then
        if level["ocean_prefill_setpieces"] ~= nil then
            level["ocean_prefill_setpieces"]["gentleness_cat_land"] = 1
        end
    end
end)

Layouts["WormholeGWorm"] = StaticLayout["Get"]("map/static_layouts/wormhole_grass")