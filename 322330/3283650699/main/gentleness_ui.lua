----
---文件处理时间:2024-07-01 23:48:41
---
local Badge = require("widgets/badge")
local UIAnim = require("widgets/uianim")
local HH_UTILS = require("utils/gentleness_utils")

local MAGIC_UI = Class(Badge, function(self, owner, art)
    Badge["_ctor"](self, "gentleness_magic", owner)
    self["owner"] = owner

    if self["anim"] then
        self["anim"]:GetAnimState():SetBank("gentleness_magic")
        self["anim"]:GetAnimState():SetBuild("gentleness_magic")
    end
    self["val"] = 0
    self["max"] = TUNING["GENTLENESS_MAGIC_MAX"]

    self["inst"]:ListenForEvent("gentleness_magic_num", function(inst, data)
        if self["owner"] and self["owner"]["prefab"] == "gentleness" and self["owner"]["gentleness_magic_num"] then
            local magic_value = self["owner"]["gentleness_magic_num"]:value()

            magic_value = tonumber(magic_value) or 0
            local magic_max = TUNING["GENTLENESS_MAGIC_MAX"]
            local magic_percent = magic_value / magic_max
            self:SetPercent(magic_percent, magic_max)
        end
    end, self["owner"])
end)

function MAGIC_UI:SetPercent(val, max)
    Badge["SetPercent"](self, val, max)
end
AddClassPostConstruct("widgets/statusdisplays", function(self)
    if self["owner"] and self["owner"]["prefab"] == "gentleness" then
        self["gentleness_magic"] = self:AddChild(MAGIC_UI(self["owner"]))
        self["owner"]:DoTaskInTime(0.5, function()
            local x1, y1, z1 = self["stomach"]:GetPosition():Get()
            local x2, y2, z2 = self["brain"]:GetPosition():Get()
            local x3, y3, z3 = self["heart"]:GetPosition():Get()
            local offset_x = 0
            if y2 == y1 or y2 == y3 then

                self["gentleness_magic"]:SetPosition(self["stomach"]:GetPosition() + Vector3(x1 - x2 + offset_x, 0, 0))
            else
                self["gentleness_magic"]:SetPosition(self["stomach"]:GetPosition() + Vector3(x1 - x3 + offset_x, 0, 0))
            end
        end)

        local old_SetGhostMode = self["SetGhostMode"]
        function self:SetGhostMode(ghostmode, ...)
            old_SetGhostMode(self, ghostmode, ...)
            if ghostmode then
                if self["gentleness_magic"] ~= nil then
                    self["gentleness_magic"]:Hide()
                end
            else
                if self["gentleness_magic"] ~= nil then
                    self["gentleness_magic"]:Show()
                end
            end
        end
    end
end)

local containers = require("containers")
local params = {}

local function replaceUiAnimAndSlotBack(old_table, ui_name, image_xml, image_tex)
    local new_table = HH_UTILS:HHCopyTable(old_table)
    if new_table and new_table["widget"] and ui_name then
        new_table["widget"]["animbuild"] = tostring(ui_name)
        if HH_UTILS:IsHHType(image_xml, "string") and HH_UTILS:IsHHType(image_tex, "string")
                and HH_UTILS:IsHHType(new_table["widget"]["slotbg"], "table")
        then
            local slot_image_table = new_table["widget"]["slotbg"]
            for i, v in ipairs(slot_image_table) do
                if HH_UTILS:IsHHType(v, "table") then
                    v["image"] = image_tex
                    v["atlas"] = image_xml
                end
            end
        end
    end
    return new_table
end
local gentleness_back_base_ui = {
    ["widget"] = {
        ["slotpos"] = {},
        ["slotbg"] = {},
        ["animbank"] = "ui_krampusbag_2x8",
        ["animbuild"] = "gentleness_ui_blue",
        ["pos"] = Vector3(-5, -130, 0),
    },
    ["type"] = "pack",
    ["openlimit"] = 1,
    ["issidewidget"] = true,
}
for y = 0, 8 do
    table["insert"](gentleness_back_base_ui["widget"]["slotpos"], Vector3(-152, -75 * y + 315, 0))
    table["insert"](gentleness_back_base_ui["widget"]["slotpos"], Vector3(-152 + 75, -75 * y + 315, 0))
    table["insert"](gentleness_back_base_ui["widget"]["slotbg"], { ["image"] = "gentleness_slot_blue.tex", ["atlas"] = "images/gentleness_image/gentleness_slot_blue.xml" })
    table["insert"](gentleness_back_base_ui["widget"]["slotbg"], { ["image"] = "gentleness_slot_blue.tex", ["atlas"] = "images/gentleness_image/gentleness_slot_blue.xml" })
