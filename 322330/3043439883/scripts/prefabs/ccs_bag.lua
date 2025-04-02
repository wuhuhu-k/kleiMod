local assets=
{
	Asset("ANIM", "anim/ccs_bag.zip"),  --动画文件
	Asset("IMAGE", "images/inventoryimages/ccs_bag.tex"), --物品栏贴图
	Asset("ATLAS", "images/inventoryimages/ccs_bag.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_bag.xml",256),
	Asset("ANIM", "anim/ccs_bag_2x9.zip"),
	Asset("ANIM", "anim/ui_dinosaur_bag_2x9.zip"), 
	Asset("IMAGE", "images/inventoryimages/ui_dinosaur_slot.tex"),
	Asset("ATLAS", "images/inventoryimages/ui_dinosaur_slot.xml"),
	Asset("ANIM", "anim/ui_hanbao_bag_2x9.zip"), 
	Asset("IMAGE", "images/inventoryimages/ui_hanbao_slot.tex"),
	Asset("ATLAS", "images/inventoryimages/ui_hanbao_slot.xml"),
	
}

local function onequip(inst,owner)
	if inst.components.container ~= nil then
		inst.components.container:Open(owner)
	end
	local owner_skin_build = owner.components.skinner and owner.components.skinner.skin_name
	if not (owner_skin_build == "ccs_skins_madoka" or owner_skin_build == "ccs_skins_madoka1") then
		local skin_build = inst:GetSkinBuild()
		if skin_build ~= nil then
			if skin_build == "shiranui_fan" then
				owner:PushEvent("equipskinneditem", inst:GetSkinName())
			    owner.AnimState:OverrideItemSkinSymbol("swap_body_tall", skin_build, "swap_body_tall", inst.GUID, "swap_body_tall")
			else
				owner:PushEvent("equipskinneditem", inst:GetSkinName())
				owner.AnimState:OverrideItemSkinSymbol("swap_body", skin_build, "swap_body", inst.GUID, "swap_body")
			end
			if skin_build == "ccs_bag_skin_dinosaur" then
                if inst.fx ~= nil then
                    inst.fx:Remove()
                end
                inst.fx = SpawnPrefab(skin_build.."_fx")
                inst.fx:AttachToOwner(owner)  
            end
		else
			owner.AnimState:OverrideSymbol("swap_body", "ccs_bag", "swap_body")
		end
	end
	
	inst.components.inventoryitem.cangoincontainer = false
end

local function onunequip(inst,owner)
    if inst.components.container ~= nil then
		inst.components.container:Close(owner)
	end
	local owner_skin_build = owner.components.skinner and owner.components.skinner.skin_name
	if not (owner_skin_build == "ccs_skins_madoka" or owner_skin_build == "ccs_skins_madoka1")  then
		local skin_build = inst:GetSkinBuild()
		if skin_build ~= nil then
			owner:PushEvent("unequipskinneditem", inst:GetSkinName())
		end	
		owner.AnimState:ClearOverrideSymbol("swap_body")
		owner.AnimState:ClearOverrideSymbol("swap_body_tall")
		
	end
	if inst.fx ~= nil then
        inst.fx:Remove()
    end
	
end


local function AcceptTest(inst, item,giver)
	if item.prefab == "bluegem"  then
		if inst.bluegem < 3 then
			return true
		else
			giver.components.talker:Say("背包已拥有反鲜功能")
		end
	end
	return false
end


local function onaccept(inst,giver,item)
	if item.prefab == "bluegem" then
		inst.bluegem = inst.bluegem + 1
		if inst.bluegem >= 3 then     
			giver.components.talker:Say("现在背包已拥有反鲜功能")
			inst.components.preserver:SetPerishRateMultiplier(-3)
		end
	end
end

local function oncontainer_change(inst)
    local num = inst._state:value()
    if num == 2 then
        inst.replica.container:WidgetSetup("ccs_dinosaur_bag")
	elseif num == 3 then
        inst.replica.container:WidgetSetup("ccs_hanbao_bag")
    elseif num == 1 then
        inst.replica.container:WidgetSetup("ccs_bag")
    end
end

