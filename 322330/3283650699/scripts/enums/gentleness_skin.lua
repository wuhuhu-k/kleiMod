----
---文件处理时间:2024-07-01 23:48:41
---
local HH_UTILS = require("utils/gentleness_utils")
local extra_xml = "images/gentleness_image/gentleness_items_extra.xml"
local com_item_xml = "images/gentleness_image/gentleness_items.xml"
local function updateLightColor(inst, color)
    if inst and inst["Light"] and HH_UTILS:IsHHType(color, "table") then
        inst["Light"]:SetColour(unpack(color))
    end
end
local function changeSkinImage(inst, skin_id)
    if HH_UTILS:HasComponents(inst, "inventoryitem")
            and HH_UTILS:IsHHType(skin_id, "string") then
        inst["g_item_skin"] = skin_id
        inst["components"]["inventoryitem"]:ChangeImageName(skin_id)
    end
end

local function changeSkinImageAndXml(inst, skin_id, xml)
    if HH_UTILS:HasComponents(inst, "inventoryitem")
            and HH_UTILS:IsHHType(skin_id, "string")
            and HH_UTILS:IsHHType(xml, "string")
    then
        inst["g_item_skin"] = skin_id
        inst["components"]["inventoryitem"]["atlasname"] = xml
        inst["components"]["inventoryitem"]:ChangeImageName(skin_id)
    end
end
local function changeBundleSkinImage(inst, skin_id, image)
    if HH_UTILS:HasComponents(inst, "inventoryitem")
            and HH_UTILS:IsHHType(skin_id, "string")
            and HH_UTILS:IsHHType(image, "string")
    then
        inst["g_item_skin"] = skin_id
        inst["components"]["inventoryitem"]:ChangeImageName(image)
    end
end

local function gentlenessLampPlace(inst, skin_id)
    inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
end
local function gentlenessLampServer(inst, skin_id)
    updateLightColor(inst, { 1, 1, 1 })
    inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
end
local function gentlenessLampServerBlue(inst, skin_id)
    updateLightColor(inst, { 0 / 255, 250 / 255, 255 / 255 })
    inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
end
local function gentlenessLampServerRed(inst, skin_id)
    updateLightColor(inst, { 255 / 255, 0 / 255, 4 / 255 })
    inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
end
local function gentlenessLampServerYellow(inst, skin_id)
    updateLightColor(inst, { 255 / 255, 248 / 255, 0 / 255 })
    inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
