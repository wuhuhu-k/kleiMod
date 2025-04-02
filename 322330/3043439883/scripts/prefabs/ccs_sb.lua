local All = {}
local IsValid = CCSAPI.IsValid

local function uninit(inst)
    if inst and inst.ccs_sb and inst.ccs_sb:IsValid() then
        local data, refs = inst.ccs_sb:GetPersistData()
        inst.components.ccssavecmp:SetSave("ccs_sb", {
            init = 0,
            data = data,
            refs = refs
        })
        inst.ccs_sb:AddTag("FX")
        inst.ccs_sb:AddTag("NOCLICK")
        if inst.ccs_sb.components.container:IsOpen() then
            inst.ccs_sb.components.container:Close()
        end
        local items = inst.ccs_sb.components.container:RemoveAllItems()
        for k, v in pairs(items) do
            v:Remove()
        end
        ErodeAway(inst.ccs_sb, 2)
        inst.components.rechargeable:Discharge(0)
    end
    inst.ccs_sb = nil
end
local function OnDropped(inst)
    uninit(inst)
end

local skin = { 
	{name = "ccs_sb_item_skins1",skin = "ccs_sb_skins1"},
	{name = "ccs_sb_item_skins2",skin = "skeletonsibi",anim = "animation",scale = 2},
	{name = "ccs_sb_item_skins3",skin = "skeletonsibi2",anim = "animation",scale = 2}, 
	{name = "ccs_sb_item_sxz_skins1",skin = "skeletonjy",anim = "animation",scale = 0.5},
	{name = "ccs_sb_item_sxz_skins2",skin = "skeletonjy2",anim = "animation",scale = 0.5}, 
	{name = "ccs_sb_item_sxz_skins3",skin = "skeletonwsq",anim = "animation",scale = 0.5},
	{name = "ccs_sb_item_sxz_skins4",skin = "skeletonwsq2",anim = "animation",scale = 0.5}, 
	{name = "ccs_sb_item_sxz_skins5",skin = "skeletonxb",anim = "animation",scale = 0.5},
	{name = "ccs_sb_item_sxz_skins6",skin = "skeletonxb2",anim = "animation",scale = 0.5}, 
	{name = "ccs_sb_item_skins7",skin = "ccs_sb_item_skins7",anim = "animation"}, 
	{name = "ccs_sb_item_skins8",skin = "ccs_sb_item_skins8",anim = "animation"}, 
    {name = "ccs_sb_item_skins9",skin = "ccs_sb_item_skins9",anim = "animation"}, 
    {name = "ccs_sb_item_skins10",skin = "ccs_sb_item_skins10",anim = "animation"}, 
    {name = "ccs_sb_item_skins11",skin = "ccs_sb_item_skins11",anim = "animation"}, 
    {name = "ccs_sb_item_skins12",skin = "ccs_sb_item_skins12",anim = "animation",scale = 0.5}, 
    {name = "ccs_sb_item_skins13",skin = "ccs_sb_item_skins13",anim = "animation"}, 
    {name = "ccs_sb_item_skins14",skin = "ccs_sb_item_skins14",anim = "animation",scale = 1.5}, 
    {name = "ccs_sb_item_skins15",skin = "ccs_sb_item_skins15",anim = "animation"},
    {name = "ccs_sb_item_skins16",skin = "ccs_sb_item_skins16",anim = "animation"},
    {name = "ccs_sb_item_skins17",skin = "ccs_sb_item_skins17",anim = "animation",state = 2,container = "ccs_bluepet"},
    {name = "ccs_sb_item_skins18",skin = "ccs_sb_item_skins18",anim = "animation",state = 3,container = "ccs_blackpet"},
}
local function onuse(inst, doer)
    if inst.ccs_sb and inst.ccs_sb:IsValid() then
        uninit(inst)
        if doer and doer.components.talker then
            doer.components.talker:Say("回去休息吧")
        end
        return false
    elseif doer then
        if doer.ccs_sb and doer.ccs_sb:IsValid() then
            if doer and doer.components.talker then
                doer.components.talker:Say("你已经有一只斯比了")
            end
            return false
        end
        inst.components.rechargeable:Discharge(99999999)
		local skinname = inst:GetSkinName()
        local ccs_sb = SpawnAt("ccs_sb", doer)
		if skinname then
			for k,v in pairs(skin) do
				if skinname == v.name then
					ccs_sb.AnimState:SetBank(v.skin) 	
					ccs_sb.AnimState:SetBuild(v.skin)	
					if v.anim then
						ccs_sb.AnimState:PlayAnimation(v.anim, true)
						ccs_sb.AnimState:PushAnimation(v.anim, true)
						local scale = v.scale or 1
						ccs_sb.AnimState:SetScale(scale, scale,scale)
                        if v.state then
                            ccs_sb._state:set(v.state)
                        end
                        if v.container then
                            ccs_sb.components.container:WidgetSetup(v.container)
                            ccs_sb.components.container:Close()
                        end
					end
				end
			end
            if skinname == "ccs_sb_item_skins14" then
                ccs_sb.pointfx = SpawnPrefab('ccs_sb_item_skins14fx')
                if ccs_sb.pointfx ~= nil then
                    ccs_sb.pointfx.entity:SetParent(ccs_sb.entity) 
                    ccs_sb.pointfx.Transform:SetPosition(0, 0, 0) 
                end
            end
            
		end
        local save = inst.components.ccssavecmp:GetSave("ccs_sb")
        if save and save.data then
            ccs_sb:SetPersistData(save.data, save.refs)
        end
        ccs_sb.components.container.canbeopened = true
        ccs_sb.components.ccsfollewer:Init(doer)
		ccs_sb.item = inst
        doer.ccs_sb = ccs_sb
        inst.ccs_sb = ccs_sb
        if doer and doer.components.talker then
            doer.components.talker:Say("召唤斯比")
        end
        return false
    end
    inst.components.rechargeable:Discharge(0)
    return false
