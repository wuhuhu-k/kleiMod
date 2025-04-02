local assets=
{
	Asset("ANIM", "anim/ccs_amulet.zip"),  --动画文件
	Asset("IMAGE", "images/inventoryimages/ccs_amulet.tex"), --物品栏贴图
	Asset("ATLAS", "images/inventoryimages/ccs_amulet.xml"),
	Asset("ANIM", "anim/ccs_pack_gift.zip"),  --动画文件
	Asset("IMAGE", "images/inventoryimages/ccs_pack_gift.tex"), --物品栏贴图
	Asset("ATLAS", "images/inventoryimages/ccs_pack_gift.xml"),
}
local skin_data = {
	ccs_amulet_skin1 = "ccs_whale_footprints_fx",
	ccs_amulet_skin2 = "ccs_flowerl_tracks_fx",
	ccs_amulet_skin3 = "ccs_sdrawberry_track",
}

local function playrunfx(player, skin_name)
    local is_moving = player.sg:HasStateTag("moving") -- 在移动
    local is_running = player.sg:HasStateTag("running") -- 在跑步

    if is_running or is_moving then
        local x, y, z = player:GetPosition():Get()
        local fx_prefab = skin_data[skin_name] 

        if fx_prefab then
            local fx = SpawnPrefab(fx_prefab)
            fx.Transform:SetPosition(x, y, z)
        end
    end
end


local function storeincontainer(inst, container)
    if container then
        inst:ListenForEvent("onputininventory", inst._oncontainerownerchanged, container)
        inst:ListenForEvent("ondropped", inst._oncontainerownerchanged, container)
		if container and container:HasTag("player") then
			if container.components.locomotor then
				container.components.locomotor:SetExternalSpeedMultiplier(container, "ccs_amulet_speed", 1.2)
			end
			local skin_name = inst:GetSkinName()
			if skin_name then
				if container.ccs_moving_task == nil then
					container.ccs_moving_task = container:DoPeriodicTask(0.6,function ()
						playrunfx(container,skin_name)
					end)
				end
			end
		end
        inst._container = container
    end
end

local function outcontainer(inst)
    if inst._container then
        inst:RemoveEventCallback("onputininventory", inst._oncontainerownerchanged, inst._container)
        inst:RemoveEventCallback("ondropped", inst._oncontainerownerchanged, inst._container)
		local owner = inst._container
		if owner and owner:HasTag("player") then
			-- local hasamulet, count = owner.components.inventory:HasItemWithTag("ccs_amulet",1)
			-- if not hasamulet then
			-- 	if owner.components.locomotor then
			-- 		owner.components.locomotor:RemoveExternalSpeedMultiplier(owner, "ccs_amulet_speed")
			-- 	end
			-- end
			if owner.components.locomotor then
				owner.components.locomotor:RemoveExternalSpeedMultiplier(owner, "ccs_amulet_speed")
			end
			if  owner.ccs_moving_task then
				owner.ccs_moving_task:Cancel() --取消之前设置的定时任务
				owner.ccs_moving_task = nil
			end
		end
		
        inst._container = nil
    end
end

local function tocontainer(inst, owner)
    if inst._container ~= owner then
        outcontainer(inst)
        storeincontainer(inst, owner)
    end

end



local function onequip(inst, owner) --装备	
	owner.components.combat.externaldamagemultipliers:SetModifier("ccs_amulet", 1.1) 
end

local function onunequip(inst, owner) 
	owner.components.combat.externaldamagemultipliers:RemoveModifier("ccs_amulet")
end

local function updatelight(inst, phase)  
	if phase == "day" then	
		if inst._light ~= nil then
			if inst._light:IsValid() then
				inst._light:Remove()   
				inst._light = nil    
            end
	    end
	elseif phase == "dusk" then   
		if inst._light ~= nil then
			if inst._light:IsValid() then
				inst._light:Remove()
				inst._light = nil
			end
		end
	elseif phase == "night" then 
		if inst._light == nil or not inst._light:IsValid() then    
			inst._light = SpawnPrefab("ccs_light2_light") 
			inst._light.entity:SetParent(inst.entity)    		  
		end	
	end
end

