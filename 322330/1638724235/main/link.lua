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
]] -- 与其他mod的兼容、联动
-- 兼容showme的finder
-- 如果他优先级比我高 这一段生效
for k, mod in pairs(ModManager.mods) do -- 遍历已开启的mod
    if mod and rawget(mod, "SHOWME_STRINGS") then -- 因为showme的modmain的全局变量里有 SHOWME_STRINGS 所以有这个变量的应该就是showme
        if mod.postinitfns and mod.postinitfns.PrefabPostInit and mod.postinitfns.PrefabPostInit.treasurechest then -- 是的 箱子的寻物已经加上去了
            mod.postinitfns.PrefabPostInit.sora2ice = mod.postinitfns.PrefabPostInit.treasurechest -- 给我整一个！
            mod.postinitfns.PrefabPostInit.sora2fire = mod.postinitfns.PrefabPostInit.treasurechest -- 给我也整一个！
            mod.postinitfns.PrefabPostInit.sora2chest = mod.postinitfns.PrefabPostInit.treasurechest -- 给我也整一个！
            mod.postinitfns.PrefabPostInit.sora_light = mod.postinitfns.PrefabPostInit.treasurechest -- 给我也整一个！
        end
    end
end
-- 如果他优先级比我低 那下面这一段生效
TUNING.MONITOR_CHESTS = TUNING.MONITOR_CHESTS or {}
TUNING.MONITOR_CHESTS.sora2ice = true
TUNING.MONITOR_CHESTS.sora2fire = true
TUNING.MONITOR_CHESTS.sora2chest = true

-- 兼容沙雕旧版GPS
for k, mod in pairs(ModManager.mods) do -- 遍历已开启的mod
    if mod and rawget(mod, "OldTargetIndicatorOnUpdate") and mod.modinfo.priority == -1000 and mod.modinfo.icon ==
        "GlobalPositionsIcon.tex" then -- 可能是GPS
        if next(mod.postinitfns.PrefabPostInitAny) == nil and mod.postinitfns.PrefabPostInit.wilson then -- 可能是老版本
            local postinitfn = mod.postinitfns.PrefabPostInit.wilson[1] -- 提取postinit
            for k, v in pairs(mod.postinitfns.PrefabPostInit) do -- 消除原有的
                if k and v and v[1] and v[1] == postinitfn then
                    mod.postinitfns.PrefabPostInit[k] = nil
                end
            end
            local fn = function(inst)
                if inst and inst:HasTag("player") then
                    postinitfn(inst)
                end
            end
            table.insert(env.postinitfns.PrefabPostInitAny, fn)
        end
    end
end

-- 修复智能电锅不兼容mod锅的bug
local cooking = require "cooking"
AddComponentPostInit("knownfoods", function(self)
    local oldafterload = self.OnAfterLoad
    self.OnAfterLoad = function(self, config, ...)
        oldafterload(self, config, ...)
        if cooking.recipes and cooking.recipes.cookpot and cooking.recipes.portablecookpot then
            for k, v in pairs(self._knownfoods) do
                if k and v and v.cookername and type(k) == "string" and type(v.cookername) == "string" then
                    if v.cookername ~= "portablecookpot" and cooking.recipes.portablecookpot[k] then
                        v.cookername = "portablecookpot"
                    end
                    if v.cookername ~= "cookpot" and cooking.recipes.cookpot[k] then
                        v.cookername = "cookpot"
                    end
                end
            end
        end
    end
end)

