----
---文件处理时间:2024-07-01 23:48:41
---
local HH_UTILS = require("utils/gentleness_utils")

CHARACTER_INGREDIENT["MY_HH_MAGIC"] = "gentleness_magic"

if _G["IsCharacterIngredient"] then
    local oldIsCharacterIngredient = _G["IsCharacterIngredient"]
    _G["IsCharacterIngredient"] = function(ingredienttype)
        local result = oldIsCharacterIngredient(ingredienttype)
        if ingredienttype == CHARACTER_INGREDIENT["MY_HH_MAGIC"] then
            return true
        end
        return result
    end
end

AddClassPostConstruct("components/builder_replica", function(self, owner)
    local oldHasCharacterIngredient = self["HasCharacterIngredient"]
    self["HasCharacterIngredient"] = function(self, ingredient, ...)
        local old_result, amount = oldHasCharacterIngredient(self, ingredient, ...)
        if type(ingredient) == "table" and ingredient["type"] == CHARACTER_INGREDIENT["MY_HH_MAGIC"] then
            if not self["inst"] or not (self["inst"]["prefab"] == "gentleness") then
                return false, 0
            end
            local recipe_num = ingredient["amount"] or 9999
            local client_magic = HH_UTILS:GetClientMagic(self["inst"])
            return client_magic and client_magic >= recipe_num, client_magic
        end
        return old_result, amount
    end
end)
AddComponentPostInit("builder", function(self)
    local oldHasCharacterIngredient = self["HasCharacterIngredient"]
    self["HasCharacterIngredient"] = function(self, ingredient, ...)
        local old_result, amount = oldHasCharacterIngredient(self, ingredient, ...)
        if type(ingredient) == "table" and ingredient["type"] == CHARACTER_INGREDIENT["MY_HH_MAGIC"] then
            if not self["inst"] or not (self["inst"]["prefab"] == "gentleness")
                    or not HH_UTILS:HasComponents(self["inst"], "gentleness_magic")
            then
                return false, 0
            end
            local recipe_num = ingredient["amount"] or 9999
            local server_magic = self["inst"]["components"]["gentleness_magic"]:GetCurrentMagic()
            return server_magic and server_magic >= recipe_num, server_magic
        end
        return old_result, amount
    end

    local oldRemoveIngredients = self["RemoveIngredients"]
    self["RemoveIngredients"] = function(self, ingredients, recname, ...)
        if self["freebuildmode"] then
            return
        end
        local recipe = AllRecipes[recname]
        if recipe then
            for k, v in pairs(recipe["character_ingredients"]) do
                if v["type"] == CHARACTER_INGREDIENT["MY_HH_MAGIC"]
                        and HH_UTILS:HasComponents(self["inst"], "gentleness_magic")
                then
                    self["inst"]["components"]["gentleness_magic"]:DoDelta(-(v["amount"] or 10))
                end
            end
        end
        return oldRemoveIngredients(self, ingredients, recname, ...)
    end
end)

local tree_list = {
    { ["id"] = "gentleness_01", ["name"] = "装备", ["image"] = "gentleness_science_1.tex", },
    { ["id"] = "gentleness_02", ["name"] = "魔法", ["image"] = "gentleness_science_2.tex", },
    { ["id"] = "gentleness_03", ["name"] = "建筑", ["image"] = "gentleness_science_3.tex", },
}
for i, v in ipairs(tree_list) do
    local tree_id = v["id"]
    local tree_name = v["name"] or "xxx"
    local tree_image = v["image"] or "gentleness_science_1.tex"
    STRINGS["UI"]["CRAFTING_FILTERS"][string["upper"](tree_id)] = tree_name
    AddRecipeFilter({ ["name"] = tree_id, ["atlas"] = "images/gentleness_image/gentleness_items.xml", ["image"] = tree_image })
end

