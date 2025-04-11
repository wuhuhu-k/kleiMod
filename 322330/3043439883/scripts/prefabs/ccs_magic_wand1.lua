local assets =
{
	Asset("ANIM", "anim/ccs_magic_wand1.zip"),                 --动画文件
	Asset("IMAGE", "images/inventoryimages/ccs_magic_wand1.tex"), --物品栏贴图
	Asset("ATLAS", "images/inventoryimages/ccs_magic_wand1.xml"),
}

local function SetFxOwner(inst, owner, fx)
	-- if inst.blade1 then
	-- 	inst.blade1:Remove()
	-- 	inst.blade1 = nil
	-- end
	-- if inst.blade2 then
	-- 	inst.blade2:Remove()
	-- 	inst.blade2 = nil
	-- end
	if inst.blade1 == nil and fx then
		inst.blade1 = SpawnPrefab(fx)
	end
	if inst.blade2 == nil and fx then
		inst.blade2 = SpawnPrefab(fx)
	end

	if owner ~= nil then
		if inst.blade1 and inst.blade2 then
			inst.blade1.entity:SetParent(owner.entity)
			inst.blade2.entity:SetParent(owner.entity)
			inst.blade1.Follower:FollowSymbol(owner.GUID, "swap_object", nil, nil, nil, true, nil, 0, 3)
			inst.blade2.Follower:FollowSymbol(owner.GUID, "swap_object", nil, nil, nil, true, nil, 5, 8)
			inst.blade1.components.highlightchild:SetOwner(owner)
			inst.blade2.components.highlightchild:SetOwner(owner)
		end
	else
		if inst.blade1 then
			inst.blade1:Remove()
			inst.blade1 = nil
		end
		if inst.blade2 then
			inst.blade2:Remove()
			inst.blade2 = nil
		end
	end
end

local function onequip(inst, owner) --装备	
	local skin_build = inst:GetSkinBuild()
	if skin_build ~= nil then
		owner:PushEvent("equipskinneditem", inst:GetSkinName())
		owner.AnimState:OverrideItemSkinSymbol("swap_object", skin_build, "swap_weapon", inst.GUID, "swap_weapon")
	else
		owner.AnimState:OverrideSymbol("swap_object", "ccs_magic_wand1", "swap_weapon")
	end

	owner.AnimState:Show("ARM_carry")
	owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner) --解除装备
	local skin_build = inst:GetSkinBuild()
	if skin_build ~= nil then
		owner:PushEvent("unequipskinneditem", inst:GetSkinName())
	end
	owner.AnimState:Hide("ARM_carry")
	owner.AnimState:Show("ARM_normal")
end

local function ccs_spell(staff, target, pos)
	if not pos then
		pos = target:GetPosition()
	end
	local x, y, z = pos:Get()
	local ents = TheSim:FindEntities(x, y, z, 5)
	local owner = staff.components.inventoryitem.owner
	if owner == nil then return end
	for k, v in ipairs(ents) do
		if v and v.prefab == "flower" then
			return
		end
		if v.components.inventoryitem ~= nil and
			v.components.inventoryitem.canbepickedup and
			v.components.inventoryitem.cangoincontainer and
			not v.components.inventoryitem:IsHeld() then
			SpawnPrefab("sand_puff").Transform:SetPosition(v.Transform:GetWorldPosition())
			if v.components.trap ~= nil and v.components.trap:IsSprung() then
				v.components.trap:Harvest(owner)
			else
				owner.components.inventory:GiveItem(v, nil, pos)
			end
		end
		if v.components.pickable then
			v.components.pickable:Pick(owner)
		elseif v.components.harvestable then
			v.components.harvestable:Harvest(owner)
		elseif v.components.dryer then
			v.components.dryer:Harvest(owner)
			-- elseif v.components.stewer then
			-- 	v.components.stewer:Harvest(owner)
			-- elseif v.components.stewer_fur then
			-- 	v.components.stewer_fur:Harvest(owner)
		elseif v.components.crop then
			v.components.crop:Harvest(owner)
		end
	end

	local entfish = TheSim:FindEntities(x, y, z, 5, { "oceanfishable" })
	for k, v in pairs(entfish) do
		if v and v:IsValid() and v.components.oceanfishable then
			if v.components.weighable then
				v.components.weighable:SetPlayerAsOwner(owner)
			end
			owner:PushEvent("medal_fishingcollect", { fish = v })
			local projectile = v.components.oceanfishable:MakeProjectile()
			local ae_cp = v.components.complexprojectile
			if ae_cp then
				ae_cp:SetHorizontalSpeed(16)
				ae_cp:SetGravity(-12)
				ae_cp:SetLaunchOffset(Vector3(0, 0.5, 0))
				ae_cp:SetTargetOffset(Vector3(0, 0.5, 0))
				local fx = SpawnPrefab("crab_king_waterspout")
				fx.Transform:SetPosition(v:GetPosition():Get())
				local v_position = owner:GetPosition()
				ae_cp:Launch(v_position, owner)
			end
		end
	end
end

