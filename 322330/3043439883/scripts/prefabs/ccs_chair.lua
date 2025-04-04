local function OnHit(inst, worker, workleft, numworks)
	if not inst:HasTag("burnt") then
		inst.AnimState:PlayAnimation("idle", true)

		if inst.back ~= nil then
			inst.back.AnimState:PlayAnimation("idle",true)

		end
	end
end

local function OnHammered(inst, worker)
	local collapse_fx = SpawnPrefab("collapse_small")
	collapse_fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
	collapse_fx:SetMaterial("wood")

	inst.components.lootdropper:DropLoot()

	inst:Remove()
end


local function GetStatus(inst)
	return (inst:HasTag("burnt") and "BURNT") or
		(inst.components.sittable:IsOccupied() and "OCCUPIED") or
		nil
end

local function OnSave(inst, data)
	local burnable = inst.components.burnable
	if (burnable and burnable:IsBurning()) or inst:HasTag("burnt") then
		data.burnt = true
	end
end

local function OnLoad(inst, data)
	if data then
		if data.burnt then
			inst.components.burnable.onburnt(inst)
		end
	end
end

local function AddChair(ret, name, bank, build, hasback, deploy_smart_radius)
	local assets =
	{
		Asset("ANIM", "anim/"..build..".zip"),
		Asset("ATLAS", "images/inventoryimages/"..build..".xml"),
		Asset("IMAGE", "images/inventoryimages/"..build..".tex"),
	}
	if bank ~= build then
		table.insert(assets, Asset("ANIM", "anim/"..bank..".zip"))
	end

	local prefabs =
	{
		"collapse_small",
	}

	if hasback then
		local function OnBackReplicated(inst)
			local parent = inst.entity:GetParent()
			if parent ~= nil and (parent.prefab == inst.prefab:sub(1, -6)) then
				parent.highlightchildren = { inst }
			end
		end

		local function backfn()
			local inst = CreateEntity()

			inst.entity:AddTransform()
			inst.entity:AddAnimState()
			inst.entity:AddNetwork()

			inst.Transform:SetFourFaced()

			inst:AddTag("FX")

			inst.AnimState:SetBank(bank)
			inst.AnimState:SetBuild(build)
			inst.AnimState:PlayAnimation("idle", true)
			inst.AnimState:SetFinalOffset(3)
			inst.AnimState:Hide("parts")

			inst.entity:SetPristine()

			if not TheWorld.ismastersim then
				inst.OnEntityReplicated = OnBackReplicated

				return inst
			end

			inst.persists = false

			return inst
		end

		table.insert(ret, Prefab(name.."_back", backfn, assets))
		table.insert(prefabs, name.."_back")
	end

	local function fn()
		local inst = CreateEntity()

		inst.entity:AddTransform()
		inst.entity:AddAnimState()
		inst.entity:AddSoundEmitter()
		inst.entity:AddNetwork()

		inst:SetDeploySmartRadius(deploy_smart_radius) --recipe min_spacing/2

		MakeObstaclePhysics(inst, 0.25)

		inst.Transform:SetFourFaced()

		inst:AddTag("structure")
		inst:AddTag("faced_chair")
		inst:AddTag("rotatableobject")

		inst.AnimState:SetBank(bank)
		inst.AnimState:SetBuild(build)
		inst.AnimState:PlayAnimation("idle", true)
		inst.AnimState:SetFinalOffset(-1)
		inst.AnimState:Hide("back_over")

		inst.entity:SetPristine()

		if not TheWorld.ismastersim then
			return inst
		end

		if hasback then
			inst.back = SpawnPrefab(name.."_back")
			inst.back.entity:SetParent(inst.entity)
			inst.highlightchildren = { inst.back }
		end

		inst.scrapbook_facing  = FACING_DOWN

		inst:AddComponent("inspectable")
        -- inst.components.inspectable.nameoverride = "WOOD_CHAIR"
        inst.components.inspectable.getstatus = GetStatus

		inst:AddComponent("lootdropper")

		inst:AddComponent("sittable")

		inst:AddComponent("savedrotation")
		inst.components.savedrotation.dodelayedpostpassapply = true

		inst:AddComponent("workable")
		inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
		inst.components.workable:SetWorkLeft(3)
		inst.components.workable:SetOnWorkCallback(OnHit)
		inst.components.workable:SetOnFinishCallback(OnHammered)



		MakeHauntableWork(inst)

		-- MakeSmallBurnable(inst, nil, nil, true)
		-- inst.components.burnable:SetOnBurntFn(OnChairBurnt)
		-- MakeSmallPropagator(inst)

		inst.OnLoad = OnLoad
		inst.OnSave = OnSave

		return inst
	end

	table.insert(ret, Prefab(name, fn, assets, prefabs))
	table.insert(ret, MakePlacer(name.."_placer", bank, build, "idle"))
end

local ret = {}

AddChair(ret, "ccs_chair", "ccs_chair", "ccs_chair", false, 0.875)

return unpack(ret)
