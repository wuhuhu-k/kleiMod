name = "AUTO Store Into Chest"
description = [[一键将身上以及背包里的物品自动放入附近已经有的箱子、冰箱内。支持物品黑名单和类型过滤。
ver3.3.4 更新详情请前往mod介绍页 
支持地窖、棱镜的部分容器

Automatically store items from your inventory and backpack into nearby chests/iceboxes with blacklist and type filtering support.
Support for some other mod's containers.]]

author = "LapislazuliStern"
version = "3.3.4"
forumthread = ""
api_version = 10
dst_compatible = true
dont_starve_compatible = false
all_clients_require_mod = true
client_only_mod = false
icon_atlas = "modicon.xml"
icon = "modicon.tex"

configuration_options = {
    {
        name = "STASH_KEY",
        label = "一键入箱快捷键\nQuick Store Hotkey",
        hover = "按下快捷键将物品自动放入附近的箱子\nPress the hotkey to automatically store items into nearby chests",
        options = {
            {description = "Z (默认/Default)", data = "KEY_Z"},
            {description = "X", data = "KEY_X"},
            {description = "C", data = "KEY_C"},
            {description = "V", data = "KEY_V"},
            {description = "B", data = "KEY_B"},
            {description = "N", data = "KEY_N"},
            {description = "R", data = "KEY_R"},
            {description = "T", data = "KEY_T"},
            {description = "Y", data = "KEY_Y"},
            {description = "G", data = "KEY_G"},
            {description = "H", data = "KEY_H"},
        },
        default = "KEY_Z",
    },
    {
        name = "SEARCH_RANGE",
        label = "搜索范围\nSearch Range",
        hover = "检测箱子的范围(格数)\nRange (in tiles) to detect chests",
        options = {
            {description = "10", data = 10},
            {description = "15 (默认/Default)", data = 15},
            {description = "20", data = 20},
        },
        default = 15,
    },
    {
        name = "PERMISSION_MODE",
        label = "权限模式\nPermission Mode",
        hover = "设置谁可以使用这个功能\nSet who can use this feature",
        options = {
            {description = "所有人/Everyone", data = "ALL"},
            {description = "仅管理员/Admin Only", data = "ADMIN"},
        },
        default = "ALL",
    },
    {
        name = "ENABLE_BLACKLIST",
        label = "启用黑名单\nEnable Blacklist",
        hover = "启用物品黑名单\nEnable item blacklist",
        options = {
            {description = "是/Yes", data = true},
        },
        default = true,
    },
    {
        name = "FILTER_FOOD",
        label = "过滤食物(不推荐)\nFilter Food (Not Recommended)",
        hover = "是否过滤食物类物品(会导致很多资源都不会被收集到)\nFilter food items (may prevent collection of many resources)",
        options = {
            {description = "否/No", data = false},
            --{description = "是/Yes", data = true},
        },
        default = false,
    },
    {
        name = "FILTER_COOKS",
        label = "过滤料理(推荐)\nFilter Cooked Food (Recommended)",
        hover = "是否过滤料理食物(例如肉丸、肉汤等)\nFilter cooked food items (e.g. meatballs, stew)",
        options = {
            {description = "否/No", data = false},
            {description = "是/Yes", data = true},
        },
        default = true,
    },
    {
        name = "FILTER_CLOTHES",
        label = "过滤衣物(推荐)\nFilter Clothes (Recommended)", 
        hover = "是否过滤衣物类物品(如草帽、背心等装备)\nFilter clothing items (e.g. straw hat, vest)",
        options = {
            {description = "否/No", data = false},
            {description = "是/Yes", data = true},
        },
        default = true,
    },
    {
        name = "FILTER_ARMOR",
        label = "过滤护甲(推荐)\nFilter Armor (Recommended)",
        hover = "是否过滤护甲类物品\nFilter armor items",
        options = {
            {description = "否/No", data = false},
            {description = "是/Yes", data = true},
        },
        default = true,
    },
    {
        name = "FILTER_WEAPON",
        label = "过滤武器(推荐)\nFilter Weapons (Recommended)",
        hover = "是否过滤武器类物品\nFilter weapon items",
        options = {
            {description = "否/No", data = false},
            {description = "是/Yes", data = true},
        },
        default = true,
    },
    {
        name = "FILTER_TOOL",
        label = "过滤工具(推荐)\nFilter Tools (Recommended)",
        hover = "是否过滤工具类物品\nFilter tool items",
        options = {
            {description = "否/No", data = false},
            {description = "是/Yes", data = true},
        },
        default = true,
    },
    {
        name = "FILTER_MATERIAL",
        label = "过滤材料(不推荐)\nFilter Materials (Not Recommended)",
        hover = "是否过滤材料类物品\nFilter material items",
        options = {
            {description = "否/No", data = false},
            --{description = "是/Yes", data = true},
        },
        default = false,
    },
    {
        name = "FILTER_GEM",
        label = "过滤宝石(不推荐)\nFilter Gems (Not Recommended)",
        hover = "是否过滤宝石类物品\nFilter gem items",
        options = {
            {description = "否/No", data = false},
            --{description = "是/Yes", data = true},
        },
        default = false,
    },
    {
        name = "PROTECTED_SLOTS",
        label = "保护格子\nProtected Slots",
        hover = "选中的物品栏格子将不会被自动存储(从左到右1-15号格)\n(格子中的物品将始终被忽略保护，如果有套娃箱子，其内容物也将被忽略保护)\nSelected inventory slots will not be auto-stored (slots 1-15 from left to right)\nItems in nested containers will always ignore protection",
        options = {
            {description = "末尾5格(默认显示)/Last 5 Slots (Default)", data = {11,12,13,14,15}},
            {description = "1-5号格/Slots 1-5", data = {1,2,3,4,5}},
            {description = "中间5格/Middle 5 Slots", data = {6,7,8,9,10}},
            {description = "1-9格/Slots 1-9", data = {1,2,3,4,5,6,7,8,9}},
            {description = "1-10格/Slots 1-10", data = {1,2,3,4,5,6,7,8,9,10}},
            {description = "全部格子!/All Slots!", data = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}},
            {description = "无(套娃内物品将始终会被收集)/None (Nested items will be collected)", data = {0}},
        },
        default = {11,12,13,14,15},
    },
    {
        name = "CHECK_NESTED_CONTAINERS",
        label = "检查套娃容器\nCheck Nested Containers",
        hover = "仅当套娃容器在物品栏中且不在保护格子中会被收集\n*如果套娃容器在背包里则不会被收集\nOnly collect nested containers in inventory and not in protected slots\nNested containers in backpack will not be collected",
        options = {
            {description = "是/Yes", data = true},
        },
        default = true,
    },
    {
        name = "ENABLE_RESOURCE_THRESHOLD",
        label = "启用资源保留\nEnable Resource Retention",
        hover = "是否启用资源保留功能(如果不开启仅限基础资源的话所有物资都将至少保留下指定数量)\nEnable resource retention feature (if Basic Resources Only is disabled, all items will retain the set amount)",
        options = {
            {description = "否/No", data = false},
            {description = "是/Yes", data = true},
        },
        default = true,
    },
    {
        name = "RESOURCE_THRESHOLD_AMOUNT",
        label = "资源保留数量\nResource Retention Amount",
        hover = "超过此数量的资源将被存储(每种物品)\nResources exceeding this amount will be stored (per item type)",
        options = {
            {description = "10", data = 10},
            {description = "20 (默认/Default)", data = 20},
            {description = "30", data = 30},
            {description = "40", data = 40},
            {description = "99", data = 99},
        },
        default = 20,
    },
    {
        name = "BASIC_RESOURCES_ONLY",
        label = "仅限基础资源(请配合启用资源保留功能开关)\nBasic Resources Only (Use with Resource Retention)",
        hover = "是否只对基础资源(草、树枝、石头、木头、硝石、金块)启用资源保留功能\nOnly apply resource retention to basic resources (grass, twigs, rocks, logs, nitre, gold)",
        options = {
            --{description = "否/No", data = false},
            {description = "是/Yes", data = true},
        },
        default = true,
    }
}