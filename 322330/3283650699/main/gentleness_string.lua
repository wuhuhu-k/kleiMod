----
---文件处理时间:2024-07-01 23:48:41
---

STRINGS["CHARACTER_TITLES"]["gentleness"] = "喜欢玩盲盒的女孩"
STRINGS["CHARACTER_NAMES"]["gentleness"] = "悠"
STRINGS["CHARACTER_DESCRIPTIONS"]["gentleness"] = [[
*喜欢盲盒
*有收集癖
*喜欢建家]]
STRINGS["CHARACTER_QUOTES"]["gentleness"] = "抓不住这世间的美好，只好装作万事顺遂的模样。"

STRINGS["CHARACTERS"]["GENTLENESS"] = require("speech_gentleness")

STRINGS["NAMES"]["GENTLENESS"] = "悠"

STRINGS["SKIN_NAMES"]["gentleness_none"] = "悠"

STRINGS["CHARACTER_SURVIVABILITY"]["gentleness"] = "抓不住这世间的美好，只好装作万事顺遂的摸样。"

local HH_STRING = {}
local function addString(prefab_id, hh_name, hh_desc, hh_recipe_str)
    HH_STRING[prefab_id] = {
        ["name"] = hh_name,
        ["desc"] = hh_desc,
        ["recipe_str"] = hh_recipe_str,
    }
end

addString("gentleness_cook_pot", "茉莉柚夏", "这锅不错嘛我接了", "早就看那玩意不顺眼了")
addString("gentleness_cook_pot_item", "茉莉柚夏", "这锅不错嘛我接了", "早就看那玩意不顺眼了")

addString("gentleness_magic", "魔法值", "魔法值", "魔法值")
addString("gentleness_plant", "长松落落，卉木蒙蒙", "催生作物，植物，大理石，树", "催生作物，植物，大理石，树")
addString("gentleness_fertilizer", "蕘之涂涂，显允扬扬", "施肥作物，给予农田很高肥力和水分", "施肥作物，给予农田很高肥力和水分")
addString("gentleness_rain", "薄雨收寒，斜照弄晴", "切换降雨和停雨（原版雨书）", "切换降雨和停雨（原版雨书）")
addString("gentleness_bird", "树林阴翳，鸟鸣嘤嘤",
        "在角色周围召唤 20~30 只鸟。鸟的种类取决于季节和落点的地皮。在晚上阅读时，召唤的鸟会立刻飞走。",
        "在角色周围召唤 20~30 只鸟。鸟的种类取决于季节和落点的地皮。在晚上阅读时，召唤的鸟会立刻飞走。")
addString("gentleness_sleep", "霞光消退，恹恹欲睡", "催眠角色周围 30 范围内的所有生物。", "催眠角色周围 30 范围内的所有生物。")
addString("gentleness_moon", "蒙雾垂天，阴风蔽日", "当晚变成月黑之夜", "当晚变成月黑之夜")
addString("gentleness_fish", "玉壶光转，夜鱼龙舞",
        "在角色附近的海域内召唤 3 群海鱼。召唤的海鱼种类取决于海域类型。由该书召唤的鱼群，生成时也有概率伴随一角鲸、岩石大白鲨的生成。",
        "在角色附近的海域内召唤 3 群海鱼。召唤的海鱼种类取决于海域类型。由该书召唤的鱼群，生成时也有概率伴随一角鲸、岩石大白鲨的生成。")
addString("gentleness_lighting", "电转惊雷，自叹浮生",
        "在角色周围降下 16 道闪电。闪电会随机劈中周围的物体", "在角色周围降下 16 道闪电。闪电会随机劈中周围的物体")

addString("gentleness_snacks_mca", "茉纯爱", "悬溺一响，流年登场", "三大谎言之流年恋爱篇")
addString("gentleness_snacks_msn", "茉蒜泥", "我去吃个饭，一会儿就回来", "三大谎言之saber篇")
addString("gentleness_snacks_mgz", "茉瓜子", "上厕所记得带个小被儿", "三大谎言之秋梦篇")

addString("gentleness_food_yan", "茉嫣", "如茉莉般天姿美丽", "如茉莉般天姿美丽")
addString("gentleness_food_tian", "茉恬", "淡泊名利、清静甜美", "淡泊名利、清静甜美")
addString("gentleness_food_you", "茉攸", "众望攸归、茉莉天姿", "众望攸归、茉莉天姿")

addString("gentleness_drink_yang", "茉牛羊", "和茉莉一起战斗吧", "和茉莉一起战斗吧")
addString("gentleness_drink_duo", "茉云朵", "有人就喜欢跑得飞快", "有人就喜欢跑得飞快")
addString("gentleness_drink_yuan", "茉草原", "没有魔法怎么养家", "没有魔法怎么养家")

addString("gentleness_staff_cat", "茉莉无念", "喵，这是茉莉的猫棒", "若见一切法，心不染着，是为无念")
addString("gentleness_project", "特效", "特效", "特效")
addString("gentleness_jasmine", "茉莉花", "再见，就是一定会再次相见", "再见，就是一定会再次相见")
addString("gentleness_mushroom_red", "猫猫红蘑菇盆", "悠很喜欢吃蘑菇呢", "好像可以一直成长")
addString("gentleness_mushroom_blue", "猫猫蓝蘑菇盆", "悠很喜欢吃蘑菇呢", "好像可以一直成长")
addString("gentleness_mushroom_green", "猫猫绿蘑菇盆", "悠很喜欢吃蘑菇呢", "好像可以一直成长")
addString("gentleness_mushroom_moon", "猫猫月光蘑菇盆", "悠很喜欢吃蘑菇呢", "好像可以一直成长")