--加载
local function onload(inst, data)
	if data then
		inst.bluegem = data.bluegem or 0
		if inst.bluegem >= 3 then
			inst.components.preserver:SetPerishRateMultiplier(-3)
		end
	end
end

--保存
local function onsave(inst, data)
	data.bluegem = inst.bluegem
end

-- 佩奇手杖代码
local function setLight(inst)
	local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem.owner or nil

	if owner ~= nil then
		if inst._light ~= nil and inst._light:IsValid() then
			inst._light.entity:SetParent(owner.entity)
			if inst.components.equippable ~= nil and inst.components.equippable:IsEquipped() then
				if TheWorld ~= nil and TheWorld.state ~= nil and (TheWorld.state.isnight or TheWorld.state.isdusk) then
					inst._light.Light:Enable(true)
				else
					inst._light.Light:Enable(false)
				end
			else
				inst._light.Light:Enable(false)
			end
		end
	else
		if inst._light ~= nil and inst._light:IsValid() then
			inst._light.entity:SetParent(inst.entity)
			inst._light.Light:Enable(true)
		end
	end
end

local function onRemove(inst)
	if inst._light ~= nil then
		if inst._light:IsValid() then
			inst._light:Remove()
		end
		inst._light = nil
	end
end

local function fn(Sim)
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	--inst.entity:AddSoundEmitter()

    MakeInventoryPhysics(inst)  
	MakeInventoryFloatable(inst, "med", nil, 0.75)

    inst.AnimState:SetBank("ccs_bag")  
    inst.AnimState:SetBuild("ccs_bag")
    inst.AnimState:PlayAnimation("idle")
	
    inst.entity:SetPristine()

	inst._state = net_smallbyte(inst.GUID, "ccs_bag._state", "container_change")
    if not TheWorld.ismastersim then
	    inst.OnEntityReplicated = function(inst)
			inst.replica.container:WidgetSetup("ccs_bag")
        end
		inst:ListenForEvent("container_change", oncontainer_change)
        return inst
    end
	inst._state:set(1)
	
	inst.bluegem = 0
	
    inst:AddComponent("inspectable") 
		
    inst:AddComponent("inventoryitem") 
	inst.components.inventoryitem.atlasname = "images/inventoryimages/ccs_bag.xml"
	
	inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BACK or EQUIPSLOTS.BODY
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
	inst.components.equippable.restrictedtag = "ccs"
	inst.components.equippable.walkspeedmult = 1.1
	
	inst:AddComponent("container")
    inst.components.container:WidgetSetup("ccs_bag")
    inst.components.container.skipclosesnd = true
    inst.components.container.skipopensnd = true
	inst.components.container:EnableInfiniteStackSize(true)
      
	inst:AddComponent("preserver")
	inst.components.preserver:SetPerishRateMultiplier(0.5)

	inst:AddComponent("trader")   --交易
	inst.components.trader:SetAcceptTest(AcceptTest)  --接收的道具
	inst.components.trader.onaccept = onaccept      --给予
	
	inst.OnSave = onsave
	inst.OnPreLoad = onload

	
	inst._light = SpawnPrefab("ccs_bag_light")
	inst._light.entity:SetParent(inst.entity)

	inst:ListenForEvent("onputininventory", setLight)
	inst:ListenForEvent("ondropped", setLight)
	inst:ListenForEvent("equipped", setLight)
	inst:ListenForEvent("unequipped", setLight)
	inst:WatchWorldState("isnight", function(ent, isnight) setLight(ent) end)
	inst:WatchWorldState("isdusk", function(ent, isnight) setLight(ent) end)
	inst:ListenForEvent("onremove", onRemove)
	
	MakeHauntableLaunchAndPerish(inst) 
    return inst
end 

local function light() --光的代码
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    inst:AddTag("FX") --特效标签

	inst.Light:Enable(true) --打开
	inst.Light:SetRadius(20) --范围半径
	inst.Light:SetFalloff(0.5) --削减
	inst.Light:SetIntensity(.7) --强度
	inst.Light:SetColour( 177/255, 0/255, 255/255, 1 ) --颜色

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst.persists = false 
	
    return inst
end 
    
return Prefab( "ccs_bag", fn, assets),
		Prefab("ccs_bag_light", light)