end
params["gentleness_back"] = replaceUiAnimAndSlotBack(gentleness_back_base_ui)
params["gentleness_back_skin"] = {
    ["widget"] = {
        ["slotpos"] = {},
        ["slotbg"] = {},
        ["animbank"] = "ui_krampusbag_2x8",
        ["animbuild"] = "gentleness_ui_brown",
        ["pos"] = Vector3(-5, -130, 0),
    },
    ["type"] = "pack",
    ["openlimit"] = 1,
    ["issidewidget"] = true,
}
for y = 0, 8 do
    table["insert"](params["gentleness_back_skin"]["widget"]["slotpos"], Vector3(-162, -75 * y + 315, 0))
    table["insert"](params["gentleness_back_skin"]["widget"]["slotpos"], Vector3(-162 + 75, -75 * y + 315, 0))
    table["insert"](params["gentleness_back_skin"]["widget"]["slotbg"], { ["image"] = "gentleness_slot_brown.tex", ["atlas"] = "images/gentleness_image/gentleness_slot_brown.xml" })
    table["insert"](params["gentleness_back_skin"]["widget"]["slotbg"], { ["image"] = "gentleness_slot_brown.tex", ["atlas"] = "images/gentleness_image/gentleness_slot_brown.xml" })
end
params["gentleness_back_pink"] = replaceUiAnimAndSlotBack(gentleness_back_base_ui, "gentleness_back_pink_ui", "images/gentleness_image/gentleness_slot_back_pink.xml", "gentleness_slot_back_pink.tex")

params["gentleness_amulet_container"] = {
    ["widget"] = {
        ["slotpos"] = {},
        ["slotbg"] = {},
        ["animbank"] = "ui_bundle_2x2",
        ["animbuild"] = "gentleness_amulet_ui",
        ["pos"] = Vector3(200, 0, 0),
        ["side_align_tip"] = 120,
        ["buttoninfo"] = {
            ["text"] = "打包",
            ["position"] = Vector3(0, -190, 0),
            ["validfn"] = function(inst)
                return inst["replica"]["container"] ~= nil and not inst["replica"]["container"]:IsEmpty()
            end,
            ["fn"] = function(inst, doer)
                if inst["components"]["container"] ~= nil then
                    BufferedAction(doer, inst, ACTIONS["WRAPBUNDLE"]):Do()
                elseif inst.replica.container ~= nil and not inst.replica.container:IsBusy() then
                    SendRPCToServer(RPC["DoWidgetButtonAction"], ACTIONS["WRAPBUNDLE"]["code"], inst, ACTIONS["WRAPBUNDLE"]["mod_name"])
                end
            end
        }
    },
    ["type"] = "cooker",
    ["itemtestfn"] = function(container, item, slot)
        return not (item:HasTag("irreplaceable") or item:HasTag("_container") or item:HasTag("bundle") or item:HasTag("nobundling"))
    end
}
for a = 1, 4 do
    for b = 1, 4 do
        table["insert"](params["gentleness_amulet_container"]["widget"]["slotpos"], Vector3(-170 + a * 72, 170 - b * 72, 0))
        table["insert"](params["gentleness_amulet_container"]["widget"]["slotbg"],
                { ["image"] = "gentleness_slot_pink.tex", ["atlas"] = "images/gentleness_image/gentleness_slot_pink.xml" })
    end
end

local function slotsSortValidFn(inst)
    return inst["replica"]["container"] ~= nil and not inst["replica"]["container"]:IsEmpty()
end

local function replaceUiAnim(old_table, ui_name, item_fn)
    local new_table = HH_UTILS:HHCopyTable(old_table)
    if new_table and new_table["widget"] then
        if ui_name then
            new_table["widget"]["animbuild"] = tostring(ui_name)
        end
        if HH_UTILS:IsHHType(item_fn, "function") then
            new_table["itemtestfn"] = item_fn
        end
    end
    return new_table
