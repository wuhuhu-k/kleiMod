local assets1=
{
	Asset("ANIM", "anim/ccs_bag_skin_dinosaur.zip"),  --动画文件
	Asset("IMAGE", "images/inventoryimages/ccs_bag_skin_dinosaur.tex"), --物品栏贴图
	Asset("ATLAS", "images/inventoryimages/ccs_bag_skin_dinosaur.xml"),
}


local function makefx(name, build, assets)
	local function CreateFxFollowFrame(i)
		local inst = CreateEntity()
		--[[Non-networked entity]]
		inst.entity:AddTransform()
		inst.entity:AddAnimState()
		inst.entity:AddFollower()
	
		inst:AddTag("FX")
	
		inst.AnimState:SetBank(name)
		inst.AnimState:SetBuild(build)
		inst.AnimState:PlayAnimation("idle"..tostring(i), true)
		-- inst.AnimState:SetSymbolBloom("glowcentre")
		-- inst.AnimState:SetSymbolLightOverride("glowcentre", .5)
		inst.AnimState:SetLightOverride(.1)
		inst:AddComponent("highlightchild")
	
		inst.persists = false
	
		return inst
	end
	
	local function fx_OnRemoveEntity(inst)
		for i, v in ipairs(inst.fx) do
			v:Remove()
		end
	end
	
	local function fx_ColourChanged(inst, r, g, b, a)
		for i, v in ipairs(inst.fx) do
			v.AnimState:SetAddColour(r, g, b, a)
		end
	end
	
	local function fx_SpawnFxForOwner(inst, owner)
		inst.fx = {}
		inst.owner = owner
		inst.wasmoving = false
		inst.fx = {}
		-- local frame
		for i = 6, 10 do
		    local fx = CreateFxFollowFrame(i)
			-- frame = frame or math.random(fx.AnimState:GetCurrentAnimationNumFrames()) - 1
		    fx.entity:SetParent(owner.entity)
			-- if i == 9 or i == 10 then
			-- 	fx.Follower:FollowSymbol(owner.GUID, "swap_body_tall", 0, -60, 0, true, nil, i)
			-- else
			-- 	fx.Follower:FollowSymbol(owner.GUID, "swap_body_tall", 0, 0, 0, true, nil, i)
			-- end
			fx.Follower:FollowSymbol(owner.GUID, "swap_body_tall", 0, 0, 0, true, nil, i)
		    fx.components.highlightchild:SetOwner(owner)
		    table.insert(inst.fx, fx)
		end
	
		inst.components.colouraddersync:SetColourChangedFn(fx_ColourChanged)
		inst.OnRemoveEntity = fx_OnRemoveEntity
	end
	
	local function fx_OnEntityReplicated(inst)
		local owner = inst.entity:GetParent()
		if owner ~= nil then
			fx_SpawnFxForOwner(inst, owner)
		end
	end
	
	local function fx_AttachToOwner(inst, owner)
		inst.entity:SetParent(owner.entity)
		if owner.components.colouradder ~= nil then
			owner.components.colouradder:AttachChild(inst)
		end
		--Dedicated server does not need to spawn the local fx
		if not TheNet:IsDedicated() then
			fx_SpawnFxForOwner(inst, owner)
		end
	end
	
	local function fxfn()
		local inst = CreateEntity()
	
		inst.entity:AddTransform()
		inst.entity:AddNetwork()
	
		inst:AddTag("FX")
	
		inst:AddComponent("colouraddersync")
	
		inst.entity:SetPristine()
	
		if not TheWorld.ismastersim then
			inst.OnEntityReplicated = fx_OnEntityReplicated
	
			return inst
		end
	
		inst.AttachToOwner = fx_AttachToOwner
		inst.persists = false
	
		return inst
	end

	return Prefab(name.."_fx", fxfn, assets)
end

return makefx("ccs_bag_skin_dinosaur","ccs_bag_skin_dinosaur",assets1)