if IsMythEnable() then
    STRINGS.CHARACTERS.SORA.DESCRIBE.MYTH_FOOD_ZPD = "呜呜,我才不要吃这个"
    local function TryToUnlockSkill(inst, data)
        if data.food and data.food.prefab == "sora_banhua" then -- 吃花花学仙术
            if not inst.components.builder:KnowsRecipe("myth_flyskill_sora" .. rec_back) then
                inst.components.talker:Say("恰花花,学仙术")
                inst.components.builder:UnlockRecipe("myth_flyskill_sora" .. rec_back)
            elseif not inst.components.builder:KnowsRecipe("myth_coin_box" .. rec_back) then
                inst.components.talker:Say("怎么想都是花花的错")
                inst.components.builder:UnlockRecipe("myth_coin_box" .. rec_back)
            end
        end
    end

    AddPrefabPostInit("sora", function(inst)
        if TheWorld.ismastersim then
            inst:ListenForEvent("oneat", TryToUnlockSkill)
        end
    end)
    AddPlayerPostInit(function(inst)
        inst:DoTaskInTime(0, function(i)
            if i.replica and i.replica.builder then
                local oldKnowsRecipe = i.replica.builder.KnowsRecipe
                i.replica.builder.KnowsRecipe = function(self, name, ...)
                    if type(name) == "table" then
                        name = name.name
                    end
                    if name == ("myth_flyskill" .. rec_back) and self.inst:HasTag("sora") then
                        return false
                    end
                    if name == "myth_flyskill" and self.inst:HasTag("soraflyer") then
                        return false
                    end
                    return oldKnowsRecipe(self, name, ...)
                end
            end
            if i:HasTag("sora") then
                return
            end
            i:ListenForEvent("unlockrecipe", function(p, data)
                if data and data.recipe and data.recipe == "myth_flyskill" then
                    p.components.builder:UnlockRecipe("myth_flyskill" .. rec_back)
                end
            end)
        end)

    end)
    local data = {
        owner_prefab = "sora",
        speed = 20 / 6,
        build = "mk_cloudfxsora",
        scale = 1.65,
        animspeed = 0.8,
        sanity_penalty = 0,
        radius = 1, -- 半径更大
        tail = {
            build = "mk_cloudfxsora",
            changealpha = true,
            changescale = true,
            scale = 1.5,
            fadetime = 1
        }
    }
    local first
    AddComponentPostInit("mk_flyer", function(self) -- 怎么想都是花花的错
        if not first then
            first = true
            if self.SetMyClond then -- 都怪花花写错字母
                self:SetMyClond(data)
            elseif self.SetMyCloud then
                self:SetMyCloud(data)
            else
                local t = up.Get(self.SetFlying, "FlyConfig")
                if t then
                    t:AddData(data)
                end
            end
        end
    end)

    AddLaterFn(function()
        local function helperfn()
            return SpawnPrefab("myth_flyskill_pg")
        end
        local prefabname = "myth_flyskill_sora"
        local prefab = GLOBAL.Prefab(prefabname, helperfn, PlayerAssets)
        RegisterPrefabs(prefab)
        TheSim:LoadPrefabs({prefabname})
        AddPrefabPostInit("sora", function(i)
            if TheWorld.ismastersim then
                i.Myth_Learn_Skill = function(ii)
                    if ii.components.builder and ii.components.builder:CanLearn("myth_flyskill_sora" .. rec_back) and
                        not ii.components.builder:KnowsRecipe("myth_flyskill_sora" .. rec_back) then
                        ii.components.builder:UnlockRecipe("myth_flyskill_sora" .. rec_back)
                    end
                end
            end
        end)

        if myth_flyskill_soraflyer then
            myth_flyskill_soraflyer.atlas = "images/inventoryimages/myth_flyskill.xml"
            myth_flyskill_soraflyer.image = "myth_flyskill.tex"
            myth_flyskill_soraflyer.tab = AllRecipes.myth_flyskill.tab
        end

        local t = up.Get(ACTIONS.READ_FLY_BOOK.fn, "skills", "mythhouse")
        if t then
            t.sora = {"myth_flyskill_sora" .. rec_back}
        end
    end)
end
-- 太真兼容
AddLaterFn(function()
    for k, v in pairs(ACTIONS) do
        if k and k:match("TZCOSPLAY") then
            local oldfn = ACTIONS[k].fn
            ACTIONS[k].fn = function(act, ...)
                if act and act.doer and act.doer:HasTag("sora") then
                    act.doer.components.talker:Say("这件衣服不适合我")
                    return true
                end
                return oldfn(act, ...)
            end
        end
    end
end)

if IsModEnable("Legion") or IsModEnable("棱镜") then
    AddLaterFn(function()
        local DRESSUP_DATA_SORA = {
            sora2bag = {
                isnoskin = true,
                buildfile = "sora2bag",
                buildsymbol = "swap_body2"
            }
        }
        if not rawget(GLOBAL, "DRESSUP_DATA_LEGION") then
            rawset(GLOBAL, "DRESSUP_DATA_LEGION", {})
        end
        for k, v in pairs(DRESSUP_DATA_SORA) do
            DRESSUP_DATA_LEGION[k] = v
        end

    end)
    if TheNet:GetIsServer() then
        local fixdish_farewellcupcake = function(inst)
            if inst.components.edible and inst.components.edible.oneaten then
                local a = inst.components.edible.oneaten
                inst.components.edible.oneaten = function(i, eater, ...)
                    if eater and eater:HasTag("sora") then
                        local feeder = eater.sg and eater.sg.statemem and eater.sg.statemem.feeder

                        if feeder then
                            return a(i, feeder, ...)
                        else
                            return
                        end
                    end
                    return a(i, eater, ...)
                end
            end
        end

        local modprefabinitfns = up.Get(SpawnPrefabFromSim, "modprefabinitfns", "mainfunctions.lua")
        if modprefabinitfns then
            AddSimPostInit(function()
                for k, v in pairs(GLOBAL.Prefabs) do
                    if k and
                        (k:match("dish_farewellcupcake") or k:match("explodingfruitcake") or
                            k:match("dish_friedfishwithpuree")) then
                        if not modprefabinitfns[k] then
                            modprefabinitfns[k] = {}
                        end
                        table.insert(modprefabinitfns[k], fixdish_farewellcupcake)
                    end
                end
            end)

        end
    end
