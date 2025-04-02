--[[能力卡牌
	暗牌，冰牌，创牌，大牌，风牌，浮牌
	工作牌，光牌，花牌，回牌，火牌，剑牌
	力牌，时牌，矢牌，树牌，双牌，水牌，
	睡牌，甜牌，土牌，消牌，小牌，移牌
	影牌

--]] 


local function ccs_cards_usefn5(inst, owner, pos)
    local x, y, z = pos.x, pos.y, pos.z
    local xf = SpawnPrefab("ccs_xf")
    local level = inst.components.ccs_card_level:GetLevel()
    local dam = 10
    if level == 2 then
        dam = 30
    elseif level == 3 then
        dam = 50
    elseif level == 4 then
        dam = 150
    end
    if level == 4 then
        xf:SetDuration(20)
    else
        xf:SetDuration(10)
    end
    xf.Transform:SetScale(3, 3, 3)
    xf.Transform:SetPosition(x, y, z)
    xf:DoPeriodicTask(1, function()
        local ents = TheSim:FindEntities(x, y, z, 3, nil, {"player", "FX"})
        for k, v in pairs(ents) do
            if v and v.components and v.components.combat and
                v.components.health then
                v.components.combat:GetAttacked(owner, dam, owner)
            end
        end
    end, 0)
    if owner then
        local js = level * 0.1
        owner.components.locomotor:SetExternalSpeedMultiplier(owner, "ccs_cards_use5", 1 + js)
    end
    return true
end

local function ccs_cards_usefn2(inst, owner)
    owner.components.debuffable:AddDebuff("ccs_card_bp", "ccs_card_bp")
end

local function CLIENT_CanDeployDockKit(inst, pt, mouseover, deployer, rotation)
    local tile = TheWorld.Map:GetTileAtPoint(pt.x, 0, pt.z)
    if (tile == WORLD_TILES.OCEAN_COASTAL_SHORE or tile ==
        WORLD_TILES.OCEAN_COASTAL) then
        local tx, ty = TheWorld.Map:GetTileCoordsAtPoint(pt.x, 0, pt.z)
        local found_adjacent_safetile = false
        for x_off = -1, 1, 1 do
            for y_off = -1, 1, 1 do
                if (x_off ~= 0 or y_off ~= 0) and
                    IsLandTile(TheWorld.Map:GetTile(tx + x_off, ty + y_off)) then
                    found_adjacent_safetile = true
                    break
                end
            end

            if found_adjacent_safetile then break end
        end

        if found_adjacent_safetile then
            local center_pt = Vector3(TheWorld.Map:GetTileCenterPoint(tx, ty))
            return found_adjacent_safetile and
                       TheWorld.Map:CanDeployDockAtPoint(center_pt, inst,
                                                         mouseover)
        end
    end

    return false
end

local function ccs_cards_usefn25(inst, owner)
    if owner:HasTag("isbf") then
        owner.components.talker:Say("当前已经是蝙蝠形态了")
        return
    end
    local level = inst.components.ccs_card_level:GetLevel()
    local dam = 30
    if level >= 2 then dam = 50 end
    owner:AddTag("isbf")
    owner.components.locomotor:SetExternalSpeedMultiplier(owner, "ccs_cards25",
                                                          1.4)
    owner.AnimState:AddOverrideBuild("player_transparent")
    owner.components.health:SetInvincible(true)
    if owner.ccs_cards_25_fx == nil then
        owner.ccs_cards_25_fx = {}

        local fx = SpawnPrefab("ccs_fx3")
        local x, z, y = owner:GetPosition():Get()
        fx.entity:SetParent(owner.entity)
        fx.entity:AddFollower()
        fx.dam = dam
        fx.Follower:FollowSymbol(owner.GUID, "hair", 0, 100, 0) ---左0右偏移,  -上0下偏移

        table.insert(owner.ccs_cards_25_fx, fx)
    end
end

local function ccs_cards_usefn1(inst, owner)
    TheWorld:PushEvent("ms_setclocksegs", {day = 0, dusk = 0, night = 16})
end

local function ccs_cards_usefn8(inst, owner)
    TheWorld:PushEvent("ms_setclocksegs", {day = 16, dusk = 0, night = 0})