end

local function makexk_item()
    local function lightflierfn()
        local inst = CreateEntity()
        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()
        inst:AddTag("NOBLOCK")
        inst:AddTag("rechargeable")
        inst:AddTag("soracantpack")
        inst.Transform:SetTwoFaced()
        inst.AnimState:SetBuild("ccs_sb_item")
        inst.AnimState:SetBank("ccs_sb_item")
        inst.AnimState:PlayAnimation("idle", true)

        inst.entity:SetPristine()
        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("inventoryitem")
		inst.components.inventoryitem.atlasname = "images/inventoryimages/ccs_sb_item.xml"
		inst.components.inventoryitem.imagename = "ccs_sb_item"
        inst.components.inventoryitem.canonlygoinpocket = true

        inst:AddComponent("ccsuseable")
        inst.components.ccsuseable:SetOnUseFn(onuse)
        inst:AddComponent("rechargeable")
        inst.components.rechargeable:SetMaxCharge(99999999)

        inst:AddComponent("ccssavecmp")
        inst.components.ccssavecmp:AddSave("ccs_sb", function(inst, data)
            if inst.ccs_sb and inst.ccs_sb:IsValid() then
                local d, r = inst.ccs_sb:GetPersistData()
                return {
                    init = (inst.ccs_sb and inst.ccs_sb:IsValid() and 1 or 0),
                    data = d,
                    refs = r
                }
            end
            return data
        end)
        inst.components.ccssavecmp:AddLoad("ccs_sb", function(i, data)
            if data.init == 1 and data.data then
                i:DoTaskInTime(1, function()
                    local owner = i.components.inventoryitem:GetGrandOwner()
                    if owner then
                        onuse(inst, owner)
                    end
                end)
            end
            return data
        end)

        inst:ListenForEvent("ondropped", OnDropped)
        inst:ListenForEvent("onremove", uninit)
        return inst
    end
    return Prefab("ccs_sb_item", lightflierfn)
end

local catbrain = require "brains/ccs_followerbrain"

local function onopen(inst)
	 inst.sg:GoToState("open")
end


local function onclose(inst)
	 inst.sg:GoToState("close")