end
if IsModEnable("taizhen") or IsModEnable("太真") or IsModEnable("2066838067") or IsModEnable("2199027653598516676") then
    if TheNet:GetIsServer() then
        local fixghost_holly_dai = function(inst)
            if inst.components.edible and inst.components.edible.oneaten then
                local a = inst.components.edible.oneaten
                inst.components.edible.oneaten = function(i, eater, ...)
                    if eater and eater:HasTag("sora") then
                        local feeder = eater.sg and eater.sg.statemem and eater.sg.statemem.feeder

                        if feeder then
                            return a(i, feeder, ...)
                        else
                            return
                        end
                    end
                    return a(i, eater, ...)
                end
            end
        end

        local modprefabinitfns = up.Get(SpawnPrefabFromSim, "modprefabinitfns", "mainfunctions.lua")
        if modprefabinitfns then
            AddSimPostInit(function()
                for k, v in pairs(GLOBAL.Prefabs) do
                    if k and k:match("ghost_holly_dai") then
                        if not modprefabinitfns[k] then
                            modprefabinitfns[k] = {}
                        end
                        table.insert(modprefabinitfns[k], fixghost_holly_dai)
                    end
                end
            end)

        end
    end
end

if IsModEnable("Element Reaction") or IsModEnable("元素反应") then
    AddPrefabPostInit("sora", function(inst)
        inst:AddTag("cryo")
        if TheNet:GetIsServer() then
            inst.components.combat.overrideattackkeyfn = function()
                return "cryo"
            end
            local old = inst.components.combat.DoAttack
            inst.components.combat.DoAttack =
                function(self, targ, weapon, projectile, stimuli, instancemult, attackkey, ...)
                    return old(self, targ, weapon, projectile, stimuli or "cryo", instancemult, attackkey, ...)
                end
        end
    end)
    if TheNet:GetIsServer() then
        AddComponentPostInit("bundler", function(self)
            local old = self.OnFinishBundling
            self.OnFinishBundling = function(self, ...)
                if self.wrappedprefab == "sora3packer" and self.bundlinginst and self.bundlinginst.components.container then
                    local items = {}
                    local t = true
                    for i = 1, self.bundlinginst.components.container:GetNumSlots() do
                        local item = self.bundlinginst.components.container:GetItemInSlot(i)
                        if item ~= nil then
                            t = t and item:HasTag("artifacts")
                            table.insert(items, item)
                        end
                    end
                    if t and #items == 3 then
                        self.wrappedprefab = "artifactsbundle"
                        self.wrappedskinname = nil
                        self.wrappedskin_id = nil
                    end

                end
                return old(self, ...)
            end
        end)
    end
end

if IsModEnable("魔女之旅.最强魔女篇") or IsModEnable("2578692071") then
    -- 有人欺负我老婆
    AddPrefabPostInit("sora", function(inst)
        if TheWorld.ismastersim then
            local oldGetAttacked = inst.components.combat.GetAttacked
            inst.components.combat.GetAttacked = function(self, doer, dam, cause, ...)
                if dam > 2000 and
                    (not doer or doer:HasTag("elaina") or not doer:HasTag("epic") or not doer:HasTag("monster")) then
                    -- 收到超过2000点 非boss 非怪物的伤害 伊蕾娜 你看着办吧 
                    if doer then
                        if doer:HasTag("elaina") then -- 肯定是你自己打偏了！
                            return doer.components.combat:GetAttacked(doer, dam, cause, ...)
                        end
                    else
                        local eln = FindClosestEntity(self.inst, 30, {"elaina"}) -- 魔女姐姐你离我这么近 会保护我的对吧
                        return eln and eln.components.combat and
                                   eln.components.combat:GetAttacked(doer, dam, cause, ...)
                    end
                    return -- 无事发生
                end
                if doer and doer:HasTag("elaina") then
                    return -- 无事发生
                end
                return oldGetAttacked(self, doer, dam, cause, ...)
            end
        end
    end)
    LastWB = nil
    AddPrefabPostInit("elaina_pirate_stash", function(inst)
        inst:ListenForEvent("worked", function(i, data)
            if data.worker and data.worker:HasTag("player") then
                LastWB = data.worker
            end
        end)
    end)

end

AddLaterFn(function() -- 怎么想都是花花的错
    local oldfn = ACTIONS.CASTAOE.stroverridefn
    ACTIONS.CASTAOE.stroverridefn = function(act, ...)
        if act.invobject and act.invobject:HasTag("soraspellbook") and act.invobject.components.spellbook then
            return act.invobject.components.spellbook:GetSpellName()
        end
        return oldfn(act, ...)
    end
end)