end

local function CanDeployAnyWhere() return true end

local function zhongzhi(item, owner, maxplant)
    local x, y, z = owner.Transform:GetWorldPosition()
    x = x + 4
    local pos = Vector3(x, y, z)
    local ents = TheSim:FindEntities(x, y, z, 1.5, nil, {
        "FX", "NOBLOCK", "NOCLICK", "player", "INLIMBO"
    })
    local num = #ents
    if item and item.components.deployable and not item.prefab:match("^turf_") and
        not (item.components.deployable.mode == DEPLOYMODE.TURF) then
        if num >= maxplant then
            owner.components.talker:Say(
                "种植地附近作物太多，换个位置试试")
            return
        end
        local item2 = owner.components.inventory:RemoveItem(item, true)
        if item2.components.stackable then
            for i = 1, item2.components.stackable.stacksize do
                if num >= maxplant then
                    if item2 and item2:IsValid() then
                        owner.components.inventory:GiveItem(item2)
                    end
                    return
                end
                local one = item2.components.stackable:Get()
                one.components.deployable.CanDeploy = CanDeployAnyWhere
                one.components.deployable.IsDeployable = CanDeployAnyWhere
                one.components.deployable:Deploy(pos, owner or item2)
                num = num + 1
            end
        else
            num = num + 1
            item2.components.deployable.CanDeploy = CanDeployAnyWhere
            item2.components.deployable:Deploy(pos, owner or item2)
        end
    end
end

local function ccs_cards_usefn16(inst, owner)
    local level = inst.components.ccs_card_level:GetLevel()
    local x, y, z = owner:GetPosition():Get()
    local ents = TheSim:FindEntities(x, y, z, 30, nil, {"FX"})
    for k, v in pairs(ents) do
        if v and v.components then
            if v.components.crop then
                if not (v.components.crop:IsReadyForHarvest() or
                    v:HasTag("withered")) then
                    v.components.crop:Fertilize(inst, owner)
                end
            elseif v.components.grower then
                if v.components.grower:IsEmpty() then
                    v.components.grower:Fertilize(inst, owner)
                end
            elseif v.components.pickable then
                if v.components.pickable:CanBeFertilized() then
                    v.components.pickable:Fertilize(inst, owner)
                    TheWorld:PushEvent("CHEVO_fertilized",
                                       {target = v, doer = owner})
                end
            elseif v.components.quagmire_fertilizable then
                act.target.components.quagmire_fertilizable:Fertilize(inst,
                                                                      owner)
            end
        end
    end
    local item1 = owner.components.inventory.itemslots[1]
    local item2 = owner.components.inventory.itemslots[2]
    if level >= 2 then
        if item1 then zhongzhi(item1, owner, 50) end
        if item2 then zhongzhi(item2, owner, 50) end
    end
end

local function ccs_cards_usefn6(inst, owner)
    local pos = owner:GetPosition()
    for k, v in pairs(AllPlayers) do
        local x1, y1, z1 = v:GetPosition():Get()
        local card_fx = SpawnPrefab("ccs_fx4")
        card_fx.pos = pos
        card_fx.Transform:SetPosition(x1 - 5, y1, z1)
    end
end

local function ccs_cards_usefn19(inst, owner)
    local pos = owner:GetPosition()
    local num = 50

    for k, ent in pairs(TheSim:FindEntities(pos.x, pos.y, pos.z, 15, nil,
                                            {"player", "FX"})) do
        local x, y, z = ent:GetPosition():Get()
        if not (ent.components.freezable ~= nil and
            ent.components.freezable:IsFrozen()) and -- 无法被冰冻
            not (ent.components.pinnable ~= nil and
                ent.components.pinnable:IsStuck()) then
            if ent.components.sleeper ~= nil then -- 可以催眠的话
                SpawnPrefab("fx_book_sleep").Transform:SetPosition(x, y, z)
                ent.components.sleeper:AddSleepiness(num, num)
            elseif ent.components.grogginess ~= nil then
                SpawnPrefab("fx_book_sleep").Transform:SetPosition(x, y, z)
                ent.components.grogginess:AddGrogginess(num, num)
            end
        end
    end
end

