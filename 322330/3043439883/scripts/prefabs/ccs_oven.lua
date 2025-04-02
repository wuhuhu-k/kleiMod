require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/ccs_oven.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_oven.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_oven.xml"),
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

local coldtab = {
	{item = "charcoal" ,product = "ice"},
	{item = "butterflywings" ,product = "goatmilk"},
}

local cooltab = {
	{item = "log" ,product = "charcoal"},
	{item = "twigs" ,product = "ash"}, 
	{item = "cutgrass" ,product = "ash"},
	{item = "butterflywings" ,product = "butter"},
}

local function itemget(inst,data)
	inst:DoTaskInTime(0,function()
		if data and data.item then
			if inst.cold == false then
				--烤箱状态				
				if data.item.components.cookable then
					--local prd = inst.components.cooker:CookItem(data.item)
					--inst.components.container:GiveItem(prd)
					local num = data.item.components.stackable and data.item.components.stackable.stacksize or 1		
					local newitem = data.item.components.cookable:Cook(inst)
					ProfileStatsAdd("cooked_"..data.item.prefab)
					data.item:Remove()
					if newitem.components.stackable then
						newitem.components.stackable:SetStackSize(num)
					end
					inst.components.container:GiveItem(newitem)
				end
				for k,v in pairs(cooltab) do
					if data.item.prefab == v.item then
						local num = data.item.components.stackable and data.item.components.stackable.stacksize or 1				
						data.item:Remove()					
						local prd = SpawnPrefab(v.product)
						if prd.components.stackable then
							prd.components.stackable:SetStackSize(num)
						end
						inst.components.container:GiveItem(prd)
					end
				end
			else
				for k,v in pairs(coldtab) do
					if data.item.prefab == v.item then
						local num = data.item.components.stackable and data.item.components.stackable.stacksize or 1				
						data.item:Remove()					
						local prd = SpawnPrefab(v.product)
						if prd.components.stackable then
							prd.components.stackable:SetStackSize(num)
						end
						inst.components.container:GiveItem(prd)
					end
				end
				if data.item:HasTag("meat") then
					local num = data.item.components.stackable and data.item.components.stackable.stacksize or 1
					data.item:Remove()		
					local prd = SpawnPrefab("bird_egg")
					if prd.components.stackable then
						prd.components.stackable:SetStackSize(num)
					end
					inst.components.container:GiveItem(prd)					
				end
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
	inst:AddTag("ccs_oven")

	inst.AnimState:SetBank("ccs_oven")
	inst.AnimState:SetBuild("ccs_oven")
    inst.AnimState:PlayAnimation("idle1")

	inst.MiniMapEntity:SetIcon( "ccs_oven.tex" )

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

	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetWorkLeft(5)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

	inst:AddComponent("hauntable")
	inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:AddComponent("cooker")
	
	inst:ListenForEvent("itemget", itemget)
	
	inst.cold = true
	
	MakeSnowCovered(inst)

	return inst
end

return Prefab("ccs_oven", fn, assets),
		MakePlacer("ccs_oven_placer", "ccs_oven", "ccs_oven", "idle1",false, nil, nil, 2)