if IsModEnable("Functional Medal") or IsModEnable("能力勋章") or IsModEnable("workshop-1909182187") then
    AddPrefabPostInit("sora", function(inst)
        local oldCanSoulhop = inst.CanSoulhop
        inst.CanSoulhop = function(inst, souls, ...)
            if oldCanSoulhop and oldCanSoulhop(inst, souls, ...) then
                return true
            end
            if inst:HasTag("medal_map_blinker") then
                inst.nosorasouldouble = 1
                local has, num = inst.replica.inventory:Has("wortox_soul", souls or 1)
                inst.nosorasouldouble = nil
                num = num + math.floor(inst.replica.sanity:GetCurrent() / 5)
                if num > (souls or 1) then
                    local rider = inst.replica.rider
                    if rider == nil or not rider:IsRiding() then
                        return true
                    end
                end
            end
            return false
        end
        if TheWorld.ismastersim then
            local oldinventoryHas = inst.components.inventory.Has
            inst.components.inventory.Has = function(inv, item, amount, checkallcontainers, ...)
                if item == "wortox_soul" and not inst.nosorasouldouble then
                    local old, num = oldinventoryHas(inv, item, amount, checkallcontainers, ...)
                    num = num + math.floor(inst.components.sanity.current / 5)
                    return num >= amount, num
                end
                return oldinventoryHas(inv, item, amount, checkallcontainers, ...)
            end
            local oldinventoryConsumeByName = inst.components.inventory.ConsumeByName
            inst.components.inventory.ConsumeByName = function(inv, item, amount, ...)
                if item == "wortox_soul" then
                    local old, num = oldinventoryHas(inv, item, amount, ...)
                    local souls = math.min(num, amount)
                    if souls < amount then
                        inst.components.sanity:DoDelta(-5 * (amount - souls))
                    end
                    return oldinventoryConsumeByName(inv, item, souls, checkallcontainers, ...)
                end
                return oldinventoryConsumeByName(inv, item, amount, checkallcontainers, ...)
            end
        end
    end)
    local function FixDoDeltaMedalDelayDamage(inst)
        if inst.components.health and inst.components.health.DoDeltaMedalDelayDamage then
            local oldDoDeltaMedalDelayDamage = inst.components.health.DoDeltaMedalDelayDamage
            function inst.components.health:DoDeltaMedalDelayDamage(amount, ...)
                if amount > 0 then
                    if inst:HasTag("sora") then
                        amount = amount * 0.7
                    end
                    if inst.components.inventory then
                        inst.components.inventory:ForEachEquipment(function(item)
                            if item and item.sorashizhishang then
                                amount = amount - item.sorashizhishang
                            end
                        end)
                    end
                    amount = math.max(0, math.floor(amount))
                    if amount == 0 then
                        return
                    end
                end
                return oldDoDeltaMedalDelayDamage(self, amount, ...)
            end
        end
    end
    local sorashizhishang = {
        sora2bag = 3,
        sora2armot = 3,
        sora2hat = 3,
        sora2amulet = 3,
        soraclothes = 5,
        sorahat = 5,
        sorabag = 5,
        sorabowknot = 5
    }
    for k, v in pairs(sorashizhishang) do
        AddPrefabPostInit(k, function(inst)
            inst.sorashizhishang = v
        end)
    end
    AddPlayerPostInit(function(inst)
        if TheWorld.ismastersim then
            inst:DoTaskInTime(0, FixDoDeltaMedalDelayDamage)
        end
    end)
end

local AllToEquip = {}
if IsModEnable("Xuaner") or IsModEnable("【璇儿】") then
    AllToEquip.myxl_fan = 1
end

AddMulPrefabPostInit(AllToEquip, function(inst)
    inst.HelpBySora = true
    if inst.components.equippable then
        local old = inst.components.equippable.IsRestricted
        inst.components.equippable.IsRestricted = function(self, target, ...)
            if target and target:HasTag("sora") then
                return false
            end
            return old(self, target, ...)
        end
    end
    inst:DoTaskInTime(1, function()
        if inst.replica.equippable then
            local old = inst.replica.equippable.IsRestricted
            inst.replica.equippable.IsRestricted = function(self, target, ...)
                if target and target:HasTag("sora") then
                    return false
                end
                return old(self, target, ...)
            end
        end
    end)
end)

AddLaterFn(function()
    if AddActionQueuerAction then
        AddActionQueuerAction("allclick", "SORAPHOTO", true)
        AddActionQueuerAction("allclick", "SORAPACK", true)
        AddActionQueuerAction("allclick", "SORAUNPACK", true)
        AddActionQueuerAction("allclick", "SORAGIFT", true)
        AddActionQueuerAction("allclick", "SORAREPAIR", true)
    end
end)