local function ccs_cards_usefn26(inst, owner)
    if owner.components.inventory:EquipHasTag("ccs_magic_wand3") or owner.components.inventory:EquipHasTag("ccs_starstaff") then
        owner.components.ccs_flying:Fly()
    else
        owner.components.talker:Say("需要手持魔杖")
    end
end

local function ccs_cards_usefn4(inst, owner)
    if owner.ccs_card24_enble ~= true then
        owner.ccs_card24_enble = true
        owner.Transform:SetScale(2, 2, 2)
    else
        owner.components.talker:Say("当前已经使用大牌变大过了")
    end
end

local function ccs_cards_usefn23(inst, owner)
    if owner.ccs_card24_enble == true then
        owner.ccs_card24_enble = false
        owner.Transform:SetScale(1, 1, 1)
    else
        owner.components.talker:Say("当前没有使用大牌变大过")
    end
end

local function ccs_cards_usefn21(inst, owner)
    local level = inst.components.ccs_card_level:GetLevel()
    local skin_build = inst:GetSkinBuild()
    local x, y, z = owner:GetPosition():Get()
    if level >= 2 then
        local ents = TheSim:FindEntities(x, y, z, 30, {"player"})
        for k, v in pairs(ents) do
            if v and v:HasTag("player") then
                if skin_build and skin_build == "ccs_cards_21_skins1" then
                    v:AddDebuff("ccs_card_dp1", "ccs_card_dp1")
                else
                    v:AddDebuff("ccs_card_dp", "ccs_card_dp")
                end
                
            end
        end
    else
        if skin_build and skin_build == "ccs_cards_21_skins1" then
            owner:AddDebuff("ccs_card_dp1", "ccs_card_dp1")
        else
            owner:AddDebuff("ccs_card_dp", "ccs_card_dp")
        end
    end
end

local function PlayStageAnim(inst, anim, pre_override)
    if POPULATING or inst:IsAsleep() then
        inst.AnimState:PlayAnimation("crop_" .. anim, true)
        inst.AnimState:SetTime(10 + math.random() * 2)
    else
        local grow_anim = pre_override or ("grow_" .. anim)
        inst.AnimState:PlayAnimation(grow_anim, false)
        inst.AnimState:PushAnimation("crop_" .. anim, true)

        -- PlaySound(inst, grow_anim)
    end

    local scale = inst.scale or 1
    inst.Transform:SetScale(scale, scale, scale)
end

local PLANT_DEFS = require("prefabs/farm_plant_defs").PLANT_DEFS
local WEIGHTED_SEED_TABLE = require("prefabs/weed_defs").weighted_seed_table
local function pickfarmplant()
	if math.random() < TUNING.FARM_PLANT_RANDOMSEED_WEED_CHANCE then
		return weighted_random_choice(WEIGHTED_SEED_TABLE)
	else
		local season = TheWorld.state.season
		local weights = {}
		local season_mod = TUNING.SEED_WEIGHT_SEASON_MOD

		for k, v in pairs(VEGGIES) do
			weights[k] = v.seed_weight * ((PLANT_DEFS[k] and PLANT_DEFS[k].good_seasons[season]) and season_mod or 1)
		end

		return "farm_plant_" .. weighted_random_choice(weights)
	end
	return "weed_forgetmelots"
end

local function ReplaceWithPlant(inst)
	local plant_prefab = inst._identified_plant_type or pickfarmplant()
	local plant = SpawnPrefab(plant_prefab)
	plant.Transform:SetPosition(inst.Transform:GetWorldPosition())

	if plant.plant_def ~= nil then
		plant.no_oversized = true
		plant.long_life = inst.long_life
		plant.components.farmsoildrinker:CopyFrom(inst.components.farmsoildrinker)
		plant.components.farmplantstress:CopyFrom(inst.components.farmplantstress)
		plant.components.growable:DoGrowth()
		plant.AnimState:OverrideSymbol("veggie_seed", "farm_soil", "seed")
	end

	inst.grew_into = plant -- so the caller can get the new plant that replaced this object
	inst:Remove()
	return plant
end

