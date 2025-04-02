local assets=
{
	Asset("ANIM", "anim/ccs_card_box.zip"),  --动画文件
	Asset("IMAGE", "images/inventoryimages/ccs_card_box.tex"), --物品栏贴图
	Asset("ATLAS", "images/inventoryimages/ccs_card_box.xml"),
	Asset("IMAGE", "images/inventoryimages/ccs_card_box_open.tex"), --物品栏贴图
	Asset("ATLAS", "images/inventoryimages/ccs_card_box_open.xml"),
	Asset("ANIM", "anim/ccs_card_box_5x5.zip"),
}

local function picktwo(inst,data)
    if data.object and data.object.components.pickable and not data.object.components.trader then
        if data.object.plant_def and data.object.components.plantresearchable and data.object.components.pickable.use_lootdropper_for_product then
            local loot = {}
			for _, prefab in ipairs(data.object.components.lootdropper:GenerateLoot()) do
				table.insert(loot, data.object.components.lootdropper:SpawnLootPrefab(prefab))
			end
            for i, item in ipairs(loot) do
				if item.components.inventoryitem ~= nil then
	                inst.components.inventory:GiveItem(item, nil, inst:GetPosition())
				end
            end
        elseif data.object.components.pickable.product then
            local item = SpawnPrefab(data.object.components.pickable.product)
            if item.components.stackable then
                item.components.stackable:SetStackSize(
                    data.object.components.pickable.numtoharvest)
            end
            inst.components.inventory:GiveItem(item, nil,
                                               data.object:GetPosition())
            if (data.object.prefab == "cactus" or data.object.prefab ==
                "oasis_cactus") and data.object.has_flower then
                local item2 = SpawnPrefab("cactus_flower")
                inst.components.inventory:GiveItem(item2, nil,
                                                   data.object:GetPosition())
            end
        end
    end
end

local function js(inst,data)
	local a = math.random(1,100)
	if a >= 20 and a <= 80 then
		if data.victim ~= nil and data.victim:IsValid() and not data.victim:HasTag("ccskilled") then
			if data.victim.components.lootdropper then
				data.victim.components.lootdropper:DropLoot()
				data.victim:AddTag("ccskilled")
			end
		end
	end
	if a > 80 then
		if data.victim ~= nil and data.victim:IsValid() and not data.victim:HasTag("ccskilled")  then
			if data.victim.components.lootdropper then
				data.victim.components.lootdropper:DropLoot()
				data.victim.components.lootdropper:DropLoot()
				data.victim:AddTag("ccskilled")
			end
		end
	end
end

local function ccs_cards_2_enble(inst,owner,card)
	if inst == nil then return end
	inst:AddTag("ccs_cards_2")
	if card.components.ccs_card_level:GetLevel() >= 2 then
		inst:AddTag("ccs_cards_2_level2")
	end
end

local function ccs_cards_2_close(inst,owner,card)
	if inst == nil then return end
	inst:RemoveTag("ccs_cards_2")
	inst:RemoveTag("ccs_cards_2_level2")
end

local function ccs_cards_7_enble(inst,owner,card)
	if inst == nil then return end
	inst:AddTag("ccs_cards_7_enble")
end

local function ccs_cards_7_close(inst,owner,card)
	if inst == nil then return end
	inst:RemoveTag("ccs_cards_7_enble")
end

local function ccs_cards_11_enble(inst,owner,card)
	if inst == nil then return end
	inst:AddTag("ccs_cards_11_enble")
end

local function ccs_cards_11_close(inst,owner,card)
	if inst == nil then return end
	inst:RemoveTag("ccs_cards_11_close")
end

local function ccs_cards_17_enble(inst,owner,card)
	if inst == nil then return end
	inst:AddTag("ccs_cards_17_enble")
end

local function ccs_cards_17_close(inst,owner,card)
	if inst == nil then return end
	inst:RemoveTag("ccs_cards_17_enble")
end

