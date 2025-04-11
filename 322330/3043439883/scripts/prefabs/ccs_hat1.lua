local assets=
{
	Asset("ANIM", "anim/ccs_hat1.zip"),  --动画文件
	Asset("IMAGE", "images/inventoryimages/ccs_hat1.tex"), --物品栏贴图
	Asset("ATLAS", "images/inventoryimages/ccs_hat1.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat1.xml",256),
}

-- local function Add_Sd(inst, target)
--     if target.components.electricattacks == nil then
--         target:AddComponent("electricattacks")
--     end
--     target.components.electricattacks:AddSource(inst)
--     if inst._onattackother == nil then
--         inst._onattackother = function(attacker, data)
--             if data.weapon ~= nil then
--                 if data.projectile == nil then
--                     --in combat, this is when we're just launching a projectile, so don't do FX yet
--                     if data.weapon.components.projectile ~= nil then
--                         return
--                     elseif data.weapon.components.complexprojectile ~= nil then
--                         return
--                     elseif data.weapon.components.weapon:CanRangedAttack() then
--                         return
--                     end
--                 end
--                 if data.weapon.components.weapon ~= nil and data.weapon.components.weapon.stimuli == "electric" then
--                     --weapon already has electric stimuli, so probably does its own FX
--                     return
--                 end
--             end
--             if data.target ~= nil and data.target:IsValid() and attacker:IsValid() then
--                 SpawnPrefab("electrichitsparks"):AlignToTarget(data.target, data.projectile ~= nil and data.projectile:IsValid() and data.projectile or attacker, true)
--             end
--         end
--         inst:ListenForEvent("onattackother", inst._onattackother, target)
--     end
--     SpawnPrefab("electricchargedfx"):SetTarget(target)
-- end

-- local function RemoveSd(inst,target)
--     SpawnPrefab("electricchargedfx"):SetTarget(target)
--     if target.components.electricattacks ~= nil then
--         target.components.electricattacks:RemoveSource(inst)
--     end
--     if inst._onattackother ~= nil then
--         inst:RemoveEventCallback("onattackother", inst._onattackother, target)
--         inst._onattackother = nil
--     end
-- end

local function onequip(inst,owner)
	local owner_skin_build = owner.components.skinner and owner.components.skinner.skin_name
	if not (owner_skin_build == "ccs_skins_madoka" or owner_skin_build == "ccs_skins_madoka1") then
		local skin_build = inst:GetSkinBuild()
		local skin_name = inst:GetSkinName()
		if skin_name == "ccs_hat_skins3" or skin_name == "ccs_hat_skin_star" then
			owner:PushEvent("equipskinneditem", inst:GetSkinName())
			owner.AnimState:OverrideItemSkinSymbol("swap_hat", skin_build, "swap_hat", inst.GUID, "swap_hat")
			owner.AnimState:Show("HAT")
			owner.AnimState:Show("HAT_HAIR")
			owner.AnimState:Hide("HAIR_NOHAT")
		elseif skin_name == "ccs_hat_skins4" then
			if inst._front == nil then
				inst._front = SpawnPrefab("alterguardian_hat_equipped")
				inst._front.AnimState:SetBank(skin_build)
				inst._front:OnActivated(owner, true)
			end
			if skin_build then
				inst._front:SetSkin(skin_build, inst.GUID)
				--inst._back:SetSkin(skin_build, inst.GUID)
			end
		elseif skin_name == "ccs_hat_skins5" then 
			if inst._front == nil then
				inst._front = SpawnPrefab("alterguardian_hat_equipped")
				inst._front:OnActivated(owner, true)
			end
			if inst._back == nil then
				inst._back = SpawnPrefab("alterguardian_hat_equipped")
				inst._back:OnActivated(owner, false)
			end
			if skin_build then
				inst._front:SetSkin("ccs_hat_skins4", inst.GUID)
				inst._back:SetSkin("ccs_hat_skins4", inst.GUID)
			end
		elseif skin_name == "ccs_hat_zr" then 
			owner.AnimState:Show("HAT")
			owner.AnimState:Show("HAT_HAIR")
			owner.AnimState:Hide("HAIR_NOHAT")
			owner.AnimState:OverrideSymbol("swap_hat", skin_build, "swap_hat")
		elseif skin_name == "ccs_hat1_skins2_yx" then 
		else
			if skin_build ~= nil then
				owner.AnimState:AddOverrideBuild(skin_build)  
			else
				owner.AnimState:AddOverrideBuild("ccs_hat1")  
			end
		end
	end
	
	-- if inst.sakura >= 10 then 
	-- 	Add_Sd(inst,owner)
	-- end