local function fn(Sim)
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	--inst.entity:AddSoundEmitter()

    MakeInventoryPhysics(inst)   --物理
	MakeInventoryFloatable(inst, "med", nil, 0.75)

    inst.AnimState:SetBank("ccs_amulet")  
    inst.AnimState:SetBuild("ccs_amulet")
    inst.AnimState:PlayAnimation("idle")

	inst:AddTag("ccs_amulet")
	inst:AddTag("ccs_pack_item")
    	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst._container = nil

    inst._oncontainerownerchanged = function(container)
        tocontainer(inst, container)
    end


    inst:ListenForEvent("onputininventory", tocontainer)
    inst:ListenForEvent("ondropped", outcontainer)

	
	-- inst:AddComponent("equippable") 
	-- inst.components.equippable.equipslot = EQUIPSLOTS.NECK or EQUIPSLOTS.BODY 
    -- inst.components.equippable:SetOnEquip(onequip)
    -- inst.components.equippable:SetOnUnequip(onunequip)
	-- inst.components.equippable.restrictedtag = "ccs"
	-- inst.components.equippable.walkspeedmult = 1.2
	
    inst:AddComponent("inspectable") 
		
    inst:AddComponent("inventoryitem") 
	inst.components.inventoryitem.atlasname = "images/inventoryimages/ccs_amulet.xml"

	
	inst:AddComponent("ccs_packer")
	
	inst:WatchWorldState("phase", updatelight)
	updatelight(inst, TheWorld.state.phase)
	
	MakeHauntableLaunchAndPerish(inst) 
    return inst
end 

local function ondeploy(inst, pt, deployer)
	if inst.components.ccs_pack then
		inst.components.ccs_pack:Unpack(pt)
		inst:Remove()
	end
end	

local function get_name(inst)
	return #inst._name:value() > 0 and "打包的"..inst._name:value() or "打包的"
end

local function packfn(Sim)
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	inst.entity:AddSoundEmitter()

    MakeInventoryPhysics(inst)   --物理
	MakeInventoryFloatable(inst, "med", nil, 0.75)

    inst.AnimState:SetBank("ccs_pack_gift")  
    inst.AnimState:SetBuild("ccs_pack_gift")
    inst.AnimState:PlayAnimation("idle")

	inst:AddTag("ccs_pack")
	inst:AddTag("nonpackable")
    inst._name = net_string(inst.GUID, "ccs_pack_gift._name")
	--inst.displaynamefn = get_name
    inst.entity:SetPristine()
    inst:DoTaskInTime(0,function(i)
        if i.replica.inventoryitem then
            i.replica.inventoryitem.CanDeploy = function() return true end
        end
        if i.components.deployable then
            i.components.deployable.CanDeploy = function() return true end
        end
    end)
	
    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddComponent("inspectable") 
		
    inst:AddComponent("inventoryitem") 
	inst.components.inventoryitem.atlasname = "images/inventoryimages/ccs_pack_gift.xml"
     
	inst:AddComponent("ccs_pack")
	inst:AddComponent("deployable")
	inst.components.deployable.ondeploy = ondeploy
	inst.components.deployable:SetDeploySpacing(1)
	
	MakeHauntableLaunchAndPerish(inst) 
    return inst
end

local function buildfn()
	local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("gift")
    inst.AnimState:SetBuild("gift")
    inst.AnimState:PlayAnimation("idle_large1")
	
	inst:AddTag("ccs_pack")
	inst:AddTag("nonpackable")
    inst._name = net_string(inst.GUID, "ccs_pack_gift._name")
	--inst.displaynamefn = get_name
	inst.entity:SetPristine()
    inst:DoTaskInTime(0,function(i)
        if i.replica.inventoryitem then
            i.replica.inventoryitem.CanDeploy = function() return true end
        end
        if i.components.deployable then
            i.components.deployable.CanDeploy = function() return true end
        end
    end)
	
    if not TheWorld.ismastersim then
        return inst
    end
    inst:AddComponent("inspectable") 
		
    inst:AddComponent("inventoryitem") 
	inst.components.inventoryitem:ChangeImageName("gift_large1")
     
	inst:AddComponent("ccs_pack")
	inst:AddComponent("deployable")
	inst.components.deployable.ondeploy = ondeploy
	inst.components.deployable:SetDeploySpacing(1)
	
    inst:AddComponent("inventoryitem") 
	inst.components.inventoryitem:ChangeImageName("gift_large1")

	MakeHauntableLaunchAndSmash(inst)
    return inst
end	

local function light() --光的代码
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    inst:AddTag("FX") --特效标签

	inst.Light:Enable(true) --打开
	inst.Light:SetRadius(8) --范围半径
	inst.Light:SetFalloff(0.5) --削减
	inst.Light:SetIntensity(.7) --强度
	inst.Light:SetColour( 0/255, 92/255, 156/255, 1 ) --颜色

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst.persists = false 
	
    return inst
end    

return Prefab("ccs_amulet", fn, assets),
	Prefab("ccs_pack_gift", packfn,assets),
	Prefab("ccs_pack_gift_build", buildfn, assets),
	Prefab( "ccs_light2_light", light),
	MakePlacer("ccs_pack_gift_placer", "gift", "gift", "place"),
	MakePlacer("ccs_pack_gift_build_placer", "gift", "gift", "place")