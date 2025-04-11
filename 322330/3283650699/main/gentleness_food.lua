----
---文件处理时间:2024-07-01 23:48:41
---
local cooking = require("cooking")
local base_time = 480 * 3
local food_list = {
    ["gentleness_food_yan"] = {
        ["name"] = "gentleness_food_yan",
        ["test"] = function(cooker, names, tags)
            return names["gentleness_jasmine_flower"] == 2 and names["petals"] == 2
        end,
        ["priority"] = 100,
        ["weight"] = 1,
        ["foodtype"] = "VEGGIE",
        ["health"] = 30,
        ["hunger"] = 30,
        ["sanity"] = 30,
        ["perishtime"] = base_time * 4,
        ["cooktime"] = 0.3,

        ["cookbook_atlas"] = "images/gentleness_image/gentleness_cook_image.xml",
        ["cookbook_tex"] = "gentleness_food_yan.tex",
        ["overridebuild"] = "gentleness_items",
        ["overridesymbolname"] = "gentleness_food_yan"
    },
    ["gentleness_food_tian"] = {
        ["name"] = "gentleness_food_tian",
        ["test"] = function(cooker, names, tags)
            return names["pomegranate"] == 2 and names["gentleness_jasmine_flower"] == 2
        end,
        ["priority"] = 100,
        ["weight"] = 1,
        ["foodtype"] = "VEGGIE",
        ["health"] = 50,
        ["hunger"] = 50,
        ["sanity"] = 50,
        ["perishtime"] = base_time * 2,
        ["cooktime"] = 0.8,

        ["cookbook_atlas"] = "images/gentleness_image/gentleness_cook_image.xml",
        ["cookbook_tex"] = "gentleness_food_tian.tex",
        ["overridebuild"] = "gentleness_items",
        ["overridesymbolname"] = "gentleness_food_tian"
    },
    ["gentleness_food_you"] = {
        ["name"] = "gentleness_food_you",
        ["test"] = function(cooker, names, tags)
            return names["goatmilk"] == 1 and names["gentleness_jasmine_flower"] == 1
                    and names["durian"] == 1 and names["honey"] == 1
        end,
        ["priority"] = 100,
        ["weight"] = 1,
        ["foodtype"] = "VEGGIE",
        ["health"] = 150,
        ["hunger"] = 150,
        ["sanity"] = 150,
        ["perishtime"] = base_time * 8 / 3,
        ["cooktime"] = 2.5,

        ["cookbook_atlas"] = "images/gentleness_image/gentleness_cook_image.xml",
        ["cookbook_tex"] = "gentleness_food_you.tex",
        ["overridebuild"] = "gentleness_items",
        ["overridesymbolname"] = "gentleness_food_you"
    },
    ["gentleness_drink_yang"] = {
        ["name"] = "gentleness_drink_yang",
        ["test"] = function(cooker, names, tags)
            return names["gentleness_jasmine_flower"] == 2 and names["ice"] == 1
                    and names["royal_jelly"] == 1
        end,
        ["priority"] = 100,
        ["weight"] = 1,
        ["foodtype"] = "VEGGIE",
        ["health"] = 0,
        ["hunger"] = 0,
        ["sanity"] = 0,
        ["perishtime"] = TUNING["PERISH_SLOW"],
        ["cooktime"] = 0.25,

        ["cookbook_atlas"] = "images/gentleness_image/gentleness_cook_image.xml",
        ["cookbook_tex"] = "gentleness_drink_yang.tex",
        ["overridebuild"] = "gentleness_items",
        ["overridesymbolname"] = "gentleness_drink_yang"
    },
    ["gentleness_drink_duo"] = {
        ["name"] = "gentleness_drink_duo",
        ["test"] = function(cooker, names, tags)
            return names["gentleness_jasmine_flower"] == 2 and names["ice"] == 1
                    and names["cactus_flower"] == 1
        end,
        ["priority"] = 100,
        ["weight"] = 1,
        ["foodtype"] = "VEGGIE",
        ["health"] = 0,
        ["hunger"] = 0,
        ["sanity"] = 0,
        ["perishtime"] = TUNING["PERISH_SLOW"],
        ["cooktime"] = 0.25,

        ["cookbook_atlas"] = "images/gentleness_image/gentleness_cook_image.xml",
        ["cookbook_tex"] = "gentleness_drink_duo.tex",
        ["overridebuild"] = "gentleness_items",
        ["overridesymbolname"] = "gentleness_drink_duo"
    },
    ["gentleness_drink_yuan"] = {
        ["name"] = "gentleness_drink_yuan",
        ["test"] = function(cooker, names, tags)
            return names["gentleness_jasmine_flower"] == 2 and names["ice"] == 1
                    and names["watermelon"] == 1
        end,
        ["priority"] = 100,
        ["weight"] = 1,
        ["foodtype"] = "VEGGIE",
        ["health"] = 0,
        ["hunger"] = 0,
        ["sanity"] = 0,
        ["perishtime"] = TUNING["PERISH_SLOW"],
        ["cooktime"] = 0.25,

        ["cookbook_atlas"] = "images/gentleness_image/gentleness_cook_image.xml",
        ["cookbook_tex"] = "gentleness_drink_yuan.tex",
        ["overridebuild"] = "gentleness_items",
        ["overridesymbolname"] = "gentleness_drink_yuan"
    },
}
for i, v in pairs(food_list) do
    AddCookerRecipe("gentleness_cook_pot", v)

    RegisterInventoryItemAtlas("images/gentleness_image/gentleness_items.xml", i .. ".tex")