end

local function onunequip(inst,owner)
	local owner_skin_build = owner.components.skinner and owner.components.skinner.skin_name
	if not (owner_skin_build == "ccs_skins_madoka" or owner_skin_build == "ccs_skins_madoka1") then
		local skin_name = inst:GetSkinName()
	    local skin_build = inst:GetSkinBuild()
		if skin_name == "ccs_hat1_skins1" then
			owner.AnimState:ClearOverrideBuild("ccs_hat1_skins1")  
		elseif skin_name == "ccs_hat_skins3" or skin_name == "ccs_hat_skin_star" or skin_name == "ccs_hat_zr" then
			owner.AnimState:Hide("HAT")
			owner.AnimState:Hide("HAT_HAIR")
			owner.AnimState:Show("HAIR_NOHAT")
		elseif skin_name == "ccs_hat_skins4" then
			if inst._back ~= nil then
				inst._back:OnDeactivated()
				inst._back = nil
			end
			if inst._front ~= nil then
				inst._front:OnDeactivated()
				inst._front = nil
			end
		elseif skin_name == "ccs_hat_skins5" then
			if inst._back ~= nil then
				inst._back:OnDeactivated()
				inst._back = nil
			end
			if inst._front ~= nil then
				inst._front:OnDeactivated()
				inst._front = nil
			end
		else
			if skin_build ~= nil then
				owner.AnimState:ClearOverrideBuild(skin_build)  
			else
				owner.AnimState:ClearOverrideBuild("ccs_hat1")  
			end
		end
		if skin_build ~= nil then
			owner:PushEvent("unequipskinneditem", inst:GetSkinName())
		end
	end
	
	

	-- if inst.sakura >= 10 then 
	-- 	RemoveSd(inst,owner)
	-- end
end

local function AcceptTest(inst, item,giver)
	if item.prefab == "ccs_sakura1"  then
		if inst.sakura < 10 then
			return true
		else
			giver.components.talker:Say("樱花数量已满")
		end
	end
	return false
end


local function onaccept(inst,giver,item)
	if item.prefab == "ccs_sakura1" then
		inst.sakura = inst.sakura + 1
		giver.components.talker:Say("已给予紫樱花："..inst.sakura.."/10")
		if inst.sakura == 10 then     
			giver.components.talker:Say("免疫冰冻和月灵伪装的效果已生效")
			-- if inst.components.equippable:IsEquipped() then
			-- 	Add_Sd(inst,giver)
			-- end
			inst:AddTag("gestaltprotection") --防止月灵攻击
			inst:AddTag("ccs_block_freezable") --免疫冰冻
		end
	end
end

--加载
local function onload(inst, data)
	if data then
		inst.sakura = data.sakura or 0
		if inst.sakura == 10 then
			inst:AddTag("gestaltprotection")--防止月灵攻击
			inst:AddTag("ccs_block_freezable") --免疫冰冻
		end
	end
end

--保存
local function onsave(inst, data)
	data.sakura = inst.sakura
end

local function fn(Sim)
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	--inst.entity:AddSoundEmitter()
	
	inst:AddTag("ccs_hat1")
	inst:AddTag("hide_percentage")
	inst:AddTag("goggles")
	
    MakeInventoryPhysics(inst)  
	MakeInventoryFloatable(inst, "med", nil, 0.75)

    inst.AnimState:SetBank("ccs_hat1")  
    inst.AnimState:SetBuild("ccs_hat1")
    inst.AnimState:PlayAnimation("idle")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.sakura = 0
    inst:AddComponent("inspectable") 
		
    inst:AddComponent("inventoryitem") 
	inst.components.inventoryitem.atlasname = "images/inventoryimages/ccs_hat1.xml"
	
	inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	inst.components.equippable.insulated = true  
	inst.components.equippable.walkspeedmult = 1.1
	inst.components.equippable.dapperness = 6/60 
	inst.components.equippable.restrictedtag = "ccs"
     
	inst:AddComponent("armor")
	inst.components.armor:InitIndestructible(0.8)
	
	inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(1)
	
	inst:AddComponent("trader")   --交易
	inst.components.trader:SetAcceptTest(AcceptTest)  --接收的道具
	inst.components.trader.onaccept = onaccept      --给予
	
	inst.OnSave = onsave
	inst.OnPreLoad = onload
	
	MakeHauntableLaunchAndPerish(inst) 
    return inst
end 
    
return Prefab( "ccs_hat1", fn, assets) 