end

local cw_ui_base = {
    ["widget"] = {
        ["slotpos"] = {},
        ["slotbg"] = {},
        ["animbank"] = "ui_chest_2x2",
        ["animbuild"] = "gentleness_chest_cw_ui",
        ["pos"] = Vector3(0, 200, 0),
    },
    ["type"] = "chest",
}
for b = 1, 5 do
    for a = 1, 5 do
        table["insert"](cw_ui_base["widget"]["slotpos"], Vector3(-245 + a * 80, 245 - b * 80, 0))
        table["insert"](cw_ui_base["widget"]["slotbg"],
                { ["image"] = "gentleness_slot_chest.tex", ["atlas"] = "images/gentleness_image/gentleness_slot_chest.xml" })
    end
end
params["gentleness_chest_cw"] = replaceUiAnim(cw_ui_base)
params["gentleness_chest_cw_skin_1"] = replaceUiAnim(cw_ui_base, "gentleness_chest_ui_hdj")
params["gentleness_chest_cw_skin_2"] = replaceUiAnim(cw_ui_base, "gentleness_chest_ui_bird")
local ice_ui_base = {
    ["widget"] = {
        ["slotpos"] = {},
        ["slotbg"] = {},
        ["animbank"] = "ui_chest_2x2",
        ["animbuild"] = "gentleness_chest_ice_ui",
        ["pos"] = Vector3(0, 200, 0),
    },
    ["type"] = "chest",
    ["itemtestfn"] = function(container, item, slot)
        if item:HasTag("icebox_valid") then
            return true
        end
        if not (item:HasTag("fresh") or item:HasTag("stale") or item:HasTag("spoiled")) then
            return false
        end
        if item:HasTag("smallcreature") then
            return false
        end
        for k, v in pairs(FOODTYPE) do
            if item:HasTag("edible_" .. v) then
                return true
            end
        end
        return false
    end
}
for b = 1, 5 do
    for a = 1, 5 do
        table["insert"](ice_ui_base["widget"]["slotpos"], Vector3(-245 + a * 80, 245 - b * 80, 0))
        table["insert"](ice_ui_base["widget"]["slotbg"],
                { ["image"] = "gentleness_slot_chest.tex", ["atlas"] = "images/gentleness_image/gentleness_slot_chest.xml" })
    end
end
params["gentleness_chest_ice"] = replaceUiAnim(ice_ui_base)
params["gentleness_chest_ice_skin_1"] = replaceUiAnim(ice_ui_base, "gentleness_chest_ui_sh")
params["gentleness_chest_ice_skin_2"] = replaceUiAnim(ice_ui_base, "gentleness_chest_ui_purple_cat")

local fire_ui_base = {
    ["widget"] = {
        ["slotpos"] = {},
        ["slotbg"] = {},
        ["animbank"] = "ui_chest_2x2",
        ["animbuild"] = "gentleness_chest_fire_ui",
        ["pos"] = Vector3(0, 200, 0),
    },
    ["type"] = "chest",
}
for b = 1, 5 do
    for a = 1, 5 do
        table["insert"](fire_ui_base["widget"]["slotpos"], Vector3(-245 + a * 80, 245 - b * 80, 0))
        table["insert"](fire_ui_base["widget"]["slotbg"],
                { ["image"] = "gentleness_slot_chest.tex", ["atlas"] = "images/gentleness_image/gentleness_slot_chest.xml" })
    end
end
params["gentleness_chest_fire"] = replaceUiAnim(fire_ui_base)
params["gentleness_chest_fire_skin_1"] = replaceUiAnim(fire_ui_base, "gentleness_chest_ui_fy")
params["gentleness_chest_fire_skin_2"] = replaceUiAnim(fire_ui_base, "gentleness_chest_ui_rose")