local magic_list = {
    ["gentleness_plant"] = 30,
    ["gentleness_fertilizer"] = 60,
    ["gentleness_rain"] = 50,
    ["gentleness_bird"] = 20,
    ["gentleness_sleep"] = 30,
    ["gentleness_moon"] = 100,
    ["gentleness_fish"] = 30,
    ["gentleness_lighting"] = 30,
}
for i, v in pairs(magic_list) do
    AddRecipe2(i,
            {
                Ingredient(CHARACTER_INGREDIENT["MY_HH_MAGIC"], v, "images/gentleness_image/gentleness_magic.xml", nil, "gentleness_magic.tex"),

            },
            TECH["LOST"],
            {
                ["builder_tag"] = "gentleness",
                ["description"] = i,


                ["atlas"] = "images/gentleness_image/gentleness_magic.xml",
                ["image"] = i .. ".tex",
            },

            { string["upper"]("gentleness_02"), }
    )

    AddRecipeToFilter(i, string["upper"]("gentleness_02"))
end
local tech_01 = string["upper"]("gentleness_01")
local tech_03 = string["upper"]("gentleness_03")
local tech_00 = "CHARACTER"
local com_xml = "images/gentleness_image/gentleness_items.xml"
local extra_xml = "images/gentleness_image/gentleness_items_extra.xml"
local box_r = { Ingredient("boards", 5), Ingredient("cutstone", 5), Ingredient("fireflies", 1), }
local mxj_recipes = {

    ["gentleness_xb"] = {
        ["ingredient"] = { Ingredient("gentleness_jasmine_flower", 2), Ingredient("petals", 2), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = { ["atlas"] = extra_xml, ["image"] = "gentleness_xb.tex", }, ["tech_tab"] = tech_00,
    },
    ["gentleness_jasmine_seed"] = {
        ["ingredient"] = { Ingredient("seeds", 10), Ingredient("gentleness_coin", 1), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = { ["atlas"] = "images/gentleness_image/gentleness_items_extra.xml", ["image"] = "gentleness_jasmine_seed.tex", }, ["tech_tab"] = tech_00,
    },

    ["gentleness_cook_pot_item"] = {
        ["ingredient"] = { Ingredient("goldnugget", 2), Ingredient("charcoal", 6), Ingredient("twigs", 6), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = { ["atlas"] = com_xml, ["image"] = "gentleness_cook_pot_item.tex", },
        ["tech_tab"] = tech_00,
    },
    ["gentleness_weapon_flower_a"] = {
        ["ingredient"] = { Ingredient("twigs", 4), Ingredient("petals", 12), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = { ["atlas"] = com_xml, ["image"] = "gentleness_weapon_flower_a.tex", },
        ["tech_tab"] = tech_00,
    },
    ["gentleness_potion_mca"] = {
        ["ingredient"] = { Ingredient("gentleness_jasmine_flower", 2), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["atlas"] = extra_xml, ["image"] = "gentleness_potion_mca.tex",
        },
        ["tech_tab"] = tech_00,
    },
    ["gentleness_potion_msn"] = {
        ["ingredient"] = { Ingredient("garlic", 2), Ingredient("gentleness_jasmine_flower", 2), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["atlas"] = extra_xml, ["image"] = "gentleness_potion_msn.tex",
        },
        ["tech_tab"] = tech_00,
    },
    ["gentleness_potion_mgz"] = {
        ["ingredient"] = { Ingredient("gentleness_jasmine_seed", 4), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["atlas"] = extra_xml, ["image"] = "gentleness_potion_mgz.tex",
        },
        ["tech_tab"] = tech_00,
    },
    ["gentleness_potion_mxc"] = {
        ["ingredient"] = { Ingredient("petals", 4), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["atlas"] = extra_xml, ["image"] = "gentleness_potion_mxc.tex",
        },
        ["tech_tab"] = tech_00,
    },
    ["gentleness_potion_msh"] = {
        ["ingredient"] = { Ingredient("goldnugget", 300), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["atlas"] = extra_xml, ["image"] = "gentleness_potion_msh.tex",
        },
        ["tech_tab"] = tech_00,
    },

    ["gentleness_hat"] = {
        ["ingredient"] = { Ingredient("footballhat", 2), Ingredient("ruinshat", 1), Ingredient("deserthat", 1), Ingredient("eyebrellahat", 1), }, ["tech"] = TECH["LOST"],
        ["extra_data"] = {
            ["builder_tag"] = "gentleness",
            ["atlas"] = extra_xml, ["image"] = "gentleness_hat.tex",
        },
        ["tech_tab"] = tech_01,
    },
    ["gentleness_amulet"] = {
        ["ingredient"] = { Ingredient("opalpreciousgem", 1), Ingredient("tallbirdegg", 10), Ingredient("fireflies", 50), Ingredient("dreadstone", 10), }, ["tech"] = TECH["LOST"],
        ["extra_data"] = {
            ["builder_tag"] = "gentleness",
            ["atlas"] = extra_xml, ["image"] = "gentleness_amulet.tex",
        },
        ["tech_tab"] = tech_01,
    },
    ["gentleness_armor"] = {
        ["ingredient"] = { Ingredient("armorwood", 10), Ingredient("armormarble", 5), }, ["tech"] = TECH["LOST"],
        ["extra_data"] = {
            ["builder_tag"] = "gentleness",
            ["atlas"] = extra_xml, ["image"] = "gentleness_armor.tex",
        },
        ["tech_tab"] = tech_01,
    },
    ["gentleness_staff_cat"] = {
        ["ingredient"] = { Ingredient("gentleness_mlkx", 1), Ingredient("deerclops_eyeball", 1), }, ["tech"] = TECH["LOST"],
        ["extra_data"] = {
            ["builder_tag"] = "gentleness",
            ["atlas"] = extra_xml, ["image"] = "gentleness_staff_cat.tex",
        },
        ["tech_tab"] = tech_01,
    },
    ["gentleness_fan"] = {
        ["ingredient"] = { Ingredient("gentleness_jasmine_flower", 200), Ingredient("cane", 1), Ingredient("fireflies", 10), }, ["tech"] = TECH["LOST"],
        ["extra_data"] = {
            ["builder_tag"] = "gentleness",
            ["atlas"] = "images/gentleness_image/gentleness_fan.xml", ["image"] = "gentleness_fan.tex",
        },
        ["tech_tab"] = tech_01,
    },


    ["gentleness_flower"] = {
        ["ingredient"] = { Ingredient("butterfly", 1), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["placer"] = "gentleness_flower_placer", ["min_spacing"] = 1,
            ["atlas"] = extra_xml, ["image"] = "gentleness_flower.tex",
        },
        ["tech_tab"] = tech_03,
    },

    ["gentleness_box_build_a"] = {
        ["ingredient"] = box_r, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["placer"] = "gentleness_box_build_a_placer", ["min_spacing"] = 3.5,
            ["atlas"] = com_xml, ["image"] = "gentleness_box_build_a.tex",
        },
        ["tech_tab"] = tech_03,
    },
    ["gentleness_box_build_b"] = {
        ["ingredient"] = box_r, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["placer"] = "gentleness_box_build_b_placer", ["min_spacing"] = 3.5,
            ["atlas"] = com_xml, ["image"] = "gentleness_box_build_b.tex",
        },
        ["tech_tab"] = tech_03,
    },
    ["gentleness_box_build_c"] = {
        ["ingredient"] = box_r, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["placer"] = "gentleness_box_build_c_placer", ["min_spacing"] = 3.5,
            ["atlas"] = com_xml, ["image"] = "gentleness_box_build_c.tex",
        },
        ["tech_tab"] = tech_03,
    },
    ["gentleness_box_build_d"] = {
        ["ingredient"] = box_r, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["placer"] = "gentleness_box_build_d_placer", ["min_spacing"] = 3.5,
            ["atlas"] = com_xml, ["image"] = "gentleness_box_build_d.tex",
        },
        ["tech_tab"] = tech_03,
    },
    ["gentleness_box_build_e"] = {
        ["ingredient"] = box_r, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["placer"] = "gentleness_box_build_e_placer", ["min_spacing"] = 3.5,
            ["atlas"] = com_xml, ["image"] = "gentleness_box_build_e.tex",
        },
        ["tech_tab"] = tech_03,
    },
    ["gentleness_chest_cw"] = {
        ["ingredient"] = { Ingredient("boards", 5), Ingredient("cutstone", 5), Ingredient("livinglog", 1), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["placer"] = "gentleness_chest_cw_placer", ["min_spacing"] = 2,
            ["atlas"] = extra_xml, ["image"] = "gentleness_chest_cw.tex",
        },
        ["tech_tab"] = tech_03,
    },
    ["gentleness_chest_ice"] = {
        ["ingredient"] = { Ingredient("goldnugget", 20), Ingredient("livinglog", 2), Ingredient("gears", 2), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["placer"] = "gentleness_chest_ice_placer", ["min_spacing"] = 1.5,
            ["atlas"] = extra_xml, ["image"] = "gentleness_chest_ice.tex",
        },
        ["tech_tab"] = tech_03,
    },
    ["gentleness_chest_fire"] = {
        ["ingredient"] = { Ingredient("boards", 5), Ingredient("cutstone", 5), Ingredient("redgem", 1), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["placer"] = "gentleness_chest_fire_placer", ["min_spacing"] = 2,
            ["atlas"] = extra_xml, ["image"] = "gentleness_chest_fire.tex",
        },
        ["tech_tab"] = tech_03,
    },
    ["gentleness_chest_money"] = {
        ["ingredient"] = { Ingredient("boards", 5), Ingredient("cutstone", 5), Ingredient("opalpreciousgem", 1), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["placer"] = "gentleness_chest_money_placer", ["min_spacing"] = 2,
            ["atlas"] = extra_xml, ["image"] = "gentleness_chest_money.tex",
        },
        ["tech_tab"] = tech_03,
    },

    ["gentleness_mmg"] = {
        ["ingredient"] = { Ingredient("fireflies", 2), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["placer"] = "gentleness_mmg_placer", ["min_spacing"] = 2,
            ["atlas"] = "images/gentleness_image/gentleness_mmg.xml", ["image"] = "gentleness_mmg.tex",
        },
        ["tech_tab"] = tech_03,
    },
    ["gentleness_lamp_base"] = {
        ["ingredient"] = { Ingredient("lightbulb", 10), }, ["tech"] = TECH["NONE"], ["tech_tab"] = tech_03,
        ["extra_data"] = {
            ["placer"] = "gentleness_lamp_base_placer", ["min_spacing"] = 1,
            ["atlas"] = extra_xml, ["image"] = "gentleness_lamp_base.tex",
        },
    },

    --["gentleness_ferris_wheel"] = {
    --    ["ingredient"] = { Ingredient("yellowmooneye", 2), Ingredient("bluemooneye", 2), Ingredient("goldnugget", 100), Ingredient("boards", 50), Ingredient("cutstone", 50), },
    --    ["tech"] = TECH["NONE"], ["tech_tab"] = tech_03,
    --    ["extra_data"] = { ["placer"] = "gentleness_ferris_wheel_placer", ["min_spacing"] = 8, ["atlas"] = extra_xml, ["image"] = "gentleness_ferris_wheel.tex", },
    --},

    ["gentleness_machine"] = {
        ["ingredient"] = {
            Ingredient("boards", 5), Ingredient("cutstone", 5), Ingredient("livinglog", 1), },
        ["tech"] = TECH["NONE"], ["tech_tab"] = tech_03,
        ["extra_data"] = { ["placer"] = "gentleness_machine_placer", ["min_spacing"] = 3,
                           ["atlas"] = extra_xml, ["image"] = "gentleness_machine.tex", },
    },

    ["gentleness_tool_a"] = {
        ["ingredient"] = { Ingredient("gentleness_coin", 1), Ingredient("bluegem", 1), }, ["tech"] = TECH["LOST"],
        ["extra_data"] = {
            ["builder_tag"] = "gentleness",
            ["atlas"] = extra_xml, ["image"] = "gentleness_tool_a.tex",
        },
        ["tech_tab"] = tech_01,
    },


    ["gentleness_mushroom_red"] = {
        ["ingredient"] = { Ingredient("red_cap", 10), Ingredient("livinglog", 10), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["placer"] = "gentleness_mushroom_red_placer", ["min_spacing"] = 2,
            ["atlas"] = extra_xml, ["image"] = "gentleness_mushroom_red.tex",
        },
        ["tech_tab"] = tech_03,
    },
    ["gentleness_mushroom_blue"] = {
        ["ingredient"] = { Ingredient("blue_cap", 10), Ingredient("livinglog", 10), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["placer"] = "gentleness_mushroom_blue_placer", ["min_spacing"] = 2,
            ["atlas"] = extra_xml, ["image"] = "gentleness_mushroom_blue.tex",
        },
        ["tech_tab"] = tech_03,
    },
    ["gentleness_mushroom_green"] = {
        ["ingredient"] = { Ingredient("green_cap", 10), Ingredient("livinglog", 10), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["placer"] = "gentleness_mushroom_green_placer", ["min_spacing"] = 2,
            ["atlas"] = extra_xml, ["image"] = "gentleness_mushroom_green.tex",
        },
        ["tech_tab"] = tech_03,
    },
    ["gentleness_mushroom_moon"] = {
        ["ingredient"] = { Ingredient("moon_cap", 10), Ingredient("livinglog", 10), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["placer"] = "gentleness_mushroom_moon_placer", ["min_spacing"] = 2,
            ["atlas"] = extra_xml, ["image"] = "gentleness_mushroom_moon.tex",
        },
        ["tech_tab"] = tech_03,
    },
    ["gentleness_cat_box"] = {
        ["ingredient"] = { Ingredient("twigs", 4), }, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["builder_tag"] = "gentleness",
            ["atlas"] = "images/gentleness_image/gentleness_cat_box.xml", ["image"] = "gentleness_cat_box.tex",
        },
        ["tech_tab"] = tech_00,
    },
    ["gentleness_statue_platform"] = {
        ["ingredient"] = {
            Ingredient("fireflies", 1),
            Ingredient("marble", 10),
            Ingredient("petals", 10),
        }, ["tech"] = TECH["NONE"],
        ["extra_data"] = {
            ["placer"] = "gentleness_statue_platform_placer", ["min_spacing"] = 2,
            ["atlas"] = "images/gentleness_image/gentleness_statue_platform.xml", ["image"] = "gentleness_statue_platform.tex",
        },
        ["tech_tab"] = tech_03,
    },

    ["gentleness_moonbase"] = {
        ["ingredient"] = {
            Ingredient("bluemooneye", 1), Ingredient("moonrocknugget", 2), Ingredient("ice", 2), },
        ["tech"] = TECH["NONE"], ["tech_tab"] = tech_03,
        ["extra_data"] = {
            ["product"] = "moonbase",
            ["builder_tag"] = "gentleness",
            ["placer"] = "gentleness_moonbase_placer",
            ["min_spacing"] = 3,
            ["atlas"] = "images/gentleness_image/gentleness_moonbase.xml",
            ["image"] = "gentleness_moonbase.tex", },
    },
    ["turf_gentleness_green"] = {
        ["ingredient"] = {
            Ingredient("petals", 6), Ingredient("cutgrass", 6), },
        ["tech"] = TECH["LOST"], ["tech_tab"] = tech_03,
        ["extra_data"] = {
            ["numtogive"] = 4,
            ["product"] = "turf_gentleness_green",
            --["builder_tag"] = "gentleness",
            ["atlas"] = "images/gentleness_image/turf_gentleness_green.xml",
            ["image"] = "turf_gentleness_green.tex", },
    },
    ["gentleness_tent"] = {
        ["ingredient"] = {
            Ingredient("silk", 6), Ingredient("rope", 3), Ingredient("gentleness_coin", 3), },
        ["tech"] = TECH["NONE"], ["tech_tab"] = tech_03,
        ["extra_data"] = {
            ["builder_tag"] = "gentleness",
            ["placer"] = "gentleness_tent_placer",
            ["atlas"] = "images/gentleness_image/gentleness_tent.xml",
            ["image"] = "gentleness_tent.tex", },
    },

    ["gentleness_fence_item"] = {
        ["ingredient"] = {
            Ingredient("petals", 6), Ingredient("cutgrass", 6), },
        ["tech"] = TECH["NONE"], ["tech_tab"] = tech_03,
        ["extra_data"] = {
            ["numtogive"] = 4,
            ["atlas"] = "images/gentleness_image/gentleness_fence_item.xml",
            ["image"] = "gentleness_fence_item.tex", },
    },
    ["gentleness_color_land_item"] = {
        ["ingredient"] = {
            Ingredient("cutstone", 2), Ingredient("boards", 2), Ingredient("marble", 2), },
        ["tech"] = TECH["LOST"], ["tech_tab"] = tech_03,
        ["extra_data"] = {
            ["numtogive"] = 4,
            ["atlas"] = "images/gentleness_image/gentleness_color_land_item.xml",
            ["image"] = "gentleness_color_land_item.tex", },
    },
    ["gentleness_streetlight"] = {
        ["ingredient"] = {
            Ingredient("transistor", 4), Ingredient("coontail", 1), },
        ["tech"] = TECH["NONE"], ["tech_tab"] = tech_03,
        ["extra_data"] = {
            ["placer"] = "gentleness_streetlight_placer",
            ["min_spacing"] = 1,
            ["atlas"] = "images/gentleness_image/gentleness_streetlight.xml",
            ["image"] = "gentleness_streetlight.tex", },
    },
    ["gentleness_fence_gate_item"] = {
        ["ingredient"] = {
            Ingredient("boards", 2), Ingredient("rope", 1), },
        ["tech"] = TECH["NONE"], ["tech_tab"] = tech_03,
        ["extra_data"] = {
            ["numtogive"] = 1,
            ["atlas"] = "images/gentleness_image/gentleness_fence_gate_item.xml",
            ["image"] = "gentleness_fence_gate_item.tex", },
    },

    ------------------------------------------2025-------------------------------------
    ["turf_gentleness_strawberry"] = {
        ["ingredient"] = {
            Ingredient("berries", 6), Ingredient("cutgrass", 6), },
        ["tech"] = TECH["LOST"], ["tech_tab"] = tech_03,
        ["extra_data"] = {
            ["numtogive"] = 4,
            ["product"] = "turf_gentleness_strawberry",
            --["builder_tag"] = "gentleness",
            ["atlas"] = "images/gentleness_image/turf_gentleness_strawberry.xml",
            ["image"] = "turf_gentleness_strawberry.tex", },
    },
    ["turf_gentleness_star"] = {
        ["ingredient"] = {
            Ingredient("butterflywings", 6), Ingredient("cutgrass", 6), },
        ["tech"] = TECH["LOST"], ["tech_tab"] = tech_03,
        ["extra_data"] = {
            ["numtogive"] = 4,
            ["product"] = "turf_gentleness_star",
            --["builder_tag"] = "gentleness",
            ["atlas"] = "images/gentleness_image/turf_gentleness_star.xml",
            ["image"] = "turf_gentleness_star.tex", },
    },
    ["gentleness_food_tray"] = {
        ["ingredient"] = {
            Ingredient("cutstone", 10), Ingredient("marble", 10), },
        ["tech"] = TECH["NONE"], ["tech_tab"] = tech_03,
        ["extra_data"] = {
            ["placer"] = "gentleness_food_tray_placer",
            ["min_spacing"] = 3,
            ["atlas"] = "images/gentleness_image/gentleness_food_tray.xml",
            ["image"] = "gentleness_food_tray.tex", },
    },
    ["gentleness_wooden_board"] = {
        ["ingredient"] = {
            Ingredient("boards", 1), },
        ["tech"] = TECH["NONE"], ["tech_tab"] = tech_03,
        ["extra_data"] = {
            ["placer"] = "gentleness_wooden_board_placer",
            ["min_spacing"] = 1,
            ["atlas"] = "images/gentleness_image/gentleness_wooden_board.xml",
            ["image"] = "gentleness_wooden_board.tex", },
    },
    ["gentleness_fruit_basket"] = {
        ["ingredient"] = {
            Ingredient("boards", 10), Ingredient("twigs", 20),
        },
        ["tech"] = TECH["NONE"], ["tech_tab"] = tech_03,
        ["extra_data"] = {
            ["placer"] = "gentleness_fruit_basket_placer",
            ["min_spacing"] = 2,
            ["atlas"] = "images/gentleness_image/gentleness_fruit_basket.xml",
            ["image"] = "gentleness_fruit_basket.tex", },
    },
    ["gentleness_gril"] = {
        ["ingredient"] = {
            Ingredient("cutstone", 10), Ingredient("charcoal", 10),
        },
        ["tech"] = TECH["NONE"], ["tech_tab"] = tech_03,
        ["extra_data"] = {
            ["placer"] = "gentleness_gril_placer",
            ["min_spacing"] = 2,
            ["atlas"] = "images/gentleness_image/gentleness_gril.xml",
            ["image"] = "gentleness_gril.tex", },
    },

    ["gentleness_flower_basket"] = {
        ["ingredient"] = {
            Ingredient("boards", 10), Ingredient("twigs", 20),
        },
        ["tech"] = TECH["NONE"], ["tech_tab"] = tech_03,
        ["extra_data"] = {
            ["placer"] = "gentleness_flower_basket_placer",
            ["min_spacing"] = 2,
            ["atlas"] = "images/gentleness_image/gentleness_flower_basket.xml",
            ["image"] = "gentleness_flower_basket.tex", },
    },
    ["gentleness_carpet"] = {
        ["ingredient"] = {
            Ingredient("gentleness_jasmine_flower", 6), Ingredient("goldnugget", 6),
        },
        ["tech"] = TECH["NONE"], ["tech_tab"] = tech_03,
        ["extra_data"] = {
            ["placer"] = "gentleness_carpet_placer",
            ["min_spacing"] = 0,
            ["atlas"] = "images/gentleness_image/gentleness_carpet.xml",
            ["image"] = "gentleness_carpet.tex", },
    },
    ["gentleness_lantern_post_item"] = {
        ["ingredient"] = {
            Ingredient("transistor", 5),
            Ingredient("red_cap", 1),
            Ingredient("blue_cap", 1),
            Ingredient("green_cap", 1),
            Ingredient("moon_cap", 1),
        },
        ["tech"] = TECH["NONE"], ["tech_tab"] = tech_03,
        ["extra_data"] = {
            --["placer"] = "gentleness_lantern_post_item_placer",
            --["min_spacing"] = 0,
            ["atlas"] = "images/gentleness_image/gentleness_lantern_post_item.xml",
            ["image"] = "gentleness_lantern_post_item.tex",
            --["nounlock"] = true,
            --["actionstr"] = "PERDOFFERING"
        },
    },

}
local sort_table = HH_UTILS:TableSortKeys(mxj_recipes)
for i, v in ipairs(sort_table) do
    local recipe_config = mxj_recipes[v]
    local recipe_name = v
    if recipe_config and recipe_config["ingredient"] and recipe_config["tech_tab"] then
        AddRecipe2(recipe_name, recipe_config["ingredient"], recipe_config["tech"], recipe_config["extra_data"] or {}, { recipe_config["tech_tab"] })
        AddRecipeToFilter(recipe_name, recipe_config["tech_tab"])
    end
end
