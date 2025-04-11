----
---文件处理时间:2024-07-01 23:48:41
---
local HH_UTILS = require("utils/gentleness_utils")
local Widget = require("widgets/widget")
local Text = require("widgets/text")
local Image = require("widgets/image")
local shop_xml = "images/gentleness_image/gentleness_shop_ui.xml"
local shop_size_x, shop_size_y = 900, 600
local x_num, y_num = 6, 3
local com_item_xml = "images/gentleness_image/gentleness_items.xml"
local function getItemImageXml(item_id)
    if not GetInventoryItemAtlas then
        return com_item_xml
    end
    local base_xml = GetInventoryItemAtlas(tostring(item_id) .. ".tex")
    if base_xml then
        return base_xml
    end
    return com_item_xml
end
local item_list = {
    { ["id"] = "gentleness_box_random", ["value"] = 10, ["xml"] = com_item_xml, ["tex"] = "gentleness_box_random.tex", },
    { ["id"] = "megaflare", ["value"] = 10, ["xml"] = getItemImageXml("megaflare"), ["tex"] = "megaflare.tex", },
    --{ ["id"] = "sunkenchest", ["value"] = 20, ["xml"] = getItemImageXml("sunkenchest"), ["tex"] = "sunkenchest.tex", },
    { ["id"] = "ancienttree_seed", ["value"] = 20, ["xml"] = getItemImageXml("ancienttree_seed"), ["tex"] = "ancienttree_seed.tex", },

    { ["id"] = "turf_gentleness_green_blueprint", ["value"] = 10, ["xml"] = "images/gentleness_image/turf_gentleness_green.xml", ["tex"] = "turf_gentleness_green.tex", ["is_blueprint"] = true, },
    { ["id"] = "turf_gentleness_strawberry_blueprint", ["value"] = 10, ["xml"] = "images/gentleness_image/turf_gentleness_strawberry.xml", ["tex"] = "turf_gentleness_strawberry.tex", ["is_blueprint"] = true, },
    { ["id"] = "turf_gentleness_star_blueprint", ["value"] = 10, ["xml"] = "images/gentleness_image/turf_gentleness_star.xml", ["tex"] = "turf_gentleness_star.tex", ["is_blueprint"] = true, },
    { ["id"] = "gentleness_color_land_item_blueprint", ["value"] = 10, ["xml"] = "images/gentleness_image/gentleness_color_land_item.xml", ["tex"] = "gentleness_color_land_item.tex", ["is_blueprint"] = true, },
}
local trinket_num = NUM_TRINKETS or 46
for i = 1, trinket_num do
    local item_id = "trinket_" .. i
    table["insert"](item_list, {
        ["id"] = item_id, ["value"] = 1, ["xml"] = getItemImageXml(item_id), ["tex"] = item_id .. ".tex",
    })

end
local function hookFocusFn(hh_ui, focus_str)
    local oldOnGainFocusBack = hh_ui["OnGainFocus"]
    hh_ui["OnGainFocus"] = function()
        if oldOnGainFocusBack then
            oldOnGainFocusBack()
        end
        hh_ui["hh_desc"] = HH_UTILS:HHCreateTextUi(hh_ui, Vector3(0, 0, 1), tostring(focus_str), { 1, 1, 1, 1 }, 30)
        hh_ui["hh_desc"]:MoveTo(Vector3(0, 20, 1), Vector3(0, 40, 1), 0.5)
    end
    local oldOnLoseFocus = hh_ui["OnLoseFocus"]
    hh_ui["OnLoseFocus"] = function()
        if oldOnLoseFocus then
            oldOnLoseFocus()
        end
        HH_UTILS:HHKillChild(hh_ui, "hh_desc")
    end
end
local HH_UI = Class(Widget, function(self, owner)
    Widget["_ctor"](self, "g_shop_ui")
    self["owner"] = owner
    self["root"] = self:AddChild(Widget("ROOT"))
    self["root"]:SetVAnchor(ANCHOR_MIDDLE)
    self["root"]:SetHAnchor(ANCHOR_MIDDLE)
    self["root"]:SetScaleMode(SCALEMODE_PROPORTIONAL)
    self["hh_main"] = HH_UTILS:HHCreateImageUi(self["root"], shop_xml, "shop.tex", Vector3(0, 0, 0), shop_size_x, shop_size_y)
    local main_ui = self["hh_main"]
    main_ui["hh_close_btn"] = HH_UTILS:HHCreateImageButton(main_ui, shop_xml, "close.tex", Vector3(shop_size_x / 4 + 35, shop_size_y / 4 + 10, 1), 1, 1)
    main_ui["hh_close_btn"]:SetOnClick(function()
        self["owner"]:PushEvent("g_close_shop_ui", {})
        SendModRPCToServer(MOD_RPC["gentleness_rpc"]["gentleness_buy_item"], "close_shop")
    end)
    hookFocusFn(main_ui["hh_close_btn"], "关闭")
    main_ui["hh_money"] = HH_UTILS:HHCreateImageUi(main_ui, shop_xml, "money.tex", Vector3(shop_size_x / 4 + 70, -shop_size_y / 4 + 17, 0), 150, 150)
    main_ui["hh_money"]["money_str"] = HH_UTILS:HHCreateTextUi(main_ui["hh_money"], Vector3(0, 0, 1), "余额\n0", nil, 50)
    main_ui["hh_money"]["money_str"]:SetRotation(-15)

    self["hh_index"] = 1
    local all_num = #item_list
    local ui_num = x_num * y_num
    if (all_num % ui_num) == 0 then
        self["max_index"] = all_num / ui_num
    else
        self["max_index"] = math["floor"](all_num / ui_num) + 1
    end
    main_ui["hh_last_btn"] = HH_UTILS:HHCreateImageButton(main_ui, shop_xml, "btn.tex", Vector3(-shop_size_x / 4 - 35, -70, 1), 1, 1)

    main_ui["hh_last_btn"]:SetOnClick(function()
        self:ChangeIndexBtn(true)
    end)
    main_ui["hh_next_btn"] = HH_UTILS:HHCreateImageButton(main_ui, shop_xml, "btn.tex", Vector3(shop_size_x / 4 + 35, -70, 1), 1, 1)
    main_ui["hh_next_btn"]:SetRotation(180)
    main_ui["hh_next_btn"]:SetOnClick(function()
        self:ChangeIndexBtn(false)
    end)
    self:UpdateIndexUi(1)
    self["inst"]:ListenForEvent("g_coin_num", function(inst, data)
        local c_main_ui = self["hh_main"]
        local coin_num = HH_UTILS:GetClientValue(self["owner"], "g_coin_num")
        if c_main_ui and c_main_ui["hh_money"] and c_main_ui["hh_money"]["money_str"] then
            c_main_ui["hh_money"]["money_str"]:SetString(string["format"]("余额\n%s", tostring(coin_num)))
        end
    end, self["owner"])
end)