local replace_list = {
    ["rocks"] = "nitre",
    ["nitre"] = "flint",
    ["flint"] = "rocks",
    ["ice"] = "charcoal",
    ["charcoal"] = "ice",
    ["dug_berrybush"] = "dug_berrybush2",
    ["dug_berrybush2"] = "dug_berrybush_juicy",
    ["dug_berrybush_juicy"] = "dug_berrybush",
    ["dug_sapling"] = "dug_sapling_moon",
    ["dug_sapling_moon"] = "dug_sapling",
    ["shroom_skin"] = "dragon_scales",
    ["dragon_scales"] = "shroom_skin",
    ["petals"] = "petals_evil",
    ["petals_evil"] = "petals",
    ["butterflywings"] = "butter",
    ["butter"] = "butterflywings",
    ["moonbutterflywings"] = "goatmilk",
    ["goatmilk"] = "moonbutterflywings",
    ["beefalowool"] = "beardhair",
    ["beardhair"] = "beefalowool",
    ["goldnugget"] = "lucky_goldnugget",
    ["lucky_goldnugget"] = "goldnugget",
    ["slurtle_shellpieces"] = "cookiecuttershell",
    ["cookiecuttershell"] = "slurtle_shellpieces",
    ["bird_egg"] = "rottenegg",
    ["rottenegg"] = "bird_egg",
    ["redgem"] = "bluegem",
    ["bluegem"] = "redgem",
    ["purplegem"] = "greengem",
    ["greengem"] = "purplegem",
    ["yellowgem"] = "orangegem",
    ["orangegem"] = "yellowgem",
    ["moonrocknugget"] = "moonglass",
    ["moonglass"] = "moonrocknugget",
}
local function launchItem(item, angle)
    if not item["Physics"] then
        return
    end
    local speed = math["random"]() * 4 + 2
    angle = (angle + math["random"]() * 60 - 30) * DEGREES
    item["Physics"]:SetVel(speed * math["cos"](angle), math["random"]() * 2 + 8, speed * math["sin"](angle))
end

local money_ui_base = {
    ["widget"] = {
        ["slotpos"] = {},
        ["slotbg"] = {},
        ["animbank"] = "ui_chest_2x2",
        ["animbuild"] = "gentleness_chest_money_ui",
        ["pos"] = Vector3(0, 200, 0),
        ["buttoninfo"] = {
            ["text"] = "转换",
            ["position"] = Vector3(0, -230, 0),
            ["fn"] = function(inst, doer)
                if inst["components"]["container"] ~= nil then
                    if inst["g_btn_cd"] then
                        HH_UTILS:HHSay(doer, "点太快了")
                        return
                    end
                    inst["g_btn_cd"] = true
                    if not inst["g_cd_task"] then
                        inst["g_cd_task"] = inst:DoTaskInTime(1, function(_inst)
                            _inst["g_btn_cd"] = false
                            HH_UTILS:HHKillTask(_inst, "g_cd_task")
                        end)
                    end

                    local container_components = inst["components"]["container"]
                    local slot_num = container_components:GetNumSlots()
                    for i = 1, slot_num do
                        local hh_slot_item = container_components:GetItemInSlot(i)
                        if hh_slot_item and HH_UTILS:HasComponents(hh_slot_item, "stackable")
                                and HH_UTILS:HasComponents(hh_slot_item, "inventoryitem") then
                            local spawn_num = hh_slot_item["components"]["stackable"]["stacksize"] or 1
                            local spawn_id = nil
                            local slot_id = hh_slot_item["prefab"]
                            local new_spawn_max_num = 1
                            if replace_list[slot_id] then
                                spawn_id = replace_list[slot_id]
                                local test_spawn = SpawnPrefab(spawn_id)
                                if test_spawn then
                                    if HH_UTILS:HasComponents(test_spawn, "stackable") then

                                        new_spawn_max_num = tonumber(test_spawn["components"]["stackable"]["maxsize"]) or 1

                                        test_spawn:Remove()

                                        hh_slot_item:Remove()
                                        repeat
                                            local result_item = SpawnPrefab(spawn_id)
                                            if spawn_num > new_spawn_max_num then
                                                result_item["components"]["stackable"]:SetStackSize(new_spawn_max_num)
                                            else
                                                result_item["components"]["stackable"]:SetStackSize(spawn_num)
                                            end
                                            spawn_num = spawn_num - new_spawn_max_num
                                            local x, y, z = inst["Transform"]:GetWorldPosition()
                                            if inst["components"]["container"]:IsFull() then
                                                result_item["Transform"]:SetPosition(x, y, z)
                                                launchItem(result_item, math["random"](1, 360))
                                            else
                                                local chest_pos = inst:GetPosition()
                                                inst["components"]["container"]:GiveItem(result_item, nil, chest_pos)
                                            end
                                        until spawn_num <= 0
                                    else
                                        test_spawn:Remove()
                                    end
                                end
                            end
                        end
                    end
                elseif inst["replica"]["container"] ~= nil and not inst["replica"]["container"]:IsBusy() then
                    SendRPCToServer(RPC["DoWidgetButtonAction"], nil, inst, nil)
                end
            end,
            ["validfn"] = slotsSortValidFn,
        }
    },
    ["type"] = "chest",
    --["openlimit"] = 1,
}
for b = 1, 5 do
    for a = 1, 5 do
        table["insert"](money_ui_base["widget"]["slotpos"], Vector3(-245 + a * 80, 245 - b * 80, 0))
        table["insert"](money_ui_base["widget"]["slotbg"],
                { ["image"] = "gentleness_slot_chest.tex", ["atlas"] = "images/gentleness_image/gentleness_slot_chest.xml" })
    end