local function ccs_cards_24_enble(inst,owner,card)
	if inst == nil or card == nil then return end
	if not inst:HasTag("ccs_cards_24") then
		inst:AddTag("ccs_cards_24")
	end
	if card.components.ccs_card_level:GetLevel() >= 2 then
		inst:AddTag("ccs_cards_24_level2")
	end
	if card.components.ccs_card_level:GetLevel() >= 3 then
		inst:AddTag("ccs_cards_24_level3")
	end
end

local function ccs_cards_24_close(inst,owner,card)
	if inst == nil or card == nil then return end
	inst:RemoveTag("ccs_cards_24")
	if card.components.ccs_card_level:GetLevel() >= 2 then
		inst:RemoveTag("ccs_cards_24_level2")
	end
	if card.components.ccs_card_level:GetLevel() >= 3 then
		inst:RemoveTag("ccs_cards_24_level3")
	end
end

local function ccs_cards_20_enble(inst,owner,card)
	if inst == nil or card == nil then return end
	if not inst:HasTag("ccs_cards_20_enble") then
		if card.components.ccs_card_level:IsMaxLevel() then
			inst:AddTag("ccs_cards_20_enble")
		end
	end
end

local function ccs_cards_20_close(inst,owner,card)
	if inst == nil or card == nil then return end
	inst:RemoveTag("ccs_cards_20_enble")
end

local function ccs_cards_27_enble(inst,owner,card)
	if inst == nil or card == nil then return end
	if not inst:HasTag("ccs_cards_27_enble") then
		if card.components.ccs_card_level:IsMaxLevel() then
			inst:AddTag("ccs_cards_27_enble")
			if owner.components.drownable then	
				owner.components.drownable.enabled = false
			end
			RemovePhysicsColliders(owner)
		end
	end
end

local function ccs_cards_27_close(inst,owner,card)
	if inst == nil or card == nil then return end
	inst:RemoveTag("ccs_cards_27_enble")
	if owner.components.drownable then
		owner.components.drownable.enabled = true
	end
	ChangeToCharacterPhysics(owner)
end

local ccs_magic_wand_item = {
	{item = "ccs_cards_2",fn = ccs_cards_2_enble,fn2 = ccs_cards_2_close},	--冰牌
	{item = "ccs_cards_7",fn = ccs_cards_7_enble,fn2 = ccs_cards_7_close},	--工作牌
	{item = "ccs_cards_11",fn = ccs_cards_11_enble,fn2 = ccs_cards_11_close},	--火牌
	{item = "ccs_cards_17",fn = ccs_cards_17_enble,fn2 = ccs_cards_17_close},	--双牌
	{item = "ccs_cards_24",fn = ccs_cards_24_enble,fn2 = ccs_cards_24_close},	--移牌
	{item = "ccs_cards_20",fn = ccs_cards_20_enble,fn2 = ccs_cards_20_close},	--甜牌
	{item = "ccs_cards_27",fn = ccs_cards_27_enble,fn2 = ccs_cards_27_close},	--浮牌

}

local function DuplicationCard(inst,item)
	if inst.components.container:Has(item.prefab,2) then
		return true
	end
	return false
end


--获得卡牌盒计算卡牌盒增益属性
local function CalculationBoxProperties(box,owner,card)
	--如果卡牌没满级就跳过以下操作
	if not card.components.ccs_card_level:IsMaxLevel() then
		return
	end
	--如果卡牌盒持有者的id与放入的卡牌绑定者id对不上那也跳过以下操作
	if card.components.ccs_card_level.masterid ~= owner.userid then
		return
	end
	--获得卡牌盒中所有卡牌
	local cards = box.components.container:GetItemsWithTag("ccs_card")
	--计算有效卡牌数量
	local valid_card = 0
	for k,v in pairs(cards) do
		if v.components.ccs_card_level:IsMaxLevel() then
			--绑定的主人为持有者，并且卡牌满级，计算有效数量加一
			if v.components.ccs_card_level.masterid ~= nil then
				if v.components.ccs_card_level.masterid == owner.userid then
					valid_card = valid_card + 1
				end
			end
		end
	end

	--攻击加成
	local atk_jc =  0.01
	--防御加成
	local def_jc = 0.01
	--魔法加成
	local magic_jc = 5
	
	owner.components.combat.damagemultiplier = owner.components.combat.damagemultiplier + atk_jc
	owner.components.locomotor:SetExternalSpeedMultiplier(owner, "ccs_card_box_jc", 1 + valid_card*0.01)
	owner.components.health:SetAbsorptionAmount(owner.components.health.absorb + def_jc)
	owner.components.ccs_magic:SetMax(owner.components.ccs_magic.max + magic_jc)
	
	if valid_card >= 5 and box._level5 == false then
		box._level5 = true
		owner:ListenForEvent("picksomething",picktwo)
	end
	if valid_card >= 15 and box._level15 == false then
		box._level15 = true
		owner.components.builder.ingredientmod = .5 
	end
	if valid_card >= 25 and box._level25 == false then
		box._level25 = true
		owner:ListenForEvent("killed",js)
	end

