function abigail_flower_init_fn (inst, build_name)
    if not TheWorld.ismastersim then
        return
    end
    if inst.flower_skin_id and inst.skin_id then    -- 此处新增条件
        inst.flower_skin_id:set(inst.skin_id)
    end
    inst.AnimState:SetSkin(build_name, "abigail_flower_rework")
    inst.components.inventoryitem:ChangeImageName(inst:GetSkinName())
    inst.linked_skinname = string.gsub(build_name, "_flower", "")
end

local prefs = {}
local groupid = 0825

table.insert(prefs, CreatePrefabSkin("custom_abigail_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_ancient.dyn"),
    },
    base_prefab = "abigail" ,
    build_name_override = "custom_abigail_ancient" ,
    granted_items = { "custom_abigail_flower_ancient" , },
    init_fn = function(inst) abigail_init_fn(inst, "custom_abigail_ancient") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ABIGAIL", "ANCIENT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_creepy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_creepy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_creepy.dyn"),
    },
    base_prefab = "abigail" ,
    build_name_override = "custom_abigail_creepy" ,
    granted_items = { "custom_abigail_flower_creepy" , },
    init_fn = function(inst) abigail_init_fn(inst, "custom_abigail_creepy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ABIGAIL", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_flower_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_ancient.dyn"),
    },
    base_prefab = "abigail_flower" ,
    build_name_override = "custom_abigail_ancient" ,
    init_fn = function(inst) abigail_flower_init_fn(inst, "custom_abigail_ancient") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_flower_creepy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_creepy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_creepy.dyn"),
    },
    base_prefab = "abigail_flower" ,
    build_name_override = "custom_abigail_creepy" ,
    init_fn = function(inst) abigail_flower_init_fn(inst, "custom_abigail_creepy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_flower_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_formal.dyn"),
    },
    base_prefab = "abigail_flower" ,
    build_name_override = "custom_abigail_formal" ,
    init_fn = function(inst) abigail_flower_init_fn(inst, "custom_abigail_formal") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_flower_funeral",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_funeral.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_funeral.dyn"),
    },
    base_prefab = "abigail_flower" ,
    build_name_override = "custom_abigail_funeral" ,
    init_fn = function(inst) abigail_flower_init_fn(inst, "custom_abigail_funeral") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_flower_gladiator",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_gladiator.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_gladiator.dyn"),
    },
    base_prefab = "abigail_flower" ,
    build_name_override = "custom_abigail_gladiator" ,
    init_fn = function(inst) abigail_flower_init_fn(inst, "custom_abigail_gladiator") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_flower_handmedown",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_handmedown.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_handmedown.dyn"),
    },
    base_prefab = "abigail_flower" ,
    build_name_override = "custom_abigail_handmedown" ,
    init_fn = function(inst) abigail_flower_init_fn(inst, "custom_abigail_handmedown") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_flower_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_ice.dyn"),
    },
    base_prefab = "abigail_flower" ,
    build_name_override = "custom_abigail_ice" ,
    init_fn = function(inst) abigail_flower_init_fn(inst, "custom_abigail_ice") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_flower_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_lunar.dyn"),
    },
    base_prefab = "abigail_flower" ,
    build_name_override = "custom_abigail_lunar" ,
    init_fn = function(inst) abigail_flower_init_fn(inst, "custom_abigail_lunar") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_flower_lureplant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_lureplant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_lureplant.dyn"),
    },
    base_prefab = "abigail_flower" ,
    build_name_override = "custom_abigail_lureplant" ,
    init_fn = function(inst) abigail_flower_init_fn(inst, "custom_abigail_lureplant") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_flower_magma",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_magma.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_magma.dyn"),
    },
    base_prefab = "abigail_flower" ,
    build_name_override = "custom_abigail_magma" ,
    init_fn = function(inst) abigail_flower_init_fn(inst, "custom_abigail_magma") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_flower_masquerade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_masquerade.dyn"),
    },
    base_prefab = "abigail_flower" ,
    build_name_override = "custom_abigail_masquerade" ,
    init_fn = function(inst) abigail_flower_init_fn(inst, "custom_abigail_masquerade") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_flower_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_nature.dyn"),
    },
    base_prefab = "abigail_flower" ,
    build_name_override = "custom_abigail_nature" ,
    init_fn = function(inst) abigail_flower_init_fn(inst, "custom_abigail_nature") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_flower_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_rose.dyn"),
    },
    base_prefab = "abigail_flower" ,
    build_name_override = "custom_abigail_rose" ,
    init_fn = function(inst) abigail_flower_init_fn(inst, "custom_abigail_rose") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_flower_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_shadow.dyn"),
    },
    base_prefab = "abigail_flower" ,
    build_name_override = "custom_abigail_shadow" ,
    init_fn = function(inst) abigail_flower_init_fn(inst, "custom_abigail_shadow") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_flower_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_survivor.dyn"),
    },
    base_prefab = "abigail_flower" ,
    build_name_override = "custom_abigail_survivor" ,
    init_fn = function(inst) abigail_flower_init_fn(inst, "custom_abigail_survivor") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_flower_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_victorian.dyn"),
    },
    base_prefab = "abigail_flower" ,
    build_name_override = "custom_abigail_victorian" ,
    init_fn = function(inst) abigail_flower_init_fn(inst, "custom_abigail_victorian") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_flower_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_yule.dyn"),
    },
    base_prefab = "abigail_flower" ,
    build_name_override = "custom_abigail_yule" ,
    init_fn = function(inst) abigail_flower_init_fn(inst, "custom_abigail_yule") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_formal.dyn"),
    },
    base_prefab = "abigail" ,
    build_name_override = "custom_abigail_formal" ,
    granted_items = { "custom_abigail_flower_formal" , },
    init_fn = function(inst) abigail_init_fn(inst, "custom_abigail_formal") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ABIGAIL", "FORMAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_funeral",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_funeral.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_funeral.dyn"),
    },
    base_prefab = "abigail" ,
    build_name_override = "custom_abigail_funeral" ,
    granted_items = { "custom_abigail_flower_funeral" , },
    init_fn = function(inst) abigail_init_fn(inst, "custom_abigail_funeral") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ABIGAIL", "THEATER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_gladiator",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_gladiator.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_gladiator.dyn"),
    },
    base_prefab = "abigail" ,
    build_name_override = "custom_abigail_gladiator" ,
    granted_items = { "custom_abigail_flower_gladiator" , },
    init_fn = function(inst) abigail_init_fn(inst, "custom_abigail_gladiator") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ABIGAIL", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_handmedown",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_handmedown.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_handmedown.dyn"),
    },
    base_prefab = "abigail" ,
    build_name_override = "custom_abigail_handmedown" ,
    granted_items = { "custom_abigail_flower_handmedown" , },
    init_fn = function(inst) abigail_init_fn(inst, "custom_abigail_handmedown") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ABIGAIL", "HANDMEDOWN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_ice.dyn"),
    },
    base_prefab = "abigail" ,
    build_name_override = "custom_abigail_ice" ,
    granted_items = { "custom_abigail_flower_ice" , },
    init_fn = function(inst) abigail_init_fn(inst, "custom_abigail_ice") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ABIGAIL", "ICE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_lunar.dyn"),
    },
    base_prefab = "abigail" ,
    build_name_override = "custom_abigail_lunar" ,
    granted_items = { "custom_abigail_flower_lunar" , },
    init_fn = function(inst) abigail_init_fn(inst, "custom_abigail_lunar") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ABIGAIL", "LUNAR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_lureplant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_lureplant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_lureplant.dyn"),
    },
    base_prefab = "abigail" ,
    build_name_override = "custom_abigail_lureplant" ,
    granted_items = { "custom_abigail_flower_lureplant" , },
    init_fn = function(inst) abigail_init_fn(inst, "custom_abigail_lureplant") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ABIGAIL", "COSTUME", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_magma",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_magma.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_magma.dyn"),
    },
    base_prefab = "abigail" ,
    build_name_override = "custom_abigail_magma" ,
    granted_items = { "custom_abigail_flower_magma" , },
    init_fn = function(inst) abigail_init_fn(inst, "custom_abigail_magma") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ABIGAIL", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_masquerade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_masquerade.dyn"),
    },
    base_prefab = "abigail" ,
    build_name_override = "custom_abigail_masquerade" ,
    granted_items = { "custom_abigail_flower_masquerade" , },
    init_fn = function(inst) abigail_init_fn(inst, "custom_abigail_masquerade") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ABIGAIL", "MASQUERADE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_nature.dyn"),
    },
    base_prefab = "abigail" ,
    build_name_override = "custom_abigail_nature" ,
    granted_items = { "custom_abigail_flower_nature" , },
    init_fn = function(inst) abigail_init_fn(inst, "custom_abigail_nature") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ABIGAIL", "VARG", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_rose.dyn"),
    },
    base_prefab = "abigail" ,
    build_name_override = "custom_abigail_rose" ,
    granted_items = { "custom_abigail_flower_rose" , },
    init_fn = function(inst) abigail_init_fn(inst, "custom_abigail_rose") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ABIGAIL", "ROSE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_shadow.dyn"),
    },
    base_prefab = "abigail" ,
    build_name_override = "custom_abigail_shadow" ,
    granted_items = { "custom_abigail_flower_shadow" , },
    init_fn = function(inst) abigail_init_fn(inst, "custom_abigail_shadow") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ABIGAIL", "SHADOW", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_survivor.dyn"),
    },
    base_prefab = "abigail" ,
    build_name_override = "custom_abigail_survivor" ,
    granted_items = { "custom_abigail_flower_survivor" , },
    init_fn = function(inst) abigail_init_fn(inst, "custom_abigail_survivor") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ABIGAIL", "SURVIVOR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_victorian.dyn"),
    },
    base_prefab = "abigail" ,
    build_name_override = "custom_abigail_victorian" ,
    granted_items = { "custom_abigail_flower_victorian" , },
    init_fn = function(inst) abigail_init_fn(inst, "custom_abigail_victorian") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ABIGAIL", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_abigail_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_abigail_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_abigail_yule.dyn"),
    },
    base_prefab = "abigail" ,
    build_name_override = "custom_abigail_yule" ,
    granted_items = { "custom_abigail_flower_yule" , },
    init_fn = function(inst) abigail_init_fn(inst, "custom_abigail_yule") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ABIGAIL", "YULE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_alterguardianhat_lastprism",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_alterguardianhat_lastprism.zip"),
        Asset("PKGREF", "anim/dynamic/custom_alterguardianhat_lastprism.dyn"),
    },
    base_prefab = "alterguardianhat" ,
    build_name_override = "custom_alterguardianhat_lastprism" ,
    init_fn = function(inst) alterguardianhat_init_fn(inst, "custom_alterguardianhat_lastprism") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ALTERGUARDIANHAT", "T_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_amulet_blue_relic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_amulet_blue_relic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_amulet_blue_relic.dyn"),
    },
    base_prefab = "blueamulet" ,
    build_name_override = "custom_amulet_blue_relic" ,
    init_fn = function(inst) blueamulet_init_fn(inst, "custom_amulet_blue_relic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "AMULET_BLUE", "RELIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_amulet_green_relic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_amulet_green_relic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_amulet_green_relic.dyn"),
    },
    base_prefab = "greenamulet" ,
    build_name_override = "custom_amulet_green_relic" ,
    init_fn = function(inst) greenamulet_init_fn(inst, "custom_amulet_green_relic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "AMULET_GREEN", "RELIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_amulet_orange_relic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_amulet_orange_relic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_amulet_orange_relic.dyn"),
    },
    base_prefab = "orangeamulet" ,
    build_name_override = "custom_amulet_orange_relic" ,
    init_fn = function(inst) orangeamulet_init_fn(inst, "custom_amulet_orange_relic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "AMULET_ORANGE", "RELIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_amulet_purple_relic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_amulet_purple_relic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_amulet_purple_relic.dyn"),
    },
    base_prefab = "purpleamulet" ,
    build_name_override = "custom_amulet_purple_relic" ,
    init_fn = function(inst) purpleamulet_init_fn(inst, "custom_amulet_purple_relic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "AMULET_PURPLE", "RELIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_amulet_red_heart",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_amulet_red_heart.zip"),
        Asset("PKGREF", "anim/dynamic/custom_amulet_red_heart.dyn"),
    },
    base_prefab = "amulet" ,
    build_name_override = "custom_amulet_red_heart" ,
    init_fn = function(inst) amulet_init_fn(inst, "custom_amulet_red_heart") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "AMULET_RED", "HEART", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_amulet_red_occulteye",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_amulet_red_occulteye.zip"),
        Asset("PKGREF", "anim/dynamic/custom_amulet_red_occulteye.dyn"),
    },
    base_prefab = "amulet" ,
    build_name_override = "custom_amulet_red_occulteye" ,
    init_fn = function(inst) amulet_init_fn(inst, "custom_amulet_red_occulteye") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "AMULET_RED", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_amulet_red_relic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_amulet_red_relic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_amulet_red_relic.dyn"),
    },
    base_prefab = "amulet" ,
    build_name_override = "custom_amulet_red_relic" ,
    init_fn = function(inst) amulet_init_fn(inst, "custom_amulet_red_relic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "AMULET_RED", "RELIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_amulet_red_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_amulet_red_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_amulet_red_rose.dyn"),
    },
    base_prefab = "amulet" ,
    build_name_override = "custom_amulet_red_rose" ,
    init_fn = function(inst) amulet_init_fn(inst, "custom_amulet_red_rose") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "AMULET_RED", "ROSE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_amulet_yellow_an",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_amulet_yellow_an.zip"),
        Asset("PKGREF", "anim/dynamic/custom_amulet_yellow_an.dyn"),
    },
    base_prefab = "yellowamulet" ,
    build_name_override = "custom_amulet_yellow_an" ,
    init_fn = function(inst) yellowamulet_init_fn(inst, "custom_amulet_yellow_an") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "AMULET_YELLOW", "ARTNOUVEAU", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_amulet_yellow_ornate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_amulet_yellow_ornate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_amulet_yellow_ornate.dyn"),
    },
    base_prefab = "yellowamulet" ,
    build_name_override = "custom_amulet_yellow_ornate" ,
    init_fn = function(inst) yellowamulet_init_fn(inst, "custom_amulet_yellow_ornate") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "AMULET_YELLOW", "ORNATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_amulet_yellow_relic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_amulet_yellow_relic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_amulet_yellow_relic.dyn"),
    },
    base_prefab = "yellowamulet" ,
    build_name_override = "custom_amulet_yellow_relic" ,
    init_fn = function(inst) yellowamulet_init_fn(inst, "custom_amulet_yellow_relic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "AMULET_YELLOW", "RELIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_anchor_nautical",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_anchor_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_anchor_nautical.dyn"),
    },
    base_prefab = "anchor" ,
    build_name_override = "custom_anchor_nautical" ,
    init_fn = function(inst) anchor_init_fn(inst, "custom_anchor_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "ANCHOR", "CRAFTABLE", "NAUTICAL", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_anchor_nautical_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_anchor_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_anchor_nautical.dyn"),
    },
    base_prefab = "anchor_item" ,
    build_name_override = "custom_anchor_nautical" ,
    init_fn = function(inst) anchor_item_init_fn(inst, "custom_anchor_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_bramble_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_bramble_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_bramble_ancient.dyn"),
    },
    base_prefab = "armor_bramble" ,
    build_name_override = "custom_armor_bramble_ancient" ,
    init_fn = function(inst) armor_bramble_init_fn(inst, "custom_armor_bramble_ancient") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ARMOR_BRAMBLE", "ANCIENT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_dragonfly_fangedcollar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_dragonfly_fangedcollar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_dragonfly_fangedcollar.dyn"),
    },
    base_prefab = "armordragonfly" ,
    build_name_override = "custom_armor_dragonfly_fangedcollar" ,
    init_fn = function(inst) armordragonfly_init_fn(inst, "custom_armor_dragonfly_fangedcollar") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_dragonfly_haramaki",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_dragonfly_haramaki.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_dragonfly_haramaki.dyn"),
    },
    base_prefab = "armordragonfly" ,
    build_name_override = "custom_armor_dragonfly_haramaki" ,
    init_fn = function(inst) armordragonfly_init_fn(inst, "custom_armor_dragonfly_haramaki") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_dragonfly_lamellar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_dragonfly_lamellar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_dragonfly_lamellar.dyn"),
    },
    base_prefab = "armordragonfly" ,
    build_name_override = "custom_armor_dragonfly_lamellar" ,
    init_fn = function(inst) armordragonfly_init_fn(inst, "custom_armor_dragonfly_lamellar") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_dragonfly_roman",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_dragonfly_roman.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_dragonfly_roman.dyn"),
    },
    base_prefab = "armordragonfly" ,
    build_name_override = "custom_armor_dragonfly_roman" ,
    init_fn = function(inst) armordragonfly_init_fn(inst, "custom_armor_dragonfly_roman") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_dreadstone_horn",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_dreadstone_horn.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_dreadstone_horn.dyn"),
    },
    base_prefab = "armordreadstone" ,
    build_name_override = "custom_armor_dreadstone_horn" ,
    init_fn = function(inst) armordreadstone_init_fn(inst, "custom_armor_dreadstone_horn") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SHADOW", "ARMORDREADSTONE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_grass_cloak",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_grass_cloak.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_grass_cloak.dyn"),
    },
    base_prefab = "armorgrass" ,
    build_name_override = "custom_armor_grass_cloak" ,
    init_fn = function(inst) armorgrass_init_fn(inst, "custom_armor_grass_cloak") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ARMORGRASS", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_grass_woven",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_grass_woven.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_grass_woven.dyn"),
    },
    base_prefab = "armorgrass" ,
    build_name_override = "custom_armor_grass_woven" ,
    init_fn = function(inst) armorgrass_init_fn(inst, "custom_armor_grass_woven") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ARMORGRASS", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_marble_chainmail",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_marble_chainmail.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_marble_chainmail.dyn"),
    },
    base_prefab = "armormarble" ,
    build_name_override = "custom_armor_marble_chainmail" ,
    init_fn = function(inst) armormarble_init_fn(inst, "custom_armor_marble_chainmail") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ARMORMARBLE", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_marble_rockabs",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_marble_rockabs.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_marble_rockabs.dyn"),
    },
    base_prefab = "armormarble" ,
    build_name_override = "custom_armor_marble_rockabs" ,
    init_fn = function(inst) armormarble_init_fn(inst, "custom_armor_marble_rockabs") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ARMORMARBLE", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_marble_valkyrie",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_marble_valkyrie.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_marble_valkyrie.dyn"),
    },
    base_prefab = "armormarble" ,
    build_name_override = "custom_armor_marble_valkyrie" ,
    init_fn = function(inst) armormarble_init_fn(inst, "custom_armor_marble_valkyrie") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ARMORMARBLE", "VALKYRIE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_ruins_an",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_ruins_an.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_ruins_an.dyn"),
    },
    base_prefab = "armorruins" ,
    build_name_override = "custom_armor_ruins_an" ,
    init_fn = function(inst) armorruins_init_fn(inst, "custom_armor_ruins_an") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "ARMORRUINS", "ARTNOUVEAU", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_ruins_arcane",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_ruins_arcane.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_ruins_arcane.dyn"),
    },
    base_prefab = "armorruins" ,
    build_name_override = "custom_armor_ruins_arcane" ,
    init_fn = function(inst) armorruins_init_fn(inst, "custom_armor_ruins_arcane") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ARMORRUINS", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_ruins_bulky",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_ruins_bulky.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_ruins_bulky.dyn"),
    },
    base_prefab = "armorruins" ,
    build_name_override = "custom_armor_ruins_bulky" ,
    init_fn = function(inst) armorruins_init_fn(inst, "custom_armor_ruins_bulky") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ARMORRUINS", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_ruins_leaf",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_ruins_leaf.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_ruins_leaf.dyn"),
    },
    base_prefab = "armorruins" ,
    build_name_override = "custom_armor_ruins_leaf" ,
    init_fn = function(inst) armorruins_init_fn(inst, "custom_armor_ruins_leaf") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ARMORRUINS", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_ruins_tusk",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_ruins_tusk.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_ruins_tusk.dyn"),
    },
    base_prefab = "armorruins" ,
    build_name_override = "custom_armor_ruins_tusk" ,
    init_fn = function(inst) armorruins_init_fn(inst, "custom_armor_ruins_tusk") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ARMORRUINS", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_sanity_curve",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_sanity_curve.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_sanity_curve.dyn"),
    },
    base_prefab = "armor_sanity" ,
    build_name_override = "custom_armor_sanity_curve" ,
    init_fn = function(inst) armor_sanity_init_fn(inst, "custom_armor_sanity_curve") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ARMOR_SANITY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_sanity_sharp",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_sanity_sharp.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_sanity_sharp.dyn"),
    },
    base_prefab = "armor_sanity" ,
    build_name_override = "custom_armor_sanity_sharp" ,
    init_fn = function(inst) armor_sanity_init_fn(inst, "custom_armor_sanity_sharp") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "ARMOR_SANITY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_sanity_wizard",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_sanity_wizard.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_sanity_wizard.dyn"),
    },
    base_prefab = "armor_sanity" ,
    build_name_override = "custom_armor_sanity_wizard" ,
    init_fn = function(inst) armor_sanity_init_fn(inst, "custom_armor_sanity_wizard") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WIZARD", "ARMOR_SANITY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_skeleton_relic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_skeleton_relic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_skeleton_relic.dyn"),
    },
    base_prefab = "armorskeleton" ,
    build_name_override = "custom_armor_skeleton_relic" ,
    init_fn = function(inst) armorskeleton_init_fn(inst, "custom_armor_skeleton_relic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ARMORSKELETON", "RELIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_skeleton_shadowscalemail",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_skeleton_shadowscalemail.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_skeleton_shadowscalemail.dyn"),
    },
    base_prefab = "armorskeleton" ,
    build_name_override = "custom_armor_skeleton_shadowscalemail" ,
    init_fn = function(inst) armorskeleton_init_fn(inst, "custom_armor_skeleton_shadowscalemail") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ARMORSKELETON", "T_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_trunkvest_summer_quilted",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_trunkvest_summer_quilted.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_trunkvest_summer_quilted.dyn"),
    },
    base_prefab = "trunkvest_summer" ,
    build_name_override = "custom_armor_trunkvest_summer_quilted" ,
    init_fn = function(inst) trunkvest_summer_init_fn(inst, "custom_armor_trunkvest_summer_quilted") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "TRUNKVEST_SUMMER", "WINTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_trunkvest_winter_quilted",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_trunkvest_winter_quilted.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_trunkvest_winter_quilted.dyn"),
    },
    base_prefab = "trunkvest_winter" ,
    build_name_override = "custom_armor_trunkvest_winter_quilted" ,
    init_fn = function(inst) trunkvest_winter_init_fn(inst, "custom_armor_trunkvest_winter_quilted") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "TRUNKVEST_WINTER", "WINTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_wood_fangedcollar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_wood_fangedcollar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_wood_fangedcollar.dyn"),
    },
    base_prefab = "armorwood" ,
    build_name_override = "custom_armor_wood_fangedcollar" ,
    granted_items = { "custom_armor_dragonfly_fangedcollar" , },
    init_fn = function(inst) armorwood_init_fn(inst, "custom_armor_wood_fangedcollar") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ARMORWOOD", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_wood_haramaki",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_wood_haramaki.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_wood_haramaki.dyn"),
    },
    base_prefab = "armorwood" ,
    build_name_override = "custom_armor_wood_haramaki" ,
    granted_items = { "custom_armor_dragonfly_haramaki" , },
    init_fn = function(inst) armorwood_init_fn(inst, "custom_armor_wood_haramaki") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ARMORWOOD", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_wood_lamellar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_wood_lamellar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_wood_lamellar.dyn"),
    },
    base_prefab = "armorwood" ,
    build_name_override = "custom_armor_wood_lamellar" ,
    granted_items = { "custom_armor_dragonfly_lamellar" , },
    init_fn = function(inst) armorwood_init_fn(inst, "custom_armor_wood_lamellar") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ARMORWOOD", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_armor_wood_roman",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_armor_wood_roman.zip"),
        Asset("PKGREF", "anim/dynamic/custom_armor_wood_roman.dyn"),
    },
    base_prefab = "armorwood" ,
    build_name_override = "custom_armor_wood_roman" ,
    granted_items = { "custom_armor_dragonfly_roman" , },
    init_fn = function(inst) armorwood_init_fn(inst, "custom_armor_wood_roman") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "ARMORWOOD", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_arrowsign_post_circus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_arrowsign_post_circus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_arrowsign_post_circus.dyn"),
    },
    base_prefab = "arrowsign_post" ,
    build_name_override = "custom_arrowsign_post_circus" ,
    init_fn = function(inst) arrowsign_post_init_fn(inst, "custom_arrowsign_post_circus") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "ARROWSIGN_POST", "CIRCUS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_arrowsign_post_factory",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_arrowsign_post_factory.zip"),
        Asset("PKGREF", "anim/dynamic/custom_arrowsign_post_factory.dyn"),
    },
    base_prefab = "arrowsign_post" ,
    build_name_override = "custom_arrowsign_post_factory" ,
    init_fn = function(inst) arrowsign_post_init_fn(inst, "custom_arrowsign_post_factory") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ARROWSIGN_POST", "CRAFTABLE", "NEXTKIN", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_arrowsign_post_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_arrowsign_post_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_arrowsign_post_fantasy.dyn"),
    },
    base_prefab = "arrowsign_post" ,
    build_name_override = "custom_arrowsign_post_fantasy" ,
    init_fn = function(inst) arrowsign_post_init_fn(inst, "custom_arrowsign_post_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ARROWSIGN_POST", "CRAFTABLE", "FANTASY", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_axe_feathered",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_axe_feathered.zip"),
        Asset("PKGREF", "anim/dynamic/custom_axe_feathered.dyn"),
    },
    base_prefab = "axe" ,
    build_name_override = "custom_axe_feathered" ,
    init_fn = function(inst) axe_init_fn(inst, "custom_axe_feathered") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "AXE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_axe_invisible",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_axe_invisible.zip"),
        Asset("PKGREF", "anim/dynamic/custom_axe_invisible.dyn"),
    },
    base_prefab = "axe" ,
    build_name_override = "custom_axe_invisible" ,
    init_fn = function(inst) axe_init_fn(inst, "custom_axe_invisible") end,
    rarity = "Classy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "AXE", "INVISIBLE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_axe_northern",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_axe_northern.zip"),
        Asset("PKGREF", "anim/dynamic/custom_axe_northern.dyn"),
    },
    base_prefab = "axe" ,
    build_name_override = "custom_axe_northern" ,
    init_fn = function(inst) axe_init_fn(inst, "custom_axe_northern") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "AXE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_axe_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_axe_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_axe_victorian.dyn"),
    },
    base_prefab = "axe" ,
    build_name_override = "custom_axe_victorian" ,
    init_fn = function(inst) axe_init_fn(inst, "custom_axe_victorian") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "AXE", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_babybeef",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_babybeef.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_babybeef.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_babybeef" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_babybeef") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_basic_blue_catcoon",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_basic_blue_catcoon.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_basic_blue_catcoon.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_basic_blue_catcoon" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_basic_blue_catcoon") end,
    marketable = true,
    rarity = "Spiffy",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", "BLUE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_basic_green_olive",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_basic_green_olive.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_basic_green_olive.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_basic_green_olive" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_basic_green_olive") end,
    marketable = true,
    rarity = "Spiffy",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", "GREEN", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_bat",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_bat.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_bat.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_bat" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_bat") end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_beefalo",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_beefalo.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_beefalo.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_beefalo" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_beefalo") end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_buckle_grey_pewter",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_buckle_grey_pewter.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_buckle_grey_pewter.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_buckle_grey_pewter" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_buckle_grey_pewter") end,
    marketable = true,
    rarity = "Spiffy",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", "GREY", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_buckle_navy_phthalo",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_buckle_navy_phthalo.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_buckle_navy_phthalo.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_buckle_navy_phthalo" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_buckle_navy_phthalo") end,
    marketable = true,
    rarity = "Spiffy",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", "NAVY", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_buckle_red_rook",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_buckle_red_rook.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_buckle_red_rook.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_buckle_red_rook" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_buckle_red_rook") end,
    marketable = true,
    rarity = "Spiffy",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", "RED", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_camping_green_viridian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_camping_green_viridian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_camping_green_viridian.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_camping_green_viridian" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_camping_green_viridian") end,
    marketable = true,
    rarity = "Spiffy",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", "GREEN", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_camping_orange_carrot",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_camping_orange_carrot.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_camping_orange_carrot.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_camping_orange_carrot" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_camping_orange_carrot") end,
    marketable = true,
    rarity = "Spiffy",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", "ORANGE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_camping_red_koalefant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_camping_red_koalefant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_camping_red_koalefant.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_camping_red_koalefant" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_camping_red_koalefant") end,
    marketable = true,
    rarity = "Spiffy",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", "RED", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_carrat",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_carrat.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_carrat.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_carrat" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_carrat") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_catcoon",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_catcoon.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_catcoon.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_catcoon" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_catcoon") end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_chester",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_chester.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_chester.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_chester" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_chester") end,
    rarity = "ProofOfPurchase",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_crab",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_crab.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_crab.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_crab" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_crab") end,
    rarity = "ProofOfPurchase",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_crab_resurrected",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_crab.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_crab.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_crab" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_crab") end,
    rarity = "Resurrected",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_deerclops",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_deerclops.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_deerclops.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_deerclops" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_deerclops") end,
    rarity = "ProofOfPurchase",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_dragonfly_fire",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_dragonfly_fire.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_dragonfly_fire.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_dragonfly_fire" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_dragonfly_fire") end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "BACKPACK", "LUNAR_NY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_glommer",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_glommer.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_glommer.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_glommer" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_glommer") end,
    rarity = "ProofOfPurchase",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_heart",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_heart.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_heart.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_heart" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_heart") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "HEART", "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_hound",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_hound.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_hound.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_hound" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_hound") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_koalefant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_koalefant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_koalefant.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_koalefant" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_koalefant") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_mandrake",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_mandrake.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_mandrake.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_mandrake" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_mandrake") end,
    rarity = "ProofOfPurchase",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_mushy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_mushy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_mushy.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_mushy" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_mushy") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_poop",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_poop.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_poop.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_poop" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_poop") end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_rabbit",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_rabbit.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_rabbit.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_rabbit" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_rabbit") end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_smallbird",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_smallbird.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_smallbird.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_smallbird" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_smallbird") end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_spider",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_spider.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_spider.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_spider" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_spider") end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_backpack_splumonkey",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_backpack_splumonkey.zip"),
        Asset("PKGREF", "anim/dynamic/custom_backpack_splumonkey.dyn"),
    },
    base_prefab = "backpack" ,
    build_name_override = "custom_backpack_splumonkey" ,
    init_fn = function(inst) backpack_init_fn(inst, "custom_backpack_splumonkey") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BACKPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_batbat_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_batbat_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_batbat_fantasy.dyn"),
    },
    base_prefab = "batbat" ,
    build_name_override = "custom_batbat_fantasy" ,
    fx_prefab = { "batbat_fantasy_fx", },
    init_fn = function(inst) batbat_init_fn(inst, "custom_batbat_fantasy") end,
    prefabs = { "batbat_fantasy_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_batbat_scythe",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_batbat_scythe.zip"),
        Asset("PKGREF", "anim/dynamic/custom_batbat_scythe.dyn"),
    },
    base_prefab = "batbat" ,
    build_name_override = "custom_batbat_scythe" ,
    fx_prefab = { "batbat_bats", },
    init_fn = function(inst) batbat_init_fn(inst, "custom_batbat_scythe") end,
    prefabs = { "batbat_bats", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_beargerfursack_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_beargerfursack_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_beargerfursack_rose.dyn"),
    },
    base_prefab = "beargerfur_sack" ,
    build_name_override = "custom_beargerfursack_rose" ,
    init_fn = function(inst) beargerfur_sack_init_fn(inst, "custom_beargerfursack_rose") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "BEARGERFUR_SACK", "ROSE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_beargervest_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_beargervest_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_beargervest_rose.dyn"),
    },
    base_prefab = "beargervest" ,
    build_name_override = "custom_beargervest_rose" ,
    init_fn = function(inst) beargervest_init_fn(inst, "custom_beargervest_rose") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "BEARGERVEST", "ROSE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_beargervest_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_beargervest_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_beargervest_yule.dyn"),
    },
    base_prefab = "beargervest" ,
    build_name_override = "custom_beargervest_yule" ,
    init_fn = function(inst) beargervest_init_fn(inst, "custom_beargervest_yule") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "BEARGERVEST", "WINTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bedroll_furry_catcoon",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bedroll_furry_catcoon.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bedroll_furry_catcoon.dyn"),
    },
    base_prefab = "bedroll_furry" ,
    build_name_override = "custom_bedroll_furry_catcoon" ,
    init_fn = function(inst) bedroll_furry_init_fn(inst, "custom_bedroll_furry_catcoon") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "BEDROLL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bedroll_furry_potato",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bedroll_furry_potato.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bedroll_furry_potato.dyn"),
    },
    base_prefab = "bedroll_furry" ,
    build_name_override = "custom_bedroll_furry_potato" ,
    init_fn = function(inst) bedroll_furry_init_fn(inst, "custom_bedroll_furry_potato") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "MIGHTY", "BEDROLL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bedroll_furry_quilt_blue_frost",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bedroll_furry_quilt_blue_frost.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bedroll_furry_quilt_blue_frost.dyn"),
    },
    base_prefab = "bedroll_furry" ,
    build_name_override = "custom_bedroll_furry_quilt_blue_frost" ,
    init_fn = function(inst) bedroll_furry_init_fn(inst, "custom_bedroll_furry_quilt_blue_frost") end,
    marketable = true,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { "BEDROLL", "CRAFTABLE", "BLUE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bedroll_furry_quilt_green_hunters",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bedroll_furry_quilt_green_hunters.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bedroll_furry_quilt_green_hunters.dyn"),
    },
    base_prefab = "bedroll_furry" ,
    build_name_override = "custom_bedroll_furry_quilt_green_hunters" ,
    init_fn = function(inst) bedroll_furry_init_fn(inst, "custom_bedroll_furry_quilt_green_hunters") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BEDROLL", "CRAFTABLE", "GREEN", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bedroll_furry_quilt_grey",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bedroll_furry_quilt_grey.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bedroll_furry_quilt_grey.dyn"),
    },
    base_prefab = "bedroll_furry" ,
    build_name_override = "custom_bedroll_furry_quilt_grey" ,
    init_fn = function(inst) bedroll_furry_init_fn(inst, "custom_bedroll_furry_quilt_grey") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BEDROLL", "CRAFTABLE", "GREY", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bedroll_furry_quilt_orange_honey",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bedroll_furry_quilt_orange_honey.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bedroll_furry_quilt_orange_honey.dyn"),
    },
    base_prefab = "bedroll_furry" ,
    build_name_override = "custom_bedroll_furry_quilt_orange_honey" ,
    init_fn = function(inst) bedroll_furry_init_fn(inst, "custom_bedroll_furry_quilt_orange_honey") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BEDROLL", "CRAFTABLE", "ORANGE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bedroll_furry_quilt_red_redbird",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bedroll_furry_quilt_red_redbird.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bedroll_furry_quilt_red_redbird.dyn"),
    },
    base_prefab = "bedroll_furry" ,
    build_name_override = "custom_bedroll_furry_quilt_red_redbird" ,
    init_fn = function(inst) bedroll_furry_init_fn(inst, "custom_bedroll_furry_quilt_red_redbird") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BEDROLL", "CRAFTABLE", "RED", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bedroll_furry_quilt_white_ivory",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bedroll_furry_quilt_white_ivory.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bedroll_furry_quilt_white_ivory.dyn"),
    },
    base_prefab = "bedroll_furry" ,
    build_name_override = "custom_bedroll_furry_quilt_white_ivory" ,
    init_fn = function(inst) bedroll_furry_init_fn(inst, "custom_bedroll_furry_quilt_white_ivory") end,
    marketable = true,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { "BEDROLL", "CRAFTABLE", "WHITE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_beebox_crystal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_beebox_crystal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_beebox_crystal.dyn"),
    },
    base_prefab = "beebox" ,
    build_name_override = "custom_beebox_crystal" ,
    init_fn = function(inst) beebox_init_fn(inst, "custom_beebox_crystal") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "CRYSTAL", "BEEBOX", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_beebox_garden",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_beebox_garden.zip"),
        Asset("PKGREF", "anim/dynamic/custom_beebox_garden.dyn"),
    },
    base_prefab = "beebox" ,
    build_name_override = "custom_beebox_garden" ,
    init_fn = function(inst) beebox_init_fn(inst, "custom_beebox_garden") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "COTTAGE", "BEEBOX", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_beebox_house",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_beebox_house.zip"),
        Asset("PKGREF", "anim/dynamic/custom_beebox_house.dyn"),
    },
    base_prefab = "beebox" ,
    build_name_override = "custom_beebox_house" ,
    init_fn = function(inst) beebox_init_fn(inst, "custom_beebox_house") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "BEEBOX", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_beebox_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_beebox_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_beebox_victorian.dyn"),
    },
    base_prefab = "beebox" ,
    build_name_override = "custom_beebox_victorian" ,
    init_fn = function(inst) beebox_init_fn(inst, "custom_beebox_victorian") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "VICTORIAN", "BEEBOX", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_beefalohat_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_beefalohat_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_beefalohat_fantasy.dyn"),
    },
    base_prefab = "beefalohat" ,
    build_name_override = "custom_beefalohat_fantasy" ,
    init_fn = function(inst) beefalohat_init_fn(inst, "custom_beefalohat_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BEEFALOHAT", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_beefalohat_klaus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_beefalohat_klaus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_beefalohat_klaus.dyn"),
    },
    base_prefab = "beefalohat" ,
    build_name_override = "custom_beefalohat_klaus" ,
    init_fn = function(inst) beefalohat_init_fn(inst, "custom_beefalohat_klaus") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "BEEFALOHAT", "WINTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_beefalohat_pigking",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_beefalohat_pigking.zip"),
        Asset("PKGREF", "anim/dynamic/custom_beefalohat_pigking.dyn"),
    },
    base_prefab = "beefalohat" ,
    build_name_override = "custom_beefalohat_pigking" ,
    init_fn = function(inst) beefalohat_init_fn(inst, "custom_beefalohat_pigking") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "BEEFALOHAT", "YOTP", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_beehat_garden",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_beehat_garden.zip"),
        Asset("PKGREF", "anim/dynamic/custom_beehat_garden.dyn"),
    },
    base_prefab = "beehat" ,
    build_name_override = "custom_beehat_garden" ,
    init_fn = function(inst) beehat_init_fn(inst, "custom_beehat_garden") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "COTTAGE", "BEEHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_beehat_mourning",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_beehat_mourning.zip"),
        Asset("PKGREF", "anim/dynamic/custom_beehat_mourning.dyn"),
    },
    base_prefab = "beehat" ,
    build_name_override = "custom_beehat_mourning" ,
    init_fn = function(inst) beehat_init_fn(inst, "custom_beehat_mourning") end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "BEEHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_beehat_sunhat",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_beehat_sunhat.zip"),
        Asset("PKGREF", "anim/dynamic/custom_beehat_sunhat.dyn"),
    },
    base_prefab = "beehat" ,
    build_name_override = "custom_beehat_sunhat" ,
    init_fn = function(inst) beehat_init_fn(inst, "custom_beehat_sunhat") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BEEHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_beemine_heart",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_beemine_heart.zip"),
        Asset("PKGREF", "anim/dynamic/custom_beemine_heart.dyn"),
    },
    base_prefab = "beemine" ,
    build_name_override = "custom_beemine_heart" ,
    init_fn = function(inst) beemine_init_fn(inst, "custom_beemine_heart") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "BEEMINE", "HEART", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_beemine_jamjar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_beemine_jamjar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_beemine_jamjar.dyn"),
    },
    base_prefab = "beemine" ,
    build_name_override = "custom_beemine_jamjar" ,
    init_fn = function(inst) beemine_init_fn(inst, "custom_beemine_jamjar") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BEEMINE", "YOTP", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bernie_cat",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bernie_cat.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bernie_cat.dyn"),
    },
    base_prefab = "bernie_inactive" ,
    build_name_override = "custom_bernie_cat" ,
    granted_items = { "custom_bernie_cat_lunar_build" , "custom_bernie_cat_shadow_build" , },
    init_fn = function(inst) bernie_inactive_init_fn(inst, "custom_bernie_cat") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BERNIE", "HAUNTEDDOLL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bernie_cat_active",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bernie_cat.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bernie_cat.dyn"),
    },
    base_prefab = "bernie_active" ,
    build_name_override = "custom_bernie_cat" ,
    init_fn = function(inst) bernie_active_init_fn(inst, "custom_bernie_cat") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bernie_cat_big",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bernie_cat.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bernie_cat.dyn"),
    },
    base_prefab = "bernie_big" ,
    build_name_override = "custom_bernie_cat" ,
    init_fn = function(inst) bernie_big_init_fn(inst, "custom_bernie_cat") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bernie_cat_lunar_build",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bernie_cat_lunar_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bernie_cat_lunar_build.dyn"),
    },
    base_prefab = "bernie_big" ,
    build_name_override = "custom_bernie_cat" ,
    init_fn = function(inst) bernie_big_init_fn(inst, "custom_bernie_cat") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bernie_cat_shadow_build",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bernie_cat_shadow_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bernie_cat_shadow_build.dyn"),
    },
    base_prefab = "bernie_big" ,
    build_name_override = "custom_bernie_cat" ,
    init_fn = function(inst) bernie_big_init_fn(inst, "custom_bernie_cat") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bernie_dog",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bernie_dog.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bernie_dog.dyn"),
    },
    base_prefab = "bernie_inactive" ,
    build_name_override = "custom_bernie_dog" ,
    granted_items = { "custom_bernie_dog_lunar_build" , "custom_bernie_dog_shadow_build" , },
    init_fn = function(inst) bernie_inactive_init_fn(inst, "custom_bernie_dog") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BERNIE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bernie_dog_active",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bernie_dog.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bernie_dog.dyn"),
    },
    base_prefab = "bernie_active" ,
    build_name_override = "custom_bernie_dog" ,
    init_fn = function(inst) bernie_active_init_fn(inst, "custom_bernie_dog") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bernie_dog_big",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bernie_dog.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bernie_dog.dyn"),
    },
    base_prefab = "bernie_big" ,
    build_name_override = "custom_bernie_dog" ,
    init_fn = function(inst) bernie_big_init_fn(inst, "custom_bernie_dog") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bernie_dog_lunar_build",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bernie_dog_lunar_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bernie_dog_lunar_build.dyn"),
    },
    base_prefab = "bernie_big" ,
    build_name_override = "custom_bernie_dog" ,
    init_fn = function(inst) bernie_big_init_fn(inst, "custom_bernie_dog") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bernie_dog_shadow_build",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bernie_dog_shadow_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bernie_dog_shadow_build.dyn"),
    },
    base_prefab = "bernie_big" ,
    build_name_override = "custom_bernie_dog" ,
    init_fn = function(inst) bernie_big_init_fn(inst, "custom_bernie_dog") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_birdcage_adventure",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_birdcage_adventure.zip"),
        Asset("PKGREF", "anim/dynamic/custom_birdcage_adventure.dyn"),
    },
    base_prefab = "birdcage" ,
    build_name_override = "custom_birdcage_adventure" ,
    init_fn = function(inst) birdcage_init_fn(inst, "custom_birdcage_adventure") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ADVENTURE", "BIRDCAGE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_birdcage_circus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_birdcage_circus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_birdcage_circus.dyn"),
    },
    base_prefab = "birdcage" ,
    build_name_override = "custom_birdcage_circus" ,
    init_fn = function(inst) birdcage_init_fn(inst, "custom_birdcage_circus") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "BIRDCAGE", "CIRCUS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_birdcage_curly",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_birdcage_curly.zip"),
        Asset("PKGREF", "anim/dynamic/custom_birdcage_curly.dyn"),
    },
    base_prefab = "birdcage" ,
    build_name_override = "custom_birdcage_curly" ,
    init_fn = function(inst) birdcage_init_fn(inst, "custom_birdcage_curly") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "BIRDCAGE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_birdcage_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_birdcage_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_birdcage_gothic.dyn"),
    },
    base_prefab = "birdcage" ,
    build_name_override = "custom_birdcage_gothic" ,
    init_fn = function(inst) birdcage_init_fn(inst, "custom_birdcage_gothic") end,
    marketable = true,
    rarity = "HeirloomDistinguished",
    release_group = groupid,
    skin_tags = { "BIRDCAGE", "COSTUME", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_birdcage_ornamental",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_birdcage_ornamental.zip"),
        Asset("PKGREF", "anim/dynamic/custom_birdcage_ornamental.dyn"),
    },
    base_prefab = "birdcage" ,
    build_name_override = "custom_birdcage_ornamental" ,
    init_fn = function(inst) birdcage_init_fn(inst, "custom_birdcage_ornamental") end,
    marketable = true,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { "BIRDCAGE", "WINTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_birdcage_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_birdcage_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_birdcage_pirate.dyn"),
    },
    base_prefab = "birdcage" ,
    build_name_override = "custom_birdcage_pirate" ,
    init_fn = function(inst) birdcage_init_fn(inst, "custom_birdcage_pirate") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "BIRDCAGE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_birdcage_romantic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_birdcage_romantic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_birdcage_romantic.dyn"),
    },
    base_prefab = "birdcage" ,
    build_name_override = "custom_birdcage_romantic" ,
    init_fn = function(inst) birdcage_init_fn(inst, "custom_birdcage_romantic") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BIRDCAGE", "HEART", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_birdtrap_an",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_birdtrap_an.zip"),
        Asset("PKGREF", "anim/dynamic/custom_birdtrap_an.dyn"),
    },
    base_prefab = "birdtrap" ,
    build_name_override = "custom_birdtrap_an" ,
    init_fn = function(inst) birdtrap_init_fn(inst, "custom_birdtrap_an") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BIRDTRAP", "ARTNOUVEAU", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_boat_grass_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_boat_grass_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_boat_grass_pirate.dyn"),
    },
    base_prefab = "boat_grass" ,
    build_name_override = "custom_boat_grass_pirate" ,
    granted_items = { "custom_walkingplank_grass_pirate" , },
    init_fn = function(inst) boat_grass_init_fn(inst, "custom_boat_grass_pirate") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BOAT_GRASS", "PIRATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_boat_grass_pirate_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_boat_grass_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_boat_grass_pirate.dyn"),
    },
    base_prefab = "boat_grass_item" ,
    build_name_override = "custom_boat_grass_pirate" ,
    init_fn = function(inst) boat_grass_item_init_fn(inst, "custom_boat_grass_pirate") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_boat_nautical",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_boat_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_boat_nautical.dyn"),
    },
    base_prefab = "boat" ,
    build_name_override = "custom_boat_nautical" ,
    granted_items = { "custom_walkingplank_nautical" , },
    init_fn = function(inst) boat_init_fn(inst, "custom_boat_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "BOAT", "NAUTICAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_boat_nautical_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_boat_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_boat_nautical.dyn"),
    },
    base_prefab = "boat_item" ,
    build_name_override = "custom_boat_nautical" ,
    init_fn = function(inst) boat_item_init_fn(inst, "custom_boat_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_boat_pirate_skin",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_boat_pirate_skin.zip"),
        Asset("PKGREF", "anim/dynamic/custom_boat_pirate_skin.dyn"),
    },
    base_prefab = "boat" ,
    build_name_override = "custom_boat_pirate_skin" ,
    granted_items = { "custom_walkingplank_pirate_skin" , },
    init_fn = function(inst) boat_init_fn(inst, "custom_boat_pirate_skin") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BOAT", "PIRATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_boat_pirate_skin_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_boat_pirate_skin.zip"),
        Asset("PKGREF", "anim/dynamic/custom_boat_pirate_skin.dyn"),
    },
    base_prefab = "boat_item" ,
    build_name_override = "custom_boat_pirate_skin" ,
    init_fn = function(inst) boat_item_init_fn(inst, "custom_boat_pirate_skin") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_boat_wagstaff",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_boat_wagstaff.zip"),
        Asset("PKGREF", "anim/dynamic/custom_boat_wagstaff.dyn"),
    },
    base_prefab = "boat" ,
    build_name_override = "custom_boat_wagstaff" ,
    granted_items = { "custom_walkingplank_wagstaff" , },
    init_fn = function(inst) boat_init_fn(inst, "custom_boat_wagstaff") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BOAT", "WAGSTAFF", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_boat_wagstaff_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_boat_wagstaff.zip"),
        Asset("PKGREF", "anim/dynamic/custom_boat_wagstaff.dyn"),
    },
    base_prefab = "boat_item" ,
    build_name_override = "custom_boat_wagstaff" ,
    init_fn = function(inst) boat_item_init_fn(inst, "custom_boat_wagstaff") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_book_brimstone_gilded",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_book_brimstone_gilded.zip"),
        Asset("PKGREF", "anim/dynamic/custom_book_brimstone_gilded.dyn"),
    },
    base_prefab = "book_brimstone" ,
    build_name_override = "custom_book_brimstone_gilded" ,
    init_fn = function(inst) book_brimstone_init_fn(inst, "custom_book_brimstone_gilded") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BOOK_BRIMSTONE", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_book_research_station_howto",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_book_research_station_howto.zip"),
        Asset("PKGREF", "anim/dynamic/custom_book_research_station_howto.dyn"),
    },
    base_prefab = "book_research_station" ,
    build_name_override = "custom_book_research_station_howto" ,
    init_fn = function(inst) book_research_station_init_fn(inst, "custom_book_research_station_howto") end,
    rarity = "Spiffy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BOOK_RESEARCH_STATION", "FOOLS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_book_silviculture_livinglog",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_book_silviculture_livinglog.zip"),
        Asset("PKGREF", "anim/dynamic/custom_book_silviculture_livinglog.dyn"),
    },
    base_prefab = "book_silviculture" ,
    build_name_override = "custom_book_silviculture_livinglog" ,
    init_fn = function(inst) book_silviculture_init_fn(inst, "custom_book_silviculture_livinglog") end,
    rarity = "Spiffy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BOOK_SILVICULTURE", "FOOLS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_book_sleep_magazine",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_book_sleep_magazine.zip"),
        Asset("PKGREF", "anim/dynamic/custom_book_sleep_magazine.dyn"),
    },
    base_prefab = "book_sleep" ,
    build_name_override = "custom_book_sleep_magazine" ,
    init_fn = function(inst) book_sleep_init_fn(inst, "custom_book_sleep_magazine") end,
    rarity = "Spiffy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BOOK_SLEEP", "FOOLS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_book_temperature_romance",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_book_temperature_romance.zip"),
        Asset("PKGREF", "anim/dynamic/custom_book_temperature_romance.dyn"),
    },
    base_prefab = "book_temperature" ,
    build_name_override = "custom_book_temperature_romance" ,
    init_fn = function(inst) book_temperature_init_fn(inst, "custom_book_temperature_romance") end,
    rarity = "Spiffy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BOOK_TEMPERATURE", "FOOLS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_book_web_tallbird",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_book_web_tallbird.zip"),
        Asset("PKGREF", "anim/dynamic/custom_book_web_tallbird.dyn"),
    },
    base_prefab = "book_web" ,
    build_name_override = "custom_book_web_tallbird" ,
    init_fn = function(inst) book_web_init_fn(inst, "custom_book_web_tallbird") end,
    rarity = "Spiffy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BOOK_WEB", "FOOLS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_boomerang_bananarang",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_boomerang_bananarang.zip"),
        Asset("PKGREF", "anim/dynamic/custom_boomerang_bananarang.dyn"),
    },
    base_prefab = "boomerang" ,
    build_name_override = "custom_boomerang_bananarang" ,
    init_fn = function(inst) boomerang_init_fn(inst, "custom_boomerang_bananarang") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BOOMERANG", "CRAFTABLE", "T_UPDATE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_boomerang_tiger",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_boomerang_tiger.zip"),
        Asset("PKGREF", "anim/dynamic/custom_boomerang_tiger.dyn"),
    },
    base_prefab = "boomerang" ,
    build_name_override = "custom_boomerang_tiger" ,
    init_fn = function(inst) boomerang_init_fn(inst, "custom_boomerang_tiger") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BOOMERANG", "CRAFTABLE", "YOTP", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bugnet_frog",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bugnet_frog.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bugnet_frog.dyn"),
    },
    base_prefab = "bugnet" ,
    build_name_override = "custom_bugnet_frog" ,
    init_fn = function(inst) bugnet_init_fn(inst, "custom_bugnet_frog") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_sound = { ["net"] = "dontstarve/frog/attack_voice", },
    skin_tags = { "BUGNET", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bugnet_garden",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bugnet_garden.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bugnet_garden.dyn"),
    },
    base_prefab = "bugnet" ,
    build_name_override = "custom_bugnet_garden" ,
    init_fn = function(inst) bugnet_init_fn(inst, "custom_bugnet_garden") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "COTTAGE", "BUGNET", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bugnet_lavaproof",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bugnet_lavaproof.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bugnet_lavaproof.dyn"),
    },
    base_prefab = "bugnet" ,
    build_name_override = "custom_bugnet_lavaproof" ,
    init_fn = function(inst) bugnet_init_fn(inst, "custom_bugnet_lavaproof") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_sound = { ["net"] = "terraria1/skins/weapon_whoosh", },
    skin_tags = { "BUGNET", "CRAFTABLE", "T_UPDATE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bugnet_spider",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bugnet_spider.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bugnet_spider.dyn"),
    },
    base_prefab = "bugnet" ,
    build_name_override = "custom_bugnet_spider" ,
    init_fn = function(inst) bugnet_init_fn(inst, "custom_bugnet_spider") end,
    rarity = "ProofOfPurchase",
    release_group = groupid,
    skin_sound = { ["net"] = "dontstarve/creatures/spider/attack_grunt", },
    skin_tags = { "BUGNET", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bugnet_spider_white",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bugnet_spider_white.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bugnet_spider_white.dyn"),
    },
    base_prefab = "bugnet" ,
    build_name_override = "custom_bugnet_spider_white" ,
    init_fn = function(inst) bugnet_init_fn(inst, "custom_bugnet_spider_white") end,
    rarity = "ProofOfPurchase",
    release_group = groupid,
    skin_sound = { ["net"] = "dontstarve/creatures/spider/attack_grunt", },
    skin_tags = { "BUGNET", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bundle_cawnival",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bundle_cawnival.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bundle_cawnival.dyn"),
    },
    base_prefab = "bundle" ,
    build_name_override = "custom_bundle_cawnival" ,
    granted_items = { "custom_bundlewrap_cawnival" , },
    init_fn = function(inst) bundle_init_fn(inst, "custom_bundle_cawnival") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BUNDLE", "CAWNIVAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bundle_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bundle_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bundle_gothic.dyn"),
    },
    base_prefab = "bundle" ,
    build_name_override = "custom_bundle_gothic" ,
    granted_items = { "custom_bundlewrap_gothic" , },
    init_fn = function(inst) bundle_init_fn(inst, "custom_bundle_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BUNDLE", "GOTHIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bundle_kitchen",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bundle_kitchen.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bundle_kitchen.dyn"),
    },
    base_prefab = "bundle" ,
    build_name_override = "custom_bundle_kitchen" ,
    granted_items = { "custom_bundlewrap_kitchen" , },
    init_fn = function(inst) bundle_init_fn(inst, "custom_bundle_kitchen") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BUNDLE", "COTTAGE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bundle_vintage",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bundle_vintage.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bundle_vintage.dyn"),
    },
    base_prefab = "bundle" ,
    build_name_override = "custom_bundle_vintage" ,
    granted_items = { "custom_bundlewrap_vintage" , },
    init_fn = function(inst) bundle_init_fn(inst, "custom_bundle_vintage") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BUNDLE", "COTTAGE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bundlewrap_cawnival",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bundle_cawnival.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bundle_cawnival.dyn"),
    },
    base_prefab = "bundlewrap" ,
    build_name_override = "custom_bundle_cawnival" ,
    init_fn = function(inst) bundlewrap_init_fn(inst, "custom_bundle_cawnival") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bundlewrap_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bundle_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bundle_gothic.dyn"),
    },
    base_prefab = "bundlewrap" ,
    build_name_override = "custom_bundle_gothic" ,
    init_fn = function(inst) bundlewrap_init_fn(inst, "custom_bundle_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bundlewrap_kitchen",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bundle_kitchen.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bundle_kitchen.dyn"),
    },
    base_prefab = "bundlewrap" ,
    build_name_override = "custom_bundle_kitchen" ,
    init_fn = function(inst) bundlewrap_init_fn(inst, "custom_bundle_kitchen") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bundlewrap_vintage",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bundle_vintage.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bundle_vintage.dyn"),
    },
    base_prefab = "bundlewrap" ,
    build_name_override = "custom_bundle_vintage" ,
    init_fn = function(inst) bundlewrap_init_fn(inst, "custom_bundle_vintage") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_bushhat_cawnival",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_bushhat_cawnival.zip"),
        Asset("PKGREF", "anim/dynamic/custom_bushhat_cawnival.dyn"),
    },
    base_prefab = "bushhat" ,
    build_name_override = "custom_bushhat_cawnival" ,
    fx_prefab = { "carnival_sparkle_bush", },
    init_fn = function(inst) bushhat_init_fn(inst, "custom_bushhat_cawnival") end,
    prefabs = { "carnival_sparkle_bush", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BUSHHAT", "CAWNIVAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_campfire_cabin",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_campfire_cabin.zip"),
        Asset("PKGREF", "anim/dynamic/custom_campfire_cabin.dyn"),
    },
    base_prefab = "campfire" ,
    build_name_override = "custom_campfire_cabin" ,
    init_fn = function(inst) campfire_init_fn(inst, "custom_campfire_cabin", Vector3(0, 0.25, 0)) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "CAMPFIRE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cane_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cane_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cane_ancient.dyn"),
    },
    base_prefab = "cane" ,
    build_name_override = "custom_cane_ancient" ,
    fx_prefab = { "", "cane_ancient_fx", },
    granted_items = { "custom_orangestaff_ancient" , },
    init_fn = function(inst) cane_init_fn(inst, "custom_cane_ancient") end,
    prefabs = { "cane_ancient_fx", },
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "CANE", "ANCIENT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cane_candycane",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cane_candycane.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cane_candycane.dyn"),
    },
    base_prefab = "cane" ,
    build_name_override = "custom_cane_candycane" ,
    fx_prefab = { "cane_candy_fx", },
    granted_items = { "custom_orangestaff_candycane" , },
    init_fn = function(inst) cane_init_fn(inst, "custom_cane_candycane") end,
    prefabs = { "cane_candy_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CANE", "YULE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cane_harlequin",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cane_harlequin.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cane_harlequin.dyn"),
    },
    base_prefab = "cane" ,
    build_name_override = "custom_cane_harlequin" ,
    fx_prefab = { "cane_harlequin_fx", },
    granted_items = { "custom_orangestaff_harlequin" , },
    init_fn = function(inst) cane_init_fn(inst, "custom_cane_harlequin") end,
    prefabs = { "cane_harlequin_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CANE", "FOOLS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cane_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cane_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cane_rose.dyn"),
    },
    base_prefab = "cane" ,
    build_name_override = "custom_cane_rose" ,
    fx_prefab = { "cane_rose_fx", },
    granted_items = { "custom_orangestaff_rose" , },
    init_fn = function(inst) cane_init_fn(inst, "custom_cane_rose") end,
    prefabs = { "cane_rose_fx", },
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "CANE", "ROSE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cane_sharp",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cane_sharp.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cane_sharp.dyn"),
    },
    base_prefab = "cane" ,
    build_name_override = "custom_cane_sharp" ,
    fx_prefab = { "cane_sharp_fx", },
    granted_items = { "custom_orangestaff_sharp" , },
    init_fn = function(inst) cane_init_fn(inst, "custom_cane_sharp") end,
    prefabs = { "cane_sharp_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "CANE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cane_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cane_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cane_victorian.dyn"),
    },
    base_prefab = "cane" ,
    build_name_override = "custom_cane_victorian" ,
    fx_prefab = { "cane_victorian_fx", },
    granted_items = { "custom_orangestaff_victorian" , },
    init_fn = function(inst) cane_init_fn(inst, "custom_cane_victorian") end,
    prefabs = { "cane_victorian_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CANE", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_catcoonhat_trapper_rooster",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_catcoonhat_trapper_rooster.zip"),
        Asset("PKGREF", "anim/dynamic/custom_catcoonhat_trapper_rooster.dyn"),
    },
    base_prefab = "catcoonhat" ,
    build_name_override = "custom_catcoonhat_trapper_rooster" ,
    init_fn = function(inst) catcoonhat_init_fn(inst, "custom_catcoonhat_trapper_rooster") end,
    marketable = true,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { "CATCOONHAT", "LUNAR_NY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_catcoonhat_trapperup_rooster",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_catcoonhat_trapperup_rooster.zip"),
        Asset("PKGREF", "anim/dynamic/custom_catcoonhat_trapperup_rooster.dyn"),
    },
    base_prefab = "catcoonhat" ,
    build_name_override = "custom_catcoonhat_trapperup_rooster" ,
    init_fn = function(inst) catcoonhat_init_fn(inst, "custom_catcoonhat_trapperup_rooster") end,
    marketable = true,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { "CATCOONHAT", "LUNAR_NY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cave_entrance_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cave_entrance_open_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cave_entrance_open_fantasy.dyn"),
    },
    base_prefab = "cave_entrance" ,
    build_name_override = "custom_cave_entrance_open_fantasy" ,
    init_fn = function(inst) cave_entrance_init_fn(inst, "custom_cave_entrance_open_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cave_entrance_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cave_entrance_open_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cave_entrance_open_gothic.dyn"),
    },
    base_prefab = "cave_entrance" ,
    build_name_override = "custom_cave_entrance_open_gothic" ,
    init_fn = function(inst) cave_entrance_init_fn(inst, "custom_cave_entrance_open_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cave_entrance_open_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cave_entrance_open_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cave_entrance_open_fantasy.dyn"),
    },
    base_prefab = "cave_entrance_open" ,
    build_name_override = "custom_cave_entrance_open_fantasy" ,
    granted_items = { "custom_cave_exit_fantasy" , },
    init_fn = function(inst) cave_entrance_open_init_fn(inst, "custom_cave_entrance_open_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CAVE_ENTRANCE_OPEN", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cave_entrance_open_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cave_entrance_open_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cave_entrance_open_gothic.dyn"),
    },
    base_prefab = "cave_entrance_open" ,
    build_name_override = "custom_cave_entrance_open_gothic" ,
    granted_items = { "custom_cave_exit_gothic" , },
    init_fn = function(inst) cave_entrance_open_init_fn(inst, "custom_cave_entrance_open_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CAVE_ENTRANCE_OPEN", "GOTHIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cave_exit_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cave_exit_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cave_exit_fantasy.dyn"),
    },
    base_prefab = "cave_exit" ,
    build_name_override = "custom_cave_exit_fantasy" ,
    init_fn = function(inst) cave_exit_init_fn(inst, "custom_cave_exit_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cave_exit_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cave_exit_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cave_exit_gothic.dyn"),
    },
    base_prefab = "cave_exit" ,
    build_name_override = "custom_cave_exit_gothic" ,
    init_fn = function(inst) cave_exit_init_fn(inst, "custom_cave_exit_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cavein_boulder_kettlebell",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cavein_boulder_kettlebell.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cavein_boulder_kettlebell.dyn"),
    },
    base_prefab = "cavein_boulder" ,
    build_name_override = "custom_cavein_boulder_kettlebell" ,
    init_fn = function(inst) cavein_boulder_init_fn(inst, "custom_cavein_boulder_kettlebell") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "MIGHTY", "CAVEIN_BOULDER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_chair_stool_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_chair_stool_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_chair_stool_fantasy.dyn"),
    },
    base_prefab = "wood_stool" ,
    build_name_override = "custom_chair_stool_fantasy" ,
    init_fn = function(inst) wood_stool_init_fn(inst, "custom_chair_stool_fantasy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WOOD_STOOL", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_chair_stool_hallowed",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_chair_stool_hallowed.zip"),
        Asset("PKGREF", "anim/dynamic/custom_chair_stool_hallowed.dyn"),
    },
    base_prefab = "wood_stool" ,
    build_name_override = "custom_chair_stool_hallowed" ,
    init_fn = function(inst) wood_stool_init_fn(inst, "custom_chair_stool_hallowed") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WOOD_STOOL", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_chair_stool_handmade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_chair_stool_handmade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_chair_stool_handmade.dyn"),
    },
    base_prefab = "wood_stool" ,
    build_name_override = "custom_chair_stool_handmade" ,
    init_fn = function(inst) wood_stool_init_fn(inst, "custom_chair_stool_handmade") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WOOD_STOOL", "BUILDERS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_chair_stool_western",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_chair_stool_western.zip"),
        Asset("PKGREF", "anim/dynamic/custom_chair_stool_western.dyn"),
    },
    base_prefab = "wood_stool" ,
    build_name_override = "custom_chair_stool_western" ,
    init_fn = function(inst) wood_stool_init_fn(inst, "custom_chair_stool_western") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WOOD_STOOL", "WESTERN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_chester_eyebone_horn",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_chester_horn.zip"),
        Asset("PKGREF", "anim/dynamic/custom_chester_horn.dyn"),
    },
    base_prefab = "chester_eyebone" ,
    build_name_override = "custom_chester_horn" ,
    init_fn = function(inst) chester_eyebone_init_fn(inst, "custom_chester_horn") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_chester_eyebone_lamb",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_chester_lamb.zip"),
        Asset("PKGREF", "anim/dynamic/custom_chester_lamb.dyn"),
    },
    base_prefab = "chester_eyebone" ,
    build_name_override = "custom_chester_lamb" ,
    init_fn = function(inst) chester_eyebone_init_fn(inst, "custom_chester_lamb") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_chester_eyebone_walrus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_chester_walrus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_chester_walrus.dyn"),
    },
    base_prefab = "chester_eyebone" ,
    build_name_override = "custom_chester_walrus" ,
    init_fn = function(inst) chester_eyebone_init_fn(inst, "custom_chester_walrus") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_chester_horn",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_chester_horn.zip"),
        Asset("PKGREF", "anim/dynamic/custom_chester_horn.dyn"),
    },
    base_prefab = "chester" ,
    build_name_override = "custom_chester_horn" ,
    granted_items = { "custom_chester_eyebone_horn" , },
    init_fn = function(inst) chester_init_fn(inst, "custom_chester_horn") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CHESTER", "ADVENTURE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_chester_lamb",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_chester_lamb.zip"),
        Asset("PKGREF", "anim/dynamic/custom_chester_lamb.dyn"),
    },
    base_prefab = "chester" ,
    build_name_override = "custom_chester_lamb" ,
    granted_items = { "custom_chester_eyebone_lamb" , },
    init_fn = function(inst) chester_init_fn(inst, "custom_chester_lamb") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CHESTER", "COTTAGE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_chester_walrus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_chester_walrus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_chester_walrus.dyn"),
    },
    base_prefab = "chester" ,
    build_name_override = "custom_chester_walrus" ,
    granted_items = { "custom_chester_eyebone_walrus" , },
    init_fn = function(inst) chester_init_fn(inst, "custom_chester_walrus") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CHESTER", "SEASIDE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_coldfirepit_an",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_coldfirepit_an.zip"),
        Asset("PKGREF", "anim/dynamic/custom_coldfirepit_an.dyn"),
    },
    base_prefab = "coldfirepit" ,
    build_name_override = "custom_coldfirepit_an" ,
    init_fn = function(inst) coldfirepit_init_fn(inst, "custom_coldfirepit_an") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "COLDFIREPIT", "ARTNOUVEAU", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_coldfirepit_flower",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_coldfirepit_flower.zip"),
        Asset("PKGREF", "anim/dynamic/custom_coldfirepit_flower.dyn"),
    },
    base_prefab = "coldfirepit" ,
    build_name_override = "custom_coldfirepit_flower" ,
    init_fn = function(inst) coldfirepit_init_fn(inst, "custom_coldfirepit_flower", Vector3(0, 5, 0)) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "COLDFIREPIT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_coldfirepit_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_coldfirepit_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_coldfirepit_gothic.dyn"),
    },
    base_prefab = "coldfirepit" ,
    build_name_override = "custom_coldfirepit_gothic" ,
    init_fn = function(inst) coldfirepit_init_fn(inst, "custom_coldfirepit_gothic", Vector3(0, -30, 0)) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "COLDFIREPIT", "GOTHIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_coldfirepit_teeth",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_coldfirepit_teeth.zip"),
        Asset("PKGREF", "anim/dynamic/custom_coldfirepit_teeth.dyn"),
    },
    base_prefab = "coldfirepit" ,
    build_name_override = "custom_coldfirepit_teeth" ,
    init_fn = function(inst) coldfirepit_init_fn(inst, "custom_coldfirepit_teeth", Vector3(0, 5, 0)) end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "COLDFIREPIT", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cookpot_cauldron",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cookpot_cauldron.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cookpot_cauldron.dyn"),
    },
    base_prefab = "cookpot" ,
    build_name_override = "custom_cookpot_cauldron" ,
    init_fn = function(inst) cookpot_init_fn(inst, "custom_cookpot_cauldron") end,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    skin_tags = { "CROCKPOT", "COSTUME", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cookpot_clay",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cookpot_clay.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cookpot_clay.dyn"),
    },
    base_prefab = "cookpot" ,
    build_name_override = "custom_cookpot_clay" ,
    init_fn = function(inst) cookpot_init_fn(inst, "custom_cookpot_clay") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "CROCKPOT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cookpot_kitchen",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cookpot_kitchen.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cookpot_kitchen.dyn"),
    },
    base_prefab = "cookpot" ,
    build_name_override = "custom_cookpot_kitchen" ,
    init_fn = function(inst) cookpot_init_fn(inst, "custom_cookpot_kitchen") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "COTTAGE", "CROCKPOT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cookpot_survival",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cookpot_survival.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cookpot_survival.dyn"),
    },
    base_prefab = "cookpot" ,
    build_name_override = "custom_cookpot_survival" ,
    init_fn = function(inst) cookpot_init_fn(inst, "custom_cookpot_survival") end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "CROCKPOT", "SURVIVOR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cookpot_tureen",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cookpot_tureen.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cookpot_tureen.dyn"),
    },
    base_prefab = "cookpot" ,
    build_name_override = "custom_cookpot_tureen" ,
    init_fn = function(inst) cookpot_init_fn(inst, "custom_cookpot_tureen") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CROCKPOT", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_cowbell_round",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_cowbell_round.zip"),
        Asset("PKGREF", "anim/dynamic/custom_cowbell_round.dyn"),
    },
    base_prefab = "beef_bell" ,
    build_name_override = "custom_cowbell_round" ,
    init_fn = function(inst) beef_bell_init_fn(inst, "custom_cowbell_round") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BEEF_BELL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_critterlab_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_critterlab_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_critterlab_fantasy.dyn"),
    },
    base_prefab = "critterlab" ,
    build_name_override = "custom_critterlab_fantasy" ,
    init_fn = function(inst) critterlab_init_fn(inst, "custom_critterlab_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CRITTERLAB", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_critterlab_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_critterlab_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_critterlab_gothic.dyn"),
    },
    base_prefab = "critterlab" ,
    build_name_override = "custom_critterlab_gothic" ,
    init_fn = function(inst) critterlab_init_fn(inst, "custom_critterlab_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CRITTERLAB", "GOTHIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_centerpiece_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_centerpiece_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_centerpiece_fantasy.dyn"),
    },
    base_prefab = "decor_centerpiece" ,
    build_name_override = "custom_decor_centerpiece_fantasy" ,
    init_fn = function(inst) decor_centerpiece_init_fn(inst, "custom_decor_centerpiece_fantasy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_CENTERPIECE", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_centerpiece_hallowed",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_centerpiece_hallowed.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_centerpiece_hallowed.dyn"),
    },
    base_prefab = "decor_centerpiece" ,
    build_name_override = "custom_decor_centerpiece_hallowed" ,
    init_fn = function(inst) decor_centerpiece_init_fn(inst, "custom_decor_centerpiece_hallowed") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_CENTERPIECE", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_centerpiece_handmade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_centerpiece_handmade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_centerpiece_handmade.dyn"),
    },
    base_prefab = "decor_centerpiece" ,
    build_name_override = "custom_decor_centerpiece_handmade" ,
    init_fn = function(inst) decor_centerpiece_init_fn(inst, "custom_decor_centerpiece_handmade") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_CENTERPIECE", "BUILDERS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_centerpiece_western",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_centerpiece_western.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_centerpiece_western.dyn"),
    },
    base_prefab = "decor_centerpiece" ,
    build_name_override = "custom_decor_centerpiece_western" ,
    init_fn = function(inst) decor_centerpiece_init_fn(inst, "custom_decor_centerpiece_western") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_CENTERPIECE", "WESTERN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_flowervase_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_flowervase_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_flowervase_fantasy.dyn"),
    },
    base_prefab = "decor_flowervase" ,
    build_name_override = "custom_decor_flowervase_fantasy" ,
    init_fn = function(inst) decor_flowervase_init_fn(inst, "custom_decor_flowervase_fantasy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_FLOWERVASE", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_flowervase_hallowed",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_flowervase_hallowed.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_flowervase_hallowed.dyn"),
    },
    base_prefab = "decor_flowervase" ,
    build_name_override = "custom_decor_flowervase_hallowed" ,
    init_fn = function(inst) decor_flowervase_init_fn(inst, "custom_decor_flowervase_hallowed") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_FLOWERVASE", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_flowervase_handmade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_flowervase_handmade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_flowervase_handmade.dyn"),
    },
    base_prefab = "decor_flowervase" ,
    build_name_override = "custom_decor_flowervase_handmade" ,
    init_fn = function(inst) decor_flowervase_init_fn(inst, "custom_decor_flowervase_handmade") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_FLOWERVASE", "BUILDERS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_flowervase_western",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_flowervase_western.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_flowervase_western.dyn"),
    },
    base_prefab = "decor_flowervase" ,
    build_name_override = "custom_decor_flowervase_western" ,
    init_fn = function(inst) decor_flowervase_init_fn(inst, "custom_decor_flowervase_western") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_FLOWERVASE", "WESTERN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_lamp_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_lamp_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_lamp_fantasy.dyn"),
    },
    base_prefab = "decor_lamp" ,
    build_name_override = "custom_decor_lamp_fantasy" ,
    init_fn = function(inst) decor_lamp_init_fn(inst, "custom_decor_lamp_fantasy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_LAMP", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_lamp_hallowed",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_lamp_hallowed.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_lamp_hallowed.dyn"),
    },
    base_prefab = "decor_lamp" ,
    build_name_override = "custom_decor_lamp_hallowed" ,
    init_fn = function(inst) decor_lamp_init_fn(inst, "custom_decor_lamp_hallowed") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_LAMP", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_lamp_handmade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_lamp_handmade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_lamp_handmade.dyn"),
    },
    base_prefab = "decor_lamp" ,
    build_name_override = "custom_decor_lamp_handmade" ,
    init_fn = function(inst) decor_lamp_init_fn(inst, "custom_decor_lamp_handmade") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_LAMP", "BUILDERS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_lamp_western",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_lamp_western.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_lamp_western.dyn"),
    },
    base_prefab = "decor_lamp" ,
    build_name_override = "custom_decor_lamp_western" ,
    init_fn = function(inst) decor_lamp_init_fn(inst, "custom_decor_lamp_western") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_LAMP", "WESTERN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_phonograph_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_phonograph_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_phonograph_fantasy.dyn"),
    },
    base_prefab = "phonograph" ,
    build_name_override = "custom_decor_phonograph_fantasy" ,
    init_fn = function(inst) phonograph_init_fn(inst, "custom_decor_phonograph_fantasy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PHONOGRAPH", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_phonograph_hallowed",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_phonograph_hallowed.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_phonograph_hallowed.dyn"),
    },
    base_prefab = "phonograph" ,
    build_name_override = "custom_decor_phonograph_hallowed" ,
    init_fn = function(inst) phonograph_init_fn(inst, "custom_decor_phonograph_hallowed") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PHONOGRAPH", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_phonograph_handmade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_phonograph_handmade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_phonograph_handmade.dyn"),
    },
    base_prefab = "phonograph" ,
    build_name_override = "custom_decor_phonograph_handmade" ,
    init_fn = function(inst) phonograph_init_fn(inst, "custom_decor_phonograph_handmade") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PHONOGRAPH", "BUILDERS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_phonograph_western",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_phonograph_western.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_phonograph_western.dyn"),
    },
    base_prefab = "phonograph" ,
    build_name_override = "custom_decor_phonograph_western" ,
    init_fn = function(inst) phonograph_init_fn(inst, "custom_decor_phonograph_western") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PHONOGRAPH", "WESTERN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_pictureframe_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_pictureframe_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_pictureframe_fantasy.dyn"),
    },
    base_prefab = "decor_pictureframe" ,
    build_name_override = "custom_decor_pictureframe_fantasy" ,
    init_fn = function(inst) decor_pictureframe_init_fn(inst, "custom_decor_pictureframe_fantasy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_PICTUREFRAME", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_pictureframe_hallowed",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_pictureframe_hallowed.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_pictureframe_hallowed.dyn"),
    },
    base_prefab = "decor_pictureframe" ,
    build_name_override = "custom_decor_pictureframe_hallowed" ,
    init_fn = function(inst) decor_pictureframe_init_fn(inst, "custom_decor_pictureframe_hallowed") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_PICTUREFRAME", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_pictureframe_handmade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_pictureframe_handmade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_pictureframe_handmade.dyn"),
    },
    base_prefab = "decor_pictureframe" ,
    build_name_override = "custom_decor_pictureframe_handmade" ,
    init_fn = function(inst) decor_pictureframe_init_fn(inst, "custom_decor_pictureframe_handmade") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_PICTUREFRAME", "BUILDERS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_pictureframe_western",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_pictureframe_western.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_pictureframe_western.dyn"),
    },
    base_prefab = "decor_pictureframe" ,
    build_name_override = "custom_decor_pictureframe_western" ,
    init_fn = function(inst) decor_pictureframe_init_fn(inst, "custom_decor_pictureframe_western") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_PICTUREFRAME", "WESTERN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_portraitframe_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_portraitframe_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_portraitframe_fantasy.dyn"),
    },
    base_prefab = "decor_portraitframe" ,
    build_name_override = "custom_decor_portraitframe_fantasy" ,
    init_fn = function(inst) decor_portraitframe_init_fn(inst, "custom_decor_portraitframe_fantasy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_PORTRAITFRAME", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_portraitframe_hallowed",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_portraitframe_hallowed.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_portraitframe_hallowed.dyn"),
    },
    base_prefab = "decor_portraitframe" ,
    build_name_override = "custom_decor_portraitframe_hallowed" ,
    init_fn = function(inst) decor_portraitframe_init_fn(inst, "custom_decor_portraitframe_hallowed") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_PORTRAITFRAME", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_portraitframe_handmade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_portraitframe_handmade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_portraitframe_handmade.dyn"),
    },
    base_prefab = "decor_portraitframe" ,
    build_name_override = "custom_decor_portraitframe_handmade" ,
    init_fn = function(inst) decor_portraitframe_init_fn(inst, "custom_decor_portraitframe_handmade") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_PORTRAITFRAME", "BUILDERS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_decor_portraitframe_western",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_decor_portraitframe_western.zip"),
        Asset("PKGREF", "anim/dynamic/custom_decor_portraitframe_western.dyn"),
    },
    base_prefab = "decor_portraitframe" ,
    build_name_override = "custom_decor_portraitframe_western" ,
    init_fn = function(inst) decor_portraitframe_init_fn(inst, "custom_decor_portraitframe_western") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DECOR_PORTRAITFRAME", "WESTERN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_deserthat_fedora",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_deserthat_fedora.zip"),
        Asset("PKGREF", "anim/dynamic/custom_deserthat_fedora.dyn"),
    },
    base_prefab = "deserthat" ,
    build_name_override = "custom_deserthat_fedora" ,
    granted_items = { "custom_goggleshat_fedora" , },
    init_fn = function(inst) deserthat_init_fn(inst, "custom_deserthat_fedora") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DESERTHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dock_woodposts_carved",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dock_woodposts_carved.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dock_woodposts_carved.dyn"),
    },
    base_prefab = "dock_woodposts" ,
    build_name_override = "custom_dock_woodposts_carved" ,
    init_fn = function(inst) dock_woodposts_init_fn(inst, "custom_dock_woodposts_carved") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DOCK_WOODPOSTS", "BUILDERS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dock_woodposts_carved2",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dock_woodposts_carved2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dock_woodposts_carved2.dyn"),
    },
    base_prefab = "dock_woodposts" ,
    build_name_override = "custom_dock_woodposts_carved2" ,
    init_fn = function(inst) dock_woodposts_init_fn(inst, "custom_dock_woodposts_carved2") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DOCK_WOODPOSTS", "BUILDERS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dock_woodposts_carved2_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dock_woodposts_carved2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dock_woodposts_carved2.dyn"),
    },
    base_prefab = "dock_woodposts_item" ,
    build_name_override = "custom_dock_woodposts_carved2" ,
    init_fn = function(inst) dock_woodposts_item_init_fn(inst, "custom_dock_woodposts_carved2") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dock_woodposts_carved3",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dock_woodposts_carved3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dock_woodposts_carved3.dyn"),
    },
    base_prefab = "dock_woodposts" ,
    build_name_override = "custom_dock_woodposts_carved3" ,
    init_fn = function(inst) dock_woodposts_init_fn(inst, "custom_dock_woodposts_carved3") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DOCK_WOODPOSTS", "BUILDERS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dock_woodposts_carved3_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dock_woodposts_carved3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dock_woodposts_carved3.dyn"),
    },
    base_prefab = "dock_woodposts_item" ,
    build_name_override = "custom_dock_woodposts_carved3" ,
    init_fn = function(inst) dock_woodposts_item_init_fn(inst, "custom_dock_woodposts_carved3") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dock_woodposts_carved_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dock_woodposts_carved.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dock_woodposts_carved.dyn"),
    },
    base_prefab = "dock_woodposts_item" ,
    build_name_override = "custom_dock_woodposts_carved" ,
    init_fn = function(inst) dock_woodposts_item_init_fn(inst, "custom_dock_woodposts_carved") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dock_woodposts_decorated",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dock_woodposts_decorated.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dock_woodposts_decorated.dyn"),
    },
    base_prefab = "dock_woodposts" ,
    build_name_override = "custom_dock_woodposts_decorated" ,
    init_fn = function(inst) dock_woodposts_init_fn(inst, "custom_dock_woodposts_decorated") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DOCK_WOODPOSTS", "BUILDERS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dock_woodposts_decorated2",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dock_woodposts_decorated2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dock_woodposts_decorated2.dyn"),
    },
    base_prefab = "dock_woodposts" ,
    build_name_override = "custom_dock_woodposts_decorated2" ,
    init_fn = function(inst) dock_woodposts_init_fn(inst, "custom_dock_woodposts_decorated2") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DOCK_WOODPOSTS", "BUILDERS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dock_woodposts_decorated2_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dock_woodposts_decorated2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dock_woodposts_decorated2.dyn"),
    },
    base_prefab = "dock_woodposts_item" ,
    build_name_override = "custom_dock_woodposts_decorated2" ,
    init_fn = function(inst) dock_woodposts_item_init_fn(inst, "custom_dock_woodposts_decorated2") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dock_woodposts_decorated3",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dock_woodposts_decorated3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dock_woodposts_decorated3.dyn"),
    },
    base_prefab = "dock_woodposts" ,
    build_name_override = "custom_dock_woodposts_decorated3" ,
    init_fn = function(inst) dock_woodposts_init_fn(inst, "custom_dock_woodposts_decorated3") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DOCK_WOODPOSTS", "BUILDERS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dock_woodposts_decorated3_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dock_woodposts_decorated3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dock_woodposts_decorated3.dyn"),
    },
    base_prefab = "dock_woodposts_item" ,
    build_name_override = "custom_dock_woodposts_decorated3" ,
    init_fn = function(inst) dock_woodposts_item_init_fn(inst, "custom_dock_woodposts_decorated3") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dock_woodposts_decorated_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dock_woodposts_decorated.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dock_woodposts_decorated.dyn"),
    },
    base_prefab = "dock_woodposts_item" ,
    build_name_override = "custom_dock_woodposts_decorated" ,
    init_fn = function(inst) dock_woodposts_item_init_fn(inst, "custom_dock_woodposts_decorated") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dock_woodposts_kitchen",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dock_woodposts_kitchen.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dock_woodposts_kitchen.dyn"),
    },
    base_prefab = "dock_woodposts" ,
    build_name_override = "custom_dock_woodposts_kitchen" ,
    init_fn = function(inst) dock_woodposts_init_fn(inst, "custom_dock_woodposts_kitchen") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DOCK_WOODPOSTS", "COTTAGE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dock_woodposts_kitchen2",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dock_woodposts_kitchen2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dock_woodposts_kitchen2.dyn"),
    },
    base_prefab = "dock_woodposts" ,
    build_name_override = "custom_dock_woodposts_kitchen2" ,
    init_fn = function(inst) dock_woodposts_init_fn(inst, "custom_dock_woodposts_kitchen2") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DOCK_WOODPOSTS", "COTTAGE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dock_woodposts_kitchen2_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dock_woodposts_kitchen2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dock_woodposts_kitchen2.dyn"),
    },
    base_prefab = "dock_woodposts_item" ,
    build_name_override = "custom_dock_woodposts_kitchen2" ,
    init_fn = function(inst) dock_woodposts_item_init_fn(inst, "custom_dock_woodposts_kitchen2") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dock_woodposts_kitchen3",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dock_woodposts_kitchen3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dock_woodposts_kitchen3.dyn"),
    },
    base_prefab = "dock_woodposts" ,
    build_name_override = "custom_dock_woodposts_kitchen3" ,
    init_fn = function(inst) dock_woodposts_init_fn(inst, "custom_dock_woodposts_kitchen3") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DOCK_WOODPOSTS", "COTTAGE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dock_woodposts_kitchen3_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dock_woodposts_kitchen3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dock_woodposts_kitchen3.dyn"),
    },
    base_prefab = "dock_woodposts_item" ,
    build_name_override = "custom_dock_woodposts_kitchen3" ,
    init_fn = function(inst) dock_woodposts_item_init_fn(inst, "custom_dock_woodposts_kitchen3") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dock_woodposts_kitchen_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dock_woodposts_kitchen.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dock_woodposts_kitchen.dyn"),
    },
    base_prefab = "dock_woodposts_item" ,
    build_name_override = "custom_dock_woodposts_kitchen" ,
    init_fn = function(inst) dock_woodposts_item_init_fn(inst, "custom_dock_woodposts_kitchen") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dragonflychest_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dragonflychest_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dragonflychest_fantasy.dyn"),
    },
    base_prefab = "dragonflychest" ,
    build_name_override = "custom_dragonflychest_fantasy" ,
    granted_items = { "custom_dragonflychest_upgraded_fantasy" , },
    init_fn = function(inst) dragonflychest_init_fn(inst, "custom_dragonflychest_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DRAGONFLYCHEST", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dragonflychest_kraken",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dragonflychest_kraken.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dragonflychest_kraken.dyn"),
    },
    base_prefab = "dragonflychest" ,
    build_name_override = "custom_dragonflychest_kraken" ,
    granted_items = { "custom_dragonflychest_upgraded_kraken" , },
    init_fn = function(inst) dragonflychest_init_fn(inst, "custom_dragonflychest_kraken") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "DRAGONFLYCHEST", "NAUTICAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dragonflychest_upgraded_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dragonflychest_upgraded_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dragonflychest_upgraded_fantasy.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_taller_fx" ,
    build_name_override = "custom_dragonflychest_upgraded_fantasy" ,
    init_fn = function(inst) dragonflychest_init_fn(inst, "custom_dragonflychest_upgraded_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dragonflychest_upgraded_kraken",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dragonflychest_upgraded_kraken.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dragonflychest_upgraded_kraken.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_taller_fx" ,
    build_name_override = "custom_dragonflychest_upgraded_kraken" ,
    init_fn = function(inst) dragonflychest_init_fn(inst, "custom_dragonflychest_upgraded_kraken") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dragonflyfurnace_adventure",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dragonflyfurnace_adventure.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dragonflyfurnace_adventure.dyn"),
    },
    base_prefab = "dragonflyfurnace" ,
    build_name_override = "custom_dragonflyfurnace_adventure" ,
    init_fn = function(inst) dragonflyfurnace_init_fn(inst, "custom_dragonflyfurnace_adventure") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ADVENTURE", "DRAGONFLY_FURNACE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dragonflyfurnace_antique",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dragonflyfurnace_antique.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dragonflyfurnace_antique.dyn"),
    },
    base_prefab = "dragonflyfurnace" ,
    build_name_override = "custom_dragonflyfurnace_antique" ,
    init_fn = function(inst) dragonflyfurnace_init_fn(inst, "custom_dragonflyfurnace_antique") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "DRAGONFLY_FURNACE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dragonflyfurnace_crystal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dragonflyfurnace_crystal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dragonflyfurnace_crystal.dyn"),
    },
    base_prefab = "dragonflyfurnace" ,
    build_name_override = "custom_dragonflyfurnace_crystal" ,
    init_fn = function(inst) dragonflyfurnace_init_fn(inst, "custom_dragonflyfurnace_crystal") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "CRYSTAL", "DRAGONFLY_FURNACE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dragonling_bat",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dragonling_bat.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dragonling_bat.dyn"),
    },
    base_prefab = "critter_dragonling" ,
    build_name_override = "custom_dragonling_bat" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_dragonling_bat", "dragonling_build" ) end,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    skin_tags = { "PET", "COSTUME", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dragonling_bat_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dragonling_bat.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dragonling_bat.dyn"),
    },
    base_prefab = "critter_dragonling_builder" ,
    build_name_override = "custom_dragonling_bat" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_dragonling_bat" ) end,
    rarity = "HeirloomElegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dragonling_mantis",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dragonling_mantis.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dragonling_mantis.dyn"),
    },
    base_prefab = "critter_dragonling" ,
    build_name_override = "custom_dragonling_mantis" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_dragonling_mantis", "dragonling_build" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PET", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dragonling_mantis_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dragonling_mantis.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dragonling_mantis.dyn"),
    },
    base_prefab = "critter_dragonling_builder" ,
    build_name_override = "custom_dragonling_mantis" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_dragonling_mantis" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dragonling_winter",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dragonling_winter.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dragonling_winter.dyn"),
    },
    base_prefab = "critter_dragonling" ,
    build_name_override = "custom_dragonling_winter" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_dragonling_winter", "dragonling_build" ) end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "PET", "WINTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dragonling_winter_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dragonling_winter.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dragonling_winter.dyn"),
    },
    base_prefab = "critter_dragonling_builder" ,
    build_name_override = "custom_dragonling_winter" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_dragonling_winter" ) end,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dragonling_wyvern",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dragonling_wyvern.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dragonling_wyvern.dyn"),
    },
    base_prefab = "critter_dragonling" ,
    build_name_override = "custom_dragonling_wyvern" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_dragonling_wyvern", "dragonling_build" ) end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "PET", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dragonling_wyvern_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_dragonling_wyvern.zip"),
        Asset("PKGREF", "anim/dynamic/custom_dragonling_wyvern.dyn"),
    },
    base_prefab = "critter_dragonling_builder" ,
    build_name_override = "custom_dragonling_wyvern" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_dragonling_wyvern" ) end,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dug_gravestone_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_gravestone_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_gravestone_fantasy.dyn"),
    },
    base_prefab = "dug_gravestone" ,
    build_name_override = "custom_gravestone_fantasy" ,
    init_fn = function(inst) dug_gravestone_init_fn(inst, "custom_gravestone_fantasy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dug_gravestone_fantasy2",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_gravestone_fantasy2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_gravestone_fantasy2.dyn"),
    },
    base_prefab = "dug_gravestone" ,
    build_name_override = "custom_gravestone_fantasy2" ,
    init_fn = function(inst) dug_gravestone_init_fn(inst, "custom_gravestone_fantasy2") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dug_gravestone_fantasy3",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_gravestone_fantasy3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_gravestone_fantasy3.dyn"),
    },
    base_prefab = "dug_gravestone" ,
    build_name_override = "custom_gravestone_fantasy3" ,
    init_fn = function(inst) dug_gravestone_init_fn(inst, "custom_gravestone_fantasy3") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dug_gravestone_fantasy4",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_gravestone_fantasy4.zip"),
        Asset("PKGREF", "anim/dynamic/custom_gravestone_fantasy4.dyn"),
    },
    base_prefab = "dug_gravestone" ,
    build_name_override = "custom_gravestone_fantasy4" ,
    init_fn = function(inst) dug_gravestone_init_fn(inst, "custom_gravestone_fantasy4") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dug_gravestone_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_gravestone_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_gravestone_gothic.dyn"),
    },
    base_prefab = "dug_gravestone" ,
    build_name_override = "custom_gravestone_gothic" ,
    init_fn = function(inst) dug_gravestone_init_fn(inst, "custom_gravestone_gothic") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dug_gravestone_gothic2",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_gravestone_gothic2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_gravestone_gothic2.dyn"),
    },
    base_prefab = "dug_gravestone" ,
    build_name_override = "custom_gravestone_gothic2" ,
    init_fn = function(inst) dug_gravestone_init_fn(inst, "custom_gravestone_gothic2") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dug_gravestone_gothic3",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_gravestone_gothic3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_gravestone_gothic3.dyn"),
    },
    base_prefab = "dug_gravestone" ,
    build_name_override = "custom_gravestone_gothic3" ,
    init_fn = function(inst) dug_gravestone_init_fn(inst, "custom_gravestone_gothic3") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_dug_gravestone_gothic4",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_gravestone_gothic4.zip"),
        Asset("PKGREF", "anim/dynamic/custom_gravestone_gothic4.dyn"),
    },
    base_prefab = "dug_gravestone" ,
    build_name_override = "custom_gravestone_gothic4" ,
    init_fn = function(inst) dug_gravestone_init_fn(inst, "custom_gravestone_gothic4") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_earmuffshat_beeguard",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_earmuffshat_beeguard.zip"),
        Asset("PKGREF", "anim/dynamic/custom_earmuffshat_beeguard.dyn"),
    },
    base_prefab = "earmuffshat" ,
    build_name_override = "custom_earmuffshat_beeguard" ,
    init_fn = function(inst) earmuffshat_init_fn(inst, "custom_earmuffshat_beeguard") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "EARMUFFSHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_earmuffshat_deerclops",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_earmuffshat_deerclops.zip"),
        Asset("PKGREF", "anim/dynamic/custom_earmuffshat_deerclops.dyn"),
    },
    base_prefab = "earmuffshat" ,
    build_name_override = "custom_earmuffshat_deerclops" ,
    init_fn = function(inst) earmuffshat_init_fn(inst, "custom_earmuffshat_deerclops") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "EARMUFFSHAT", "YULE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_endtable_carpet",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_endtable_carpet.zip"),
        Asset("PKGREF", "anim/dynamic/custom_endtable_carpet.dyn"),
    },
    base_prefab = "endtable" ,
    build_name_override = "custom_endtable_carpet" ,
    granted_items = { "custom_stagehand_carpet" , },
    init_fn = function(inst) endtable_init_fn(inst, "custom_endtable_carpet") end,
    marketable = true,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { "ENDTABLE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_endtable_cawnival",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_endtable_cawnival.zip"),
        Asset("PKGREF", "anim/dynamic/custom_endtable_cawnival.dyn"),
    },
    base_prefab = "endtable" ,
    build_name_override = "custom_endtable_cawnival" ,
    granted_items = { "custom_stagehand_cawnival" , },
    init_fn = function(inst) endtable_init_fn(inst, "custom_endtable_cawnival") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "ENDTABLE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_endtable_dragonfly",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_endtable_dragonfly.zip"),
        Asset("PKGREF", "anim/dynamic/custom_endtable_dragonfly.dyn"),
    },
    base_prefab = "endtable" ,
    build_name_override = "custom_endtable_dragonfly" ,
    granted_items = { "custom_stagehand_dragonfly" , },
    init_fn = function(inst) endtable_init_fn(inst, "custom_endtable_dragonfly") end,
    marketable = true,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { "ENDTABLE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_endtable_vintage",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_endtable_vintage.zip"),
        Asset("PKGREF", "anim/dynamic/custom_endtable_vintage.dyn"),
    },
    base_prefab = "endtable" ,
    build_name_override = "custom_endtable_vintage" ,
    granted_items = { "custom_stagehand_vintage" , },
    init_fn = function(inst) endtable_init_fn(inst, "custom_endtable_vintage") end,
    marketable = true,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { "ENDTABLE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_eyebrellahat_adventure",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_eyebrellahat_adventure.zip"),
        Asset("PKGREF", "anim/dynamic/custom_eyebrellahat_adventure.dyn"),
    },
    base_prefab = "eyebrellahat" ,
    build_name_override = "custom_eyebrellahat_adventure" ,
    init_fn = function(inst) eyebrellahat_init_fn(inst, "custom_eyebrellahat_adventure") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "EYEBRELLAHAT", "ADVENTURE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_eyebrellahat_crystal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_eyebrellahat_crystal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_eyebrellahat_crystal.dyn"),
    },
    base_prefab = "eyebrellahat" ,
    build_name_override = "custom_eyebrellahat_crystal" ,
    init_fn = function(inst) eyebrellahat_init_fn(inst, "custom_eyebrellahat_crystal") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "EYEBRELLAHAT", "CRYSTAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_eyebrellahat_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_eyebrellahat_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_eyebrellahat_fantasy.dyn"),
    },
    base_prefab = "eyebrellahat" ,
    build_name_override = "custom_eyebrellahat_fantasy" ,
    init_fn = function(inst) eyebrellahat_init_fn(inst, "custom_eyebrellahat_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "EYEBRELLAHAT", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_eyebrellahat_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_eyebrellahat_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_eyebrellahat_rose.dyn"),
    },
    base_prefab = "eyebrellahat" ,
    build_name_override = "custom_eyebrellahat_rose" ,
    init_fn = function(inst) eyebrellahat_init_fn(inst, "custom_eyebrellahat_rose") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "EYEBRELLAHAT", "ROSE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_eyebrellahat_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_eyebrellahat_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_eyebrellahat_victorian.dyn"),
    },
    base_prefab = "eyebrellahat" ,
    build_name_override = "custom_eyebrellahat_victorian" ,
    init_fn = function(inst) eyebrellahat_init_fn(inst, "custom_eyebrellahat_victorian") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "EYEBRELLAHAT", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_eyeplant_bulb_trap_plantera",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_eyeplant_trap_plantera.zip"),
        Asset("PKGREF", "anim/dynamic/custom_eyeplant_trap_plantera.dyn"),
    },
    base_prefab = "lureplantbulb" ,
    build_name_override = "custom_eyeplant_trap_plantera" ,
    init_fn = function(inst) lureplantbulb_init_fn(inst, "custom_eyeplant_trap_plantera") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_eyeplant_trap_plantera",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_eyeplant_trap_plantera.zip"),
        Asset("PKGREF", "anim/dynamic/custom_eyeplant_trap_plantera.dyn"),
    },
    base_prefab = "lureplant" ,
    build_name_override = "custom_eyeplant_trap_plantera" ,
    granted_items = { "custom_eyeplant_bulb_trap_plantera" , },
    init_fn = function(inst) lureplant_init_fn(inst, "custom_eyeplant_trap_plantera") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "LUREPLANT", "T_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_eyeturret_an",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_eyeturret_an.zip"),
        Asset("PKGREF", "anim/dynamic/custom_eyeturret_an.dyn"),
    },
    base_prefab = "eyeturret" ,
    build_name_override = "custom_eyeturret_an" ,
    init_fn = function(inst) eyeturret_init_fn(inst, "custom_eyeturret_an") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "EYETURRET", "ARTNOUVEAU", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_eyeturret_anitem",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_eyeturret_an.zip"),
        Asset("PKGREF", "anim/dynamic/custom_eyeturret_an.dyn"),
    },
    base_prefab = "eyeturret_item" ,
    build_name_override = "custom_eyeturret_an" ,
    init_fn = function(inst) eyeturret_item_init_fn(inst, "custom_eyeturret_an") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_farm_hoe_invisible",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_farm_hoe_invisible.zip"),
        Asset("PKGREF", "anim/dynamic/custom_farm_hoe_invisible.dyn"),
    },
    base_prefab = "farm_hoe" ,
    build_name_override = "custom_farm_hoe_invisible" ,
    init_fn = function(inst) farm_hoe_init_fn(inst, "custom_farm_hoe_invisible") end,
    rarity = "Classy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "INVISIBLE", "FARM_HOE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_farm_hoe_rustic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_farm_hoe_rustic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_farm_hoe_rustic.dyn"),
    },
    base_prefab = "farm_hoe" ,
    build_name_override = "custom_farm_hoe_rustic" ,
    init_fn = function(inst) farm_hoe_init_fn(inst, "custom_farm_hoe_rustic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BOY", "FARM_HOE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_featherfan_exotic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_featherfan_exotic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_featherfan_exotic.dyn"),
    },
    base_prefab = "featherfan" ,
    build_name_override = "custom_featherfan_exotic" ,
    init_fn = function(inst) featherfan_init_fn(inst, "custom_featherfan_exotic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "FEATHERFAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_featherhat_circus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_featherhat_circus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_featherhat_circus.dyn"),
    },
    base_prefab = "featherhat" ,
    build_name_override = "custom_featherhat_circus" ,
    init_fn = function(inst) featherhat_init_fn(inst, "custom_featherhat_circus") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "FEATHERHAT", "CIRCUS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_featherhat_exotic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_featherhat_exotic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_featherhat_exotic.dyn"),
    },
    base_prefab = "featherhat" ,
    build_name_override = "custom_featherhat_exotic" ,
    init_fn = function(inst) featherhat_init_fn(inst, "custom_featherhat_exotic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FEATHERHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_featherhat_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_featherhat_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_featherhat_victorian.dyn"),
    },
    base_prefab = "featherhat" ,
    build_name_override = "custom_featherhat_victorian" ,
    init_fn = function(inst) featherhat_init_fn(inst, "custom_featherhat_victorian") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FEATHERHAT", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_ancient.dyn"),
    },
    base_prefab = "fence" ,
    build_name_override = "custom_fence_ancient" ,
    init_fn = function(inst) fence_init_fn(inst, "custom_fence_ancient") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FENCE", "CRAFTABLE", "ANCIENT", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_ancient_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_ancient.dyn"),
    },
    base_prefab = "fence_item" ,
    build_name_override = "custom_fence_ancient" ,
    init_fn = function(inst) fence_item_init_fn(inst, "custom_fence_ancient") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_factory",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_factory.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_factory.dyn"),
    },
    base_prefab = "fence" ,
    build_name_override = "custom_fence_factory" ,
    init_fn = function(inst) fence_init_fn(inst, "custom_fence_factory") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FENCE", "CRAFTABLE", "NEXTKIN", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_factory_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_factory.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_factory.dyn"),
    },
    base_prefab = "fence_item" ,
    build_name_override = "custom_fence_factory" ,
    init_fn = function(inst) fence_item_init_fn(inst, "custom_fence_factory") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_fantasy.dyn"),
    },
    base_prefab = "fence" ,
    build_name_override = "custom_fence_fantasy" ,
    init_fn = function(inst) fence_init_fn(inst, "custom_fence_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FENCE", "CRAFTABLE", "FANTASY", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_fantasy_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_fantasy.dyn"),
    },
    base_prefab = "fence_item" ,
    build_name_override = "custom_fence_fantasy" ,
    init_fn = function(inst) fence_item_init_fn(inst, "custom_fence_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_gate_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gate_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gate_ancient.dyn"),
    },
    base_prefab = "fence_gate" ,
    build_name_override = "custom_fence_gate_ancient" ,
    init_fn = function(inst) fence_gate_init_fn(inst, "custom_fence_gate_ancient") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FENCE_GATE", "CRAFTABLE", "ANCIENT", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_gate_gingerbread",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gate_gingerbread.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gate_gingerbread.dyn"),
    },
    base_prefab = "fence_gate" ,
    build_name_override = "custom_fence_gate_gingerbread" ,
    init_fn = function(inst) fence_gate_init_fn(inst, "custom_fence_gate_gingerbread") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FENCE_GATE", "CRAFTABLE", "YULE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_gate_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gate_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gate_gothic.dyn"),
    },
    base_prefab = "fence_gate" ,
    build_name_override = "custom_fence_gate_gothic" ,
    init_fn = function(inst) fence_gate_init_fn(inst, "custom_fence_gate_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FENCE_GATE", "CRAFTABLE", "GOTHIC", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_gate_picketbrown",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gate_picketbrown.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gate_picketbrown.dyn"),
    },
    base_prefab = "fence_gate" ,
    build_name_override = "custom_fence_gate_picketbrown" ,
    init_fn = function(inst) fence_gate_init_fn(inst, "custom_fence_gate_picketbrown") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "FENCE_GATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_gate_pickettan",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gate_pickettan.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gate_pickettan.dyn"),
    },
    base_prefab = "fence_gate" ,
    build_name_override = "custom_fence_gate_pickettan" ,
    init_fn = function(inst) fence_gate_init_fn(inst, "custom_fence_gate_pickettan") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "FENCE_GATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_gate_picketwhite",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gate_picketwhite.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gate_picketwhite.dyn"),
    },
    base_prefab = "fence_gate" ,
    build_name_override = "custom_fence_gate_picketwhite" ,
    init_fn = function(inst) fence_gate_init_fn(inst, "custom_fence_gate_picketwhite") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "FENCE_GATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_gate_victorianblack",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gate_victorianblack.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gate_victorianblack.dyn"),
    },
    base_prefab = "fence_gate" ,
    build_name_override = "custom_fence_gate_victorianblack" ,
    init_fn = function(inst) fence_gate_init_fn(inst, "custom_fence_gate_victorianblack") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "VICTORIAN", "FENCE_GATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_gate_victorianbrass",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gate_victorianbrass.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gate_victorianbrass.dyn"),
    },
    base_prefab = "fence_gate" ,
    build_name_override = "custom_fence_gate_victorianbrass" ,
    init_fn = function(inst) fence_gate_init_fn(inst, "custom_fence_gate_victorianbrass") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "VICTORIAN", "FENCE_GATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_gate_victorianbronze",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gate_victorianbronze.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gate_victorianbronze.dyn"),
    },
    base_prefab = "fence_gate" ,
    build_name_override = "custom_fence_gate_victorianbronze" ,
    init_fn = function(inst) fence_gate_init_fn(inst, "custom_fence_gate_victorianbronze") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "VICTORIAN", "FENCE_GATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_gingerbread",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gingerbread.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gingerbread.dyn"),
    },
    base_prefab = "fence" ,
    build_name_override = "custom_fence_gingerbread" ,
    init_fn = function(inst) fence_init_fn(inst, "custom_fence_gingerbread") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FENCE", "CRAFTABLE", "YULE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_gingerbread_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gingerbread.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gingerbread.dyn"),
    },
    base_prefab = "fence_item" ,
    build_name_override = "custom_fence_gingerbread" ,
    init_fn = function(inst) fence_item_init_fn(inst, "custom_fence_gingerbread") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gothic.dyn"),
    },
    base_prefab = "fence" ,
    build_name_override = "custom_fence_gothic" ,
    init_fn = function(inst) fence_init_fn(inst, "custom_fence_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FENCE", "CRAFTABLE", "GOTHIC", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_gothic_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gothic.dyn"),
    },
    base_prefab = "fence_item" ,
    build_name_override = "custom_fence_gothic" ,
    init_fn = function(inst) fence_item_init_fn(inst, "custom_fence_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_picketbrown",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_picketbrown.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_picketbrown.dyn"),
    },
    base_prefab = "fence" ,
    build_name_override = "custom_fence_picketbrown" ,
    init_fn = function(inst) fence_init_fn(inst, "custom_fence_picketbrown") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "FENCE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_picketbrown_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_picketbrown.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_picketbrown.dyn"),
    },
    base_prefab = "fence_item" ,
    build_name_override = "custom_fence_picketbrown" ,
    init_fn = function(inst) fence_item_init_fn(inst, "custom_fence_picketbrown") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_pickettan",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_pickettan.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_pickettan.dyn"),
    },
    base_prefab = "fence" ,
    build_name_override = "custom_fence_pickettan" ,
    init_fn = function(inst) fence_init_fn(inst, "custom_fence_pickettan") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "FENCE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_pickettan_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_pickettan.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_pickettan.dyn"),
    },
    base_prefab = "fence_item" ,
    build_name_override = "custom_fence_pickettan" ,
    init_fn = function(inst) fence_item_init_fn(inst, "custom_fence_pickettan") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_picketwhite",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_picketwhite.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_picketwhite.dyn"),
    },
    base_prefab = "fence" ,
    build_name_override = "custom_fence_picketwhite" ,
    init_fn = function(inst) fence_init_fn(inst, "custom_fence_picketwhite") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "FENCE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_picketwhite_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_picketwhite.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_picketwhite.dyn"),
    },
    base_prefab = "fence_item" ,
    build_name_override = "custom_fence_picketwhite" ,
    init_fn = function(inst) fence_item_init_fn(inst, "custom_fence_picketwhite") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_victorianblack",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_victorianblack.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_victorianblack.dyn"),
    },
    base_prefab = "fence" ,
    build_name_override = "custom_fence_victorianblack" ,
    init_fn = function(inst) fence_init_fn(inst, "custom_fence_victorianblack") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FENCE", "CRAFTABLE", "VICTORIAN", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_victorianblack_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_victorianblack.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_victorianblack.dyn"),
    },
    base_prefab = "fence_item" ,
    build_name_override = "custom_fence_victorianblack" ,
    init_fn = function(inst) fence_item_init_fn(inst, "custom_fence_victorianblack") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_victorianbrass",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_victorianbrass.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_victorianbrass.dyn"),
    },
    base_prefab = "fence" ,
    build_name_override = "custom_fence_victorianbrass" ,
    init_fn = function(inst) fence_init_fn(inst, "custom_fence_victorianbrass") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FENCE", "CRAFTABLE", "VICTORIAN", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_victorianbrass_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_victorianbrass.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_victorianbrass.dyn"),
    },
    base_prefab = "fence_item" ,
    build_name_override = "custom_fence_victorianbrass" ,
    init_fn = function(inst) fence_item_init_fn(inst, "custom_fence_victorianbrass") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_victorianbronze",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_victorianbronze.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_victorianbronze.dyn"),
    },
    base_prefab = "fence" ,
    build_name_override = "custom_fence_victorianbronze" ,
    init_fn = function(inst) fence_init_fn(inst, "custom_fence_victorianbronze") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FENCE", "CRAFTABLE", "VICTORIAN", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fence_victorianbronze_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_victorianbronze.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_victorianbronze.dyn"),
    },
    base_prefab = "fence_item" ,
    build_name_override = "custom_fence_victorianbronze" ,
    init_fn = function(inst) fence_item_init_fn(inst, "custom_fence_victorianbronze") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fencegate_ancient_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gate_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gate_ancient.dyn"),
    },
    base_prefab = "fence_gate_item" ,
    build_name_override = "custom_fence_gate_ancient" ,
    init_fn = function(inst) fence_gate_item_init_fn(inst, "custom_fence_gate_ancient") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fencegate_gingerbread_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gate_gingerbread.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gate_gingerbread.dyn"),
    },
    base_prefab = "fence_gate_item" ,
    build_name_override = "custom_fence_gate_gingerbread" ,
    init_fn = function(inst) fence_gate_item_init_fn(inst, "custom_fence_gate_gingerbread") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fencegate_gothic_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gate_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gate_gothic.dyn"),
    },
    base_prefab = "fence_gate_item" ,
    build_name_override = "custom_fence_gate_gothic" ,
    init_fn = function(inst) fence_gate_item_init_fn(inst, "custom_fence_gate_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fencegate_picketbrown_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gate_picketbrown.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gate_picketbrown.dyn"),
    },
    base_prefab = "fence_gate_item" ,
    build_name_override = "custom_fence_gate_picketbrown" ,
    init_fn = function(inst) fence_gate_item_init_fn(inst, "custom_fence_gate_picketbrown") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fencegate_pickettan_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gate_pickettan.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gate_pickettan.dyn"),
    },
    base_prefab = "fence_gate_item" ,
    build_name_override = "custom_fence_gate_pickettan" ,
    init_fn = function(inst) fence_gate_item_init_fn(inst, "custom_fence_gate_pickettan") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fencegate_picketwhite_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gate_picketwhite.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gate_picketwhite.dyn"),
    },
    base_prefab = "fence_gate_item" ,
    build_name_override = "custom_fence_gate_picketwhite" ,
    init_fn = function(inst) fence_gate_item_init_fn(inst, "custom_fence_gate_picketwhite") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fencegate_victorianblack_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gate_victorianblack.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gate_victorianblack.dyn"),
    },
    base_prefab = "fence_gate_item" ,
    build_name_override = "custom_fence_gate_victorianblack" ,
    init_fn = function(inst) fence_gate_item_init_fn(inst, "custom_fence_gate_victorianblack") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fencegate_victorianbrass_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gate_victorianbrass.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gate_victorianbrass.dyn"),
    },
    base_prefab = "fence_gate_item" ,
    build_name_override = "custom_fence_gate_victorianbrass" ,
    init_fn = function(inst) fence_gate_item_init_fn(inst, "custom_fence_gate_victorianbrass") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fencegate_victorianbronze_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fence_gate_victorianbronze.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fence_gate_victorianbronze.dyn"),
    },
    base_prefab = "fence_gate_item" ,
    build_name_override = "custom_fence_gate_victorianbronze" ,
    init_fn = function(inst) fence_gate_item_init_fn(inst, "custom_fence_gate_victorianbronze") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_firepit_fanged",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_firepit_fanged.zip"),
        Asset("PKGREF", "anim/dynamic/custom_firepit_fanged.dyn"),
    },
    base_prefab = "firepit" ,
    build_name_override = "custom_firepit_fanged" ,
    init_fn = function(inst) firepit_init_fn(inst, "custom_firepit_fanged", Vector3(0, 20, 0)) end,
    marketable = true,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { "FIREPIT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_firepit_firebird",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_firepit_firebird.zip"),
        Asset("PKGREF", "anim/dynamic/custom_firepit_firebird.dyn"),
    },
    base_prefab = "firepit" ,
    build_name_override = "custom_firepit_firebird" ,
    fx_prefab = { "firepit_firebird_puff_fx", },
    init_fn = function(inst) firepit_init_fn(inst, "custom_firepit_firebird", Vector3(0, -5, 0)) end,
    prefabs = { "firepit_firebird_puff_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FIREPIT", "HEART", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_firepit_hole",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_firepit_hole.zip"),
        Asset("PKGREF", "anim/dynamic/custom_firepit_hole.dyn"),
    },
    base_prefab = "firepit" ,
    build_name_override = "custom_firepit_hole" ,
    init_fn = function(inst) firepit_init_fn(inst, "custom_firepit_hole", Vector3(0, 26, 0)) end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "FIREPIT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_firepit_kiln",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_firepit_kiln.zip"),
        Asset("PKGREF", "anim/dynamic/custom_firepit_kiln.dyn"),
    },
    base_prefab = "firepit" ,
    build_name_override = "custom_firepit_kiln" ,
    init_fn = function(inst) firepit_init_fn(inst, "custom_firepit_kiln", Vector3(0, -36, 0)) end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "FIREPIT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_firepit_lava",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_firepit_lava.zip"),
        Asset("PKGREF", "anim/dynamic/custom_firepit_lava.dyn"),
    },
    base_prefab = "firepit" ,
    build_name_override = "custom_firepit_lava" ,
    init_fn = function(inst) firepit_init_fn(inst, "custom_firepit_lava", Vector3(0, 0, 0)) end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "FIREPIT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_firepit_stonehenge",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_firepit_stonehenge.zip"),
        Asset("PKGREF", "anim/dynamic/custom_firepit_stonehenge.dyn"),
    },
    base_prefab = "firepit" ,
    build_name_override = "custom_firepit_stonehenge" ,
    init_fn = function(inst) firepit_init_fn(inst, "custom_firepit_stonehenge", Vector3(0, -28, 0)) end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "FIREPIT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_firepit_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_firepit_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_firepit_victorian.dyn"),
    },
    base_prefab = "firepit" ,
    build_name_override = "custom_firepit_victorian" ,
    init_fn = function(inst) firepit_init_fn(inst, "custom_firepit_victorian", Vector3(0, 10, 0)) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FIREPIT", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_firestaff_bee",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_firestaff_bee.zip"),
        Asset("PKGREF", "anim/dynamic/custom_firestaff_bee.dyn"),
    },
    base_prefab = "firestaff" ,
    build_name_override = "custom_firestaff_bee" ,
    init_fn = function(inst) firestaff_init_fn(inst, "custom_firestaff_bee") end,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_firestaff_flamelash",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_firestaff_flamelash.zip"),
        Asset("PKGREF", "anim/dynamic/custom_firestaff_flamelash.dyn"),
    },
    base_prefab = "firestaff" ,
    build_name_override = "custom_firestaff_flamelash" ,
    init_fn = function(inst) firestaff_init_fn(inst, "custom_firestaff_flamelash") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_sound = { ["genericuse"] = "terraria1/skins/flamelash", },
    skin_tags = { "FIRESTAFF", "T_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_firestaff_gungnir",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_firestaff_gungnir.zip"),
        Asset("PKGREF", "anim/dynamic/custom_firestaff_gungnir.dyn"),
    },
    base_prefab = "firestaff" ,
    build_name_override = "custom_firestaff_gungnir" ,
    init_fn = function(inst) firestaff_init_fn(inst, "custom_firestaff_gungnir") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_firestaff_hockey",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_firestaff_hockey.zip"),
        Asset("PKGREF", "anim/dynamic/custom_firestaff_hockey.dyn"),
    },
    base_prefab = "firestaff" ,
    build_name_override = "custom_firestaff_hockey" ,
    init_fn = function(inst) firestaff_init_fn(inst, "custom_firestaff_hockey") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_firestaff_lance",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_firestaff_lance.zip"),
        Asset("PKGREF", "anim/dynamic/custom_firestaff_lance.dyn"),
    },
    base_prefab = "firestaff" ,
    build_name_override = "custom_firestaff_lance" ,
    init_fn = function(inst) firestaff_init_fn(inst, "custom_firestaff_lance") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_firestaff_meteor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_firestaff_meteor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_firestaff_meteor.dyn"),
    },
    base_prefab = "firestaff" ,
    build_name_override = "custom_firestaff_meteor" ,
    init_fn = function(inst) firestaff_init_fn(inst, "custom_firestaff_meteor") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FIRESTAFF", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_firestaff_northern",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_firestaff_northern.zip"),
        Asset("PKGREF", "anim/dynamic/custom_firestaff_northern.dyn"),
    },
    base_prefab = "firestaff" ,
    build_name_override = "custom_firestaff_northern" ,
    init_fn = function(inst) firestaff_init_fn(inst, "custom_firestaff_northern") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_firestaff_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_firestaff_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_firestaff_rose.dyn"),
    },
    base_prefab = "firestaff" ,
    build_name_override = "custom_firestaff_rose" ,
    init_fn = function(inst) firestaff_init_fn(inst, "custom_firestaff_rose") end,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_firesuppressor_circus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_firesuppressor_circus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_firesuppressor_circus.dyn"),
    },
    base_prefab = "firesuppressor" ,
    build_name_override = "custom_firesuppressor_circus" ,
    init_fn = function(inst) firesuppressor_init_fn(inst, "custom_firesuppressor_circus") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "FIRESUPPRESSOR", "CIRCUS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_firesuppressor_robot",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_firesuppressor_robot.zip"),
        Asset("PKGREF", "anim/dynamic/custom_firesuppressor_robot.dyn"),
    },
    base_prefab = "firesuppressor" ,
    build_name_override = "custom_firesuppressor_robot" ,
    init_fn = function(inst) firesuppressor_init_fn(inst, "custom_firesuppressor_robot") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FIRESUPPRESSOR", "YOTP", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fishbox_nautical",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fishbox_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fishbox_nautical.dyn"),
    },
    base_prefab = "fish_box" ,
    build_name_override = "custom_fishbox_nautical" ,
    init_fn = function(inst) fish_box_init_fn(inst, "custom_fishbox_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "FISHBOX", "NAUTICAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_fishbox_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_fishbox_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_fishbox_pirate.dyn"),
    },
    base_prefab = "fish_box" ,
    build_name_override = "custom_fishbox_pirate" ,
    init_fn = function(inst) fish_box_init_fn(inst, "custom_fishbox_pirate") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FISHBOX", "PIRATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_flowerhat_crown",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_flowerhat_crown.zip"),
        Asset("PKGREF", "anim/dynamic/custom_flowerhat_crown.dyn"),
    },
    base_prefab = "flowerhat" ,
    build_name_override = "custom_flowerhat_crown" ,
    init_fn = function(inst) flowerhat_init_fn(inst, "custom_flowerhat_crown") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FLOWERHAT", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_flowerhat_healing",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_flowerhat_healing.zip"),
        Asset("PKGREF", "anim/dynamic/custom_flowerhat_healing.dyn"),
    },
    base_prefab = "flowerhat" ,
    build_name_override = "custom_flowerhat_healing" ,
    init_fn = function(inst) flowerhat_init_fn(inst, "custom_flowerhat_healing") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FLOWERHAT", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_flowerhat_holly_wreath",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_flowerhat_holly_wreath.zip"),
        Asset("PKGREF", "anim/dynamic/custom_flowerhat_holly_wreath.dyn"),
    },
    base_prefab = "flowerhat" ,
    build_name_override = "custom_flowerhat_holly_wreath" ,
    init_fn = function(inst) flowerhat_init_fn(inst, "custom_flowerhat_holly_wreath") end,
    marketable = true,
    rarity = "Spiffy",
    release_group = groupid,
    skin_tags = { "FLOWERHAT", "WINTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_flowerhat_ribbon_wreath",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_flowerhat_ribbon_wreath.zip"),
        Asset("PKGREF", "anim/dynamic/custom_flowerhat_ribbon_wreath.dyn"),
    },
    base_prefab = "flowerhat" ,
    build_name_override = "custom_flowerhat_ribbon_wreath" ,
    init_fn = function(inst) flowerhat_init_fn(inst, "custom_flowerhat_ribbon_wreath") end,
    marketable = true,
    rarity = "Spiffy",
    release_group = groupid,
    skin_tags = { "FLOWERHAT", "WINTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_flowerhat_wreath",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_flowerhat_wreath.zip"),
        Asset("PKGREF", "anim/dynamic/custom_flowerhat_wreath.dyn"),
    },
    base_prefab = "flowerhat" ,
    build_name_override = "custom_flowerhat_wreath" ,
    init_fn = function(inst) flowerhat_init_fn(inst, "custom_flowerhat_wreath") end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "FLOWERHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_footballhat_adventure",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_footballhat_adventure.zip"),
        Asset("PKGREF", "anim/dynamic/custom_footballhat_adventure.dyn"),
    },
    base_prefab = "footballhat" ,
    build_name_override = "custom_footballhat_adventure" ,
    init_fn = function(inst) footballhat_init_fn(inst, "custom_footballhat_adventure", true) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FOOTBALLHAT", "ADVENTURE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_footballhat_combathelm",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_footballhat_combathelm.zip"),
        Asset("PKGREF", "anim/dynamic/custom_footballhat_combathelm.dyn"),
    },
    base_prefab = "footballhat" ,
    build_name_override = "custom_footballhat_combathelm" ,
    init_fn = function(inst) footballhat_init_fn(inst, "custom_footballhat_combathelm") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FOOTBALLHAT", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_footballhat_combathelm2",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_footballhat_combathelm2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_footballhat_combathelm2.dyn"),
    },
    base_prefab = "footballhat" ,
    build_name_override = "custom_footballhat_combathelm2" ,
    init_fn = function(inst) footballhat_init_fn(inst, "custom_footballhat_combathelm2") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FOOTBALLHAT", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_footballhat_hockey",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_footballhat_hockey.zip"),
        Asset("PKGREF", "anim/dynamic/custom_footballhat_hockey.dyn"),
    },
    base_prefab = "footballhat" ,
    build_name_override = "custom_footballhat_hockey" ,
    init_fn = function(inst) footballhat_init_fn(inst, "custom_footballhat_hockey") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FOOTBALLHAT", "HOCKEY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_gemsocket_crystal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_telebase_crystal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_telebase_crystal.dyn"),
    },
    base_prefab = "gemsocket" ,
    build_name_override = "custom_telebase_crystal" ,
    init_fn = function(inst) gemsocket_init_fn(inst, "custom_telebase_crystal") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_gemsocket_hallowpylon",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_telebase_hallowpylon.zip"),
        Asset("PKGREF", "anim/dynamic/custom_telebase_hallowpylon.dyn"),
    },
    base_prefab = "gemsocket" ,
    build_name_override = "custom_telebase_hallowpylon" ,
    init_fn = function(inst) gemsocket_init_fn(inst, "custom_telebase_hallowpylon") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_glasscutter_terraprisma",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_glasscutter_terraprisma.zip"),
        Asset("PKGREF", "anim/dynamic/custom_glasscutter_terraprisma.dyn"),
    },
    base_prefab = "glasscutter" ,
    build_name_override = "custom_glasscutter_terraprisma" ,
    init_fn = function(inst) glasscutter_init_fn(inst, "custom_glasscutter_terraprisma") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_sound = { ["equip"] = "terraria1/skins/terraprisma_summon", },
    skin_tags = { "GLASSCUTTER", "T_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_glomling_beardeddragon",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_glomling_beardeddragon.zip"),
        Asset("PKGREF", "anim/dynamic/custom_glomling_beardeddragon.dyn"),
    },
    base_prefab = "critter_glomling" ,
    build_name_override = "custom_glomling_beardeddragon" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_glomling_beardeddragon", "glomling_build" ) end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "PET", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_glomling_beardeddragon_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_glomling_beardeddragon.zip"),
        Asset("PKGREF", "anim/dynamic/custom_glomling_beardeddragon.dyn"),
    },
    base_prefab = "critter_glomling_builder" ,
    build_name_override = "custom_glomling_beardeddragon" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_glomling_beardeddragon" ) end,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_glomling_puft",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_glomling_puft.zip"),
        Asset("PKGREF", "anim/dynamic/custom_glomling_puft.dyn"),
    },
    base_prefab = "critter_glomling" ,
    build_name_override = "custom_glomling_puft" ,
    init_fn = function(inst) glomling_init_fn(inst, "custom_glomling_puft", "glomling_build" ) end,
    rarity = "Loyal",
    release_group = groupid,
    skin_sound = { ["genericuse"] = "dontstarve_DLC001/creatures/together/puft/", },
    skin_tags = { "PET", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_glomling_puft_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_glomling_puft.zip"),
        Asset("PKGREF", "anim/dynamic/custom_glomling_puft.dyn"),
    },
    base_prefab = "critter_glomling_builder" ,
    build_name_override = "custom_glomling_puft" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_glomling_puft" ) end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_glomling_winter",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_glomling_winter.zip"),
        Asset("PKGREF", "anim/dynamic/custom_glomling_winter.dyn"),
    },
    base_prefab = "critter_glomling" ,
    build_name_override = "custom_glomling_winter" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_glomling_winter", "glomling_build" ) end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "PET", "WINTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_glomling_winter_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_glomling_winter.zip"),
        Asset("PKGREF", "anim/dynamic/custom_glomling_winter.dyn"),
    },
    base_prefab = "critter_glomling_builder" ,
    build_name_override = "custom_glomling_winter" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_glomling_winter" ) end,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_glommer_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_glommer_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_glommer_fantasy.dyn"),
    },
    base_prefab = "glommer" ,
    build_name_override = "custom_glommer_fantasy" ,
    granted_items = { "custom_glommerflower_fantasy" , },
    init_fn = function(inst) glommer_init_fn(inst, "custom_glommer_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FANTASY", "GLOMMER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_glommerflower_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_glommer_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_glommer_fantasy.dyn"),
    },
    base_prefab = "glommerflower" ,
    build_name_override = "custom_glommer_fantasy" ,
    init_fn = function(inst) glommerflower_init_fn(inst, "custom_glommer_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_goggleshat_fedora",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_goggleshat_fedora.zip"),
        Asset("PKGREF", "anim/dynamic/custom_goggleshat_fedora.dyn"),
    },
    base_prefab = "goggleshat" ,
    build_name_override = "custom_goggleshat_fedora" ,
    init_fn = function(inst) goggleshat_init_fn(inst, "custom_goggleshat_fedora") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "GOGGLESHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_golden_farmhoe_garden",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_golden_farmhoe_garden.zip"),
        Asset("PKGREF", "anim/dynamic/custom_golden_farmhoe_garden.dyn"),
    },
    base_prefab = "golden_farm_hoe" ,
    build_name_override = "custom_golden_farmhoe_garden" ,
    init_fn = function(inst) golden_farm_hoe_init_fn(inst, "custom_golden_farmhoe_garden") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "COTTAGE", "GOLDENFARMHOE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_golden_farmhoe_invisible",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_golden_farmhoe_invisible.zip"),
        Asset("PKGREF", "anim/dynamic/custom_golden_farmhoe_invisible.dyn"),
    },
    base_prefab = "golden_farm_hoe" ,
    build_name_override = "custom_golden_farmhoe_invisible" ,
    init_fn = function(inst) golden_farm_hoe_init_fn(inst, "custom_golden_farmhoe_invisible") end,
    rarity = "Classy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "INVISIBLE", "GOLDENFARMHOE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_goldenaxe_invisible",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_goldenaxe_invisible.zip"),
        Asset("PKGREF", "anim/dynamic/custom_goldenaxe_invisible.dyn"),
    },
    base_prefab = "goldenaxe" ,
    build_name_override = "custom_goldenaxe_invisible" ,
    init_fn = function(inst) goldenaxe_init_fn(inst, "custom_goldenaxe_invisible") end,
    rarity = "Classy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "INVISIBLE", "GOLDENAXE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_goldenaxe_northern",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_goldenaxe_northern.zip"),
        Asset("PKGREF", "anim/dynamic/custom_goldenaxe_northern.dyn"),
    },
    base_prefab = "goldenaxe" ,
    build_name_override = "custom_goldenaxe_northern" ,
    init_fn = function(inst) goldenaxe_init_fn(inst, "custom_goldenaxe_northern") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "GOLDENAXE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_goldenpickaxe_invisible",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_goldenpickaxe_invisible.zip"),
        Asset("PKGREF", "anim/dynamic/custom_goldenpickaxe_invisible.dyn"),
    },
    base_prefab = "goldenpickaxe" ,
    build_name_override = "custom_goldenpickaxe_invisible" ,
    init_fn = function(inst) goldenpickaxe_init_fn(inst, "custom_goldenpickaxe_invisible") end,
    rarity = "Classy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "INVISIBLE", "GOLDENPICKAXE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_goldenpickaxe_northern",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_goldenpickaxe_northern.zip"),
        Asset("PKGREF", "anim/dynamic/custom_goldenpickaxe_northern.dyn"),
    },
    base_prefab = "goldenpickaxe" ,
    build_name_override = "custom_goldenpickaxe_northern" ,
    init_fn = function(inst) goldenpickaxe_init_fn(inst, "custom_goldenpickaxe_northern") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "GOLDENPICKAXE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_goldenpitchfork_invisible",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_goldenpitchfork_invisible.zip"),
        Asset("PKGREF", "anim/dynamic/custom_goldenpitchfork_invisible.dyn"),
    },
    base_prefab = "goldenpitchfork" ,
    build_name_override = "custom_goldenpitchfork_invisible" ,
    init_fn = function(inst) goldenpitchfork_init_fn(inst, "custom_goldenpitchfork_invisible") end,
    rarity = "Classy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "GOLDENPITCHFORK", "INVISIBLE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_goldenshovel_invisible",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_goldenshovel_invisible.zip"),
        Asset("PKGREF", "anim/dynamic/custom_goldenshovel_invisible.dyn"),
    },
    base_prefab = "goldenshovel" ,
    build_name_override = "custom_goldenshovel_invisible" ,
    init_fn = function(inst) goldenshovel_init_fn(inst, "custom_goldenshovel_invisible") end,
    rarity = "Classy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "INVISIBLE", "GOLDENSHOVEL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_goldenshovel_northern",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_goldenshovel_northern.zip"),
        Asset("PKGREF", "anim/dynamic/custom_goldenshovel_northern.dyn"),
    },
    base_prefab = "goldenshovel" ,
    build_name_override = "custom_goldenshovel_northern" ,
    init_fn = function(inst) goldenshovel_init_fn(inst, "custom_goldenshovel_northern") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "GOLDENSHOVEL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_gravestone_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_gravestone_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_gravestone_fantasy.dyn"),
    },
    base_prefab = "gravestone" ,
    build_name_override = "custom_gravestone_fantasy" ,
    granted_items = { "custom_dug_gravestone_fantasy" , },
    init_fn = function(inst) gravestone_init_fn(inst, "custom_gravestone_fantasy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "GRAVESTONE", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_gravestone_fantasy2",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_gravestone_fantasy2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_gravestone_fantasy2.dyn"),
    },
    base_prefab = "gravestone" ,
    build_name_override = "custom_gravestone_fantasy2" ,
    granted_items = { "custom_dug_gravestone_fantasy2" , },
    init_fn = function(inst) gravestone_init_fn(inst, "custom_gravestone_fantasy2") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "GRAVESTONE", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_gravestone_fantasy3",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_gravestone_fantasy3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_gravestone_fantasy3.dyn"),
    },
    base_prefab = "gravestone" ,
    build_name_override = "custom_gravestone_fantasy3" ,
    granted_items = { "custom_dug_gravestone_fantasy3" , },
    init_fn = function(inst) gravestone_init_fn(inst, "custom_gravestone_fantasy3") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "GRAVESTONE", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_gravestone_fantasy4",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_gravestone_fantasy4.zip"),
        Asset("PKGREF", "anim/dynamic/custom_gravestone_fantasy4.dyn"),
    },
    base_prefab = "gravestone" ,
    build_name_override = "custom_gravestone_fantasy4" ,
    granted_items = { "custom_dug_gravestone_fantasy4" , },
    init_fn = function(inst) gravestone_init_fn(inst, "custom_gravestone_fantasy4") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "GRAVESTONE", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_gravestone_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_gravestone_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_gravestone_gothic.dyn"),
    },
    base_prefab = "gravestone" ,
    build_name_override = "custom_gravestone_gothic" ,
    granted_items = { "custom_dug_gravestone_gothic" , },
    init_fn = function(inst) gravestone_init_fn(inst, "custom_gravestone_gothic") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "GRAVESTONE", "GOTHIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_gravestone_gothic2",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_gravestone_gothic2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_gravestone_gothic2.dyn"),
    },
    base_prefab = "gravestone" ,
    build_name_override = "custom_gravestone_gothic2" ,
    granted_items = { "custom_dug_gravestone_gothic2" , },
    init_fn = function(inst) gravestone_init_fn(inst, "custom_gravestone_gothic2") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "GRAVESTONE", "GOTHIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_gravestone_gothic3",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_gravestone_gothic3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_gravestone_gothic3.dyn"),
    },
    base_prefab = "gravestone" ,
    build_name_override = "custom_gravestone_gothic3" ,
    granted_items = { "custom_dug_gravestone_gothic3" , },
    init_fn = function(inst) gravestone_init_fn(inst, "custom_gravestone_gothic3") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "GRAVESTONE", "GOTHIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_gravestone_gothic4",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_gravestone_gothic4.zip"),
        Asset("PKGREF", "anim/dynamic/custom_gravestone_gothic4.dyn"),
    },
    base_prefab = "gravestone" ,
    build_name_override = "custom_gravestone_gothic4" ,
    granted_items = { "custom_dug_gravestone_gothic4" , },
    init_fn = function(inst) gravestone_init_fn(inst, "custom_gravestone_gothic4") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "GRAVESTONE", "GOTHIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_greenstaff_an",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_greenstaff_an.zip"),
        Asset("PKGREF", "anim/dynamic/custom_greenstaff_an.dyn"),
    },
    base_prefab = "greenstaff" ,
    build_name_override = "custom_greenstaff_an" ,
    init_fn = function(inst) greenstaff_init_fn(inst, "custom_greenstaff_an") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "GREENSTAFF", "ARTNOUVEAU", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_greenstaff_clockwork",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_greenstaff_clockwork.zip"),
        Asset("PKGREF", "anim/dynamic/custom_greenstaff_clockwork.dyn"),
    },
    base_prefab = "greenstaff" ,
    build_name_override = "custom_greenstaff_clockwork" ,
    init_fn = function(inst) greenstaff_init_fn(inst, "custom_greenstaff_clockwork") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "GREENSTAFF", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_hambat_nautical",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_hambat_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_hambat_nautical.dyn"),
    },
    base_prefab = "hambat" ,
    build_name_override = "custom_hambat_nautical" ,
    init_fn = function(inst) hambat_init_fn(inst, "custom_hambat_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "HAMBAT", "NAUTICAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_hambat_potroast",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_hambat_potroast.zip"),
        Asset("PKGREF", "anim/dynamic/custom_hambat_potroast.dyn"),
    },
    base_prefab = "hambat" ,
    build_name_override = "custom_hambat_potroast" ,
    init_fn = function(inst) hambat_init_fn(inst, "custom_hambat_potroast") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "HAMBAT", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_hambat_spiralcut",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_hambat_spiralcut.zip"),
        Asset("PKGREF", "anim/dynamic/custom_hambat_spiralcut.dyn"),
    },
    base_prefab = "hambat" ,
    build_name_override = "custom_hambat_spiralcut" ,
    init_fn = function(inst) hambat_init_fn(inst, "custom_hambat_spiralcut") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "HAMBAT", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_hammer_crowbar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_hammer_crowbar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_hammer_crowbar.dyn"),
    },
    base_prefab = "hammer" ,
    build_name_override = "custom_hammer_crowbar" ,
    init_fn = function(inst) hammer_init_fn(inst, "custom_hammer_crowbar") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "HAMMER", "YOTP", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_hammer_forge",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_hammer_forge.zip"),
        Asset("PKGREF", "anim/dynamic/custom_hammer_forge.dyn"),
    },
    base_prefab = "hammer" ,
    build_name_override = "custom_hammer_forge" ,
    init_fn = function(inst) hammer_init_fn(inst, "custom_hammer_forge") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "HAMMER", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_hammer_hammush",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_hammer_hammush.zip"),
        Asset("PKGREF", "anim/dynamic/custom_hammer_hammush.dyn"),
    },
    base_prefab = "hammer" ,
    build_name_override = "custom_hammer_hammush" ,
    init_fn = function(inst) hammer_init_fn(inst, "custom_hammer_hammush") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_sound = { ["hit"] = "terraria1/skins/hammush", },
    skin_tags = { "HAMMER", "T_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_hammer_invisible",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_hammer_invisible.zip"),
        Asset("PKGREF", "anim/dynamic/custom_hammer_invisible.dyn"),
    },
    base_prefab = "hammer" ,
    build_name_override = "custom_hammer_invisible" ,
    init_fn = function(inst) hammer_init_fn(inst, "custom_hammer_invisible") end,
    rarity = "Classy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "HAMMER", "INVISIBLE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_hat_catcoon_costume",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_hat_catcoon_costume.zip"),
        Asset("PKGREF", "anim/dynamic/custom_hat_catcoon_costume.dyn"),
    },
    base_prefab = "tophat" ,
    build_name_override = "custom_hat_catcoon_costume" ,
    granted_items = { "custom_researchlab4_catcoon_costume" , },
    init_fn = function(inst) tophat_init_fn(inst, "custom_hat_catcoon_costume") end,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    skin_tags = { "TOPHAT", "COSTUME", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_hat_chester_costume",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_hat_chester_costume.zip"),
        Asset("PKGREF", "anim/dynamic/custom_hat_chester_costume.dyn"),
    },
    base_prefab = "tophat" ,
    build_name_override = "custom_hat_chester_costume" ,
    granted_items = { "custom_researchlab4_chester_costume" , },
    init_fn = function(inst) tophat_init_fn(inst, "custom_hat_chester_costume") end,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    skin_tags = { "TOPHAT", "COSTUME", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_hat_dog_helm",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_hat_dog_helm.zip"),
        Asset("PKGREF", "anim/dynamic/custom_hat_dog_helm.dyn"),
    },
    base_prefab = "footballhat" ,
    build_name_override = "custom_hat_dog_helm" ,
    init_fn = function(inst) footballhat_init_fn(inst, "custom_hat_dog_helm") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FOOTBALLHAT", "VARG", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_hat_dreadstone_horn",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_hat_dreadstone_horn.zip"),
        Asset("PKGREF", "anim/dynamic/custom_hat_dreadstone_horn.dyn"),
    },
    base_prefab = "dreadstonehat" ,
    build_name_override = "custom_hat_dreadstone_horn" ,
    init_fn = function(inst) dreadstonehat_init_fn(inst, "custom_hat_dreadstone_horn") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SHADOW", "DREADSTONEHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_hat_glommer_costume",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_hat_glommer_costume.zip"),
        Asset("PKGREF", "anim/dynamic/custom_hat_glommer_costume.dyn"),
    },
    base_prefab = "tophat" ,
    build_name_override = "custom_hat_glommer_costume" ,
    granted_items = { "custom_researchlab4_glommer_costume" , },
    init_fn = function(inst) tophat_init_fn(inst, "custom_hat_glommer_costume") end,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    skin_tags = { "TOPHAT", "COSTUME", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_hat_hutch_costume",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_hat_hutch_costume.zip"),
        Asset("PKGREF", "anim/dynamic/custom_hat_hutch_costume.dyn"),
    },
    base_prefab = "tophat" ,
    build_name_override = "custom_hat_hutch_costume" ,
    granted_items = { "custom_researchlab4_hutch_costume" , },
    init_fn = function(inst) tophat_init_fn(inst, "custom_hat_hutch_costume") end,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    skin_tags = { "TOPHAT", "COSTUME", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_hat_puppy_cap",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_hat_puppy_cap.zip"),
        Asset("PKGREF", "anim/dynamic/custom_hat_puppy_cap.dyn"),
    },
    base_prefab = "catcoonhat" ,
    build_name_override = "custom_hat_puppy_cap" ,
    init_fn = function(inst) catcoonhat_init_fn(inst, "custom_hat_puppy_cap") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CATCOONHAT", "VARG", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_heatrock_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_heatrock_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_heatrock_fantasy.dyn"),
    },
    base_prefab = "heatrock" ,
    build_name_override = "custom_heatrock_fantasy" ,
    init_fn = function(inst) heatrock_init_fn(inst, "custom_heatrock_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "HEATROCK", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_heatrock_fire",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_heatrock_fire.zip"),
        Asset("PKGREF", "anim/dynamic/custom_heatrock_fire.dyn"),
    },
    base_prefab = "heatrock" ,
    build_name_override = "custom_heatrock_fire" ,
    init_fn = function(inst) heatrock_init_fn(inst, "custom_heatrock_fire") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "HEATROCK", "CRYSTAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_hivehat_an",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_hivehat_an.zip"),
        Asset("PKGREF", "anim/dynamic/custom_hivehat_an.dyn"),
    },
    base_prefab = "hivehat" ,
    build_name_override = "custom_hivehat_an" ,
    init_fn = function(inst) hivehat_init_fn(inst, "custom_hivehat_an") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "HIVEHAT", "ARTNOUVEAU", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_hivehat_cawnival",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_hivehat_cawnival.zip"),
        Asset("PKGREF", "anim/dynamic/custom_hivehat_cawnival.dyn"),
    },
    base_prefab = "hivehat" ,
    build_name_override = "custom_hivehat_cawnival" ,
    init_fn = function(inst) hivehat_init_fn(inst, "custom_hivehat_cawnival") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "HIVEHAT", "CAWNIVAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_hutch_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_hutch_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_hutch_fantasy.dyn"),
    },
    base_prefab = "hutch" ,
    build_name_override = "custom_hutch_fantasy" ,
    granted_items = { "custom_hutch_fishbowl_fantasy" , },
    init_fn = function(inst) hutch_init_fn(inst, "custom_hutch_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FANTASY", "HUTCH", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_hutch_fishbowl_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_hutch_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_hutch_fantasy.dyn"),
    },
    base_prefab = "hutch_fishbowl" ,
    build_name_override = "custom_hutch_fantasy" ,
    init_fn = function(inst) hutch_fishbowl_init_fn(inst, "custom_hutch_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_icebox_coffin",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_icebox_coffin.zip"),
        Asset("PKGREF", "anim/dynamic/custom_icebox_coffin.dyn"),
    },
    base_prefab = "icebox" ,
    build_name_override = "custom_icebox_coffin" ,
    fx_prefab = { "", "icebox_coffin_bat_fx", },
    init_fn = function(inst) icebox_init_fn(inst, "custom_icebox_coffin") end,
    prefabs = { "icebox_coffin_bat_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "HALLOWED", "ICEBOX", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_icebox_crystal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_icebox_crystal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_icebox_crystal.dyn"),
    },
    base_prefab = "icebox" ,
    build_name_override = "custom_icebox_crystal" ,
    fx_prefab = { "icebox_crystal_fx", },
    init_fn = function(inst) icebox_init_fn(inst, "custom_icebox_crystal") end,
    prefabs = { "icebox_crystal_fx", },
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "CRYSTAL", "ICEBOX", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_icebox_kitchen",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_icebox_kitchen.zip"),
        Asset("PKGREF", "anim/dynamic/custom_icebox_kitchen.dyn"),
    },
    base_prefab = "icebox" ,
    build_name_override = "custom_icebox_kitchen" ,
    fx_prefab = { "icebox_kitchen_fx", },
    init_fn = function(inst) icebox_init_fn(inst, "custom_icebox_kitchen") end,
    prefabs = { "icebox_kitchen_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ICEBOX", "COTTAGE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_icebox_porcelain",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_icebox_porcelain.zip"),
        Asset("PKGREF", "anim/dynamic/custom_icebox_porcelain.dyn"),
    },
    base_prefab = "icebox" ,
    build_name_override = "custom_icebox_porcelain" ,
    fx_prefab = { "icebox_porcelain_fx", },
    init_fn = function(inst) icebox_init_fn(inst, "custom_icebox_porcelain") end,
    prefabs = { "icebox_porcelain_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ICEBOX", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_icebox_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_icebox_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_icebox_victorian.dyn"),
    },
    base_prefab = "icebox" ,
    build_name_override = "custom_icebox_victorian" ,
    fx_prefab = { "icebox_victorian_frost_fx", },
    init_fn = function(inst) icebox_init_fn(inst, "custom_icebox_victorian") end,
    prefabs = { "icebox_victorian_frost_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "VICTORIAN", "ICEBOX", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_icepack_kitchen",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_icepack_kitchen.zip"),
        Asset("PKGREF", "anim/dynamic/custom_icepack_kitchen.dyn"),
    },
    base_prefab = "icepack" ,
    build_name_override = "custom_icepack_kitchen" ,
    init_fn = function(inst) icepack_init_fn(inst, "custom_icepack_kitchen") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ICEPACK", "COTTAGE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_icestaff_bee",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_icestaff_bee.zip"),
        Asset("PKGREF", "anim/dynamic/custom_icestaff_bee.dyn"),
    },
    base_prefab = "icestaff" ,
    build_name_override = "custom_icestaff_bee" ,
    init_fn = function(inst) icestaff_init_fn(inst, "custom_icestaff_bee") end,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_icestaff_gungnir",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_icestaff_gungnir.zip"),
        Asset("PKGREF", "anim/dynamic/custom_icestaff_gungnir.dyn"),
    },
    base_prefab = "icestaff" ,
    build_name_override = "custom_icestaff_gungnir" ,
    init_fn = function(inst) icestaff_init_fn(inst, "custom_icestaff_gungnir") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_icestaff_hockey",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_icestaff_hockey.zip"),
        Asset("PKGREF", "anim/dynamic/custom_icestaff_hockey.dyn"),
    },
    base_prefab = "icestaff" ,
    build_name_override = "custom_icestaff_hockey" ,
    init_fn = function(inst) icestaff_init_fn(inst, "custom_icestaff_hockey") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_icestaff_icerod",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_icestaff_icerod.zip"),
        Asset("PKGREF", "anim/dynamic/custom_icestaff_icerod.dyn"),
    },
    base_prefab = "icestaff" ,
    build_name_override = "custom_icestaff_icerod" ,
    init_fn = function(inst) icestaff_init_fn(inst, "custom_icestaff_icerod") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_sound = { ["genericuse"] = "terraria1/skins/icerod", },
    skin_tags = { "ICESTAFF", "T_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_icestaff_lance",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_icestaff_lance.zip"),
        Asset("PKGREF", "anim/dynamic/custom_icestaff_lance.dyn"),
    },
    base_prefab = "icestaff" ,
    build_name_override = "custom_icestaff_lance" ,
    init_fn = function(inst) icestaff_init_fn(inst, "custom_icestaff_lance") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_icestaff_northern",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_icestaff_northern.zip"),
        Asset("PKGREF", "anim/dynamic/custom_icestaff_northern.dyn"),
    },
    base_prefab = "icestaff" ,
    build_name_override = "custom_icestaff_northern" ,
    init_fn = function(inst) icestaff_init_fn(inst, "custom_icestaff_northern") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_icestaff_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_icestaff_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_icestaff_rose.dyn"),
    },
    base_prefab = "icestaff" ,
    build_name_override = "custom_icestaff_rose" ,
    init_fn = function(inst) icestaff_init_fn(inst, "custom_icestaff_rose") end,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_insanityrock_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_sanityrock_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_sanityrock_fantasy.dyn"),
    },
    base_prefab = "insanityrock" ,
    build_name_override = "custom_sanityrock_fantasy" ,
    init_fn = function(inst) insanityrock_init_fn(inst, "custom_sanityrock_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "INSANITYROCK", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_insanityrock_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_sanityrock_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_sanityrock_gothic.dyn"),
    },
    base_prefab = "insanityrock" ,
    build_name_override = "custom_sanityrock_gothic" ,
    init_fn = function(inst) insanityrock_init_fn(inst, "custom_sanityrock_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "INSANITYROCK", "GOTHIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_kitten_black",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_kitten_black.zip"),
        Asset("PKGREF", "anim/dynamic/custom_kitten_black.dyn"),
    },
    base_prefab = "critter_kitten" ,
    build_name_override = "custom_kitten_black" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_kitten_black", "kittington_build" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PET", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_kitten_black_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_kitten_black.zip"),
        Asset("PKGREF", "anim/dynamic/custom_kitten_black.dyn"),
    },
    base_prefab = "critter_kitten_builder" ,
    build_name_override = "custom_kitten_black" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_kitten_black" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_kitten_winter",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_kitten_winter.zip"),
        Asset("PKGREF", "anim/dynamic/custom_kitten_winter.dyn"),
    },
    base_prefab = "critter_kitten" ,
    build_name_override = "custom_kitten_winter" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_kitten_winter", "kittington_build" ) end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "PET", "WINTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_kitten_winter_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_kitten_winter.zip"),
        Asset("PKGREF", "anim/dynamic/custom_kitten_winter.dyn"),
    },
    base_prefab = "critter_kitten_builder" ,
    build_name_override = "custom_kitten_winter" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_kitten_winter" ) end,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_krampus_sack_basket",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_krampus_sack_basket.zip"),
        Asset("PKGREF", "anim/dynamic/custom_krampus_sack_basket.dyn"),
    },
    base_prefab = "krampus_sack" ,
    build_name_override = "custom_krampus_sack_basket" ,
    init_fn = function(inst) krampus_sack_init_fn(inst, "custom_krampus_sack_basket") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "KRAMPUS_SACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_krampus_sack_garden",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_krampus_sack_garden.zip"),
        Asset("PKGREF", "anim/dynamic/custom_krampus_sack_garden.dyn"),
    },
    base_prefab = "krampus_sack" ,
    build_name_override = "custom_krampus_sack_garden" ,
    init_fn = function(inst) krampus_sack_init_fn(inst, "custom_krampus_sack_garden") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "KRAMPUS_SACK", "COTTAGE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_krampus_sack_voidbag",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_krampus_sack_voidbag.zip"),
        Asset("PKGREF", "anim/dynamic/custom_krampus_sack_voidbag.dyn"),
    },
    base_prefab = "krampus_sack" ,
    build_name_override = "custom_krampus_sack_voidbag" ,
    init_fn = function(inst) krampus_sack_init_fn(inst, "custom_krampus_sack_voidbag") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_sound = { ["open_ui"] = "terraria1/skins/voidbag", },
    skin_tags = { "KRAMPUS_SACK", "T_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lamb_cotl",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lamb_cotl.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lamb_cotl.dyn"),
    },
    base_prefab = "critter_lamb" ,
    build_name_override = "custom_lamb_cotl" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_lamb_cotl", "sheepington_build" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PET", "C_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lamb_cotl_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lamb_cotl.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lamb_cotl.dyn"),
    },
    base_prefab = "critter_lamb_builder" ,
    build_name_override = "custom_lamb_cotl" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_lamb_cotl" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lamb_dark",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lamb_dark.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lamb_dark.dyn"),
    },
    base_prefab = "critter_lamb" ,
    build_name_override = "custom_lamb_dark" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_lamb_dark", "sheepington_build" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PET", "SHADOW", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lamb_dark_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lamb_dark.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lamb_dark.dyn"),
    },
    base_prefab = "critter_lamb_builder" ,
    build_name_override = "custom_lamb_dark" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_lamb_dark" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lamb_winter",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lamb_winter.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lamb_winter.dyn"),
    },
    base_prefab = "critter_lamb" ,
    build_name_override = "custom_lamb_winter" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_lamb_winter", "sheepington_build" ) end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "PET", "WINTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lamb_winter_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lamb_winter.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lamb_winter.dyn"),
    },
    base_prefab = "critter_lamb_builder" ,
    build_name_override = "custom_lamb_winter" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_lamb_winter" ) end,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lantern_crystal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lantern_crystal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lantern_crystal.dyn"),
    },
    base_prefab = "lantern" ,
    build_name_override = "custom_lantern_crystal" ,
    fx_prefab = { "lantern_crystal_fx_held", "lantern_crystal_fx_ground", },
    init_fn = function(inst) lantern_init_fn(inst, "custom_lantern_crystal", { "ddot_small" }, Vector3(93, -55, 0)) end,
    prefabs = { "lantern_crystal_fx_held", "lantern_crystal_fx_ground", },
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "LANTERN", "CRYSTAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lantern_flower",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lantern_flower.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lantern_flower.dyn"),
    },
    base_prefab = "lantern" ,
    build_name_override = "custom_lantern_flower" ,
    fx_prefab = { "lantern_flower_fx_held", "lantern_flower_fx_ground", },
    init_fn = function(inst) lantern_init_fn(inst, "custom_lantern_flower", { "petal" }, Vector3(67, -7, 0)) end,
    prefabs = { "lantern_flower_fx_held", "lantern_flower_fx_ground", },
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "LANTERN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lantern_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lantern_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lantern_gothic.dyn"),
    },
    base_prefab = "lantern" ,
    build_name_override = "custom_lantern_gothic" ,
    fx_prefab = { "lantern_gothic_fx_held", "lantern_gothic_fx_ground", },
    init_fn = function(inst) lantern_init_fn(inst, "custom_lantern_gothic", { "glowflake" }, Vector3(67, -7, 0)) end,
    prefabs = { "lantern_gothic_fx_held", "lantern_gothic_fx_ground", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "LANTERN", "GOTHIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lantern_mummy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lantern_mummy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lantern_mummy.dyn"),
    },
    base_prefab = "lantern" ,
    build_name_override = "custom_lantern_mummy" ,
    init_fn = function(inst) lantern_init_fn(inst, "custom_lantern_mummy") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "LANTERN", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lantern_retro",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lantern_retro.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lantern_retro.dyn"),
    },
    base_prefab = "lantern" ,
    build_name_override = "custom_lantern_retro" ,
    init_fn = function(inst) lantern_init_fn(inst, "custom_lantern_retro") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "RETRO", "LANTERN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lantern_tesla",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lantern_tesla.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lantern_tesla.dyn"),
    },
    base_prefab = "lantern" ,
    build_name_override = "custom_lantern_tesla" ,
    fx_prefab = { "lantern_tesla_fx_held", "lantern_tesla_fx_ground", },
    init_fn = function(inst) lantern_init_fn(inst, "custom_lantern_tesla", { "bolt_b", "bolt_c" }, Vector3(67, -7, 0)) end,
    marketable = true,
    prefabs = { "lantern_tesla_fx_held", "lantern_tesla_fx_ground", },
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "LANTERN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lantern_winter",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lantern_winter.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lantern_winter.dyn"),
    },
    base_prefab = "lantern" ,
    build_name_override = "custom_lantern_winter" ,
    fx_prefab = { "lantern_winter_fx_held", "lantern_winter_fx_ground", },
    init_fn = function(inst) lantern_init_fn(inst, "custom_lantern_winter", { "snowflake" }, Vector3(67, -7, 0)) end,
    prefabs = { "lantern_winter_fx_held", "lantern_winter_fx_ground", },
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "LANTERN", "WINTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lighter_glass",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lighter_glass.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lighter_glass.dyn"),
    },
    base_prefab = "lighter" ,
    build_name_override = "custom_lighter_glass" ,
    fx_prefab = { "lighterfire_glass", },
    init_fn = function(inst) lighter_init_fn(inst, "custom_lighter_glass") end,
    prefabs = { "lighterfire_glass", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "LIGHTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lighter_haunteddoll",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lighter_haunteddoll.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lighter_haunteddoll.dyn"),
    },
    base_prefab = "lighter" ,
    build_name_override = "custom_lighter_haunteddoll" ,
    fx_prefab = { "lighterfire_haunteddoll", },
    init_fn = function(inst) lighter_init_fn(inst, "custom_lighter_haunteddoll") end,
    prefabs = { "lighterfire_haunteddoll", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "LIGHTER", "HAUNTEDDOLL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lighter_heart",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lighter_heart.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lighter_heart.dyn"),
    },
    base_prefab = "lighter" ,
    build_name_override = "custom_lighter_heart" ,
    fx_prefab = { "lighterfire_heart", },
    init_fn = function(inst) lighter_init_fn(inst, "custom_lighter_heart") end,
    prefabs = { "lighterfire_heart", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "LIGHTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lighter_old",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lighter_old.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lighter_old.dyn"),
    },
    base_prefab = "lighter" ,
    build_name_override = "custom_lighter_old" ,
    fx_prefab = { "lighterfire_old", },
    init_fn = function(inst) lighter_init_fn(inst, "custom_lighter_old") end,
    prefabs = { "lighterfire_old", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "LIGHTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lighter_ragged",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lighter_ragged.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lighter_ragged.dyn"),
    },
    base_prefab = "lighter" ,
    build_name_override = "custom_lighter_ragged" ,
    fx_prefab = { "lighterfire_ragged", },
    init_fn = function(inst) lighter_init_fn(inst, "custom_lighter_ragged") end,
    prefabs = { "lighterfire_ragged", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "LIGHTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lighter_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lighter_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lighter_rose.dyn"),
    },
    base_prefab = "lighter" ,
    build_name_override = "custom_lighter_rose" ,
    fx_prefab = { "lighterfire_rose", },
    init_fn = function(inst) lighter_init_fn(inst, "custom_lighter_rose") end,
    prefabs = { "lighterfire_rose", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "LIGHTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lightning_rod_adventure",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lightning_rod_adventure.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lightning_rod_adventure.dyn"),
    },
    base_prefab = "lightning_rod" ,
    build_name_override = "custom_lightning_rod_adventure" ,
    init_fn = function(inst) lightning_rod_init_fn(inst, "custom_lightning_rod_adventure") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "LIGHTNING_ROD", "ADVENTURE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lightning_rod_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lightning_rod_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lightning_rod_gothic.dyn"),
    },
    base_prefab = "lightning_rod" ,
    build_name_override = "custom_lightning_rod_gothic" ,
    init_fn = function(inst) lightning_rod_init_fn(inst, "custom_lightning_rod_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "LIGHTNING_ROD", "GOTHIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lightning_rod_nautical",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lightning_rod_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lightning_rod_nautical.dyn"),
    },
    base_prefab = "lightning_rod" ,
    build_name_override = "custom_lightning_rod_nautical" ,
    init_fn = function(inst) lightning_rod_init_fn(inst, "custom_lightning_rod_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "LIGHTNING_ROD", "NAUTICAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lightning_rod_retro",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lightning_rod_retro.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lightning_rod_retro.dyn"),
    },
    base_prefab = "lightning_rod" ,
    build_name_override = "custom_lightning_rod_retro" ,
    init_fn = function(inst) lightning_rod_init_fn(inst, "custom_lightning_rod_retro") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "LIGHTNING_ROD", "RETRO", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lightning_rod_robot",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lightning_rod_robot.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lightning_rod_robot.dyn"),
    },
    base_prefab = "lightning_rod" ,
    build_name_override = "custom_lightning_rod_robot" ,
    init_fn = function(inst) lightning_rod_init_fn(inst, "custom_lightning_rod_robot") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "LIGHTNING_ROD", "YOTP", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lucy_broadaxe",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lucy_broadaxe.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lucy_broadaxe.dyn"),
    },
    base_prefab = "lucy" ,
    build_name_override = "custom_lucy_broadaxe" ,
    init_fn = function(inst) lucy_init_fn(inst, "custom_lucy_broadaxe") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "LUCY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lucy_chained",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lucy_chained.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lucy_chained.dyn"),
    },
    base_prefab = "lucy" ,
    build_name_override = "custom_lucy_chained" ,
    init_fn = function(inst) lucy_init_fn(inst, "custom_lucy_chained") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "LUCY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lucy_picnic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lucy_picnic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lucy_picnic.dyn"),
    },
    base_prefab = "lucy" ,
    build_name_override = "custom_lucy_picnic" ,
    init_fn = function(inst) lucy_init_fn(inst, "custom_lucy_picnic") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "LUCY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lucy_punk",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lucy_punk.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lucy_punk.dyn"),
    },
    base_prefab = "lucy" ,
    build_name_override = "custom_lucy_punk" ,
    init_fn = function(inst) lucy_init_fn(inst, "custom_lucy_punk") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "LUCY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lunarmoth_bright",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lunarmoth_bright.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lunarmoth_bright.dyn"),
    },
    base_prefab = "critter_lunarmothling" ,
    build_name_override = "custom_lunarmoth_bright" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_lunarmoth_bright", "lunarmoth_build" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PET", "LUNAR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_lunarmoth_bright_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_lunarmoth_bright.zip"),
        Asset("PKGREF", "anim/dynamic/custom_lunarmoth_bright.dyn"),
    },
    base_prefab = "critter_lunarmothling_builder" ,
    build_name_override = "custom_lunarmoth_bright" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_lunarmoth_bright" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_magician_chest_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_magician_chest_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_magician_chest_shadow.dyn"),
    },
    base_prefab = "magician_chest" ,
    build_name_override = "custom_magician_chest_shadow" ,
    init_fn = function(inst) magician_chest_init_fn(inst, "custom_magician_chest_shadow") end,
    rarity = "ProofOfPurchase",
    release_group = groupid,
    skin_tags = { "MAGICIAN_CHEST", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mast_crabking",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mast_crabking.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mast_crabking.dyn"),
    },
    base_prefab = "mast" ,
    build_name_override = "custom_mast_crabking" ,
    init_fn = function(inst) mast_init_fn(inst, "custom_mast_crabking") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "MAST", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mast_crabking_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mast_crabking.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mast_crabking.dyn"),
    },
    base_prefab = "mast_item" ,
    build_name_override = "custom_mast_crabking" ,
    init_fn = function(inst) mast_item_init_fn(inst, "custom_mast_crabking") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mast_malbatross_wagstaff",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mast_malbatross_wagstaff.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mast_malbatross_wagstaff.dyn"),
    },
    base_prefab = "mast_malbatross" ,
    build_name_override = "custom_mast_malbatross_wagstaff" ,
    init_fn = function(inst) mast_malbatross_init_fn(inst, "custom_mast_malbatross_wagstaff") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "MAST_MALBATROSS", "WAGSTAFF", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mast_malbatross_wagstaff_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mast_malbatross_wagstaff.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mast_malbatross_wagstaff.dyn"),
    },
    base_prefab = "mast_malbatross_item" ,
    build_name_override = "custom_mast_malbatross_wagstaff" ,
    init_fn = function(inst) mast_malbatross_item_init_fn(inst, "custom_mast_malbatross_wagstaff") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mast_nautical",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mast_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mast_nautical.dyn"),
    },
    base_prefab = "mast" ,
    build_name_override = "custom_mast_nautical" ,
    init_fn = function(inst) mast_init_fn(inst, "custom_mast_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "MAST", "NAUTICAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mast_nautical_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mast_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mast_nautical.dyn"),
    },
    base_prefab = "mast_item" ,
    build_name_override = "custom_mast_nautical" ,
    init_fn = function(inst) mast_item_init_fn(inst, "custom_mast_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mast_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mast_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mast_pirate.dyn"),
    },
    base_prefab = "mast" ,
    build_name_override = "custom_mast_pirate" ,
    init_fn = function(inst) mast_init_fn(inst, "custom_mast_pirate") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "MAST", "PIRATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mast_pirate_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mast_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mast_pirate.dyn"),
    },
    base_prefab = "mast_item" ,
    build_name_override = "custom_mast_pirate" ,
    init_fn = function(inst) mast_item_init_fn(inst, "custom_mast_pirate") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mast_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mast_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mast_rose.dyn"),
    },
    base_prefab = "mast" ,
    build_name_override = "custom_mast_rose" ,
    init_fn = function(inst) mast_init_fn(inst, "custom_mast_rose") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "MAST", "ROSE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mast_rose_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mast_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mast_rose.dyn"),
    },
    base_prefab = "mast_item" ,
    build_name_override = "custom_mast_rose" ,
    init_fn = function(inst) mast_item_init_fn(inst, "custom_mast_rose") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mastupgrade_lightningrod_item_nautical",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mastupgrade_lightningrod_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mastupgrade_lightningrod_nautical.dyn"),
    },
    base_prefab = "mastupgrade_lightningrod_item" ,
    build_name_override = "custom_mastupgrade_lightningrod_nautical" ,
    init_fn = function(inst) mastupgrade_lightningrod_item_init_fn(inst, "custom_mastupgrade_lightningrod_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mastupgrade_lightningrod_nautical",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mastupgrade_lightningrod_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mastupgrade_lightningrod_nautical.dyn"),
    },
    base_prefab = "mastupgrade_lightningrod" ,
    build_name_override = "custom_mastupgrade_lightningrod_nautical" ,
    init_fn = function(inst) mastupgrade_lightningrod_init_fn(inst, "custom_mastupgrade_lightningrod_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "MASTUPGRADE_ROD", "NAUTICAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mastupgrade_lightningrod_nautical_top",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mastupgrade_lightningrod_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mastupgrade_lightningrod_nautical.dyn"),
    },
    base_prefab = "mastupgrade_lightningrod_top" ,
    build_name_override = "custom_mastupgrade_lightningrod_nautical" ,
    init_fn = function(inst) mastupgrade_lightningrod_top_init_fn(inst, "custom_mastupgrade_lightningrod_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mastupgradelamp_item_nautical",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mastupgradelamp_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mastupgradelamp_nautical.dyn"),
    },
    base_prefab = "mastupgrade_lamp_item" ,
    build_name_override = "custom_mastupgradelamp_nautical" ,
    init_fn = function(inst) mastupgrade_lamp_item_init_fn(inst, "custom_mastupgradelamp_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mastupgradelamp_nautical",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mastupgradelamp_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mastupgradelamp_nautical.dyn"),
    },
    base_prefab = "mastupgrade_lamp" ,
    build_name_override = "custom_mastupgradelamp_nautical" ,
    init_fn = function(inst) mastupgrade_lamp_init_fn(inst, "custom_mastupgradelamp_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "MASTUPGRADE_LAMP", "NAUTICAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_meatrack_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_meatrack_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_meatrack_ancient.dyn"),
    },
    base_prefab = "meatrack" ,
    build_name_override = "custom_meatrack_ancient" ,
    init_fn = function(inst) meatrack_init_fn(inst, "custom_meatrack_ancient") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ANCIENT", "MEATRACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_meatrack_butcher",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_meatrack_butcher.zip"),
        Asset("PKGREF", "anim/dynamic/custom_meatrack_butcher.dyn"),
    },
    base_prefab = "meatrack" ,
    build_name_override = "custom_meatrack_butcher" ,
    init_fn = function(inst) meatrack_init_fn(inst, "custom_meatrack_butcher") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "MEATRACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_meatrack_circus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_meatrack_circus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_meatrack_circus.dyn"),
    },
    base_prefab = "meatrack" ,
    build_name_override = "custom_meatrack_circus" ,
    init_fn = function(inst) meatrack_init_fn(inst, "custom_meatrack_circus") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "MIGHTY", "MEATRACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_meatrack_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_meatrack_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_meatrack_victorian.dyn"),
    },
    base_prefab = "meatrack" ,
    build_name_override = "custom_meatrack_victorian" ,
    init_fn = function(inst) meatrack_init_fn(inst, "custom_meatrack_victorian") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "VICTORIAN", "MEATRACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mermhouse_crafted_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mermhouse_crafted_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mermhouse_crafted_fantasy.dyn"),
    },
    base_prefab = "mermhouse_crafted" ,
    build_name_override = "custom_mermhouse_crafted_fantasy" ,
    init_fn = function(inst) mermhouse_crafted_init_fn(inst, "custom_mermhouse_crafted_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "MERMHOUSE_CRAFTED", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mighty_gym_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mighty_gym_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mighty_gym_ancient.dyn"),
    },
    base_prefab = "mighty_gym" ,
    build_name_override = "custom_mighty_gym_ancient" ,
    init_fn = function(inst) mighty_gym_init_fn(inst, "custom_mighty_gym_ancient") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "MIGHTY_GYM", "ANCIENT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_minerhat_bonnet",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_minerhat_bonnet.zip"),
        Asset("PKGREF", "anim/dynamic/custom_minerhat_bonnet.dyn"),
    },
    base_prefab = "minerhat" ,
    build_name_override = "custom_minerhat_bonnet" ,
    init_fn = function(inst) minerhat_init_fn(inst, "custom_minerhat_bonnet") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_minerhat_cowboy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_minerhat_cowboy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_minerhat_cowboy.dyn"),
    },
    base_prefab = "minerhat" ,
    build_name_override = "custom_minerhat_cowboy" ,
    init_fn = function(inst) minerhat_init_fn(inst, "custom_minerhat_cowboy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_minerhat_floppy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_minerhat_floppy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_minerhat_floppy.dyn"),
    },
    base_prefab = "minerhat" ,
    build_name_override = "custom_minerhat_floppy" ,
    init_fn = function(inst) minerhat_init_fn(inst, "custom_minerhat_floppy") end,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_minisign_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_minisign_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_minisign_fantasy.dyn"),
    },
    base_prefab = "minisign" ,
    build_name_override = "custom_minisign_fantasy" ,
    init_fn = function(inst) minisign_init_fn(inst, "custom_minisign_fantasy", "sign_mini_fantasy" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FANTASY", "MINISIGN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_minisign_fantasy_drawn",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_minisign_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_minisign_fantasy.dyn"),
    },
    base_prefab = "minisign_drawn" ,
    build_name_override = "custom_minisign_fantasy" ,
    init_fn = function(inst) minisign_drawn_init_fn(inst, "custom_minisign_fantasy", "sign_mini_fantasy" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_minisign_fantasy_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_minisign_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_minisign_fantasy.dyn"),
    },
    base_prefab = "minisign_item" ,
    build_name_override = "custom_minisign_fantasy" ,
    init_fn = function(inst) minisign_item_init_fn(inst, "custom_minisign_fantasy", "sign_mini_fantasy" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_minisign_ornate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_minisign_ornate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_minisign_ornate.dyn"),
    },
    base_prefab = "minisign" ,
    build_name_override = "custom_minisign_ornate" ,
    init_fn = function(inst) minisign_init_fn(inst, "custom_minisign_ornate", "sign_mini_ornate" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ORNATE", "MINISIGN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_minisign_ornate_drawn",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_minisign_ornate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_minisign_ornate.dyn"),
    },
    base_prefab = "minisign_drawn" ,
    build_name_override = "custom_minisign_ornate" ,
    init_fn = function(inst) minisign_drawn_init_fn(inst, "custom_minisign_ornate", "sign_mini_ornate" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_minisign_ornate_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_minisign_ornate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_minisign_ornate.dyn"),
    },
    base_prefab = "minisign_item" ,
    build_name_override = "custom_minisign_ornate" ,
    init_fn = function(inst) minisign_item_init_fn(inst, "custom_minisign_ornate", "sign_mini_ornate" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_minisign_picketbrown",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_minisign_picketbrown.zip"),
        Asset("PKGREF", "anim/dynamic/custom_minisign_picketbrown.dyn"),
    },
    base_prefab = "minisign" ,
    build_name_override = "custom_minisign_picketbrown" ,
    init_fn = function(inst) minisign_init_fn(inst, "custom_minisign_picketbrown") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "MINISIGN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_minisign_picketbrown_drawn",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_minisign_picketbrown.zip"),
        Asset("PKGREF", "anim/dynamic/custom_minisign_picketbrown.dyn"),
    },
    base_prefab = "minisign_drawn" ,
    build_name_override = "custom_minisign_picketbrown" ,
    init_fn = function(inst) minisign_drawn_init_fn(inst, "custom_minisign_picketbrown") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_minisign_picketbrown_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_minisign_picketbrown.zip"),
        Asset("PKGREF", "anim/dynamic/custom_minisign_picketbrown.dyn"),
    },
    base_prefab = "minisign_item" ,
    build_name_override = "custom_minisign_picketbrown" ,
    init_fn = function(inst) minisign_item_init_fn(inst, "custom_minisign_picketbrown") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_minisign_pickettan",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_minisign_pickettan.zip"),
        Asset("PKGREF", "anim/dynamic/custom_minisign_pickettan.dyn"),
    },
    base_prefab = "minisign" ,
    build_name_override = "custom_minisign_pickettan" ,
    init_fn = function(inst) minisign_init_fn(inst, "custom_minisign_pickettan") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "MINISIGN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_minisign_pickettan_drawn",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_minisign_pickettan.zip"),
        Asset("PKGREF", "anim/dynamic/custom_minisign_pickettan.dyn"),
    },
    base_prefab = "minisign_drawn" ,
    build_name_override = "custom_minisign_pickettan" ,
    init_fn = function(inst) minisign_drawn_init_fn(inst, "custom_minisign_pickettan") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_minisign_pickettan_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_minisign_pickettan.zip"),
        Asset("PKGREF", "anim/dynamic/custom_minisign_pickettan.dyn"),
    },
    base_prefab = "minisign_item" ,
    build_name_override = "custom_minisign_pickettan" ,
    init_fn = function(inst) minisign_item_init_fn(inst, "custom_minisign_pickettan") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_minisign_picketwhite",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_minisign_picketwhite.zip"),
        Asset("PKGREF", "anim/dynamic/custom_minisign_picketwhite.dyn"),
    },
    base_prefab = "minisign" ,
    build_name_override = "custom_minisign_picketwhite" ,
    init_fn = function(inst) minisign_init_fn(inst, "custom_minisign_picketwhite") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "MINISIGN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_minisign_picketwhite_drawn",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_minisign_picketwhite.zip"),
        Asset("PKGREF", "anim/dynamic/custom_minisign_picketwhite.dyn"),
    },
    base_prefab = "minisign_drawn" ,
    build_name_override = "custom_minisign_picketwhite" ,
    init_fn = function(inst) minisign_drawn_init_fn(inst, "custom_minisign_picketwhite") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_minisign_picketwhite_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_minisign_picketwhite.zip"),
        Asset("PKGREF", "anim/dynamic/custom_minisign_picketwhite.dyn"),
    },
    base_prefab = "minisign_item" ,
    build_name_override = "custom_minisign_picketwhite" ,
    init_fn = function(inst) minisign_item_init_fn(inst, "custom_minisign_picketwhite") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_molehat_goggles",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_molehat_goggles.zip"),
        Asset("PKGREF", "anim/dynamic/custom_molehat_goggles.dyn"),
    },
    base_prefab = "molehat" ,
    build_name_override = "custom_molehat_goggles" ,
    init_fn = function(inst) molehat_init_fn(inst, "custom_molehat_goggles", true) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BUILDERS", "MOLEHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_molehat_tail",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_molehat_tail.zip"),
        Asset("PKGREF", "anim/dynamic/custom_molehat_tail.dyn"),
    },
    base_prefab = "molehat" ,
    build_name_override = "custom_molehat_tail" ,
    init_fn = function(inst) molehat_init_fn(inst, "custom_molehat_tail", false) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "MOLEHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_monkeyhatmedium_blue",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_monkeyhatmedium_blue.zip"),
        Asset("PKGREF", "anim/dynamic/custom_monkeyhatmedium_blue.dyn"),
    },
    base_prefab = "monkey_mediumhat" ,
    build_name_override = "custom_monkeyhatmedium_blue" ,
    init_fn = function(inst) monkey_mediumhat_init_fn(inst, "custom_monkeyhatmedium_blue") end,
    rarity = "Spiffy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "MONKEY_MEDIUMHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_monkeyhatmedium_red",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_monkeyhatmedium_red.zip"),
        Asset("PKGREF", "anim/dynamic/custom_monkeyhatmedium_red.dyn"),
    },
    base_prefab = "monkey_mediumhat" ,
    build_name_override = "custom_monkeyhatmedium_red" ,
    init_fn = function(inst) monkey_mediumhat_init_fn(inst, "custom_monkeyhatmedium_red") end,
    rarity = "Spiffy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "MONKEY_MEDIUMHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_monkeyhatsmall_beads",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_monkeyhatsmall_beads.zip"),
        Asset("PKGREF", "anim/dynamic/custom_monkeyhatsmall_beads.dyn"),
    },
    base_prefab = "monkey_smallhat" ,
    build_name_override = "custom_monkeyhatsmall_beads" ,
    init_fn = function(inst) monkey_smallhat_init_fn(inst, "custom_monkeyhatsmall_beads") end,
    rarity = "Spiffy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "MONKEY_SMALLHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_monkeyhatsmall_belt",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_monkeyhatsmall_belt.zip"),
        Asset("PKGREF", "anim/dynamic/custom_monkeyhatsmall_belt.dyn"),
    },
    base_prefab = "monkey_smallhat" ,
    build_name_override = "custom_monkeyhatsmall_belt" ,
    init_fn = function(inst) monkey_smallhat_init_fn(inst, "custom_monkeyhatsmall_belt") end,
    rarity = "Spiffy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "MONKEY_SMALLHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_moondial_an",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_moondial_an.zip"),
        Asset("PKGREF", "anim/dynamic/custom_moondial_an.dyn"),
    },
    base_prefab = "moondial" ,
    build_name_override = "custom_moondial_an" ,
    init_fn = function(inst) moondial_init_fn(inst, "custom_moondial_an") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "MOONDIAL", "ARTNOUVEAU", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_moonstaff_crystal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_starstaff_crystal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_starstaff_crystal.dyn"),
    },
    base_prefab = "opalstaff" ,
    build_name_override = "custom_starstaff_crystal" ,
    init_fn = function(inst) opalstaff_init_fn(inst, "custom_starstaff_crystal") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_moonstaff_portal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_starstaff_portal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_starstaff_portal.dyn"),
    },
    base_prefab = "opalstaff" ,
    build_name_override = "custom_starstaff_portal" ,
    init_fn = function(inst) opalstaff_init_fn(inst, "custom_starstaff_portal") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_sound = { ["cast"] = "terraria1/skins/lunarportalstaff", },
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_moonstaff_relic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_starstaff_relic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_starstaff_relic.dyn"),
    },
    base_prefab = "opalstaff" ,
    build_name_override = "custom_starstaff_relic" ,
    init_fn = function(inst) opalstaff_init_fn(inst, "custom_starstaff_relic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_multitool_axe_pickaxe_pickaxeaxe",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_multitool_axe_pickaxe_pickaxeaxe.zip"),
        Asset("PKGREF", "anim/dynamic/custom_multitool_axe_pickaxe_pickaxeaxe.dyn"),
    },
    base_prefab = "multitool_axe_pickaxe" ,
    build_name_override = "custom_multitool_axe_pickaxe_pickaxeaxe" ,
    init_fn = function(inst) multitool_axe_pickaxe_init_fn(inst, "custom_multitool_axe_pickaxe_pickaxeaxe") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "MULTITOOL_AXE_PICKAXE", "T_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mushroom_farm_handmade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mushroom_farm_handmade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mushroom_farm_handmade.dyn"),
    },
    base_prefab = "mushroom_farm" ,
    build_name_override = "custom_mushroom_farm_handmade" ,
    init_fn = function(inst) mushroom_farm_init_fn(inst, "custom_mushroom_farm_handmade") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BUILDERS", "MUSHROOM_FARM", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mushroom_light2_an",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mushroom_light2_an.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mushroom_light2_an.dyn"),
    },
    base_prefab = "mushroom_light2" ,
    build_name_override = "custom_mushroom_light2_an" ,
    init_fn = function(inst) mushroom_light2_init_fn(inst, "custom_mushroom_light2_an") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "MUSHROOM_LIGHT", "ARTNOUVEAU", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mushroom_light2_cawnival",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mushroom_light2_cawnival.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mushroom_light2_cawnival.dyn"),
    },
    base_prefab = "mushroom_light2" ,
    build_name_override = "custom_mushroom_light2_cawnival" ,
    init_fn = function(inst) mushroom_light2_init_fn(inst, "custom_mushroom_light2_cawnival") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CAWNIVAL", "MUSHROOM_LIGHT2", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mushroom_light2_hallowed",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mushroom_light2_hallowed.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mushroom_light2_hallowed.dyn"),
    },
    base_prefab = "mushroom_light2" ,
    build_name_override = "custom_mushroom_light2_hallowed" ,
    init_fn = function(inst) mushroom_light2_init_fn(inst, "custom_mushroom_light2_hallowed") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "HALLOWED", "MUSHROOM_LIGHT2", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mushroom_light2_lily",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mushroom_light2_lily.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mushroom_light2_lily.dyn"),
    },
    base_prefab = "mushroom_light2" ,
    build_name_override = "custom_mushroom_light2_lily" ,
    init_fn = function(inst) mushroom_light2_init_fn(inst, "custom_mushroom_light2_lily") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "MUSHROOM_LIGHT2", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mushroom_light2_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mushroom_light2_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mushroom_light2_victorian.dyn"),
    },
    base_prefab = "mushroom_light2" ,
    build_name_override = "custom_mushroom_light2_victorian" ,
    init_fn = function(inst) mushroom_light2_init_fn(inst, "custom_mushroom_light2_victorian") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "VICTORIAN", "MUSHROOM_LIGHT2", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mushroom_light_an",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mushroom_light_an.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mushroom_light_an.dyn"),
    },
    base_prefab = "mushroom_light" ,
    build_name_override = "custom_mushroom_light_an" ,
    init_fn = function(inst) mushroom_light_init_fn(inst, "custom_mushroom_light_an") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "MUSHROOM_LIGHT", "ARTNOUVEAU", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mushroom_light_festive",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mushroom_light_festive.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mushroom_light_festive.dyn"),
    },
    base_prefab = "mushroom_light" ,
    build_name_override = "custom_mushroom_light_festive" ,
    init_fn = function(inst) mushroom_light_init_fn(inst, "custom_mushroom_light_festive") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "MUSHROOM_LIGHT", "YULE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mushroom_light_hallowed",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mushroom_light_hallowed.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mushroom_light_hallowed.dyn"),
    },
    base_prefab = "mushroom_light" ,
    build_name_override = "custom_mushroom_light_hallowed" ,
    init_fn = function(inst) mushroom_light_init_fn(inst, "custom_mushroom_light_hallowed") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "HALLOWED", "MUSHROOM_LIGHT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_mushroom_light_tiffany",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_mushroom_light_tiffany.zip"),
        Asset("PKGREF", "anim/dynamic/custom_mushroom_light_tiffany.dyn"),
    },
    base_prefab = "mushroom_light" ,
    build_name_override = "custom_mushroom_light_tiffany" ,
    init_fn = function(inst) mushroom_light_init_fn(inst, "custom_mushroom_light_tiffany") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "MUSHROOM_LIGHT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_nightmare_torch_relic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_nightmare_torch_relic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_nightmare_torch_relic.dyn"),
    },
    base_prefab = "nightlight" ,
    build_name_override = "custom_nightmare_torch_relic" ,
    init_fn = function(inst) nightlight_init_fn(inst, "custom_nightmare_torch_relic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "NIGHTLIGHT", "RELIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_nightsword_cotl",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_nightsword_cotl.zip"),
        Asset("PKGREF", "anim/dynamic/custom_nightsword_cotl.dyn"),
    },
    base_prefab = "nightsword" ,
    build_name_override = "custom_nightsword_cotl" ,
    fx_prefab = { "nightsword_cotl_fx", },
    init_fn = function(inst) nightsword_init_fn(inst, "custom_nightsword_cotl") end,
    prefabs = { "nightsword_cotl_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "C_UPDATE", "NIGHTSWORD", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_nightsword_curve",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_nightsword_curve.zip"),
        Asset("PKGREF", "anim/dynamic/custom_nightsword_curve.dyn"),
    },
    base_prefab = "nightsword" ,
    build_name_override = "custom_nightsword_curve" ,
    fx_prefab = { "nightsword_curve_fx", },
    init_fn = function(inst) nightsword_init_fn(inst, "custom_nightsword_curve") end,
    prefabs = { "nightsword_curve_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "NIGHTSWORD", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_nightsword_lightsbane",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_nightsword_lightsbane.zip"),
        Asset("PKGREF", "anim/dynamic/custom_nightsword_lightsbane.dyn"),
    },
    base_prefab = "nightsword" ,
    build_name_override = "custom_nightsword_lightsbane" ,
    fx_prefab = { "nightsword_lightsbane_fx", },
    init_fn = function(inst) nightsword_init_fn(inst, "custom_nightsword_lightsbane") end,
    prefabs = { "nightsword_lightsbane_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "NIGHTSWORD", "CRAFTABLE", "T_UPDATE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_nightsword_sharp",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_nightsword_sharp.zip"),
        Asset("PKGREF", "anim/dynamic/custom_nightsword_sharp.dyn"),
    },
    base_prefab = "nightsword" ,
    build_name_override = "custom_nightsword_sharp" ,
    fx_prefab = { "nightsword_sharp_fx", },
    init_fn = function(inst) nightsword_init_fn(inst, "custom_nightsword_sharp") end,
    prefabs = { "nightsword_sharp_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "NIGHTSWORD", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_nightsword_wizard",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_nightsword_wizard.zip"),
        Asset("PKGREF", "anim/dynamic/custom_nightsword_wizard.dyn"),
    },
    base_prefab = "nightsword" ,
    build_name_override = "custom_nightsword_wizard" ,
    fx_prefab = { "nightsword_wizard_fx", },
    init_fn = function(inst) nightsword_init_fn(inst, "custom_nightsword_wizard") end,
    prefabs = { "nightsword_wizard_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WIZARD", "NIGHTSWORD", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_oar_driftwood_invisible",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_oar_driftwood_invisible.zip"),
        Asset("PKGREF", "anim/dynamic/custom_oar_driftwood_invisible.dyn"),
    },
    base_prefab = "oar_driftwood" ,
    build_name_override = "custom_oar_driftwood_invisible" ,
    init_fn = function(inst) oar_driftwood_init_fn(inst, "custom_oar_driftwood_invisible") end,
    rarity = "Classy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "INVISIBLE", "OARDRIFTWOOD", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_oar_invisible",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_oar_invisible.zip"),
        Asset("PKGREF", "anim/dynamic/custom_oar_invisible.dyn"),
    },
    base_prefab = "oar" ,
    build_name_override = "custom_oar_invisible" ,
    init_fn = function(inst) oar_init_fn(inst, "custom_oar_invisible") end,
    rarity = "Classy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "INVISIBLE", "OAR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_ocean_trawler_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ocean_trawler_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ocean_trawler_pirate.dyn"),
    },
    base_prefab = "ocean_trawler" ,
    build_name_override = "custom_ocean_trawler_pirate" ,
    granted_items = { "custom_ocean_trawler_pirate_kit" , },
    init_fn = function(inst) ocean_trawler_init_fn(inst, "custom_ocean_trawler_pirate") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "OCEAN_TRAWLER", "PIRATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_ocean_trawler_pirate_kit",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ocean_trawler_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ocean_trawler_pirate.dyn"),
    },
    base_prefab = "ocean_trawler_kit" ,
    build_name_override = "custom_ocean_trawler_pirate" ,
    init_fn = function(inst) ocean_trawler_kit_init_fn(inst, "custom_ocean_trawler_pirate") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_oceanfishingrod_hotline",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_oceanfishingrod_hotline.zip"),
        Asset("PKGREF", "anim/dynamic/custom_oceanfishingrod_hotline.dyn"),
    },
    base_prefab = "oceanfishingrod" ,
    build_name_override = "custom_oceanfishingrod_hotline" ,
    init_fn = function(inst) oceanfishingrod_init_fn(inst, "custom_oceanfishingrod_hotline") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "OCEANFISHINGROD", "T_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_oceanfishingrod_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_oceanfishingrod_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_oceanfishingrod_ice.dyn"),
    },
    base_prefab = "oceanfishingrod" ,
    build_name_override = "custom_oceanfishingrod_ice" ,
    init_fn = function(inst) oceanfishingrod_init_fn(inst, "custom_oceanfishingrod_ice") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "OCEANFISHINGROD", "WINTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_oceanfishingrod_nautical",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_oceanfishingrod_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_oceanfishingrod_nautical.dyn"),
    },
    base_prefab = "oceanfishingrod" ,
    build_name_override = "custom_oceanfishingrod_nautical" ,
    init_fn = function(inst) oceanfishingrod_init_fn(inst, "custom_oceanfishingrod_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "OCEANFISHINGROD", "NAUTICAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_orangestaff_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_orangestaff_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_orangestaff_ancient.dyn"),
    },
    base_prefab = "orangestaff" ,
    build_name_override = "custom_orangestaff_ancient" ,
    fx_prefab = { "", "cane_ancient_fx", "shadow_puff_large_front", "shadow_puff_large_back", },
    init_fn = function(inst) orangestaff_init_fn(inst, "custom_orangestaff_ancient") end,
    prefabs = { "cane_ancient_fx", "shadow_puff_large_front", "shadow_puff_large_back", },
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_orangestaff_candycane",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_orangestaff_candycane.zip"),
        Asset("PKGREF", "anim/dynamic/custom_orangestaff_candycane.dyn"),
    },
    base_prefab = "orangestaff" ,
    build_name_override = "custom_orangestaff_candycane" ,
    fx_prefab = { "cane_candy_fx", },
    init_fn = function(inst) orangestaff_init_fn(inst, "custom_orangestaff_candycane") end,
    prefabs = { "cane_candy_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_orangestaff_harlequin",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_orangestaff_harlequin.zip"),
        Asset("PKGREF", "anim/dynamic/custom_orangestaff_harlequin.dyn"),
    },
    base_prefab = "orangestaff" ,
    build_name_override = "custom_orangestaff_harlequin" ,
    fx_prefab = { "cane_harlequin_fx", },
    init_fn = function(inst) orangestaff_init_fn(inst, "custom_orangestaff_harlequin") end,
    prefabs = { "cane_harlequin_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_orangestaff_rodofdiscord",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_orangestaff_rodofdiscord.zip"),
        Asset("PKGREF", "anim/dynamic/custom_orangestaff_rodofdiscord.dyn"),
    },
    base_prefab = "orangestaff" ,
    build_name_override = "custom_orangestaff_rodofdiscord" ,
    init_fn = function(inst) orangestaff_init_fn(inst, "custom_orangestaff_rodofdiscord") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_sound = { ["preteleport"] = "terraria1/skins/rod_discord", },
    skin_tags = { "ORANGESTAFF", "T_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_orangestaff_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_orangestaff_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_orangestaff_rose.dyn"),
    },
    base_prefab = "orangestaff" ,
    build_name_override = "custom_orangestaff_rose" ,
    fx_prefab = { "cane_rose_fx", },
    init_fn = function(inst) orangestaff_init_fn(inst, "custom_orangestaff_rose") end,
    prefabs = { "cane_rose_fx", },
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_orangestaff_sharp",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_orangestaff_sharp.zip"),
        Asset("PKGREF", "anim/dynamic/custom_orangestaff_sharp.dyn"),
    },
    base_prefab = "orangestaff" ,
    build_name_override = "custom_orangestaff_sharp" ,
    fx_prefab = { "cane_sharp_fx", },
    init_fn = function(inst) orangestaff_init_fn(inst, "custom_orangestaff_sharp") end,
    prefabs = { "cane_sharp_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_orangestaff_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_orangestaff_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_orangestaff_victorian.dyn"),
    },
    base_prefab = "orangestaff" ,
    build_name_override = "custom_orangestaff_victorian" ,
    fx_prefab = { "cane_victorian_fx", },
    init_fn = function(inst) orangestaff_init_fn(inst, "custom_orangestaff_victorian") end,
    prefabs = { "cane_victorian_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_panflute_an",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_panflute_an.zip"),
        Asset("PKGREF", "anim/dynamic/custom_panflute_an.dyn"),
    },
    base_prefab = "panflute" ,
    build_name_override = "custom_panflute_an" ,
    init_fn = function(inst) panflute_init_fn(inst, "custom_panflute_an") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "PANFLUTE", "ARTNOUVEAU", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_panflute_harlequin",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_panflute_harlequin.zip"),
        Asset("PKGREF", "anim/dynamic/custom_panflute_harlequin.dyn"),
    },
    base_prefab = "panflute" ,
    build_name_override = "custom_panflute_harlequin" ,
    init_fn = function(inst) panflute_init_fn(inst, "custom_panflute_harlequin") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PANFLUTE", "FOOLS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_parasol_spring",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_parasol_spring.zip"),
        Asset("PKGREF", "anim/dynamic/custom_parasol_spring.dyn"),
    },
    base_prefab = "grass_umbrella" ,
    build_name_override = "custom_parasol_spring" ,
    init_fn = function(inst) grass_umbrella_init_fn(inst, "custom_parasol_spring") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "GRASS_UMBRELLA", "HANDMEDOWN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_perdling_crow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_perdling_crow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_perdling_crow.dyn"),
    },
    base_prefab = "critter_perdling" ,
    build_name_override = "custom_perdling_crow" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_perdling_crow", "perdling_build" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PET", "CAWNIVAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_perdling_crow_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_perdling_crow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_perdling_crow.dyn"),
    },
    base_prefab = "critter_perdling_builder" ,
    build_name_override = "custom_perdling_crow" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_perdling_crow" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_perdling_pelican",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_perdling_pelican.zip"),
        Asset("PKGREF", "anim/dynamic/custom_perdling_pelican.dyn"),
    },
    base_prefab = "critter_perdling" ,
    build_name_override = "custom_perdling_pelican" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_perdling_pelican", "perdling_build" ) end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PET", "SEASIDE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_perdling_pelican_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_perdling_pelican.zip"),
        Asset("PKGREF", "anim/dynamic/custom_perdling_pelican.dyn"),
    },
    base_prefab = "critter_perdling_builder" ,
    build_name_override = "custom_perdling_pelican" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_perdling_pelican" ) end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_perdling_pollyrogers",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_perdling_pollyrogers.zip"),
        Asset("PKGREF", "anim/dynamic/custom_perdling_pollyrogers.dyn"),
    },
    base_prefab = "critter_perdling" ,
    build_name_override = "custom_perdling_pollyrogers" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_perdling_pollyrogers", "perdling_build" ) end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "PET", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_perdling_pollyrogers_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_perdling_pollyrogers.zip"),
        Asset("PKGREF", "anim/dynamic/custom_perdling_pollyrogers.dyn"),
    },
    base_prefab = "critter_perdling_builder" ,
    build_name_override = "custom_perdling_pollyrogers" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_perdling_pollyrogers" ) end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_perdling_puffin",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_perdling_puffin.zip"),
        Asset("PKGREF", "anim/dynamic/custom_perdling_puffin.dyn"),
    },
    base_prefab = "critter_perdling" ,
    build_name_override = "custom_perdling_puffin" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_perdling_puffin", "perdling_build" ) end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PET", "SEASIDE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_perdling_puffin_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_perdling_puffin.zip"),
        Asset("PKGREF", "anim/dynamic/custom_perdling_puffin.dyn"),
    },
    base_prefab = "critter_perdling_builder" ,
    build_name_override = "custom_perdling_puffin" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_perdling_puffin" ) end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_perdling_rooster",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_perdling_rooster.zip"),
        Asset("PKGREF", "anim/dynamic/custom_perdling_rooster.dyn"),
    },
    base_prefab = "critter_perdling" ,
    build_name_override = "custom_perdling_rooster" ,
    init_fn = function(inst) perdling_init_fn(inst, "custom_perdling_rooster", "perdling_build", "dontstarve/creatures/together/rooster/distress_long" ) end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "PET", "LUNAR_NY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_perdling_rooster_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_perdling_rooster.zip"),
        Asset("PKGREF", "anim/dynamic/custom_perdling_rooster.dyn"),
    },
    base_prefab = "critter_perdling_builder" ,
    build_name_override = "custom_perdling_rooster" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_perdling_rooster" ) end,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_perdling_winter",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_perdling_winter.zip"),
        Asset("PKGREF", "anim/dynamic/custom_perdling_winter.dyn"),
    },
    base_prefab = "critter_perdling" ,
    build_name_override = "custom_perdling_winter" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_perdling_winter", "perdling_build" ) end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "PET", "WINTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_perdling_winter_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_perdling_winter.zip"),
        Asset("PKGREF", "anim/dynamic/custom_perdling_winter.dyn"),
    },
    base_prefab = "critter_perdling_builder" ,
    build_name_override = "custom_perdling_winter" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_perdling_winter" ) end,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pickaxe_feathered",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pickaxe_feathered.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pickaxe_feathered.dyn"),
    },
    base_prefab = "pickaxe" ,
    build_name_override = "custom_pickaxe_feathered" ,
    init_fn = function(inst) pickaxe_init_fn(inst, "custom_pickaxe_feathered") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PICKAXE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pickaxe_invisible",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pickaxe_invisible.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pickaxe_invisible.dyn"),
    },
    base_prefab = "pickaxe" ,
    build_name_override = "custom_pickaxe_invisible" ,
    init_fn = function(inst) pickaxe_init_fn(inst, "custom_pickaxe_invisible") end,
    rarity = "Classy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PICKAXE", "INVISIBLE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pickaxe_northern",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pickaxe_northern.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pickaxe_northern.dyn"),
    },
    base_prefab = "pickaxe" ,
    build_name_override = "custom_pickaxe_northern" ,
    init_fn = function(inst) pickaxe_init_fn(inst, "custom_pickaxe_northern") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "PICKAXE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pickaxe_reavershark",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pickaxe_reavershark.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pickaxe_reavershark.dyn"),
    },
    base_prefab = "pickaxe" ,
    build_name_override = "custom_pickaxe_reavershark" ,
    init_fn = function(inst) pickaxe_init_fn(inst, "custom_pickaxe_reavershark") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PICKAXE", "CRAFTABLE", "T_UPDATE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pickaxe_scythe",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pickaxe_scythe.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pickaxe_scythe.dyn"),
    },
    base_prefab = "pickaxe" ,
    build_name_override = "custom_pickaxe_scythe" ,
    init_fn = function(inst) pickaxe_init_fn(inst, "custom_pickaxe_scythe") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "PICKAXE", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pickaxe_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pickaxe_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pickaxe_victorian.dyn"),
    },
    base_prefab = "pickaxe" ,
    build_name_override = "custom_pickaxe_victorian" ,
    init_fn = function(inst) pickaxe_init_fn(inst, "custom_pickaxe_victorian") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "VICTORIAN", "PICKAXE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_piggyback_elephant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_piggyback_elephant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_piggyback_elephant.dyn"),
    },
    base_prefab = "piggyback" ,
    build_name_override = "custom_piggyback_elephant" ,
    init_fn = function(inst) piggyback_init_fn(inst, "custom_piggyback_elephant") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "MIGHTY", "PIGGYBACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_piggyback_nose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_piggyback_nose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_piggyback_nose.dyn"),
    },
    base_prefab = "piggyback" ,
    build_name_override = "custom_piggyback_nose" ,
    init_fn = function(inst) piggyback_init_fn(inst, "custom_piggyback_nose") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "PIGGYBACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pighouse_cabin",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pighouse_cabin.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pighouse_cabin.dyn"),
    },
    base_prefab = "pighouse" ,
    build_name_override = "custom_pighouse_cabin" ,
    init_fn = function(inst) pighouse_init_fn(inst, "custom_pighouse_cabin") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "PIGHOUSE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pighouse_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pighouse_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pighouse_gothic.dyn"),
    },
    base_prefab = "pighouse" ,
    build_name_override = "custom_pighouse_gothic" ,
    init_fn = function(inst) pighouse_init_fn(inst, "custom_pighouse_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "GOTHIC", "PIGHOUSE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pighouse_logcabin",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pighouse_logcabin.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pighouse_logcabin.dyn"),
    },
    base_prefab = "pighouse" ,
    build_name_override = "custom_pighouse_logcabin" ,
    init_fn = function(inst) pighouse_init_fn(inst, "custom_pighouse_logcabin") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "HOCKEY", "PIGHOUSE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pitchfork_invisible",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pitchfork_invisible.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pitchfork_invisible.dyn"),
    },
    base_prefab = "pitchfork" ,
    build_name_override = "custom_pitchfork_invisible" ,
    init_fn = function(inst) pitchfork_init_fn(inst, "custom_pitchfork_invisible") end,
    rarity = "Classy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PITCHFORK", "INVISIBLE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_blender_porcelain",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_blender_porcelain.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_blender_porcelain.dyn"),
    },
    base_prefab = "portableblender" ,
    build_name_override = "custom_portable_blender_porcelain" ,
    init_fn = function(inst) portableblender_init_fn(inst, "custom_portable_blender_porcelain") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PORTABLEBLENDER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_blender_porcelain_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_blender_porcelain.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_blender_porcelain.dyn"),
    },
    base_prefab = "portableblender_item" ,
    build_name_override = "custom_portable_blender_porcelain" ,
    init_fn = function(inst) portableblender_item_init_fn(inst, "custom_portable_blender_porcelain") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_blender_rustic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_blender_rustic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_blender_rustic.dyn"),
    },
    base_prefab = "portableblender" ,
    build_name_override = "custom_portable_blender_rustic" ,
    init_fn = function(inst) portableblender_init_fn(inst, "custom_portable_blender_rustic") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PORTABLEBLENDER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_blender_rustic_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_blender_rustic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_blender_rustic.dyn"),
    },
    base_prefab = "portableblender_item" ,
    build_name_override = "custom_portable_blender_rustic" ,
    init_fn = function(inst) portableblender_item_init_fn(inst, "custom_portable_blender_rustic") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_blender_silver",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_blender_silver.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_blender_silver.dyn"),
    },
    base_prefab = "portableblender" ,
    build_name_override = "custom_portable_blender_silver" ,
    init_fn = function(inst) portableblender_init_fn(inst, "custom_portable_blender_silver") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PORTABLEBLENDER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_blender_silver_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_blender_silver.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_blender_silver.dyn"),
    },
    base_prefab = "portableblender_item" ,
    build_name_override = "custom_portable_blender_silver" ,
    init_fn = function(inst) portableblender_item_init_fn(inst, "custom_portable_blender_silver") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_blender_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_blender_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_blender_survivor.dyn"),
    },
    base_prefab = "portableblender" ,
    build_name_override = "custom_portable_blender_survivor" ,
    init_fn = function(inst) portableblender_init_fn(inst, "custom_portable_blender_survivor") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PORTABLEBLENDER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_blender_survivor_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_blender_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_blender_survivor.dyn"),
    },
    base_prefab = "portableblender_item" ,
    build_name_override = "custom_portable_blender_survivor" ,
    init_fn = function(inst) portableblender_item_init_fn(inst, "custom_portable_blender_survivor") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_cook_pot_porcelain",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_cook_pot_porcelain.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_cook_pot_porcelain.dyn"),
    },
    base_prefab = "portablecookpot" ,
    build_name_override = "custom_portable_cook_pot_porcelain" ,
    init_fn = function(inst) portablecookpot_init_fn(inst, "custom_portable_cook_pot_porcelain") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PORTABLECOOKPOT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_cook_pot_porcelain_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_cook_pot_porcelain.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_cook_pot_porcelain.dyn"),
    },
    base_prefab = "portablecookpot_item" ,
    build_name_override = "custom_portable_cook_pot_porcelain" ,
    init_fn = function(inst) portablecookpot_item_init_fn(inst, "custom_portable_cook_pot_porcelain") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_cook_pot_rustic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_cook_pot_rustic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_cook_pot_rustic.dyn"),
    },
    base_prefab = "portablecookpot" ,
    build_name_override = "custom_portable_cook_pot_rustic" ,
    init_fn = function(inst) portablecookpot_init_fn(inst, "custom_portable_cook_pot_rustic") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PORTABLECOOKPOT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_cook_pot_rustic_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_cook_pot_rustic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_cook_pot_rustic.dyn"),
    },
    base_prefab = "portablecookpot_item" ,
    build_name_override = "custom_portable_cook_pot_rustic" ,
    init_fn = function(inst) portablecookpot_item_init_fn(inst, "custom_portable_cook_pot_rustic") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_cook_pot_silver",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_cook_pot_silver.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_cook_pot_silver.dyn"),
    },
    base_prefab = "portablecookpot" ,
    build_name_override = "custom_portable_cook_pot_silver" ,
    init_fn = function(inst) portablecookpot_init_fn(inst, "custom_portable_cook_pot_silver") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PORTABLECOOKPOT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_cook_pot_silver_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_cook_pot_silver.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_cook_pot_silver.dyn"),
    },
    base_prefab = "portablecookpot_item" ,
    build_name_override = "custom_portable_cook_pot_silver" ,
    init_fn = function(inst) portablecookpot_item_init_fn(inst, "custom_portable_cook_pot_silver") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_cook_pot_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_cook_pot_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_cook_pot_survivor.dyn"),
    },
    base_prefab = "portablecookpot" ,
    build_name_override = "custom_portable_cook_pot_survivor" ,
    init_fn = function(inst) portablecookpot_init_fn(inst, "custom_portable_cook_pot_survivor") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PORTABLECOOKPOT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_cook_pot_survivor_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_cook_pot_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_cook_pot_survivor.dyn"),
    },
    base_prefab = "portablecookpot_item" ,
    build_name_override = "custom_portable_cook_pot_survivor" ,
    init_fn = function(inst) portablecookpot_item_init_fn(inst, "custom_portable_cook_pot_survivor") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_spicer_porcelain",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_spicer_porcelain.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_spicer_porcelain.dyn"),
    },
    base_prefab = "portablespicer" ,
    build_name_override = "custom_portable_spicer_porcelain" ,
    init_fn = function(inst) portablespicer_init_fn(inst, "custom_portable_spicer_porcelain") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PORTABLESPICER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_spicer_porcelain_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_spicer_porcelain.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_spicer_porcelain.dyn"),
    },
    base_prefab = "portablespicer_item" ,
    build_name_override = "custom_portable_spicer_porcelain" ,
    init_fn = function(inst) portablespicer_item_init_fn(inst, "custom_portable_spicer_porcelain") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_spicer_rustic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_spicer_rustic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_spicer_rustic.dyn"),
    },
    base_prefab = "portablespicer" ,
    build_name_override = "custom_portable_spicer_rustic" ,
    init_fn = function(inst) portablespicer_init_fn(inst, "custom_portable_spicer_rustic") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PORTABLESPICER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_spicer_rustic_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_spicer_rustic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_spicer_rustic.dyn"),
    },
    base_prefab = "portablespicer_item" ,
    build_name_override = "custom_portable_spicer_rustic" ,
    init_fn = function(inst) portablespicer_item_init_fn(inst, "custom_portable_spicer_rustic") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_spicer_silver",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_spicer_silver.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_spicer_silver.dyn"),
    },
    base_prefab = "portablespicer" ,
    build_name_override = "custom_portable_spicer_silver" ,
    init_fn = function(inst) portablespicer_init_fn(inst, "custom_portable_spicer_silver") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PORTABLESPICER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_spicer_silver_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_spicer_silver.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_spicer_silver.dyn"),
    },
    base_prefab = "portablespicer_item" ,
    build_name_override = "custom_portable_spicer_silver" ,
    init_fn = function(inst) portablespicer_item_init_fn(inst, "custom_portable_spicer_silver") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_spicer_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_spicer_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_spicer_survivor.dyn"),
    },
    base_prefab = "portablespicer" ,
    build_name_override = "custom_portable_spicer_survivor" ,
    init_fn = function(inst) portablespicer_init_fn(inst, "custom_portable_spicer_survivor") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PORTABLESPICER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_portable_spicer_survivor_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_portable_spicer_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_portable_spicer_survivor.dyn"),
    },
    base_prefab = "portablespicer_item" ,
    build_name_override = "custom_portable_spicer_survivor" ,
    init_fn = function(inst) portablespicer_item_init_fn(inst, "custom_portable_spicer_survivor") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pottedfern_cotl",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pottedfern_cotl.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pottedfern_cotl.dyn"),
    },
    base_prefab = "pottedfern" ,
    build_name_override = "custom_pottedfern_cotl" ,
    granted_items = { "custom_pottedfern_cotl2" , "custom_pottedfern_cotl3" , },
    init_fn = function(inst) pottedfern_init_fn(inst, "custom_pottedfern_cotl") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "POTTEDFERN", "C_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pottedfern_cotl2",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pottedfern_cotl2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pottedfern_cotl2.dyn"),
    },
    base_prefab = "pottedfern" ,
    build_name_override = "custom_pottedfern_cotl2" ,
    init_fn = function(inst) pottedfern_init_fn(inst, "custom_pottedfern_cotl2") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "POTTEDFERN", "C_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pottedfern_cotl3",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pottedfern_cotl3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pottedfern_cotl3.dyn"),
    },
    base_prefab = "pottedfern" ,
    build_name_override = "custom_pottedfern_cotl3" ,
    init_fn = function(inst) pottedfern_init_fn(inst, "custom_pottedfern_cotl3") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "POTTEDFERN", "C_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pottedfern_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pottedfern_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pottedfern_rose.dyn"),
    },
    base_prefab = "pottedfern" ,
    build_name_override = "custom_pottedfern_rose" ,
    granted_items = { "custom_pottedfern_rose2" , "custom_pottedfern_rose3" , },
    init_fn = function(inst) pottedfern_init_fn(inst, "custom_pottedfern_rose") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "POTTEDFERN", "ROSE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pottedfern_rose2",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pottedfern_rose2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pottedfern_rose2.dyn"),
    },
    base_prefab = "pottedfern" ,
    build_name_override = "custom_pottedfern_rose2" ,
    init_fn = function(inst) pottedfern_init_fn(inst, "custom_pottedfern_rose2") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "POTTEDFERN", "ROSE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pottedfern_rose3",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pottedfern_rose3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pottedfern_rose3.dyn"),
    },
    base_prefab = "pottedfern" ,
    build_name_override = "custom_pottedfern_rose3" ,
    init_fn = function(inst) pottedfern_init_fn(inst, "custom_pottedfern_rose3") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "POTTEDFERN", "ROSE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_premiumwateringcan_koalefant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_premiumwateringcan_koalefant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_premiumwateringcan_koalefant.dyn"),
    },
    base_prefab = "premiumwateringcan" ,
    build_name_override = "custom_premiumwateringcan_koalefant" ,
    init_fn = function(inst) premiumwateringcan_init_fn(inst, "custom_premiumwateringcan_koalefant") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BUILDERS", "PREMIUMWATERINGCAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pupington_woby_baddog",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pupington_woby_baddog.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pupington_woby_baddog.dyn"),
    },
    base_prefab = "wobysmall" ,
    build_name_override = "custom_pupington_woby_baddog" ,
    granted_items = { "custom_pupington_woby_baddog_lunar" , "custom_pupington_woby_baddog_shadow" , "custom_woby_big_baddog" , "custom_woby_big_baddog_lunar" , "custom_woby_big_baddog_shadow" , },
    init_fn = function(inst) wobysmall_init_fn(inst, "custom_pupington_woby_baddog") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WOBY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pupington_woby_baddog_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pupington_woby_baddog_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pupington_woby_baddog_lunar.dyn"),
    },
    base_prefab = "wobysmall" ,
    build_name_override = "custom_pupington_woby_baddog_lunar" ,
    init_fn = function(inst) wobysmall_init_fn(inst, "custom_pupington_woby_baddog_lunar") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pupington_woby_baddog_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pupington_woby_baddog_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pupington_woby_baddog_shadow.dyn"),
    },
    base_prefab = "wobysmall" ,
    build_name_override = "custom_pupington_woby_baddog_shadow" ,
    init_fn = function(inst) wobysmall_init_fn(inst, "custom_pupington_woby_baddog_shadow") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pupington_woby_ribbon",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pupington_woby_ribbon.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pupington_woby_ribbon.dyn"),
    },
    base_prefab = "wobysmall" ,
    build_name_override = "custom_pupington_woby_ribbon" ,
    granted_items = { "custom_pupington_woby_ribbon_lunar" , "custom_pupington_woby_ribbon_shadow" , "custom_woby_big_ribbon" , "custom_woby_big_ribbon_lunar" , "custom_woby_big_ribbon_shadow" , },
    init_fn = function(inst) wobysmall_init_fn(inst, "custom_pupington_woby_ribbon") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WOBY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pupington_woby_ribbon_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pupington_woby_ribbon_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pupington_woby_ribbon_lunar.dyn"),
    },
    base_prefab = "wobysmall" ,
    build_name_override = "custom_pupington_woby_ribbon_lunar" ,
    init_fn = function(inst) wobysmall_init_fn(inst, "custom_pupington_woby_ribbon_lunar") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_pupington_woby_ribbon_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_pupington_woby_ribbon_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_pupington_woby_ribbon_shadow.dyn"),
    },
    base_prefab = "wobysmall" ,
    build_name_override = "custom_pupington_woby_ribbon_shadow" ,
    init_fn = function(inst) wobysmall_init_fn(inst, "custom_pupington_woby_ribbon_shadow") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_puppy_chow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_puppy_chow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_puppy_chow.dyn"),
    },
    base_prefab = "critter_puppy" ,
    build_name_override = "custom_puppy_chow" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_puppy_chow", "pupington_build" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PET", "VARG", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_puppy_chow_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_puppy_chow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_puppy_chow.dyn"),
    },
    base_prefab = "critter_puppy_builder" ,
    build_name_override = "custom_puppy_chow" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_puppy_chow" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_puppy_tzu",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_puppy_tzu.zip"),
        Asset("PKGREF", "anim/dynamic/custom_puppy_tzu.dyn"),
    },
    base_prefab = "critter_puppy" ,
    build_name_override = "custom_puppy_tzu" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_puppy_tzu", "pupington_build" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "PET", "VARG", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_puppy_tzu_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_puppy_tzu.zip"),
        Asset("PKGREF", "anim/dynamic/custom_puppy_tzu.dyn"),
    },
    base_prefab = "critter_puppy_builder" ,
    build_name_override = "custom_puppy_tzu" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_puppy_tzu" ) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_puppy_winter",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_puppy_winter.zip"),
        Asset("PKGREF", "anim/dynamic/custom_puppy_winter.dyn"),
    },
    base_prefab = "critter_puppy" ,
    build_name_override = "custom_puppy_winter" ,
    init_fn = function(inst) pet_init_fn(inst, "custom_puppy_winter", "pupington_build" ) end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "PET", "WINTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_puppy_winter_builder",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_puppy_winter.zip"),
        Asset("PKGREF", "anim/dynamic/custom_puppy_winter.dyn"),
    },
    base_prefab = "critter_puppy_builder" ,
    build_name_override = "custom_puppy_winter" ,
    init_fn = function(inst) critter_builder_init_fn(inst, "custom_puppy_winter" ) end,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_rabbithouse_carrat",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_rabbithouse_carrat.zip"),
        Asset("PKGREF", "anim/dynamic/custom_rabbithouse_carrat.dyn"),
    },
    base_prefab = "rabbithouse" ,
    build_name_override = "custom_rabbithouse_carrat" ,
    init_fn = function(inst) rabbithouse_init_fn(inst, "custom_rabbithouse_carrat") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "RABBITHOUSE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_rabbithouse_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_rabbithouse_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_rabbithouse_yule.dyn"),
    },
    base_prefab = "rabbithouse" ,
    build_name_override = "custom_rabbithouse_yule" ,
    fx_prefab = { "rabbithouse_yule_glow_fx", },
    init_fn = function(inst) rabbithouse_init_fn(inst, "custom_rabbithouse_yule") end,
    prefabs = { "rabbithouse_yule_glow_fx", },
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "YULE", "RABBITHOUSE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_raincoat_poncho",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_raincoat_poncho.zip"),
        Asset("PKGREF", "anim/dynamic/custom_raincoat_poncho.dyn"),
    },
    base_prefab = "raincoat" ,
    build_name_override = "custom_raincoat_poncho" ,
    init_fn = function(inst) raincoat_init_fn(inst, "custom_raincoat_poncho") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "RAINCOAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_rainhat_bonnet",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_rainhat_bonnet.zip"),
        Asset("PKGREF", "anim/dynamic/custom_rainhat_bonnet.dyn"),
    },
    base_prefab = "rainhat" ,
    build_name_override = "custom_rainhat_bonnet" ,
    init_fn = function(inst) rainhat_init_fn(inst, "custom_rainhat_bonnet") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_rainhat_cowboy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_rainhat_cowboy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_rainhat_cowboy.dyn"),
    },
    base_prefab = "rainhat" ,
    build_name_override = "custom_rainhat_cowboy" ,
    init_fn = function(inst) rainhat_init_fn(inst, "custom_rainhat_cowboy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_rainhat_floppy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_rainhat_floppy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_rainhat_floppy.dyn"),
    },
    base_prefab = "rainhat" ,
    build_name_override = "custom_rainhat_floppy" ,
    init_fn = function(inst) rainhat_init_fn(inst, "custom_rainhat_floppy") end,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_rainometer_circus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_rainometer_circus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_rainometer_circus.dyn"),
    },
    base_prefab = "rainometer" ,
    build_name_override = "custom_rainometer_circus" ,
    init_fn = function(inst) rainometer_init_fn(inst, "custom_rainometer_circus") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "RAINOMETER", "CIRCUS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_razor_barber",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_razor_barber.zip"),
        Asset("PKGREF", "anim/dynamic/custom_razor_barber.dyn"),
    },
    base_prefab = "razor" ,
    build_name_override = "custom_razor_barber" ,
    init_fn = function(inst) razor_init_fn(inst, "custom_razor_barber") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "RAZOR", "BARBER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_razor_scissors",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_razor_scissors.zip"),
        Asset("PKGREF", "anim/dynamic/custom_razor_scissors.dyn"),
    },
    base_prefab = "razor" ,
    build_name_override = "custom_razor_scissors" ,
    init_fn = function(inst) razor_init_fn(inst, "custom_razor_scissors") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "RAZOR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_razor_straight",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_razor_straight.zip"),
        Asset("PKGREF", "anim/dynamic/custom_razor_straight.dyn"),
    },
    base_prefab = "razor" ,
    build_name_override = "custom_razor_straight" ,
    init_fn = function(inst) razor_init_fn(inst, "custom_razor_straight") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "RAZOR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_record_creepyforest",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_record_creepyforest.zip"),
        Asset("PKGREF", "anim/dynamic/custom_record_creepyforest.dyn"),
    },
    base_prefab = "record" ,
    build_name_override = "custom_record_creepyforest" ,
    init_fn = function(inst) record_init_fn(inst, "custom_record_creepyforest", "dontstarve/music/gramaphone_creepyforest") end,
    rarity = "Complimentary",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_record_drstyle",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_record_drstyle.zip"),
        Asset("PKGREF", "anim/dynamic/custom_record_drstyle.dyn"),
    },
    base_prefab = "record" ,
    build_name_override = "custom_record_drstyle" ,
    init_fn = function(inst) record_init_fn(inst, "custom_record_drstyle", "dontstarve/music/gramaphone_drstyle") end,
    rarity = "Complimentary",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_record_efs",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_record_efs.zip"),
        Asset("PKGREF", "anim/dynamic/custom_record_efs.dyn"),
    },
    base_prefab = "record" ,
    build_name_override = "custom_record_efs" ,
    init_fn = function(inst) record_init_fn(inst, "custom_record_efs", "dontstarve/music/gramaphone_efs") end,
    rarity = "Complimentary",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_record_hallowednights",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_record_hallowednights.zip"),
        Asset("PKGREF", "anim/dynamic/custom_record_hallowednights.dyn"),
    },
    base_prefab = "record" ,
    build_name_override = "custom_record_hallowednights" ,
    init_fn = function(inst) record_init_fn(inst, "custom_record_hallowednights", "dontstarve/music/gramaphone_hallowednights") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_reflectivevest_cawnival",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_reflectivevest_cawnival.zip"),
        Asset("PKGREF", "anim/dynamic/custom_reflectivevest_cawnival.dyn"),
    },
    base_prefab = "reflectivevest" ,
    build_name_override = "custom_reflectivevest_cawnival" ,
    init_fn = function(inst) reflectivevest_init_fn(inst, "custom_reflectivevest_cawnival") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "REFLECTIVEVEST", "CAWNIVAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab2_alchemytable",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab2_alchemytable.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab2_alchemytable.dyn"),
    },
    base_prefab = "researchlab2" ,
    build_name_override = "custom_researchlab2_alchemytable" ,
    init_fn = function(inst) researchlab2_init_fn(inst, "custom_researchlab2_alchemytable") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "T_UPDATE", "ALCHEMY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab2_crystal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab2_crystal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab2_crystal.dyn"),
    },
    base_prefab = "researchlab2" ,
    build_name_override = "custom_researchlab2_crystal" ,
    init_fn = function(inst) researchlab2_init_fn(inst, "custom_researchlab2_crystal") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "CRYSTAL", "ALCHEMY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab2_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab2_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab2_gothic.dyn"),
    },
    base_prefab = "researchlab2" ,
    build_name_override = "custom_researchlab2_gothic" ,
    init_fn = function(inst) researchlab2_init_fn(inst, "custom_researchlab2_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "GOTHIC", "ALCHEMY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab2_pod",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab2_pod.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab2_pod.dyn"),
    },
    base_prefab = "researchlab2" ,
    build_name_override = "custom_researchlab2_pod" ,
    fx_prefab = { "researchlab2_pod_fx", },
    init_fn = function(inst) researchlab2_init_fn(inst, "custom_researchlab2_pod") end,
    marketable = true,
    prefabs = { "researchlab2_pod_fx", },
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "ALCHEMY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab2_science",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab2_science.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab2_science.dyn"),
    },
    base_prefab = "researchlab2" ,
    build_name_override = "custom_researchlab2_science" ,
    init_fn = function(inst) researchlab2_init_fn(inst, "custom_researchlab2_science") end,
    rarity = "ProofOfPurchase",
    release_group = groupid,
    skin_tags = { "ALCHEMY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab3_adventure",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab3_adventure.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab3_adventure.dyn"),
    },
    base_prefab = "researchlab3" ,
    build_name_override = "custom_researchlab3_adventure" ,
    init_fn = function(inst) researchlab3_init_fn(inst, "custom_researchlab3_adventure") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ADVENTURE", "MANIPULATOR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab3_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab3_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab3_ancient.dyn"),
    },
    base_prefab = "researchlab3" ,
    build_name_override = "custom_researchlab3_ancient" ,
    init_fn = function(inst) researchlab3_init_fn(inst, "custom_researchlab3_ancient") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "MANIPULATOR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab3_crystal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab3_crystal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab3_crystal.dyn"),
    },
    base_prefab = "researchlab3" ,
    build_name_override = "custom_researchlab3_crystal" ,
    init_fn = function(inst) researchlab3_init_fn(inst, "custom_researchlab3_crystal") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "CRYSTAL", "MANIPULATOR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab3_monster",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab3_monster.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab3_monster.dyn"),
    },
    base_prefab = "researchlab3" ,
    build_name_override = "custom_researchlab3_monster" ,
    init_fn = function(inst) researchlab3_init_fn(inst, "custom_researchlab3_monster") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "HALLOWED", "MANIPULATOR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab3_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab3_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab3_nature.dyn"),
    },
    base_prefab = "researchlab3" ,
    build_name_override = "custom_researchlab3_nature" ,
    init_fn = function(inst) researchlab3_init_fn(inst, "custom_researchlab3_nature") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "MANIPULATOR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab4_catcoon_costume",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab4_catcoon_costume.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab4_catcoon_costume.dyn"),
    },
    base_prefab = "researchlab4" ,
    build_name_override = "custom_researchlab4_catcoon_costume" ,
    init_fn = function(inst) researchlab4_init_fn(inst, "custom_researchlab4_catcoon_costume") end,
    rarity = "HeirloomElegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab4_chef",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab4_chef.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab4_chef.dyn"),
    },
    base_prefab = "researchlab4" ,
    build_name_override = "custom_researchlab4_chef" ,
    init_fn = function(inst) researchlab4_init_fn(inst, "custom_researchlab4_chef") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab4_chester_costume",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab4_chester_costume.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab4_chester_costume.dyn"),
    },
    base_prefab = "researchlab4" ,
    build_name_override = "custom_researchlab4_chester_costume" ,
    init_fn = function(inst) researchlab4_init_fn(inst, "custom_researchlab4_chester_costume") end,
    rarity = "HeirloomElegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab4_derby",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab4_derby.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab4_derby.dyn"),
    },
    base_prefab = "researchlab4" ,
    build_name_override = "custom_researchlab4_derby" ,
    init_fn = function(inst) researchlab4_init_fn(inst, "custom_researchlab4_derby") end,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab4_festive_bell_red_firehound",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab4_festive_bell_red_firehound.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab4_festive_bell_red_firehound.dyn"),
    },
    base_prefab = "researchlab4" ,
    build_name_override = "custom_researchlab4_festive_bell_red_firehound" ,
    init_fn = function(inst) researchlab4_init_fn(inst, "custom_researchlab4_festive_bell_red_firehound") end,
    rarity = "Event",
    release_group = groupid,
    skin_tags = { "RED", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab4_fish",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab4_fish.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab4_fish.dyn"),
    },
    base_prefab = "researchlab4" ,
    build_name_override = "custom_researchlab4_fish" ,
    init_fn = function(inst) researchlab4_init_fn(inst, "custom_researchlab4_fish") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab4_glommer_costume",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab4_glommer_costume.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab4_glommer_costume.dyn"),
    },
    base_prefab = "researchlab4" ,
    build_name_override = "custom_researchlab4_glommer_costume" ,
    init_fn = function(inst) researchlab4_init_fn(inst, "custom_researchlab4_glommer_costume") end,
    rarity = "HeirloomElegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab4_hutch_costume",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab4_hutch_costume.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab4_hutch_costume.dyn"),
    },
    base_prefab = "researchlab4" ,
    build_name_override = "custom_researchlab4_hutch_costume" ,
    init_fn = function(inst) researchlab4_init_fn(inst, "custom_researchlab4_hutch_costume") end,
    rarity = "HeirloomElegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab4_merchant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab4_merchant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab4_merchant.dyn"),
    },
    base_prefab = "researchlab4" ,
    build_name_override = "custom_researchlab4_merchant" ,
    init_fn = function(inst) researchlab4_init_fn(inst, "custom_researchlab4_merchant") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab4_tophat_circus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab4_tophat_circus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab4_tophat_circus.dyn"),
    },
    base_prefab = "researchlab4" ,
    build_name_override = "custom_researchlab4_tophat_circus" ,
    init_fn = function(inst) researchlab4_init_fn(inst, "custom_researchlab4_tophat_circus") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab4_tophat_harlequin",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab4_tophat_harlequin.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab4_tophat_harlequin.dyn"),
    },
    base_prefab = "researchlab4" ,
    build_name_override = "custom_researchlab4_tophat_harlequin" ,
    init_fn = function(inst) researchlab4_init_fn(inst, "custom_researchlab4_tophat_harlequin") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab4_tophat_spiked",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab4_tophat_spiked.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab4_tophat_spiked.dyn"),
    },
    base_prefab = "researchlab4" ,
    build_name_override = "custom_researchlab4_tophat_spiked" ,
    init_fn = function(inst) researchlab4_init_fn(inst, "custom_researchlab4_tophat_spiked") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab4_tophat_wizard",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab4_tophat_wizard.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab4_tophat_wizard.dyn"),
    },
    base_prefab = "researchlab4" ,
    build_name_override = "custom_researchlab4_tophat_wizard" ,
    init_fn = function(inst) researchlab4_init_fn(inst, "custom_researchlab4_tophat_wizard") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab4_witch_pyre",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab4_witch_pyre.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab4_witch_pyre.dyn"),
    },
    base_prefab = "researchlab4" ,
    build_name_override = "custom_researchlab4_witch_pyre" ,
    init_fn = function(inst) researchlab4_init_fn(inst, "custom_researchlab4_witch_pyre") end,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab_gothic.dyn"),
    },
    base_prefab = "researchlab" ,
    build_name_override = "custom_researchlab_gothic" ,
    init_fn = function(inst) researchlab_init_fn(inst, "custom_researchlab_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SCIENCEMACHINE", "GOTHIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab_green",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab_green.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab_green.dyn"),
    },
    base_prefab = "researchlab" ,
    build_name_override = "custom_researchlab_green" ,
    init_fn = function(inst) researchlab_init_fn(inst, "custom_researchlab_green") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "SCIENCEMACHINE", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab_party",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab_party.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab_party.dyn"),
    },
    base_prefab = "researchlab" ,
    build_name_override = "custom_researchlab_party" ,
    init_fn = function(inst) researchlab_init_fn(inst, "custom_researchlab_party") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "SCIENCEMACHINE", "TENYEARS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_researchlab_retro",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_researchlab_retro.zip"),
        Asset("PKGREF", "anim/dynamic/custom_researchlab_retro.dyn"),
    },
    base_prefab = "researchlab" ,
    build_name_override = "custom_researchlab_retro" ,
    init_fn = function(inst) researchlab_init_fn(inst, "custom_researchlab_retro") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SCIENCEMACHINE", "RETRO", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_reskin_tool_bouquet",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_reskin_tool_bouquet.zip"),
        Asset("PKGREF", "anim/dynamic/custom_reskin_tool_bouquet.dyn"),
    },
    base_prefab = "reskin_tool" ,
    build_name_override = "custom_reskin_tool_bouquet" ,
    fx_prefab = { "reskin_tool_bouquet_explode_fx", },
    init_fn = function(inst) reskin_tool_init_fn(inst, "custom_reskin_tool_bouquet") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "RESKIN", "CRAFTABLE", "HEART", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_reskin_tool_brush",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_reskin_tool_brush.zip"),
        Asset("PKGREF", "anim/dynamic/custom_reskin_tool_brush.dyn"),
    },
    base_prefab = "reskin_tool" ,
    build_name_override = "custom_reskin_tool_brush" ,
    fx_prefab = { "reskin_tool_brush_explode_fx", },
    init_fn = function(inst) reskin_tool_init_fn(inst, "custom_reskin_tool_brush") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "RESKIN", "CRAFTABLE", "T_UPDATE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_reskin_tool_toilet",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_reskin_tool_toilet.zip"),
        Asset("PKGREF", "anim/dynamic/custom_reskin_tool_toilet.dyn"),
    },
    base_prefab = "reskin_tool" ,
    build_name_override = "custom_reskin_tool_toilet" ,
    fx_prefab = { "reskin_tool_toilet_explode_fx", },
    init_fn = function(inst) reskin_tool_init_fn(inst, "custom_reskin_tool_toilet") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "RESKIN", "CRAFTABLE", "SHADOW", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_reskin_tool_wand",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_reskin_tool_wand.zip"),
        Asset("PKGREF", "anim/dynamic/custom_reskin_tool_wand.dyn"),
    },
    base_prefab = "reskin_tool" ,
    build_name_override = "custom_reskin_tool_wand" ,
    fx_prefab = { "reskin_tool_wand_explode_fx", },
    init_fn = function(inst) reskin_tool_init_fn(inst, "custom_reskin_tool_wand") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "RESKIN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_resurrectionstatue_barber",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_resurrectionstatue_barber.zip"),
        Asset("PKGREF", "anim/dynamic/custom_resurrectionstatue_barber.dyn"),
    },
    base_prefab = "resurrectionstatue" ,
    build_name_override = "custom_resurrectionstatue_barber" ,
    init_fn = function(inst) resurrectionstatue_init_fn(inst, "custom_resurrectionstatue_barber") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "RESURRECTIONSTATUE", "BARBER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_resurrectionstone_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_resurrectionstone_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_resurrectionstone_fantasy.dyn"),
    },
    base_prefab = "resurrectionstone" ,
    build_name_override = "custom_resurrectionstone_fantasy" ,
    init_fn = function(inst) resurrectionstone_init_fn(inst, "custom_resurrectionstone_fantasy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "GRAVESTONE", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_resurrectionstone_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_resurrectionstone_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_resurrectionstone_gothic.dyn"),
    },
    base_prefab = "resurrectionstone" ,
    build_name_override = "custom_resurrectionstone_gothic" ,
    init_fn = function(inst) resurrectionstone_init_fn(inst, "custom_resurrectionstone_gothic") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "GRAVESTONE", "GOTHIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_reviver_cupid",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_reviver_cupid.zip"),
        Asset("PKGREF", "anim/dynamic/custom_reviver_cupid.dyn"),
    },
    base_prefab = "reviver" ,
    build_name_override = "custom_reviver_cupid" ,
    fx_prefab = { "reviver_cupid_beat_fx", "reviver_cupid_glow_fx", },
    init_fn = function(inst) reviver_init_fn(inst, "custom_reviver_cupid") end,
    prefabs = { "reviver_cupid_beat_fx", "reviver_cupid_glow_fx", },
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "REVIVER", "HEART", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_reviver_cupid_2",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_reviver_cupid_2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_reviver_cupid_2.dyn"),
    },
    base_prefab = "reviver" ,
    build_name_override = "custom_reviver_cupid_2" ,
    fx_prefab = { "reviver_cupid_beat_fx", "reviver_cupid_glow_fx", },
    init_fn = function(inst) reviver_init_fn(inst, "custom_reviver_cupid_2") end,
    prefabs = { "reviver_cupid_beat_fx", "reviver_cupid_glow_fx", },
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "REVIVER", "HEART", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_reviver_cupid_3",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_reviver_cupid_3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_reviver_cupid_3.dyn"),
    },
    base_prefab = "reviver" ,
    build_name_override = "custom_reviver_cupid_3" ,
    fx_prefab = { "reviver_cupid_beat_fx", "reviver_cupid_glow_fx", },
    init_fn = function(inst) reviver_init_fn(inst, "custom_reviver_cupid_3") end,
    prefabs = { "reviver_cupid_beat_fx", "reviver_cupid_glow_fx", },
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "REVIVER", "HEART", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_reviver_cupid_4",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_reviver_cupid_4.zip"),
        Asset("PKGREF", "anim/dynamic/custom_reviver_cupid_4.dyn"),
    },
    base_prefab = "reviver" ,
    build_name_override = "custom_reviver_cupid_4" ,
    fx_prefab = { "reviver_cupid_beat_fx", "reviver_cupid_glow_fx", },
    init_fn = function(inst) reviver_init_fn(inst, "custom_reviver_cupid_4") end,
    prefabs = { "reviver_cupid_beat_fx", "reviver_cupid_glow_fx", },
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "REVIVER", "HEART", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_reviver_lifecrystal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_reviver_lifecrystal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_reviver_lifecrystal.dyn"),
    },
    base_prefab = "reviver" ,
    build_name_override = "custom_reviver_lifecrystal" ,
    fx_prefab = { "", "reviver_cupid_glow_fx", },
    init_fn = function(inst) reviver_init_fn(inst, "custom_reviver_lifecrystal") end,
    prefabs = { "reviver_cupid_glow_fx", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_sound = { ["genericuse"] = "terraria1/skins/life_crystal", },
    skin_tags = { "REVIVER", "T_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_round_table_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_round_table_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_round_table_fantasy.dyn"),
    },
    base_prefab = "wood_table_round" ,
    build_name_override = "custom_round_table_fantasy" ,
    init_fn = function(inst) wood_table_round_init_fn(inst, "custom_round_table_fantasy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WOOD_TABLE_ROUND", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_round_table_hallowed",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_round_table_hallowed.zip"),
        Asset("PKGREF", "anim/dynamic/custom_round_table_hallowed.dyn"),
    },
    base_prefab = "wood_table_round" ,
    build_name_override = "custom_round_table_hallowed" ,
    init_fn = function(inst) wood_table_round_init_fn(inst, "custom_round_table_hallowed") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WOOD_TABLE_ROUND", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_round_table_handmade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_round_table_handmade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_round_table_handmade.dyn"),
    },
    base_prefab = "wood_table_round" ,
    build_name_override = "custom_round_table_handmade" ,
    init_fn = function(inst) wood_table_round_init_fn(inst, "custom_round_table_handmade") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WOOD_TABLE_ROUND", "BUILDERS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_round_table_western",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_round_table_western.zip"),
        Asset("PKGREF", "anim/dynamic/custom_round_table_western.dyn"),
    },
    base_prefab = "wood_table_round" ,
    build_name_override = "custom_round_table_western" ,
    init_fn = function(inst) wood_table_round_init_fn(inst, "custom_round_table_western") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WOOD_TABLE_ROUND", "WESTERN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_ruins_bat_an",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ruins_bat_an.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ruins_bat_an.dyn"),
    },
    base_prefab = "ruins_bat" ,
    build_name_override = "custom_ruins_bat_an" ,
    init_fn = function(inst) ruins_bat_init_fn(inst, "custom_ruins_bat_an") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "RUINS_BAT", "ARTNOUVEAU", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_ruins_bat_arcane",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ruins_bat_arcane.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ruins_bat_arcane.dyn"),
    },
    base_prefab = "ruins_bat" ,
    build_name_override = "custom_ruins_bat_arcane" ,
    init_fn = function(inst) ruins_bat_init_fn(inst, "custom_ruins_bat_arcane") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "RUINS_BAT", "BUILDERS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_ruins_bat_heavy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ruins_bat_heavy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ruins_bat_heavy.dyn"),
    },
    base_prefab = "ruins_bat" ,
    build_name_override = "custom_ruins_bat_heavy" ,
    init_fn = function(inst) ruins_bat_init_fn(inst, "custom_ruins_bat_heavy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "RUINS_BAT", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_ruinshat_an",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ruinshat_an.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ruinshat_an.dyn"),
    },
    base_prefab = "ruinshat" ,
    build_name_override = "custom_ruinshat_an" ,
    init_fn = function(inst) ruinshat_init_fn(inst, "custom_ruinshat_an") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "RUINSHAT", "ARTNOUVEAU", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_ruinshat_arcane",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ruinshat_arcane.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ruinshat_arcane.dyn"),
    },
    base_prefab = "ruinshat" ,
    build_name_override = "custom_ruinshat_arcane" ,
    init_fn = function(inst) ruinshat_init_fn(inst, "custom_ruinshat_arcane") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "RUINSHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_ruinsrelic_chair_toilet",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ruinsrelic_chair_toilet.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ruinsrelic_chair_toilet.dyn"),
    },
    base_prefab = "ruinsrelic_chair" ,
    build_name_override = "custom_ruinsrelic_chair_toilet" ,
    init_fn = function(inst) ruinsrelic_chair_init_fn(inst, "custom_ruinsrelic_chair_toilet") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "SHADOW", "RUINSRELIC_CHAIR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_saddle_basic_yotb",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_saddle_basic_yotb.zip"),
        Asset("PKGREF", "anim/dynamic/custom_saddle_basic_yotb.dyn"),
    },
    base_prefab = "saddle_basic" ,
    build_name_override = "custom_saddle_basic_yotb" ,
    init_fn = function(inst) saddle_basic_init_fn(inst, "custom_saddle_basic_yotb") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "SADDLE_BASIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_saltbox_kitchen",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_saltbox_kitchen.zip"),
        Asset("PKGREF", "anim/dynamic/custom_saltbox_kitchen.dyn"),
    },
    base_prefab = "saltbox" ,
    build_name_override = "custom_saltbox_kitchen" ,
    init_fn = function(inst) saltbox_init_fn(inst, "custom_saltbox_kitchen") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SALTBOX", "COTTAGE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_saltbox_nautical",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_saltbox_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_saltbox_nautical.dyn"),
    },
    base_prefab = "saltbox" ,
    build_name_override = "custom_saltbox_nautical" ,
    init_fn = function(inst) saltbox_init_fn(inst, "custom_saltbox_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "SALTBOX", "NAUTICAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_saltbox_shaker",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_saltbox_shaker.zip"),
        Asset("PKGREF", "anim/dynamic/custom_saltbox_shaker.dyn"),
    },
    base_prefab = "saltbox" ,
    build_name_override = "custom_saltbox_shaker" ,
    init_fn = function(inst) saltbox_init_fn(inst, "custom_saltbox_shaker") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "SALTBOX", "FOOLS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_saltbox_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_saltbox_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_saltbox_victorian.dyn"),
    },
    base_prefab = "saltbox" ,
    build_name_override = "custom_saltbox_victorian" ,
    init_fn = function(inst) saltbox_init_fn(inst, "custom_saltbox_victorian") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SALTBOX", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_sanityrock_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_sanityrock_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_sanityrock_fantasy.dyn"),
    },
    base_prefab = "sanityrock" ,
    build_name_override = "custom_sanityrock_fantasy" ,
    init_fn = function(inst) sanityrock_init_fn(inst, "custom_sanityrock_fantasy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SANITYROCK", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_sanityrock_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_sanityrock_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_sanityrock_gothic.dyn"),
    },
    base_prefab = "sanityrock" ,
    build_name_override = "custom_sanityrock_gothic" ,
    init_fn = function(inst) sanityrock_init_fn(inst, "custom_sanityrock_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SANITYROCK", "GOTHIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_sculptingtable_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_sculptingtable_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_sculptingtable_gothic.dyn"),
    },
    base_prefab = "sculptingtable" ,
    build_name_override = "custom_sculptingtable_gothic" ,
    init_fn = function(inst) sculptingtable_init_fn(inst, "custom_sculptingtable_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SCULPTINGTABLE", "GOTHIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_seafaring_prototyper_lighthouse",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_seafaring_prototyper_lighthouse.zip"),
        Asset("PKGREF", "anim/dynamic/custom_seafaring_prototyper_lighthouse.dyn"),
    },
    base_prefab = "seafaring_prototyper" ,
    build_name_override = "custom_seafaring_prototyper_lighthouse" ,
    init_fn = function(inst) seafaring_prototyper_init_fn(inst, "custom_seafaring_prototyper_lighthouse") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SEASIDE", "SEAFARINGPROTO", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_seedpouch_garden",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_seedpouch_garden.zip"),
        Asset("PKGREF", "anim/dynamic/custom_seedpouch_garden.dyn"),
    },
    base_prefab = "seedpouch" ,
    build_name_override = "custom_seedpouch_garden" ,
    init_fn = function(inst) seedpouch_init_fn(inst, "custom_seedpouch_garden") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "COTTAGE", "SEEDPOUCH", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_seedpouch_rustic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_seedpouch_rustic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_seedpouch_rustic.dyn"),
    },
    base_prefab = "seedpouch" ,
    build_name_override = "custom_seedpouch_rustic" ,
    init_fn = function(inst) seedpouch_init_fn(inst, "custom_seedpouch_rustic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BOY", "SEEDPOUCH", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_sewing_mannequin_an",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_sewing_mannequin_an.zip"),
        Asset("PKGREF", "anim/dynamic/custom_sewing_mannequin_an.dyn"),
    },
    base_prefab = "sewing_mannequin" ,
    build_name_override = "custom_sewing_mannequin_an" ,
    init_fn = function(inst) sewing_mannequin_init_fn(inst, "custom_sewing_mannequin_an") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SEWING_MANNEQUIN", "ARTNOUVEAU", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_shovel_feathered",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_shovel_feathered.zip"),
        Asset("PKGREF", "anim/dynamic/custom_shovel_feathered.dyn"),
    },
    base_prefab = "shovel" ,
    build_name_override = "custom_shovel_feathered" ,
    init_fn = function(inst) shovel_init_fn(inst, "custom_shovel_feathered") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SHOVEL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_shovel_heart",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_shovel_heart.zip"),
        Asset("PKGREF", "anim/dynamic/custom_shovel_heart.dyn"),
    },
    base_prefab = "shovel" ,
    build_name_override = "custom_shovel_heart" ,
    init_fn = function(inst) shovel_init_fn(inst, "custom_shovel_heart") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "HEART", "SHOVEL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_shovel_invisible",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_shovel_invisible.zip"),
        Asset("PKGREF", "anim/dynamic/custom_shovel_invisible.dyn"),
    },
    base_prefab = "shovel" ,
    build_name_override = "custom_shovel_invisible" ,
    init_fn = function(inst) shovel_init_fn(inst, "custom_shovel_invisible") end,
    rarity = "Classy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SHOVEL", "INVISIBLE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_shovel_northern",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_shovel_northern.zip"),
        Asset("PKGREF", "anim/dynamic/custom_shovel_northern.dyn"),
    },
    base_prefab = "shovel" ,
    build_name_override = "custom_shovel_northern" ,
    init_fn = function(inst) shovel_init_fn(inst, "custom_shovel_northern") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "SHOVEL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_shovel_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_shovel_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_shovel_victorian.dyn"),
    },
    base_prefab = "shovel" ,
    build_name_override = "custom_shovel_victorian" ,
    init_fn = function(inst) shovel_init_fn(inst, "custom_shovel_victorian") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SHOVEL", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_siestahut_cawnival",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_siestahut_cawnival.zip"),
        Asset("PKGREF", "anim/dynamic/custom_siestahut_cawnival.dyn"),
    },
    base_prefab = "siestahut" ,
    build_name_override = "custom_siestahut_cawnival" ,
    fx_prefab = { "carnival_sparkle_bush", },
    init_fn = function(inst) siestahut_init_fn(inst, "custom_siestahut_cawnival") end,
    prefabs = { "carnival_sparkle_bush", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SIESTAHUT", "CAWNIVAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_sisturn_beachhouse",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_sisturn_beachhouse.zip"),
        Asset("PKGREF", "anim/dynamic/custom_sisturn_beachhouse.dyn"),
    },
    base_prefab = "sisturn" ,
    build_name_override = "custom_sisturn_beachhouse" ,
    init_fn = function(inst) sisturn_init_fn(inst, "custom_sisturn_beachhouse") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SISTURN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_sisturn_nest",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_sisturn_nest.zip"),
        Asset("PKGREF", "anim/dynamic/custom_sisturn_nest.dyn"),
    },
    base_prefab = "sisturn" ,
    build_name_override = "custom_sisturn_nest" ,
    init_fn = function(inst) sisturn_init_fn(inst, "custom_sisturn_nest") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SISTURN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_skeletonhat_relic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_skeletonhat_relic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_skeletonhat_relic.dyn"),
    },
    base_prefab = "skeletonhat" ,
    build_name_override = "custom_skeletonhat_relic" ,
    init_fn = function(inst) skeletonhat_init_fn(inst, "custom_skeletonhat_relic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SKELETONHAT", "RELIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_skeletonhat_shadowhelmet",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_skeletonhat_shadowhelmet.zip"),
        Asset("PKGREF", "anim/dynamic/custom_skeletonhat_shadowhelmet.dyn"),
    },
    base_prefab = "skeletonhat" ,
    build_name_override = "custom_skeletonhat_shadowhelmet" ,
    init_fn = function(inst) skeletonhat_init_fn(inst, "custom_skeletonhat_shadowhelmet") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SKELETONHAT", "T_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshot2_bandaged",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_bandaged.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_bandaged.dyn"),
    },
    base_prefab = "slingshot2" ,
    build_name_override = "custom_slingshot_bandaged" ,
    init_fn = function(inst) slingshot2_init_fn(inst, "custom_slingshot_bandaged") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshot2_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_nature.dyn"),
    },
    base_prefab = "slingshot2" ,
    build_name_override = "custom_slingshot_nature" ,
    init_fn = function(inst) slingshot2_init_fn(inst, "custom_slingshot_nature") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshot2_spiked",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_spiked.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_spiked.dyn"),
    },
    base_prefab = "slingshot2" ,
    build_name_override = "custom_slingshot_spiked" ,
    init_fn = function(inst) slingshot2_init_fn(inst, "custom_slingshot_spiked") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshot2_straws",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_straws.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_straws.dyn"),
    },
    base_prefab = "slingshot2" ,
    build_name_override = "custom_slingshot_straws" ,
    init_fn = function(inst) slingshot2_init_fn(inst, "custom_slingshot_straws") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshot2ex_bandaged",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_bandaged.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_bandaged.dyn"),
    },
    base_prefab = "slingshot2ex" ,
    build_name_override = "custom_slingshot_bandaged" ,
    init_fn = function(inst) slingshot2ex_init_fn(inst, "custom_slingshot_bandaged") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshot2ex_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_nature.dyn"),
    },
    base_prefab = "slingshot2ex" ,
    build_name_override = "custom_slingshot_nature" ,
    init_fn = function(inst) slingshot2ex_init_fn(inst, "custom_slingshot_nature") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshot2ex_spiked",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_spiked.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_spiked.dyn"),
    },
    base_prefab = "slingshot2ex" ,
    build_name_override = "custom_slingshot_spiked" ,
    init_fn = function(inst) slingshot2ex_init_fn(inst, "custom_slingshot_spiked") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshot2ex_straws",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_straws.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_straws.dyn"),
    },
    base_prefab = "slingshot2ex" ,
    build_name_override = "custom_slingshot_straws" ,
    init_fn = function(inst) slingshot2ex_init_fn(inst, "custom_slingshot_straws") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshot999ex_bandaged",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_bandaged.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_bandaged.dyn"),
    },
    base_prefab = "slingshot999ex" ,
    build_name_override = "custom_slingshot_bandaged" ,
    init_fn = function(inst) slingshot999ex_init_fn(inst, "custom_slingshot_bandaged") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshot999ex_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_nature.dyn"),
    },
    base_prefab = "slingshot999ex" ,
    build_name_override = "custom_slingshot_nature" ,
    init_fn = function(inst) slingshot999ex_init_fn(inst, "custom_slingshot_nature") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshot999ex_spiked",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_spiked.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_spiked.dyn"),
    },
    base_prefab = "slingshot999ex" ,
    build_name_override = "custom_slingshot_spiked" ,
    init_fn = function(inst) slingshot999ex_init_fn(inst, "custom_slingshot_spiked") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshot999ex_straws",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_straws.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_straws.dyn"),
    },
    base_prefab = "slingshot999ex" ,
    build_name_override = "custom_slingshot_straws" ,
    init_fn = function(inst) slingshot999ex_init_fn(inst, "custom_slingshot_straws") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshot_bandaged",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_bandaged.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_bandaged.dyn"),
    },
    base_prefab = "slingshot" ,
    build_name_override = "custom_slingshot_bandaged" ,
    granted_items = { "custom_slingshot2_bandaged" , "custom_slingshot2ex_bandaged" , "custom_slingshot999ex_bandaged" , "custom_slingshotex_bandaged" , },
    init_fn = function(inst) slingshot_init_fn(inst, "custom_slingshot_bandaged") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SLINGSHOT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshot_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_nature.dyn"),
    },
    base_prefab = "slingshot" ,
    build_name_override = "custom_slingshot_nature" ,
    granted_items = { "custom_slingshot2_nature" , "custom_slingshot2ex_nature" , "custom_slingshot999ex_nature" , "custom_slingshotex_nature" , },
    init_fn = function(inst) slingshot_init_fn(inst, "custom_slingshot_nature") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SLINGSHOT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshot_spiked",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_spiked.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_spiked.dyn"),
    },
    base_prefab = "slingshot" ,
    build_name_override = "custom_slingshot_spiked" ,
    granted_items = { "custom_slingshot2_spiked" , "custom_slingshot2ex_spiked" , "custom_slingshot999ex_spiked" , "custom_slingshotex_spiked" , },
    init_fn = function(inst) slingshot_init_fn(inst, "custom_slingshot_spiked") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SLINGSHOT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshot_straws",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_straws.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_straws.dyn"),
    },
    base_prefab = "slingshot" ,
    build_name_override = "custom_slingshot_straws" ,
    granted_items = { "custom_slingshot2_straws" , "custom_slingshot2ex_straws" , "custom_slingshot999ex_straws" , "custom_slingshotex_straws" , },
    init_fn = function(inst) slingshot_init_fn(inst, "custom_slingshot_straws") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SLINGSHOT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshotex_bandaged",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_bandaged.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_bandaged.dyn"),
    },
    base_prefab = "slingshotex" ,
    build_name_override = "custom_slingshot_bandaged" ,
    init_fn = function(inst) slingshotex_init_fn(inst, "custom_slingshot_bandaged") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshotex_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_nature.dyn"),
    },
    base_prefab = "slingshotex" ,
    build_name_override = "custom_slingshot_nature" ,
    init_fn = function(inst) slingshotex_init_fn(inst, "custom_slingshot_nature") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshotex_spiked",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_spiked.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_spiked.dyn"),
    },
    base_prefab = "slingshotex" ,
    build_name_override = "custom_slingshot_spiked" ,
    init_fn = function(inst) slingshotex_init_fn(inst, "custom_slingshot_spiked") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_slingshotex_straws",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_slingshot_straws.zip"),
        Asset("PKGREF", "anim/dynamic/custom_slingshot_straws.dyn"),
    },
    base_prefab = "slingshotex" ,
    build_name_override = "custom_slingshot_straws" ,
    init_fn = function(inst) slingshotex_init_fn(inst, "custom_slingshot_straws") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_bee",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_bee.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_bee.dyn"),
    },
    base_prefab = "spear" ,
    build_name_override = "custom_spear_bee" ,
    granted_items = { "custom_firestaff_bee" , "custom_icestaff_bee" , },
    init_fn = function(inst) spear_init_fn(inst, "custom_spear_bee") end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "SPEAR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_forge_gungnir",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_forge_gungnir.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_forge_gungnir.dyn"),
    },
    base_prefab = "spear" ,
    build_name_override = "custom_spear_forge_gungnir" ,
    granted_items = { "custom_firestaff_gungnir" , "custom_icestaff_gungnir" , },
    init_fn = function(inst) spear_init_fn(inst, "custom_spear_forge_gungnir") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SPEAR", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_forge_lance",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_forge_lance.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_forge_lance.dyn"),
    },
    base_prefab = "spear" ,
    build_name_override = "custom_spear_forge_lance" ,
    granted_items = { "custom_firestaff_lance" , "custom_icestaff_lance" , },
    init_fn = function(inst) spear_init_fn(inst, "custom_spear_forge_lance") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SPEAR", "LAVA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_hockey",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_hockey.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_hockey.dyn"),
    },
    base_prefab = "spear" ,
    build_name_override = "custom_spear_hockey" ,
    granted_items = { "custom_firestaff_hockey" , "custom_icestaff_hockey" , },
    init_fn = function(inst) spear_init_fn(inst, "custom_spear_hockey") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SPEAR", "HOCKEY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_northern",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_northern.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_northern.dyn"),
    },
    base_prefab = "spear" ,
    build_name_override = "custom_spear_northern" ,
    granted_items = { "custom_firestaff_northern" , "custom_icestaff_northern" , },
    init_fn = function(inst) spear_init_fn(inst, "custom_spear_northern") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "SPEAR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_ragged",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_ragged.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_ragged.dyn"),
    },
    base_prefab = "spear" ,
    build_name_override = "custom_spear_ragged" ,
    init_fn = function(inst) spear_init_fn(inst, "custom_spear_ragged") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SPEAR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_rose.dyn"),
    },
    base_prefab = "spear" ,
    build_name_override = "custom_spear_rose" ,
    granted_items = { "custom_firestaff_rose" , "custom_icestaff_rose" , },
    init_fn = function(inst) spear_init_fn(inst, "custom_spear_rose") end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "SPEAR", "ROSE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_simple",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_simple.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_simple.dyn"),
    },
    base_prefab = "spear" ,
    build_name_override = "custom_spear_simple" ,
    init_fn = function(inst) spear_init_fn(inst, "custom_spear_simple") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SPEAR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_wathgrithr_lightning_charged_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_wathgrithr_lightning_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_wathgrithr_lightning_lunar.dyn"),
    },
    base_prefab = "spear_wathgrithr_lightning_charged" ,
    build_name_override = "custom_spear_wathgrithr_lightning_lunar" ,
    init_fn = function(inst) spear_wathgrithr_lightning_charged_init_fn(inst, "custom_spear_wathgrithr_lightning_lunar") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_wathgrithr_lightning_charged_northern",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_wathgrithr_lightning_northern.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_wathgrithr_lightning_northern.dyn"),
    },
    base_prefab = "spear_wathgrithr_lightning_charged" ,
    build_name_override = "custom_spear_wathgrithr_lightning_northern" ,
    init_fn = function(inst) spear_wathgrithr_lightning_charged_init_fn(inst, "custom_spear_wathgrithr_lightning_northern") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_wathgrithr_lightning_charged_valkyrie",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_wathgrithr_lightning_valkyrie.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_wathgrithr_lightning_valkyrie.dyn"),
    },
    base_prefab = "spear_wathgrithr_lightning_charged" ,
    build_name_override = "custom_spear_wathgrithr_lightning_valkyrie" ,
    init_fn = function(inst) spear_wathgrithr_lightning_charged_init_fn(inst, "custom_spear_wathgrithr_lightning_valkyrie") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_wathgrithr_lightning_charged_wrestle",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_wathgrithr_lightning_wrestle.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_wathgrithr_lightning_wrestle.dyn"),
    },
    base_prefab = "spear_wathgrithr_lightning_charged" ,
    build_name_override = "custom_spear_wathgrithr_lightning_wrestle" ,
    init_fn = function(inst) spear_wathgrithr_lightning_charged_init_fn(inst, "custom_spear_wathgrithr_lightning_wrestle") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_wathgrithr_lightning_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_wathgrithr_lightning_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_wathgrithr_lightning_lunar.dyn"),
    },
    base_prefab = "spear_wathgrithr_lightning" ,
    build_name_override = "custom_spear_wathgrithr_lightning_lunar" ,
    init_fn = function(inst) spear_wathgrithr_lightning_init_fn(inst, "custom_spear_wathgrithr_lightning_lunar") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_wathgrithr_lightning_northern",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_wathgrithr_lightning_northern.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_wathgrithr_lightning_northern.dyn"),
    },
    base_prefab = "spear_wathgrithr_lightning" ,
    build_name_override = "custom_spear_wathgrithr_lightning_northern" ,
    init_fn = function(inst) spear_wathgrithr_lightning_init_fn(inst, "custom_spear_wathgrithr_lightning_northern") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_wathgrithr_lightning_valkyrie",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_wathgrithr_lightning_valkyrie.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_wathgrithr_lightning_valkyrie.dyn"),
    },
    base_prefab = "spear_wathgrithr_lightning" ,
    build_name_override = "custom_spear_wathgrithr_lightning_valkyrie" ,
    init_fn = function(inst) spear_wathgrithr_lightning_init_fn(inst, "custom_spear_wathgrithr_lightning_valkyrie") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_wathgrithr_lightning_wrestle",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_wathgrithr_lightning_wrestle.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_wathgrithr_lightning_wrestle.dyn"),
    },
    base_prefab = "spear_wathgrithr_lightning" ,
    build_name_override = "custom_spear_wathgrithr_lightning_wrestle" ,
    init_fn = function(inst) spear_wathgrithr_lightning_init_fn(inst, "custom_spear_wathgrithr_lightning_wrestle") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_wathgrithr_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_wathgrithr_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_wathgrithr_lunar.dyn"),
    },
    base_prefab = "spear_wathgrithr" ,
    build_name_override = "custom_spear_wathgrithr_lunar" ,
    granted_items = { "custom_spear_wathgrithr_lightning_charged_lunar" , "custom_spear_wathgrithr_lightning_lunar" , },
    init_fn = function(inst) spear_wathgrithr_init_fn(inst, "custom_spear_wathgrithr_lunar") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SPEAR_WATHGRITHR", "LUNAR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_wathgrithr_northern",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_wathgrithr_northern.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_wathgrithr_northern.dyn"),
    },
    base_prefab = "spear_wathgrithr" ,
    build_name_override = "custom_spear_wathgrithr_northern" ,
    granted_items = { "custom_spear_wathgrithr_lightning_charged_northern" , "custom_spear_wathgrithr_lightning_northern" , },
    init_fn = function(inst) spear_wathgrithr_init_fn(inst, "custom_spear_wathgrithr_northern") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "SPEAR_WATHGRITHR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_wathgrithr_valkyrie",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_wathgrithr_valkyrie.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_wathgrithr_valkyrie.dyn"),
    },
    base_prefab = "spear_wathgrithr" ,
    build_name_override = "custom_spear_wathgrithr_valkyrie" ,
    granted_items = { "custom_spear_wathgrithr_lightning_charged_valkyrie" , "custom_spear_wathgrithr_lightning_valkyrie" , },
    init_fn = function(inst) spear_wathgrithr_init_fn(inst, "custom_spear_wathgrithr_valkyrie") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SPEAR_WATHGRITHR", "VALKYRIE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spear_wathgrithr_wrestle",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spear_wathgrithr_wrestle.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spear_wathgrithr_wrestle.dyn"),
    },
    base_prefab = "spear_wathgrithr" ,
    build_name_override = "custom_spear_wathgrithr_wrestle" ,
    granted_items = { "custom_spear_wathgrithr_lightning_charged_wrestle" , "custom_spear_wathgrithr_lightning_wrestle" , },
    init_fn = function(inst) spear_wathgrithr_init_fn(inst, "custom_spear_wathgrithr_wrestle") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SPEAR_WATHGRITHR", "YOTP", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spicepack_porcelain",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spicepack_porcelain.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spicepack_porcelain.dyn"),
    },
    base_prefab = "spicepack" ,
    build_name_override = "custom_spicepack_porcelain" ,
    init_fn = function(inst) spicepack_init_fn(inst, "custom_spicepack_porcelain") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SPICEPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spicepack_rustic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spicepack_rustic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spicepack_rustic.dyn"),
    },
    base_prefab = "spicepack" ,
    build_name_override = "custom_spicepack_rustic" ,
    init_fn = function(inst) spicepack_init_fn(inst, "custom_spicepack_rustic") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SPICEPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spicepack_silver",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spicepack_silver.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spicepack_silver.dyn"),
    },
    base_prefab = "spicepack" ,
    build_name_override = "custom_spicepack_silver" ,
    init_fn = function(inst) spicepack_init_fn(inst, "custom_spicepack_silver") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SPICEPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_spicepack_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_spicepack_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_spicepack_survivor.dyn"),
    },
    base_prefab = "spicepack" ,
    build_name_override = "custom_spicepack_survivor" ,
    init_fn = function(inst) spicepack_init_fn(inst, "custom_spicepack_survivor") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SPICEPACK", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_stagehand_carpet",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_endtable_carpet.zip"),
        Asset("PKGREF", "anim/dynamic/custom_endtable_carpet.dyn"),
    },
    base_prefab = "stagehand" ,
    build_name_override = "custom_endtable_carpet" ,
    init_fn = function(inst) stagehand_init_fn(inst, "custom_endtable_carpet") end,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_stagehand_cawnival",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_endtable_cawnival.zip"),
        Asset("PKGREF", "anim/dynamic/custom_endtable_cawnival.dyn"),
    },
    base_prefab = "stagehand" ,
    build_name_override = "custom_endtable_cawnival" ,
    init_fn = function(inst) stagehand_init_fn(inst, "custom_endtable_cawnival") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_stagehand_dragonfly",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_endtable_dragonfly.zip"),
        Asset("PKGREF", "anim/dynamic/custom_endtable_dragonfly.dyn"),
    },
    base_prefab = "stagehand" ,
    build_name_override = "custom_endtable_dragonfly" ,
    init_fn = function(inst) stagehand_init_fn(inst, "custom_endtable_dragonfly") end,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_stagehand_vintage",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_endtable_vintage.zip"),
        Asset("PKGREF", "anim/dynamic/custom_endtable_vintage.dyn"),
    },
    base_prefab = "stagehand" ,
    build_name_override = "custom_endtable_vintage" ,
    init_fn = function(inst) stagehand_init_fn(inst, "custom_endtable_vintage") end,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_starstaff_crystal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_starstaff_crystal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_starstaff_crystal.dyn"),
    },
    base_prefab = "yellowstaff" ,
    build_name_override = "custom_starstaff_crystal" ,
    granted_items = { "custom_moonstaff_crystal" , },
    init_fn = function(inst) yellowstaff_init_fn(inst, "custom_starstaff_crystal") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "YELLOWSTAFF", "CRYSTAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_starstaff_portal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_starstaff_portal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_starstaff_portal.dyn"),
    },
    base_prefab = "yellowstaff" ,
    build_name_override = "custom_starstaff_portal" ,
    granted_items = { "custom_moonstaff_portal" , },
    init_fn = function(inst) yellowstaff_init_fn(inst, "custom_starstaff_portal") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YELLOWSTAFF", "T_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_starstaff_relic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_starstaff_relic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_starstaff_relic.dyn"),
    },
    base_prefab = "yellowstaff" ,
    build_name_override = "custom_starstaff_relic" ,
    granted_items = { "custom_moonstaff_relic" , },
    init_fn = function(inst) yellowstaff_init_fn(inst, "custom_starstaff_relic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YELLOWSTAFF", "RELIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_steeringwheel_nautical",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_steeringwheel_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_steeringwheel_nautical.dyn"),
    },
    base_prefab = "steeringwheel" ,
    build_name_override = "custom_steeringwheel_nautical" ,
    init_fn = function(inst) steeringwheel_init_fn(inst, "custom_steeringwheel_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "STEERINGWHEEL", "NAUTICAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_steeringwheel_nautical_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_steeringwheel_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_steeringwheel_nautical.dyn"),
    },
    base_prefab = "steeringwheel_item" ,
    build_name_override = "custom_steeringwheel_nautical" ,
    init_fn = function(inst) steeringwheel_item_init_fn(inst, "custom_steeringwheel_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_steeringwheel_wagstaff",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_steeringwheel_wagstaff.zip"),
        Asset("PKGREF", "anim/dynamic/custom_steeringwheel_wagstaff.dyn"),
    },
    base_prefab = "steeringwheel" ,
    build_name_override = "custom_steeringwheel_wagstaff" ,
    init_fn = function(inst) steeringwheel_init_fn(inst, "custom_steeringwheel_wagstaff") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "STEERINGWHEEL", "WAGSTAFF", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_steeringwheel_wagstaff_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_steeringwheel_wagstaff.zip"),
        Asset("PKGREF", "anim/dynamic/custom_steeringwheel_wagstaff.dyn"),
    },
    base_prefab = "steeringwheel_item" ,
    build_name_override = "custom_steeringwheel_wagstaff" ,
    init_fn = function(inst) steeringwheel_item_init_fn(inst, "custom_steeringwheel_wagstaff") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_stone_chair_victorianblack",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_stone_chair_victorianblack.zip"),
        Asset("PKGREF", "anim/dynamic/custom_stone_chair_victorianblack.dyn"),
    },
    base_prefab = "stone_chair" ,
    build_name_override = "custom_stone_chair_victorianblack" ,
    init_fn = function(inst) stone_chair_init_fn(inst, "custom_stone_chair_victorianblack") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "STONE_CHAIR", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_stone_chair_victorianbrass",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_stone_chair_victorianbrass.zip"),
        Asset("PKGREF", "anim/dynamic/custom_stone_chair_victorianbrass.dyn"),
    },
    base_prefab = "stone_chair" ,
    build_name_override = "custom_stone_chair_victorianbrass" ,
    init_fn = function(inst) stone_chair_init_fn(inst, "custom_stone_chair_victorianbrass") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "STONE_CHAIR", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_stone_chair_victorianbronze",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_stone_chair_victorianbronze.zip"),
        Asset("PKGREF", "anim/dynamic/custom_stone_chair_victorianbronze.dyn"),
    },
    base_prefab = "stone_chair" ,
    build_name_override = "custom_stone_chair_victorianbronze" ,
    init_fn = function(inst) stone_chair_init_fn(inst, "custom_stone_chair_victorianbronze") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "STONE_CHAIR", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_stonechair_stool_victorianblack",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_stonechair_stool_victorianblack.zip"),
        Asset("PKGREF", "anim/dynamic/custom_stonechair_stool_victorianblack.dyn"),
    },
    base_prefab = "stone_stool" ,
    build_name_override = "custom_stonechair_stool_victorianblack" ,
    init_fn = function(inst) stone_stool_init_fn(inst, "custom_stonechair_stool_victorianblack") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "STONE_STOOL", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_stonechair_stool_victorianbrass",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_stonechair_stool_victorianbrass.zip"),
        Asset("PKGREF", "anim/dynamic/custom_stonechair_stool_victorianbrass.dyn"),
    },
    base_prefab = "stone_stool" ,
    build_name_override = "custom_stonechair_stool_victorianbrass" ,
    init_fn = function(inst) stone_stool_init_fn(inst, "custom_stonechair_stool_victorianbrass") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "STONE_STOOL", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_stonechair_stool_victorianbronze",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_stonechair_stool_victorianbronze.zip"),
        Asset("PKGREF", "anim/dynamic/custom_stonechair_stool_victorianbronze.dyn"),
    },
    base_prefab = "stone_stool" ,
    build_name_override = "custom_stonechair_stool_victorianbronze" ,
    init_fn = function(inst) stone_stool_init_fn(inst, "custom_stonechair_stool_victorianbronze") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "STONE_STOOL", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_stonetable_round_victorianblack",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_stonetable_round_victorianblack.zip"),
        Asset("PKGREF", "anim/dynamic/custom_stonetable_round_victorianblack.dyn"),
    },
    base_prefab = "stone_table_round" ,
    build_name_override = "custom_stonetable_round_victorianblack" ,
    init_fn = function(inst) stone_table_round_init_fn(inst, "custom_stonetable_round_victorianblack") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "STONE_TABLE_ROUND", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_stonetable_round_victorianbrass",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_stonetable_round_victorianbrass.zip"),
        Asset("PKGREF", "anim/dynamic/custom_stonetable_round_victorianbrass.dyn"),
    },
    base_prefab = "stone_table_round" ,
    build_name_override = "custom_stonetable_round_victorianbrass" ,
    init_fn = function(inst) stone_table_round_init_fn(inst, "custom_stonetable_round_victorianbrass") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "STONE_TABLE_ROUND", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_stonetable_round_victorianbronze",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_stonetable_round_victorianbronze.zip"),
        Asset("PKGREF", "anim/dynamic/custom_stonetable_round_victorianbronze.dyn"),
    },
    base_prefab = "stone_table_round" ,
    build_name_override = "custom_stonetable_round_victorianbronze" ,
    init_fn = function(inst) stone_table_round_init_fn(inst, "custom_stonetable_round_victorianbronze") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "STONE_TABLE_ROUND", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_stonetable_square_victorianblack",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_stonetable_square_victorianblack.zip"),
        Asset("PKGREF", "anim/dynamic/custom_stonetable_square_victorianblack.dyn"),
    },
    base_prefab = "stone_table_square" ,
    build_name_override = "custom_stonetable_square_victorianblack" ,
    init_fn = function(inst) stone_table_square_init_fn(inst, "custom_stonetable_square_victorianblack") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "STONE_TABLE_SQUARE", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_stonetable_square_victorianbrass",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_stonetable_square_victorianbrass.zip"),
        Asset("PKGREF", "anim/dynamic/custom_stonetable_square_victorianbrass.dyn"),
    },
    base_prefab = "stone_table_square" ,
    build_name_override = "custom_stonetable_square_victorianbrass" ,
    init_fn = function(inst) stone_table_square_init_fn(inst, "custom_stonetable_square_victorianbrass") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "STONE_TABLE_SQUARE", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_stonetable_square_victorianbronze",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_stonetable_square_victorianbronze.zip"),
        Asset("PKGREF", "anim/dynamic/custom_stonetable_square_victorianbronze.dyn"),
    },
    base_prefab = "stone_table_square" ,
    build_name_override = "custom_stonetable_square_victorianbronze" ,
    init_fn = function(inst) stone_table_square_init_fn(inst, "custom_stonetable_square_victorianbronze") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "STONE_TABLE_SQUARE", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_strawhat_bonnet",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_strawhat_bonnet.zip"),
        Asset("PKGREF", "anim/dynamic/custom_strawhat_bonnet.dyn"),
    },
    base_prefab = "strawhat" ,
    build_name_override = "custom_strawhat_bonnet" ,
    granted_items = { "custom_minerhat_bonnet" , "custom_rainhat_bonnet" , },
    init_fn = function(inst) strawhat_init_fn(inst, "custom_strawhat_bonnet") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "STRAWHAT", "HANDMEDOWN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_strawhat_cowboy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_strawhat_cowboy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_strawhat_cowboy.dyn"),
    },
    base_prefab = "strawhat" ,
    build_name_override = "custom_strawhat_cowboy" ,
    granted_items = { "custom_minerhat_cowboy" , "custom_rainhat_cowboy" , },
    init_fn = function(inst) strawhat_init_fn(inst, "custom_strawhat_cowboy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "STRAWHAT", "YOTP", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_strawhat_floppy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_strawhat_floppy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_strawhat_floppy.dyn"),
    },
    base_prefab = "strawhat" ,
    build_name_override = "custom_strawhat_floppy" ,
    granted_items = { "custom_minerhat_floppy" , "custom_rainhat_floppy" , },
    init_fn = function(inst) strawhat_init_fn(inst, "custom_strawhat_floppy") end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "STRAWHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_succulent_potted_bearclaw",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_succulent_potted_bearclaw.zip"),
        Asset("PKGREF", "anim/dynamic/custom_succulent_potted_bearclaw.dyn"),
    },
    base_prefab = "succulent_potted" ,
    build_name_override = "custom_succulent_potted_bearclaw" ,
    init_fn = function(inst) succulent_potted_init_fn(inst, "custom_succulent_potted_bearclaw") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "SUCCULENT_POTTED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_supertacklecontainer_shell",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_supertacklecontainer_shell.zip"),
        Asset("PKGREF", "anim/dynamic/custom_supertacklecontainer_shell.dyn"),
    },
    base_prefab = "supertacklecontainer" ,
    build_name_override = "custom_supertacklecontainer_shell" ,
    init_fn = function(inst) supertacklecontainer_init_fn(inst, "custom_supertacklecontainer_shell") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SEASIDE", "SUPERTACKLECONTAINER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tacklecontainer_shell",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tacklecontainer_shell.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tacklecontainer_shell.dyn"),
    },
    base_prefab = "tacklecontainer" ,
    build_name_override = "custom_tacklecontainer_shell" ,
    init_fn = function(inst) tacklecontainer_init_fn(inst, "custom_tacklecontainer_shell") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SEASIDE", "TACKLECONTAINER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_telebase_crystal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_telebase_crystal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_telebase_crystal.dyn"),
    },
    base_prefab = "telebase" ,
    build_name_override = "custom_telebase_crystal" ,
    init_fn = function(inst) telebase_init_fn(inst, "custom_telebase_crystal") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "TELEBASE", "CRYSTAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_telebase_hallowpylon",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_telebase_hallowpylon.zip"),
        Asset("PKGREF", "anim/dynamic/custom_telebase_hallowpylon.dyn"),
    },
    base_prefab = "telebase" ,
    build_name_override = "custom_telebase_hallowpylon" ,
    init_fn = function(inst) telebase_init_fn(inst, "custom_telebase_hallowpylon") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "TELEBASE", "T_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_telestaff_crystal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_telestaff_crystal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_telestaff_crystal.dyn"),
    },
    base_prefab = "telestaff" ,
    build_name_override = "custom_telestaff_crystal" ,
    init_fn = function(inst) telestaff_init_fn(inst, "custom_telestaff_crystal") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "TELESTAFF", "CRYSTAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_telestaff_shadowbeam",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_telestaff_shadowbeam.zip"),
        Asset("PKGREF", "anim/dynamic/custom_telestaff_shadowbeam.dyn"),
    },
    base_prefab = "telestaff" ,
    build_name_override = "custom_telestaff_shadowbeam" ,
    init_fn = function(inst) telestaff_init_fn(inst, "custom_telestaff_shadowbeam") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_sound = { ["cast"] = "terraria1/skins/shadowbeamstaff", },
    skin_tags = { "TELESTAFF", "T_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tent_an",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tent_an.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tent_an.dyn"),
    },
    base_prefab = "tent" ,
    build_name_override = "custom_tent_an" ,
    init_fn = function(inst) tent_init_fn(inst, "custom_tent_an") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "TENT", "ARTNOUVEAU", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tent_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tent_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tent_ancient.dyn"),
    },
    base_prefab = "tent" ,
    build_name_override = "custom_tent_ancient" ,
    init_fn = function(inst) tent_init_fn(inst, "custom_tent_ancient") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "TENT", "ANCIENT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tent_beach",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tent_beach.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tent_beach.dyn"),
    },
    base_prefab = "tent" ,
    build_name_override = "custom_tent_beach" ,
    init_fn = function(inst) tent_init_fn(inst, "custom_tent_beach") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "TENT", "SEASIDE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tent_circus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tent_circus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tent_circus.dyn"),
    },
    base_prefab = "tent" ,
    build_name_override = "custom_tent_circus" ,
    init_fn = function(inst) tent_init_fn(inst, "custom_tent_circus") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "TENT", "CIRCUS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tent_kid",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tent_kid.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tent_kid.dyn"),
    },
    base_prefab = "tent" ,
    build_name_override = "custom_tent_kid" ,
    init_fn = function(inst) tent_init_fn(inst, "custom_tent_kid") end,
    rarity = "ProofOfPurchase",
    release_group = groupid,
    skin_tags = { "TENT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tent_leaf",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tent_leaf.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tent_leaf.dyn"),
    },
    base_prefab = "tent" ,
    build_name_override = "custom_tent_leaf" ,
    init_fn = function(inst) tent_init_fn(inst, "custom_tent_leaf") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "TENT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tophat_chef",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tophat_chef.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tophat_chef.dyn"),
    },
    base_prefab = "tophat" ,
    build_name_override = "custom_tophat_chef" ,
    granted_items = { "custom_researchlab4_chef" , },
    init_fn = function(inst) tophat_init_fn(inst, "custom_tophat_chef") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CHEF", "TOPHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tophat_circus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tophat_circus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tophat_circus.dyn"),
    },
    base_prefab = "tophat" ,
    build_name_override = "custom_tophat_circus" ,
    granted_items = { "custom_researchlab4_tophat_circus" , },
    init_fn = function(inst) tophat_init_fn(inst, "custom_tophat_circus") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "TOPHAT", "CIRCUS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tophat_derby",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tophat_derby.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tophat_derby.dyn"),
    },
    base_prefab = "tophat" ,
    build_name_override = "custom_tophat_derby" ,
    granted_items = { "custom_researchlab4_derby" , },
    init_fn = function(inst) tophat_init_fn(inst, "custom_tophat_derby") end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "TOPHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tophat_festive_bell_red_firehound",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tophat_festive_bell_red_firehound.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tophat_festive_bell_red_firehound.dyn"),
    },
    base_prefab = "tophat" ,
    build_name_override = "custom_tophat_festive_bell_red_firehound" ,
    granted_items = { "custom_researchlab4_festive_bell_red_firehound" , },
    init_fn = function(inst) tophat_init_fn(inst, "custom_tophat_festive_bell_red_firehound") end,
    rarity = "Event",
    release_group = groupid,
    skin_tags = { "TOPHAT", "WINTER", "CRAFTABLE", "RED", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tophat_fish",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tophat_fish.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tophat_fish.dyn"),
    },
    base_prefab = "tophat" ,
    build_name_override = "custom_tophat_fish" ,
    granted_items = { "custom_researchlab4_fish" , },
    init_fn = function(inst) tophat_init_fn(inst, "custom_tophat_fish") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "FOOLS", "TOPHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tophat_harlequin",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tophat_harlequin.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tophat_harlequin.dyn"),
    },
    base_prefab = "tophat" ,
    build_name_override = "custom_tophat_harlequin" ,
    granted_items = { "custom_researchlab4_tophat_harlequin" , },
    init_fn = function(inst) tophat_init_fn(inst, "custom_tophat_harlequin") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FOOLS", "TOPHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tophat_merchant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tophat_merchant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tophat_merchant.dyn"),
    },
    base_prefab = "tophat" ,
    build_name_override = "custom_tophat_merchant" ,
    granted_items = { "custom_researchlab4_merchant" , },
    init_fn = function(inst) tophat_init_fn(inst, "custom_tophat_merchant") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "TOPHAT", "T_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tophat_spiked",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tophat_spiked.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tophat_spiked.dyn"),
    },
    base_prefab = "tophat" ,
    build_name_override = "custom_tophat_spiked" ,
    granted_items = { "custom_researchlab4_tophat_spiked" , },
    init_fn = function(inst) tophat_init_fn(inst, "custom_tophat_spiked") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "TOPHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tophat_witch_pyre",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tophat_witch_pyre.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tophat_witch_pyre.dyn"),
    },
    base_prefab = "tophat" ,
    build_name_override = "custom_tophat_witch_pyre" ,
    granted_items = { "custom_researchlab4_witch_pyre" , },
    init_fn = function(inst) tophat_init_fn(inst, "custom_tophat_witch_pyre") end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "TOPHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tophat_wizard",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tophat_wizard.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tophat_wizard.dyn"),
    },
    base_prefab = "tophat" ,
    build_name_override = "custom_tophat_wizard" ,
    granted_items = { "custom_researchlab4_tophat_wizard" , },
    init_fn = function(inst) tophat_init_fn(inst, "custom_tophat_wizard") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WIZARD", "TOPHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_torch_barber",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_torch_barber.zip"),
        Asset("PKGREF", "anim/dynamic/custom_torch_barber.dyn"),
    },
    base_prefab = "torch" ,
    build_name_override = "custom_torch_barber" ,
    fx_prefab = { "torchfire_barber", },
    init_fn = function(inst) torch_init_fn(inst, "custom_torch_barber") end,
    prefabs = { "torchfire_barber", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BARBER", "TORCH", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_torch_carrat",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_torch_carrat.zip"),
        Asset("PKGREF", "anim/dynamic/custom_torch_carrat.dyn"),
    },
    base_prefab = "torch" ,
    build_name_override = "custom_torch_carrat" ,
    fx_prefab = { "torchfire_carrat", },
    init_fn = function(inst) torch_init_fn(inst, "custom_torch_carrat") end,
    prefabs = { "torchfire_carrat", },
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "YOTC", "TORCH", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_torch_nautical",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_torch_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_torch_nautical.dyn"),
    },
    base_prefab = "torch" ,
    build_name_override = "custom_torch_nautical" ,
    fx_prefab = { "torchfire_nautical", },
    init_fn = function(inst) torch_init_fn(inst, "custom_torch_nautical") end,
    prefabs = { "torchfire_nautical", },
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "TORCH", "NAUTICAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_torch_pillar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_torch_pillar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_torch_pillar.dyn"),
    },
    base_prefab = "torch" ,
    build_name_override = "custom_torch_pillar" ,
    fx_prefab = { "torchfire_pillar", },
    init_fn = function(inst) torch_init_fn(inst, "custom_torch_pillar") end,
    prefabs = { "torchfire_pillar", },
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "TORCH", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_torch_pronged",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_torch_pronged.zip"),
        Asset("PKGREF", "anim/dynamic/custom_torch_pronged.dyn"),
    },
    base_prefab = "torch" ,
    build_name_override = "custom_torch_pronged" ,
    fx_prefab = { "torchfire_pronged", },
    init_fn = function(inst) torch_init_fn(inst, "custom_torch_pronged") end,
    prefabs = { "torchfire_pronged", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "TORCH", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_torch_rag",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_torch_rag.zip"),
        Asset("PKGREF", "anim/dynamic/custom_torch_rag.dyn"),
    },
    base_prefab = "torch" ,
    build_name_override = "custom_torch_rag" ,
    fx_prefab = { "torchfire_rag", },
    init_fn = function(inst) torch_init_fn(inst, "custom_torch_rag") end,
    marketable = true,
    prefabs = { "torchfire_rag", },
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "TORCH", "SURVIVOR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_torch_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_torch_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_torch_shadow.dyn"),
    },
    base_prefab = "torch" ,
    build_name_override = "custom_torch_shadow" ,
    fx_prefab = { "torchfire_shadow", },
    init_fn = function(inst) torch_init_fn(inst, "custom_torch_shadow") end,
    prefabs = { "torchfire_shadow", },
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "TORCH", "SHADOW", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_torch_spooky",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_torch_spooky.zip"),
        Asset("PKGREF", "anim/dynamic/custom_torch_spooky.dyn"),
    },
    base_prefab = "torch" ,
    build_name_override = "custom_torch_spooky" ,
    fx_prefab = { "torchfire_spooky", },
    init_fn = function(inst) torch_init_fn(inst, "custom_torch_spooky") end,
    marketable = true,
    prefabs = { "torchfire_spooky", },
    rarity = "HeirloomElegant",
    release_group = groupid,
    skin_tags = { "TORCH", "COSTUME", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tornado_crow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tornado_crow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tornado_crow.dyn"),
    },
    base_prefab = "tornado" ,
    build_name_override = "custom_tornado_crow" ,
    init_fn = function(inst) tornado_init_fn(inst, "custom_tornado_crow") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_tornado_stick_crow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_tornado_stick_crow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_tornado_stick_crow.dyn"),
    },
    base_prefab = "staff_tornado" ,
    build_name_override = "custom_tornado_stick_crow" ,
    granted_items = { "custom_tornado_crow" , },
    init_fn = function(inst) staff_tornado_init_fn(inst, "custom_tornado_stick_crow") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "STAFF_TORNADO", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_townportal_relic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_townportal_relic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_townportal_relic.dyn"),
    },
    base_prefab = "townportal" ,
    build_name_override = "custom_townportal_relic" ,
    init_fn = function(inst) townportal_init_fn(inst, "custom_townportal_relic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "TOWNPORTAL", "RELIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_trap_basket",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_trap_basket.zip"),
        Asset("PKGREF", "anim/dynamic/custom_trap_basket.dyn"),
    },
    base_prefab = "trap" ,
    build_name_override = "custom_trap_basket" ,
    init_fn = function(inst) trap_init_fn(inst, "custom_trap_basket") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YOTC", "TRAP", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_trap_metal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_trap_metal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_trap_metal.dyn"),
    },
    base_prefab = "trap" ,
    build_name_override = "custom_trap_metal" ,
    init_fn = function(inst) trap_init_fn(inst, "custom_trap_metal") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "TRAP", "YOTP", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_trap_teeth_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_trap_teeth_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_trap_teeth_rose.dyn"),
    },
    base_prefab = "trap_teeth" ,
    build_name_override = "custom_trap_teeth_rose" ,
    init_fn = function(inst) trap_teeth_init_fn(inst, "custom_trap_teeth_rose") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "TRAP_TEETH", "ROSE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_trap_teeth_tiger",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_trap_teeth_tiger.zip"),
        Asset("PKGREF", "anim/dynamic/custom_trap_teeth_tiger.dyn"),
    },
    base_prefab = "trap_teeth" ,
    build_name_override = "custom_trap_teeth_tiger" ,
    init_fn = function(inst) trap_teeth_init_fn(inst, "custom_trap_teeth_tiger") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "TRAP_TEETH", "YOTP", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_ancient.dyn"),
    },
    base_prefab = "treasurechest" ,
    build_name_override = "custom_treasurechest_ancient" ,
    granted_items = { "custom_treasurechest_upgraded_ancient" , },
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_ancient") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CHEST", "CRAFTABLE", "ANCIENT", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_cake",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_cake.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_cake.dyn"),
    },
    base_prefab = "treasurechest" ,
    build_name_override = "custom_treasurechest_cake" ,
    granted_items = { "custom_treasurechest_upgraded_cake" , },
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_cake") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "CHEST", "TENYEARS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_carpetbag",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_carpetbag.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_carpetbag.dyn"),
    },
    base_prefab = "treasurechest" ,
    build_name_override = "custom_treasurechest_carpetbag" ,
    granted_items = { "custom_treasurechest_upgraded_carpetbag" , },
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_carpetbag") end,
    marketable = true,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { "CHEST", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_corruption",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_corruption.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_corruption.dyn"),
    },
    base_prefab = "treasurechest" ,
    build_name_override = "custom_treasurechest_corruption" ,
    granted_items = { "custom_treasurechest_upgraded_corruption" , },
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_corruption") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CHEST", "CRAFTABLE", "T_UPDATE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_cotl_basic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_cotl_basic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_cotl_basic.dyn"),
    },
    base_prefab = "treasurechest" ,
    build_name_override = "custom_treasurechest_cotl_basic" ,
    granted_items = { "custom_treasurechest_upgraded_cotl_basic" , },
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_cotl_basic") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CHEST", "CRAFTABLE", "C_UPDATE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_cotl_fancy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_cotl_fancy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_cotl_fancy.dyn"),
    },
    base_prefab = "treasurechest" ,
    build_name_override = "custom_treasurechest_cotl_fancy" ,
    granted_items = { "custom_treasurechest_upgraded_cotl_fancy" , },
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_cotl_fancy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CHEST", "C_UPDATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_crimson",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_crimson.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_crimson.dyn"),
    },
    base_prefab = "treasurechest" ,
    build_name_override = "custom_treasurechest_crimson" ,
    granted_items = { "custom_treasurechest_upgraded_crimson" , },
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_crimson") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CHEST", "CRAFTABLE", "T_UPDATE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_cupid",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_cupid.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_cupid.dyn"),
    },
    base_prefab = "treasurechest" ,
    build_name_override = "custom_treasurechest_cupid" ,
    granted_items = { "custom_treasurechest_upgraded_cupid" , },
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_cupid") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "CHEST", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_gingerbread",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_gingerbread.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_gingerbread.dyn"),
    },
    base_prefab = "treasurechest" ,
    build_name_override = "custom_treasurechest_gingerbread" ,
    granted_items = { "custom_treasurechest_upgraded_gingerbread" , },
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_gingerbread") end,
    rarity = "Event",
    release_group = groupid,
    skin_tags = { "CHEST", "WINTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_monster",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_monster.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_monster.dyn"),
    },
    base_prefab = "treasurechest" ,
    build_name_override = "custom_treasurechest_monster" ,
    granted_items = { "custom_treasurechest_upgraded_monster" , },
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_monster") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CHEST", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_posh",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_posh.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_posh.dyn"),
    },
    base_prefab = "treasurechest" ,
    build_name_override = "custom_treasurechest_posh" ,
    granted_items = { "custom_treasurechest_upgraded_posh" , },
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_posh") end,
    marketable = true,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { "CHEST", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_poshprint",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_poshprint.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_poshprint.dyn"),
    },
    base_prefab = "treasurechest" ,
    build_name_override = "custom_treasurechest_poshprint" ,
    granted_items = { "custom_treasurechest_upgraded_poshprint" , },
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_poshprint") end,
    rarity = "ProofOfPurchase",
    release_group = groupid,
    skin_tags = { "CHEST", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_sacred",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_sacred.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_sacred.dyn"),
    },
    base_prefab = "treasurechest" ,
    build_name_override = "custom_treasurechest_sacred" ,
    granted_items = { "custom_treasurechest_upgraded_sacred" , },
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_sacred") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "CHEST", "ANCIENT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_steamertrunk",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_steamertrunk.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_steamertrunk.dyn"),
    },
    base_prefab = "treasurechest" ,
    build_name_override = "custom_treasurechest_steamertrunk" ,
    granted_items = { "custom_treasurechest_upgraded_steamertrunk" , },
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_steamertrunk") end,
    marketable = true,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { "CHEST", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_traincase",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_traincase.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_traincase.dyn"),
    },
    base_prefab = "treasurechest" ,
    build_name_override = "custom_treasurechest_traincase" ,
    granted_items = { "custom_treasurechest_upgraded_traincase" , },
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_traincase") end,
    marketable = true,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { "CHEST", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_traveltrunk",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_traveltrunk.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_traveltrunk.dyn"),
    },
    base_prefab = "treasurechest" ,
    build_name_override = "custom_treasurechest_traveltrunk" ,
    granted_items = { "custom_treasurechest_upgraded_traveltrunk" , },
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_traveltrunk") end,
    marketable = true,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { "CHEST", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_upgraded_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_upgraded_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_upgraded_ancient.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_fx" ,
    build_name_override = "custom_treasurechest_upgraded_ancient" ,
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_upgraded_ancient") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_upgraded_cake",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_upgraded_cake.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_upgraded_cake.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_fx" ,
    build_name_override = "custom_treasurechest_upgraded_cake" ,
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_upgraded_cake") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_upgraded_carpetbag",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_upgraded_carpetbag.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_upgraded_carpetbag.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_fx" ,
    build_name_override = "custom_treasurechest_upgraded_carpetbag" ,
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_upgraded_carpetbag") end,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_upgraded_corruption",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_upgraded_corruption.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_upgraded_corruption.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_fx" ,
    build_name_override = "custom_treasurechest_upgraded_corruption" ,
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_upgraded_corruption") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_upgraded_cotl_basic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_upgraded_cotl_basic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_upgraded_cotl_basic.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_fx" ,
    build_name_override = "custom_treasurechest_upgraded_cotl_basic" ,
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_upgraded_cotl_basic") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_upgraded_cotl_fancy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_upgraded_cotl_fancy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_upgraded_cotl_fancy.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_fx" ,
    build_name_override = "custom_treasurechest_upgraded_cotl_fancy" ,
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_upgraded_cotl_fancy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_upgraded_crimson",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_upgraded_crimson.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_upgraded_crimson.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_fx" ,
    build_name_override = "custom_treasurechest_upgraded_crimson" ,
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_upgraded_crimson") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_upgraded_cupid",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_upgraded_cupid.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_upgraded_cupid.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_fx" ,
    build_name_override = "custom_treasurechest_upgraded_cupid" ,
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_upgraded_cupid") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_upgraded_gingerbread",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_upgraded_gingerbread.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_upgraded_gingerbread.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_fx" ,
    build_name_override = "custom_treasurechest_upgraded_gingerbread" ,
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_upgraded_gingerbread") end,
    rarity = "Event",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_upgraded_monster",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_upgraded_monster.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_upgraded_monster.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_fx" ,
    build_name_override = "custom_treasurechest_upgraded_monster" ,
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_upgraded_monster") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_upgraded_posh",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_upgraded_posh.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_upgraded_posh.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_fx" ,
    build_name_override = "custom_treasurechest_upgraded_posh" ,
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_upgraded_posh") end,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_upgraded_poshprint",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_upgraded_poshprint.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_upgraded_poshprint.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_fx" ,
    build_name_override = "custom_treasurechest_upgraded_poshprint" ,
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_upgraded_poshprint") end,
    rarity = "ProofOfPurchase",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_upgraded_sacred",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_upgraded_sacred.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_upgraded_sacred.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_fx" ,
    build_name_override = "custom_treasurechest_upgraded_sacred" ,
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_upgraded_sacred") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_upgraded_steamertrunk",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_upgraded_steamertrunk.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_upgraded_steamertrunk.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_fx" ,
    build_name_override = "custom_treasurechest_upgraded_steamertrunk" ,
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_upgraded_steamertrunk") end,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_upgraded_traincase",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_upgraded_traincase.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_upgraded_traincase.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_fx" ,
    build_name_override = "custom_treasurechest_upgraded_traincase" ,
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_upgraded_traincase") end,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_upgraded_traveltrunk",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_upgraded_traveltrunk.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_upgraded_traveltrunk.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_fx" ,
    build_name_override = "custom_treasurechest_upgraded_traveltrunk" ,
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_upgraded_traveltrunk") end,
    rarity = "Distinguished",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_upgraded_vintage",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_upgraded_vintage.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_upgraded_vintage.dyn"),
    },
    base_prefab = "chestupgrade_stacksize_fx" ,
    build_name_override = "custom_treasurechest_upgraded_vintage" ,
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_upgraded_vintage") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_treasurechest_vintage",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_treasurechest_vintage.zip"),
        Asset("PKGREF", "anim/dynamic/custom_treasurechest_vintage.dyn"),
    },
    base_prefab = "treasurechest" ,
    build_name_override = "custom_treasurechest_vintage" ,
    granted_items = { "custom_treasurechest_upgraded_vintage" , },
    init_fn = function(inst) treasurechest_init_fn(inst, "custom_treasurechest_vintage") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "COTTAGE", "CHEST", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_trident_merm",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_trident_merm.zip"),
        Asset("PKGREF", "anim/dynamic/custom_trident_merm.dyn"),
    },
    base_prefab = "trident" ,
    build_name_override = "custom_trident_merm" ,
    init_fn = function(inst) trident_init_fn(inst, "custom_trident_merm") end,
    rarity = "ProofOfPurchase",
    release_group = groupid,
    skin_tags = { "TRIDENT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_trophyscale_fish_handmade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_trophyscale_fish_handmade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_trophyscale_fish_handmade.dyn"),
    },
    base_prefab = "trophyscale_fish" ,
    build_name_override = "custom_trophyscale_fish_handmade" ,
    init_fn = function(inst) trophyscale_fish_init_fn(inst, "custom_trophyscale_fish_handmade") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BUILDERS", "TROPHYSCALE_FISH", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_trophyscale_oversizedveggies_plant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_trophyscale_oversizedveggies_plant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_trophyscale_oversizedveggies_plant.dyn"),
    },
    base_prefab = "trophyscale_oversizedveggies" ,
    build_name_override = "custom_trophyscale_oversizedveggies_plant" ,
    init_fn = function(inst) trophyscale_oversizedveggies_init_fn(inst, "custom_trophyscale_oversizedveggies_plant") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BUILDERS", "TROPHYSCALE_OVERSIZEDVEGGIES", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_umbrella_circus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_umbrella_circus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_umbrella_circus.dyn"),
    },
    base_prefab = "umbrella" ,
    build_name_override = "custom_umbrella_circus" ,
    init_fn = function(inst) umbrella_init_fn(inst, "custom_umbrella_circus") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "UMBRELLA", "CIRCUS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_umbrella_heart",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_umbrella_heart.zip"),
        Asset("PKGREF", "anim/dynamic/custom_umbrella_heart.dyn"),
    },
    base_prefab = "umbrella" ,
    build_name_override = "custom_umbrella_heart" ,
    init_fn = function(inst) umbrella_init_fn(inst, "custom_umbrella_heart") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "UMBRELLA", "YOTP", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_umbrella_parasol",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_umbrella_parasol.zip"),
        Asset("PKGREF", "anim/dynamic/custom_umbrella_parasol.dyn"),
    },
    base_prefab = "umbrella" ,
    build_name_override = "custom_umbrella_parasol" ,
    init_fn = function(inst) umbrella_init_fn(inst, "custom_umbrella_parasol") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "UMBRELLA", "HAUNTEDDOLL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_umbrella_spider",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_umbrella_spider.zip"),
        Asset("PKGREF", "anim/dynamic/custom_umbrella_spider.dyn"),
    },
    base_prefab = "umbrella" ,
    build_name_override = "custom_umbrella_spider" ,
    init_fn = function(inst) umbrella_init_fn(inst, "custom_umbrella_spider") end,
    marketable = true,
    rarity = "Elegant",
    release_group = groupid,
    skin_tags = { "UMBRELLA", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walkingplank_grass_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_boat_grass_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_boat_grass_pirate.dyn"),
    },
    base_prefab = "walkingplank_grass" ,
    build_name_override = "custom_boat_grass_pirate" ,
    init_fn = function(inst) walkingplank_grass_init_fn(inst, "custom_boat_grass_pirate") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WALKINGPLANK_GRASS", "PIRATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walkingplank_nautical",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_boat_nautical.zip"),
        Asset("PKGREF", "anim/dynamic/custom_boat_nautical.dyn"),
    },
    base_prefab = "walkingplank" ,
    build_name_override = "custom_boat_nautical" ,
    init_fn = function(inst) walkingplank_init_fn(inst, "custom_boat_nautical") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "WALKINGPLANK", "NAUTICAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walkingplank_pirate_skin",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_boat_pirate_skin.zip"),
        Asset("PKGREF", "anim/dynamic/custom_boat_pirate_skin.dyn"),
    },
    base_prefab = "walkingplank" ,
    build_name_override = "custom_boat_pirate_skin" ,
    init_fn = function(inst) walkingplank_init_fn(inst, "custom_boat_pirate_skin") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WALKINGPLANK", "PIRATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walkingplank_wagstaff",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_boat_wagstaff.zip"),
        Asset("PKGREF", "anim/dynamic/custom_boat_wagstaff.dyn"),
    },
    base_prefab = "walkingplank" ,
    build_name_override = "custom_boat_wagstaff" ,
    init_fn = function(inst) walkingplank_init_fn(inst, "custom_boat_wagstaff") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WALKINGPLANK", "WAGSTAFF", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_dreadstone_relic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_dreadstone_relic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_dreadstone_relic.dyn"),
    },
    base_prefab = "wall_dreadstone" ,
    build_name_override = "custom_wall_dreadstone_relic" ,
    init_fn = function(inst) wall_dreadstone_init_fn(inst, "custom_wall_dreadstone_relic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WALL_STONE", "RELIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_dreadstone_relicitem",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_dreadstone_relic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_dreadstone_relic.dyn"),
    },
    base_prefab = "wall_dreadstone_item" ,
    build_name_override = "custom_wall_dreadstone_relic" ,
    init_fn = function(inst) wall_dreadstone_item_init_fn(inst, "custom_wall_dreadstone_relic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_hay_corn",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_hay_corn.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_hay_corn.dyn"),
    },
    base_prefab = "wall_hay" ,
    build_name_override = "custom_wall_hay_corn" ,
    init_fn = function(inst) wall_hay_init_fn(inst, "custom_wall_hay_corn") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "WALL_HAY", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_hay_cornitem",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_hay_corn.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_hay_corn.dyn"),
    },
    base_prefab = "wall_hay_item" ,
    build_name_override = "custom_wall_hay_corn" ,
    init_fn = function(inst) wall_hay_item_init_fn(inst, "custom_wall_hay_corn") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_moonrock_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_moonrock_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_moonrock_victorian.dyn"),
    },
    base_prefab = "wall_moonrock" ,
    build_name_override = "custom_wall_moonrock_victorian" ,
    init_fn = function(inst) wall_moonrock_init_fn(inst, "custom_wall_moonrock_victorian") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WALL_MOONROCK", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_moonrock_victorianitem",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_moonrock_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_moonrock_victorian.dyn"),
    },
    base_prefab = "wall_moonrock_item" ,
    build_name_override = "custom_wall_moonrock_victorian" ,
    init_fn = function(inst) wall_moonrock_item_init_fn(inst, "custom_wall_moonrock_victorian") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_ruins_thulecite",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_ruins_thulecite.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_ruins_thulecite.dyn"),
    },
    base_prefab = "wall_ruins" ,
    build_name_override = "custom_wall_ruins_thulecite" ,
    init_fn = function(inst) wall_ruins_init_fn(inst, "custom_wall_ruins_thulecite") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "WALL_RUINS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_ruins_thuleciteitem",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_ruins_thulecite.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_ruins_thulecite.dyn"),
    },
    base_prefab = "wall_ruins_item" ,
    build_name_override = "custom_wall_ruins_thulecite" ,
    init_fn = function(inst) wall_ruins_item_init_fn(inst, "custom_wall_ruins_thulecite") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_ruins_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_ruins_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_ruins_victorian.dyn"),
    },
    base_prefab = "wall_ruins" ,
    build_name_override = "custom_wall_ruins_victorian" ,
    init_fn = function(inst) wall_ruins_init_fn(inst, "custom_wall_ruins_victorian") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WALL_RUINS", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_ruins_victorianitem",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_ruins_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_ruins_victorian.dyn"),
    },
    base_prefab = "wall_ruins_item" ,
    build_name_override = "custom_wall_ruins_victorian" ,
    init_fn = function(inst) wall_ruins_item_init_fn(inst, "custom_wall_ruins_victorian") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_stone_an",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_stone_an.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_stone_an.dyn"),
    },
    base_prefab = "wall_stone" ,
    build_name_override = "custom_wall_stone_an" ,
    init_fn = function(inst) wall_stone_init_fn(inst, "custom_wall_stone_an") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WALL_STONE", "ARTNOUVEAU", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_stone_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_stone_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_stone_ancient.dyn"),
    },
    base_prefab = "wall_stone" ,
    build_name_override = "custom_wall_stone_ancient" ,
    init_fn = function(inst) wall_stone_init_fn(inst, "custom_wall_stone_ancient") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "WALL_STONE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_stone_ancientitem",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_stone_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_stone_ancient.dyn"),
    },
    base_prefab = "wall_stone_item" ,
    build_name_override = "custom_wall_stone_ancient" ,
    init_fn = function(inst) wall_stone_item_init_fn(inst, "custom_wall_stone_ancient") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_stone_anitem",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_stone_an.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_stone_an.dyn"),
    },
    base_prefab = "wall_stone_item" ,
    build_name_override = "custom_wall_stone_an" ,
    init_fn = function(inst) wall_stone_item_init_fn(inst, "custom_wall_stone_an") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_stone_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_stone_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_stone_gothic.dyn"),
    },
    base_prefab = "wall_stone" ,
    build_name_override = "custom_wall_stone_gothic" ,
    init_fn = function(inst) wall_stone_init_fn(inst, "custom_wall_stone_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WALL_STONE", "GOTHIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_stone_gothicitem",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_stone_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_stone_gothic.dyn"),
    },
    base_prefab = "wall_stone_item" ,
    build_name_override = "custom_wall_stone_gothic" ,
    init_fn = function(inst) wall_stone_item_init_fn(inst, "custom_wall_stone_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_stone_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_stone_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_stone_victorian.dyn"),
    },
    base_prefab = "wall_stone" ,
    build_name_override = "custom_wall_stone_victorian" ,
    init_fn = function(inst) wall_stone_init_fn(inst, "custom_wall_stone_victorian") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WALL_STONE", "VICTORIAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_stone_victorianitem",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_stone_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_stone_victorian.dyn"),
    },
    base_prefab = "wall_stone_item" ,
    build_name_override = "custom_wall_stone_victorian" ,
    init_fn = function(inst) wall_stone_item_init_fn(inst, "custom_wall_stone_victorian") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_wood_ornate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_wood_ornate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_wood_ornate.dyn"),
    },
    base_prefab = "wall_wood" ,
    build_name_override = "custom_wall_wood_ornate" ,
    init_fn = function(inst) wall_wood_init_fn(inst, "custom_wall_wood_ornate") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WALL_WOOD", "ORNATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wall_wood_ornateitem",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wall_wood_ornate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wall_wood_ornate.dyn"),
    },
    base_prefab = "wall_wood_item" ,
    build_name_override = "custom_wall_wood_ornate" ,
    init_fn = function(inst) wall_wood_item_init_fn(inst, "custom_wall_wood_ornate") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walrushat_blue",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walrushat_blue.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walrushat_blue.dyn"),
    },
    base_prefab = "walrushat" ,
    build_name_override = "custom_walrushat_blue" ,
    init_fn = function(inst) walrushat_init_fn(inst, "custom_walrushat_blue") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WALRUSHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walrushat_cawnival",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walrushat_cawnival.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walrushat_cawnival.dyn"),
    },
    base_prefab = "walrushat" ,
    build_name_override = "custom_walrushat_cawnival" ,
    init_fn = function(inst) walrushat_init_fn(inst, "custom_walrushat_cawnival") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "CAWNIVAL", "WALRUSHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walter_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walter_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walter_ancient.dyn"),
    },
    base_prefab = "walter" ,
    build_name_override = "custom_walter_ancient" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "walter_ancient",
    skin_tags = { "ANCIENT", "BASE", "WALTER", },
    skins = { ghost_skin = "ghost_walter" , normal_skin = "custom_walter_ancient" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_walter_bee",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walter_bee.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walter_bee.dyn"),
    },
    base_prefab = "walter" ,
    build_name_override = "custom_walter_bee" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "walter_bee",
    skin_tags = { "COSTUME", "BASE", "WALTER", },
    skins = { ghost_skin = "ghost_walter" , normal_skin = "custom_walter_bee" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_walter_detective",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walter_detective.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walter_detective.dyn"),
    },
    base_prefab = "walter" ,
    build_name_override = "custom_walter_detective" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "walter_detective",
    skin_tags = { "DETECTIVE", "BASE", "WALTER", },
    skins = { ghost_skin = "ghost_walter" , normal_skin = "custom_walter_detective" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_walter_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walter_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walter_formal.dyn"),
    },
    base_prefab = "walter" ,
    build_name_override = "custom_walter_formal" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "walter_formal",
    skin_tags = { "FORMAL", "BASE", "WALTER", },
    skins = { ghost_skin = "ghost_walter" , normal_skin = "custom_walter_formal" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_walter_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walter_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walter_ice.dyn"),
    },
    base_prefab = "walter" ,
    build_name_override = "custom_walter_ice" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "walter_ice",
    skin_tags = { "ICE", "BASE", "WALTER", },
    skins = { ghost_skin = "ghost_walter" , normal_skin = "custom_walter_ice" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_walter_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walter_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walter_lunar.dyn"),
    },
    base_prefab = "walter" ,
    build_name_override = "custom_walter_lunar" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "walter_lunar",
    skin_tags = { "LUNAR", "BASE", "WALTER", },
    skins = { ghost_skin = "ghost_walter" , normal_skin = "custom_walter_lunar" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_walter_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walter_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walter_nature.dyn"),
    },
    base_prefab = "walter" ,
    build_name_override = "custom_walter_nature" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "walter_nature",
    skin_tags = { "VARG", "BASE", "WALTER", },
    skins = { ghost_skin = "ghost_walter" , normal_skin = "custom_walter_nature" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_walter_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walter_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walter_rose.dyn"),
    },
    base_prefab = "walter" ,
    build_name_override = "custom_walter_rose" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "walter_rose",
    skin_tags = { "ROSE", "BASE", "WALTER", },
    skins = { ghost_skin = "ghost_walter" , normal_skin = "custom_walter_rose" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_walter_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walter_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walter_shadow.dyn"),
    },
    base_prefab = "walter" ,
    build_name_override = "custom_walter_shadow" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "walter_shadow",
    skin_tags = { "SHADOW", "BASE", "WALTER", },
    skins = { ghost_skin = "ghost_walter" , normal_skin = "custom_walter_shadow" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_walter_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walter_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walter_survivor.dyn"),
    },
    base_prefab = "walter" ,
    build_name_override = "custom_walter_survivor" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "walter_survivor",
    skin_tags = { "SURVIVOR", "BASE", "WALTER", },
    skins = { ghost_skin = "ghost_walter" , normal_skin = "custom_walter_survivor" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_walter_ventriloquist",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walter_ventriloquist.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walter_ventriloquist.dyn"),
    },
    base_prefab = "walter" ,
    build_name_override = "custom_walter_ventriloquist" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "walter_ventriloquist",
    skin_tags = { "HALLOWED", "BASE", "WALTER", },
    skins = { ghost_skin = "ghost_walter" , normal_skin = "custom_walter_ventriloquist" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_walter_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walter_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walter_victorian.dyn"),
    },
    base_prefab = "walter" ,
    build_name_override = "custom_walter_victorian" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "walter_victorian",
    skin_tags = { "VICTORIAN", "BASE", "WALTER", },
    skins = { ghost_skin = "ghost_walter" , normal_skin = "custom_walter_victorian" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_walter_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walter_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walter_yule.dyn"),
    },
    base_prefab = "walter" ,
    build_name_override = "custom_walter_yule" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "walter_yule",
    skin_tags = { "YULE", "BASE", "WALTER", },
    skins = { ghost_skin = "ghost_walter" , normal_skin = "custom_walter_yule" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_walterhat_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walterhat_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walterhat_ancient.dyn"),
    },
    base_prefab = "walterhat" ,
    build_name_override = "custom_walterhat_ancient" ,
    init_fn = function(inst) walterhat_init_fn(inst, "custom_walterhat_ancient") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ANCIENT", "WALTERHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walterhat_bee",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walterhat_bee.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walterhat_bee.dyn"),
    },
    base_prefab = "walterhat" ,
    build_name_override = "custom_walterhat_bee" ,
    init_fn = function(inst) walterhat_init_fn(inst, "custom_walterhat_bee") end,
    marketable = true,
    rarity = "HeirloomDistinguished",
    release_group = groupid,
    skin_tags = { "COSTUME", "WALTERHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walterhat_detective",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walterhat_detective.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walterhat_detective.dyn"),
    },
    base_prefab = "walterhat" ,
    build_name_override = "custom_walterhat_detective" ,
    init_fn = function(inst) walterhat_init_fn(inst, "custom_walterhat_detective") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "DETECTIVE", "WALTERHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walterhat_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walterhat_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walterhat_formal.dyn"),
    },
    base_prefab = "walterhat" ,
    build_name_override = "custom_walterhat_formal" ,
    init_fn = function(inst) walterhat_init_fn(inst, "custom_walterhat_formal") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "FORMAL", "WALTERHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walterhat_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walterhat_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walterhat_ice.dyn"),
    },
    base_prefab = "walterhat" ,
    build_name_override = "custom_walterhat_ice" ,
    init_fn = function(inst) walterhat_init_fn(inst, "custom_walterhat_ice") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ICE", "WALTERHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walterhat_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walterhat_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walterhat_lunar.dyn"),
    },
    base_prefab = "walterhat" ,
    build_name_override = "custom_walterhat_lunar" ,
    init_fn = function(inst) walterhat_init_fn(inst, "custom_walterhat_lunar") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "LUNAR", "WALTERHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walterhat_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walterhat_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walterhat_nature.dyn"),
    },
    base_prefab = "walterhat" ,
    build_name_override = "custom_walterhat_nature" ,
    init_fn = function(inst) walterhat_init_fn(inst, "custom_walterhat_nature") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "VARG", "WALTERHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walterhat_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walterhat_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walterhat_rose.dyn"),
    },
    base_prefab = "walterhat" ,
    build_name_override = "custom_walterhat_rose" ,
    init_fn = function(inst) walterhat_init_fn(inst, "custom_walterhat_rose") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "ROSE", "WALTERHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walterhat_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walterhat_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walterhat_shadow.dyn"),
    },
    base_prefab = "walterhat" ,
    build_name_override = "custom_walterhat_shadow" ,
    init_fn = function(inst) walterhat_init_fn(inst, "custom_walterhat_shadow") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SHADOW", "WALTERHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walterhat_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walterhat_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walterhat_survivor.dyn"),
    },
    base_prefab = "walterhat" ,
    build_name_override = "custom_walterhat_survivor" ,
    init_fn = function(inst) walterhat_init_fn(inst, "custom_walterhat_survivor") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "SURVIVOR", "WALTERHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walterhat_ventriloquist",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walterhat_ventriloquist.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walterhat_ventriloquist.dyn"),
    },
    base_prefab = "walterhat" ,
    build_name_override = "custom_walterhat_ventriloquist" ,
    init_fn = function(inst) walterhat_init_fn(inst, "custom_walterhat_ventriloquist") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "HALLOWED", "WALTERHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walterhat_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walterhat_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walterhat_victorian.dyn"),
    },
    base_prefab = "walterhat" ,
    build_name_override = "custom_walterhat_victorian" ,
    init_fn = function(inst) walterhat_init_fn(inst, "custom_walterhat_victorian") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "VICTORIAN", "WALTERHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_walterhat_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_walterhat_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_walterhat_yule.dyn"),
    },
    base_prefab = "walterhat" ,
    build_name_override = "custom_walterhat_yule" ,
    init_fn = function(inst) walterhat_init_fn(inst, "custom_walterhat_yule") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "YULE", "WALTERHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wanda_bishop",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_bishop.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_bishop.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_bishop_old.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_bishop_old.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_bishop_young.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_bishop_young.dyn"),
    },
    base_prefab = "wanda" ,
    build_name_override = "custom_wanda_bishop" ,
    feet_cuff_size = { wanda_bishop = 1, wanda_bishop_old = 1, wanda_bishop_young = 1, },
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wanda_bishop",
    skin_tags = { "COSTUME", "BASE", "WANDA", },
    skins = { ghost_skin = "ghost_wanda_build" , normal_skin = "custom_wanda_bishop" , old_skin = "custom_wanda_bishop_old" , young_skin = "custom_wanda_bishop_young" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wanda_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_formal.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_formal_old.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_formal_old.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_formal_young.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_formal_young.dyn"),
    },
    base_prefab = "wanda" ,
    build_name_override = "custom_wanda_formal" ,
    feet_cuff_size = { wanda_formal_old = 1, wanda_formal = 1, wanda_formal_young = 1, },
    has_alternate_for_body = { "custom_wanda_formal_old", },
    has_alternate_for_skirt = { "custom_wanda_formal_old", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wanda_formal",
    skin_tags = { "FORMAL", "BASE", "WANDA", },
    skins = { ghost_skin = "ghost_wanda_build" , normal_skin = "custom_wanda_formal" , old_skin = "custom_wanda_formal_old" , young_skin = "custom_wanda_formal_young" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wanda_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_ice.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_ice_old.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_ice_old.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_ice_young.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_ice_young.dyn"),
    },
    base_prefab = "wanda" ,
    build_name_override = "custom_wanda_ice" ,
    feet_cuff_size = { wanda_ice_old = 1, wanda_ice = 1, wanda_ice_young = 1, },
    has_alternate_for_body = { "custom_wanda_ice_old", },
    has_alternate_for_skirt = { "custom_wanda_ice_old", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wanda_ice",
    skin_tags = { "ICE", "BASE", "WANDA", },
    skins = { ghost_skin = "ghost_wanda_build" , normal_skin = "custom_wanda_ice" , old_skin = "custom_wanda_ice_old" , young_skin = "custom_wanda_ice_young" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wanda_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_lunar.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_lunar_old.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_lunar_old.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_lunar_young.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_lunar_young.dyn"),
    },
    base_prefab = "wanda" ,
    build_name_override = "custom_wanda_lunar" ,
    feet_cuff_size = { wanda_lunar = 1, wanda_lunar_old = 1, wanda_lunar_young = 1, },
    has_alternate_for_body = { "custom_wanda_lunar_old", },
    has_alternate_for_skirt = { "custom_wanda_lunar_old", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wanda_lunar",
    skin_tags = { "LUNAR", "BASE", "WANDA", },
    skins = { ghost_skin = "ghost_wanda_build" , normal_skin = "custom_wanda_lunar" , old_skin = "custom_wanda_lunar_old" , young_skin = "custom_wanda_lunar_young" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wanda_masquerade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_masquerade.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_masquerade_old.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_masquerade_old.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_masquerade_young.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_masquerade_young.dyn"),
    },
    base_prefab = "wanda" ,
    build_name_override = "custom_wanda_masquerade" ,
    feet_cuff_size = { wanda_masquerade = 1, },
    has_alternate_for_body = { "custom_wanda_masquerade_old", },
    has_alternate_for_skirt = { "custom_wanda_masquerade_old", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wanda_masquerade",
    skin_tags = { "MASQUERADE", "BASE", "WANDA", },
    skins = { ghost_skin = "ghost_wanda_build" , normal_skin = "custom_wanda_masquerade" , old_skin = "custom_wanda_masquerade_old" , young_skin = "custom_wanda_masquerade_young" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wanda_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_nature.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_nature_old.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_nature_old.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_nature_young.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_nature_young.dyn"),
    },
    base_prefab = "wanda" ,
    build_name_override = "custom_wanda_nature" ,
    feet_cuff_size = { wanda_nature_old = 1, wanda_nature_young = 1, wanda_nature = 1, },
    has_alternate_for_body = { "custom_wanda_nature_old", },
    has_alternate_for_skirt = { "custom_wanda_nature_old", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wanda_nature",
    skin_tags = { "VARG", "BASE", "WANDA", },
    skins = { ghost_skin = "ghost_wanda_build" , normal_skin = "custom_wanda_nature" , old_skin = "custom_wanda_nature_old" , young_skin = "custom_wanda_nature_young" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wanda_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_rose.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_rose_old.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_rose_old.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_rose_young.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_rose_young.dyn"),
    },
    base_prefab = "wanda" ,
    build_name_override = "custom_wanda_rose" ,
    feet_cuff_size = { wanda_rose = 1, wanda_rose_young = 1, wanda_rose_old = 1, },
    has_alternate_for_body = { "custom_wanda_rose_old", },
    has_alternate_for_skirt = { "custom_wanda_rose_old", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wanda_rose",
    skin_tags = { "ROSE", "BASE", "WANDA", },
    skins = { ghost_skin = "ghost_wanda_build" , normal_skin = "custom_wanda_rose" , old_skin = "custom_wanda_rose_old" , young_skin = "custom_wanda_rose_young" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wanda_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_shadow.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_shadow_old.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_shadow_old.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_shadow_young.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_shadow_young.dyn"),
    },
    base_prefab = "wanda" ,
    build_name_override = "custom_wanda_shadow" ,
    feet_cuff_size = { wanda_shadow = 1, wanda_shadow_old = 1, wanda_shadow_young = 1, },
    has_alternate_for_body = { "custom_wanda_shadow_old", },
    has_alternate_for_skirt = { "custom_wanda_shadow_old", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wanda_shadow",
    skin_tags = { "SHADOW", "BASE", "WANDA", },
    skins = { ghost_skin = "ghost_wanda_build" , normal_skin = "custom_wanda_shadow" , old_skin = "custom_wanda_shadow_old" , young_skin = "custom_wanda_shadow_young" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wanda_steampunk",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_steampunk.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_steampunk.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_steampunk_old.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_steampunk_old.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_steampunk_young.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_steampunk_young.dyn"),
    },
    base_prefab = "wanda" ,
    build_name_override = "custom_wanda_steampunk" ,
    feet_cuff_size = { wanda_steampunk = 1, wanda_steampunk_old = 1, wanda_steampunk_young = 1, },
    has_alternate_for_body = { "custom_wanda_steampunk_old", },
    has_alternate_for_skirt = { "custom_wanda_steampunk_old", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wanda_steampunk",
    skin_tags = { "STEAMPUNK", "BASE", "WANDA", },
    skins = { ghost_skin = "ghost_wanda_build" , normal_skin = "custom_wanda_steampunk" , old_skin = "custom_wanda_steampunk_old" , young_skin = "custom_wanda_steampunk_young" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wanda_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_yule.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_yule_old.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_yule_old.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wanda_yule_young.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wanda_yule_young.dyn"),
    },
    base_prefab = "wanda" ,
    build_name_override = "custom_wanda_yule" ,
    feet_cuff_size = { wanda_yule = 1, wanda_yule_young = 1, wanda_yule_old = 1, },
    has_alternate_for_body = { "custom_wanda_yule_old", },
    has_alternate_for_skirt = { "custom_wanda_yule_old", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wanda_yule",
    skin_tags = { "YULE", "BASE", "WANDA", },
    skins = { ghost_skin = "ghost_wanda_build" , normal_skin = "custom_wanda_yule" , old_skin = "custom_wanda_yule_old" , young_skin = "custom_wanda_yule_young" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wardrobe_armoire",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wardrobe_armoire.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wardrobe_armoire.dyn"),
    },
    base_prefab = "wardrobe" ,
    build_name_override = "custom_wardrobe_armoire" ,
    init_fn = function(inst) wardrobe_init_fn(inst, "custom_wardrobe_armoire") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WARDROBE", "HANDMEDOWN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wardrobe_crystal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wardrobe_crystal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wardrobe_crystal.dyn"),
    },
    base_prefab = "wardrobe" ,
    build_name_override = "custom_wardrobe_crystal" ,
    init_fn = function(inst) wardrobe_init_fn(inst, "custom_wardrobe_crystal") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "WARDROBE", "CRYSTAL", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wardrobe_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wardrobe_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wardrobe_gothic.dyn"),
    },
    base_prefab = "wardrobe" ,
    build_name_override = "custom_wardrobe_gothic" ,
    init_fn = function(inst) wardrobe_init_fn(inst, "custom_wardrobe_gothic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WARDROBE", "GOTHIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wardrobe_heart",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wardrobe_heart.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wardrobe_heart.dyn"),
    },
    base_prefab = "wardrobe" ,
    build_name_override = "custom_wardrobe_heart" ,
    init_fn = function(inst) wardrobe_init_fn(inst, "custom_wardrobe_heart") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WARDROBE", "YOTP", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wardrobe_vine",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wardrobe_vine.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wardrobe_vine.dyn"),
    },
    base_prefab = "wardrobe" ,
    build_name_override = "custom_wardrobe_vine" ,
    init_fn = function(inst) wardrobe_init_fn(inst, "custom_wardrobe_vine") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "WARDROBE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wardrobe_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wardrobe_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wardrobe_yule.dyn"),
    },
    base_prefab = "wardrobe" ,
    build_name_override = "custom_wardrobe_yule" ,
    init_fn = function(inst) wardrobe_init_fn(inst, "custom_wardrobe_yule") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "WARDROBE", "YULE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_warly_candyman",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_warly_candyman.zip"),
        Asset("PKGREF", "anim/dynamic/custom_warly_candyman.dyn"),
    },
    base_prefab = "warly" ,
    build_name_override = "custom_warly_candyman" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "warly_candyman",
    skin_tags = { "HALLOWED", "BASE", "WARLY", },
    skins = { ghost_skin = "ghost_warly_build" , normal_skin = "custom_warly_candyman" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_warly_carrat",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_warly_carrat.zip"),
        Asset("PKGREF", "anim/dynamic/custom_warly_carrat.dyn"),
    },
    base_prefab = "warly" ,
    build_name_override = "custom_warly_carrat" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "warly_carrat",
    skin_tags = { "COSTUME", "BASE", "WARLY", },
    skins = { ghost_skin = "ghost_warly_build" , normal_skin = "custom_warly_carrat" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_warly_chef",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_warly_chef.zip"),
        Asset("PKGREF", "anim/dynamic/custom_warly_chef.dyn"),
    },
    base_prefab = "warly" ,
    build_name_override = "custom_warly_chef" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "warly_chef",
    skin_tags = { "CHEF", "BASE", "WARLY", },
    skins = { ghost_skin = "ghost_warly_build" , normal_skin = "custom_warly_chef" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_warly_fisherman",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_warly_fisherman.zip"),
        Asset("PKGREF", "anim/dynamic/custom_warly_fisherman.dyn"),
    },
    base_prefab = "warly" ,
    build_name_override = "custom_warly_fisherman" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "warly_fisherman",
    skin_tags = { "FISHERMAN", "BASE", "WARLY", },
    skins = { ghost_skin = "ghost_warly_build" , normal_skin = "custom_warly_fisherman" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_warly_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_warly_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_warly_formal.dyn"),
    },
    base_prefab = "warly" ,
    build_name_override = "custom_warly_formal" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "warly_formal",
    skin_tags = { "FORMAL", "BASE", "WARLY", },
    skins = { ghost_skin = "ghost_warly_build" , normal_skin = "custom_warly_formal" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_warly_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_warly_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_warly_ice.dyn"),
    },
    base_prefab = "warly" ,
    build_name_override = "custom_warly_ice" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "warly_ice",
    skin_tags = { "ICE", "BASE", "WARLY", },
    skins = { ghost_skin = "ghost_warly_build" , normal_skin = "custom_warly_ice" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_warly_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_warly_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_warly_lunar.dyn"),
    },
    base_prefab = "warly" ,
    build_name_override = "custom_warly_lunar" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "warly_lunar",
    skin_tags = { "LUNAR", "BASE", "WARLY", },
    skins = { ghost_skin = "ghost_warly_build" , normal_skin = "custom_warly_lunar" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_warly_masquerade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_warly_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_warly_masquerade.dyn"),
    },
    base_prefab = "warly" ,
    build_name_override = "custom_warly_masquerade" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "warly_masquerade",
    skin_tags = { "MASQUERADE", "BASE", "WARLY", },
    skins = { ghost_skin = "ghost_warly_build" , normal_skin = "custom_warly_masquerade" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_warly_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_warly_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_warly_nature.dyn"),
    },
    base_prefab = "warly" ,
    build_name_override = "custom_warly_nature" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "warly_nature",
    skin_tags = { "VARG", "BASE", "WARLY", },
    skins = { ghost_skin = "ghost_warly_build" , normal_skin = "custom_warly_nature" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_warly_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_warly_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_warly_pirate.dyn"),
    },
    base_prefab = "warly" ,
    build_name_override = "custom_warly_pirate" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "warly_pirate",
    skin_tags = { "PIRATE", "BASE", "WARLY", },
    skins = { ghost_skin = "ghost_warly_build" , normal_skin = "custom_warly_pirate" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_warly_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_warly_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_warly_rose.dyn"),
    },
    base_prefab = "warly" ,
    build_name_override = "custom_warly_rose" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "warly_rose",
    skin_tags = { "ROSE", "BASE", "WARLY", },
    skins = { ghost_skin = "ghost_warly_build" , normal_skin = "custom_warly_rose" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_warly_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_warly_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_warly_shadow.dyn"),
    },
    base_prefab = "warly" ,
    build_name_override = "custom_warly_shadow" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "warly_shadow",
    skin_tags = { "SHADOW", "BASE", "WARLY", },
    skins = { ghost_skin = "ghost_warly_build" , normal_skin = "custom_warly_shadow" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_warly_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_warly_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_warly_victorian.dyn"),
    },
    base_prefab = "warly" ,
    build_name_override = "custom_warly_victorian" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "warly_victorian",
    skin_tags = { "VICTORIAN", "BASE", "WARLY", },
    skins = { ghost_skin = "ghost_warly_build" , normal_skin = "custom_warly_victorian" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_warly_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_warly_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_warly_yule.dyn"),
    },
    base_prefab = "warly" ,
    build_name_override = "custom_warly_yule" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "warly_yule",
    skin_tags = { "YULE", "BASE", "WARLY", },
    skins = { ghost_skin = "ghost_warly_build" , normal_skin = "custom_warly_yule" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wateringcan_cactus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wateringcan_cactus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wateringcan_cactus.dyn"),
    },
    base_prefab = "wateringcan" ,
    build_name_override = "custom_wateringcan_cactus" ,
    init_fn = function(inst) wateringcan_init_fn(inst, "custom_wateringcan_cactus") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BUILDERS", "WATERINGCAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wateringcan_rustic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wateringcan_rustic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wateringcan_rustic.dyn"),
    },
    base_prefab = "wateringcan" ,
    build_name_override = "custom_wateringcan_rustic" ,
    init_fn = function(inst) wateringcan_init_fn(inst, "custom_wateringcan_rustic") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "BOY", "WATERINGCAN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_watermelonhat_banana",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_watermelonhat_banana.zip"),
        Asset("PKGREF", "anim/dynamic/custom_watermelonhat_banana.dyn"),
    },
    base_prefab = "watermelonhat" ,
    build_name_override = "custom_watermelonhat_banana" ,
    init_fn = function(inst) watermelonhat_init_fn(inst, "custom_watermelonhat_banana") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "WATERMELONHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_watermelonhat_cantaloupe",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_watermelonhat_cantaloupe.zip"),
        Asset("PKGREF", "anim/dynamic/custom_watermelonhat_cantaloupe.dyn"),
    },
    base_prefab = "watermelonhat" ,
    build_name_override = "custom_watermelonhat_cantaloupe" ,
    init_fn = function(inst) watermelonhat_init_fn(inst, "custom_watermelonhat_cantaloupe") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "WATERMELONHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_watermelonhat_pumpkin",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_watermelonhat_pumpkin.zip"),
        Asset("PKGREF", "anim/dynamic/custom_watermelonhat_pumpkin.dyn"),
    },
    base_prefab = "watermelonhat" ,
    build_name_override = "custom_watermelonhat_pumpkin" ,
    init_fn = function(inst) watermelonhat_init_fn(inst, "custom_watermelonhat_pumpkin") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WATERMELONHAT", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_ancient.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_ancient" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_ancient",
    skin_tags = { "ANCIENT", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_ancient" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_combatant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_combatant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_combatant.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_combatant" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_combatant",
    skin_tags = { "LAVA", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_combatant" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_cook",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_cook.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_cook.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_cook" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_cook",
    skin_tags = { "VICTORIAN", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_cook" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_deerclops",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_deerclops.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_deerclops.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_deerclops" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_deerclops",
    skin_tags = { "COSTUME", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_deerclops" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_formal.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_formal" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_formal",
    skin_tags = { "FORMAL", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_formal" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_gladiator",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_gladiator.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_gladiator.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_gladiator" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_gladiator",
    skin_tags = { "LAVA", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_gladiator" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_ice.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_ice" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_ice",
    skin_tags = { "ICE", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_ice" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_improvedhat_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_improvedhat_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_improvedhat_lunar.dyn"),
    },
    base_prefab = "wathgrithr_improvedhat" ,
    build_name_override = "custom_wathgrithr_improvedhat_lunar" ,
    init_fn = function(inst) wathgrithr_improvedhat_init_fn(inst, "custom_wathgrithr_improvedhat_lunar", true) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_improvedhat_valkyrie",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_improvedhat_valkyrie.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_improvedhat_valkyrie.dyn"),
    },
    base_prefab = "wathgrithr_improvedhat" ,
    build_name_override = "custom_wathgrithr_improvedhat_valkyrie" ,
    init_fn = function(inst) wathgrithr_improvedhat_init_fn(inst, "custom_wathgrithr_improvedhat_valkyrie", true) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_improvedhat_wrestle",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_improvedhat_wrestle.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_improvedhat_wrestle.dyn"),
    },
    base_prefab = "wathgrithr_improvedhat" ,
    build_name_override = "custom_wathgrithr_improvedhat_wrestle" ,
    init_fn = function(inst) wathgrithr_improvedhat_init_fn(inst, "custom_wathgrithr_improvedhat_wrestle", false) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_lunar.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_lunar" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_lunar",
    skin_tags = { "LUNAR", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_lunar" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_magma",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_magma.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_magma.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_magma" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_magma",
    skin_tags = { "LAVA", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_magma" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_masquerade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_masquerade.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_masquerade" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_masquerade",
    skin_tags = { "MASQUERADE", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_masquerade" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_nature.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_nature" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_nature",
    skin_tags = { "VARG", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_nature" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_pirate.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_pirate" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_pirate",
    skin_tags = { "PIRATE", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_pirate" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_rose.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_rose" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_rose",
    skin_tags = { "ROSE", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_rose" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_scarecrow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_scarecrow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_scarecrow.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_scarecrow" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_scarecrow",
    skin_tags = { "HALLOWED", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_scarecrow" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_shadow.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_shadow" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_shadow",
    skin_tags = { "SHADOW", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_shadow" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_survivor.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_survivor" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_survivor",
    skin_tags = { "SURVIVOR", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_survivor" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_valkyrie",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_valkyrie.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_valkyrie.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_valkyrie" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_valkyrie",
    skin_tags = { "VALKYRIE", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_valkyrie" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_victorian.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_victorian" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_victorian",
    skin_tags = { "VICTORIAN", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_victorian" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_wrestler",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_wrestler.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_wrestler.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_wrestler" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_wrestler",
    skin_tags = { "YOTP", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_wrestler" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithr_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithr_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithr_yule.dyn"),
    },
    base_prefab = "wathgrithr" ,
    build_name_override = "custom_wathgrithr_yule" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wathgrithr_yule",
    skin_tags = { "YULE", "BASE", "WATHGRITHR", },
    skins = { ghost_skin = "ghost_wathgrithr_build" , normal_skin = "custom_wathgrithr_yule" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithrhat_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithrhat_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithrhat_lunar.dyn"),
    },
    base_prefab = "wathgrithrhat" ,
    build_name_override = "custom_wathgrithrhat_lunar" ,
    granted_items = { "custom_wathgrithr_improvedhat_lunar" , },
    init_fn = function(inst) wathgrithrhat_init_fn(inst, "custom_wathgrithrhat_lunar", true) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WATHGRITHRHAT", "LUNAR", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithrhat_valkyrie",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithrhat_valkyrie.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithrhat_valkyrie.dyn"),
    },
    base_prefab = "wathgrithrhat" ,
    build_name_override = "custom_wathgrithrhat_valkyrie" ,
    granted_items = { "custom_wathgrithr_improvedhat_valkyrie" , },
    init_fn = function(inst) wathgrithrhat_init_fn(inst, "custom_wathgrithrhat_valkyrie", true) end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WATHGRITHRHAT", "VALKYRIE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wathgrithrhat_wrestle",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wathgrithrhat_wrestle.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wathgrithrhat_wrestle.dyn"),
    },
    base_prefab = "wathgrithrhat" ,
    build_name_override = "custom_wathgrithrhat_wrestle" ,
    granted_items = { "custom_wathgrithr_improvedhat_wrestle" , },
    init_fn = function(inst) wathgrithrhat_init_fn(inst, "custom_wathgrithrhat_wrestle") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WATHGRITHRHAT", "YOTP", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_waxwell_combatant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_waxwell_combatant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_waxwell_combatant.dyn"),
    },
    base_prefab = "waxwell" ,
    build_name_override = "custom_waxwell_combatant" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "waxwell_combatant",
    skin_tags = { "LAVA", "BASE", "WAXWELL", },
    skins = { ghost_skin = "ghost_waxwell_build" , normal_skin = "custom_waxwell_combatant" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_waxwell_cook",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_waxwell_cook.zip"),
        Asset("PKGREF", "anim/dynamic/custom_waxwell_cook.dyn"),
    },
    base_prefab = "waxwell" ,
    build_name_override = "custom_waxwell_cook" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "waxwell_cook",
    skin_tags = { "VICTORIAN", "BASE", "WAXWELL", },
    skins = { ghost_skin = "ghost_waxwell_build" , normal_skin = "custom_waxwell_cook" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_waxwell_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_waxwell_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_waxwell_formal.dyn"),
    },
    base_prefab = "waxwell" ,
    build_name_override = "custom_waxwell_formal" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "waxwell_formal",
    skin_tags = { "FORMAL", "BASE", "WAXWELL", },
    skins = { ghost_skin = "ghost_waxwell_build" , normal_skin = "custom_waxwell_formal" , },
    torso_tuck_builds = { "custom_waxwell_formal", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_waxwell_gladiator",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_waxwell_gladiator.zip"),
        Asset("PKGREF", "anim/dynamic/custom_waxwell_gladiator.dyn"),
    },
    base_prefab = "waxwell" ,
    build_name_override = "custom_waxwell_gladiator" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "waxwell_gladiator",
    skin_tags = { "LAVA", "BASE", "WAXWELL", },
    skins = { ghost_skin = "ghost_waxwell_build" , normal_skin = "custom_waxwell_gladiator" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_waxwell_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_waxwell_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_waxwell_ice.dyn"),
    },
    base_prefab = "waxwell" ,
    build_name_override = "custom_waxwell_ice" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "waxwell_ice",
    skin_tags = { "ICE", "BASE", "WAXWELL", },
    skins = { ghost_skin = "ghost_waxwell_build" , normal_skin = "custom_waxwell_ice" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_waxwell_krampus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_waxwell_krampus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_waxwell_krampus.dyn"),
    },
    base_prefab = "waxwell" ,
    build_name_override = "custom_waxwell_krampus" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "waxwell_krampus",
    skin_tags = { "COSTUME", "BASE", "WAXWELL", },
    skins = { ghost_skin = "ghost_waxwell_build" , normal_skin = "custom_waxwell_krampus" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_waxwell_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_waxwell_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_waxwell_lunar.dyn"),
    },
    base_prefab = "waxwell" ,
    build_name_override = "custom_waxwell_lunar" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "waxwell_lunar",
    skin_tags = { "LUNAR", "BASE", "WAXWELL", },
    skins = { ghost_skin = "ghost_waxwell_build" , normal_skin = "custom_waxwell_lunar" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_waxwell_magma",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_waxwell_magma.zip"),
        Asset("PKGREF", "anim/dynamic/custom_waxwell_magma.dyn"),
    },
    base_prefab = "waxwell" ,
    build_name_override = "custom_waxwell_magma" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "waxwell_magma",
    skin_tags = { "LAVA", "BASE", "WAXWELL", },
    skins = { ghost_skin = "ghost_waxwell_build" , normal_skin = "custom_waxwell_magma" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_waxwell_masquerade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_waxwell_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_waxwell_masquerade.dyn"),
    },
    base_prefab = "waxwell" ,
    build_name_override = "custom_waxwell_masquerade" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "waxwell_masquerade",
    skin_tags = { "MASQUERADE", "BASE", "WAXWELL", },
    skins = { ghost_skin = "ghost_waxwell_build" , normal_skin = "custom_waxwell_masquerade" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_waxwell_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_waxwell_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_waxwell_nature.dyn"),
    },
    base_prefab = "waxwell" ,
    build_name_override = "custom_waxwell_nature" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "waxwell_nature",
    skin_tags = { "VARG", "BASE", "WAXWELL", },
    skins = { ghost_skin = "ghost_waxwell_build" , normal_skin = "custom_waxwell_nature" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_waxwell_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_waxwell_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_waxwell_pirate.dyn"),
    },
    base_prefab = "waxwell" ,
    build_name_override = "custom_waxwell_pirate" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "waxwell_pirate",
    skin_tags = { "PIRATE", "BASE", "WAXWELL", },
    skins = { ghost_skin = "ghost_waxwell_build" , normal_skin = "custom_waxwell_pirate" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_waxwell_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_waxwell_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_waxwell_rose.dyn"),
    },
    base_prefab = "waxwell" ,
    build_name_override = "custom_waxwell_rose" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "waxwell_rose",
    skin_tags = { "ROSE", "BASE", "WAXWELL", },
    skins = { ghost_skin = "ghost_waxwell_build" , normal_skin = "custom_waxwell_rose" , },
    torso_tuck_builds = { "custom_waxwell_rose", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_waxwell_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_waxwell_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_waxwell_survivor.dyn"),
    },
    base_prefab = "waxwell" ,
    build_name_override = "custom_waxwell_survivor" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "waxwell_survivor",
    skin_tags = { "SURVIVOR", "BASE", "WAXWELL", },
    skins = { ghost_skin = "ghost_waxwell_build" , normal_skin = "custom_waxwell_survivor" , },
    torso_tuck_builds = { "custom_waxwell_survivor", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_waxwell_unshadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_waxwell_unshadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_waxwell_unshadow.dyn"),
    },
    base_prefab = "waxwell" ,
    build_name_override = "custom_waxwell_unshadow" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "waxwell_unshadow",
    skin_tags = { "SHADOW", "BASE", "WAXWELL", },
    skins = { ghost_skin = "ghost_waxwell_build" , normal_skin = "custom_waxwell_unshadow" , },
    torso_tuck_builds = { "custom_waxwell_unshadow", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_waxwell_vampire",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_waxwell_vampire.zip"),
        Asset("PKGREF", "anim/dynamic/custom_waxwell_vampire.dyn"),
    },
    base_prefab = "waxwell" ,
    build_name_override = "custom_waxwell_vampire" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "waxwell_vampire",
    skin_tags = { "HALLOWED", "BASE", "WAXWELL", },
    skins = { ghost_skin = "ghost_waxwell_build" , normal_skin = "custom_waxwell_vampire" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_waxwell_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_waxwell_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_waxwell_victorian.dyn"),
    },
    base_prefab = "waxwell" ,
    build_name_override = "custom_waxwell_victorian" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "waxwell_victorian",
    skin_tags = { "VICTORIAN", "BASE", "WAXWELL", },
    skins = { ghost_skin = "ghost_waxwell_build" , normal_skin = "custom_waxwell_victorian" , },
    torso_tuck_builds = { "custom_waxwell_victorian", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_waxwell_wizard",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_waxwell_wizard.zip"),
        Asset("PKGREF", "anim/dynamic/custom_waxwell_wizard.dyn"),
    },
    base_prefab = "waxwell" ,
    build_name_override = "custom_waxwell_wizard" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "waxwell_wizard",
    skin_tags = { "WIZARD", "BASE", "WAXWELL", },
    skins = { ghost_skin = "ghost_waxwell_build" , normal_skin = "custom_waxwell_wizard" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_waxwell_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_waxwell_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_waxwell_yule.dyn"),
    },
    base_prefab = "waxwell" ,
    build_name_override = "custom_waxwell_yule" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "waxwell_yule",
    skin_tags = { "YULE", "BASE", "WAXWELL", },
    skins = { ghost_skin = "ghost_waxwell_build" , normal_skin = "custom_waxwell_yule" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_bat",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_bat.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_bat.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_bat" ,
    has_alternate_for_body = { "custom_webber_bat", },
    linked_beard = "custom_webber_beard_bat",
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "webber_bat",
    skin_tags = { "COSTUME", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_bat" , },
    torso_tuck_builds = { "custom_webber_bat", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_boy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_boy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_boy.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_boy" ,
    has_alternate_for_body = { "custom_webber_boy", },
    linked_beard = "custom_webber_beard_boy",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "webber_boy",
    skin_tags = { "BOY", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_boy" , },
    torso_tuck_builds = { "custom_webber_boy", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_combatant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_combatant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_combatant.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_combatant" ,
    has_alternate_for_body = { "custom_webber_combatant", },
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "webber_combatant",
    skin_tags = { "LAVA", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_combatant" , },
    torso_tuck_builds = { "custom_webber_combatant", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_cook",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_cook.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_cook.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_cook" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "webber_cook",
    skin_tags = { "VICTORIAN", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_cook" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_formal.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_formal" ,
    has_alternate_for_body = { "custom_webber_formal", },
    linked_beard = "custom_webber_beard_formal",
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "webber_formal",
    skin_tags = { "FORMAL", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_formal" , },
    torso_tuck_builds = { "custom_webber_formal", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_gladiator",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_gladiator.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_gladiator.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_gladiator" ,
    has_alternate_for_body = { "custom_webber_gladiator", },
    linked_beard = "custom_webber_beard_gladiator",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "webber_gladiator",
    skin_tags = { "LAVA", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_gladiator" , },
    torso_tuck_builds = { "custom_webber_gladiator", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_ice.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_ice" ,
    has_alternate_for_body = { "custom_webber_ice", },
    linked_beard = "custom_webber_beard_ice",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "webber_ice",
    skin_tags = { "ICE", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_ice" , },
    torso_tuck_builds = { "custom_webber_ice", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_lunar.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_lunar" ,
    has_alternate_for_body = { "custom_webber_lunar", },
    linked_beard = "custom_webber_beard_lunar",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "webber_lunar",
    skin_tags = { "LUNAR", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_lunar" , },
    torso_tuck_builds = { "custom_webber_lunar", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_magma",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_magma.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_magma.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_magma" ,
    has_alternate_for_body = { "custom_webber_magma", },
    linked_beard = "custom_webber_beard_magma",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "webber_magma",
    skin_tags = { "LAVA", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_magma" , },
    torso_tuck_builds = { "custom_webber_magma", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_masquerade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_masquerade.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_masquerade" ,
    linked_beard = "custom_webber_beard_masquerade",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "webber_masquerade",
    skin_tags = { "MASQUERADE", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_masquerade" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_nature.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_nature" ,
    has_alternate_for_body = { "custom_webber_nature", },
    linked_beard = "custom_webber_beard_nature",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "webber_nature",
    skin_tags = { "VARG", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_nature" , },
    torso_tuck_builds = { "custom_webber_nature", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_pirate.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_pirate" ,
    has_alternate_for_body = { "custom_webber_pirate", },
    linked_beard = "custom_webber_beard_pirate",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "webber_pirate",
    skin_tags = { "PIRATE", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_pirate" , },
    torso_tuck_builds = { "custom_webber_pirate", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_punk",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_punk.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_punk.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_punk" ,
    has_alternate_for_body = { "custom_webber_punk", },
    linked_beard = "custom_webber_beard_punk",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "webber_punk",
    skin_tags = { "HALLOWED", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_punk" , },
    torso_tuck_builds = { "custom_webber_punk", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_rose.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_rose" ,
    has_alternate_for_body = { "custom_webber_rose", },
    linked_beard = "custom_webber_beard_rose",
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "webber_rose",
    skin_tags = { "ROSE", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_rose" , },
    torso_tuck_builds = { "custom_webber_rose", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_shadow.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_shadow" ,
    has_alternate_for_body = { "custom_webber_shadow", },
    linked_beard = "custom_webber_beard_shadow",
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "webber_shadow",
    skin_tags = { "SHADOW", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_shadow" , },
    torso_tuck_builds = { "custom_webber_shadow", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_survivor.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_survivor" ,
    has_alternate_for_body = { "custom_webber_survivor", },
    linked_beard = "custom_webber_beard_survivor",
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "webber_survivor",
    skin_tags = { "SURVIVOR", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_survivor" , },
    torso_tuck_builds = { "custom_webber_survivor", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_victorian.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_victorian" ,
    has_alternate_for_body = { "custom_webber_victorian", },
    linked_beard = "custom_webber_beard_victorian",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "webber_victorian",
    skin_tags = { "VICTORIAN", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_victorian" , },
    torso_tuck_builds = { "custom_webber_victorian", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_wrestler",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_wrestler.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_wrestler.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_wrestler" ,
    has_alternate_for_body = { "custom_webber_wrestler", },
    linked_beard = "custom_webber_beard_wrestler",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "webber_wrestler",
    skin_tags = { "YOTP", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_wrestler" , },
    torso_tuck_builds = { "custom_webber_wrestler", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_webber_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_webber_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_webber_yule.dyn"),
    },
    base_prefab = "webber" ,
    build_name_override = "custom_webber_yule" ,
    has_alternate_for_body = { "custom_webber_yule", },
    linked_beard = "custom_webber_beard_yule",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "webber_yule",
    skin_tags = { "YULE", "BASE", "WEBBER", },
    skins = { ghost_skin = "ghost_webber_build" , normal_skin = "custom_webber_yule" , },
    torso_tuck_builds = { "custom_webber_yule", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wendy_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wendy_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wendy_ancient.dyn"),
    },
    base_prefab = "wendy" ,
    build_name_override = "custom_wendy_ancient" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wendy_ancient",
    skin_tags = { "ANCIENT", "BASE", "WENDY", },
    skins = { ghost_skin = "ghost_wendy_build" , normal_skin = "custom_wendy_ancient" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wendy_combatant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wendy_combatant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wendy_combatant.dyn"),
    },
    base_prefab = "wendy" ,
    build_name_override = "custom_wendy_combatant" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wendy_combatant",
    skin_tags = { "LAVA", "BASE", "WENDY", },
    skins = { ghost_skin = "ghost_wendy_build" , normal_skin = "custom_wendy_combatant" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wendy_cook",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wendy_cook.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wendy_cook.dyn"),
    },
    base_prefab = "wendy" ,
    build_name_override = "custom_wendy_cook" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wendy_cook",
    skin_tags = { "VICTORIAN", "BASE", "WENDY", },
    skins = { ghost_skin = "ghost_wendy_build" , normal_skin = "custom_wendy_cook" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wendy_creepy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wendy_creepy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wendy_creepy.dyn"),
    },
    base_prefab = "wendy" ,
    build_name_override = "custom_wendy_creepy" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wendy_creepy",
    skin_tags = { "HALLOWED", "BASE", "WENDY", },
    skins = { ghost_skin = "ghost_wendy_build" , normal_skin = "custom_wendy_creepy" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wendy_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wendy_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wendy_formal.dyn"),
    },
    base_prefab = "wendy" ,
    build_name_override = "custom_wendy_formal" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wendy_formal",
    skin_tags = { "FORMAL", "BASE", "WENDY", },
    skins = { ghost_skin = "ghost_wendy_build" , normal_skin = "custom_wendy_formal" , },
    torso_untuck_builds = { "custom_wendy_formal", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wendy_gladiator",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wendy_gladiator.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wendy_gladiator.dyn"),
    },
    base_prefab = "wendy" ,
    build_name_override = "custom_wendy_gladiator" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wendy_gladiator",
    skin_tags = { "LAVA", "BASE", "WENDY", },
    skins = { ghost_skin = "ghost_wendy_build" , normal_skin = "custom_wendy_gladiator" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wendy_handmedown",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wendy_handmedown.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wendy_handmedown.dyn"),
    },
    base_prefab = "wendy" ,
    build_name_override = "custom_wendy_handmedown" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wendy_handmedown",
    skin_tags = { "HANDMEDOWN", "BASE", "WENDY", },
    skins = { ghost_skin = "ghost_wendy_build" , normal_skin = "custom_wendy_handmedown" , },
    torso_untuck_builds = { "custom_wendy_handmedown", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wendy_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wendy_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wendy_ice.dyn"),
    },
    base_prefab = "wendy" ,
    build_name_override = "custom_wendy_ice" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wendy_ice",
    skin_tags = { "ICE", "BASE", "WENDY", },
    skins = { ghost_skin = "ghost_wendy_build" , normal_skin = "custom_wendy_ice" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wendy_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wendy_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wendy_lunar.dyn"),
    },
    base_prefab = "wendy" ,
    build_name_override = "custom_wendy_lunar" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wendy_lunar",
    skin_tags = { "LUNAR", "BASE", "WENDY", },
    skins = { ghost_skin = "ghost_wendy_build" , normal_skin = "custom_wendy_lunar" , },
    torso_untuck_builds = { "custom_wendy_lunar", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wendy_lureplant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wendy_lureplant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wendy_lureplant.dyn"),
    },
    base_prefab = "wendy" ,
    build_name_override = "custom_wendy_lureplant" ,
    has_alternate_for_body = { "custom_wendy_lureplant", },
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wendy_lureplant",
    skin_tags = { "COSTUME", "BASE", "WENDY", },
    skins = { ghost_skin = "ghost_wendy_build" , normal_skin = "custom_wendy_lureplant" , },
    torso_tuck_builds = { "custom_wendy_lureplant", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wendy_magma",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wendy_magma.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wendy_magma.dyn"),
    },
    base_prefab = "wendy" ,
    build_name_override = "custom_wendy_magma" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wendy_magma",
    skin_tags = { "LAVA", "BASE", "WENDY", },
    skins = { ghost_skin = "ghost_wendy_build" , normal_skin = "custom_wendy_magma" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wendy_masquerade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wendy_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wendy_masquerade.dyn"),
    },
    base_prefab = "wendy" ,
    build_name_override = "custom_wendy_masquerade" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wendy_masquerade",
    skin_tags = { "MASQUERADE", "BASE", "WENDY", },
    skins = { ghost_skin = "ghost_wendy_build" , normal_skin = "custom_wendy_masquerade" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wendy_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wendy_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wendy_nature.dyn"),
    },
    base_prefab = "wendy" ,
    build_name_override = "custom_wendy_nature" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wendy_nature",
    skin_tags = { "VARG", "BASE", "WENDY", },
    skins = { ghost_skin = "ghost_wendy_build" , normal_skin = "custom_wendy_nature" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wendy_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wendy_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wendy_rose.dyn"),
    },
    base_prefab = "wendy" ,
    build_name_override = "custom_wendy_rose" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wendy_rose",
    skin_tags = { "ROSE", "BASE", "WENDY", },
    skins = { ghost_skin = "ghost_wendy_build" , normal_skin = "custom_wendy_rose" , },
    torso_untuck_builds = { "custom_wendy_rose", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wendy_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wendy_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wendy_shadow.dyn"),
    },
    base_prefab = "wendy" ,
    build_name_override = "custom_wendy_shadow" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wendy_shadow",
    skin_tags = { "SHADOW", "BASE", "WENDY", },
    skins = { ghost_skin = "ghost_wendy_build" , normal_skin = "custom_wendy_shadow" , },
    torso_untuck_builds = { "custom_wendy_shadow", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wendy_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wendy_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wendy_survivor.dyn"),
    },
    base_prefab = "wendy" ,
    build_name_override = "custom_wendy_survivor" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wendy_survivor",
    skin_tags = { "SURVIVOR", "BASE", "WENDY", },
    skins = { ghost_skin = "ghost_wendy_build" , normal_skin = "custom_wendy_survivor" , },
    torso_untuck_builds = { "custom_wendy_survivor", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wendy_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wendy_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wendy_victorian.dyn"),
    },
    base_prefab = "wendy" ,
    build_name_override = "custom_wendy_victorian" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wendy_victorian",
    skin_tags = { "VICTORIAN", "BASE", "WENDY", },
    skins = { ghost_skin = "ghost_wendy_build" , normal_skin = "custom_wendy_victorian" , },
    torso_untuck_builds = { "custom_wendy_victorian", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wendy_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wendy_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wendy_yule.dyn"),
    },
    base_prefab = "wendy" ,
    build_name_override = "custom_wendy_yule" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wendy_yule",
    skin_tags = { "YULE", "BASE", "WENDY", },
    skins = { ghost_skin = "ghost_wendy_build" , normal_skin = "custom_wendy_yule" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_clown",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_clown.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_clown.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_clown" ,
    has_alternate_for_body = { "custom_wes_clown", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wes_clown",
    skin_tags = { "HALLOWED", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_clown" , },
    torso_tuck_builds = { "custom_wes_clown", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_combatant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_combatant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_combatant.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_combatant" ,
    has_alternate_for_body = { "custom_wes_combatant", },
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wes_combatant",
    skin_tags = { "LAVA", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_combatant" , },
    torso_tuck_builds = { "custom_wes_combatant", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_cook",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_cook.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_cook.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_cook" ,
    has_alternate_for_body = { "custom_wes_cook", },
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wes_cook",
    skin_tags = { "VICTORIAN", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_cook" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_formal.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_formal" ,
    has_alternate_for_body = { "custom_wes_formal", },
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wes_formal",
    skin_tags = { "FORMAL", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_formal" , },
    torso_tuck_builds = { "custom_wes_formal", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_gladiator",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_gladiator.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_gladiator.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_gladiator" ,
    has_alternate_for_body = { "custom_wes_gladiator", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wes_gladiator",
    skin_tags = { "LAVA", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_gladiator" , },
    torso_tuck_builds = { "custom_wes_gladiator", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_harlequin",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_harlequin.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_harlequin.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_harlequin" ,
    has_alternate_for_body = { "custom_wes_harlequin", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wes_harlequin",
    skin_tags = { "FOOLS", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_harlequin" , },
    torso_tuck_builds = { "custom_wes_harlequin", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_ice.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_ice" ,
    has_alternate_for_body = { "custom_wes_ice", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wes_ice",
    skin_tags = { "ICE", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_ice" , },
    torso_tuck_builds = { "custom_wes_ice", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_lunar.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_lunar" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wes_lunar",
    skin_tags = { "LUNAR", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_lunar" , },
    torso_tuck_builds = { "custom_wes_ice", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_magma",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_magma.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_magma.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_magma" ,
    has_alternate_for_body = { "custom_wes_magma", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wes_magma",
    skin_tags = { "LAVA", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_magma" , },
    torso_tuck_builds = { "custom_wes_magma", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_mandrake",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_mandrake.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_mandrake.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_mandrake" ,
    has_alternate_for_body = { "custom_wes_mandrake", },
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wes_mandrake",
    skin_tags = { "COSTUME", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_mandrake" , },
    torso_tuck_builds = { "custom_wes_mandrake", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_masquerade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_masquerade.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_masquerade" ,
    has_alternate_for_body = { "custom_wes_masquerade", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wes_masquerade",
    skin_tags = { "MASQUERADE", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_masquerade" , },
    torso_tuck_builds = { "custom_wes_masquerade", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_nature.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_nature" ,
    has_alternate_for_body = { "custom_wes_nature", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wes_nature",
    skin_tags = { "VARG", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_nature" , },
    torso_tuck_builds = { "custom_wes_nature", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_pirate.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_pirate" ,
    has_alternate_for_body = { "custom_wes_pirate", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wes_pirate",
    skin_tags = { "PIRATE", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_pirate" , },
    torso_tuck_builds = { "custom_wes_pirate", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_rose.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_rose" ,
    has_alternate_for_body = { "custom_wes_rose", },
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wes_rose",
    skin_tags = { "ROSE", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_rose" , },
    torso_tuck_builds = { "custom_wes_rose", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_shadow.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_shadow" ,
    has_alternate_for_body = { "custom_wes_shadow", },
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wes_shadow",
    skin_tags = { "SHADOW", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_shadow" , },
    torso_tuck_builds = { "custom_wes_shadow", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_survivor.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_survivor" ,
    has_alternate_for_body = { "custom_wes_survivor", },
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wes_survivor",
    skin_tags = { "SURVIVOR", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_survivor" , },
    torso_tuck_builds = { "custom_wes_survivor", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_victorian.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_victorian" ,
    has_alternate_for_body = { "custom_wes_victorian", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wes_victorian",
    skin_tags = { "VICTORIAN", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_victorian" , },
    torso_tuck_builds = { "custom_wes_victorian", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_wrestler",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_wrestler.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_wrestler.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_wrestler" ,
    has_alternate_for_body = { "custom_wes_wrestler", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wes_wrestler",
    skin_tags = { "YOTP", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_wrestler" , },
    torso_tuck_builds = { "custom_wes_wrestler", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wes_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wes_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wes_yule.dyn"),
    },
    base_prefab = "wes" ,
    build_name_override = "custom_wes_yule" ,
    has_alternate_for_body = { "custom_wes_yule", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wes_yule",
    skin_tags = { "YULE", "BASE", "WES", },
    skins = { ghost_skin = "ghost_wes_build" , normal_skin = "custom_wes_yule" , },
    torso_tuck_builds = { "custom_wes_yule", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_whip_snapthorn",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_whip_snapthorn.zip"),
        Asset("PKGREF", "anim/dynamic/custom_whip_snapthorn.dyn"),
    },
    base_prefab = "whip" ,
    build_name_override = "custom_whip_snapthorn" ,
    init_fn = function(inst) whip_init_fn(inst, "custom_whip_snapthorn") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_sound = { ["large"] = "terraria1/skins/snapthorn", ["small"] = "terraria1/skins/snapthorn", },
    skin_tags = { "T_UPDATE", "WHIP", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wickerbottom_combatant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wickerbottom_combatant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wickerbottom_combatant.dyn"),
    },
    base_prefab = "wickerbottom" ,
    build_name_override = "custom_wickerbottom_combatant" ,
    feet_cuff_size = { wickerbottom_combatant = 3, },
    has_alternate_for_body = { "custom_wickerbottom_combatant", },
    has_alternate_for_skirt = { "custom_wickerbottom_combatant", },
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wickerbottom_combatant",
    skin_tags = { "LAVA", "BASE", "WICKERBOTTOM", },
    skins = { ghost_skin = "ghost_wickerbottom_build" , normal_skin = "custom_wickerbottom_combatant" , },
    torso_tuck_builds = { "custom_wickerbottom_combatant", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wickerbottom_cook",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wickerbottom_cook.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wickerbottom_cook.dyn"),
    },
    base_prefab = "wickerbottom" ,
    build_name_override = "custom_wickerbottom_cook" ,
    feet_cuff_size = { wickerbottom_cook = 3, },
    has_alternate_for_body = { "custom_wickerbottom_cook", },
    has_alternate_for_skirt = { "custom_wickerbottom_cook", },
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wickerbottom_cook",
    skin_tags = { "VICTORIAN", "BASE", "WICKERBOTTOM", },
    skins = { ghost_skin = "ghost_wickerbottom_build" , normal_skin = "custom_wickerbottom_cook" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wickerbottom_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wickerbottom_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wickerbottom_formal.dyn"),
    },
    base_prefab = "wickerbottom" ,
    build_name_override = "custom_wickerbottom_formal" ,
    feet_cuff_size = { wickerbottom_formal = 3, },
    has_alternate_for_body = { "custom_wickerbottom_formal", },
    has_alternate_for_skirt = { "custom_wickerbottom_formal", },
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wickerbottom_formal",
    skin_tags = { "FORMAL", "BASE", "WICKERBOTTOM", },
    skins = { ghost_skin = "ghost_wickerbottom_build" , normal_skin = "custom_wickerbottom_formal" , },
    torso_tuck_builds = { "custom_wickerbottom_formal", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wickerbottom_gladiator",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wickerbottom_gladiator.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wickerbottom_gladiator.dyn"),
    },
    base_prefab = "wickerbottom" ,
    build_name_override = "custom_wickerbottom_gladiator" ,
    feet_cuff_size = { wickerbottom_gladiator = 3, },
    has_alternate_for_body = { "custom_wickerbottom_gladiator", },
    has_alternate_for_skirt = { "custom_wickerbottom_gladiator", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wickerbottom_gladiator",
    skin_tags = { "LAVA", "BASE", "WICKERBOTTOM", },
    skins = { ghost_skin = "ghost_wickerbottom_build" , normal_skin = "custom_wickerbottom_gladiator" , },
    torso_tuck_builds = { "custom_wickerbottom_gladiator", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wickerbottom_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wickerbottom_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wickerbottom_ice.dyn"),
    },
    base_prefab = "wickerbottom" ,
    build_name_override = "custom_wickerbottom_ice" ,
    feet_cuff_size = { wickerbottom_ice = 3, },
    has_alternate_for_body = { "custom_wickerbottom_ice", },
    has_alternate_for_skirt = { "custom_wickerbottom_ice", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wickerbottom_ice",
    skin_tags = { "ICE", "BASE", "WICKERBOTTOM", },
    skins = { ghost_skin = "ghost_wickerbottom_build" , normal_skin = "custom_wickerbottom_ice" , },
    torso_tuck_builds = { "custom_wickerbottom_ice", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wickerbottom_lightninggoat",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wickerbottom_lightninggoat.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wickerbottom_lightninggoat.dyn"),
    },
    base_prefab = "wickerbottom" ,
    build_name_override = "custom_wickerbottom_lightninggoat" ,
    has_alternate_for_body = { "custom_wickerbottom_lightninggoat", },
    has_alternate_for_skirt = { "custom_wickerbottom_lightninggoat", },
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wickerbottom_lightninggoat",
    skin_tags = { "COSTUME", "BASE", "WICKERBOTTOM", },
    skins = { ghost_skin = "ghost_wickerbottom_build" , normal_skin = "custom_wickerbottom_lightninggoat" , },
    torso_tuck_builds = { "custom_wickerbottom_lightninggoat", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wickerbottom_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wickerbottom_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wickerbottom_lunar.dyn"),
    },
    base_prefab = "wickerbottom" ,
    build_name_override = "custom_wickerbottom_lunar" ,
    feet_cuff_size = { wickerbottom_lunar = 3, },
    has_alternate_for_body = { "custom_wickerbottom_lunar", },
    has_alternate_for_skirt = { "custom_wickerbottom_lunar", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wickerbottom_lunar",
    skin_tags = { "LUNAR", "BASE", "WICKERBOTTOM", },
    skins = { ghost_skin = "ghost_wickerbottom_build" , normal_skin = "custom_wickerbottom_lunar" , },
    torso_tuck_builds = { "custom_wickerbottom_lunar", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wickerbottom_magma",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wickerbottom_magma.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wickerbottom_magma.dyn"),
    },
    base_prefab = "wickerbottom" ,
    build_name_override = "custom_wickerbottom_magma" ,
    feet_cuff_size = { wickerbottom_magma = 3, },
    has_alternate_for_body = { "custom_wickerbottom_magma", },
    has_alternate_for_skirt = { "custom_wickerbottom_magma", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wickerbottom_magma",
    skin_tags = { "LAVA", "BASE", "WICKERBOTTOM", },
    skins = { ghost_skin = "ghost_wickerbottom_build" , normal_skin = "custom_wickerbottom_magma" , },
    torso_tuck_builds = { "custom_wickerbottom_magma", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wickerbottom_masquerade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wickerbottom_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wickerbottom_masquerade.dyn"),
    },
    base_prefab = "wickerbottom" ,
    build_name_override = "custom_wickerbottom_masquerade" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wickerbottom_masquerade",
    skin_tags = { "MASQUERADE", "BASE", "WICKERBOTTOM", },
    skins = { ghost_skin = "ghost_wickerbottom_build" , normal_skin = "custom_wickerbottom_masquerade" , },
    torso_tuck_builds = { "custom_wickerbottom_masquerade", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wickerbottom_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wickerbottom_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wickerbottom_nature.dyn"),
    },
    base_prefab = "wickerbottom" ,
    build_name_override = "custom_wickerbottom_nature" ,
    feet_cuff_size = { wickerbottom_nature = 3, },
    has_alternate_for_body = { "custom_wickerbottom_nature", },
    has_alternate_for_skirt = { "custom_wickerbottom_nature", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wickerbottom_nature",
    skin_tags = { "VARG", "BASE", "WICKERBOTTOM", },
    skins = { ghost_skin = "ghost_wickerbottom_build" , normal_skin = "custom_wickerbottom_nature" , },
    torso_tuck_builds = { "custom_wickerbottom_nature", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wickerbottom_ornate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wickerbottom_ornate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wickerbottom_ornate.dyn"),
    },
    base_prefab = "wickerbottom" ,
    build_name_override = "custom_wickerbottom_ornate" ,
    feet_cuff_size = { wickerbottom_ornate = 3, },
    has_alternate_for_body = { "custom_wickerbottom_ornate", },
    has_alternate_for_skirt = { "custom_wickerbottom_ornate", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wickerbottom_ornate",
    skin_tags = { "ORNATE", "BASE", "WICKERBOTTOM", },
    skins = { ghost_skin = "ghost_wickerbottom_build" , normal_skin = "custom_wickerbottom_ornate" , },
    torso_tuck_builds = { "custom_wickerbottom_ornate", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wickerbottom_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wickerbottom_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wickerbottom_rose.dyn"),
    },
    base_prefab = "wickerbottom" ,
    build_name_override = "custom_wickerbottom_rose" ,
    feet_cuff_size = { wickerbottom_rose = 3, },
    has_alternate_for_body = { "custom_wickerbottom_rose", },
    has_alternate_for_skirt = { "custom_wickerbottom_rose", },
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wickerbottom_rose",
    skin_tags = { "ROSE", "BASE", "WICKERBOTTOM", },
    skins = { ghost_skin = "ghost_wickerbottom_build" , normal_skin = "custom_wickerbottom_rose" , },
    torso_tuck_builds = { "custom_wickerbottom_rose", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wickerbottom_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wickerbottom_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wickerbottom_shadow.dyn"),
    },
    base_prefab = "wickerbottom" ,
    build_name_override = "custom_wickerbottom_shadow" ,
    feet_cuff_size = { wickerbottom_shadow = 3, },
    has_alternate_for_body = { "custom_wickerbottom_shadow", },
    has_alternate_for_skirt = { "custom_wickerbottom_shadow", },
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wickerbottom_shadow",
    skin_tags = { "SHADOW", "BASE", "WICKERBOTTOM", },
    skins = { ghost_skin = "ghost_wickerbottom_build" , normal_skin = "custom_wickerbottom_shadow" , },
    torso_tuck_builds = { "custom_wickerbottom_shadow", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wickerbottom_spiderwitch",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wickerbottom_spiderwitch.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wickerbottom_spiderwitch.dyn"),
    },
    base_prefab = "wickerbottom" ,
    build_name_override = "custom_wickerbottom_spiderwitch" ,
    feet_cuff_size = { wickerbottom_spiderwitch = 3, },
    has_alternate_for_body = { "custom_wickerbottom_spiderwitch", },
    has_alternate_for_skirt = { "custom_wickerbottom_spiderwitch", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wickerbottom_spiderwitch",
    skin_tags = { "HALLOWED", "BASE", "WICKERBOTTOM", },
    skins = { ghost_skin = "ghost_wickerbottom_build" , normal_skin = "custom_wickerbottom_spiderwitch" , },
    torso_tuck_builds = { "custom_wickerbottom_spiderwitch", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wickerbottom_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wickerbottom_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wickerbottom_survivor.dyn"),
    },
    base_prefab = "wickerbottom" ,
    build_name_override = "custom_wickerbottom_survivor" ,
    has_alternate_for_body = { "custom_wickerbottom_survivor", },
    has_alternate_for_skirt = { "custom_wickerbottom_survivor", },
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wickerbottom_survivor",
    skin_tags = { "SURVIVOR", "BASE", "WICKERBOTTOM", },
    skins = { ghost_skin = "ghost_wickerbottom_build" , normal_skin = "custom_wickerbottom_survivor" , },
    torso_tuck_builds = { "custom_wickerbottom_survivor", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wickerbottom_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wickerbottom_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wickerbottom_victorian.dyn"),
    },
    base_prefab = "wickerbottom" ,
    build_name_override = "custom_wickerbottom_victorian" ,
    feet_cuff_size = { wickerbottom_victorian = 3, },
    has_alternate_for_body = { "custom_wickerbottom_victorian", },
    has_alternate_for_skirt = { "custom_wickerbottom_victorian", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wickerbottom_victorian",
    skin_tags = { "VICTORIAN", "BASE", "WICKERBOTTOM", },
    skins = { ghost_skin = "ghost_wickerbottom_build" , normal_skin = "custom_wickerbottom_victorian" , },
    torso_tuck_builds = { "custom_wickerbottom_victorian", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wickerbottom_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wickerbottom_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wickerbottom_yule.dyn"),
    },
    base_prefab = "wickerbottom" ,
    build_name_override = "custom_wickerbottom_yule" ,
    feet_cuff_size = { wickerbottom_yule = 3, },
    has_alternate_for_body = { "custom_wickerbottom_yule", },
    has_alternate_for_skirt = { "custom_wickerbottom_yule", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wickerbottom_yule",
    skin_tags = { "YULE", "BASE", "WICKERBOTTOM", },
    skins = { ghost_skin = "ghost_wickerbottom_build" , normal_skin = "custom_wickerbottom_yule" , },
    torso_tuck_builds = { "custom_wickerbottom_yule", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_ancient.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_ancient" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "willow_ancient",
    skin_tags = { "ANCIENT", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_ancient" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_combatant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_combatant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_combatant.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_combatant" ,
    one_piece_skirt_builds = { "custom_willow_combatant", },
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "willow_combatant",
    skin_tags = { "LAVA", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_combatant" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_cook",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_cook.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_cook.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_cook" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "willow_cook",
    skin_tags = { "VICTORIAN", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_cook" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_dowdy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_dowdy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_dowdy.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_dowdy" ,
    one_piece_skirt_builds = { "custom_willow_dowdy", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "willow_dowdy",
    skin_tags = { "HALLOWED", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_dowdy" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_dragonfly",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_dragonfly.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_dragonfly.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_dragonfly" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "willow_dragonfly",
    skin_tags = { "COSTUME", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_dragonfly" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_formal.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_formal" ,
    marketable = true,
    one_piece_skirt_builds = { "custom_willow_formal", },
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "willow_formal",
    skin_tags = { "FORMAL", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_formal" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_gladiator",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_gladiator.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_gladiator.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_gladiator" ,
    one_piece_skirt_builds = { "custom_willow_gladiator", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "willow_gladiator",
    skin_tags = { "LAVA", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_gladiator" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_haunteddoll",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_haunteddoll.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_haunteddoll.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_haunteddoll" ,
    one_piece_skirt_builds = { "custom_willow_haunteddoll", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "willow_haunteddoll",
    skin_tags = { "HAUNTEDDOLL", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_haunteddoll" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_ice.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_ice" ,
    one_piece_skirt_builds = { "custom_willow_ice", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "willow_ice",
    skin_tags = { "ICE", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_ice" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_lunar.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_lunar" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "willow_lunar",
    skin_tags = { "LUNAR", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_lunar" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_magma",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_magma.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_magma.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_magma" ,
    one_piece_skirt_builds = { "custom_willow_magma", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "willow_magma",
    skin_tags = { "LAVA", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_magma" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_masquerade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_masquerade.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_masquerade" ,
    one_piece_skirt_builds = { "custom_willow_masquerade", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "willow_masquerade",
    skin_tags = { "MASQUERADE", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_masquerade" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_nature.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_nature" ,
    one_piece_skirt_builds = { "custom_willow_nature", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "willow_nature",
    skin_tags = { "VARG", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_nature" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_pirate.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_pirate" ,
    one_piece_skirt_builds = { "custom_willow_pirate", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "willow_pirate",
    skin_tags = { "PIRATE", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_pirate" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_rose.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_rose" ,
    marketable = true,
    one_piece_skirt_builds = { "custom_willow_rose", },
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "willow_rose",
    skin_tags = { "ROSE", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_rose" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_shadow.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_shadow" ,
    marketable = true,
    one_piece_skirt_builds = { "custom_willow_shadow", },
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "willow_shadow",
    skin_tags = { "SHADOW", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_shadow" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_survivor.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_survivor" ,
    marketable = true,
    one_piece_skirt_builds = { "custom_willow_survivor", },
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "willow_survivor",
    skin_tags = { "SURVIVOR", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_survivor" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_victorian.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_victorian" ,
    one_piece_skirt_builds = { "custom_willow_victorian", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "willow_victorian",
    skin_tags = { "VICTORIAN", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_victorian" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_willow_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_willow_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_willow_yule.dyn"),
    },
    base_prefab = "willow" ,
    build_name_override = "custom_willow_yule" ,
    one_piece_skirt_builds = { "custom_willow_yule", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "willow_yule",
    skin_tags = { "YULE", "BASE", "WILLOW", },
    skins = { ghost_skin = "ghost_willow_build" , normal_skin = "custom_willow_yule" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wilson_barber",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wilson_barber.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wilson_barber.dyn"),
    },
    base_prefab = "wilson" ,
    build_name_override = "custom_wilson_barber" ,
    linked_beard = "custom_wilson_beard_barber",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wilson_barber",
    skin_tags = { "BARBER", "BASE", "WILSON", },
    skins = { ghost_skin = "ghost_wilson_build" , normal_skin = "custom_wilson_barber" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wilson_combatant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wilson_combatant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wilson_combatant.dyn"),
    },
    base_prefab = "wilson" ,
    build_name_override = "custom_wilson_combatant" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wilson_combatant",
    skin_tags = { "LAVA", "BASE", "WILSON", },
    skins = { ghost_skin = "ghost_wilson_build" , normal_skin = "custom_wilson_combatant" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wilson_cook",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wilson_cook.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wilson_cook.dyn"),
    },
    base_prefab = "wilson" ,
    build_name_override = "custom_wilson_cook" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wilson_cook",
    skin_tags = { "VICTORIAN", "BASE", "WILSON", },
    skins = { ghost_skin = "ghost_wilson_build" , normal_skin = "custom_wilson_cook" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wilson_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wilson_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wilson_formal.dyn"),
    },
    base_prefab = "wilson" ,
    build_name_override = "custom_wilson_formal" ,
    linked_beard = "custom_wilson_beard_formal",
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wilson_formal",
    skin_tags = { "FORMAL", "BASE", "WILSON", },
    skins = { ghost_skin = "ghost_wilson_build" , normal_skin = "custom_wilson_formal" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wilson_gladiator",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wilson_gladiator.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wilson_gladiator.dyn"),
    },
    base_prefab = "wilson" ,
    build_name_override = "custom_wilson_gladiator" ,
    linked_beard = "custom_wilson_beard_gladiator",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wilson_gladiator",
    skin_tags = { "LAVA", "BASE", "WILSON", },
    skins = { ghost_skin = "ghost_wilson_build" , normal_skin = "custom_wilson_gladiator" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wilson_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wilson_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wilson_ice.dyn"),
    },
    base_prefab = "wilson" ,
    build_name_override = "custom_wilson_ice" ,
    linked_beard = "custom_wilson_beard_ice",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wilson_ice",
    skin_tags = { "ICE", "BASE", "WILSON", },
    skins = { ghost_skin = "ghost_wilson_build" , normal_skin = "custom_wilson_ice" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wilson_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wilson_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wilson_lunar.dyn"),
    },
    base_prefab = "wilson" ,
    build_name_override = "custom_wilson_lunar" ,
    linked_beard = "custom_wilson_beard_lunar",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wilson_lunar",
    skin_tags = { "LUNAR", "BASE", "WILSON", },
    skins = { ghost_skin = "ghost_wilson_build" , normal_skin = "custom_wilson_lunar" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wilson_madscience",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wilson_madscience.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wilson_madscience.dyn"),
    },
    base_prefab = "wilson" ,
    build_name_override = "custom_wilson_madscience" ,
    linked_beard = "custom_wilson_beard_madscience",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wilson_madscience",
    skin_tags = { "HALLOWED", "BASE", "WILSON", },
    skins = { ghost_skin = "ghost_wilson_build" , normal_skin = "custom_wilson_madscience" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wilson_magma",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wilson_magma.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wilson_magma.dyn"),
    },
    base_prefab = "wilson" ,
    build_name_override = "custom_wilson_magma" ,
    linked_beard = "custom_wilson_beard_magma",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wilson_magma",
    skin_tags = { "LAVA", "BASE", "WILSON", },
    skins = { ghost_skin = "ghost_wilson_build" , normal_skin = "custom_wilson_magma" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wilson_masquerade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wilson_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wilson_masquerade.dyn"),
    },
    base_prefab = "wilson" ,
    build_name_override = "custom_wilson_masquerade" ,
    linked_beard = "custom_wilson_beard_masquerade",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wilson_masquerade",
    skin_tags = { "MASQUERADE", "BASE", "WILSON", },
    skins = { ghost_skin = "ghost_wilson_build" , normal_skin = "custom_wilson_masquerade" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wilson_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wilson_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wilson_nature.dyn"),
    },
    base_prefab = "wilson" ,
    build_name_override = "custom_wilson_nature" ,
    linked_beard = "custom_wilson_beard_nature",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wilson_nature",
    skin_tags = { "VARG", "BASE", "WILSON", },
    skins = { ghost_skin = "ghost_wilson_build" , normal_skin = "custom_wilson_nature" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wilson_pigguard",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wilson_pigguard.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wilson_pigguard.dyn"),
    },
    base_prefab = "wilson" ,
    build_name_override = "custom_wilson_pigguard" ,
    linked_beard = "custom_wilson_beard_pigguard",
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wilson_pigguard",
    skin_tags = { "COSTUME", "BASE", "WILSON", },
    skins = { ghost_skin = "ghost_wilson_build" , normal_skin = "custom_wilson_pigguard" , },
    torso_tuck_builds = { "custom_wilson_pigguard", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wilson_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wilson_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wilson_pirate.dyn"),
    },
    base_prefab = "wilson" ,
    build_name_override = "custom_wilson_pirate" ,
    linked_beard = "custom_wilson_beard_pirate",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wilson_pirate",
    skin_tags = { "PIRATE", "BASE", "WILSON", },
    skins = { ghost_skin = "ghost_wilson_build" , normal_skin = "custom_wilson_pirate" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wilson_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wilson_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wilson_rose.dyn"),
    },
    base_prefab = "wilson" ,
    build_name_override = "custom_wilson_rose" ,
    linked_beard = "custom_wilson_beard_rose",
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wilson_rose",
    skin_tags = { "ROSE", "BASE", "WILSON", },
    skins = { ghost_skin = "ghost_wilson_build" , normal_skin = "custom_wilson_rose" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wilson_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wilson_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wilson_shadow.dyn"),
    },
    base_prefab = "wilson" ,
    build_name_override = "custom_wilson_shadow" ,
    linked_beard = "custom_wilson_beard_shadow",
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wilson_shadow",
    skin_tags = { "SHADOW", "BASE", "WILSON", },
    skins = { ghost_skin = "ghost_wilson_build" , normal_skin = "custom_wilson_shadow" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wilson_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wilson_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wilson_survivor.dyn"),
    },
    base_prefab = "wilson" ,
    build_name_override = "custom_wilson_survivor" ,
    linked_beard = "custom_wilson_beard_survivor",
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wilson_survivor",
    skin_tags = { "SURVIVOR", "BASE", "WILSON", },
    skins = { ghost_skin = "ghost_wilson_build" , normal_skin = "custom_wilson_survivor" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wilson_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wilson_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wilson_victorian.dyn"),
    },
    base_prefab = "wilson" ,
    build_name_override = "custom_wilson_victorian" ,
    linked_beard = "custom_wilson_beard_victorian",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wilson_victorian",
    skin_tags = { "VICTORIAN", "BASE", "WILSON", },
    skins = { ghost_skin = "ghost_wilson_build" , normal_skin = "custom_wilson_victorian" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wilson_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wilson_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wilson_yule.dyn"),
    },
    base_prefab = "wilson" ,
    build_name_override = "custom_wilson_yule" ,
    linked_beard = "custom_wilson_beard_yule",
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wilson_yule",
    skin_tags = { "YULE", "BASE", "WILSON", },
    skins = { ghost_skin = "ghost_wilson_build" , normal_skin = "custom_wilson_yule" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winch_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winch_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winch_pirate.dyn"),
    },
    base_prefab = "winch" ,
    build_name_override = "custom_winch_pirate" ,
    init_fn = function(inst) winch_init_fn(inst, "custom_winch_pirate") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WINCH", "PIRATE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_ancient.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_ancient" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "winona_ancient",
    skin_tags = { "ANCIENT", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_ancient" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_catapult_fancy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_catapult_fancy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_catapult_fancy.dyn"),
    },
    base_prefab = "winona_catapult" ,
    build_name_override = "custom_winona_catapult_fancy" ,
    granted_items = { "custom_winona_catapult_item_fancy" , },
    init_fn = function(inst) winona_catapult_init_fn(inst, "custom_winona_catapult_fancy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WINONA_CATAPULT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_catapult_item_fancy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_catapult_fancy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_catapult_fancy.dyn"),
    },
    base_prefab = "winona_catapult_item" ,
    build_name_override = "custom_winona_catapult_fancy" ,
    init_fn = function(inst) winona_catapult_item_init_fn(inst, "custom_winona_catapult_fancy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WINONA_CATAPULT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_catapult_item_spike",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_catapult_spike.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_catapult_spike.dyn"),
    },
    base_prefab = "winona_catapult_item" ,
    build_name_override = "custom_winona_catapult_spike" ,
    init_fn = function(inst) winona_catapult_item_init_fn(inst, "custom_winona_catapult_spike") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WINONA_CATAPULT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_catapult_spike",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_catapult_spike.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_catapult_spike.dyn"),
    },
    base_prefab = "winona_catapult" ,
    build_name_override = "custom_winona_catapult_spike" ,
    granted_items = { "custom_winona_catapult_item_spike" , },
    init_fn = function(inst) winona_catapult_init_fn(inst, "custom_winona_catapult_spike") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WINONA_CATAPULT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_combatant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_combatant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_combatant.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_combatant" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "winona_combatant",
    skin_tags = { "LAVA", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_combatant" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_cook",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_cook.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_cook.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_cook" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "winona_cook",
    skin_tags = { "VICTORIAN", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_cook" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_factory",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_factory.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_factory.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_factory" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "winona_factory",
    skin_tags = { "NEXTKIN", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_factory" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_formal.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_formal" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "winona_formal",
    skin_tags = { "FORMAL", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_formal" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_frankenstein",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_frankenstein.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_frankenstein.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_frankenstein" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "winona_frankenstein",
    skin_tags = { "HALLOWED", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_frankenstein" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_gladiator",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_gladiator.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_gladiator.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_gladiator" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "winona_gladiator",
    skin_tags = { "LAVA", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_gladiator" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_grassgecko",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_grassgecko.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_grassgecko.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_grassgecko" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "winona_grassgecko",
    skin_tags = { "COSTUME", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_grassgecko" , },
    torso_tuck_builds = { "custom_winona_grassgecko", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_ice.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_ice" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "winona_ice",
    skin_tags = { "ICE", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_ice" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_lunar.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_lunar" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "winona_lunar",
    skin_tags = { "LUNAR", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_lunar" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_magma",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_magma.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_magma.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_magma" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "winona_magma",
    skin_tags = { "LAVA", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_magma" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_masquerade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_masquerade.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_masquerade" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "winona_masquerade",
    skin_tags = { "MASQUERADE", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_masquerade" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_nature.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_nature" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "winona_nature",
    skin_tags = { "VARG", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_nature" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_pirate.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_pirate" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "winona_pirate",
    skin_tags = { "PIRATE", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_pirate" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_rose.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_rose" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "winona_rose",
    skin_tags = { "ROSE", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_rose" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_shadow.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_shadow" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "winona_shadow",
    skin_tags = { "SHADOW", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_shadow" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_spotlight_fancy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_spotlight_fancy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_spotlight_fancy.dyn"),
    },
    base_prefab = "winona_spotlight" ,
    build_name_override = "custom_winona_spotlight_fancy" ,
    granted_items = { "custom_winona_spotlight_item_fancy" , },
    init_fn = function(inst) winona_spotlight_init_fn(inst, "custom_winona_spotlight_fancy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WINONA_SPOTLIGHT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_spotlight_item_fancy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_spotlight_fancy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_spotlight_fancy.dyn"),
    },
    base_prefab = "winona_spotlight_item" ,
    build_name_override = "custom_winona_spotlight_fancy" ,
    init_fn = function(inst) winona_spotlight_item_init_fn(inst, "custom_winona_spotlight_fancy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WINONA_SPOTLIGHT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_spotlight_item_spike",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_spotlight_spike.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_spotlight_spike.dyn"),
    },
    base_prefab = "winona_spotlight_item" ,
    build_name_override = "custom_winona_spotlight_spike" ,
    init_fn = function(inst) winona_spotlight_item_init_fn(inst, "custom_winona_spotlight_spike") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WINONA_SPOTLIGHT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_spotlight_spike",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_spotlight_spike.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_spotlight_spike.dyn"),
    },
    base_prefab = "winona_spotlight" ,
    build_name_override = "custom_winona_spotlight_spike" ,
    granted_items = { "custom_winona_spotlight_item_spike" , },
    init_fn = function(inst) winona_spotlight_init_fn(inst, "custom_winona_spotlight_spike") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WINONA_SPOTLIGHT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_survivor.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_survivor" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "winona_survivor",
    skin_tags = { "SURVIVOR", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_survivor" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_victorian.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_victorian" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "winona_victorian",
    skin_tags = { "VICTORIAN", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_victorian" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_wrestler",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_wrestler.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_wrestler.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_wrestler" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "winona_wrestler",
    skin_tags = { "YOTP", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_wrestler" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winona_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winona_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winona_yule.dyn"),
    },
    base_prefab = "winona" ,
    build_name_override = "custom_winona_yule" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "winona_yule",
    skin_tags = { "YULE", "BASE", "WINONA", },
    skins = { ghost_skin = "ghost_winona_build" , normal_skin = "custom_winona_yule" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_winonabattery_high_fancy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winonabattery_high_fancy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winonabattery_high_fancy.dyn"),
    },
    base_prefab = "winona_battery_high" ,
    build_name_override = "custom_winonabattery_high_fancy" ,
    granted_items = { "custom_winonabattery_high_item_fancy" , },
    init_fn = function(inst) winona_battery_high_init_fn(inst, "custom_winonabattery_high_fancy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WINONA_BATTERY_HIGH", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winonabattery_high_item_fancy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winonabattery_high_fancy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winonabattery_high_fancy.dyn"),
    },
    base_prefab = "winona_battery_high_item" ,
    build_name_override = "custom_winonabattery_high_fancy" ,
    init_fn = function(inst) winona_battery_high_item_init_fn(inst, "custom_winonabattery_high_fancy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WINONA_BATTERY_HIGH", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winonabattery_high_item_spike",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winonabattery_high_spike.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winonabattery_high_spike.dyn"),
    },
    base_prefab = "winona_battery_high_item" ,
    build_name_override = "custom_winonabattery_high_spike" ,
    init_fn = function(inst) winona_battery_high_item_init_fn(inst, "custom_winonabattery_high_spike") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WINONA_BATTERY_HIGH", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winonabattery_high_spike",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winonabattery_high_spike.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winonabattery_high_spike.dyn"),
    },
    base_prefab = "winona_battery_high" ,
    build_name_override = "custom_winonabattery_high_spike" ,
    granted_items = { "custom_winonabattery_high_item_spike" , },
    init_fn = function(inst) winona_battery_high_init_fn(inst, "custom_winonabattery_high_spike") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WINONA_BATTERY_HIGH", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winonabattery_low_fancy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winonabattery_low_fancy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winonabattery_low_fancy.dyn"),
    },
    base_prefab = "winona_battery_low" ,
    build_name_override = "custom_winonabattery_low_fancy" ,
    granted_items = { "custom_winonabattery_low_item_fancy" , },
    init_fn = function(inst) winona_battery_low_init_fn(inst, "custom_winonabattery_low_fancy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WINONA_BATTERY_LOW", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winonabattery_low_item_fancy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winonabattery_low_fancy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winonabattery_low_fancy.dyn"),
    },
    base_prefab = "winona_battery_low_item" ,
    build_name_override = "custom_winonabattery_low_fancy" ,
    init_fn = function(inst) winona_battery_low_item_init_fn(inst, "custom_winonabattery_low_fancy") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WINONA_BATTERY_LOW", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winonabattery_low_item_spike",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winonabattery_low_spike.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winonabattery_low_spike.dyn"),
    },
    base_prefab = "winona_battery_low_item" ,
    build_name_override = "custom_winonabattery_low_spike" ,
    init_fn = function(inst) winona_battery_low_item_init_fn(inst, "custom_winonabattery_low_spike") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WINONA_BATTERY_LOW", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winonabattery_low_spike",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winonabattery_low_spike.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winonabattery_low_spike.dyn"),
    },
    base_prefab = "winona_battery_low" ,
    build_name_override = "custom_winonabattery_low_spike" ,
    granted_items = { "custom_winonabattery_low_item_spike" , },
    init_fn = function(inst) winona_battery_low_init_fn(inst, "custom_winonabattery_low_spike") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WINONA_BATTERY_LOW", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winterhat_black_davys",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winterhat_black_davys.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winterhat_black_davys.dyn"),
    },
    base_prefab = "winterhat" ,
    build_name_override = "custom_winterhat_black_davys" ,
    init_fn = function(inst) winterhat_init_fn(inst, "custom_winterhat_black_davys") end,
    rarity = "ProofOfPurchase",
    release_group = groupid,
    skin_tags = { "WINTERHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winterhat_fancy_puppy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winterhat_fancy_puppy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winterhat_fancy_puppy.dyn"),
    },
    base_prefab = "winterhat" ,
    build_name_override = "custom_winterhat_fancy_puppy" ,
    init_fn = function(inst) winterhat_init_fn(inst, "custom_winterhat_fancy_puppy") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "WINTERHAT", "VARG", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winterhat_pink_hibiscus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winterhat_pink_hibiscus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winterhat_pink_hibiscus.dyn"),
    },
    base_prefab = "winterhat" ,
    build_name_override = "custom_winterhat_pink_hibiscus" ,
    init_fn = function(inst) winterhat_init_fn(inst, "custom_winterhat_pink_hibiscus") end,
    rarity = "ProofOfPurchase",
    release_group = groupid,
    skin_tags = { "WINTERHAT", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winterhat_plum_pudding",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winterhat_plum_pudding.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winterhat_plum_pudding.dyn"),
    },
    base_prefab = "winterhat" ,
    build_name_override = "custom_winterhat_plum_pudding" ,
    init_fn = function(inst) winterhat_init_fn(inst, "custom_winterhat_plum_pudding") end,
    rarity = "Event",
    release_group = groupid,
    skin_tags = { "WINTERHAT", "WINTER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winterhat_rooster",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winterhat_rooster.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winterhat_rooster.dyn"),
    },
    base_prefab = "winterhat" ,
    build_name_override = "custom_winterhat_rooster" ,
    init_fn = function(inst) winterhat_init_fn(inst, "custom_winterhat_rooster") end,
    rarity = "Timeless",
    release_group = groupid,
    skin_tags = { "WINTERHAT", "LUNAR_NY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winterhat_stocking_cap_green_forest",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winterhat_stocking_cap_green_forest.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winterhat_stocking_cap_green_forest.dyn"),
    },
    base_prefab = "winterhat" ,
    build_name_override = "custom_winterhat_stocking_cap_green_forest" ,
    init_fn = function(inst) winterhat_init_fn(inst, "custom_winterhat_stocking_cap_green_forest") end,
    marketable = true,
    rarity = "Spiffy",
    release_group = groupid,
    skin_tags = { "WINTERHAT", "WINTER", "CRAFTABLE", "GREEN", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_winterometer_circus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_winterometer_circus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_winterometer_circus.dyn"),
    },
    base_prefab = "winterometer" ,
    build_name_override = "custom_winterometer_circus" ,
    init_fn = function(inst) winterometer_init_fn(inst, "custom_winterometer_circus") end,
    rarity = "Loyal",
    release_group = groupid,
    skin_tags = { "WINTEROMETER", "CIRCUS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_woby_big_baddog",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woby_big_baddog.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woby_big_baddog.dyn"),
    },
    base_prefab = "wobybig" ,
    build_name_override = "custom_woby_big_baddog" ,
    init_fn = function(inst) wobybig_init_fn(inst, "custom_woby_big_baddog") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_woby_big_baddog_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woby_big_baddog_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woby_big_baddog_lunar.dyn"),
    },
    base_prefab = "wobybig" ,
    build_name_override = "custom_woby_big_baddog_lunar" ,
    init_fn = function(inst) wobybig_init_fn(inst, "custom_woby_big_baddog_lunar") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_woby_big_baddog_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woby_big_baddog_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woby_big_baddog_shadow.dyn"),
    },
    base_prefab = "wobybig" ,
    build_name_override = "custom_woby_big_baddog_shadow" ,
    init_fn = function(inst) wobybig_init_fn(inst, "custom_woby_big_baddog_shadow") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_woby_big_ribbon",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woby_big_ribbon.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woby_big_ribbon.dyn"),
    },
    base_prefab = "wobybig" ,
    build_name_override = "custom_woby_big_ribbon" ,
    init_fn = function(inst) wobybig_init_fn(inst, "custom_woby_big_ribbon") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_woby_big_ribbon_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woby_big_ribbon_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woby_big_ribbon_lunar.dyn"),
    },
    base_prefab = "wobybig" ,
    build_name_override = "custom_woby_big_ribbon_lunar" ,
    init_fn = function(inst) wobybig_init_fn(inst, "custom_woby_big_ribbon_lunar") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_woby_big_ribbon_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woby_big_ribbon_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woby_big_ribbon_shadow.dyn"),
    },
    base_prefab = "wobybig" ,
    build_name_override = "custom_woby_big_ribbon_shadow" ,
    init_fn = function(inst) wobybig_init_fn(inst, "custom_woby_big_ribbon_shadow") end,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_ancient.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_ancient.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_ancient.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_ancient" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_ancient",
    skin_tags = { "ANCIENT", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_ancient" , normal_skin = "custom_wolfgang_ancient" , wimpy_skin = "custom_wolfgang_skinny_ancient" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_combatant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_combatant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_combatant.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_combatant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_combatant.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_combatant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_combatant.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_combatant" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_combatant",
    skin_tags = { "LAVA", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_combatant" , normal_skin = "custom_wolfgang_combatant" , wimpy_skin = "custom_wolfgang_skinny_combatant" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_cook",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_cook.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_cook.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_cook.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_cook.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_cook.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_cook.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_cook" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_cook",
    skin_tags = { "VICTORIAN", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_cook" , normal_skin = "custom_wolfgang_cook" , wimpy_skin = "custom_wolfgang_skinny_cook" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_formal.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_formal.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_formal.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_formal" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_formal",
    skin_tags = { "FORMAL", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_formal" , normal_skin = "custom_wolfgang_formal" , wimpy_skin = "custom_wolfgang_skinny_formal" , },
    torso_tuck_builds = { "custom_wolfgang_formal", "custom_wolfgang_skinny_formal", "custom_wolfgang_mighty_formal", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_gladiator",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_gladiator.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_gladiator.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_gladiator.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_gladiator.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_gladiator.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_gladiator.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_gladiator" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_gladiator",
    skin_tags = { "LAVA", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_gladiator" , normal_skin = "custom_wolfgang_gladiator" , wimpy_skin = "custom_wolfgang_skinny_gladiator" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_ice.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_ice.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_ice.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_ice" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_ice",
    skin_tags = { "ICE", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_ice" , normal_skin = "custom_wolfgang_ice" , wimpy_skin = "custom_wolfgang_skinny_ice" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_lunar.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_lunar.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_lunar.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_lunar" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_lunar",
    skin_tags = { "LUNAR", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_lunar" , normal_skin = "custom_wolfgang_lunar" , wimpy_skin = "custom_wolfgang_skinny_lunar" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_magma",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_magma.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_magma.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_magma.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_magma.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_magma.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_magma.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_magma" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_magma",
    skin_tags = { "LAVA", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_magma" , normal_skin = "custom_wolfgang_magma" , wimpy_skin = "custom_wolfgang_skinny_magma" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_nature.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_nature.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_nature.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_nature" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_nature",
    skin_tags = { "VARG", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_nature" , normal_skin = "custom_wolfgang_nature" , wimpy_skin = "custom_wolfgang_skinny_nature" , },
    torso_tuck_builds = { "custom_wolfgang_nature", "custom_wolfgang_skinny_nature", "custom_wolfgang_mighty_nature", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_pirate.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_pirate.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_pirate.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_pirate" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_pirate",
    skin_tags = { "PIRATE", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_pirate" , normal_skin = "custom_wolfgang_pirate" , wimpy_skin = "custom_wolfgang_skinny_pirate" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_rose.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_rose.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_rose.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_rose" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_rose",
    skin_tags = { "ROSE", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_rose" , normal_skin = "custom_wolfgang_rose" , wimpy_skin = "custom_wolfgang_skinny_rose" , },
    torso_tuck_builds = { "custom_wolfgang_rose", "custom_wolfgang_skinny_rose", "custom_wolfgang_mighty_rose", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_shadow.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_shadow.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_shadow.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_shadow" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_shadow",
    skin_tags = { "SHADOW", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_shadow" , normal_skin = "custom_wolfgang_shadow" , wimpy_skin = "custom_wolfgang_skinny_shadow" , },
    torso_tuck_builds = { "custom_wolfgang_shadow", "custom_wolfgang_skinny_shadow", "custom_wolfgang_mighty_shadow", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_strongman",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_strongman.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_strongman.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_strongman.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_strongman.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_strongman.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_strongman.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_strongman" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_strongman",
    skin_tags = { "STRONGMAN", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_strongman" , normal_skin = "custom_wolfgang_strongman" , wimpy_skin = "custom_wolfgang_skinny_strongman" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_survivor.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_survivor.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_survivor.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_survivor" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_survivor",
    skin_tags = { "SURVIVOR", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_survivor" , normal_skin = "custom_wolfgang_survivor" , wimpy_skin = "custom_wolfgang_skinny_survivor" , },
    torso_tuck_builds = { "custom_wolfgang_survivor", "custom_wolfgang_skinny_survivor", "custom_wolfgang_mighty_survivor", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_victorian.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_victorian.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_victorian.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_victorian" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_victorian",
    skin_tags = { "VICTORIAN", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_victorian" , normal_skin = "custom_wolfgang_victorian" , wimpy_skin = "custom_wolfgang_skinny_victorian" , },
    torso_tuck_builds = { "custom_wolfgang_victorian", "custom_wolfgang_victorian", "custom_wolfgang_mighty_victorian", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_walrus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_walrus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_walrus.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_walrus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_walrus.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_walrus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_walrus.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_walrus" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_walrus",
    skin_tags = { "COSTUME", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_walrus" , normal_skin = "custom_wolfgang_walrus" , wimpy_skin = "custom_wolfgang_skinny_walrus" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_wolfman",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_wolfman.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_wolfman.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_wolfman.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_wolfman.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_wolfman.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_wolfman.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_wolfman" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_wolfman",
    skin_tags = { "HALLOWED", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_wolfman" , normal_skin = "custom_wolfgang_wolfman" , wimpy_skin = "custom_wolfgang_skinny_wolfman" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_wrestler",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_wrestler.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_wrestler.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_wrestler.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_wrestler.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_wrestler.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_wrestler.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_wrestler" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_wrestler",
    skin_tags = { "YOTP", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_wrestler" , normal_skin = "custom_wolfgang_wrestler" , wimpy_skin = "custom_wolfgang_skinny_wrestler" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wolfgang_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_mighty_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_mighty_yule.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_yule.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wolfgang_skinny_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wolfgang_skinny_yule.dyn"),
    },
    base_prefab = "wolfgang" ,
    build_name_override = "custom_wolfgang_yule" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wolfgang_yule",
    skin_tags = { "YULE", "BASE", "WOLFGANG", },
    skins = { ghost_skin = "ghost_wolfgang_build" , mighty_skin = "custom_wolfgang_mighty_yule" , normal_skin = "custom_wolfgang_yule" , wimpy_skin = "custom_wolfgang_skinny_yule" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wood_chair_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wood_chair_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wood_chair_fantasy.dyn"),
    },
    base_prefab = "wood_chair" ,
    build_name_override = "custom_wood_chair_fantasy" ,
    init_fn = function(inst) wood_chair_init_fn(inst, "custom_wood_chair_fantasy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WOOD_CHAIR", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wood_chair_hallowed",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wood_chair_hallowed.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wood_chair_hallowed.dyn"),
    },
    base_prefab = "wood_chair" ,
    build_name_override = "custom_wood_chair_hallowed" ,
    init_fn = function(inst) wood_chair_init_fn(inst, "custom_wood_chair_hallowed") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WOOD_CHAIR", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wood_chair_handmade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wood_chair_handmade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wood_chair_handmade.dyn"),
    },
    base_prefab = "wood_chair" ,
    build_name_override = "custom_wood_chair_handmade" ,
    init_fn = function(inst) wood_chair_init_fn(inst, "custom_wood_chair_handmade") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WOOD_CHAIR", "BUILDERS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wood_chair_western",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wood_chair_western.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wood_chair_western.dyn"),
    },
    base_prefab = "wood_chair" ,
    build_name_override = "custom_wood_chair_western" ,
    init_fn = function(inst) wood_chair_init_fn(inst, "custom_wood_chair_western") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WOOD_CHAIR", "WESTERN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wood_table_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wood_table_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wood_table_fantasy.dyn"),
    },
    base_prefab = "wood_table_square" ,
    build_name_override = "custom_wood_table_fantasy" ,
    init_fn = function(inst) wood_table_square_init_fn(inst, "custom_wood_table_fantasy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WOOD_TABLE_SQUARE", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wood_table_hallowed",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wood_table_hallowed.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wood_table_hallowed.dyn"),
    },
    base_prefab = "wood_table_square" ,
    build_name_override = "custom_wood_table_hallowed" ,
    init_fn = function(inst) wood_table_square_init_fn(inst, "custom_wood_table_hallowed") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WOOD_TABLE_SQUARE", "HALLOWED", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wood_table_handmade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wood_table_handmade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wood_table_handmade.dyn"),
    },
    base_prefab = "wood_table_square" ,
    build_name_override = "custom_wood_table_handmade" ,
    init_fn = function(inst) wood_table_square_init_fn(inst, "custom_wood_table_handmade") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WOOD_TABLE_SQUARE", "BUILDERS", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wood_table_western",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wood_table_western.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wood_table_western.dyn"),
    },
    base_prefab = "wood_table_square" ,
    build_name_override = "custom_wood_table_western" ,
    init_fn = function(inst) wood_table_square_init_fn(inst, "custom_wood_table_western") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WOOD_TABLE_SQUARE", "WESTERN", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_woodie_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weremoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woodie_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woodie_ancient.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weremoose_build.dyn"),
    },
    base_prefab = "woodie" ,
    build_name_override = "custom_woodie_ancient" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "woodie_ancient",
    skin_tags = { "ANCIENT", "BASE", "WOODIE", },
    skins = { ghost_skin = "ghost_woodie_build" , ghost_werebeaver_skin = "custom_ghost_werebeaver_build" , ghost_weregoose_skin = "custom_ghost_weregoose_build" , ghost_weremoose_skin = "custom_ghost_weremoose_build" , normal_skin = "custom_woodie_ancient" , werebeaver_skin = "custom_werebeaver_build" , weregoose_skin = "custom_weregoose_build" , weremoose_skin = "custom_weremoose_build" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_woodie_combatant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weremoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woodie_combatant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woodie_combatant.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weremoose_build.dyn"),
    },
    base_prefab = "woodie" ,
    build_name_override = "custom_woodie_combatant" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "woodie_combatant",
    skin_tags = { "LAVA", "BASE", "WOODIE", },
    skins = { ghost_skin = "ghost_woodie_build" , ghost_werebeaver_skin = "custom_ghost_werebeaver_build" , ghost_weregoose_skin = "custom_ghost_weregoose_build" , ghost_weremoose_skin = "custom_ghost_weremoose_build" , normal_skin = "custom_woodie_combatant" , werebeaver_skin = "custom_werebeaver_build" , weregoose_skin = "custom_weregoose_build" , weremoose_skin = "custom_weremoose_build" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_woodie_cook",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weremoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woodie_cook.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woodie_cook.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weremoose_build.dyn"),
    },
    base_prefab = "woodie" ,
    build_name_override = "custom_woodie_cook" ,
    feet_cuff_size = { woodie_cook = 3, },
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "woodie_cook",
    skin_tags = { "VICTORIAN", "BASE", "WOODIE", },
    skins = { ghost_skin = "ghost_woodie_build" , ghost_werebeaver_skin = "custom_ghost_werebeaver_build" , ghost_weregoose_skin = "custom_ghost_weregoose_build" , ghost_weremoose_skin = "custom_ghost_weremoose_build" , normal_skin = "custom_woodie_cook" , werebeaver_skin = "custom_werebeaver_build" , weregoose_skin = "custom_weregoose_build" , weremoose_skin = "custom_weremoose_build" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_woodie_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weremoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woodie_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woodie_formal.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weremoose_build.dyn"),
    },
    base_prefab = "woodie" ,
    build_name_override = "custom_woodie_formal" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "woodie_formal",
    skin_tags = { "FORMAL", "BASE", "WOODIE", },
    skins = { ghost_skin = "ghost_woodie_build" , ghost_werebeaver_skin = "custom_ghost_werebeaver_build" , ghost_weregoose_skin = "custom_ghost_weregoose_build" , ghost_weremoose_skin = "custom_ghost_weremoose_build" , normal_skin = "custom_woodie_formal" , werebeaver_skin = "custom_werebeaver_build" , weregoose_skin = "custom_weregoose_build" , weremoose_skin = "custom_weremoose_build" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_woodie_gladiator",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weremoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woodie_gladiator.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woodie_gladiator.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weremoose_build.dyn"),
    },
    base_prefab = "woodie" ,
    build_name_override = "custom_woodie_gladiator" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "woodie_gladiator",
    skin_tags = { "LAVA", "BASE", "WOODIE", },
    skins = { ghost_skin = "ghost_woodie_build" , ghost_werebeaver_skin = "custom_ghost_werebeaver_build" , ghost_weregoose_skin = "custom_ghost_weregoose_build" , ghost_weremoose_skin = "custom_ghost_weremoose_build" , normal_skin = "custom_woodie_gladiator" , werebeaver_skin = "custom_werebeaver_build" , weregoose_skin = "custom_weregoose_build" , weremoose_skin = "custom_weremoose_build" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_woodie_hippie",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weremoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woodie_hippie.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woodie_hippie.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weremoose_build.dyn"),
    },
    base_prefab = "woodie" ,
    build_name_override = "custom_woodie_hippie" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "woodie_hippie",
    skin_tags = { "HALLOWED", "BASE", "WOODIE", },
    skins = { ghost_skin = "ghost_woodie_build" , ghost_werebeaver_skin = "custom_ghost_werebeaver_build" , ghost_weregoose_skin = "custom_ghost_weregoose_build" , ghost_weremoose_skin = "custom_ghost_weremoose_build" , normal_skin = "custom_woodie_hippie" , werebeaver_skin = "custom_werebeaver_build" , weregoose_skin = "custom_weregoose_build" , weremoose_skin = "custom_weremoose_build" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_woodie_hockey",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weremoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woodie_hockey.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woodie_hockey.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weremoose_build.dyn"),
    },
    base_prefab = "woodie" ,
    build_name_override = "custom_woodie_hockey" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "woodie_hockey",
    skin_tags = { "HOCKEY", "BASE", "WOODIE", },
    skins = { ghost_skin = "ghost_woodie_build" , ghost_werebeaver_skin = "custom_ghost_werebeaver_build" , ghost_weregoose_skin = "custom_ghost_weregoose_build" , ghost_weremoose_skin = "custom_ghost_weremoose_build" , normal_skin = "custom_woodie_hockey" , werebeaver_skin = "custom_werebeaver_build" , weregoose_skin = "custom_weregoose_build" , weremoose_skin = "custom_weremoose_build" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_woodie_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weremoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woodie_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woodie_ice.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weremoose_build.dyn"),
    },
    base_prefab = "woodie" ,
    build_name_override = "custom_woodie_ice" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "woodie_ice",
    skin_tags = { "ICE", "BASE", "WOODIE", },
    skins = { ghost_skin = "ghost_woodie_build" , ghost_werebeaver_skin = "custom_ghost_werebeaver_build" , ghost_weregoose_skin = "custom_ghost_weregoose_build" , ghost_weremoose_skin = "custom_ghost_weremoose_build" , normal_skin = "custom_woodie_ice" , werebeaver_skin = "custom_werebeaver_build" , weregoose_skin = "custom_weregoose_build" , weremoose_skin = "custom_weremoose_build" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_woodie_magma",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weremoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woodie_magma.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woodie_magma.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weremoose_build.dyn"),
    },
    base_prefab = "woodie" ,
    build_name_override = "custom_woodie_magma" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "woodie_magma",
    skin_tags = { "LAVA", "BASE", "WOODIE", },
    skins = { ghost_skin = "ghost_woodie_build" , ghost_werebeaver_skin = "custom_ghost_werebeaver_build" , ghost_weregoose_skin = "custom_ghost_weregoose_build" , ghost_weremoose_skin = "custom_ghost_weremoose_build" , normal_skin = "custom_woodie_magma" , werebeaver_skin = "custom_werebeaver_build" , weregoose_skin = "custom_weregoose_build" , weremoose_skin = "custom_weremoose_build" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_woodie_masquerade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weremoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woodie_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woodie_masquerade.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weremoose_build.dyn"),
    },
    base_prefab = "woodie" ,
    build_name_override = "custom_woodie_masquerade" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "woodie_masquerade",
    skin_tags = { "MASQUERADE", "BASE", "WOODIE", },
    skins = { ghost_skin = "ghost_woodie_build" , ghost_werebeaver_skin = "custom_ghost_werebeaver_build" , ghost_weregoose_skin = "custom_ghost_weregoose_build" , ghost_weremoose_skin = "custom_ghost_weremoose_build" , normal_skin = "custom_woodie_masquerade" , werebeaver_skin = "custom_werebeaver_build" , weregoose_skin = "custom_weregoose_build" , weremoose_skin = "custom_weremoose_build" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_woodie_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weremoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woodie_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woodie_nature.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weremoose_build.dyn"),
    },
    base_prefab = "woodie" ,
    build_name_override = "custom_woodie_nature" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "woodie_nature",
    skin_tags = { "VARG", "BASE", "WOODIE", },
    skins = { ghost_skin = "ghost_woodie_build" , ghost_werebeaver_skin = "custom_ghost_werebeaver_build" , ghost_weregoose_skin = "custom_ghost_weregoose_build" , ghost_weremoose_skin = "custom_ghost_weremoose_build" , normal_skin = "custom_woodie_nature" , werebeaver_skin = "custom_werebeaver_build" , weregoose_skin = "custom_weregoose_build" , weremoose_skin = "custom_weremoose_build" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_woodie_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weremoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woodie_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woodie_pirate.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weremoose_build.dyn"),
    },
    base_prefab = "woodie" ,
    build_name_override = "custom_woodie_pirate" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "woodie_pirate",
    skin_tags = { "PIRATE", "BASE", "WOODIE", },
    skins = { ghost_skin = "ghost_woodie_build" , ghost_werebeaver_skin = "custom_ghost_werebeaver_build" , ghost_weregoose_skin = "custom_ghost_weregoose_build" , ghost_weremoose_skin = "custom_ghost_weremoose_build" , normal_skin = "custom_woodie_pirate" , werebeaver_skin = "custom_werebeaver_build" , weregoose_skin = "custom_weregoose_build" , weremoose_skin = "custom_weremoose_build" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_woodie_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weremoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woodie_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woodie_rose.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weremoose_build.dyn"),
    },
    base_prefab = "woodie" ,
    build_name_override = "custom_woodie_rose" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "woodie_rose",
    skin_tags = { "ROSE", "BASE", "WOODIE", },
    skins = { ghost_skin = "ghost_woodie_build" , ghost_werebeaver_skin = "custom_ghost_werebeaver_build" , ghost_weregoose_skin = "custom_ghost_weregoose_build" , ghost_weremoose_skin = "custom_ghost_weremoose_build" , normal_skin = "custom_woodie_rose" , werebeaver_skin = "custom_werebeaver_build" , weregoose_skin = "custom_weregoose_build" , weremoose_skin = "custom_weremoose_build" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_woodie_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weremoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woodie_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woodie_shadow.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weremoose_build.dyn"),
    },
    base_prefab = "woodie" ,
    build_name_override = "custom_woodie_shadow" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "woodie_shadow",
    skin_tags = { "SHADOW", "BASE", "WOODIE", },
    skins = { ghost_skin = "ghost_woodie_build" , ghost_werebeaver_skin = "custom_ghost_werebeaver_build" , ghost_weregoose_skin = "custom_ghost_weregoose_build" , ghost_weremoose_skin = "custom_ghost_weremoose_build" , normal_skin = "custom_woodie_shadow" , werebeaver_skin = "custom_werebeaver_build" , weregoose_skin = "custom_weregoose_build" , weremoose_skin = "custom_weremoose_build" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_woodie_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weremoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woodie_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woodie_survivor.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weremoose_build.dyn"),
    },
    base_prefab = "woodie" ,
    build_name_override = "custom_woodie_survivor" ,
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "woodie_survivor",
    skin_tags = { "SURVIVOR", "BASE", "WOODIE", },
    skins = { ghost_skin = "ghost_woodie_build" , ghost_werebeaver_skin = "custom_ghost_werebeaver_build" , ghost_weregoose_skin = "custom_ghost_weregoose_build" , ghost_weremoose_skin = "custom_ghost_weremoose_build" , normal_skin = "custom_woodie_survivor" , werebeaver_skin = "custom_werebeaver_build" , weregoose_skin = "custom_weregoose_build" , weremoose_skin = "custom_weremoose_build" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_woodie_treeguard",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weremoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woodie_treeguard.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woodie_treeguard.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weremoose_build.dyn"),
    },
    base_prefab = "woodie" ,
    build_name_override = "custom_woodie_treeguard" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "woodie_treeguard",
    skin_tags = { "COSTUME", "BASE", "WOODIE", },
    skins = { ghost_skin = "ghost_woodie_build" , ghost_werebeaver_skin = "custom_ghost_werebeaver_build" , ghost_weregoose_skin = "custom_ghost_weregoose_build" , ghost_weremoose_skin = "custom_ghost_weremoose_build" , normal_skin = "custom_woodie_treeguard" , werebeaver_skin = "custom_werebeaver_build" , weregoose_skin = "custom_weregoose_build" , weremoose_skin = "custom_weremoose_build" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_woodie_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weremoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woodie_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woodie_victorian.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weremoose_build.dyn"),
    },
    base_prefab = "woodie" ,
    build_name_override = "custom_woodie_victorian" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "woodie_victorian",
    skin_tags = { "VICTORIAN", "BASE", "WOODIE", },
    skins = { ghost_skin = "ghost_woodie_build" , ghost_werebeaver_skin = "custom_ghost_werebeaver_build" , ghost_weregoose_skin = "custom_ghost_weregoose_build" , ghost_weremoose_skin = "custom_ghost_weremoose_build" , normal_skin = "custom_woodie_victorian" , werebeaver_skin = "custom_werebeaver_build" , weregoose_skin = "custom_weregoose_build" , weremoose_skin = "custom_weremoose_build" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_woodie_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_weremoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_woodie_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_woodie_yule.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_werebeaver_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_werebeaver_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weregoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weregoose_build.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_weremoose_build.zip"),
        Asset("PKGREF", "anim/dynamic/custom_weremoose_build.dyn"),
    },
    base_prefab = "woodie" ,
    build_name_override = "custom_woodie_yule" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "woodie_yule",
    skin_tags = { "YULE", "BASE", "WOODIE", },
    skins = { ghost_skin = "ghost_woodie_build" , ghost_werebeaver_skin = "custom_ghost_werebeaver_build" , ghost_weregoose_skin = "custom_ghost_weregoose_build" , ghost_weremoose_skin = "custom_ghost_weremoose_build" , normal_skin = "custom_woodie_yule" , werebeaver_skin = "custom_werebeaver_build" , weregoose_skin = "custom_weregoose_build" , weremoose_skin = "custom_weremoose_build" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormhole_claw",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormhole_claw.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormhole_claw.dyn"),
    },
    base_prefab = "wormhole" ,
    build_name_override = "custom_wormhole_claw" ,
    init_fn = function(inst) wormhole_init_fn(inst, "custom_wormhole_claw") end,
    rarity = "Spiffy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WORMHOLE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormhole_fantasy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormhole_fantasy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormhole_fantasy.dyn"),
    },
    base_prefab = "wormhole" ,
    build_name_override = "custom_wormhole_fantasy" ,
    init_fn = function(inst) wormhole_init_fn(inst, "custom_wormhole_fantasy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WORMHOLE", "FANTASY", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormhole_gothic",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormhole_gothic.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormhole_gothic.dyn"),
    },
    base_prefab = "wormhole" ,
    build_name_override = "custom_wormhole_gothic" ,
    init_fn = function(inst) wormhole_init_fn(inst, "custom_wormhole_gothic") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WORMHOLE", "GOTHIC", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormhole_lureplant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormhole_lureplant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormhole_lureplant.dyn"),
    },
    base_prefab = "wormhole" ,
    build_name_override = "custom_wormhole_lureplant" ,
    init_fn = function(inst) wormhole_init_fn(inst, "custom_wormhole_lureplant") end,
    rarity = "Spiffy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WORMHOLE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormhole_spider",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormhole_spider.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormhole_spider.dyn"),
    },
    base_prefab = "wormhole" ,
    build_name_override = "custom_wormhole_spider" ,
    init_fn = function(inst) wormhole_init_fn(inst, "custom_wormhole_spider") end,
    rarity = "Spiffy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WORMHOLE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormhole_worm",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormhole_worm.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormhole_worm.dyn"),
    },
    base_prefab = "wormhole" ,
    build_name_override = "custom_wormhole_worm" ,
    init_fn = function(inst) wormhole_init_fn(inst, "custom_wormhole_worm") end,
    rarity = "Spiffy",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WORMHOLE", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormwood_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wormwood_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wormwood_ancient.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_ancient.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_ancient_stage2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_ancient_stage2.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_ancient_stage3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_ancient_stage3.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_ancient_stage4.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_ancient_stage4.dyn"),
    },
    base_prefab = "wormwood" ,
    build_name_override = "custom_wormwood_ancient" ,
    has_alternate_for_body = { "custom_wormwood_ancient", "custom_wormwood_ancient_stage2", "custom_wormwood_ancient_stage3", "custom_wormwood_ancient_stage4", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wormwood_ancient",
    skin_tags = { "BASE", "WORMWOOD", "ANCIENT", },
    skins = { ghost_skin = "custom_ghost_wormwood_ancient" , normal_skin = "custom_wormwood_ancient" , stage_2 = "custom_wormwood_ancient_stage2" , stage_3 = "custom_wormwood_ancient_stage3" , stage_4 = "custom_wormwood_ancient_stage4" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormwood_cactus",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wormwood_cactus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wormwood_cactus.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_cactus.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_cactus.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_cactus_stage2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_cactus_stage2.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_cactus_stage3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_cactus_stage3.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_cactus_stage4.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_cactus_stage4.dyn"),
    },
    base_prefab = "wormwood" ,
    build_name_override = "custom_wormwood_cactus" ,
    has_alternate_for_body = { "custom_wormwood_cactus", "custom_wormwood_cactus_stage2", "custom_wormwood_cactus_stage3", "custom_wormwood_cactus_stage4", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wormwood_cactus",
    skin_tags = { "BASE", "WORMWOOD", "CACTUS", },
    skins = { ghost_skin = "custom_ghost_wormwood_cactus" , normal_skin = "custom_wormwood_cactus" , stage_2 = "custom_wormwood_cactus_stage2" , stage_3 = "custom_wormwood_cactus_stage3" , stage_4 = "custom_wormwood_cactus_stage4" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormwood_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wormwood_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wormwood_formal.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_formal.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_formal_stage2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_formal_stage2.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_formal_stage3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_formal_stage3.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_formal_stage4.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_formal_stage4.dyn"),
    },
    base_prefab = "wormwood" ,
    build_name_override = "custom_wormwood_formal" ,
    has_alternate_for_body = { "custom_wormwood_formal", "custom_wormwood_formal_stage2", "custom_wormwood_formal_stage3", "custom_wormwood_formal_stage4", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wormwood_formal",
    skin_tags = { "BASE", "WORMWOOD", "FORMAL", },
    skins = { ghost_skin = "custom_ghost_wormwood_formal" , normal_skin = "custom_wormwood_formal" , stage_2 = "custom_wormwood_formal_stage2" , stage_3 = "custom_wormwood_formal_stage3" , stage_4 = "custom_wormwood_formal_stage4" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormwood_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wormwood_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wormwood_ice.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_ice.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_ice_stage2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_ice_stage2.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_ice_stage3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_ice_stage3.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_ice_stage4.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_ice_stage4.dyn"),
    },
    base_prefab = "wormwood" ,
    build_name_override = "custom_wormwood_ice" ,
    has_alternate_for_body = { "custom_wormwood_ice", "custom_wormwood_ice_stage2", "custom_wormwood_ice_stage3", "custom_wormwood_ice_stage4", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wormwood_ice",
    skin_tags = { "ICE", "BASE", "WORMWOOD", },
    skins = { ghost_skin = "custom_ghost_wormwood_ice" , normal_skin = "custom_wormwood_ice" , stage_2 = "custom_wormwood_ice_stage2" , stage_3 = "custom_wormwood_ice_stage3" , stage_4 = "custom_wormwood_ice_stage4" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormwood_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wormwood_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wormwood_lunar.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_lunar.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_lunar_stage2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_lunar_stage2.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_lunar_stage3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_lunar_stage3.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_lunar_stage4.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_lunar_stage4.dyn"),
    },
    base_prefab = "wormwood" ,
    build_name_override = "custom_wormwood_lunar" ,
    has_alternate_for_body = { "custom_wormwood_lunar", "custom_wormwood_lunar_stage2", "custom_wormwood_lunar_stage3", "custom_wormwood_lunar_stage4", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wormwood_lunar",
    skin_tags = { "LUNAR", "BASE", "WORMWOOD", },
    skins = { ghost_skin = "custom_ghost_wormwood_lunar" , normal_skin = "custom_wormwood_lunar" , stage_2 = "custom_wormwood_lunar_stage2" , stage_3 = "custom_wormwood_lunar_stage3" , stage_4 = "custom_wormwood_lunar_stage4" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormwood_mushroom",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wormwood_mushroom.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wormwood_mushroom.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_mushroom.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_mushroom.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_mushroom_stage2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_mushroom_stage2.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_mushroom_stage3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_mushroom_stage3.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_mushroom_stage4.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_mushroom_stage4.dyn"),
    },
    base_prefab = "wormwood" ,
    build_name_override = "custom_wormwood_mushroom" ,
    has_alternate_for_body = { "custom_wormwood_mushroom", "custom_wormwood_mushroom_stage2", "custom_wormwood_mushroom_stage3", "custom_wormwood_mushroom_stage4", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wormwood_mushroom",
    skin_tags = { "BASE", "WORMWOOD", "MUSHROOM", },
    skins = { ghost_skin = "custom_ghost_wormwood_mushroom" , normal_skin = "custom_wormwood_mushroom" , stage_2 = "custom_wormwood_mushroom_stage2" , stage_3 = "custom_wormwood_mushroom_stage3" , stage_4 = "custom_wormwood_mushroom_stage4" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormwood_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wormwood_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wormwood_nature.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_nature.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_nature_stage2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_nature_stage2.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_nature_stage3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_nature_stage3.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_nature_stage4.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_nature_stage4.dyn"),
    },
    base_prefab = "wormwood" ,
    build_name_override = "custom_wormwood_nature" ,
    has_alternate_for_body = { "custom_wormwood_nature", "custom_wormwood_nature_stage2", "custom_wormwood_nature_stage3", "custom_wormwood_nature_stage4", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wormwood_nature",
    skin_tags = { "VARG", "BASE", "WORMWOOD", },
    skins = { ghost_skin = "custom_ghost_wormwood_nature" , normal_skin = "custom_wormwood_nature" , stage_2 = "custom_wormwood_nature_stage2" , stage_3 = "custom_wormwood_nature_stage3" , stage_4 = "custom_wormwood_nature_stage4" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormwood_pumpkin",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wormwood_pumpkin.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wormwood_pumpkin.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_pumpkin.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_pumpkin.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_pumpkin_stage2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_pumpkin_stage2.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_pumpkin_stage3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_pumpkin_stage3.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_pumpkin_stage4.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_pumpkin_stage4.dyn"),
    },
    base_prefab = "wormwood" ,
    build_name_override = "custom_wormwood_pumpkin" ,
    has_alternate_for_body = { "custom_wormwood_pumpkin", "custom_wormwood_pumpkin_stage2", "custom_wormwood_pumpkin_stage3", "custom_wormwood_pumpkin_stage4", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wormwood_pumpkin",
    skin_tags = { "BASE", "WORMWOOD", "HALLOWED", },
    skins = { ghost_skin = "custom_ghost_wormwood_pumpkin" , normal_skin = "custom_wormwood_pumpkin" , stage_2 = "custom_wormwood_pumpkin_stage2" , stage_3 = "custom_wormwood_pumpkin_stage3" , stage_4 = "custom_wormwood_pumpkin_stage4" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormwood_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wormwood_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wormwood_rose.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_rose.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_rose_stage2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_rose_stage2.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_rose_stage3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_rose_stage3.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_rose_stage4.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_rose_stage4.dyn"),
    },
    base_prefab = "wormwood" ,
    build_name_override = "custom_wormwood_rose" ,
    has_alternate_for_body = { "custom_wormwood_rose", "custom_wormwood_rose_stage2", "custom_wormwood_rose_stage3", "custom_wormwood_rose_stage4", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wormwood_rose",
    skin_tags = { "BASE", "WORMWOOD", "ROSE", },
    skins = { ghost_skin = "custom_ghost_wormwood_rose" , normal_skin = "custom_wormwood_rose" , stage_2 = "custom_wormwood_rose_stage2" , stage_3 = "custom_wormwood_rose_stage3" , stage_4 = "custom_wormwood_rose_stage4" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormwood_saladmander",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wormwood_saladmander.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wormwood_saladmander.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_saladmander.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_saladmander.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_saladmander_stage2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_saladmander_stage2.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_saladmander_stage3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_saladmander_stage3.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_saladmander_stage4.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_saladmander_stage4.dyn"),
    },
    base_prefab = "wormwood" ,
    build_name_override = "custom_wormwood_saladmander" ,
    has_alternate_for_body = { "custom_wormwood_saladmander", "custom_wormwood_saladmander_stage2", "custom_wormwood_saladmander_stage3", "custom_wormwood_saladmander_stage4", },
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wormwood_saladmander",
    skin_tags = { "COSTUME", "BASE", "WORMWOOD", },
    skins = { ghost_skin = "custom_ghost_wormwood_saladmander" , normal_skin = "custom_wormwood_saladmander" , stage_2 = "custom_wormwood_saladmander_stage2" , stage_3 = "custom_wormwood_saladmander_stage3" , stage_4 = "custom_wormwood_saladmander_stage4" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormwood_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wormwood_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wormwood_shadow.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_shadow.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_shadow_stage2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_shadow_stage2.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_shadow_stage3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_shadow_stage3.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_shadow_stage4.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_shadow_stage4.dyn"),
    },
    base_prefab = "wormwood" ,
    build_name_override = "custom_wormwood_shadow" ,
    has_alternate_for_body = { "custom_wormwood_shadow", "custom_wormwood_shadow_stage2", "custom_wormwood_shadow_stage3", "custom_wormwood_shadow_stage4", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wormwood_shadow",
    skin_tags = { "BASE", "WORMWOOD", "SHADOW", },
    skins = { ghost_skin = "custom_ghost_wormwood_shadow" , normal_skin = "custom_wormwood_shadow" , stage_2 = "custom_wormwood_shadow_stage2" , stage_3 = "custom_wormwood_shadow_stage3" , stage_4 = "custom_wormwood_shadow_stage4" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormwood_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wormwood_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wormwood_victorian.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_victorian.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_victorian_stage2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_victorian_stage2.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_victorian_stage3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_victorian_stage3.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_victorian_stage4.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_victorian_stage4.dyn"),
    },
    base_prefab = "wormwood" ,
    build_name_override = "custom_wormwood_victorian" ,
    has_alternate_for_body = { "custom_wormwood_victorian", "custom_wormwood_victorian_stage4", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wormwood_victorian",
    skin_tags = { "BASE", "WORMWOOD", "VICTORIAN", },
    skins = { ghost_skin = "custom_ghost_wormwood_victorian" , normal_skin = "custom_wormwood_victorian" , stage_2 = "custom_wormwood_victorian_stage2" , stage_3 = "custom_wormwood_victorian_stage3" , stage_4 = "custom_wormwood_victorian_stage4" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wormwood_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wormwood_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wormwood_yule.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_yule.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_yule_stage2.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_yule_stage2.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_yule_stage3.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_yule_stage3.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wormwood_yule_stage4.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wormwood_yule_stage4.dyn"),
    },
    base_prefab = "wormwood" ,
    build_name_override = "custom_wormwood_yule" ,
    has_alternate_for_body = { "custom_wormwood_victorian", "custom_wormwood_victorian_stage4", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wormwood_yule",
    skin_tags = { "BASE", "WORMWOOD", "YULE", },
    skins = { ghost_skin = "custom_ghost_wormwood_yule" , normal_skin = "custom_wormwood_yule" , stage_2 = "custom_wormwood_yule_stage2" , stage_3 = "custom_wormwood_yule_stage3" , stage_4 = "custom_wormwood_yule_stage4" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wortox_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wortox_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wortox_ancient.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wortox_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wortox_ancient.dyn"),
    },
    base_prefab = "wortox" ,
    build_name_override = "custom_wortox_ancient" ,
    has_alternate_for_body = { "custom_wortox_ancient", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wortox_ancient",
    skin_tags = { "BASE", "WORTOX", "ANCIENT", },
    skins = { ghost_skin = "custom_ghost_wortox_ancient" , normal_skin = "custom_wortox_ancient" , },
    torso_tuck_builds = { "custom_wortox_ancient", },
    torso_untuck_wide_builds = { "custom_wortox_ancient", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wortox_dragon",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wortox_dragon.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wortox_dragon.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wortox_dragon.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wortox_dragon.dyn"),
    },
    base_prefab = "wortox" ,
    build_name_override = "custom_wortox_dragon" ,
    has_alternate_for_body = { "custom_wortox_dragon", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wortox_dragon",
    skin_tags = { "BASE", "WORTOX", "HALLOWED", },
    skins = { ghost_skin = "custom_ghost_wortox_dragon" , normal_skin = "custom_wortox_dragon" , },
    torso_tuck_builds = { "custom_wortox_dragon", },
    torso_untuck_wide_builds = { "custom_wortox_dragon", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wortox_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wortox_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wortox_formal.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wortox_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wortox_formal.dyn"),
    },
    base_prefab = "wortox" ,
    build_name_override = "custom_wortox_formal" ,
    has_alternate_for_body = { "custom_wortox_formal", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wortox_formal",
    skin_tags = { "BASE", "WORTOX", "FORMAL", },
    skins = { ghost_skin = "custom_ghost_wortox_formal" , normal_skin = "custom_wortox_formal" , },
    torso_tuck_builds = { "custom_wortox_formal", },
    torso_untuck_wide_builds = { "custom_wortox_formal", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wortox_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wortox_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wortox_ice.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wortox_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wortox_ice.dyn"),
    },
    base_prefab = "wortox" ,
    build_name_override = "custom_wortox_ice" ,
    has_alternate_for_body = { "custom_wortox_ice", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wortox_ice",
    skin_tags = { "BASE", "WORTOX", "ICE", },
    skins = { ghost_skin = "custom_ghost_wortox_ice" , normal_skin = "custom_wortox_ice" , },
    torso_tuck_builds = { "custom_wortox_ice", },
    torso_untuck_wide_builds = { "custom_wortox_ice", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wortox_masquerade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wortox_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wortox_masquerade.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wortox_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wortox_masquerade.dyn"),
    },
    base_prefab = "wortox" ,
    build_name_override = "custom_wortox_masquerade" ,
    has_alternate_for_body = { "custom_wortox_masquerade", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wortox_masquerade",
    skin_tags = { "BASE", "WORTOX", "MASQUERADE", },
    skins = { ghost_skin = "custom_ghost_wortox_masquerade" , normal_skin = "custom_wortox_masquerade" , },
    torso_tuck_builds = { "custom_wortox_masquerade", },
    torso_untuck_wide_builds = { "custom_wortox_masquerade", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wortox_minotaur",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wortox_minotaur.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wortox_minotaur.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wortox_minotaur.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wortox_minotaur.dyn"),
    },
    base_prefab = "wortox" ,
    build_name_override = "custom_wortox_minotaur" ,
    has_alternate_for_body = { "custom_wortox_minotaur", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wortox_minotaur",
    skin_tags = { "BASE", "WORTOX", "MINOTAUR", },
    skins = { ghost_skin = "custom_ghost_wortox_minotaur" , normal_skin = "custom_wortox_minotaur" , },
    torso_tuck_builds = { "custom_wortox_minotaur", },
    torso_untuck_wide_builds = { "custom_wortox_minotaur", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wortox_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wortox_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wortox_nature.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wortox_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wortox_nature.dyn"),
    },
    base_prefab = "wortox" ,
    build_name_override = "custom_wortox_nature" ,
    has_alternate_for_body = { "custom_wortox_nature", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wortox_nature",
    skin_tags = { "BASE", "WORTOX", "VARG", },
    skins = { ghost_skin = "custom_ghost_wortox_nature" , normal_skin = "custom_wortox_nature" , },
    torso_tuck_builds = { "custom_wortox_nature", },
    torso_untuck_wide_builds = { "custom_wortox_nature", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wortox_noeyeddeer",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wortox_noeyeddeer.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wortox_noeyeddeer.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wortox_noeyeddeer.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wortox_noeyeddeer.dyn"),
    },
    base_prefab = "wortox" ,
    build_name_override = "custom_wortox_noeyeddeer" ,
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wortox_noeyeddeer",
    skin_tags = { "BASE", "WORTOX", "COSTUME", },
    skins = { ghost_skin = "custom_ghost_wortox_noeyeddeer" , normal_skin = "custom_wortox_noeyeddeer" , },
    torso_tuck_builds = { "custom_wortox_noeyeddeer", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wortox_original",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wortox_original.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wortox_original.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wortox_original.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wortox_original.dyn"),
    },
    base_prefab = "wortox" ,
    build_name_override = "custom_wortox_original" ,
    has_alternate_for_body = { "custom_wortox_original", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wortox_original",
    skin_tags = { "BASE", "WORTOX", "ORIGINAL", },
    skins = { ghost_skin = "custom_ghost_wortox_original" , normal_skin = "custom_wortox_original" , },
    torso_tuck_builds = { "custom_wortox_original", },
    torso_untuck_wide_builds = { "custom_wortox_original", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wortox_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wortox_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wortox_pirate.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wortox_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wortox_pirate.dyn"),
    },
    base_prefab = "wortox" ,
    build_name_override = "custom_wortox_pirate" ,
    has_alternate_for_body = { "custom_wortox_pirate", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wortox_pirate",
    skin_tags = { "PIRATE", "BASE", "WORTOX", },
    skins = { ghost_skin = "custom_ghost_wortox_pirate" , normal_skin = "custom_wortox_pirate" , },
    torso_tuck_builds = { "custom_wortox_pirate", },
    torso_untuck_wide_builds = { "custom_wortox_pirate", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wortox_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wortox_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wortox_rose.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wortox_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wortox_rose.dyn"),
    },
    base_prefab = "wortox" ,
    build_name_override = "custom_wortox_rose" ,
    has_alternate_for_body = { "custom_wortox_rose", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wortox_rose",
    skin_tags = { "BASE", "WORTOX", "ROSE", },
    skins = { ghost_skin = "custom_ghost_wortox_rose" , normal_skin = "custom_wortox_rose" , },
    torso_tuck_builds = { "custom_wortox_rose", },
    torso_untuck_wide_builds = { "custom_wortox_rose", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wortox_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wortox_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wortox_shadow.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wortox_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wortox_shadow.dyn"),
    },
    base_prefab = "wortox" ,
    build_name_override = "custom_wortox_shadow" ,
    has_alternate_for_body = { "custom_wortox_shadow", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wortox_shadow",
    skin_tags = { "BASE", "WORTOX", "SHADOW", },
    skins = { ghost_skin = "custom_ghost_wortox_shadow" , normal_skin = "custom_wortox_shadow" , },
    torso_tuck_builds = { "custom_wortox_shadow", },
    torso_untuck_wide_builds = { "custom_wortox_shadow", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wortox_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wortox_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wortox_survivor.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wortox_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wortox_survivor.dyn"),
    },
    base_prefab = "wortox" ,
    build_name_override = "custom_wortox_survivor" ,
    has_alternate_for_body = { "custom_wortox_survivor", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wortox_survivor",
    skin_tags = { "SURVIVOR", "BASE", "WORTOX", },
    skins = { ghost_skin = "custom_ghost_wortox_survivor" , normal_skin = "custom_wortox_survivor" , },
    torso_tuck_builds = { "custom_wortox_survivor", },
    torso_untuck_wide_builds = { "custom_wortox_survivor", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wortox_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wortox_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wortox_victorian.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wortox_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wortox_victorian.dyn"),
    },
    base_prefab = "wortox" ,
    build_name_override = "custom_wortox_victorian" ,
    has_alternate_for_body = { "custom_wortox_victorian", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wortox_victorian",
    skin_tags = { "BASE", "WORTOX", "VICTORIAN", },
    skins = { ghost_skin = "custom_ghost_wortox_victorian" , normal_skin = "custom_wortox_victorian" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wortox_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wortox_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wortox_yule.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wortox_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wortox_yule.dyn"),
    },
    base_prefab = "wortox" ,
    build_name_override = "custom_wortox_yule" ,
    has_alternate_for_body = { "custom_wortox_yule", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wortox_yule",
    skin_tags = { "BASE", "WORTOX", "YULE", },
    skins = { ghost_skin = "custom_ghost_wortox_yule" , normal_skin = "custom_wortox_yule" , },
    torso_tuck_builds = { "custom_wortox_yule", },
    torso_untuck_wide_builds = { "custom_wortox_yule", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wurt_ancient",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wurt_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wurt_ancient.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_ancient.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_ancient.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_ancient_powerup.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_ancient_powerup.dyn"),
    },
    base_prefab = "wurt" ,
    build_name_override = "custom_wurt_ancient" ,
    feet_cuff_size = { wurt_ancient = -1, wurt_ancient_powerup = -1, },
    has_alternate_for_body = { "custom_wurt_ancient", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wurt_ancient",
    skin_tags = { "ANCIENT", "BASE", "WURT", },
    skins = { ghost_skin = "custom_ghost_wurt_ancient" , normal_skin = "custom_wurt_ancient" , powerup = "custom_wurt_ancient_powerup" , },
    torso_tuck_builds = { "custom_wurt_ancient", "custom_wurt_ancient_powerup", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wurt_cave",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wurt_cave.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wurt_cave.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_cave.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_cave.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_cave_powerup.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_cave_powerup.dyn"),
    },
    base_prefab = "wurt" ,
    build_name_override = "custom_wurt_cave" ,
    feet_cuff_size = { wurt_cave_powerup = -1, wurt_cave = -1, },
    has_alternate_for_body = { "custom_wurt_cave", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wurt_cave",
    skin_tags = { "CAVE", "BASE", "WURT", },
    skins = { ghost_skin = "custom_ghost_wurt_cave" , normal_skin = "custom_wurt_cave" , powerup = "custom_wurt_cave_powerup" , },
    torso_tuck_builds = { "custom_wurt_cave", "custom_wurt_cave_powerup", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wurt_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wurt_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wurt_formal.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_formal.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_formal_powerup.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_formal_powerup.dyn"),
    },
    base_prefab = "wurt" ,
    build_name_override = "custom_wurt_formal" ,
    feet_cuff_size = { wurt_formal_powerup = -1, wurt_formal = -1, },
    has_alternate_for_body = { "custom_wurt_formal", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wurt_formal",
    skin_tags = { "FORMAL", "BASE", "WURT", },
    skins = { ghost_skin = "custom_ghost_wurt_formal" , normal_skin = "custom_wurt_formal" , powerup = "custom_wurt_formal_powerup" , },
    torso_tuck_builds = { "custom_wurt_formal", "custom_wurt_formal_powerup", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wurt_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wurt_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wurt_ice.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_ice.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_ice_powerup.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_ice_powerup.dyn"),
    },
    base_prefab = "wurt" ,
    build_name_override = "custom_wurt_ice" ,
    feet_cuff_size = { wurt_ice_powerup = -1, wurt_ice = -1, },
    has_alternate_for_body = { "custom_wurt_ice", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wurt_ice",
    skin_tags = { "ICE", "BASE", "WURT", },
    skins = { ghost_skin = "custom_ghost_wurt_ice" , normal_skin = "custom_wurt_ice" , powerup = "custom_wurt_ice_powerup" , },
    torso_tuck_builds = { "custom_wurt_ice", "custom_wurt_ice_powerup", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wurt_masquerade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wurt_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wurt_masquerade.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_masquerade.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_masquerade_powerup.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_masquerade_powerup.dyn"),
    },
    base_prefab = "wurt" ,
    build_name_override = "custom_wurt_masquerade" ,
    feet_cuff_size = { wurt_ice_powerup = -1, wurt_ice = -1, },
    has_alternate_for_body = { "custom_wurt_masquerade", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wurt_masquerade",
    skin_tags = { "MASQUERADE", "BASE", "WURT", },
    skins = { ghost_skin = "custom_ghost_wurt_masquerade" , normal_skin = "custom_wurt_masquerade" , powerup = "custom_wurt_masquerade_powerup" , },
    torso_tuck_builds = { "custom_wurt_masquerade", "custom_wurt_masquerade_powerup", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wurt_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wurt_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wurt_nature.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_nature.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_nature_powerup.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_nature_powerup.dyn"),
    },
    base_prefab = "wurt" ,
    build_name_override = "custom_wurt_nature" ,
    feet_cuff_size = { wurt_nature = -1, wurt_nature_powerup = -1, },
    has_alternate_for_body = { "custom_wurt_nature", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wurt_nature",
    skin_tags = { "VARG", "BASE", "WURT", },
    skins = { ghost_skin = "custom_ghost_wurt_nature" , normal_skin = "custom_wurt_nature" , powerup = "custom_wurt_nature_powerup" , },
    torso_tuck_builds = { "custom_wurt_nature", "custom_wurt_nature_powerup", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wurt_pirate",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wurt_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wurt_pirate.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_pirate.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_pirate.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_pirate_powerup.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_pirate_powerup.dyn"),
    },
    base_prefab = "wurt" ,
    build_name_override = "custom_wurt_pirate" ,
    feet_cuff_size = { wurt_pirate_powerup = -1, wurt_pirate = -1, },
    has_alternate_for_body = { "custom_wurt_pirate", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wurt_pirate",
    skin_tags = { "PIRATE", "BASE", "WURT", },
    skins = { ghost_skin = "custom_ghost_wurt_pirate" , normal_skin = "custom_wurt_pirate" , powerup = "custom_wurt_pirate_powerup" , },
    torso_tuck_builds = { "custom_wurt_pirate", "custom_wurt_pirate_powerup", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wurt_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wurt_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wurt_rose.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_rose.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_rose_powerup.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_rose_powerup.dyn"),
    },
    base_prefab = "wurt" ,
    build_name_override = "custom_wurt_rose" ,
    feet_cuff_size = { wurt_rose_powerup = -1, wurt_rose = -1, },
    has_alternate_for_body = { "custom_wurt_rose", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wurt_rose",
    skin_tags = { "ROSE", "BASE", "WURT", },
    skins = { ghost_skin = "custom_ghost_wurt_rose" , normal_skin = "custom_wurt_rose" , powerup = "custom_wurt_rose_powerup" , },
    torso_tuck_builds = { "custom_wurt_rose", "custom_wurt_rose_powerup", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wurt_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wurt_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wurt_shadow.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_shadow.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_shadow_powerup.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_shadow_powerup.dyn"),
    },
    base_prefab = "wurt" ,
    build_name_override = "custom_wurt_shadow" ,
    feet_cuff_size = { wurt_shadow_powerup = -1, wurt_shadow = -1, },
    has_alternate_for_body = { "custom_wurt_shadow", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wurt_shadow",
    skin_tags = { "SHADOW", "BASE", "WURT", },
    skins = { ghost_skin = "custom_ghost_wurt_shadow" , normal_skin = "custom_wurt_shadow" , powerup = "custom_wurt_shadow_powerup" , },
    torso_tuck_builds = { "custom_wurt_shadow", "custom_wurt_shadow_powerup", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wurt_squid",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wurt_squid.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wurt_squid.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_squid.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_squid.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_squid_powerup.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_squid_powerup.dyn"),
    },
    base_prefab = "wurt" ,
    build_name_override = "custom_wurt_squid" ,
    feet_cuff_size = { wurt_squid = -1, wurt_squid_powerup = -1, },
    has_alternate_for_body = { "custom_wurt_squid", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wurt_squid",
    skin_tags = { "HALLOWED", "BASE", "WURT", },
    skins = { ghost_skin = "custom_ghost_wurt_squid" , normal_skin = "custom_wurt_squid" , powerup = "custom_wurt_squid_powerup" , },
    torso_tuck_builds = { "custom_wurt_squid", "custom_wurt_squid_powerup", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wurt_toadstool",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wurt_toadstool.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wurt_toadstool.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_toadstool.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_toadstool.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_toadstool_powerup.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_toadstool_powerup.dyn"),
    },
    base_prefab = "wurt" ,
    build_name_override = "custom_wurt_toadstool" ,
    feet_cuff_size = { wurt_toadstool = -1, wurt_toadstool_powerup = -1, },
    has_alternate_for_body = { "custom_wurt_toadstool", },
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wurt_toadstool",
    skin_tags = { "COSTUME", "BASE", "WURT", },
    skins = { ghost_skin = "custom_ghost_wurt_toadstool" , normal_skin = "custom_wurt_toadstool" , powerup = "custom_wurt_toadstool_powerup" , },
    torso_untuck_builds = { "custom_wurt_toadstool", "custom_wurt_toadstool_powerup", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wurt_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wurt_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wurt_victorian.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_victorian.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_victorian_powerup.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_victorian_powerup.dyn"),
    },
    base_prefab = "wurt" ,
    build_name_override = "custom_wurt_victorian" ,
    feet_cuff_size = { wurt_victorian_powerup = -1, wurt_victorian = -1, },
    has_alternate_for_body = { "custom_wurt_victorian", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wurt_victorian",
    skin_tags = { "VICTORIAN", "BASE", "WURT", },
    skins = { ghost_skin = "custom_ghost_wurt_victorian" , normal_skin = "custom_wurt_victorian" , powerup = "custom_wurt_victorian_powerup" , },
    torso_tuck_builds = { "custom_wurt_victorian", "custom_wurt_victorian_powerup", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wurt_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_ghost_wurt_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_ghost_wurt_yule.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_yule.dyn"),
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wurt_yule_powerup.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wurt_yule_powerup.dyn"),
    },
    base_prefab = "wurt" ,
    build_name_override = "custom_wurt_yule" ,
    feet_cuff_size = { wurt_yule_powerup = -1, wurt_yule = -1, },
    has_alternate_for_body = { "custom_wurt_yule", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wurt_yule",
    skin_tags = { "YULE", "BASE", "WURT", },
    skins = { ghost_skin = "custom_ghost_wurt_yule" , normal_skin = "custom_wurt_yule" , powerup = "custom_wurt_yule_powerup" , },
    torso_tuck_builds = { "custom_wurt_yule", "custom_wurt_yule_powerup", },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_combatant",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_combatant.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_combatant.dyn"),
    },
    base_prefab = "wx78" ,
    build_name_override = "custom_wx78_combatant" ,
    feet_cuff_size = { wx78_combatant = 3, },
    has_alternate_for_body = { "custom_wx78_combatant", },
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wx78_combatant",
    skin_tags = { "LAVA", "BASE", "WX78", },
    skins = { ghost_skin = "ghost_wx78_build" , normal_skin = "custom_wx78_combatant" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_cook",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_cook.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_cook.dyn"),
    },
    base_prefab = "wx78" ,
    build_name_override = "custom_wx78_cook" ,
    feet_cuff_size = { wx78_cook = 3, },
    has_alternate_for_body = { "custom_wx78_cook", },
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wx78_cook",
    skin_tags = { "VICTORIAN", "BASE", "WX78", },
    skins = { ghost_skin = "ghost_wx78_build" , normal_skin = "custom_wx78_cook" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_formal",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_formal.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_formal.dyn"),
    },
    base_prefab = "wx78" ,
    build_name_override = "custom_wx78_formal" ,
    feet_cuff_size = { wx78_formal = 3, },
    has_alternate_for_body = { "custom_wx78_formal", },
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wx78_formal",
    skin_tags = { "FORMAL", "BASE", "WX78", },
    skins = { ghost_skin = "ghost_wx78_build" , normal_skin = "custom_wx78_formal" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_gladiator",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_gladiator.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_gladiator.dyn"),
    },
    base_prefab = "wx78" ,
    build_name_override = "custom_wx78_gladiator" ,
    feet_cuff_size = { wx78_gladiator = 3, },
    has_alternate_for_body = { "custom_wx78_gladiator", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wx78_gladiator",
    skin_tags = { "LAVA", "BASE", "WX78", },
    skins = { ghost_skin = "ghost_wx78_build" , normal_skin = "custom_wx78_gladiator" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_ice",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_ice.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_ice.dyn"),
    },
    base_prefab = "wx78" ,
    build_name_override = "custom_wx78_ice" ,
    feet_cuff_size = { wx78_ice = 3, },
    has_alternate_for_body = { "custom_wx78_ice", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wx78_ice",
    skin_tags = { "ICE", "BASE", "WX78", },
    skins = { ghost_skin = "ghost_wx78_build" , normal_skin = "custom_wx78_ice" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_lunar",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_lunar.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_lunar.dyn"),
    },
    base_prefab = "wx78" ,
    build_name_override = "custom_wx78_lunar" ,
    feet_cuff_size = { wx78_lunar = 3, },
    has_alternate_for_body = { "custom_wx78_lunar", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wx78_lunar",
    skin_tags = { "LUNAR", "BASE", "WX78", },
    skins = { ghost_skin = "ghost_wx78_build" , normal_skin = "custom_wx78_lunar" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_magma",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_magma.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_magma.dyn"),
    },
    base_prefab = "wx78" ,
    build_name_override = "custom_wx78_magma" ,
    feet_cuff_size = { wx78_magma = 3, },
    has_alternate_for_body = { "custom_wx78_magma", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wx78_magma",
    skin_tags = { "LAVA", "BASE", "WX78", },
    skins = { ghost_skin = "ghost_wx78_build" , normal_skin = "custom_wx78_magma" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_masquerade",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_masquerade.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_masquerade.dyn"),
    },
    base_prefab = "wx78" ,
    build_name_override = "custom_wx78_masquerade" ,
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wx78_masquerade",
    skin_tags = { "MASQUERADE", "BASE", "WX78", },
    skins = { ghost_skin = "ghost_wx78_build" , normal_skin = "custom_wx78_masquerade" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_nature",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_nature.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_nature.dyn"),
    },
    base_prefab = "wx78" ,
    build_name_override = "custom_wx78_nature" ,
    feet_cuff_size = { wx78_nature = 3, },
    has_alternate_for_body = { "custom_wx78_nature", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wx78_nature",
    skin_tags = { "VARG", "BASE", "WX78", },
    skins = { ghost_skin = "ghost_wx78_build" , normal_skin = "custom_wx78_nature" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_retro",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_retro.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_retro.dyn"),
    },
    base_prefab = "wx78" ,
    build_name_override = "custom_wx78_retro" ,
    feet_cuff_size = { wx78_retro = 3, },
    has_alternate_for_body = { "custom_wx78_retro", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wx78_retro",
    skin_tags = { "RETRO", "BASE", "WX78", },
    skins = { ghost_skin = "ghost_wx78_build" , normal_skin = "custom_wx78_retro" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_rhinorook",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_rhinorook.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_rhinorook.dyn"),
    },
    base_prefab = "wx78" ,
    build_name_override = "custom_wx78_rhinorook" ,
    feet_cuff_size = { wx78_rhinorook = 10, },
    has_alternate_for_body = { "custom_wx78_rhinorook", },
    rarity = "Event",
    release_group = groupid,
    share_bigportrait_name = "wx78_rhinorook",
    skin_tags = { "COSTUME", "BASE", "WX78", },
    skins = { ghost_skin = "ghost_wx78_build" , normal_skin = "custom_wx78_rhinorook" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_rose",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_rose.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_rose.dyn"),
    },
    base_prefab = "wx78" ,
    build_name_override = "custom_wx78_rose" ,
    feet_cuff_size = { wx78_rose = 3, },
    has_alternate_for_body = { "custom_wx78_rose", },
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wx78_rose",
    skin_tags = { "ROSE", "BASE", "WX78", },
    skins = { ghost_skin = "ghost_wx78_build" , normal_skin = "custom_wx78_rose" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_scanner_fancy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_scanner_fancy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_scanner_fancy.dyn"),
    },
    base_prefab = "wx78_scanner" ,
    build_name_override = "custom_wx78_scanner_fancy" ,
    granted_items = { "custom_wx78_scanner_succeeded_fancy" , },
    init_fn = function(inst) wx78_scanner_init_fn(inst, "custom_wx78_scanner_fancy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WX78SCANNER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_scanner_fancy_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_scanner_fancy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_scanner_fancy.dyn"),
    },
    base_prefab = "wx78_scanner_item" ,
    build_name_override = "custom_wx78_scanner_fancy" ,
    init_fn = function(inst) wx78_scanner_item_init_fn(inst, "custom_wx78_scanner_fancy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_scanner_junky",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_scanner_junky.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_scanner_junky.dyn"),
    },
    base_prefab = "wx78_scanner" ,
    build_name_override = "custom_wx78_scanner_junky" ,
    granted_items = { "custom_wx78_scanner_succeeded_junky" , },
    init_fn = function(inst) wx78_scanner_init_fn(inst, "custom_wx78_scanner_junky") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { "WX78SCANNER", "CRAFTABLE", },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_scanner_junky_item",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_scanner_junky.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_scanner_junky.dyn"),
    },
    base_prefab = "wx78_scanner_item" ,
    build_name_override = "custom_wx78_scanner_junky" ,
    init_fn = function(inst) wx78_scanner_item_init_fn(inst, "custom_wx78_scanner_junky") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_scanner_succeeded_fancy",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_scanner_fancy.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_scanner_fancy.dyn"),
    },
    base_prefab = "wx78_scanner_succeeded" ,
    build_name_override = "custom_wx78_scanner_fancy" ,
    init_fn = function(inst) wx78_scanner_succeeded_init_fn(inst, "custom_wx78_scanner_fancy") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_scanner_succeeded_junky",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_scanner_junky.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_scanner_junky.dyn"),
    },
    base_prefab = "wx78_scanner_succeeded" ,
    build_name_override = "custom_wx78_scanner_junky" ,
    init_fn = function(inst) wx78_scanner_succeeded_init_fn(inst, "custom_wx78_scanner_junky") end,
    rarity = "Distinguished",
    rarity_modifier = "Woven",
    release_group = groupid,
    skin_tags = { },
    type = "item",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_shadow",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_shadow.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_shadow.dyn"),
    },
    base_prefab = "wx78" ,
    build_name_override = "custom_wx78_shadow" ,
    has_alternate_for_body = { "custom_wx78_shadow", },
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wx78_shadow",
    skin_tags = { "SHADOW", "BASE", "WX78", },
    skins = { ghost_skin = "ghost_wx78_build" , normal_skin = "custom_wx78_shadow" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_survivor",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_survivor.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_survivor.dyn"),
    },
    base_prefab = "wx78" ,
    build_name_override = "custom_wx78_survivor" ,
    has_alternate_for_body = { "custom_wx78_survivor", },
    marketable = true,
    rarity = "HeirloomElegant",
    release_group = groupid,
    share_bigportrait_name = "wx78_survivor",
    skin_tags = { "SURVIVOR", "BASE", "WX78", },
    skins = { ghost_skin = "ghost_wx78_build" , normal_skin = "custom_wx78_survivor" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_victorian",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_victorian.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_victorian.dyn"),
    },
    base_prefab = "wx78" ,
    build_name_override = "custom_wx78_victorian" ,
    feet_cuff_size = { wx78_victorian = 3, },
    has_alternate_for_body = { "custom_wx78_victorian", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wx78_victorian",
    skin_tags = { "VICTORIAN", "BASE", "WX78", },
    skins = { ghost_skin = "ghost_wx78_build" , normal_skin = "custom_wx78_victorian" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_wip",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_wip.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_wip.dyn"),
    },
    base_prefab = "wx78" ,
    build_name_override = "custom_wx78_wip" ,
    feet_cuff_size = { wx78_wip = 3, },
    has_alternate_for_body = { "custom_wx78_wip", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wx78_wip",
    skin_tags = { "HALLOWED", "BASE", "WX78", },
    skins = { ghost_skin = "ghost_wx78_build" , normal_skin = "custom_wx78_wip" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_wrestler",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_wrestler.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_wrestler.dyn"),
    },
    base_prefab = "wx78" ,
    build_name_override = "custom_wx78_wrestler" ,
    feet_cuff_size = { wx78_wrestler = 3, },
    has_alternate_for_body = { "custom_wx78_wrestler", },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wx78_wrestler",
    skin_tags = { "YOTP", "BASE", "WX78", },
    skins = { ghost_skin = "ghost_wx78_build" , normal_skin = "custom_wx78_wrestler" , },
    type = "base",
}))

table.insert(prefs, CreatePrefabSkin("custom_wx78_yule",{
    assets = {
        Asset("DYNAMIC_ANIM", "anim/dynamic/custom_wx78_yule.zip"),
        Asset("PKGREF", "anim/dynamic/custom_wx78_yule.dyn"),
    },
    base_prefab = "wx78" ,
    build_name_override = "custom_wx78_yule" ,
    feet_cuff_size = { wx78_yule = 3, },
    rarity = "Elegant",
    rarity_modifier = "Woven",
    release_group = groupid,
    share_bigportrait_name = "wx78_yule",
    skin_tags = { "YULE", "BASE", "WX78", },
    skins = { ghost_skin = "ghost_wx78_build" , normal_skin = "custom_wx78_yule" , },
    type = "base",
}))

return unpack(prefs)