end
local HH_SKIN = {
    ["gentleness_lamp_base"] = {
        {
            ["skin_id"] = "gentleness_lamp_base",
            ["skin_name"] = "初始皮肤",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_bee.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 1, 1, 1 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_lamp_bee",
            ["skin_name"] = "小蜜蜂彩灯",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_bee.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 1, 1, 1 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_lamp_cat",
            ["skin_name"] = "小猫咪彩灯",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_cat.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 1, 1, 1 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_lamp_hb",
            ["skin_name"] = "小海豹彩灯",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_hb.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 1, 1, 1 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_lamp_hm",
            ["skin_name"] = "小海绵彩灯",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_hm.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 1, 1, 1 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_lamp_hx",
            ["skin_name"] = "小浣熊彩灯",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_hx.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 255 / 255, 25 / 255, 0 / 255 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_lamp_lh",
            ["skin_name"] = "小老虎彩灯",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_lh.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 1, 1, 1 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_lamp_niu",
            ["skin_name"] = "小奶牛彩灯",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_niu.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 1, 1, 1 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_lamp_qe",
            ["skin_name"] = "小企鹅彩灯",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_qe.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 1, 1, 1 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_lamp_xjy",
            ["skin_name"] = "小鲸鱼彩灯",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_xjy.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 0 / 255, 166 / 255, 255 / 255 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_lamp_xkl",
            ["skin_name"] = "小恐龙彩灯",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_xkl.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 0 / 255, 255 / 255, 0 / 255 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_lamp_xl",
            ["skin_name"] = "小鹿头彩灯",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_xl.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 1, 1, 1 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_lamp_xlc",
            ["skin_name"] = "小鹿彩灯",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_xlc.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 255 / 255, 25 / 255, 0 / 255 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_lamp_xpx",
            ["skin_name"] = "小螃蟹彩灯",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_xpx.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 255 / 255, 25 / 255, 0 / 255 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_lamp_xqw",
            ["skin_name"] = "小青蛙彩灯",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_xqw.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 0 / 255, 255 / 255, 0 / 255 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_lamp_xsy",
            ["skin_name"] = "小鲨鱼彩灯",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_xsy.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)

            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 0 / 255, 166 / 255, 255 / 255 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_lamp_xx",
            ["skin_name"] = "小熊彩灯",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_xx.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 255 / 255, 25 / 255, 0 / 255 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_lamp_xz",
            ["skin_name"] = "小猪彩灯",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_xz.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 255 / 255, 25 / 255, 0 / 255 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_lamp_xzy",
            ["skin_name"] = "小章鱼彩灯",
            ["xml"] = extra_xml, ["tex"] = "gentleness_lamp_xzy.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                updateLightColor(inst, { 0 / 255, 166 / 255, 255 / 255 })
                inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", tostring(skin_id))
            end,
        },
        ----2024-09-29
        {
            ["skin_id"] = "gentleness_lamp_blue_cat_a", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_blue_cat_a.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServerBlue,
        },
        {
            ["skin_id"] = "gentleness_lamp_blue_cat_b", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_blue_cat_b.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServerBlue,
        },
        {
            ["skin_id"] = "gentleness_lamp_blue_cat_c", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_blue_cat_c.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServerBlue,
        },
        {
            ["skin_id"] = "gentleness_lamp_blue_cat_d", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_blue_cat_d.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServerBlue,
        },
        {
            ["skin_id"] = "gentleness_lamp_red_cat_a", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_red_cat_a.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServerRed,
        },
        {
            ["skin_id"] = "gentleness_lamp_red_cat_b", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_red_cat_b.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServerRed,
        },
        {
            ["skin_id"] = "gentleness_lamp_red_cat_c", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_red_cat_c.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServerRed,
        },
        {
            ["skin_id"] = "gentleness_lamp_red_cat_d", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_red_cat_d.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServerRed,
        },
        {
            ["skin_id"] = "gentleness_lamp_red_cat_e", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_red_cat_e.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServerRed,
        },
        {
            ["skin_id"] = "gentleness_lamp_white_cat_a", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_white_cat_a.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServer,
        },
        {
            ["skin_id"] = "gentleness_lamp_white_cat_b", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_white_cat_b.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServer,
        },
        {
            ["skin_id"] = "gentleness_lamp_white_cat_c", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_white_cat_c.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServer,
        },
        {
            ["skin_id"] = "gentleness_lamp_white_cat_d", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_white_cat_d.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServer,
        },
        {
            ["skin_id"] = "gentleness_lamp_white_cat_e", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_white_cat_e.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServer,
        },
        {
            ["skin_id"] = "gentleness_lamp_white_cat_f", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_white_cat_f.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServer,
        },
        {
            ["skin_id"] = "gentleness_lamp_white_cat_g", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_white_cat_g.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServer,
        },
        {
            ["skin_id"] = "gentleness_lamp_white_cat_h", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_white_cat_h.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServer,
        },
        {
            ["skin_id"] = "gentleness_lamp_white_cat_i", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_white_cat_i.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServer,
        },
        {
            ["skin_id"] = "gentleness_lamp_white_cat_j", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_white_cat_j.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServer,
        },
        {
            ["skin_id"] = "gentleness_lamp_white_cat_k", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_white_cat_k.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServer,
        },
        {
            ["skin_id"] = "gentleness_lamp_white_cat_l", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_white_cat_l.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServer,
        },
        {
            ["skin_id"] = "gentleness_lamp_white_cat_m", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_white_cat_m.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServer,
        },
        {
            ["skin_id"] = "gentleness_lamp_white_cat_n", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_white_cat_n.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServer,
        },
        {
            ["skin_id"] = "gentleness_lamp_yellow_cat_a", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_yellow_cat_a.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServerYellow,
        },
        {
            ["skin_id"] = "gentleness_lamp_yellow_cat_b", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_yellow_cat_b.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServerYellow,
        },
        {
            ["skin_id"] = "gentleness_lamp_yellow_cat_c", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_yellow_cat_c.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServerYellow,
        },
        {
            ["skin_id"] = "gentleness_lamp_yellow_cat_d", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_yellow_cat_d.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServerYellow,
        },
        {
            ["skin_id"] = "gentleness_lamp_yellow_cat_e", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_yellow_cat_e.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServerYellow,
        },
        {
            ["skin_id"] = "gentleness_lamp_yellow_cat_f", ["skin_name"] = "猫猫彩灯", ["xml"] = "images/gentleness_image/gentleness_mmg.xml",
            ["tex"] = "gentleness_lamp_yellow_cat_f.tex", ["placer_fn"] = gentlenessLampPlace, ["skin_server"] = gentlenessLampServerYellow,
        },
    },

    ["gentleness_weapon_flower_a"] = {
        {
            ["skin_id"] = "gentleness_weapon_flower_a",
            ["skin_name"] = "百合",
            ["xml"] = com_item_xml, ["tex"] = "gentleness_weapon_flower_a.tex",
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                changeSkinImage(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_weapon_flower_idle_a", "gentleness_weapon_flower", "gentleness_weapon_flower_idle_a")
            end,
        },
        {
            ["skin_id"] = "gentleness_weapon_flower_b",
            ["skin_name"] = "郁金香",
            ["xml"] = com_item_xml, ["tex"] = "gentleness_weapon_flower_b.tex",
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                changeSkinImage(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_weapon_flower_idle_a", "gentleness_weapon_flower", "gentleness_weapon_flower_idle_b")
            end,
        },
        {
            ["skin_id"] = "gentleness_weapon_flower_c",
            ["skin_name"] = "绣球花",
            ["xml"] = com_item_xml, ["tex"] = "gentleness_weapon_flower_c.tex",
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                changeSkinImage(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_weapon_flower_idle_a", "gentleness_weapon_flower", "gentleness_weapon_flower_idle_c")
            end,
        },
        {
            ["skin_id"] = "gentleness_weapon_flower_d",
            ["skin_name"] = "菊花",
            ["xml"] = com_item_xml, ["tex"] = "gentleness_weapon_flower_d.tex",
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                changeSkinImage(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_weapon_flower_idle_a", "gentleness_weapon_flower", "gentleness_weapon_flower_idle_d")
            end,
        },
        {
            ["skin_id"] = "gentleness_weapon_flower_e",
            ["skin_name"] = "玫瑰花",
            ["xml"] = com_item_xml, ["tex"] = "gentleness_weapon_flower_e.tex",
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                changeSkinImage(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_weapon_flower_idle_a", "gentleness_weapon_flower", "gentleness_weapon_flower_idle_e")
            end,
        },
        {
            ["skin_id"] = "gentleness_weapon_flower_f",
            ["skin_name"] = "铃兰",
            ["xml"] = com_item_xml, ["tex"] = "gentleness_weapon_flower_f.tex",
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                changeSkinImage(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_weapon_flower_idle_a", "gentleness_weapon_flower", "gentleness_weapon_flower_idle_f")
            end,
        },

    },

    ["gentleness_hat"] = {
        {
            ["skin_id"] = "gentleness_hat",
            ["skin_name"] = "帽子",
            ["xml"] = extra_xml, ["tex"] = "gentleness_hat.tex",
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                changeSkinImageAndXml(inst, skin_id, extra_xml)
                inst["AnimState"]:SetBank("gentleness_hat")
                inst["AnimState"]:SetBuild("gentleness_hat")
                inst["AnimState"]:PlayAnimation("idle")
            end,
        },
        {
            ["skin_id"] = "gentleness_hat_skin",
            ["skin_name"] = "蓝-茉莉暖瑾",
            ["xml"] = extra_xml, ["tex"] = "gentleness_hat_skin.tex",
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                changeSkinImageAndXml(inst, skin_id, extra_xml)
                inst["AnimState"]:SetBank("gentleness_hat_skin")
                inst["AnimState"]:SetBuild("gentleness_hat_skin")
                inst["AnimState"]:PlayAnimation("idle")
            end,
            ["equip_fn"] = function(hat_inst, owner, skin_id)
                owner["AnimState"]:OverrideSymbol("face", skin_id, "face")
            end,
            ["un_equip_fn"] = function(hat_inst, owner, skin_id)
                owner["AnimState"]:OverrideSymbol("face", "gentleness", "face")
            end,
        },
        {
            ["skin_id"] = "gentleness_hat_skin_purple",
            ["skin_name"] = "紫色-茉莉暖瑾",
            ["xml"] = "images/gentleness_image/gentleness_hat_skin_purple.xml", ["tex"] = "gentleness_hat_skin_purple.tex",
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:SetBank("gentleness_hat_skin_purple")
                inst["AnimState"]:SetBuild("gentleness_hat_skin_purple")
                inst["AnimState"]:PlayAnimation("idle")
                changeSkinImageAndXml(inst, skin_id, "images/gentleness_image/gentleness_hat_skin_purple.xml")
            end,
        },
        {
            ["skin_id"] = "gentleness_hat_skin_black",
            ["skin_name"] = "黑色-茉莉暖瑾",
            ["xml"] = "images/gentleness_image/gentleness_hat_skin_black.xml", ["tex"] = "gentleness_hat_skin_black.tex",
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:SetBank("gentleness_hat_skin_black")
                inst["AnimState"]:SetBuild("gentleness_hat_skin_black")
                inst["AnimState"]:PlayAnimation("idle")
                changeSkinImageAndXml(inst, skin_id, "images/gentleness_image/gentleness_hat_skin_black.xml")
            end,
        },
        {
            ["skin_id"] = "gentleness_hat_pink_a",
            ["skin_name"] = "浅粉色猫耳",
            ["xml"] = "images/gentleness_image/gentleness_hat_pink_a.xml", ["tex"] = "gentleness_hat_pink_a.tex",
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:SetBank("gentleness_hat_pink_a")
                inst["AnimState"]:SetBuild("gentleness_hat_pink_a")
                inst["AnimState"]:PlayAnimation("idle")
                changeSkinImageAndXml(inst, skin_id, "images/gentleness_image/gentleness_hat_pink_a.xml")
            end,
            ["equip_fn"] = function(hat_inst, owner, skin_id)
                owner["AnimState"]:OverrideSymbol("hairpigtails", skin_id, "hairpigtails")
                owner["AnimState"]:OverrideSymbol("face", "gentleness_hat_pink_eye", "face")
            end,
            ["un_equip_fn"] = function(hat_inst, owner, skin_id)
                owner["AnimState"]:OverrideSymbol("hairpigtails", "gentleness", "hairpigtails")
                owner["AnimState"]:OverrideSymbol("face", "gentleness", "face")
            end,
        },
        {
            ["skin_id"] = "gentleness_hat_pink_b",
            ["skin_name"] = "深粉色猫耳",
            ["xml"] = "images/gentleness_image/gentleness_hat_pink_b.xml", ["tex"] = "gentleness_hat_pink_b.tex",
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:SetBank("gentleness_hat_pink_b")
                inst["AnimState"]:SetBuild("gentleness_hat_pink_b")
                inst["AnimState"]:PlayAnimation("idle")
                changeSkinImageAndXml(inst, skin_id, "images/gentleness_image/gentleness_hat_pink_b.xml")
            end,
            ["equip_fn"] = function(hat_inst, owner, skin_id)
                owner["AnimState"]:OverrideSymbol("hairpigtails", skin_id, "hairpigtails")
                owner["AnimState"]:OverrideSymbol("face", "gentleness_hat_pink_eye", "face")
            end,
            ["un_equip_fn"] = function(hat_inst, owner, skin_id)
                owner["AnimState"]:OverrideSymbol("hairpigtails", "gentleness", "hairpigtails")
                owner["AnimState"]:OverrideSymbol("face", "gentleness", "face")
            end,
        },

    },

    ["gentleness_back"] = {
        {
            ["skin_id"] = "gentleness_back",
            ["skin_name"] = "小猫背包",
            ["xml"] = extra_xml, ["tex"] = "gentleness_hat.tex",
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                changeSkinImageAndXml(inst, skin_id, extra_xml)
                inst["AnimState"]:SetBank("gentleness_back")
                inst["AnimState"]:SetBuild("gentleness_back")
                inst["AnimState"]:PlayAnimation("idle")
                inst:G_UpdateContainer("gentleness_back")
            end,
        },
        {
            ["skin_id"] = "gentleness_back_skin",
            ["skin_name"] = "棕-茉莉九觅",
            ["xml"] = extra_xml, ["tex"] = "gentleness_back_skin.tex",
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                changeSkinImageAndXml(inst, skin_id, extra_xml)
                inst["AnimState"]:SetBank("gentleness_back_skin")
                inst["AnimState"]:SetBuild("gentleness_back_skin")
                inst["AnimState"]:PlayAnimation("idle")
                inst:G_UpdateContainer("gentleness_back_skin")
            end,
        },
        {
            ["skin_id"] = "gentleness_back_pink",
            ["skin_name"] = "小猫背包 粉",
            ["xml"] = "images/gentleness_image/gentleness_back_pink.xml", ["tex"] = "gentleness_back_pink.tex",
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                changeSkinImageAndXml(inst, skin_id, "images/gentleness_image/gentleness_back_pink.xml")
                inst["AnimState"]:SetBank("gentleness_back_pink")
                inst["AnimState"]:SetBuild("gentleness_back_pink")
                inst["AnimState"]:PlayAnimation("idle")
                inst:G_UpdateContainer("gentleness_back_pink")
            end,
        },

    },

    ["gentleness_flower"] = {
        {
            ["skin_id"] = "gentleness_flower",
            ["skin_name"] = "花",
            ["xml"] = extra_xml, ["tex"] = "gentleness_flower.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bh", "gentleness_flower", "gentleness_bh")
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bh", "gentleness_flower", "gentleness_bh")
            end,
        },
        {
            ["skin_id"] = "gentleness_jh",
            ["skin_name"] = "菊花",
            ["xml"] = extra_xml, ["tex"] = "gentleness_jh.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bh", "gentleness_flower", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bh", "gentleness_flower", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_ll",
            ["skin_name"] = "铃兰",
            ["xml"] = extra_xml, ["tex"] = "gentleness_ll.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bh", "gentleness_flower", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bh", "gentleness_flower", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_mgh",
            ["skin_name"] = "玫瑰花",
            ["xml"] = extra_xml, ["tex"] = "gentleness_mgh.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bh", "gentleness_flower", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bh", "gentleness_flower", tostring(skin_id))
            end,
        },

        {
            ["skin_id"] = "gentleness_xqh",
            ["skin_name"] = "绣球花",
            ["xml"] = extra_xml, ["tex"] = "gentleness_xqh.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bh", "gentleness_flower", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bh", "gentleness_flower", tostring(skin_id))
            end,
        },

        {
            ["skin_id"] = "gentleness_yjx",
            ["skin_name"] = "郁金香",
            ["xml"] = extra_xml, ["tex"] = "gentleness_yjx.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bh", "gentleness_flower", tostring(skin_id))
            end,
            ["skin_client"] = function(inst, skin_id)
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bh", "gentleness_flower", tostring(skin_id))
            end,
        },

    },

    ["gentleness_amulet"] = {
        {
            ["skin_id"] = "gentleness_amulet",
            ["skin_name"] = "茉莉时夕",
            ["xml"] = extra_xml, ["tex"] = "gentleness_amulet.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:SetBuild(tostring(skin_id))
                changeSkinImage(inst, skin_id)

                if HH_UTILS:HasComponents(inst, "bundlemaker") then
                    inst["components"]["bundlemaker"]:SetSkinData("gentleness_bundle_gif", 9991)
                end
            end,
        },
        {
            ["skin_id"] = "gentleness_amulet_skin_1",
            ["skin_name"] = "茉莉时夕*黑",
            ["xml"] = extra_xml, ["tex"] = "gentleness_amulet_skin_1.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:SetBuild(tostring(skin_id))
                changeSkinImage(inst, skin_id)
                if HH_UTILS:HasComponents(inst, "bundlemaker") then
                    inst["components"]["bundlemaker"]:SetSkinData("gentleness_bundle_gif_a", 9992)
                end
            end,
        },
        {
            ["skin_id"] = "gentleness_amulet_skin_2",
            ["skin_name"] = "茉莉时夕*白",
            ["xml"] = extra_xml, ["tex"] = "gentleness_amulet_skin_2.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:SetBuild(tostring(skin_id))
                changeSkinImage(inst, skin_id)
                if HH_UTILS:HasComponents(inst, "bundlemaker") then
                    inst["components"]["bundlemaker"]:SetSkinData("gentleness_bundle_gif_b", 9993)
                end
            end,
        },
    },

    ["gentleness_bundle_a"] = {
        {
            ["skin_id"] = "gentleness_bundle_a",
            ["skin_name"] = "打包包裹",
            ["xml"] = extra_xml, ["tex"] = "gentleness_bundle_a.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bundle_a", "gentleness_bundle", tostring(skin_id))
                changeSkinImage(inst, skin_id)
            end,
        },
        {
            ["skin_id"] = "gentleness_bundle_b",
            ["skin_name"] = "打包包裹",
            ["xml"] = extra_xml, ["tex"] = "gentleness_bundle_b.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bundle_a", "gentleness_bundle", tostring(skin_id))
                changeSkinImage(inst, skin_id)
            end,
        },
        {
            ["skin_id"] = "gentleness_bundle_c",
            ["skin_name"] = "打包包裹",
            ["xml"] = extra_xml, ["tex"] = "gentleness_bundle_c.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bundle_a", "gentleness_bundle", tostring(skin_id))
                changeSkinImage(inst, skin_id)
            end,
        },
    },
    ["gentleness_bundle_paper_a"] = {
        {
            ["skin_id"] = "gentleness_bundle_paper_a",
            ["skin_name"] = "打包纸",
            ["xml"] = extra_xml, ["tex"] = "gentleness_bundle_paper_a.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bundle_a", "gentleness_bundle", tostring(skin_id))
                changeSkinImage(inst, skin_id)
            end,
        },
        {
            ["skin_id"] = "gentleness_bundle_paper_b",
            ["skin_name"] = "打包纸",
            ["xml"] = extra_xml, ["tex"] = "gentleness_bundle_paper_b.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bundle_a", "gentleness_bundle", tostring(skin_id))
                changeSkinImage(inst, skin_id)
            end,
        },
        {
            ["skin_id"] = "gentleness_bundle_paper_c",
            ["skin_name"] = "打包纸",
            ["xml"] = extra_xml, ["tex"] = "gentleness_bundle_paper_c.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bundle_a", "gentleness_bundle", tostring(skin_id))
                changeSkinImage(inst, skin_id)
            end,
        },
    },

    ["gentleness_bundle_gif"] = {
        {
            ["skin_id"] = "gentleness_bundle_gif",
            ["skin_name"] = "打包后的礼物",
            ["xml"] = extra_xml, ["tex"] = "gentleness_bundle_a.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bundle_a", "gentleness_bundle", "gentleness_bundle_a")
                changeBundleSkinImage(inst, skin_id, "gentleness_bundle_a")
            end,
        },
        {
            ["skin_id"] = "gentleness_bundle_gif_a",
            ["skin_name"] = "打包后的礼物*黑",
            ["xml"] = extra_xml, ["tex"] = "gentleness_bundle_b.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bundle_a", "gentleness_bundle", "gentleness_bundle_b")
                changeBundleSkinImage(inst, skin_id, "gentleness_bundle_b")
            end,
        },
        {
            ["skin_id"] = "gentleness_bundle_gif_b",
            ["skin_name"] = "打包后的礼物*白",
            ["xml"] = extra_xml, ["tex"] = "gentleness_bundle_c.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_bundle_a", "gentleness_bundle", "gentleness_bundle_c")
                changeBundleSkinImage(inst, skin_id, "gentleness_bundle_c")
            end,
        },
    },
    ["gentleness_tool_a"] = {
        {
            ["skin_id"] = "gentleness_tool_a",
            ["skin_name"] = "茉莉柠木",
            ["xml"] = extra_xml, ["tex"] = "gentleness_tool_a.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("base_folder", "gentleness_items", "gentleness_tool_a_ground")
                changeBundleSkinImage(inst, skin_id, "gentleness_tool_a")
            end,
        },
        {
            ["skin_id"] = "gentleness_tool_skin",
            ["skin_name"] = "茉莉柠木*皮肤",
            ["xml"] = extra_xml, ["tex"] = "gentleness_tool_skin.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("base_folder", "gentleness_items", "gentleness_tool_skin_ground")
                changeBundleSkinImage(inst, skin_id, "gentleness_tool_skin")
            end,
        },
    },
    ["gentleness_armor"] = {
        {
            ["skin_id"] = "gentleness_armor",
            ["skin_name"] = "茉莉暖阳",
            ["xml"] = extra_xml, ["tex"] = "gentleness_armor.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:SetBank("gentleness_armor")
                inst["AnimState"]:SetBuild("gentleness_armor")
                inst["AnimState"]:PlayAnimation("idle", true)
                inst["components"]["inventoryitem"]["atlasname"] = extra_xml
                changeBundleSkinImage(inst, skin_id, "gentleness_armor")
            end,
        },
        {
            ["skin_id"] = "gentleness_armor_skin_a",
            ["skin_name"] = "茉莉暖阳*蓝",
            ["xml"] = "images/gentleness_image/gentleness_armor_skin_a.xml", ["tex"] = "gentleness_armor_skin_a.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:SetBank("gentleness_armor_skin_a")
                inst["AnimState"]:SetBuild("gentleness_armor_skin_a")
                inst["AnimState"]:PlayAnimation("idle", true)
                inst["components"]["inventoryitem"]["atlasname"] = "images/gentleness_image/gentleness_armor_skin_a.xml"
                changeBundleSkinImage(inst, skin_id, "gentleness_armor_skin_a")
            end,
        },
        {
            ["skin_id"] = "gentleness_armor_skin_b",
            ["skin_name"] = "茉莉暖阳*棕",
            ["xml"] = "images/gentleness_image/gentleness_armor_skin_b.xml", ["tex"] = "gentleness_armor_skin_b.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:SetBank("gentleness_armor_skin_b")
                inst["AnimState"]:SetBuild("gentleness_armor_skin_b")
                inst["AnimState"]:PlayAnimation("idle", true)
                inst["components"]["inventoryitem"]["atlasname"] = "images/gentleness_image/gentleness_armor_skin_b.xml"
                changeBundleSkinImage(inst, skin_id, "gentleness_armor_skin_b")
            end,
        },
        {
            ["skin_id"] = "gentleness_armor_skin_black",
            ["skin_name"] = "茉莉暖阳*黑",
            ["xml"] = "images/gentleness_image/gentleness_armor_skin_black.xml", ["tex"] = "gentleness_armor_skin_black.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:SetBank("gentleness_armor_skin_black")
                inst["AnimState"]:SetBuild("gentleness_armor_skin_black")
                inst["AnimState"]:PlayAnimation("idle", true)
                inst["components"]["inventoryitem"]["atlasname"] = "images/gentleness_image/gentleness_armor_skin_black.xml"
                changeBundleSkinImage(inst, skin_id, "gentleness_armor_skin_black")
            end,
        },
        {
            ["skin_id"] = "gentleness_armor_skin_pueple",
            ["skin_name"] = "茉莉暖阳*紫",
            ["xml"] = "images/gentleness_image/gentleness_armor_skin_pueple.xml", ["tex"] = "gentleness_armor_skin_pueple.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:SetBank("gentleness_armor_skin_pueple")
                inst["AnimState"]:SetBuild("gentleness_armor_skin_pueple")
                inst["AnimState"]:PlayAnimation("idle", true)
                inst["components"]["inventoryitem"]["atlasname"] = "images/gentleness_image/gentleness_armor_skin_pueple.xml"
                changeBundleSkinImage(inst, skin_id, "gentleness_armor_skin_pueple")
            end,
        },
        {
            ["skin_id"] = "gentleness_armor_skin_pink_a",
            ["skin_name"] = "茉莉暖阳*粉色",
            ["xml"] = "images/gentleness_image/gentleness_armor_skin_pink_a.xml", ["tex"] = "gentleness_armor_skin_pink_a.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:SetBank("gentleness_armor_skin_pink_a")
                inst["AnimState"]:SetBuild("gentleness_armor_skin_pink_a")
                inst["AnimState"]:PlayAnimation("idle", true)
                changeSkinImageAndXml(inst, skin_id, "images/gentleness_image/gentleness_armor_skin_pink_a.xml")
            end,
        },
        {
            ["skin_id"] = "gentleness_armor_skin_pink_b",
            ["skin_name"] = "茉莉暖阳*粉色",
            ["xml"] = "images/gentleness_image/gentleness_armor_skin_pink_b.xml", ["tex"] = "gentleness_armor_skin_pink_b.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:SetBank("gentleness_armor_skin_pink_b")
                inst["AnimState"]:SetBuild("gentleness_armor_skin_pink_b")
                inst["AnimState"]:PlayAnimation("idle", true)
                changeSkinImageAndXml(inst, skin_id, "images/gentleness_image/gentleness_armor_skin_pink_b.xml")
            end,
        },
    },
    ["gentleness_cat_box"] = {
        {
            ["skin_id"] = "gentleness_cat_box",
            ["skin_name"] = "盒子",
            ["xml"] = "images/gentleness_image/gentleness_cat_box.xml", ["tex"] = "gentleness_cat_box.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_cat_box", "gentleness_cat_box", "gentleness_cat_box")
                inst["components"]["inventoryitem"]:ChangeImageName(skin_id)
                inst:G_UpdateContainer("gentleness_cat_box")
            end,
        },
        {
            ["skin_id"] = "gentleness_cat_box_skin_black",
            ["skin_name"] = "随身小猫包*黑",
            ["xml"] = "images/gentleness_image/gentleness_cat_box.xml", ["tex"] = "gentleness_cat_box_skin_black.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_cat_box", "gentleness_cat_box", tostring(skin_id))
                inst["components"]["inventoryitem"]:ChangeImageName(skin_id)
                inst:G_UpdateContainer("gentleness_cat_box_skin_black")
            end,
        },
        {
            ["skin_id"] = "gentleness_cat_box_skin_white",
            ["skin_name"] = "随身小猫包*白",
            ["xml"] = "images/gentleness_image/gentleness_cat_box.xml", ["tex"] = "gentleness_cat_box_skin_white.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_cat_box", "gentleness_cat_box", tostring(skin_id))
                inst["components"]["inventoryitem"]:ChangeImageName(skin_id)
                inst:G_UpdateContainer("gentleness_cat_box_skin_white")
            end,
        },
    },
    ["gentleness_chest_cw"] = {
        {
            ["skin_id"] = "gentleness_chest_cw",
            ["skin_name"] = "默认",
            ["xml"] = extra_xml, ["tex"] = "gentleness_chest_cw.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", "gentleness_chest_d")
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", "gentleness_chest_d")
                inst:G_UpdateContainer("gentleness_chest_cw")
            end,
        },
        {
            ["skin_id"] = "gentleness_skin_c",
            ["skin_name"] = "飞莹扑火",
            ["xml"] = "images/gentleness_image/gentleness_bottle_skin.xml", ["tex"] = "gentleness_skin_c.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", skin_id)
                inst:G_UpdateContainer("gentleness_chest_cw_skin_1")
            end,
        },
        {
            ["skin_id"] = "gentleness_skin_d",
            ["skin_name"] = "魈鸟守护",
            ["xml"] = "images/gentleness_image/gentleness_bottle_skin.xml", ["tex"] = "gentleness_skin_d.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", skin_id)
                inst:G_UpdateContainer("gentleness_chest_cw_skin_2")
            end,
        },
    },

    ["gentleness_chest_ice"] = {
        {
            ["skin_id"] = "gentleness_chest_ice",
            ["skin_name"] = "默认",
            ["xml"] = extra_xml, ["tex"] = "gentleness_chest_ice.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", "gentleness_chest_a")
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", "gentleness_chest_a")
                inst:G_UpdateContainer("gentleness_chest_ice")
            end,
        },
        {
            ["skin_id"] = "gentleness_skin_a",
            ["skin_name"] = "纯粹的自由喵",
            ["xml"] = "images/gentleness_image/gentleness_bottle_skin.xml", ["tex"] = "gentleness_skin_a.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", "gentleness_skin_a")
                inst:G_UpdateContainer("gentleness_chest_ice_skin_2")
            end,
        },
        {
            ["skin_id"] = "gentleness_skin_b",
            ["skin_name"] = "阮梅微寒",
            ["xml"] = "images/gentleness_image/gentleness_bottle_skin.xml", ["tex"] = "gentleness_skin_b.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", skin_id)
                inst:G_UpdateContainer("gentleness_chest_ice_skin_1")
            end,
        },
    },
    ["gentleness_chest_fire"] = {
        {
            ["skin_id"] = "gentleness_chest_fire",
            ["skin_name"] = "默认",
            ["xml"] = extra_xml, ["tex"] = "gentleness_chest_fire.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", "gentleness_chest_c")
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", "gentleness_chest_c")
                inst:G_UpdateContainer("gentleness_chest_fire")
            end,
        },
        {
            ["skin_id"] = "gentleness_skin_e",
            ["skin_name"] = "枫月思乡",
            ["xml"] = "images/gentleness_image/gentleness_bottle_skin.xml", ["tex"] = "gentleness_skin_e.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", skin_id)
                inst:G_UpdateContainer("gentleness_chest_fire_skin_1")
            end,
        },
        {
            ["skin_id"] = "gentleness_skin_f",
            ["skin_name"] = "浪漫之神",
            ["xml"] = "images/gentleness_image/gentleness_bottle_skin.xml", ["tex"] = "gentleness_skin_f.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", skin_id)
                inst:G_UpdateContainer("gentleness_chest_fire_skin_2")
            end,
        },
    },
    ["gentleness_chest_money"] = {
        {
            ["skin_id"] = "gentleness_chest_money",
            ["skin_name"] = "默认",
            ["xml"] = extra_xml, ["tex"] = "gentleness_chest_money.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", "gentleness_chest_b")
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", "gentleness_chest_b")
                inst:G_UpdateContainer("gentleness_chest_money")
            end,
        },
        {
            ["skin_id"] = "gentleness_skin_g",
            ["skin_name"] = "清汤炖猫",
            ["xml"] = "images/gentleness_image/gentleness_bottle_skin.xml", ["tex"] = "gentleness_skin_g.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", tostring(skin_id))
                inst:G_UpdateContainer("gentleness_chest_money_skin_2")
            end,
        },
        {
            ["skin_id"] = "gentleness_skin_h",
            ["skin_name"] = "所有或一无所有",
            ["xml"] = "images/gentleness_image/gentleness_bottle_skin.xml", ["tex"] = "gentleness_skin_h.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", tostring(skin_id))
                inst:G_UpdateContainer("gentleness_chest_money_skin_1")
            end,
        },
    },
    ["gentleness_mmg"] = {
        {
            ["skin_id"] = "gentleness_mmg",
            ["skin_name"] = "符玄",
            ["xml"] = "images/gentleness_image/gentleness_mmg.xml", ["tex"] = "gentleness_mmg.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", "gentleness_mmg")
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", "gentleness_mmg")
            end,
        },
        {
            ["skin_id"] = "gentleness_mmg_hh",
            ["skin_name"] = "霍霍",
            ["xml"] = "images/gentleness_image/gentleness_mmg.xml", ["tex"] = "gentleness_mmg_hh.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_mmg_hm",
            ["skin_name"] = "阮梅",
            ["xml"] = "images/gentleness_image/gentleness_mmg.xml", ["tex"] = "gentleness_mmg_hm.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_mmg_jl",
            ["skin_name"] = "镜流",
            ["xml"] = "images/gentleness_image/gentleness_mmg.xml", ["tex"] = "gentleness_mmg_jl.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_mmg_jpd",
            ["skin_name"] = "杰帕德",
            ["xml"] = "images/gentleness_image/gentleness_mmg.xml", ["tex"] = "gentleness_mmg_jpd.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_mmg_jy",
            ["skin_name"] = "景元",
            ["xml"] = "images/gentleness_image/gentleness_mmg.xml", ["tex"] = "gentleness_mmg_jy.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_mmg_ls",
            ["skin_name"] = "罗刹",
            ["xml"] = "images/gentleness_image/gentleness_mmg.xml", ["tex"] = "gentleness_mmg_ls.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_mmg_lw",
            ["skin_name"] = "老王",
            ["xml"] = "images/gentleness_image/gentleness_mmg.xml", ["tex"] = "gentleness_mmg_lw.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_mmg_sb",
            ["skin_name"] = "桑博",
            ["xml"] = "images/gentleness_image/gentleness_mmg.xml", ["tex"] = "gentleness_mmg_sb.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_mmg_sj",
            ["skin_name"] = "砂金",
            ["xml"] = "images/gentleness_image/gentleness_mmg.xml", ["tex"] = "gentleness_mmg_sj.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_mmg_tp",
            ["skin_name"] = "托帕",
            ["xml"] = "images/gentleness_image/gentleness_mmg.xml", ["tex"] = "gentleness_mmg_tp.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_mmg_xe",
            ["skin_name"] = "希儿",
            ["xml"] = "images/gentleness_image/gentleness_mmg.xml", ["tex"] = "gentleness_mmg_xe.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_mmg_yl",
            ["skin_name"] = "银狼",
            ["xml"] = "images/gentleness_image/gentleness_mmg.xml", ["tex"] = "gentleness_mmg_yl.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_mmg_yy",
            ["skin_name"] = "银月",
            ["xml"] = "images/gentleness_image/gentleness_mmg.xml", ["tex"] = "gentleness_mmg_yy.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_mmg_yyue",
            ["skin_name"] = "饮月",
            ["xml"] = "images/gentleness_image/gentleness_mmg.xml", ["tex"] = "gentleness_mmg_yyue.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_mmg_yz",
            ["skin_name"] = "银枝",
            ["xml"] = "images/gentleness_image/gentleness_mmg.xml", ["tex"] = "gentleness_mmg_yz.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_mmg_zl",
            ["skin_name"] = "真理",
            ["xml"] = "images/gentleness_image/gentleness_mmg.xml", ["tex"] = "gentleness_mmg_zl.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_mmg", "gentleness_mmg", tostring(skin_id))
            end,
        },
    },
    ["gentleness_cook_pot_item"] = {
        {
            ["skin_id"] = "gentleness_cook_pot_item",
            ["skin_name"] = "经典",
            ["xml"] = "images/gentleness_image/gentleness_items.xml", ["tex"] = "gentleness_cook_pot_item.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:SetBuild("gentleness_cook_pot")
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_cook_pot")
                inst["components"]["inventoryitem"]["atlasname"] = "images/gentleness_image/gentleness_items.xml"
                inst["components"]["inventoryitem"]:ChangeImageName(skin_id)
            end,
        },
        {
            ["skin_id"] = "gentleness_cook_pot_skin_1",
            ["skin_name"] = "蝴蝶结珐琅锅",
            ["xml"] = "images/gentleness_image/gentleness_cook_pot_skin_1.xml", ["tex"] = "gentleness_cook_pot_skin_1.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:SetBuild("gentleness_cook_pot_skin_1")
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_cook_pot_skin_1")
                inst["components"]["inventoryitem"]["atlasname"] = "images/gentleness_image/gentleness_cook_pot_skin_1.xml"
                inst["components"]["inventoryitem"]:ChangeImageName(skin_id)
            end,
        },
    },
    ["gentleness_cook_pot"] = {
        {
            ["skin_id"] = "gentleness_cook_pot",
            ["skin_name"] = "经典",
            ["xml"] = "images/gentleness_image/gentleness_items.xml", ["tex"] = "gentleness_cook_pot_item.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:SetBuild("gentleness_cook_pot")
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_cook_pot")
            end,
        },
        {
            ["skin_id"] = "gentleness_cook_pot_build_skin_1",
            ["skin_name"] = "蝴蝶结珐琅锅",
            ["xml"] = "images/gentleness_image/gentleness_cook_pot_skin_1.xml", ["tex"] = "gentleness_cook_pot_skin_1.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:SetBuild("gentleness_cook_pot_skin_1")
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_cook_pot_skin_1")
            end,
        },
    },
    ---------------------------------------------栅栏-----------------------------------------------------

    ["gentleness_fence"] = {
        {
            ["skin_id"] = "gentleness_fence",
            ["skin_name"] = "经典",
            ["xml"] = "images/gentleness_image/gentleness_fence_item.xml", ["tex"] = "gentleness_fence_item.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["skinname"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_fence")
            end,
        },
        {
            ["skin_id"] = "gentleness_fence_yellow",
            ["skin_name"] = "黄色猫头栅栏",
            ["xml"] = "images/gentleness_image/gentleness_fence_yellow.xml", ["tex"] = "gentleness_fence_yellow.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["skinname"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_fence_yellow")
            end,
        },
        {
            ["skin_id"] = "gentleness_fence_purple",
            ["skin_name"] = "紫色猫头栅栏",
            ["xml"] = "images/gentleness_image/gentleness_fence_purple.xml", ["tex"] = "gentleness_fence_purple.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["skinname"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_fence_purple")
            end,
        },
        {
            ["skin_id"] = "gentleness_fence_blue_a",
            ["skin_name"] = "深蓝色猫头栅栏",
            ["xml"] = "images/gentleness_image/gentleness_fence_blue_a.xml", ["tex"] = "gentleness_fence_blue_a.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["skinname"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_fence_blue_a")
            end,
        },
        {
            ["skin_id"] = "gentleness_fence_pink",
            ["skin_name"] = "浅粉色猫头栅栏",
            ["xml"] = "images/gentleness_image/gentleness_fence_pink.xml", ["tex"] = "gentleness_fence_pink.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["skinname"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_fence_pink")
            end,
        },
        {
            ["skin_id"] = "gentleness_fence_red",
            ["skin_name"] = "玫红色猫头栅栏",
            ["xml"] = "images/gentleness_image/gentleness_fence_red.xml", ["tex"] = "gentleness_fence_red.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["skinname"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_fence_red")
            end,
        },
        {
            ["skin_id"] = "gentleness_fence_green",
            ["skin_name"] = "绿色猫头栅栏",
            ["xml"] = "images/gentleness_image/gentleness_fence_green.xml", ["tex"] = "gentleness_fence_green.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["skinname"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_fence_green")
            end,
        },
        {
            ["skin_id"] = "gentleness_fence_blue",
            ["skin_name"] = "蓝色猫头栅栏",
            ["xml"] = "images/gentleness_image/gentleness_fence_blue.xml", ["tex"] = "gentleness_fence_blue.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["skinname"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_fence_blue")
            end,
        },
    },
    ["gentleness_fence_item"] = {
        {
            ["skin_id"] = "gentleness_fence_item",
            ["skin_name"] = "经典",
            ["xml"] = "images/gentleness_image/gentleness_fence_item.xml", ["tex"] = "gentleness_fence_item.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["skinname"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_fence")
                changeSkinImageAndXml(inst, skin_id, "images/gentleness_image/gentleness_fence_item.xml")
            end,
        },
        {
            ["skin_id"] = "gentleness_fence_yellow",
            ["skin_name"] = "黄色猫头栅栏",
            ["xml"] = "images/gentleness_image/gentleness_fence_yellow.xml", ["tex"] = "gentleness_fence_yellow.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["skinname"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_fence_yellow")
                changeSkinImageAndXml(inst, skin_id, "images/gentleness_image/gentleness_fence_yellow.xml")
            end,
        },

        {
            ["skin_id"] = "gentleness_fence_purple",
            ["skin_name"] = "紫色猫头栅栏",
            ["xml"] = "images/gentleness_image/gentleness_fence_purple.xml", ["tex"] = "gentleness_fence_purple.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["skinname"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_fence_purple")
                changeSkinImageAndXml(inst, skin_id, "images/gentleness_image/gentleness_fence_purple.xml")
            end,
        },
        {
            ["skin_id"] = "gentleness_fence_blue_a",
            ["skin_name"] = "深蓝色猫头栅栏",
            ["xml"] = "images/gentleness_image/gentleness_fence_blue_a.xml", ["tex"] = "gentleness_fence_blue_a.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["skinname"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_fence_blue_a")
                changeSkinImageAndXml(inst, skin_id, "images/gentleness_image/gentleness_fence_blue_a.xml")
            end,
        },
        {
            ["skin_id"] = "gentleness_fence_pink",
            ["skin_name"] = "浅粉色猫头栅栏",
            ["xml"] = "images/gentleness_image/gentleness_fence_pink.xml", ["tex"] = "gentleness_fence_pink.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["skinname"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_fence_pink")
                changeSkinImageAndXml(inst, skin_id, "images/gentleness_image/gentleness_fence_pink.xml")
            end,
        },
        {
            ["skin_id"] = "gentleness_fence_red",
            ["skin_name"] = "玫红色猫头栅栏",
            ["xml"] = "images/gentleness_image/gentleness_fence_red.xml", ["tex"] = "gentleness_fence_red.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["skinname"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_fence_red")
                changeSkinImageAndXml(inst, skin_id, "images/gentleness_image/gentleness_fence_red.xml")
            end,
        },
        {
            ["skin_id"] = "gentleness_fence_green",
            ["skin_name"] = "绿色猫头栅栏",
            ["xml"] = "images/gentleness_image/gentleness_fence_green.xml", ["tex"] = "gentleness_fence_green.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["skinname"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_fence_green")
                changeSkinImageAndXml(inst, skin_id, "images/gentleness_image/gentleness_fence_green.xml")
            end,
        },
        {
            ["skin_id"] = "gentleness_fence_blue",
            ["skin_name"] = "蓝色猫头栅栏",
            ["xml"] = "images/gentleness_image/gentleness_fence_blue.xml", ["tex"] = "gentleness_fence_blue.tex",
            ["skin_server"] = function(inst, skin_id)
                inst["g_item_skin"] = skin_id
                inst["skinname"] = skin_id
                inst["AnimState"]:SetBuild("gentleness_fence_blue")
                changeSkinImageAndXml(inst, skin_id, "images/gentleness_image/gentleness_fence_blue.xml")
            end,
        },
    },
    ------------------------------------------2025-------------------------------------
    ["gentleness_wooden_board"] = {
        {
            ["skin_id"] = "gentleness_wooden_board",
            ["skin_name"] = "经典",
            ["xml"] = "images/gentleness_image/gentleness_wooden_board.xml", ["tex"] = "gentleness_wooden_board.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_wooden_board", "gentleness_wooden_board", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_wooden_board", "gentleness_wooden_board", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_wooden_board_skin_a",
            ["skin_name"] = "功能区木牌",
            ["xml"] = "images/gentleness_image/gentleness_wooden_board_skin_a.xml", ["tex"] = "gentleness_wooden_board_skin_a.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_wooden_board", "gentleness_wooden_board", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_wooden_board", "gentleness_wooden_board", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_wooden_board_skin_b",
            ["skin_name"] = "小菜地木牌",
            ["xml"] = "images/gentleness_image/gentleness_wooden_board_skin_b.xml", ["tex"] = "gentleness_wooden_board_skin_b.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_wooden_board", "gentleness_wooden_board", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_wooden_board", "gentleness_wooden_board", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_wooden_board_skin_c",
            ["skin_name"] = "小餐吧木牌",
            ["xml"] = "images/gentleness_image/gentleness_wooden_board_skin_c.xml", ["tex"] = "gentleness_wooden_board_skin_c.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_wooden_board", "gentleness_wooden_board", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_wooden_board", "gentleness_wooden_board", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_wooden_board_skin_d",
            ["skin_name"] = "野餐吧木牌",
            ["xml"] = "images/gentleness_image/gentleness_wooden_board_skin_d.xml", ["tex"] = "gentleness_wooden_board_skin_d.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_wooden_board", "gentleness_wooden_board", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_wooden_board", "gentleness_wooden_board", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_wooden_board_skin_e",
            ["skin_name"] = "游乐场木牌",
            ["xml"] = "images/gentleness_image/gentleness_wooden_board_skin_e.xml", ["tex"] = "gentleness_wooden_board_skin_e.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_wooden_board", "gentleness_wooden_board", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_wooden_board", "gentleness_wooden_board", tostring(skin_id))
            end,
        },
    },
    ["gentleness_carpet"] = {
        {
            ["skin_id"] = "gentleness_carpet",
            ["skin_name"] = "经典",
            ["xml"] = "images/gentleness_image/gentleness_carpet.xml", ["tex"] = "gentleness_carpet.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_carpet", "gentleness_carpet", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_carpet", "gentleness_carpet", tostring(skin_id))
            end,
        },
        {
            ["skin_id"] = "gentleness_carpet_skin_a",
            ["skin_name"] = "花朵野餐地毯",
            ["xml"] = "images/gentleness_image/gentleness_carpet_skin_a.xml", ["tex"] = "gentleness_carpet_skin_a.tex",
            ["placer_fn"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_carpet", "gentleness_carpet", tostring(skin_id))
            end,
            ["skin_server"] = function(inst, skin_id)
                inst["AnimState"]:OverrideSymbol("gentleness_carpet", "gentleness_carpet", tostring(skin_id))
            end,
        },
    },

}
return HH_SKIN