local function onuse(inst)
	local owner = inst.components.inventoryitem.owner
	if owner then
		if inst:HasTag("enble_spell") then
			owner.components.talker:Say("关闭采集功能")
			inst.components.spellcaster.spell = nil
			inst:RemoveTag("enble_spell") 
			inst:AddTag("HAMMER_tool")
			inst:AddTag("DIG_tool")
			inst:AddComponent("fishingrod")
			inst.components.fishingrod:SetWaitTimes(1, 2)
			inst.components.fishingrod:SetStrainTimes(10, 20)
		else
			owner.components.talker:Say("启用采集功能")
			inst:RemoveComponent("fishingrod")
			inst.components.spellcaster:SetSpellFn(ccs_spell)
			inst:AddTag("enble_spell")
			inst:RemoveTag("HAMMER_tool")
			inst:RemoveTag("DIG_tool")
		end
	end
	return false
end


local function fn(Sim)
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()
	--inst.entity:AddSoundEmitter()

	MakeInventoryPhysics(inst) --物理
	MakeInventoryFloatable(inst, "med", nil, 0.75)

	inst.AnimState:SetBank("ccs_magic_wand1")
	inst.AnimState:SetBuild("ccs_magic_wand1")
	inst.AnimState:PlayAnimation("idle")

	inst:AddTag("ccs_magic_wand1")
	inst:AddTag("HAMMER_tool")
	inst:AddTag("DIG_tool")
	inst:AddTag("allow_action_on_impassable")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end


	inst:AddComponent("equippable") --可装备组件
	inst.components.equippable:SetOnEquip(onequip)
	inst.components.equippable:SetOnUnequip(onunequip)
	-- inst.components.equippable.restrictedtag = "ccs"

	inst:AddComponent("inspectable") --可检查

	inst:AddComponent("inventoryitem") --物品组件
	inst.components.inventoryitem.atlasname = "images/inventoryimages/ccs_magic_wand1.xml"

	inst:AddComponent("tool")
	inst.components.tool:SetAction(ACTIONS.HAMMER) --锤子
	inst.components.tool:SetAction(ACTIONS.DIG)    --铲子
	inst.components.tool:SetAction(ACTIONS.CHOP, 5) --砍树
	inst.components.tool:SetAction(ACTIONS.MINE, 6) --挖矿
	inst.components.tool:SetAction(ACTIONS.NET)    --捕虫网
	inst.components.tool:EnableToughWork(true)

	--自动照料作物
	inst:DoPeriodicTask(1, function()
		local PEPPAZHAOLIAO = 32
		local x, y, z = inst.Transform:GetWorldPosition() -- 获取实体坐标
		local ens = TheSim:FindEntities(x, 0, z, PEPPAZHAOLIAO, nil, { "INLIMBO" })
		for i, v in ipairs(ens) do
			if v.components.farmplanttendable ~= nil then
				v.components.farmplanttendable:TendTo(inst)
			end
		end
	end)
	-- end

	
	inst:AddComponent("useableitem")  	
	inst.components.useableitem:SetOnUseFn(onuse) 

	inst:AddComponent("farmtiller")
	--local Old_Till = inst.components.farmtiller.Till
	inst.components.farmtiller.Till = function(self,pt,doer,...)
		local x1, y1, z1 = TheWorld.Map:GetTileCenterPoint(pt.x,pt.y,pt.z)
		local spacing=4/3
		for x2 = 0,2 do
			for y2 = 0,2 do
				local x3 = x1+spacing * x2-spacing
				local y3 = z1+spacing * y2-spacing
				if TheWorld.Map:CanTillSoilAtPoint(x3, 0, y3, false) then
					TheWorld.Map:CollapseSoilAtPoint(x3, 0, y3)
					SpawnPrefab("farm_soil").Transform:SetPosition(x3, 0, y3)
					if doer ~= nil then
						doer:PushEvent("tilling")
					end
				end	
			end
		end
		return true
	end

    -- 浇水壶
    if not inst.components.wateryprotection then
        inst:AddComponent("wateryprotection")
    end
    inst:AddTag("wateringcan")
    inst.components.wateryprotection.addwetness = TUNING.WATERINGCAN_WATER_AMOUNT * 4--加湿
    inst.components.wateryprotection.temperaturereduction = TUNING.WATERINGCAN_TEMP_REDUCTION*10
    inst.components.wateryprotection:AddIgnoreTag("player")
    -- 浇水壶结束

	--钓鱼
	inst:AddComponent("fishingrod")
	inst.components.fishingrod:SetWaitTimes(1, 2)
	inst.components.fishingrod:SetStrainTimes(10, 20)



	inst:AddComponent("spellcaster")
	inst.components.spellcaster.CanCast = function() return true end 
	--inst.components.spellcaster:SetCanCastFn(CastFn)
    inst.components.spellcaster.canuseontargets = true
	inst.components.spellcaster.quickcast = true
    inst.components.spellcaster.canuseonpoint = true
    inst.components.spellcaster.canuseonpoint_water = true
    inst.components.spellcaster:SetSpellFn(ccs_spell)
	
	inst:AddComponent("weapon") 
    inst.components.weapon:SetDamage(10)


	MakeHauntableLaunchAndPerish(inst) --作祟相关
	return inst
end

return Prefab("ccs_magic_wand1", fn, assets)
