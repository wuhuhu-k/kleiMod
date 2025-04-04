local assets =
{
    Asset("ANIM", "anim/ccs_frog_yf.zip"),  
    Asset("ANIM", "anim/ccs_frog_yf_ground.zip"), 
	Asset("ATLAS", "images/inventoryimages/ccs_frog_yf.xml"), 
    Asset("IMAGE", "images/inventoryimages/ccs_frog_yf.tex"),
}

local function onequip(inst, owner) --装备
	if inst.isequip then
		return
	end
	inst.isequip = true
    local owner_skin_build = owner.components.skinner and owner.components.skinner.skin_name
    if not (owner_skin_build == "ccs_skins_madoka" or owner_skin_build == "ccs_skins_madoka1") then
        owner.AnimState:AddOverrideBuild("ccs_frog_yf")
    end
	
end

local function onunequip(inst, owner)  --脱下
	inst.isequip = false
    local owner_skin_build = owner.components.skinner and owner.components.skinner.skin_name
    if not (owner_skin_build == "ccs_skins_madoka" or owner_skin_build == "ccs_skins_madoka1") then
        owner.AnimState:ClearOverrideBuild("ccs_frog_yf")
    end
	
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("ccs_frog_yf_ground") 
    inst.AnimState:SetBuild("ccs_frog_yf_ground") 
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:SetScale(2,2,2)	

	inst:AddTag("ccs_frog_yf")
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    -- 增加背包同款发光
    inst._light = SpawnPrefab("ccs_bag_light")
	inst._light.entity:SetParent(inst.entity)

    inst:AddComponent("inspectable") 

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/ccs_frog_yf.xml" 

	inst:AddComponent("waterproofer")  
    inst.components.waterproofer:SetEffectiveness(1)

    inst:AddComponent("equippable") 
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY 
	inst.components.equippable.walkspeedmult =  1.15 
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("armor")
    inst.components.armor:InitCondition(2000,0.85)
	
	inst:AddComponent("ccs_frog_yf")
	
    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("ccs_frog_yf", fn, assets) 
