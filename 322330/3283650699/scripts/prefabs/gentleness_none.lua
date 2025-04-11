----
---文件处理时间:2024-07-01 23:48:41
---
local assets =
{
	Asset( "ANIM", "anim/gentleness.zip" ),
	Asset( "ANIM", "anim/ghost_gentleness_build.zip" ),
}

local skins =
{
	["normal_skin"] = "gentleness",
	["ghost_skin"] = "ghost_gentleness_build",
}

local base_prefab = "gentleness"

local tags = {"BASE" ,"GENTLENESS", "CHARACTER"}

return CreatePrefabSkin("gentleness_none",
{
	["base_prefab"] = base_prefab,
	["skins"] = skins,
	["assets"] = assets,
	["skin_tags"] = tags,
	
	["build_name_override"] = "gentleness",
	["rarity"] = "Character",
})