local function trygrowth(inst, level)
    if inst:IsInLimbo() then return end
    if inst:HasTag("withered") then inst:RemoveTag("withered") end
    if inst.components.pickable ~= nil then
        if inst.components.pickable:CanBePicked() and
            inst.components.pickable.caninteractwith then return end
        inst.components.pickable:FinishGrowing()
    end

    if inst.components.crop ~= nil then
        inst.components.crop:DoGrow(TUNING.TOTAL_DAY_TIME * 10, true)
        if TheWorld.state.iswinter then end
    end

    if inst.components.harvestable ~= nil and
        inst.components.harvestable:CanBeHarvested() and
        inst:HasTag("mushroom_farm") then inst.components.harvestable:Grow() end

    if inst.components.crop_legion ~= nil then
        inst.components.crop_legion:DoGrow(TUNING.TOTAL_DAY_TIME * 10, true)
    end

    if inst.components.timer then
        if inst.components.timer:TimerExists("grow") then
            inst.components.timer:StopTimer("grow")
            inst:PushEvent("timerdone", {name = "grow"})
        end
        if inst.components.timer:TimerExists("growth") then
            inst.components.timer:StopTimer("growth")
            inst:PushEvent("timerdone", {name = "growth"})
        end
        if inst.components.timer:TimerExists("growup") then
            inst.components.timer:StopTimer("growup")
            inst:PushEvent("timerdone", {name = "growup"})
        end
    end

    if inst.components.worldsettingstimer and
        inst.components.worldsettingstimer:TimerExists("grow") then
        inst.components.worldsettingstimer:StopTimer("grow")
        inst:PushEvent("timerdone", {name = "grow"})
    end
    if inst.components.worldsettingstimer and
        inst.components.worldsettingstimer:TimerExists("growth") then
        inst.components.worldsettingstimer:StopTimer("growth")
        inst:PushEvent("timerdone", {name = "growth"})
    end

    if inst.components.growable and inst.components.perennialcrop then
        if not inst.ccs_magic then
            inst.force_oversized = true
            inst.components.growable.stage = 1
            inst.ccs_magic = true
            inst.components.perennialcrop.moisture = 999
            inst.components.perennialcrop.nutrient = 999
            inst.components.perennialcrop.nutrientgrow = 999
            inst.components.perennialcrop.nutrientsick = 999
            inst.components.perennialcrop.sickness = 0
            inst.components.perennialcrop.infested = 0

            inst.components.perennialcrop.moisture_max = 999
            inst.components.perennialcrop.nutrient_max = 999
            inst.components.perennialcrop.nutrientgrow_max = 999
            inst.components.perennialcrop.nutrientsick_max = 999
            inst.components.perennialcrop.pollinated_max = 0
            inst.components.perennialcrop.infested_max = 1000
            inst.components.perennialcrop.cost_moisture = 0
            inst.components.perennialcrop.cost_nutrient = 0
            inst.components.perennialcrop.can_getsick = false
            inst.components.perennialcrop.killjoystolerance = 3
        end
        for i = inst.components.growable.stage, 6 do
            if inst.components.growable.domagicgrowthfn ~= nil then
                inst.components.growable:DoMagicGrowth()
            else
                inst.components.growable:DoGrowth()
            end
        end
    end

    if inst.components.growable ~= nil and
        (inst:HasTag("tree") or inst:HasTag("peachtree") or inst:HasTag("plant") or
            inst:HasTag("winter_tree") or inst:HasTag("boulder") or
            inst:HasTag("siving_derivant") or
            inst.components.growable.magicgrowable) then
        local stage = inst.components.growable.stage
        local maxstage = #inst.components.growable.stages
        if inst:HasTag("evergreens") then maxstage = maxstage - 1 end
        if inst:HasTag("siving_derivant") then
            inst.components.growable:DoGrowth()
            inst.components.growable:DoMagicGrowth()
            inst.components.growable:DoMagicGrowth()
            inst.components.growable:DoMagicGrowth()
        else
            if stage == maxstage then
                inst.components.growable:Pause()
            elseif stage == maxstage - 1 then
                inst.components.growable:DoGrowth()
                inst.components.growable:Pause()
            else
                inst.components.growable:DoGrowth()
            end
        end
    end

    if inst.components.growable then
        if inst.components.growable.magicgrowable or ((inst:HasTag("tree") or inst:HasTag("winter_tree")) and not inst:HasTag("stump")) then
            if inst.components.simplemagicgrower ~= nil then
                inst.components.simplemagicgrower:StartGrowing()
            elseif inst.components.growable.domagicgrowthfn ~= nil
                and inst.components.farmplantstress and inst.components.farmplanttendable then
                local new_plant = nil
                if inst.prefab == "farm_plant_randomseed" then
                    inst.components.growable.stages = {}
                    new_plant = ReplaceWithPlant(inst)
                end
                local plant = new_plant or inst
                local maxstage = #plant.components.growable.stages
                plant.force_oversized = true
                plant:DoTaskInTime(.1, function()
                    for i = 1, 4 do
                        plant:DoTaskInTime(.3, function()
                            local stage = plant.components.growable.stage
                            if stage == maxstage - 1 and plant.components.growable.stages[stage].name == "full" then
                                plant.components.growable:Pause()
                            else
                                plant.components.growable:DoGrowth()
                            end
                        end)
                    end
                end)
            else
                inst.components.growable:DoGrowth()
            end
        end
    end