function HH_UI:ChangeIndexBtn(is_last)
    if is_last then
        if self["hh_index"] == 1 then
            return
        end
        self["hh_index"] = math["max"](self["hh_index"] - 1, 1)
    else
        if self["hh_index"] == self["max_index"] then
            return
        end
        self["hh_index"] = math["min"](self["hh_index"] + 1, self["max_index"])
    end
    self:UpdateIndexUi(self["hh_index"])
end

function HH_UI:UpdateIndexUi(hh_index)
    local main_ui = self["hh_main"]
    HH_UTILS:HHKillChild(main_ui, "hh_slot_ui")
    main_ui["hh_slot_ui"] = main_ui:AddChild(Widget(""))
    local slot_father = main_ui["hh_slot_ui"]
    local index_num = tonumber(hh_index) or 1
    local ui_num = x_num * y_num
    local start_index = (hh_index - 1) * ui_num + 1
    local end_index = hh_index * ui_num
    if not item_list[start_index] then
        return
    end
    local start_pos_x, start_pos_y = -shop_size_x / 4 - 30, shop_size_y / 4 - 110
    for i = start_index, end_index do
        if not item_list[i] then
            break
        end
        local line_num = math["floor"]((i - start_index) / x_num)
        local x_index = (i - start_index) % x_num + 1
        local slot_x, slot_y = start_pos_x + x_index * 75, start_pos_y - line_num * 90
        local item_config = item_list[i]
        local item_id = tostring(item_config["id"])
        local item_value = tonumber(item_config["value"]) or 999
        local item_name_str = item_config["name"] or STRINGS["NAMES"][string["upper"](item_id)]
        slot_father["hh_" .. item_id] = HH_UTILS:HHCreateImageButton(slot_father, shop_xml, "slot.tex", Vector3(slot_x, slot_y, 1), 0.7, 0.7)
        hookFocusFn(slot_father["hh_" .. item_id], tostring(item_name_str))
        local slot_child = slot_father["hh_" .. item_id]
        local oldOnGainFocusBack = slot_child["OnGainFocus"]
        slot_child["OnGainFocus"] = function()
            if oldOnGainFocusBack then
                oldOnGainFocusBack()
            end
            if slot_child["hh_image"] then
                slot_child["hh_image"]:SetScale(1.1)
            end
        end
        local oldOnLoseFocus = slot_child["OnLoseFocus"]
        slot_child["OnLoseFocus"] = function()
            if oldOnLoseFocus then
                oldOnLoseFocus()
            end
            if slot_child["hh_image"] then
                slot_child["hh_image"]:SetScale(1)
            end
        end
        local base_xml, base_tex = com_item_xml, item_id .. ".tex"
        if item_config["xml"] and item_config["tex"] then
            base_xml, base_tex = item_config["xml"], item_config["tex"]
        end
        slot_child["hh_image"] = HH_UTILS:HHCreateImageUi(slot_child, base_xml, base_tex, Vector3(0, 0, 0), 45, 45)
        slot_child["hh_image"]:SetClickable(false)
        --加点小细节
        if item_config["is_blueprint"] then
            local item_image_ui = slot_child["hh_image"]
            item_image_ui["blueprint_image"] = HH_UTILS:HHCreateImageUi(item_image_ui, getItemImageXml("blueprint"), "blueprint.tex", Vector3(20, -15, 0), 20, 20)
            item_image_ui["blueprint_image"]:SetClickable(false)
        end
        local item_name = STRINGS["NAMES"][string["upper"](item_id)] or "未知盲盒"
        item_name = tostring(item_value)
        slot_child["hh_text"] = HH_UTILS:HHCreateTextUi(slot_child, Vector3(0, -30, 1), tostring(item_name), nil, 20)
        slot_child:SetOnClick(function()
            SendModRPCToServer(MOD_RPC["gentleness_rpc"]["gentleness_buy_item"], "buy_box", item_id, item_value)
        end)
    end

end
return HH_UI
