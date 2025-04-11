----
---文件处理时间:2024-07-01 23:48:41
---
local HH_ALL_PREFABS = require("enums/gentleness_prefabs")

local function chest_green(inst)
    inst["AnimState"]:OverrideSymbol("chest_red", "gentleness_box_build", "chest_green")
end
local function chest_blue(inst)
    inst["AnimState"]:OverrideSymbol("chest_red", "gentleness_box_build", "chest_blue")
end
local function chest_pink(inst)
    inst["AnimState"]:OverrideSymbol("chest_red", "gentleness_box_build", "chest_pink")
end
local function chest_red(inst)
    inst["AnimState"]:OverrideSymbol("chest_red", "gentleness_box_build", "chest_red")
end
local function chest_yellow(inst)
    inst["AnimState"]:OverrideSymbol("chest_red", "gentleness_box_build", "chest_yellow")
end
local function bundle_anim(inst)
    inst["AnimState"]:OverrideSymbol("gentleness_bundle_a", "gentleness_bundle", "gentleness_bundle_a")
end
local function gentleness_chest_cw(inst)
    inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", "gentleness_chest_d")
end
local function gentleness_chest_ice(inst)
    inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", "gentleness_chest_a")
end
local function gentleness_chest_fire(inst)
    inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", "gentleness_chest_c")
end
local function gentleness_chest_money(inst)
    inst["AnimState"]:OverrideSymbol("gentleness_chest_a", "gentleness_chest", "gentleness_chest_b")
end
local function gentleness_lamp_base(inst)
    inst["AnimState"]:OverrideSymbol("gentleness_lamp_base", "gentleness_lamp", "gentleness_lamp_base")
end
local function gentleness_flower(inst)
    inst["AnimState"]:OverrideSymbol("gentleness_bh", "gentleness_flower", "gentleness_bh")
end
local function addComPrefab(name, data)

    local function prefab_fn()
        local inst = CreateEntity()
        inst["entity"]:AddTransform()
        inst["entity"]:AddAnimState()
        inst["entity"]:AddNetwork()
        if data and data["client_fn"] then
            data["client_fn"](inst, name)
        end
        inst["entity"]:SetPristine()
        if not TheWorld["ismastersim"] then
            return inst
        end
        if data and data["server_fn"] then
            data["server_fn"](inst, name)
        end

        return inst
    end
    return Prefab(name, prefab_fn, data["assets"] or {})
end

local all_prefabs = {}
for i, v in pairs(HH_ALL_PREFABS) do
    table["insert"](all_prefabs, addComPrefab(i, v))
    if v["name"] then
        STRINGS["NAMES"][string["upper"](i)] = v["name"] or "未定义"
        STRINGS["RECIPE_DESC"][string["upper"](i)] = v["recipe_str"] or "未定义"
        STRINGS["CHARACTERS"]["GENERIC"]["DESCRIBE"][string["upper"](i)] = v["desc"] or "未定义"
    end
    if v["xml"] then
        RegisterInventoryItemAtlas(v["xml"], i .. ".tex")
    end
end

local function light_fx()
    local inst = CreateEntity()

    inst["entity"]:AddTransform()
    inst["entity"]:AddLight()
    inst["entity"]:AddSoundEmitter()
    inst["entity"]:AddNetwork()

    inst:AddTag("FX")
    inst:AddTag("NOCLICK")

    inst["Light"]:SetIntensity(0.6)
    inst["Light"]:SetRadius(5)
    inst["Light"]:SetFalloff(2)
    inst["Light"]:Enable(false)
    inst["Light"]:SetColour(255 / 255, 255 / 255, 255 / 255)

    inst["entity"]:SetPristine()

    if not TheWorld["ismastersim"] then
        return inst
    end
    inst["Light"]:Enable(true)

    inst["persists"] = false

    return inst
