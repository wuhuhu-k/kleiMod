local assets =
{
	Asset("ANIM", "anim/ccs_trash.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_trash.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_trash.xml"),
}

local function onopen(inst)
	inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_open")
end
		
local function onclose(inst,doer)
	inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_close")
end

local function onhammered(inst, worker)
    if inst.components.container ~= nil then
        inst.components.container:DropEverything()
    end
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    inst:Remove()
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddNetwork()

	inst:AddTag("ccs_trash")

	inst.AnimState:SetBank("ccs_trash")
	inst.AnimState:SetBuild("ccs_trash")
    inst.AnimState:PlayAnimation("idle")

	inst.MiniMapEntity:SetIcon( "ccs_trash.tex" )

	MakeSnowCoveredPristine(inst)

	inst.Transform:SetScale(2, 2, 2)

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		inst.OnEntityReplicated = function(inst)
			inst.replica.container:WidgetSetup("ccs_trash")
        end
		return inst
	end

	inst:AddComponent("inspectable")
	inst:AddComponent("container")
	inst.components.container:WidgetSetup("ccs_trash")
	inst.components.container.onopenfn = onopen
	inst.components.container.onclosefn = onclose

	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetWorkLeft(5)
	inst.components.workable:SetOnFinishCallback(onhammered)
	
	MakeSnowCovered(inst)

	return inst
end

return Prefab("ccs_trash", fn, assets),
		MakePlacer("ccs_trash_placer", "ccs_trash", "ccs_trash", "idle",false, nil, nil, 2)