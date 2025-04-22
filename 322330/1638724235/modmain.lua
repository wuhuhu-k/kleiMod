--[[
授权级别:参考级
Copyright 2022 [FL]。此产品仅授权在 Steam 和WeGame平台指定账户下，
Steam平台：MySora 模组ID：workshop-1638724235
WeGame平台: 穹の空 模组ID：workshop-2199027653598519351
禁止一切搬运！二次发布！自用！尤其是自用!
禁止一切搬运！二次发布！自用！尤其是自用!
禁止一切搬运！二次发布！自用！尤其是自用!

基于本mod的patch包 补丁包等 在以下情况下被允许：
1，原则上允许patch和补丁，但是请最好和我打声招呼。
2, patch包 补丁包浏览权限 请优先选择成“不公开” 或者 “仅好友可见”
3，禁止修改经验、进食、皮肤、热更相关内容。
4，本人保留要求相关patch、补丁包下架和做出反制的权利 。
5，之后会有详细的说明放置于mod根目录下的 ReadMe.txt文件，会提供更详细的说明和示例。


声明：本MOD所有内容不用于盈利，且拒绝接受捐赠、红包等行为。

对moder:
授权声明：
1,本mod内源码会严格分为'参考级'和'开放级',我会在源码内标明。
其中'参考级'允许作为参考,可以按照我的思路自行编写其他逻辑,但是禁止直接复制粘贴.
'开放级'允许直接复制粘贴后使用,并允许根据自己的需要进行修改,
但是我期望尽量减少修改以保证兼容和后续更新带来的麻烦,如果有功能改动可以和我沟通进行合并。
未标明的文件，默认授权级别为'参考级'。
2,本mod内贴图、动画相关文件禁止挪用,毕竟这是我自己花钱买的.
3,严禁直接修改本mod内文件后二次发布。
4,从本mod内提前的源码请保留版权信息,并且禁止加密、混淆。
]]
GLOBAL.setmetatable(env, {
    __index = function(t, k)
        return GLOBAL.rawget(GLOBAL, k)
    end
})

modimport("main/init")
-- prefab文件列表
PrefabFiles = { "sora", "sorapocky", "sorarepairer", "sorabag", "soraclothes", "sorahat", "sora2hat", "sora2bag",
    "sora2sword", "sora3sword", "sora2ice", "sora2fire", "sora2plant", "soramagic", "sorapick",
    "sorahealing", "soratele", "sorabowknot", "sorabooks", "sorahealingstar", "soraprojectile", "sorameteor",
    "sora2buffer", "sora2prop", "sora2amulet", "sora2base", "sora2chest", "sora2tree", "sorafoods",
    "sorahair", "sora_item_fx", "sora_huapen", "sora_light", "sora_fl", "sora_flh", "sora_helper", "sora_wq",
    "sora_nizao", "sora_lock", "sora_pickhat", "sora2pokeball", "sora_fx_feather" } --,""
function AddPreFile(str)
    table.insert(PrefabFiles, str)
end

AddPreFile("sora2birdchest")
AddPreFile("sora3chest")
AddPreFile("sora_yingyu")
AddPreFile("sora_dieyu")
AddPreFile("sora_qiyu")
AddPreFile("sora_shouban")
AddPreFile("sora_smalllight")
AddPreFile("sora_pot")
AddPreFile("sora_tqy")
AddPreFile("sora2global")
AddPreFile("sora2build")
AddPreFile("sora_lantern")
AddPreFile("sora_ring")
AddPreFile("sora_lyj")
AddPreFile("sora_build")
AddPreFile("sora_plant")



-- 放开沃姆伍德 泄根糖浆制作
-- Recipe2("ipecacsyrup",{Ingredient("red_cap", 1), Ingredient("honey", 1), Ingredient("spoiled_food", 1)},			
-- TECH.NONE,	{builder_skill="wormwood_syrupcrafting", allowautopick=true})
Recipe2("ipecacsyrup", { Ingredient("red_cap", 1), Ingredient("honey", 1), Ingredient("spoiled_food", 1) }, TECH.NONE,
    { nounlock = false, no_deconstruction = true })
-- 宝石合成
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
-- 彩虹宝石
Recipe2("transmute_opalpreciousgem",
    { Ingredient("yellowgem", 1), Ingredient("orangegem", 1), Ingredient("greengem", 1), Ingredient("bluegem", 1),
        Ingredient("redgem", 1), Ingredient("purplegem", 1) }, TECH.NONE,
    { product = "opalpreciousgem", image = "opalpreciousgem.tex", description = "transmute_opalpreciousgem" })
-- 活木头合成
Recipe2("livinglog", { Ingredient("log", 20) }, TECH.NONE,
    { product = "livinglog", image = "livinglog.tex", description = "livinglog" })
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

-- 去除耐久
AddPrefabPostInit("spear_wathgrithr", function(inst)
    if not GLOBAL.TheWorld.ismastersim then
        return
    end
    if inst.components.finiteuses then
        inst:RemoveComponent("finiteuses")
    end
end)

-- 女武神属性修改
TUNING.WATHGRITHR_SANITY = 120
TUNING.WATHGRITHR_HUNGER = 150