addString("gentleness_r_a", "空白勋章", "空白勋章", "空白勋章")
addString("gentleness_r_a_blueprint", "空白勋章蓝图", "空白勋章", "空白勋章")
addString("gentleness_lj_zg", "子圭奇型岩", "子圭奇型岩", "子圭奇型岩")
addString("gentleness_lj_zg_blueprint", "子圭奇型岩蓝图", "子圭奇型岩勋章", "子圭奇型岩勋章")
addString("gentleness_lj_md", "宽大的木墩", "宽大的木墩", "宽大的木墩")
addString("gentleness_lj_md_blueprint", "宽大的木墩蓝图", "宽大的木墩", "宽大的木墩")
addString("gentleness_mcw_tzj", "mcw的兔子先生之刃", "mcw的兔子先生之刃", "mcw的兔子先生之刃")
addString("gentleness_mcw_tzj_blueprint", "mcw的兔子先生之刃蓝图", "mcw的兔子先生之刃", "mcw的兔子先生之刃")
addString("gentleness_tool_a_blueprint", "xxxx", "xxxx", "xxxx")
addString("gentleness_armor_blueprint", "xxxx", "xxxx", "xxxx")
addString("gentleness_amulet_blueprint", "xxxx", "xxxx", "xxxx")
addString("gentleness_hat_blueprint", "xxxx", "xxxx", "xxxx")
addString("gentleness_plant_blueprint", "xxxx", "xxxx", "xxxx")
addString("gentleness_fertilizer_blueprint", "xxxx", "xxxx", "xxxx")
addString("gentleness_rain_blueprint", "xxxx", "xxxx", "xxxx")
addString("gentleness_bird_blueprint", "xxxx", "xxxx", "xxxx")
addString("gentleness_sleep_blueprint", "xxxx", "xxxx", "xxxx")
addString("gentleness_moon_blueprint", "xxxx", "xxxx", "xxxx")
addString("gentleness_fish_blueprint", "xxxx", "xxxx", "xxxx")
addString("gentleness_lighting_blueprint", "xxxx", "xxxx", "xxxx")
addString("g_spawn_poop_buff", "开始拉s", "开始拉s", "开始拉s")
addString("g_no_target_buff", "开始隐身", "开始隐身", "开始隐身")
addString("g_add_attack_buff", "攻击提升", "攻击提升", "攻击提升")
addString("g_add_speed_buff", "移速提升", "移速提升", "移速提升")
addString("g_add_magic_buff", "魔法值开始恢复", "魔法值开始恢复", "魔法值开始恢复")
addString("gentleness_moonbase", "月台", "月台", "月台")
addString("gentleness_moonbase_blueprint", "月台蓝图", "月台蓝图", "月台蓝图")
addString("turf_gentleness_green", "花花地皮", "花花地皮", "花花地皮")
addString("turf_gentleness_green_blueprint", "花花地皮蓝图", "花花地皮蓝图", "花花地皮蓝图")
addString("gentleness_color_land_item", "彩虹路地板", "彩虹路地板", "彩虹路地板")
addString("gentleness_color_land_item_blueprint", "彩虹路地板蓝图", "彩虹路地板蓝图", "彩虹路地板蓝图")
addString("gentleness_fence", "猫头栅栏", "猫头栅栏", "猫头栅栏")
addString("gentleness_fence_item", "猫头栅栏", "猫头栅栏", "猫头栅栏")
addString("gentleness_fence_gate", "猫爪门", "猫爪门", "猫爪门")
addString("gentleness_fence_gate_item", "猫爪门", "猫爪门", "猫爪门")
------------------------------------------2025-------------------------------------
addString("turf_gentleness_strawberry", "草莓地皮", "草莓地皮", "草莓地皮")
addString("turf_gentleness_strawberry_blueprint", "草莓地皮蓝图", "草莓地皮蓝图", "草莓地皮蓝图")
addString("turf_gentleness_star", "星星地皮", "星星地皮", "星星地皮")
addString("turf_gentleness_star_blueprint", "星星地皮蓝图", "星星地皮蓝图", "星星地皮蓝图")
addString("gentleness_lantern_post", "猫悠煎蛋蘑菇灯", "2024感谢遇见你，感谢遇见你们，2025新年快乐", "没有煎蛋就没有悠")
addString("gentleness_lantern_light", "猫悠煎蛋蘑菇灯-特效1", "2024感谢遇见你，感谢遇见你们，2025新年快乐", "没有煎蛋就没有悠")
addString("gentleness_lantern_light_chain", "猫悠煎蛋蘑菇灯-特效2", "2024感谢遇见你，感谢遇见你们，2025新年快乐", "没有煎蛋就没有悠")
addString("gentleness_lantern_post_item", "猫悠煎蛋蘑菇灯", "2024感谢遇见你，感谢遇见你们，2025新年快乐", "没有煎蛋就没有悠")
for i, v in pairs(HH_STRING) do
    STRINGS["NAMES"][string["upper"](i)] = v["name"] or "未定义"
    STRINGS["RECIPE_DESC"][string["upper"](i)] = v["recipe_str"] or "未定义"
    STRINGS["CHARACTERS"]["GENERIC"]["DESCRIBE"][string["upper"](i)] = v["desc"] or "未定义"
end
