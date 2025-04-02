require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/ccs_chest3.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_chest3.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_chest3.xml"),
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

local function onhit(inst, worker)
    if not inst:HasTag("burnt") then
        if inst.components.container ~= nil then
            inst.components.container:DropEverything()
            inst.components.container:Close()
        end
    end
end

local function itemget(inst,data)
	inst:DoTaskInTime(0,function()
		if data and data.item then
			if data.item.components.perishable then
				data.item.components.perishable:ReducePercent(1)
			end
		end		
	end)
end

local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddNetwork()

	inst:AddTag("structure")
	inst:AddTag("chest")

	inst.AnimState:SetBank("ccs_chest3")
	inst.AnimState:SetBuild("ccs_chest3")
    inst.AnimState:PlayAnimation("idle")

	inst.MiniMapEntity:SetIcon( "ccs_chest3.tex" )

	MakeSnowCoveredPristine(inst)

	inst.Transform:SetScale(2, 2, 2)
	inst.entity:SetPristine()
	
	if not TheWorld.ismastersim then
		inst.OnEntityReplicated = function(inst)
			inst.replica.container:WidgetSetup("ccs_chest")
        end
		return inst
	end

	inst:AddComponent("inspectable")
	inst:AddComponent("container")
	inst.components.container:WidgetSetup("ccs_chest")
	inst.components.container.onopenfn = onopen
	inst.components.container.onclosefn = onclose
	inst.components.container.skipclosesnd = true
	inst.components.container.skipopensnd = true
	inst.components.container:EnableInfiniteStackSize(true)

	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetWorkLeft(5)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

	inst:AddComponent("hauntable")
	inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:ListenForEvent("itemget", itemget)
	
	MakeSnowCovered(inst)

	return inst
end

return Prefab("ccs_chest3", fn, assets),
		MakePlacer("ccs_chest3_placer", "ccs_chest3", "ccs_chest3", "idle",false, nil, nil, 2)