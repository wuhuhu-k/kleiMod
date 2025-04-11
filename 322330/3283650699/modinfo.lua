----
---文件处理时间:2024-07-01 23:48:41
---
name = "悠"  ---mod名字
description = [[
感谢订阅本mod！
特别鸣谢：宇宙超级霹雳闪电大煎蛋、凌子、小熊格温、树萝莉、盖德、杰克天。
感谢各位大佬的帮助与支持
禁止一切搬运，二次发布，自用！
悠bug反馈交流群号：816067817
]]  --mod描述
author = "猫悠" --作者
version = "1.5" -- mod版本 上传mod需要两次的版本不一样

forumthread = ""

api_version = 10 --api版本
priority = -10

dst_compatible = true --兼容联机

dont_starve_compatible = false --不兼容原版
reign_of_giants_compatible = false --不兼容巨人DLC

all_clients_require_mod = true --所有人mod

icon_atlas = "modicon.xml" --mod图标
icon = "modicon.tex"

server_filter_tags = {  --服务器标签
    "g_you", "猫悠",
}

configuration_options = {
    {
        name = "hat_armor",
        label = "帽子防御上限",
        hover = "帽子防御上限",
        options = {
            { description = "0%", data = 0, hover = "防御上限" },
            { description = "85%", data = 85, hover = "防御上限" },
            { description = "86%", data = 86, hover = "防御上限" },
            { description = "87%", data = 87, hover = "防御上限" },
            { description = "88%", data = 88, hover = "防御上限" },
            { description = "89%", data = 89, hover = "防御上限" },
            { description = "90%", data = 90, hover = "防御上限" },
            { description = "91%", data = 91, hover = "防御上限" },
            { description = "92%", data = 92, hover = "防御上限" },
            { description = "93%", data = 93, hover = "防御上限" },
            { description = "94%", data = 94, hover = "防御上限" },
            { description = "95%", data = 95, hover = "防御上限" },
        },
        default = 85,
    },
    {
        name = "body_armor",
        label = "护甲防御上限",
        hover = "护甲防御上限",
        options = {
            { description = "0%", data = 0, hover = "防御上限" },
            { description = "85%", data = 85, hover = "防御上限" },
            { description = "86%", data = 86, hover = "防御上限" },
            { description = "87%", data = 87, hover = "防御上限" },
            { description = "88%", data = 88, hover = "防御上限" },
            { description = "89%", data = 89, hover = "防御上限" },
            { description = "90%", data = 90, hover = "防御上限" },
            { description = "91%", data = 91, hover = "防御上限" },
            { description = "92%", data = 92, hover = "防御上限" },
            { description = "93%", data = 93, hover = "防御上限" },
            { description = "94%", data = 94, hover = "防御上限" },
            { description = "95%", data = 95, hover = "防御上限" },
        },
        default = 85,
    },
    {
        name = "amulet_config",
        label = "护符是否可以打包物品",
        hover = "护符是否可以打包物品",
        options = {
            { description = "是", data = true, hover = "允许打包物品" },
            { description = "否", data = false, hover = "不允许打包物品" },
        },
        default = true,
    },
}