end

local function ccs_cards_usefn9(inst, owner)
    local level = inst.components.ccs_card_level:GetLevel()
    local x, y, z = owner:GetPosition():Get()
    local ents = TheSim:FindEntities(x, y, z, level * 15)
    for k, v in pairs(ents) do if v then trygrowth(v, level) end end
end

local function onequip(inst, owner) end

local function onunequip(inst, owner) end

local function onequip2(inst, owner)
    owner:AddComponent("groundpounder")
    owner.components.groundpounder.destroyer = true
    owner.components.groundpounder.damageRings = 2
    owner.components.groundpounder.destructionRings = 2
    owner.components.groundpounder.platformPushingRings = 2
    owner.components.groundpounder.numRings = 3
end

local function onunequip2(inst, owner) owner:RemoveComponent("groundpounder") end

local DESTROYSTUFF_CANT_TAGS = {"INLIMBO", "NET_workable"}
local function destroystuff(pos, doer)
    local x, y, z = pos.x, pos.y, pos.z
    local ents = TheSim:FindEntities(x, y, z, 5.8, nil, DESTROYSTUFF_CANT_TAGS)
    for i, v in ipairs(ents) do
        if v:IsValid() and v.components.workable ~= nil and
            v.components.container == nil and
            v.components.workable:CanBeWorked() and v.components.workable.action ~=
            ACTIONS.NET then
            SpawnPrefab("collapse_small").Transform:SetPosition(
                v.Transform:GetWorldPosition())
            v.components.workable:Destroy(doer)
        end
    end
end

local function ccs_cards_usefn13(inst, doer, pos)
    if doer == nil or pos == nil then return false end
    destroystuff(pos, doer)
    return true
end

local nj_tab = {
    {level = 1, num = 0.1}, {level = 2, num = 0.2}, {level = 3, num = 0.4},
    {level = 4, num = 1}, {level = 5, num = 1.5}
}

local function RestoreDurability(card, pos)
    local num = 0.1 -- 恢复的耐久
    local max = 1 -- 极限耐久
    local level = card.components.ccs_card_level:GetLevel() or 1

    for k, v in pairs(nj_tab) do if level == v.level then num = v.num end end
    if level >= 4 then
        max = 3
    elseif level >= 3 then
        max = 1.5
    end

    local count = 0
    local ents = TheSim:FindEntities(pos.x, pos.y, pos.z, 5, nil,
                                     {"playerghost", "player", "monster"})
    for k, ent in pairs(ents) do
        --if count < 3 then
            local fx = SpawnPrefab("atrium_gate_activatedfx")
            fx.Transform:SetPosition(pos.x, pos.y, pos.z)
            fx:DoTaskInTime(1, function() fx:Remove() end)
            if ent.components.armor ~= nil then
                local newbfb = ent.components.armor:GetPercent() + num -- 增加
                if newbfb >= max then -- 如果大于极限耐久的话，就将它设置为极限耐久	
                    ent.components.armor:Ccs_SetPercent(max)
                else
                    ent.components.armor:Ccs_SetPercent(newbfb)
                end
                count = count + 1
            elseif ent.components.finiteuses ~= nil then
                local newbfb = ent.components.finiteuses:GetPercent() + num
                if newbfb >= max then
                    ent.components.finiteuses:SetPercent(max)
                else
                    ent.components.finiteuses:SetPercent(newbfb)
                end
                count = count + 1
            elseif ent.components.fueled ~= nil then -- 燃料,应该还有，待补充
                local newbfb = ent.components.fueled:GetPercent() + num
                if newbfb >= 1 then
                    ent.components.fueled:SetPercent(1)
                else
                    ent.components.fueled:SetPercent(newbfb)
                end
                count = count + 1
            end
        end
    --end