end
return
MakePlacer("gentleness_box_build_a_placer", "gentleness_box_build", "gentleness_box_build", "idle", nil, nil, nil, nil, nil, nil, chest_green),
MakePlacer("gentleness_box_build_b_placer", "gentleness_box_build", "gentleness_box_build", "idle", nil, nil, nil, nil, nil, nil, chest_blue),
MakePlacer("gentleness_box_build_c_placer", "gentleness_box_build", "gentleness_box_build", "idle", nil, nil, nil, nil, nil, nil, chest_pink),
MakePlacer("gentleness_box_build_d_placer", "gentleness_box_build", "gentleness_box_build", "idle", nil, nil, nil, nil, nil, nil, chest_red),
MakePlacer("gentleness_box_build_e_placer", "gentleness_box_build", "gentleness_box_build", "idle", nil, nil, nil, nil, nil, nil, chest_yellow),
MakePlacer("gentleness_bundle_a_placer", "gentleness_bundle", "gentleness_bundle", "idle", nil, nil, nil, nil, nil, nil, bundle_anim),
MakePlacer("gentleness_chest_cw_placer", "gentleness_chest", "gentleness_chest", "idle", nil, nil, nil, 0.8, nil, nil, gentleness_chest_cw),
MakePlacer("gentleness_chest_ice_placer", "gentleness_chest", "gentleness_chest", "idle", nil, nil, nil, 0.8, nil, nil, gentleness_chest_ice),
MakePlacer("gentleness_chest_fire_placer", "gentleness_chest", "gentleness_chest", "idle", nil, nil, nil, 0.8, nil, nil, gentleness_chest_fire),
MakePlacer("gentleness_chest_money_placer", "gentleness_chest", "gentleness_chest", "idle", nil, nil, nil, 0.8, nil, nil, gentleness_chest_money),
MakePlacer("gentleness_lamp_base_placer", "gentleness_lamp", "gentleness_lamp", "idle", nil, nil, nil, nil, nil, nil, gentleness_lamp_base),
MakePlacer("gentleness_flower_placer", "gentleness_flower", "gentleness_flower", "idle", nil, nil, nil, nil, nil, nil, gentleness_flower),
MakePlacer("gentleness_ferris_wheel_placer", "gentleness_ferris_wheel", "gentleness_ferris_wheel", "idle", false, nil, nil, 2),
MakePlacer("gentleness_xb_placer", "gentleness_xb", "gentleness_xb", "idle"),
MakePlacer("gentleness_jasmine_withered_placer", "gentleness_jasmine", "gentleness_jasmine", "idle"),
MakePlacer("gentleness_jasmine_seed_placer", "gentleness_jasmine", "gentleness_jasmine", "idle"),
MakePlacer("gentleness_machine_placer", "gentleness_machine", "gentleness_machine", "idle"),
MakePlacer("gentleness_statue_platform_placer", "gentleness_statue_platform", "gentleness_statue_platform", "idle"),
MakePlacer("gentleness_mmg_placer", "gentleness_mmg", "gentleness_mmg", "idle"),
MakePlacer("gentleness_moonbase_placer", "moonbase", "moonbase", "med"),
MakePlacer("gentleness_tent_placer", "tent", "gentleness_tent", "idle", false, nil, nil, 2),
MakePlacer("gentleness_color_land_item_placer", "gentleness_color_land", "gentleness_color_land", "idle", true, nil, nil, 1, 90),
MakePlacer("gentleness_streetlight_placer", "gentleness_streetlight", "gentleness_streetlight", "idle"),
MakePlacer("gentleness_food_tray_placer", "gentleness_food_tray", "gentleness_food_tray", "idle"),
MakePlacer("gentleness_wooden_board_placer", "gentleness_wooden_board", "gentleness_wooden_board", "idle"),
MakePlacer("gentleness_fruit_basket_placer", "gentleness_fruit_basket", "gentleness_fruit_basket", "empty", false, nil, nil, 0.5),
MakePlacer("gentleness_gril_placer", "gentleness_gril", "gentleness_gril", "empty", false, nil, nil, 0.5),
MakePlacer("gentleness_flower_basket_placer", "gentleness_flower_basket", "gentleness_flower_basket", "empty", false, nil, nil, 0.5),
MakePlacer("gentleness_carpet_placer", "gentleness_carpet", "gentleness_carpet", "idle", true, nil, nil, 2, 90),
Prefab("gentleness_turf_staff_light", light_fx),
unpack(all_prefabs)