end

--卸下卡牌盒删除增益属性，不管卡牌盒是不是你的，非主人也会扣
local function RemoveCalculationBoxProperties(box,owner)
	--扣除属性加成
	--获得卡牌盒中所有卡牌
	local cards = box.components.container:GetItemsWithTag("ccs_card")
	--计算有效卡牌数量
	local valid_card = 0
	for k,v in pairs(cards) do
		if v.components.ccs_card_level:IsMaxLevel() then
			--绑定的主人为持有者，并且卡牌满级，计算有效数量加一
			if v.components.ccs_card_level.masterid ~= nil then
				if v.components.ccs_card_level.masterid == owner.userid then
					valid_card = valid_card + 1
				end
			end
		end
	end
	--攻击加成
	local atk_jc = 0.01 * valid_card
	--防御加成
	local def_jc = 0.01 * valid_card
	--魔法加成
	local magic_jc = 5 * valid_card
	
	owner.components.combat.damagemultiplier = owner.components.combat.damagemultiplier - atk_jc
	owner.components.locomotor:RemoveExternalSpeedMultiplier(owner, "ccs_card_box_jc")
	owner.components.health:SetAbsorptionAmount(owner.components.health.absorb - def_jc)
	owner.components.ccs_magic:SetMax(math.max(0,owner.components.ccs_magic.max - magic_jc))
	
	if valid_card >= 5 and box._level5 == true then
		box._level5 = false
		owner:RemoveEventCallback("picksomething", picktwo)
	end
	if valid_card >= 15 and box._level15 == true then
		box._level15 = false
		owner.components.builder.ingredientmod = 1
	end
	if valid_card >= 25 and box._level25 == true then
		box._level25 = false
		owner:RemoveEventCallback("killed",js)
	end
	for k,v in pairs(box.components.container.slots) do
		if v then
			for a,b in pairs(ccs_magic_wand_item) do
				if v.prefab == b.item then
					b.fn2(box,owner,v)
				end
			end
		end
	end
end

--装备卡牌盒增加增益属性
local function AddCalculationBoxProperties(box,owner)
	--获得卡牌盒中所有卡牌
	local cards = box.components.container:GetItemsWithTag("ccs_card")
	--计算有效卡牌数量
	local valid_card = 0
	for k,v in pairs(cards) do
		if v.components.ccs_card_level:IsMaxLevel() then
			--绑定的主人为持有者，并且卡牌满级，计算有效数量加一
			if v.components.ccs_card_level.masterid ~= nil then
				if v.components.ccs_card_level.masterid == owner.userid then
					valid_card = valid_card + 1
				end
			end
		end
	end
	--攻击加成
	local atk_jc = 0.01 * valid_card
	--防御加成
	local def_jc = 0.01 * valid_card
	--魔法加成
	local magic_jc = 5 * valid_card
	
	owner.components.combat.damagemultiplier = owner.components.combat.damagemultiplier + atk_jc
	owner.components.locomotor:SetExternalSpeedMultiplier(owner, "ccs_card_box_jc", 1 + valid_card*0.01)
	owner.components.health:SetAbsorptionAmount(owner.components.health.absorb + def_jc)
	owner.components.ccs_magic:SetMax(owner.components.ccs_magic.max + magic_jc)
	
	if valid_card >= 5 and box._level5 == false then
		box._level5 = true
		owner:ListenForEvent("picksomething",picktwo)
	end
	if valid_card >= 15 and box._level15 == false then
		box._level15 = true
		owner.components.builder.ingredientmod = .5 
	end
	if valid_card >= 25 and box._level25 == false then
		box._level25 = true
		owner:ListenForEvent("killed",js)
	end
	for k,v in pairs(box.components.container.slots) do
		if v then
			for a,b in pairs(ccs_magic_wand_item) do
				if v.prefab == b.item then
					b.fn(box,owner,v)
				end
			end
		end
	end