end
params["gentleness_chest_money"] = replaceUiAnim(money_ui_base)
params["gentleness_chest_money_skin_1"] = replaceUiAnim(money_ui_base, "gentleness_chest_ui_zp")
params["gentleness_chest_money_skin_2"] = replaceUiAnim(money_ui_base, "gentleness_chest_ui_cat")

---------------------------------------------------
params["gentleness_cat_box"] = {
    ["widget"] = {
        ["slotpos"] = {},
        ["slotbg"] = { },
        ["animbank"] = "ui_bundle_2x2",
        ["animbuild"] = "gentleness_cat_box_ui",
        ["pos"] = Vector3(200, 0, 0),
        ["side_align_tip"] = 120,
    },
    ["type"] = "cooker",
    ["itemtestfn"] = function(container, item, slot)
        return item and item:HasTag("gentleness_box")
    end
}
for a = 1, 4 do
    for b = 1, 4 do
        table["insert"](params["gentleness_cat_box"]["widget"]["slotpos"], Vector3(-165 + a * 72, 153 - b * 72, 0))
        table["insert"](params["gentleness_cat_box"]["widget"]["slotbg"],
                { ["image"] = "gentleness_slot_cat_a.tex", ["atlas"] = "images/gentleness_image/gentleness_slot_cat_a.xml" })
    end
end
params["gentleness_cat_box_skin_black"] = {
    ["widget"] = {
        ["slotpos"] = {},
        ["slotbg"] = { },
        ["animbank"] = "ui_bundle_2x2",
        ["animbuild"] = "gentleness_cat_box_ui_skin_a",
        ["pos"] = Vector3(200, 0, 0),
        ["side_align_tip"] = 120,
    },
    ["type"] = "cooker",
    ["itemtestfn"] = function(container, item, slot)
        return item and item:HasTag("gentleness_box")
    end
}
for a = 1, 4 do
    for b = 1, 4 do
        table["insert"](params["gentleness_cat_box_skin_black"]["widget"]["slotpos"], Vector3(-165 + a * 72, 153 - b * 72, 0))
        table["insert"](params["gentleness_cat_box_skin_black"]["widget"]["slotbg"],
                { ["image"] = "gentleness_slot_cat_b.tex", ["atlas"] = "images/gentleness_image/gentleness_slot_cat_b.xml" })
    end
end
params["gentleness_cat_box_skin_white"] = {
    ["widget"] = {
        ["slotpos"] = {},
        ["slotbg"] = { },
        ["animbank"] = "ui_bundle_2x2",
        ["animbuild"] = "gentleness_cat_box_ui_skin_b",
        ["pos"] = Vector3(200, 0, 0),
        ["side_align_tip"] = 120,
    },
    ["type"] = "cooker",
    ["itemtestfn"] = function(container, item, slot)
        return item and item:HasTag("gentleness_box")
    end
}
for a = 1, 4 do
    for b = 1, 4 do
        table["insert"](params["gentleness_cat_box_skin_white"]["widget"]["slotpos"], Vector3(-165 + a * 72, 153 - b * 72, 0))
        table["insert"](params["gentleness_cat_box_skin_white"]["widget"]["slotbg"],
                { ["image"] = "gentleness_slot_cat_c.tex", ["atlas"] = "images/gentleness_image/gentleness_slot_cat_c.xml" })
    end
