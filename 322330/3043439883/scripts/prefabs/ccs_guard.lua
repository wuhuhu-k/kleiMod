local assets =
{
    Asset("ANIM", "anim/ccs_guard.zip"),
	Asset("ATLAS", "images/inventoryimages/ccs_guard.xml"),
	Asset("IMAGE", "images/inventoryimages/ccs_guard.tex"),
}

local function onunhaunt(inst,doer)
    print(inst,doer)
    
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("ccs_guard")
    inst.AnimState:SetBuild("ccs_guard")
    inst.AnimState:PlayAnimation("idle")
	
	inst:AddTag("ccs_guard")
	
	MakeInventoryFloatable(inst, "med", nil, 0.75)

    inst.entity:SetPristine()
    
	
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")   --物品
	inst.components.inventoryitem.atlasname = "images/inventoryimages/ccs_guard.xml"
	
    -- MakeHauntableLaunchAndSmash(inst)
    -- inst.components.hauntable.onunhaunt = onunhaunt

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_INSTANT_REZ)

    return inst
end

return Prefab("ccs_guard", fn, assets)