-- 放开沃姆伍德 泄根糖浆制作
-- Recipe2("ipecacsyrup",{Ingredient("red_cap", 1), Ingredient("honey", 1), Ingredient("spoiled_food", 1)},			
-- TECH.NONE,	{builder_skill="wormwood_syrupcrafting", allowautopick=true})
Recipe2("ipecacsyrup", { Ingredient("red_cap", 1), Ingredient("honey", 1), Ingredient("spoiled_food", 1) }, TECH.NONE,
    { nounlock = false, no_deconstruction = true })
Recipe2("transmute_bluegem", { Ingredient("greengem", 1) }, TECH.NONE,
    { product = "bluegem", image = "bluegem.tex", description = "transmute_bluegem" })
Recipe2("transmute_redgem", { Ingredient("bluegem", 1) }, TECH.NONE,
    { product = "redgem", image = "redgem.tex", description = "transmute_redgem" })
Recipe2("transmute_purplegem", { Ingredient("redgem", 1) }, TECH.NONE,
    { product = "purplegem", image = "purplegem.tex", description = "transmute_purplegem" })
Recipe2("transmute_orangegem", { Ingredient("purplegem", 1) }, TECH.NONE,
    { product = "orangegem", image = "orangegem.tex", description = "transmute_orangegem" })
Recipe2("transmute_yellowgem", { Ingredient("orangegem", 1) }, TECH.NONE,
    { product = "yellowgem", image = "yellowgem.tex", description = "transmute_yellowgem" })
Recipe2("transmute_greengem", { Ingredient("yellowgem", 1) }, TECH.NONE,
    { product = "greengem", image = "greengem.tex", description = "transmute_greengem" })
--放开结束

-- 女武神优化 物品制作优化
Recipe2("spear_wathgrithr", { Ingredient("twigs", 2), Ingredient("flint", 2), Ingredient("goldnugget", 2) }, TECH.NONE,
    { builder_tag = "valkyrie" })
Recipe2("wathgrithrhat", { Ingredient("goldnugget", 2), Ingredient("rocks", 2) }, TECH.NONE, { builder_tag = "valkyrie" })
Recipe2("battlesong_durability",
    { Ingredient("papyrus", 1), Ingredient("featherpencil", 1), Ingredient("sewing_kit", 1) },
    TECH.NONE, { builder_tag = "battlesinger" })
Recipe2("battlesong_healthgain", { Ingredient("papyrus", 1), Ingredient("featherpencil", 1), Ingredient("red_cap", 1) },
    TECH.NONE, { builder_tag = "battlesinger" })
Recipe2("battlesong_sanitygain", { Ingredient("papyrus", 1), Ingredient("featherpencil", 1), Ingredient("green_cap", 1) },
    TECH.NONE, { builder_tag = "battlesinger" })
Recipe2("battlesong_sanityaura",
    { Ingredient("papyrus", 1), Ingredient("featherpencil", 1), Ingredient("nightmare_timepiece", 1) }, TECH.NONE,
    { builder_tag = "battlesinger" })
Recipe2("battlesong_fireresistance",
    { Ingredient("papyrus", 1), Ingredient("featherpencil", 1), Ingredient("bluegem", 1) },
    TECH.NONE, { builder_tag = "battlesinger" })
Recipe2("battlesong_instant_taunt",
    { Ingredient("papyrus", 1), Ingredient("featherpencil", 1), Ingredient("tomato", 1, nil, nil, "quagmire_tomato.tex") },
    TECH.NONE, { builder_tag = "battlesinger" })
Recipe2("battlesong_instant_panic",
    { Ingredient("papyrus", 1), Ingredient("featherpencil", 1), Ingredient("purplegem", 1) }, TECH.NONE,
    { builder_tag = "battlesinger" })



-- 增加部分物品 作祟复活
local respawnThing = { "ccs_amulet", 'ccs_magic_wand3', 'ccs_starstaff', 'ccs_magic_wand2', 'spear_wathgrithr',
    'spear_wathgrithr_lightning' }
for i = 1, #respawnThing do
    AddPrefabPostInit(respawnThing[i], function(inst)
        if not TheWorld.ismastersim then
            return inst
        end
        if inst.components.hauntable then
            inst.components.hauntable.DoHaunt = function(self, doer)
                doer:PushEvent("respawnfromghost", { source = self.inst })
            end
        end
    end)
end

local function IsLifeDrainable(target)
	return not target:HasAnyTag(NON_LIFEFORM_TARGET_TAGS) or target:HasTag("lifedrainable")
end

local function onattack(inst, owner, target)
    if owner.components.health and owner.components.health:IsHurt() and IsLifeDrainable(target) then
        -- 残血会回血
        owner.components.health:DoDelta(TUNING.BATBAT_DRAIN, false, "batbat")
    end
end

AddPrefabPostInit('spear_wathgrithr', function(inst)
    if not TheWorld.ismastersim then
        return inst
    end
    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.BATBAT_DAMAGE)
    inst.components.weapon.onattack = onattack
end)

-- AddPrefabPostInit("cane",
-- 	function(inst)
-- 		if not TheWorld.ismastersim then return end

-- 		inst._light = SpawnPrefab("pepalight")
-- 		inst._light.entity:SetParent(inst.entity)

-- 		inst:ListenForEvent("onputininventory", setLight)
-- 		inst:ListenForEvent("ondropped", setLight)
-- 		inst:ListenForEvent("equipped", setLight)
-- 		inst:ListenForEvent("unequipped", setLight)
-- 		inst:WatchWorldState("isnight", function(ent, isnight) setLight(ent) end)
-- 		inst:ListenForEvent("onremove", onRemove)

-- 		setLight(inst)
-- 	end
-- )