end

local function ccs_cards_usefn10(inst, doer, pos)
    if doer == nil or pos == nil then return false end
    RestoreDurability(inst, pos)

    return true
end

local function ccs_cards_usefn27(inst, doer, pos)
    local level = inst.components.ccs_card_level:GetLevel() or 1
    local x, y, z = doer:GetPosition():Get()

    if level >= 3 then
        local ents = TheSim:FindEntities(x, y, z, 15, {"player"})
        for k, v in pairs(ents) do
            if v and v:HasTag("player") then
                if v.components.drownable then
                    v.components.drownable.enabled = false
                end
                RemovePhysicsColliders(v)
            end
        end
    end

    if level <= 2 then
        doer:AddDebuff("ccs_card_fp" .. level, "ccs_card_fp" .. level)
    end

    return true
end

local card3_monster_tab = {
	"spider",
	"spider_warrior",
	"spider_hider",
	"spider_moon",
	"spider_healer",
	"spiderqueen",
	"leif",
	"firehound",
	"icehound",
	"hound",
	"warg",
	"bat",
	"bishop",
	"knight",
	"rook",
	"beequeen",
	"bearger",
	"deerclops",
	"dragonfly",
	--"shadow_knight",
	"shadow_rook",
	"shadow_bishop",
}

local function ccs_cards_usefn3(inst,doer)
	local pos = doer:GetPosition()
    local level = inst.components.ccs_card_level:GetLevel() or 1
    local x, y, z = doer:GetPosition():Get()
	if level < 2 then
        doer.components.talker:Say(
            "创牌二级及以上才可范围使用，使用失败")
        return true
    end
	local a = math.random(1,#card3_monster_tab)
	local bossname = card3_monster_tab[a]
	local boss = SpawnPrefab(bossname)
	if string.sub(bossname,1,6) == "shadow" then
		boss.LevelUp(boss, 3)
	end
	boss.Transform:SetPosition(pos.x,pos.y,pos.z)
	return true
end

local function ccs_cards_usefn28(inst, doer, pos)
    local level = inst.components.ccs_card_level:GetLevel() or 1
    local x, y, z = doer:GetPosition():Get()

    if level == 1 then
        doer.components.talker:Say(
            "爱牌二级及以上才可范围使用，使用失败")
        return true
    end
    if level == 2 then
        local ents = TheSim:FindEntities(x, y, z, 15, {"playerghost"})
        for k, v in pairs(ents) do
            if v and v:HasTag("playerghost") then
                v:PushEvent("respawnfromghost", {user = doer})
            end
        end
    end
    if level == 3 then
        for k, v in pairs(AllPlayers) do
            if v and v:HasTag("playerghost") then
                v:PushEvent("respawnfromghost", {user = doer})
            end
        end
    end

    return true
end

local ccs_cards = {
    ccs_cards_1 = {
        chname = "暗牌",
        describe = "他好像黑漆漆的",
        tag = {"ccs_card_use"},
        onuse = true,
        usefn = ccs_cards_usefn1,
        cost = 50,
        maxlevel = 1,
		column = "ccs_tab4",
    },
    ccs_cards_2 = {
        chname = "冰牌",
        describe = "让我感到寒冷",
        tag = {"ccs_card_use"},
        onuse = true,
        usefn = ccs_cards_usefn2,
        cost = 50,
        maxlevel = 2,
		column = "ccs_tab3",
    },
    ccs_cards_3 = {
        chname = "创牌",
        describe = "强力的卡牌",
        tag = {"ccs_card_use"},
        onuse = true,
        usefn = ccs_cards_usefn3,
        maxlevel = 2,
		cost = function(level) return level == 2 and 100 or 0 end,
		column = "ccs_tab4",
    },
    ccs_cards_4 = {
        chname = "大牌",
        describe = "他可以让我变的很大",
        tag = {"ccs_card_use"},
        onuse = true,
        usefn = ccs_cards_usefn4,
        cost = 5,
        maxlevel = 1,
		column = "ccs_tab4",
    },
    ccs_cards_5 = {
        chname = "风牌",
        describe = "召唤飓风召唤大量伤害",
        tag = {},
        spellfn = ccs_cards_usefn5,
        cost = 20,
        equip = true,
        aoe = true,
        onequip = onequip,
        onunequip = onunequip,
        maxlevel = 3
    },
    ccs_cards_6 = {
        chname = "歌牌",
        describe = "让朋友们到我的身边",
        tag = {"ccs_card_use"},
        onuse = true,
        usefn = ccs_cards_usefn6,
        cost = 40,
        maxlevel = 1,
		column = "ccs_tab4",
    },
    ccs_cards_7 = {
        chname = "工作牌",
        describe = "在建造工程上有很大的用途",
        tag = {},
        maxlevel = 1,
		stackable = true,
    },
    ccs_cards_8 = {
        chname = "光牌",
        describe = "卡牌上有闪亮的 光芒",
        tag = {"ccs_card_use"},
        onuse = true,
        cost = 50,
        usefn = ccs_cards_usefn8,
        maxlevel = 1,
		column = "ccs_tab4",
    },
    ccs_cards_9 = {
        chname = "花牌",
        describe = "花，我看到了卡牌上的花世界~",
        tag = {"ccs_card_use"},
        onuse = true,
        usefn = ccs_cards_usefn9,
        costsan = function(level) return level == 4 and 35 or level > 1 and 80 or 40 end,
        maxlevel = 4,
		column = "ccs_tab2",
    },
    ccs_cards_10 = {
        chname = "回牌",
        describe = "让物体们回复耐久",
        tag = {"ccs_use_card_10"},
        rechargeable = true,
        spellfn = ccs_cards_usefn10,
        onequip = onequip,
        onunequip = onunequip,
        equip = true,
        aoe = true,
        cost = 50,
        maxlevel = 4
    },
    ccs_cards_11 = {
        chname = "火牌",
        describe = "火球，大火球！",
        tag = {},
        maxlevel = 3
    },
    ccs_cards_12 = {
        chname = "剑牌",
        describe = "以杖为剑",
        tag = {"ccs_cards_12"},
        maxlevel = 4
    },
    ccs_cards_13 = {
        chname = "力牌",
        describe = "灰常具有力量的卡牌",
        tag = {},
        spellfn = ccs_cards_usefn13,
        onequip = onequip2,
        onunequip = onunequip2,
        cost = 20,
        equip = true,
        aoe = true,
        maxlevel = 1
    },
    ccs_cards_15 = {
        chname = "矢牌",
        describe = "让武器变的锋利",
        tag = {},
        maxlevel = 4
    },
    ccs_cards_16 = {
        chname = "树牌",
        describe = "让植物们变的开心些",
        tag = {"ccs_card_use"},
        onuse = true,
        is_fertilizer = true,
        usefn = ccs_cards_usefn16,
        cost = 30,
        maxlevel = 2,
		column = "ccs_tab2",
    },
    ccs_cards_17 = {
        chname = "双牌",
        describe = "给自己增添一些小惊喜",
        tag = {},
        maxlevel = 1
    },
    ccs_cards_18 = {
        chname = "水牌",
        describe = "移山填海",
        tag = {"ccs_cards_18"},
        reclamation = true,
        CLIENT_CanDeployDockKit = CLIENT_CanDeployDockKit,
        maxlevel = 1
    },
    ccs_cards_19 = {
        chname = "睡牌",
        describe = "我想你需要休息一下",
        tag = {"ccs_card_use"},
        onuse = true,
        usefn = ccs_cards_usefn19,
        cost = 5,
        maxlevel = 1,
		column = "ccs_tab3",
    },
    ccs_cards_20 = {
        chname = "甜牌",
        describe = "做饭做饭，我最会做饭了",
        tag = {"ccs_cards_20"},
        maxlevel = 2
    },
    ccs_cards_21 = {
        chname = "土牌",
        describe = "让自己变的跟土地一样",
        tag = {"ccs_card_use"},
        onuse = true,
        usefn = ccs_cards_usefn21,
        cost = 5,
        maxlevel = 2,
		column = "ccs_tab3",
    },
    ccs_cards_22 = {
        chname = "消牌",
        describe = "敌人怎么消失惹",
        tag = {},
        maxlevel = 1
    },
    ccs_cards_23 = {
        chname = "小牌",
        describe = "变回最初的样子",
        tag = {"ccs_card_use"},
        onuse = true,
        cost = 5,
        usefn = ccs_cards_usefn23,
        maxlevel = 1,
		column = "ccs_tab4",
    },
    ccs_cards_24 = {
        chname = "移牌",
        describe = "空间的力量",
        tag = {"ccs_cards_24"},
        maxlevel = 3
    },
    ccs_cards_25 = {
        chname = "影牌",
        describe = "暗影的力量",
        tag = {"ccs_card_use"},
        onuse = true,
        usefn = ccs_cards_usefn25,
        cost = 30,
        maxlevel = 2,
		column = "ccs_tab3",
    },
    ccs_cards_26 = {
        chname = "飞牌",
        describe = "飞行的力量",
        tag = {"ccs_card_use"},
        onuse = true,
        usefn = ccs_cards_usefn26,
        cost = 5,
        maxlevel = 1,
		column = "ccs_tab2",
    },
    ccs_cards_27 = {
        chname = "浮牌",
        describe = "让大家浮起来",
        tag = {"ccs_card_use"},
        onuse = true,
        usefn = ccs_cards_usefn27,
        cost = function(level)
            return level > 4 and 150 or level > 1 and 100 or 20
        end,
        maxlevel = 3,
		column = "ccs_tab4",
    },
    ccs_cards_28 = {
        chname = "爱牌",
        describe = "少责备，多关怀",
        tag = {"ccs_card_use"},
        onuse = true,
        usefn = ccs_cards_usefn28,
        cost = function(level) return level > 2 and 100 or 20 end,
        maxlevel = 3,
		column = "ccs_tab2",
    }
}

if TUNING.CCS_CARD14_ENBLE then
    ccs_cards.ccs_cards_14 = {
        chname = "时牌",
        describe = "让时间停止",
        tag = {"ccs_cards_14"},
		column = "ccs_tab3",
    }
end
local function CheckCost(inst, owner, def)
    local level = inst.components.ccs_card_level:GetLevel() or 1
    if def.cost then
        local cost = type(def.cost) == "function" and def.cost(level) or def.cost
        if owner.components.ccs_magic:GetMagic() < cost then
            owner.components.talker:Say("魔法不足，使用失败")
            return false
        end
        owner.components.ccs_magic:DoDelta(-cost)
    end
    if def.costsan then
        local costsan =
            type(def.costsan) == "function" and def.costsan(level) or def.costsan
        if owner.components.sanity.current < costsan then
            owner.components.talker:Say("魔法不足，使用失败")
            return false
        end
        owner.components.sanity:DoDelta(-costsan)
    end

    return true
end
for k, v in pairs(ccs_cards) do
    v.name = k
	v.name2 = v.name.."magic"
    if v.usefn then
        local usefn = v.usefn
        v.usefn = function(inst, owner, pos, ...)
            return CheckCost(inst, owner, v) and usefn(inst, owner, pos, ...) or
                       true
        end
    end
    if v.spellfn then
        local spellfn = v.spellfn
        v.spellfn = function(inst, owner, pos, ...)
            return
                CheckCost(inst, owner, v) and spellfn(inst, owner, pos, ...) or
                    true
        end
    end
    STRINGS.NAMES[string.upper(k)] = v.chname
    STRINGS.CHARACTERS.GENERIC.DESCRIBE[string.upper(k)] = v.describe
	
	STRINGS.NAMES[string.upper(v.name2)] = v.chname
    STRINGS.RECIPE_DESC[string.upper(v.name2)] = v.describe
end

return ccs_cards
