----
---文件处理时间:2024-07-01 23:48:41
---

GLOBAL["PREFAB_SKINS"]["gentleness"] = {
    "gentleness_none",
}
local extra_xml = "images/gentleness_image/gentleness_items_extra.xml"

TUNING["GENTLENESS_HEALTH"] = 150
TUNING["GENTLENESS_HUNGER"] = 150
TUNING["GENTLENESS_SANITY"] = 150

TUNING["GENTLENESS_MAGIC_MAX"] = 150

TUNING["GAMEMODE_STARTING_ITEMS"]["DEFAULT"]["GENTLENESS"] = { "gentleness_back", "gentleness_mlkx" }
TUNING["STARTING_ITEM_IMAGE_OVERRIDE"]["gentleness_back"] = {
    ["atlas"] = extra_xml,
    ["image"] = "gentleness_back.tex",
}
TUNING["STARTING_ITEM_IMAGE_OVERRIDE"]["gentleness_mlkx"] = {
    ["atlas"] = extra_xml,
    ["image"] = "gentleness_mlkx.tex",
}
TUNING["GENTLENESS_HAT_ARMOR"] = GetModConfigData("hat_armor")
TUNING["GENTLENESS_BODY_ARMOR"] = GetModConfigData("body_armor")
TUNING["GENTLENESS_AMULET_CONFIG"] = GetModConfigData("amulet_config")

TUNING["GENTLENESS_JASMINE_DESC"] = {
    "送君茉莉，愿君莫离",
    "若君不离，何需茉莉",
    "君必不离，寄情茉莉",
    "君诺不弃，茉莉不离",
    "君未离去，茉莉相伴",
    "君已离去，唯有茉莉",
    "已有茉莉，君便随去",
    "茉莉未谢，君已离别",
    "茉莉无意，唯君有意",
    "茉莉莫离，莫离茉莉",
    "再见，就是一定会再次相见",
}
