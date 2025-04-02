local assets=
{
	Asset("ANIM", "anim/ccs_fountain.zip"), 
	Asset("ATLAS", "images/inventoryimages/ccs_fountain.xml"), 
	Asset("IMAGE", "images/inventoryimages/ccs_fountain.tex"),
}


local function onhammered(inst, worker)
    local fx = SpawnPrefab("collapse_small")   --锤烂的特效
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
end
local WORKROTATION = 80;
local function Jt_Task(inst)
	local pos = inst:GetPosition()
	local ents = TheSim:FindEntities(pos.x, pos.y, pos.z,WORKROTATION,nil,{"campfire"}, { "fire","smolder" })
	for i, v in ipairs(ents) do
		if v.components.burnable ~= nil and v.prefab ~= "laozi_sp" and v.prefab ~= "book_myth" then
			v.components.burnable:Extinguish()
		end
	end
	local enta = TheSim:FindEntities(pos.x, pos.y, pos.z,WORKROTATION,nil,nil, { "witherable"})
	for i, v in ipairs(enta) do
		if v.components.witherable ~= nil then
			v.components.witherable:Protect(60)
		end
	end
	local x,y,z = inst:GetPosition():Get()
	local ents = TheSim:FindEntities(x,y,z,WORKROTATION,nil,{"FX"})
	for k,v in pairs(ents) do
		if v and v.components then
            if v.components.crop then
				if not (v.components.crop:IsReadyForHarvest() or v:HasTag("withered")) then
					v.components.crop:Fertilize(inst)
				end
            elseif v.components.grower then
				if v.components.grower:IsEmpty() then
					v.components.grower:Fertilize(inst)
				end
            elseif v.components.pickable then
				if v.components.pickable:CanBeFertilized() then
					v.components.pickable:Fertilize(inst)
					TheWorld:PushEvent("CHEVO_fertilized", {target = v, doer = inst})
				end
            elseif v.components.quagmire_fertilizable then
				act.target.components.quagmire_fertilizable:Fertilize(inst)
            end
        end
	end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("flow_pre")
    inst.AnimState:PushAnimation("flow_loop", true)
end

local function ontimerdone(inst, data)
    if data.name == "magic_water" then 
		inst.pick = true
    end
end

local function onload(inst, data)
	if data then
		inst.pick = data.pick or false
	end
end

local function onsave(inst, data)
	data.pick = inst.pick
end


local function fn(Sim)
	local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	inst.entity:AddSoundEmitter()
	inst.entity:AddLight()
	inst.entity:AddMiniMapEntity()

    inst.AnimState:SetBank("ccs_fountain")  
    inst.AnimState:SetBuild("ccs_fountain")
    inst.AnimState:PlayAnimation("flow_loop",true)
	
	inst.MiniMapEntity:SetIcon( "ccs_fountain.tex" )

	inst:AddTag("ccs_fountain")
    
	inst.Light:SetColour( 0/255, 245/255, 255/255, 1 )
    inst.Light:SetIntensity(0.75)
    inst.Light:SetFalloff(0.7)
    inst.Light:SetRadius(20)
    inst.Light:Enable(true)
	
	inst.Transform:SetScale(.8, .8, .8)
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)  --动作
    inst.components.workable:SetWorkLeft(5)
    inst.components.workable:SetOnFinishCallback(onhammered)  --锤烂的函数
	
    inst:AddComponent("inspectable") --可检查
	
	inst:AddComponent("ccs_fountain") 
	
	inst:DoPeriodicTask(2,Jt_Task)
	
	inst.pick = false
	
	inst:AddComponent("timer")
	inst.components.timer:StartTimer("magic_water", 1440)
	inst:ListenForEvent("timerdone", ontimerdone)

	inst:ListenForEvent("onbuilt", onbuilt)
	
	inst.OnSave = onsave
	inst.OnPreLoad = onload
	
	MakeHauntableLaunchAndPerish(inst) --作祟相关
    return inst
end 
   
return Prefab( "ccs_fountain", fn, assets),
		MakePlacer("ccs_fountain_placer", "ccs_fountain", "ccs_fountain", "flow_loop",false, nil, nil, .8)