end
AddIngredientValues({ "gentleness_jasmine_flower" }, { ["veggie"] = 1 })

local food_tag_list = {
    "petals",
}
for _, v in ipairs(food_tag_list) do
    if cooking["ingredients"][v] ~= nil then
        if not cooking["ingredients"][v]["tags"] then
            cooking["ingredients"][v]["tags"] = {}
        end
        cooking["ingredients"][v]["tags"]["inedible"] = 1
    else
        AddIngredientValues({ v }, { ["inedible"] = 1 })
    end
end
local oldRegisterPrefabs = GLOBAL["ModManager"]["RegisterPrefabs"]
GLOBAL["ModManager"]["RegisterPrefabs"] = function(self, ...)

    for k, v in pairs(cooking["recipes"]) do
        if k and v and k ~= "portablespicer" then

            for a, b in pairs(v) do
                if not (b["spice"] or b["platetype"]) then

                    local newrecipe = shallowcopy(b)
                    newrecipe["no_cookbook"] = true
                    AddCookerRecipe("gentleness_cook_pot", newrecipe)
                end
            end
        end
    end
    if TUNING["FUNCTIONAL_MEDAL_IS_OPEN"] then
        AddRecipe2("gentleness_r_a",
                {
                    Ingredient("goldnugget", 300),
                },
                TECH["NONE"],
                {
                    ["product"] = "blank_certificate",
                    ["numtogive"] = 1,
                    ["atlas"] = "images/gentleness_image/gentleness_xz.xml", ["image"] = "gentleness_xz.tex",
                },
                { "CHARACTER", }
        )
    end
    if TUNING["mod_legion_enabled"] then
        AddRecipe2("gentleness_lj_zg",
                {
                    Ingredient("goldnugget", 300),
                },
                TECH["NONE"],
                {
                    ["product"] = "siving_derivant_item",
                    ["numtogive"] = 1,
                    ["atlas"] = "images/inventoryimages/siving_derivant_item.xml", ["image"] = "siving_derivant_item.tex",
                },
                { "CHARACTER", }
        )
        AddRecipe2("gentleness_lj_md",
                {
                    Ingredient("livinglog", 1),
                },
                TECH["NONE"],
                {
                    ["product"] = "shyerrylog",
                    ["numtogive"] = 1,
                    ["atlas"] = "images/inventoryimages/shyerrylog.xml", ["image"] = "shyerrylog.tex",
                },
                { "CHARACTER", }
        )
    end
    oldRegisterPrefabs(self, ...)
end