end

local function itemget(inst,data)
	inst:DoTaskInTime(0,function()	
		--如果是加载中，执行过了装备的计算属性，那么这里就不在计算了  
		if inst:HasTag("on_load_onequip") then	
			return 
		end
		local owner = inst.components.inventoryitem.owner
		--如果卡牌盒有相同卡牌就弹出卡牌
		local card = 0
		local cards = inst.components.container:GetItemsWithTag("ccs_card")
		for k,v in pairs(cards) do
			if v.prefab == data.item.prefab then
				card = card + 1
				if card > 1 then
					if data.item.components.stackable then
						if data.item.components.stackable:IsStack() then
							inst.components.container:DropItemBySlot(data.slot)
						else
							inst.components.container:DropItem(data.item)	
						end
					else
						inst.components.container:DropItem(data.item)	
					end
					data.item:AddTag("no_ksx")
					if owner then
						if owner.components and owner.components.talker then
							owner.components.talker:Say("卡牌盒已有相同卡牌，无法放入卡牌盒")
						end
					end
					return
				end
			end
		end
		if not inst.components.equippable:IsEquipped() then return end
		--如果卡牌没有主人就弹出卡牌
		for k,v in pairs(ccs_magic_wand_item) do
			if v.item == data.item.prefab then	
				v.fn(inst,owner,data.item)
			end
		end
		if data.item.components.ccs_card_level.masterid == nil then
			data.item:AddTag("no_ksx")			--不扣属性
			inst.components.container:DropItem(data.item)
			if owner then
				if owner.components and owner.components.talker then
					owner.components.talker:Say("该卡牌未绑定，无法放入卡牌盒")
				end
			end
			return
		end
		if owner then
			if owner:HasTag("player") and owner:HasTag("ccs") then
				CalculationBoxProperties(inst,owner,data.item)	
			end
		end

	end)
end

--失去卡牌计算增益属性
local function RemoveBoxProperties(box,owner,loseitem)
	--特殊原因弹出的卡牌不扣属性
	if loseitem:HasTag("no_ksx") then
		loseitem:RemoveTag("no_ksx")
		return
	end

	--获得卡牌盒中所有卡牌
	local cards = box.components.container:GetItemsWithTag("ccs_card")
	--计算有效卡牌数量
	local valid_card = 0
	for k,v in pairs(cards) do
		if v.components.ccs_card_level:IsMaxLevel() then
			--绑定的主人为持有者，并且卡牌满级，计算有效数量加一
			if v.components.ccs_card_level.masterid ~= nil then
				if v.components.ccs_card_level.masterid == owner.userid then
					valid_card = valid_card + 1
				end
			end
		end
	end
	if loseitem.components.ccs_card_level:IsMaxLevel() then
		if loseitem.components.ccs_card_level.masterid ~= nil then
			if loseitem.components.ccs_card_level.masterid == owner.userid then
				owner.components.combat.damagemultiplier = owner.components.combat.damagemultiplier - 0.01
				owner.components.locomotor:SetExternalSpeedMultiplier(owner, "ccs_card_box_jc", 1 + valid_card*0.01)
				owner.components.health:SetAbsorptionAmount(owner.components.health.absorb - 0.01)
				owner.components.ccs_magic:SetMax(owner.components.ccs_magic.max - 5)
			end
		end
	end
	if valid_card <= 5 and box._level5 == true then
		box._level5 = false
		owner:RemoveEventCallback("picksomething", picktwo)
	end
	if valid_card <= 15 and box._level15 == true then
		box._level15 = false
		owner.components.builder.ingredientmod = 1
	end
	if valid_card <= 25 and box._level25 == true then
		box._level25 = false
		owner:RemoveEventCallback("killed",js)
	end