end
params["gentleness_fan"] = {
    ["widget"] = {
        ["slotpos"] = {
            Vector3(0, 0, 0),
        },
        ["slotbg"] = {
            { ["image"] = "gentleness_slot_green.tex", ["atlas"] = "images/gentleness_image/gentleness_slot_green.xml" },
        },
        ["animbank"] = "ui_bundle_2x2",
        ["animbuild"] = "gentleness_title_staff_ui",
        ["pos"] = Vector3(0, 64, 0),
        ["side_align_tip"] = 120,
    },
    ["type"] = "hand_inv",
    ["excludefromcrafting"] = true,
    ["itemtestfn"] = function(container, item, slot)
        return item and item["prefab"] ~= "gentleness_fan" or false
    end
}

------------------------------------------2025-------------------------------------
params["gentleness_food_tray"] = {
    ["widget"] = {
        ["slotpos"] = {},
        --["slotbg"] = {
        --    { ["image"] = "gentleness_slot_green.tex", ["atlas"] = "images/gentleness_image/gentleness_slot_green.xml" },
        --},
        ["animbank"] = "ui_chest_3x3",
        ["animbuild"] = "ui_chest_3x3",
        ["pos"] = Vector3(0, 200, 0),
        ["side_align_tip"] = 160,
    },
    --["acceptsstacks"] = false,
    ["itemtestfn"] = function(container, item, slot)
        --return not container["inst"]:HasTag("burnt") and not container:Has(item["prefab"], 1) and (item:HasTag("preparedfood") or item:HasTag("gentleness_food"))
        return item and item:HasTag("preparedfood") or item:HasTag("gentleness_food")
    end
}
for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(params["gentleness_food_tray"]["widget"]["slotpos"], Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
    end
end
local ui_2025 = {
    ["widget"] = {
        ["slotpos"] = {}, ["slotbg"] = {},
        ["animbank"] = "ui_chest_2x2",
        ["animbuild"] = "gentleness_fruit_basket_ui",
        ["pos"] = Vector3(0, 200, 0),
    },
    ["type"] = "chest",
}
for b = 1, 5 do
    for a = 1, 5 do
        table["insert"](ui_2025["widget"]["slotpos"], Vector3(-245 + a * 80, 245 - b * 80, 0))
        table["insert"](ui_2025["widget"]["slotbg"], { ["image"] = "gentleness_slot_chest.tex", ["atlas"] = "images/gentleness_image/gentleness_slot_chest.xml" })
    end
end

local cooking = require("cooking")
local cook_tags = cooking["ingredients"]
local function checkFoodType(food_id, food_type)
    if not HH_UTILS:IsHHType(cook_tags, "table") or not HH_UTILS:IsHHType(cook_tags[food_id], "table")
            or not HH_UTILS:IsHHType(cook_tags[food_id]["tags"], "table")
    then
        return false
    end
    return cook_tags[food_id]["tags"][food_type]
end
local function ends_with(str, ending)
    return ending == "" or str:sub(-#ending) == ending
end
local function startsWith(str, word)
    return string["match"](str, "^" .. word) ~= nil
end
params["gentleness_fruit_basket"] = replaceUiAnim(ui_2025, "gentleness_fruit_basket_ui",
        function(container, item, slot)
            return item and checkFoodType(item["prefab"], "fruit")
        end)
params["gentleness_gril"] = replaceUiAnim(ui_2025, "gentleness_gril_ui",
        function(container, item, slot)
            if not item then
                return false
            end
            local prefab_id = item["prefab"]
            if ends_with(prefab_id, "_cooked") or startsWith(prefab_id, "cooked") then
                return true
            end
            return item and (checkFoodType(item["prefab"], "fruit")
                    or checkFoodType(item["prefab"], "meat")
                    or checkFoodType(item["prefab"], "veggie")
            )
        end)
local flower_basket_list = {
    ["gentleness_jasmine_flower"] = true,
    ["petals_evil"] = true,
    ["petals"] = true,
    ["petals_rose"] = true,
    ["petals_lily"] = true,
    ["petals_orchid"] = true,
}
params["gentleness_flower_basket"] = replaceUiAnim(ui_2025, "gentleness_flower_basket_ui",
        function(container, item, slot)
            return item and flower_basket_list[item["prefab"]]
        end)
--新春欢灯
params["gentleness_lantern_post"] = {
    ["widget"] = {
        ["slotpos"] = {
            Vector3(-2, 18, 0),
        },
        ["animbank"] = "ui_chest_1x1",
        ["animbuild"] = "ui_chest_1x1",
        ["pos"] = Vector3(0, 160, 0),
        ["side_align_tip"] = 100,
    },
    ["acceptsstacks"] = false,
    ["type"] = "chest",
    ["itemtestfn"] = function(container, item, slot)
        return (item:HasTag("lightbattery") or item:HasTag("spore") or item:HasTag("lightcontainer")) and not container.inst:HasTag("burnt")
    end
}
---------------------------------------------------------
for k, v in pairs(params) do
    containers["MAXITEMSLOTS"] = math["max"](containers["MAXITEMSLOTS"], v["widget"]["slotpos"] ~= nil and #v["widget"]["slotpos"] or 0)
end
local containers_widgetsetup = containers["widgetsetup"]
containers["widgetsetup"] = function(container, prefab, data)
    local t = data or params[prefab or container["inst"]["prefab"]]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container["widget"]["slotpos"] ~= nil and #container["widget"]["slotpos"] or 0)
    else
        return containers_widgetsetup(container, prefab, data)
    end
end

AddClassPostConstruct("widgets/gogglesover", function(self)
    if self["owner"] and self["owner"]["prefab"] == "gentleness" then
        self["ToggleGoggles"] = function(_self, ...)
        end
        self:Hide()
    end
end)

AddClassPostConstruct("widgets/sandover", function(self)
    if self["owner"] and self["owner"]["prefab"] == "gentleness" then
        local oldOnUpdate = self["OnUpdate"]
        self["OnUpdate"] = function(self, dt, ...)
            if oldOnUpdate then
                oldOnUpdate(self, dt, ...)
            end
            if self["Hide"] then
                self:Hide()
            end
            if self["dust"] and self["dust"]["Hide"] then
                self["dust"]:Hide()
            end
        end
    end
end)

AddClassPostConstruct("widgets/moonstormover", function(self)
    if self["owner"] and self["owner"]["prefab"] == "gentleness" then
        local oldOnUpdate = self["OnUpdate"]
        self["OnUpdate"] = function(self, dt, ...)
            if oldOnUpdate then
                oldOnUpdate(self, dt, ...)
            end
            if self["Hide"] then
                self:Hide()
            end
            if self["dust"] and self["dust"]["Hide"] then
                self["dust"]:Hide()
            end
        end
    end
end)
if TUNING["FUNCTIONAL_MEDAL_IS_OPEN"] then

    AddClassPostConstruct("widgets/medal_spacetimestormover", function(self)
        if self["owner"] and self["owner"]["prefab"] == "gentleness" then
            local oldOnUpdate = self["OnUpdate"]
            self["OnUpdate"] = function(self, dt, ...)
                if oldOnUpdate then
                    oldOnUpdate(self, dt, ...)
                end
                if self["Hide"] then
                    self:Hide()
                end
                if self["dust"] and self["dust"]["Hide"] then
                    self["dust"]:Hide()
                end
            end
        end
    end)

end

AddComponentPostInit("playervision", function(self)
    local oldForceGoggleVision = self["ForceGoggleVision"]
    self["ForceGoggleVision"] = function(self, value, ...)
        local hh_player = self["inst"]
        if hh_player and hh_player["prefab"] == "gentleness"
                and hh_player:HasTag("g_immune_sandstorm") then
            value = true
        end
        oldForceGoggleVision(self, value, ...)
    end

end)

local G_SHOP = require("widgets/gentleness_shop")
AddClassPostConstruct("widgets/controls", function(self, owner)
    if self["owner"] and self["owner"]["prefab"] == "gentleness" then
        self["inst"]:ListenForEvent("g_open_shop_ui", function(inst, data)
            HH_UTILS:HHKillChild(self, "g_hh_shop_ui")
            self["g_hh_shop_ui"] = self:AddChild(G_SHOP(self["owner"]))
        end, self["owner"])
        self["inst"]:ListenForEvent("g_close_shop_ui", function(inst, data)
            HH_UTILS:HHKillChild(self, "g_hh_shop_ui")
        end, self["owner"])
    end
end)