end

local function itemget(inst,data)
	inst:DoTaskInTime(0,function()
		if data and data.item then
			if data.slot == 1 and data.item.components.temperature then
				data.item.components.temperature.current = 99 
			end
			if data.slot == 2 and data.item.components.temperature then
				data.item.components.temperature.current = -99 
			end
		end		
	end)
end

local function oncontainer_change(inst)
    local num = inst._state:value()
    if num == 2 then
        inst.replica.container:WidgetSetup("ccs_bluepet")
	elseif num == 3 then
        inst.replica.container:WidgetSetup("ccs_blackpet")
    elseif num == 1 then
        inst.replica.container:WidgetSetup("chester")
    end
end

local function makexk()
	local asstes = {
		Asset("ANIM", "anim/ccs_sb.zip"), 
	}
    local function lightflier_catfn()
        local inst = CreateEntity()
        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()
        MakeGhostPhysics(inst, 1, .1)
        inst:AddTag("NOBLOCK")
        inst:AddTag("soracantpack")
        inst:AddTag("companion")
        inst:AddTag("nosteal")
        inst:AddTag("flying")
        inst.entity:SetCanSleep(false)
        inst.AnimState:SetBuild("ccs_sb")
        inst.AnimState:SetBank("ccs_sb")
        inst.AnimState:PlayAnimation("idle", true)
        inst.AnimState:SetLightOverride(1)
        inst.entity:AddLight()
        inst.Light:SetFalloff(0.8)
        inst.Light:SetIntensity(.6)
        inst.Light:SetRadius(4.8)
        inst.Light:SetColour(237 / 255, 237 / 255, 209 / 255)
        inst.Light:Enable(true)

        inst.Transform:SetFourFaced()

        inst.entity:SetPristine()

        inst._state = net_smallbyte(inst.GUID, "ccs_sb._state", "container_change")
        if not TheWorld.ismastersim then
			inst.OnEntityReplicated = function(inst)
				inst.replica.container:WidgetSetup("chester")
			end
            inst:ListenForEvent("container_change", oncontainer_change)
            return inst
        end
        inst._state:set(1)
        inst:AddComponent("container")
        inst.components.container.openlimit = 1
        inst.components.container:WidgetSetup("chester")
        inst.components.container.canbeopened = false
       -- inst.components.container:EnableInfiniteStackSize(true)
        inst:AddComponent("preserver")
        inst.components.preserver:SetPerishRateMultiplier(-5000)
        inst:DoTaskInTime(0, function()
            if not inst.components.container.canbeopened then
                local items = inst.components.container:RemoveAllItems()
                for k, v in pairs(items) do
                    v:Remove()
                end
            end
        end)
        -- inst:AddComponent("locomotor")
        -- inst.components.locomotor.walkspeed = TUNING.LIGHTFLIER.WALK_SPEED * 3
        -- inst.components.locomotor.runspeed = TUNING.LIGHTFLIER.WALK_SPEED * 5
        -- inst.components.locomotor:SetTriggersCreep(false)
        -- inst.components.locomotor.pathcaps = { allowocean = true }

        --inst:SetStateGraph("SGccs_xk")
        -- inst:SetBrain(catbrain)
        inst:AddComponent("scaler")
        inst.components.scaler:SetScale(1.25)
        inst:AddComponent("ccsfollewer")
		
		-- inst:ListenForEvent("onopen", onopen)
		-- inst:ListenForEvent("onclose", onclose)
		inst:ListenForEvent("itemget", itemget)

        inst.magicfx = SpawnPrefab("cane_victorian_fx")
        if inst.magicfx then
            inst.magicfx.entity:AddFollower()
            inst.magicfx.entity:SetParent(inst.entity)
            inst.magicfx.Follower:FollowSymbol(inst.GUID, "body_full", 0, -60, 0)
        end
        inst.persists = false
        return inst
    end
    return Prefab("ccs_sb", lightflier_catfn,asstes)
end

table.insert(All, makexk())
table.insert(All, makexk_item())

return unpack(All)