end

local function itemlose(inst,data)
	inst:DoTaskInTime(0,function()
		--先搜索卡牌盒持有者，如果卡牌盒持有者不是玩家就查询卡牌盒持有者的持有者是否是玩家，这里一般特指背包，还不是玩家就略过
		if not inst.components.equippable:IsEquipped() then return end
		local owner = inst.components.inventoryitem.owner
		for k,v in pairs(ccs_magic_wand_item) do
			if data.prev_item.prefab == v.item then
				v.fn2(inst,owner,data.prev_item)
			end
		end
		if owner then
			if owner:HasTag("player") and owner:HasTag("ccs") then
				RemoveBoxProperties(inst,owner,data.prev_item)
			else
				local owner2 = owner.components.inventoryitem and owner.components.inventoryitem.owner
				if owner2 then
					if owner2:HasTag("player") and owner2:HasTag("ccs") then
						RemoveBoxProperties(inst,owner,data.prev_item)
					end
				end
			end
		end
	end)
end

local function onequip(inst, owner) --装备	
	if inst.isequip then
		return
	end
	if not owner:HasTag("ccs") then
		return
	end
	inst.isequip = true
	if inst.components.container ~= nil then
		inst.components.container:Open(owner)
	end
	inst:AddTag("on_load_onequip")
	inst:DoTaskInTime(0.1,function()
		inst:RemoveTag("on_load_onequip")
	end)
	AddCalculationBoxProperties(inst,owner)
end

local function onunequip(inst, owner) 
	if not owner:HasTag("ccs") then
		return
	end
	inst.isequip = false
	if inst.components.container ~= nil then
		inst.components.container:Close()
	end
	--取消所有加成
	RemoveCalculationBoxProperties(inst,owner)
end

local function fn(Sim)
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	--inst.entity:AddSoundEmitter()

    MakeInventoryPhysics(inst)  
	MakeInventoryFloatable(inst, "med", nil, 0.75)

    inst.AnimState:SetBank("ccs_card_box")  
    inst.AnimState:SetBuild("ccs_card_box")
    inst.AnimState:PlayAnimation("idle")
	
	inst:AddTag("ccs_card_box")
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
	    inst.OnEntityReplicated = function(inst)
			inst.replica.container:WidgetSetup("ccs_card_box")
        end
        return inst
    end
	
	inst._level5 = false
	inst._level15 = false
	inst._level25 = false
	
    inst:AddComponent("inspectable") 
		
    inst:AddComponent("inventoryitem") 
	inst.components.inventoryitem.atlasname = "images/inventoryimages/ccs_card_box.xml"
	
	inst:AddComponent("container")
    inst.components.container:WidgetSetup("ccs_card_box")
	inst:ListenForEvent("onopen", function() 
		inst.replica.inventoryitem:SetAtlas("images/inventoryimages/ccs_card_box_open.xml")	--更新物品栏贴图
		inst.replica.inventoryitem:SetImage("ccs_card_box_open")
		inst:PushEvent("imagechange")
	end)
	inst:ListenForEvent("onclose", function() 
		inst.replica.inventoryitem:SetAtlas("images/inventoryimages/ccs_card_box.xml")	--更新物品栏贴图
		inst.replica.inventoryitem:SetImage("ccs_card_box")
		inst:PushEvent("imagechange")
	end)
      
	inst:ListenForEvent("itemget", itemget)
	inst:ListenForEvent("itemlose", itemlose)
	
	inst:AddComponent("equippable") 
	inst.components.equippable.equipslot = EQUIPSLOTS.NECK or EQUIPSLOTS.BODY 
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	
	inst:AddComponent("ccs_card_level")
	
	--inst.OnSave = onsave
	--inst.OnPreLoad = onload
	
	MakeHauntableLaunchAndPerish(inst) 
    return inst
end 
    
return Prefab( "ccs_card_box", fn, assets) 