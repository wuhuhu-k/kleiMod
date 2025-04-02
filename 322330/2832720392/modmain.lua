GLOBAL.setmetatable(env, {
    __index = function(t, k)
        return GLOBAL.rawget(GLOBAL, k)
    end
}) -- 全局变量

PrefabFiles = {
    "pepalight",
    --"hambat"         --最好的办法是新建一个prefab，这样方便兼容，也不容易被其他模组干扰
}
GLOBAL.A = GetModConfigData("a") or 0


GLOBAL.PEPPAHAMMER = GetModConfigData("peppahammer") or 0
GLOBAL.PEPPAPICKAXE = GetModConfigData("peppapickaxe") or 0
GLOBAL.PEPPASHOVEL = GetModConfigData("peppashovel") or 0
GLOBAL.PEPPAAXE = GetModConfigData("peppaaxe") or 0
GLOBAL.PEPPABUGNET = GetModConfigData("peppabugnet") or 0
GLOBAL.PEPPAFISHROD = GetModConfigData("peppafishrod") or 0
GLOBAL.PEPPAHOE = GetModConfigData("peppahoe") or 0
GLOBAL.PEPPASPEED = GetModConfigData("peppaspeed") or 0
GLOBAL.PEPPADAMAGE = GetModConfigData("peppadamage") or 0
GLOBAL.PEPPADUMBBELL = GetModConfigData("peppadumbbell") or 0
GLOBAL.PEPPARAIN = GetModConfigData("pepparain") or 0
GLOBAL.PEPPATHUNDER = GetModConfigData("peppathunder") or 0
GLOBAL.PEPPAJICHENG = GetModConfigData("peppajicheng") or 0
GLOBAL.PEPPANAIJIU = GetModConfigData("peppanaijiu") or 1 -- 默认1
GLOBAL.PEPPAXIAOLV = GetModConfigData("peppaxiaolv") or 0
GLOBAL.PEPPAOAR = GetModConfigData("peppaoar") or 0
GLOBAL.PEPPAWATER = GetModConfigData("peppawater") or 0
GLOBAL.PEPPABRUSH = GetModConfigData("peppabrush") or 0
GLOBAL.PEPPAZHAOLIAO = GetModConfigData("peppazhaoliao")
GLOBAL.PEPPAQIEHUAN = GetModConfigData("peppaqiehuan")
GLOBAL.PEPPAXUNNIU = GetModConfigData("peppaxunniu")
GLOBAL.PEPPAZHANNIU = GetModConfigData("peppazhanniu")
GLOBAL.PEPPAFUHUO = GetModConfigData("peppafuhuo")
GLOBAL.PEPPATASHUI = GetModConfigData("peppatashui")
GLOBAL.PEPPAEMO = GetModConfigData("peppaemo")
GLOBAL.PEPPARANGE = GetModConfigData("pepparange")
GLOBAL.PEPPAWENDY = GetModConfigData("peppawendy")
GLOBAL.PEPPALIGHT = GetModConfigData("peppalight")
GLOBAL.PEPPACANE = GetModConfigData("peppacane") or 0
GLOBAL.PEPPABAT = GetModConfigData("peppabat")
GLOBAL.PEPPAWANGDA = GetModConfigData("peppawangda")
GLOBAL.PEPPASCYTHE = GetModConfigData("peppascythe")

-----------------------------------------------------------------------------------
----薇洛加强
TUNING.WILLOW_EMBER_THROW = GetModConfigData("weiluo_ember_throw")
TUNING.WILLOW_EMBER_BURST = GetModConfigData("weiluo_ember_burst")
TUNING.WILLOW_EMBER_BALL = GetModConfigData("weiluo_ember_ball")
TUNING.WILLOW_EMBER_FRENZY = GetModConfigData("weiluo_ember_frenzy")
TUNING.WILLOW_EMBER_LUNAR = GetModConfigData("weiluo_ember_lunar")
TUNING.WILLOW_EMBER_SHADOW = GetModConfigData("weiluo_ember_shadow")
TUNING.WILLOW_LUNAR_FIRE_COOLDOWN = GetModConfigData("weiluo_lunar_fire_cooldown")
TUNING.WILLOW_SHADOW_FIRE_COOLDOWN = GetModConfigData("weiluo_shadow_fire_cooldown")

TUNING.PEPALIGHT = GetModConfigData("peppalight") 

-----------------------------------------------------------------------------------
local function HarvestPickable(inst, ent, doer)
    if ent.components.pickable.picksound ~= nil then
        doer.SoundEmitter:PlaySound(ent.components.pickable.picksound)
    end

    local success, loot = ent.components.pickable:Pick(TheWorld)

    if loot ~= nil then
        for i, item in ipairs(loot) do
            Launch(item, doer, 1.5)
        end
    end
end

local function IsEntityInFront(inst, entity, doer_rotation, doer_pos)
    local facing = Vector3(math.cos(-doer_rotation / RADIANS), 0 , math.sin(-doer_rotation / RADIANS))

    return IsWithinAngle(doer_pos, facing, TUNING.VOIDCLOTH_SCYTHE_HARVEST_ANGLE_WIDTH, entity:GetPosition())
end

local HARVEST_MUSTTAGS  = {"pickable"}
local HARVEST_CANTTAGS  = {"INLIMBO", "FX"}
local HARVEST_ONEOFTAGS = {"plant", "lichen", "oceanvine", "kelp"}

local function DoScythe(inst, target, doer)
    --inst:SayRandomLine(STRINGS.VOIDCLOTH_SCYTHE_TALK.onharvest, doer)

    if target.components.pickable ~= nil then
        local doer_pos = doer:GetPosition()
        local x, y, z = doer_pos:Get()

        local doer_rotation = doer.Transform:GetRotation()

        local ents = TheSim:FindEntities(x, y, z, TUNING.VOIDCLOTH_SCYTHE_HARVEST_RADIUS, HARVEST_MUSTTAGS, HARVEST_CANTTAGS, HARVEST_ONEOFTAGS)
        for _, ent in pairs(ents) do
            if ent:IsValid() and ent.components.pickable ~= nil then
                if inst:IsEntityInFront(ent, doer_rotation, doer_pos) then
                    inst:HarvestPickable(ent, doer)
                end
            end
        end
    end
end






---------------------------------------------------------------

if PEPPACANE ~= 0 then
    AddRecipe2("walrus_tusk",          --象牙制作
{Ingredient("houndstooth", 5),Ingredient("silk", 2),Ingredient("log", 2),Ingredient("tentaclespike", 1)},
TECH.SCIENCE_ONE,
nil,
{"REFINE",})      --精炼栏
STRINGS.NAMES.WALRUS_TUSK= "海象牙"    --名字       --感觉这个strings可有可无   但是防止出问题 加上总没错的
STRINGS.RECIPE_DESC.WALRUS_TUSK = "这貌似是某种怪物的牙齿？"  --配方上面的描述
end

if PEPPALIGHT ~= 0 then
local function setLight(inst)
	local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem.owner or nil

	if owner ~= nil then
		if inst._light ~= nil and inst._light:IsValid() then
			inst._light.entity:SetParent(owner.entity)
			if inst.components.equippable ~= nil and inst.components.equippable:IsEquipped() then
				if TheWorld ~= nil and TheWorld.state ~= nil and TheWorld.state.isnight then
					inst._light.Light:Enable(true)
				else
					inst._light.Light:Enable(false)
				end
			else
				inst._light.Light:Enable(false)
			end
		end
	else
		if inst._light ~= nil and inst._light:IsValid() then
			inst._light.entity:SetParent(inst.entity)
			inst._light.Light:Enable(true)
		end
	end
end

local function onRemove(inst)
	if inst._light ~= nil then
		if inst._light:IsValid() then
			inst._light:Remove()
		end
		inst._light = nil
	end
end

AddPrefabPostInit("cane",
	function(inst)
		if not TheWorld.ismastersim then return end

		inst._light = SpawnPrefab("pepalight")
		inst._light.entity:SetParent(inst.entity)

		inst:ListenForEvent("onputininventory", setLight)
		inst:ListenForEvent("ondropped", setLight)
		inst:ListenForEvent("equipped", setLight)
		inst:ListenForEvent("unequipped", setLight)
		inst:WatchWorldState("isnight", function(ent, isnight) setLight(ent) end)
		inst:ListenForEvent("onremove", onRemove)

		setLight(inst)
	end
)
AddPrefabPostInit("orangestaff",
	function(inst)
		if not TheWorld.ismastersim then return end

		inst._light = SpawnPrefab("pepalight")
		inst._light.entity:SetParent(inst.entity)

		inst:ListenForEvent("onputininventory", setLight)
		inst:ListenForEvent("ondropped", setLight)
		inst:ListenForEvent("equipped", setLight)
		inst:ListenForEvent("unequipped", setLight)
		inst:WatchWorldState("isnight", function(ent, isnight) setLight(ent) end)
		inst:ListenForEvent("onremove", onRemove)

		setLight(inst)
	end
)
end


AddPrefabPostInit( "wendy", function( inst)
    if not TheWorld.ismastersim then 
        return
    end
    if PEPPAWENDY == 1 then
    if inst.components.combat then
        inst.components.combat.externaldamagemultipliers:SetModifier("peppawendy", 4/3)
    end
end
if PEPPAWENDY == 2 then
    if inst.components.combat then
        inst.components.combat.externaldamagemultipliers:SetModifier("peppawendy", 2)
    end
end
if PEPPAWENDY == 3  then
    if inst.components.combat then
        inst.components.combat.externaldamagemultipliers:SetModifier("peppawendy", 8/3)
    end
end
   end)


---全图传送代码借鉴来自 “不笑猫” 大大！ → https://steamcommunity.com/id/yihcong/
if PEPPAEMO ~= 0 then
    if PEPPAEMO == 1 then
        
    local function orangestaff(inst)
        inst:AddTag("item_portal")
    end
    AddPrefabPostInit("cane", orangestaff)
    
    local function playercontroller(self)
        local old_GetMapActions = self.GetMapActions
        function self:GetMapActions(position)
            local LMBaction, RMBaction = old_GetMapActions(self, position)
            local inventory = self.inst.components.inventory or self.inst.replica.inventory
            if inventory and inventory:EquipHasTag("item_portal") then
                local act = BufferedAction(self.inst, nil, ACTIONS.ITEM_PORTAL)
                RMBaction = self:RemapMapAction(act, position)
                return LMBaction, RMBaction
            end
            return LMBaction, RMBaction
        end
        local old_OnMapAction = self.OnMapAction
        function self:OnMapAction(actioncode, position)
            old_OnMapAction(self, actioncode, position)
            local act = MOD_ACTIONS_BY_ACTION_CODE[STRINGS.ITEM_MODNAME][actioncode]
            if act == nil or not act.map_action then
                return
            end
            if self.ismastersim then
                local LMBaction, RMBaction = self:GetMapActions(position)
                if act.rmb then
                    if RMBaction then
                        self.locomotor:PushAction(RMBaction, true)
                    end
                else
                    if LMBaction then
                        self.locomotor:PushAction(LMBaction, true)
                    end
                end
            elseif self.locomotor == nil and not self.inst.item_portal then
                self.inst.item_portal = true
                if self.inst.item_task_portal == nil then
                    self.inst.item_task_portal = self.inst:DoTaskInTime(9, function()
                        self.inst.item_portal = false
                        self.inst.item_task_portal = nil
                    end)
                end
                SendRPCToServer(RPC.DoActionOnMap, actioncode, position.x, position.z)
            elseif self:CanLocomote() then
                local _, RMBaction = self:GetMapActions(position)
                RMBaction.preview_cb = function()
                    SendRPCToServer(RPC.DoActionOnMap, actioncode, position.x, position.z)
                end
                self.locomotor:PreviewAction(RMBaction, true)
            end
        end
    end
    AddComponentPostInit("playercontroller", playercontroller)
    
    AddAction("ITEM_PORTAL", "跃迁", function(act)
        if act == nil or act.doer == nil or act.pos == nil then
            return false
        end
        local inst = act.doer
        local targetpos = act.pos:GetPosition()
        local pt = inst:GetPosition()
        local offset = FindWalkableOffset(pt, math.random() * 2 * PI, 3 + math.random(), 16, false, true, noentcheckfn, true, true)
                or FindWalkableOffset(pt, math.random() * 2 * PI, 5 + math.random(), 16, false, true, noentcheckfn, true, true)
                or FindWalkableOffset(pt, math.random() * 2 * PI, 7 + math.random(), 16, false, true, noentcheckfn, true, true)
        if offset ~= nil then
            pt = pt + offset
        end
        local portal = SpawnPrefab("pocketwatch_portal_entrance")
        portal.Transform:SetPosition(pt:Get())
        portal:SpawnExit(TheShard:GetShardId(), targetpos.x or pt.x, 0, targetpos.z or pt.z)
        inst.SoundEmitter:PlaySound("wanda1/wanda/portal_entrance_pre")
        local hands = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
        if hands and hands.components.finiteuses then
            hands.components.finiteuses:Use(1)
        end
        return true
    end).map_action = true
    ACTIONS.ITEM_PORTAL.do_not_locomote = true
    ACTIONS.ITEM_PORTAL.rmb = true
    STRINGS.ITEM_MODNAME = ACTIONS.ITEM_PORTAL.mod_name
    
    AddStategraphActionHandler("wilson", ActionHandler(GLOBAL.ACTIONS.ITEM_PORTAL, nil))
    AddStategraphActionHandler("wilson_client", ActionHandler(GLOBAL.ACTIONS.ITEM_PORTAL, nil))
    
    local BLINK_MAP_MUST = { "CLASSIFIED", "globalmapicon", "fogrevealer" }
    ACTIONS_MAP_REMAP[ACTIONS.ITEM_PORTAL.code] = function(act, targetpos)
        local doer = act.doer
        if doer == nil then
            return nil
        end
        if doer.item_portal then
            return nil
        end
        local distoverride
        if not TheWorld.Map:IsVisualGroundAtPoint(targetpos.x, targetpos.y, targetpos.z) then
            local ents = TheSim:FindEntities(targetpos.x, targetpos.y, targetpos.z, PLAYER_REVEAL_RADIUS * 0.4, BLINK_MAP_MUST)
            local revealer
            local MAX_WALKABLE_PLATFORM_DIAMETERSQ = TUNING.MAX_WALKABLE_PLATFORM_RADIUS * TUNING.MAX_WALKABLE_PLATFORM_RADIUS * 4 -- Diameter.
            for _, v in ipairs(ents) do
                if doer:GetDistanceSqToInst(v) > MAX_WALKABLE_PLATFORM_DIAMETERSQ then
                    -- Ignore close boats because the range for aim assist is huge.
                    revealer = v
                    break
                end
            end
            if revealer == nil then
                return nil
            end
            targetpos.x, targetpos.y, targetpos.z = revealer.Transform:GetWorldPosition()
            distoverride = act.pos:GetPosition():Dist(targetpos)
            if revealer._target ~= nil then
                -- Server only code.
                local boat = revealer._target:GetCurrentPlatform()
                if boat == nil then
                    return nil
                end
                targetpos.x, targetpos.y, targetpos.z = boat.Transform:GetWorldPosition()
            end
        end
        local act_remap = BufferedAction(doer, nil, ACTIONS.ITEM_PORTAL, act.invobject, targetpos)
        return act_remap
    end
    
    
    AddPrefabPostInit("orangestaff", orangestaff)
    
    AddAction("ITEM_PORTAL", "跃迁", function(act)
        if act == nil or act.doer == nil or act.pos == nil then
            return false
        end
        local inst = act.doer
        local targetpos = act.pos:GetPosition()
        local pt = inst:GetPosition()
        local offset = FindWalkableOffset(pt, math.random() * 2 * PI, 3 + math.random(), 16, false, true, noentcheckfn, true, true)
                or FindWalkableOffset(pt, math.random() * 2 * PI, 5 + math.random(), 16, false, true, noentcheckfn, true, true)
                or FindWalkableOffset(pt, math.random() * 2 * PI, 7 + math.random(), 16, false, true, noentcheckfn, true, true)
        if offset ~= nil then
            pt = pt + offset
        end
        local portal = SpawnPrefab("pocketwatch_portal_entrance")
        portal.Transform:SetPosition(pt:Get())
        portal:SpawnExit(TheShard:GetShardId(), targetpos.x or pt.x, 0, targetpos.z or pt.z)
        inst.SoundEmitter:PlaySound("wanda1/wanda/portal_entrance_pre")
        local hands = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
        if hands and hands.components.finiteuses then
            hands.components.finiteuses:Use(1)
        end
        return true
    end).map_action = true
    ACTIONS.ITEM_PORTAL.do_not_locomote = true
    ACTIONS.ITEM_PORTAL.rmb = true
    STRINGS.ITEM_MODNAME = ACTIONS.ITEM_PORTAL.mod_name
    
    AddStategraphActionHandler("wilson", ActionHandler(GLOBAL.ACTIONS.ITEM_PORTAL, nil))
    AddStategraphActionHandler("wilson_client", ActionHandler(GLOBAL.ACTIONS.ITEM_PORTAL, nil))
    
    local BLINK_MAP_MUST = { "CLASSIFIED", "globalmapicon", "fogrevealer" }
    ACTIONS_MAP_REMAP[ACTIONS.ITEM_PORTAL.code] = function(act, targetpos)
        local doer = act.doer
        if doer == nil then
            return nil
        end
        if doer.item_portal then
            return nil
        end
        local distoverride
        if not TheWorld.Map:IsVisualGroundAtPoint(targetpos.x, targetpos.y, targetpos.z) then
            local ents = TheSim:FindEntities(targetpos.x, targetpos.y, targetpos.z, PLAYER_REVEAL_RADIUS * 0.4, BLINK_MAP_MUST)
            local revealer
            local MAX_WALKABLE_PLATFORM_DIAMETERSQ = TUNING.MAX_WALKABLE_PLATFORM_RADIUS * TUNING.MAX_WALKABLE_PLATFORM_RADIUS * 4 -- Diameter.
            for _, v in ipairs(ents) do
                if doer:GetDistanceSqToInst(v) > MAX_WALKABLE_PLATFORM_DIAMETERSQ then
                    -- Ignore close boats because the range for aim assist is huge.
                    revealer = v
                    break
                end
            end
            if revealer == nil then
                return nil
            end
            targetpos.x, targetpos.y, targetpos.z = revealer.Transform:GetWorldPosition()
            distoverride = act.pos:GetPosition():Dist(targetpos)
            if revealer._target ~= nil then
                -- Server only code.
                local boat = revealer._target:GetCurrentPlatform()
                if boat == nil then
                    return nil
                end
                targetpos.x, targetpos.y, targetpos.z = boat.Transform:GetWorldPosition()
            end
        end
        local act_remap = BufferedAction(doer, nil, ACTIONS.ITEM_PORTAL, act.invobject, targetpos)
        return act_remap
    end
       
   end

if PEPPAEMO == 2 then
    local function orangestaff(inst)
        inst:AddTag("item_portal")
    end
    AddPrefabPostInit("orangestaff", orangestaff)
    
    local function playercontroller(self)
        local old_GetMapActions = self.GetMapActions
        function self:GetMapActions(position)
            local LMBaction, RMBaction = old_GetMapActions(self, position)
            local inventory = self.inst.components.inventory or self.inst.replica.inventory
            if inventory and inventory:EquipHasTag("item_portal") then
                local act = BufferedAction(self.inst, nil, ACTIONS.ITEM_PORTAL)
                RMBaction = self:RemapMapAction(act, position)
                return LMBaction, RMBaction
            end
            return LMBaction, RMBaction
        end
        local old_OnMapAction = self.OnMapAction
        function self:OnMapAction(actioncode, position)
            old_OnMapAction(self, actioncode, position)
            local act = MOD_ACTIONS_BY_ACTION_CODE[STRINGS.ITEM_MODNAME][actioncode]
            if act == nil or not act.map_action then
                return
            end
            if self.ismastersim then
                local LMBaction, RMBaction = self:GetMapActions(position)
                if act.rmb then
                    if RMBaction then
                        self.locomotor:PushAction(RMBaction, true)
                    end
                else
                    if LMBaction then
                        self.locomotor:PushAction(LMBaction, true)
                    end
                end
            elseif self.locomotor == nil and not self.inst.item_portal then
                self.inst.item_portal = true
                if self.inst.item_task_portal == nil then
                    self.inst.item_task_portal = self.inst:DoTaskInTime(9, function()
                        self.inst.item_portal = false
                        self.inst.item_task_portal = nil
                    end)
                end
                SendRPCToServer(RPC.DoActionOnMap, actioncode, position.x, position.z)
            elseif self:CanLocomote() then
                local _, RMBaction = self:GetMapActions(position)
                RMBaction.preview_cb = function()
                    SendRPCToServer(RPC.DoActionOnMap, actioncode, position.x, position.z)
                end
                self.locomotor:PreviewAction(RMBaction, true)
            end
        end
    end
    AddComponentPostInit("playercontroller", playercontroller)
    
    AddAction("ITEM_PORTAL", "跃迁", function(act)
        if act == nil or act.doer == nil or act.pos == nil then
            return false
        end
        local inst = act.doer
        local targetpos = act.pos:GetPosition()
        local pt = inst:GetPosition()
        local offset = FindWalkableOffset(pt, math.random() * 2 * PI, 3 + math.random(), 16, false, true, noentcheckfn, true, true)
                or FindWalkableOffset(pt, math.random() * 2 * PI, 5 + math.random(), 16, false, true, noentcheckfn, true, true)
                or FindWalkableOffset(pt, math.random() * 2 * PI, 7 + math.random(), 16, false, true, noentcheckfn, true, true)
        if offset ~= nil then
            pt = pt + offset
        end
        local portal = SpawnPrefab("pocketwatch_portal_entrance")
        portal.Transform:SetPosition(pt:Get())
        portal:SpawnExit(TheShard:GetShardId(), targetpos.x or pt.x, 0, targetpos.z or pt.z)
        inst.SoundEmitter:PlaySound("wanda1/wanda/portal_entrance_pre")
        local hands = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
        if hands and hands.components.finiteuses then
            hands.components.finiteuses:Use(1)
        end
        return true
    end).map_action = true
    ACTIONS.ITEM_PORTAL.do_not_locomote = true
    ACTIONS.ITEM_PORTAL.rmb = true
    STRINGS.ITEM_MODNAME = ACTIONS.ITEM_PORTAL.mod_name
    
    AddStategraphActionHandler("wilson", ActionHandler(GLOBAL.ACTIONS.ITEM_PORTAL, nil))
    AddStategraphActionHandler("wilson_client", ActionHandler(GLOBAL.ACTIONS.ITEM_PORTAL, nil))
    
    local BLINK_MAP_MUST = { "CLASSIFIED", "globalmapicon", "fogrevealer" }
    ACTIONS_MAP_REMAP[ACTIONS.ITEM_PORTAL.code] = function(act, targetpos)
        local doer = act.doer
        if doer == nil then
            return nil
        end
        if doer.item_portal then
            return nil
        end
        local distoverride
        if not TheWorld.Map:IsVisualGroundAtPoint(targetpos.x, targetpos.y, targetpos.z) then
            local ents = TheSim:FindEntities(targetpos.x, targetpos.y, targetpos.z, PLAYER_REVEAL_RADIUS * 0.4, BLINK_MAP_MUST)
            local revealer
            local MAX_WALKABLE_PLATFORM_DIAMETERSQ = TUNING.MAX_WALKABLE_PLATFORM_RADIUS * TUNING.MAX_WALKABLE_PLATFORM_RADIUS * 4 -- Diameter.
            for _, v in ipairs(ents) do
                if doer:GetDistanceSqToInst(v) > MAX_WALKABLE_PLATFORM_DIAMETERSQ then
                    -- Ignore close boats because the range for aim assist is huge.
                    revealer = v
                    break
                end
            end
            if revealer == nil then
                return nil
            end
            targetpos.x, targetpos.y, targetpos.z = revealer.Transform:GetWorldPosition()
            distoverride = act.pos:GetPosition():Dist(targetpos)
            if revealer._target ~= nil then
                -- Server only code.
                local boat = revealer._target:GetCurrentPlatform()
                if boat == nil then
                    return nil
                end
                targetpos.x, targetpos.y, targetpos.z = boat.Transform:GetWorldPosition()
            end
        end
        local act_remap = BufferedAction(doer, nil, ACTIONS.ITEM_PORTAL, act.invobject, targetpos)
        return act_remap
    end
end
end

if PEPPATASHUI ~= 0 then
    
    AddPrefabPostInit("cane", function(inst)
        local function becameking(inst, owner)
            if owner.components.drownable ~= nil then
                if owner.components.drownable.enabled == false then
                    owner.Physics:ClearCollisionMask()
                    owner.Physics:CollidesWith(COLLISION.GROUND)
                    owner.Physics:CollidesWith(COLLISION.OBSTACLES)
                    owner.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
                    owner.Physics:CollidesWith(COLLISION.CHARACTERS)
                    owner.Physics:CollidesWith(COLLISION.GIANTS)
                elseif owner.components.drownable.enabled == true then
                    if not owner:HasTag("playerghost") then
                        owner.Physics:ClearCollisionMask()
                        owner.Physics:CollidesWith(COLLISION.WORLD)
                        owner.Physics:CollidesWith(COLLISION.OBSTACLES)
                        owner.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
                        owner.Physics:CollidesWith(COLLISION.CHARACTERS)
                        owner.Physics:CollidesWith(COLLISION.GIANTS)
                    end
                end
            end
        end
        
        if not TheWorld.ismastersim then
            return inst
        end

        if inst.components.equippable then
            local _onequip = inst.components.equippable.onequipfn
            inst.components.equippable:SetOnEquip(function(inst, owner)
                _onequip(inst, owner)

                if owner and owner.components.drownable and owner.sg then
                    owner.components.drownable.enabled = false
                    
                    becameking(inst, owner)
                    inst.delay_count = 0
                    inst.aaa_moving_task = inst:DoPeriodicTask(0.1,function()
                        local is_moving = owner.sg:HasStateTag("moving")--在移动
                        local is_running = owner.sg:HasStateTag("running")--在跑步
                        if owner.components.drownable ~= nil and owner.components.drownable:IsOverWater() then
                            if is_running or is_moving then 
                                inst.delay_count = inst.delay_count + 1
                                if inst.delay_count >= 1.5 then
                                    SpawnPrefab("weregoose_splash_less"..tostring(math.random(2))).entity:SetParent(owner.entity)
                                    inst.delay_count =0
                                end
                            end
                        end
                    end)
                end
            end)

            local _onunequip = inst.components.equippable.onunequipfn
            inst.components.equippable:SetOnUnequip(function(inst, owner)
                _onunequip(inst, owner)
                if inst.aaa_moving_task then
                    inst.aaa_moving_task:Cancel()
                    inst.aaa_moving_task =nil
                end
                if owner and owner.components.drownable then
                    owner.components.drownable.enabled = true
                    becameking(inst, owner)
                    
                end
            end)
        end

    end)

    AddPrefabPostInit("orangestaff", function(inst)
        local function becameking(inst, owner)
            if owner.components.drownable ~= nil then
                if owner.components.drownable.enabled == false then
                    owner.Physics:ClearCollisionMask()
                    owner.Physics:CollidesWith(COLLISION.GROUND)
                    owner.Physics:CollidesWith(COLLISION.OBSTACLES)
                    owner.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
                    owner.Physics:CollidesWith(COLLISION.CHARACTERS)
                    owner.Physics:CollidesWith(COLLISION.GIANTS)
                elseif owner.components.drownable.enabled == true then
                    if not owner:HasTag("playerghost") then
                        owner.Physics:ClearCollisionMask()
                        owner.Physics:CollidesWith(COLLISION.WORLD)
                        owner.Physics:CollidesWith(COLLISION.OBSTACLES)
                        owner.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
                        owner.Physics:CollidesWith(COLLISION.CHARACTERS)
                        owner.Physics:CollidesWith(COLLISION.GIANTS)
                    end
                end
            end
        end

        if not TheWorld.ismastersim then
            return inst
        end

        if inst.components.equippable then
            local _onequip = inst.components.equippable.onequipfn
            inst.components.equippable:SetOnEquip(function(inst, owner)
                _onequip(inst, owner)

                if owner and owner.components.drownable and owner.sg then
                    owner.components.drownable.enabled = false
                    becameking(inst, owner)
                    
                    inst.delay_count = 0
                    inst.aaa_moving_task = inst:DoPeriodicTask(0.1,function()
                        local is_moving = owner.sg:HasStateTag("moving")--在移动
                        local is_running = owner.sg:HasStateTag("running")--在跑步
                        if owner.components.drownable ~= nil and owner.components.drownable:IsOverWater() then
                            if is_running or is_moving then 
                                inst.delay_count = inst.delay_count + 1
                                if inst.delay_count >= 1.5 then
                                    SpawnPrefab("weregoose_splash_less"..tostring(math.random(2))).entity:SetParent(owner.entity)
                                    inst.delay_count =0
                                end
                            end
                        end
                    end)
                end
            end)

            local _onunequip = inst.components.equippable.onunequipfn
            inst.components.equippable:SetOnUnequip(function(inst, owner)
                _onunequip(inst, owner)
                if inst.aaa_moving_task then
                    inst.aaa_moving_task:Cancel()
                    inst.aaa_moving_task =nil
                end
                if owner and owner.components.drownable then
                    owner.components.drownable.enabled = true
                    becameking(inst, owner)
                    
                end
            end)
        end

    end)

end

--[[local laonaiani = GetModConfigData("laonainai") 
local chushi = GetModConfigData("chushi")
local nvwushen = GetModConfigData("nvwushen")
local nvgong = GetModConfigData("nvgong")
local zhiwuren = GetModConfigData("zhiwuren")

AddPlayerPostInit(function(inst)
	if laonaiani  then
		if not inst:HasTag("bookbuilder") then
			inst:AddTag("bookbuilder")
			inst:AddTag("reader")
            
		end
        
	end
	if chushi then
		inst:AddTag("masterchef")
		inst:AddTag("professionalchef")
	end

	if nvwushen then
		inst:AddTag("valkyrie")
	end

	if nvgong then
		inst:AddTag("handyperson")
	end

    if zhiwuren then
        inst:AddTag("plantkin")
        inst:AddTag("self_fertilizable")
        if inst.prefab ~= "wormwood" then
            inst:ListenForEvent("itemplanted", function(src, data)
                if data == nil then
                elseif data.doer == inst then
                    inst.components.sanity:DoDelta(TUNING.SANITY_TINY * 2)
                end
            end, TheWorld)
        end
    end

	if not GLOBAL.TheWorld.ismastersim then
		return
	end

	if laonaiani and not inst.components.reader then
		inst:AddComponent("reader")
        inst.components.builder.science_bonus = 1
	end
end)

AddPrefabPostInit("flower",function(inst)
    if inst.components.pickable then
        local old = inst.components.pickable.onpickedfn
        inst.components.pickable.onpickedfn = function(inst, picker)
            old(inst, picker)
            if picker and picker:HasTag("plantkin") and picker.prefab ~= "wormwood" then
                picker.components.sanity:DoDelta(TUNING.SANITY_TINY)
            end
        end
    end
end)]]

-----------------------------------------------------------------------------------
-- 旺达能力代码好多 TAT， 以下代码来自--繁花丶海棠, 感谢大佬！

--[[if GetModConfigData("peppawangda") then
    -- 为玩家添加启用的各项能力并添加对话文本
    AddPlayerPostInit(
        function(inst)
            if inst.prefab~="wanda" then
                AddWandaAbility(inst)
            end  
          
        end
    )
    end
    
    -- 年龄变化特效
    local function PlayAgingFx(inst, fx_name)
        if inst.components.rider ~= nil and inst.components.rider:IsRiding() then
            fx_name = fx_name .. "_mount"
        end
    
        local fx = SpawnPrefab(fx_name)
        fx.entity:SetParent(inst.entity)
    end
    
    local function becomeold(inst, silent)
        if inst.age_state == "old" then
            return
        end
    
        if not silent then
            inst.sg:PushEvent("becomeolder_wanda")
            inst.components.talker:Say(STRINGS.CHARACTERS.WANDA.ANNOUNCE_WANDA_NORMALTOOLD)
            inst.SoundEmitter:PlaySound("wanda2/characters/wanda/older_transition")
            PlayAgingFx(inst, "oldager_become_older_fx")
        end
    
        inst.components.positionalwarp:SetWarpBackDist(TUNING.WANDA_WARP_DIST_OLD)
    
        inst.age_state = "old"
    
        inst.components.staffsanity:SetMultiplier(TUNING.WANDA_STAFFSANITY_OLD)
    end
    
    local function becomenormal(inst, silent)
        if inst.age_state == "normal" then
            return
        end
    
        if not silent then
            if inst.age_state == "young" then
                inst.components.talker:Say(STRINGS.CHARACTERS.WANDA.ANNOUNCE_WANDA_YOUNGTONORMAL)
                inst.sg:PushEvent("becomeolder_wanda")
                inst.SoundEmitter:PlaySound("wanda2/characters/wanda/older_transition")
                PlayAgingFx(inst, "oldager_become_older_fx")
            elseif inst.age_state == "old" then
                inst.components.talker:Say(STRINGS.CHARACTERS.WANDA.ANNOUNCE_WANDA_OLDTONORMAL)
                inst.sg:PushEvent("becomeyounger_wanda")
                inst.SoundEmitter:PlaySound("wanda2/characters/wanda/younger_transition")
                PlayAgingFx(inst, "oldager_become_younger_front_fx")
                PlayAgingFx(inst, "oldager_become_younger_back_fx")
            end
        end
    
        inst.components.positionalwarp:SetWarpBackDist(TUNING.WANDA_WARP_DIST_NORMAL)
    
        inst.age_state = "normal"
    
        inst.components.staffsanity:SetMultiplier(TUNING.WANDA_STAFFSANITY_NORMAL)
    end
    
    local function becomeyoung(inst, silent)
        if inst.age_state == "young" then
            return
        end
    
        if not silent then
            inst.components.talker:Say(STRINGS.CHARACTERS.WANDA.ANNOUNCE_WANDA_NORMALTOYOUNG)
            inst.sg:PushEvent("becomeyounger_wanda")
            inst.SoundEmitter:PlaySound("wanda2/characters/wanda/younger_transition")
            PlayAgingFx(inst, "oldager_become_younger_front_fx")
            PlayAgingFx(inst, "oldager_become_younger_back_fx")
        end
    
        inst.components.positionalwarp:SetWarpBackDist(TUNING.WANDA_WARP_DIST_YOUNG)
    
        inst.age_state = "young"
    
        inst.components.staffsanity:SetMultiplier(TUNING.WANDA_STAFFSANITY_YOUNG)
    end
    
    -- 血量变化时,跟随变化年龄
    local function onhealthchange(inst, data, forcesilent)
        if inst.sg:HasStateTag("nomorph") or inst:HasTag("playerghost") or inst.components.health:IsDead() then
            return
        end
    
        local silent = inst.sg:HasStateTag("silentmorph") or not inst.entity:IsVisible() or forcesilent
        local health = inst.components.health ~= nil and inst.components.health:GetPercent() or 0
    
        if inst.age_state == "old" then
            if health > TUNING.WANDA_AGE_THRESHOLD_OLD then
                if silent and health >= TUNING.WANDA_AGE_THRESHOLD_YOUNG then
                    becomeyoung(inst, true)
                else
                    becomenormal(inst, silent)
                end
            end
        elseif inst.age_state == "young" then
            if health < TUNING.WANDA_AGE_THRESHOLD_YOUNG then
                if silent and health <= TUNING.WANDA_AGE_THRESHOLD_OLD then
                    becomeold(inst, true)
                else
                    becomenormal(inst, silent)
                end
            end
        elseif health <= TUNING.WANDA_AGE_THRESHOLD_OLD then
            becomeold(inst, silent)
        elseif health >= TUNING.WANDA_AGE_THRESHOLD_YOUNG then
            becomeyoung(inst, silent)
        else
            becomenormal(inst, silent)
        end
    end
    
    --------------------------------------------------------------------------
    
    -- 复活
    local function onbecamehuman(inst, data, isloading)
        inst.age_state = nil
        onhealthchange(inst, nil, true)
    
        inst:ListenForEvent("healthdelta", onhealthchange)
    
        if inst.components.positionalwarp ~= nil then
            if not isloading then
                inst.components.positionalwarp:Reset()
            end
            if inst.components.inventory:HasItemWithTag("pocketwatch_warp", 1) then
                inst.components.positionalwarp:EnableMarker(true)
            end
        end
    end
    
    -- 阵亡
    local function onbecameghost(inst, data)
        inst.age_state = "old"
    
        inst:RemoveEventCallback("healthdelta", onhealthchange)
    
        if inst.components.positionalwarp ~= nil then
            inst.components.positionalwarp:EnableMarker(false)
        end
    end
    
    --------------------------------------------------------------------------
    -- 武器伤害系数
    local function CustomCombatDamage(inst, target, weapon, multiplier, mount)
        if mount == nil then
            if weapon ~= nil and weapon:HasTag("shadow_item") then
                return inst.age_state == "old" and TUNING.WANDA_SHADOW_DAMAGE_OLD or
                    inst.age_state == "normal" and TUNING.WANDA_SHADOW_DAMAGE_NORMAL or
                    TUNING.WANDA_SHADOW_DAMAGE_YOUNG
            else
                return 1
            end
        end
    
        return 1
    end
    
    -- 暗影武器攻击特效
    local function ShadowWeaponFx(inst, data)
        if
            data ~= nil and data.weapon ~= nil and data.weapon:IsValid() and data.weapon:HasTag("shadow_item") and
                data.target ~= nil and
                data.target:IsValid()
         then
            local fx_prefab =
                inst.age_state == "old" and
                (data.weapon:HasTag("pocketwatch") and "wanda_attack_pocketwatch_old_fx" or
                    "wanda_attack_shadowweapon_old_fx") or
                inst.age_state == "normal" and
                    (data.weapon:HasTag("pocketwatch") and "wanda_attack_pocketwatch_normal_fx" or
                        "wanda_attack_shadowweapon_normal_fx") or
                nil
    
            if fx_prefab ~= nil then
                local fx = SpawnPrefab(fx_prefab)
    
                local x, y, z = data.target.Transform:GetWorldPosition()
                local radius = data.target:GetPhysicsRadius(.5)
                local angle = (inst.Transform:GetRotation() - 90) * DEGREES
                fx.Transform:SetPosition(x + math.sin(angle) * radius, 0, z + math.cos(angle) * radius)
            end
        end
    end
    
    --------------------------------------------------------------------------
    -- 防掉落钟表
    local function OnGetItem(inst, data)
        local item = data ~= nil and data.item or nil
    
        if item ~= nil and item:HasTag("pocketwatch") then
            item.components.inventoryitem.keepondeath = item.prefab ~= "pocketwatch_revive" -- drop the revive watch so she can haunt it
            item.components.inventoryitem.keepondrown = true
            item:AddTag("nosteal") -- pocket watches in her inventory are attached to her outfit (see art)
        end
    end
    
    local function OnLoseItem(inst, data)
        local item = data ~= nil and (data.prev_item or data.item)
        if item and item:IsValid() and item:HasTag("pocketwatch") then
            item.components.inventoryitem.keepondeath = false
            item.components.inventoryitem.keepondrown = false
            item:RemoveTag("nosteal")
        end
    end
    
    -- 倒走表标记管理
    local function on_show_warp_marker(inst)
        inst.components.positionalwarp:EnableMarker(true)
    end
    
    local function on_hide_warp_marker(inst)
        inst.components.positionalwarp:EnableMarker(false)
    end
    
    local function DelayedWarpBackTalker(inst)
        -- if the player starts moving right away then we can skip this
        if inst.sg == nil or inst.sg:HasStateTag("idle") then
            inst.components.talker:Say(STRINGS.CHARACTERS.WANDA.ANNOUNCE_POCKETWATCH_RECALL)
        end
    end
    
    local function OnWarpBack(inst, data)
        if inst.components.positionalwarp ~= nil then
            if data ~= nil and data.reset_warp then
                inst.components.positionalwarp:Reset()
                inst:DoTaskInTime(15 * FRAMES, DelayedWarpBackTalker)
            else
                inst.components.positionalwarp:GetHistoryPosition(true)
            end
        end
    end
    
    --------------------------------------------------------------------------
    
    -- 进入游戏时初始化
    local function onload(inst)
        inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
        inst:ListenForEvent("ms_becameghost", onbecameghost)
    
        if inst:HasTag("playerghost") then
            onbecameghost(inst)
        elseif inst:HasTag("corpse") then
            onbecameghost(inst, {corpse = true})
        else
            onbecamehuman(inst, nil, true)
        end
    end
    
    local function OnNewSpawn(inst)
        onload(inst)
    end
    
    --------------------------------------------------------------------------
    -- 添加旺达能力
    function AddWandaAbility(inst)
        -- 钟表科技和拆除钟表
        inst:AddTag("clockmaker")
        -- 使用钟表
        inst:AddTag("pocketwatchcaster")
        -- 角色制作配方改动为年龄值，但这个功能对其他角色进行运算时需要做很多兼容多很多代码，不如直接去掉
        -- inst:AddTag("health_as_oldage")
    
        inst.AnimState:AddOverrideBuild("wanda_basics")
        inst.AnimState:AddOverrideBuild("wanda_attack")
    
        -- 剩下的代码只能在服务器端运行哦
        if not TheWorld.ismastersim then
            return inst
        end
    
        if not inst.components.positionalwarp then
            -- 倒走表表位置记录组件
            inst:AddComponent("positionalwarp")
            inst:DoTaskInTime(
            0,
            function()
            inst.components.positionalwarp:SetMarker("pocketwatch_warp_marker")
            end 
        )
        end
    
        if not inst.components.staffsanity then
            inst:AddComponent("staffsanity")
        end
    
        inst:ListenForEvent("show_warp_marker", on_show_warp_marker)
        inst:ListenForEvent("hide_warp_marker", on_hide_warp_marker)
    
        inst:ListenForEvent("itemget", OnGetItem)
        inst:ListenForEvent("equip", OnGetItem)
        inst:ListenForEvent("itemlose", OnLoseItem)
        inst:ListenForEvent("unequip", OnLoseItem)
    
        inst:ListenForEvent("onwarpback", OnWarpBack)
    
        -- 兼容温蒂，合并乘法计算伤害系数
        local oldCustomCombatDamage = inst.components.combat.customdamagemultfn
        function customdamagemultfn(...)
            return CustomCombatDamage(...) * (oldCustomCombatDamage and oldCustomCombatDamage(...) or 1)
        end
        inst.components.combat.customdamagemultfn = customdamagemultfn
    
        inst:ListenForEvent("onhitother", ShadowWeaponFx)
    
        local oldOnLoad = inst.OnLoad
        inst.OnLoad = function(...)
            if oldOnLoad then
                oldOnLoad(...)
            end
            onload(...)
        end
        local oldOnNewSpawn = inst.OnNewSpawn
        inst.OnNewSpawn = function(...)
            if oldOnNewSpawn then
                oldOnNewSpawn(...)
            end
            OnNewSpawn(...)
        end
        inst:ListenForEvent("ms_playerseamlessswaped", OnNewSpawn)
    end
    
    
    if GetModConfigData("peppawangda") then
        -- 兼容除旺达外的角色，没启用年龄化血量时也可以不老表回血
        local function Heal_DoCastSpell(inst, doer)
            local health = doer.components.health
    
            if health ~= nil and not health:IsDead() then
                if doer.components.oldager then
                    doer.components.oldager:StopDamageOverTime()
                end
                health:DoDelta(TUNING.POCKETWATCH_HEAL_HEALING, true, inst.prefab)
    
                local fx =
                    SpawnPrefab(
                    (doer.components.rider ~= nil and doer.components.rider:IsRiding()) and "pocketwatch_heal_fx_mount" or
                        "pocketwatch_heal_fx"
                )
                fx.entity:SetParent(doer.entity)
    
                inst.components.rechargeable:Discharge(TUNING.POCKETWATCH_HEAL_COOLDOWN)
                return true
            end
        end
    
        AddPrefabPostInit(
            "pocketwatch_heal",
            function(inst)
                if not TheWorld.ismastersim then
                    return inst
                end
                inst.components.pocketwatch.DoCastSpell = Heal_DoCastSpell
            end
        )
    end
    
    -- 防止再说出非法语言
    AddClassPostConstruct(
        "components/talker",
        function(self)
            local oldSay = self.Say
            self.Say = function(self, script, ...)
                if type(script) == "string" and string.find(script, "only_used_by_") then
                    -- print("说话失败", self.inst.prefab, script)
                    script = ""
                end
                oldSay(self, script, ...)
            end
        end
    )
    ]]

if PEPPAFUHUO ~=0 then
    AddPrefabPostInit("cane",function(inst)

        if not TheWorld.ismastersim then
            return inst
        end
       if  inst.components.hauntable then

        inst.components.hauntable.DoHaunt = function(self,doer)
            doer:PushEvent("respawnfromghost",{ source = self.inst})
            --self.inst:Remove()
            
        end
    end
        

    end)
    AddPrefabPostInit("orangestaff",function(inst)

        if not TheWorld.ismastersim then
            return inst
        end
       if  inst.components.hauntable then

        inst.components.hauntable.DoHaunt = function(self,doer)
            doer:PushEvent("respawnfromghost",{ source = self.inst})
            --self.inst:Remove()
            
        end
    end
    end)
end

if PEPPAZHANNIU ~= 0 then
TUNING.BEEFALO_MIN_DOMESTICATED_OBEDIENCE.ORNERY = 0.6
end

--瞬移需要添加的额外效果
local function onblink(staff, pos, caster)
    if caster then
        if caster.components.staffsanity then
            caster.components.staffsanity:DoCastingDelta(-TUNING.SANITY_MED)
        elseif caster.components.sanity ~= nil then
            caster.components.sanity:DoDelta(-TUNING.SANITY_MED)
        end
    end

    staff.components.finiteuses:Use(1)
end

local function Till(self,pt, doer)
	local NewX, Newy, Newz = TheWorld.Map:GetTileCenterPoint(pt.x, pt.y, pt.z)
	local ents = TheWorld.Map:GetEntitiesOnTileAtPoint(NewX, 0, Newz)
	for _, ent in ipairs(ents) do
		if ent ~= inst and ent:HasTag("soil") then
			ent:PushEvent("collapsesoil")
		elseif ent:HasTag("antlion_sinkhole") then -- 这段逻辑貌似没效
			if ent.remainingrepairs then
				for i = 1, ent.remainingrepairs do
					ent:PushEvent("timerdone", {
						name = "nextrepair"
					})
				end
			else
				ent.remainingrepairs = 1
				ent:PushEvent("timerdone", {
					name = "nextrepair"
				})
			end
		end
	end
	local TILLSOIL_IGNORE_TAGS = {"NOBLOCK", "player", "FX", "INLIMBO", "DECOR", "WALKABLEPLATFORM",
								  "soil", "medal_farm_plow"}
	for i = 0, 2 do
		for k = 0, 2 do
			local loction_x = NewX + 1.3 * i - 1.3
			local loction_z = Newz + 1.3 * k - 1.3
			if TheWorld.Map:IsDeployPointClear(Vector3(loction_x, 0, loction_z), nil,
				GetFarmTillSpacing(), nil, nil, nil, TILLSOIL_IGNORE_TAGS) then
				SpawnPrefab("farm_soil").Transform:SetPosition(loction_x, 0, loction_z)
			end
		end
	end
	return true
end

local function bn(inst)
 ---除了耐久配置都一样，整合到一起

   if inst.moshibaocun == 1 then
	inst.moshibaocun = 2
   if PEPPAHAMMER ~= 0 then -- 锤子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.HAMMER,PEPPAHAMMER) -- 添加锤动作和工作效率
    end
    if PEPPAPICKAXE ~= 0 then -- 镐子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.MINE,PEPPAPICKAXE) -- 添加稿动作和工作效率
        inst.components.tool:EnableToughWork(true)
    end
    if PEPPASHOVEL ~= 0 then -- 铲子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.DIG,PEPPASHOVEL) -- 添加挖动作和工作效率
    end
    if PEPPAAXE ~= 0 then -- 斧子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.CHOP,PEPPAAXE) -- 添加砍动作和工作效率
    end

    if PEPPASCYTHE ~= 0 then -- 镰刀
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.SCYTHE) -- 添加镰刀

        inst.DoScythe = DoScythe
    inst.IsEntityInFront = IsEntityInFront
    inst.HarvestPickable = HarvestPickable
    end
    if PEPPABUGNET ~= 0 then -- 捕虫网
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.NET) -- 添加网动作
    end
    if PEPPAOAR ~= 0 then
        if not inst.components.oar then
            inst:AddComponent("oar")
        end --没有木浆添加木浆组件
        inst:AddTag("allow_action_on_impassable")
        if PEPPAOAR == 1 then
            inst.components.oar.force = 0.5
            inst.components.oar.max_velocity = 3.5
        end
        if PEPPAOAR == 2 then
            inst.components.oar.force = 0.8
            inst.components.oar.max_velocity = 5
            
        end
        if PEPPAOAR == 0 then
            inst:RemoveComponent("oar")
        end
    end

    if PEPPABRUSH ~= 0 then
        if not inst.components.brush then
            inst:AddComponent("brush")
        end --没有刷子添加刷子组件 
        
     
    end

   
        
    if PEPPAFISHROD ~= 0 then
        if not inst.components.fishingrod then
            inst:AddComponent("fishingrod")
        end -- 没有钓鱼竿添加钓鱼竿组件
    end
	
    if PEPPAXIAOLV ~= 0 then
        if not inst.components.fishingrod then
            return
        end
		
        inst.components.fishingrod:SetWaitTimes(1, 1)
        inst.components.fishingrod:SetStrainTimes(0, 100)
    end
	
	
    if PEPPAHOE ~= 0 then -- 锄头 0 关闭 1 征程 2 9坑
        if not inst.components.farmtiller then
            inst:AddComponent("farmtiller")
        end -- 没有锄地添加锄地组件
		
        inst:AddInherentAction(ACTIONS.TILL) -- 添加锄地动作
        -- 挖九格要修改锄地的方法，有时间再做
        ACTIONS.TILL.priority = 11

		if PEPPAHOE == 2 then 
            inst.components.farmtiller.Till = Till
		end
    end
    if PEPPAWATER ~= 0 then
        if not inst.components.wateryprotection then
            inst:AddComponent("wateryprotection")
        end
        inst:AddTag("wateringcan")
        if PEPPAWATER == 1 then
            inst.components.wateryprotection.addwetness = TUNING.WATERINGCAN_WATER_AMOUNT * 4--加湿
            inst.components.wateryprotection.temperaturereduction = TUNING.WATERINGCAN_TEMP_REDUCTION*10
            inst.components.wateryprotection:AddIgnoreTag("player")
        end
        if PEPPAWATER == 0 then
            inst:RemoveComponent("wateryprotection")
        end
          
       
       
    end
	
   if inst.components.inventoryitem.owner then
      inst.components.inventoryitem.owner.components.talker:Say("万能工具：开启万能工具模式")
   end
   inst.components.named:SetName("步行手杖:（工具模式）" )
  if inst:HasTag("peppazhaoliao")  then 
     else
   inst:AddTag("peppazhaoliao")	
     end
elseif inst.moshibaocun == 2 then
	 inst.moshibaocun = 1 
  if inst:HasTag("peppazhaoliao")  then
   inst:RemoveTag("peppazhaoliao")
  end
			if inst.components.tool then
				inst:RemoveComponent("tool")
			end
            if inst.components.oar then
				inst:RemoveComponent("oar")
			end
			if inst.components.wateryprotection then
                inst:RemoveComponent("wateryprotection")
            end
            if inst.components.brush then
                inst:RemoveComponent("brush")
            end
			
    if PEPPAFISHROD ~= 0 then
        if  inst.components.fishingrod then
            inst:RemoveComponent("fishingrod")
        end 
    end

    

    if PEPPAHOE ~= 0 then -- 锄头 0 关闭 1 征程 2 9坑
        if  inst.components.farmtiller then
            inst:RemoveComponent("farmtiller")
        end -- 没有锄地添加锄地组件
		
    end
   if inst.components.inventoryitem.owner then
      inst.components.inventoryitem.owner.components.talker:Say("万能工具：关闭万能工具模式")
   end
   inst.components.named:SetName("步行手杖:（手杖模式）" )
elseif inst.moshibaocun == 5 then
	 inst.moshibaocun = 6 
   if PEPPAHAMMER ~= 0 then -- 锤子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.HAMMER,PEPPAHAMMER) -- 添加锤动作和工作效率
    end
    if PEPPAPICKAXE ~= 0 then -- 镐子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.MINE,PEPPAPICKAXE) -- 添加稿动作和工作效率
        inst.components.tool:EnableToughWork(true)
    end
    if PEPPASHOVEL ~= 0 then -- 铲子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.DIG,PEPPASHOVEL) -- 添加挖动作和工作效率
    end
    if PEPPAAXE ~= 0 then -- 斧子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.CHOP,PEPPAAXE) -- 添加砍动作和工作效率
    end

    if PEPPASCYTHE ~= 0 then -- 镰刀
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.SCYTHE) -- 添加镰刀

        inst.DoScythe = DoScythe
    inst.IsEntityInFront = IsEntityInFront
    inst.HarvestPickable = HarvestPickable
    end
    if PEPPABUGNET ~= 0 then -- 捕虫网
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.NET) -- 添加网动作
    end
    if PEPPAOAR ~= 0 then
        if not inst.components.oar then
            inst:AddComponent("oar")
        end --没有木浆添加木浆组件
        inst:AddTag("allow_action_on_impassable")
        if PEPPAOAR == 1 then
            inst.components.oar.force = 0.3
            inst.components.oar.max_velocity = 3.5
        end
        if PEPPAOAR == 2 then
            inst.components.oar.force = 0.5
            inst.components.oar.max_velocity = 5
            
        end
        if PEPPAOAR == 0 then
            inst:RemoveComponent("oar")
        end
    end

    if PEPPABRUSH ~= 0 then
        if not inst.components.brush then
            inst:AddComponent("brush")
        end --没有刷子添加刷子组件 
       
       
    end
    
    
    if PEPPAHOE ~= 0 then -- 锄头 0 关闭 1 征程 2 9坑
        if not inst.components.farmtiller then
            inst:AddComponent("farmtiller")
        end -- 没有锄地添加锄地组件
		
        inst:AddInherentAction(ACTIONS.TILL) -- 添加锄地动作
        -- 挖九格要修改锄地的方法，有时间再做
        ACTIONS.TILL.priority = 11

		if PEPPAHOE == 2 then 
            inst.components.farmtiller.Till = Till
		end
    end
    if PEPPAWATER ~= 0 then
        if not inst.components.wateryprotection then
            inst:AddComponent("wateryprotection")
        end
        inst:AddTag("wateringcan")
        if PEPPAWATER == 1 then
            inst.components.wateryprotection.addwetness = TUNING.WATERINGCAN_WATER_AMOUNT * 4--加湿
            inst.components.wateryprotection.temperaturereduction = TUNING.WATERINGCAN_TEMP_REDUCTION*10
            inst.components.wateryprotection:AddIgnoreTag("player")
        end
        if PEPPAWATER == 0 then
            inst:RemoveComponent("wateryprotection")
        end
          
       
       
    end

  
	
    if PEPPAFISHROD ~= 0 then
        if not inst.components.fishingrod then
            inst:AddComponent("fishingrod")
        end -- 没有钓鱼竿添加钓鱼竿组件
    end
    if PEPPAXIAOLV ~= 0 then
        if not inst.components.fishingrod then
            return
        end
		
        inst.components.fishingrod:SetWaitTimes(1, 1)
        inst.components.fishingrod:SetStrainTimes(0, 100)
    end

    if inst.components.blinkstaff then
   	inst:RemoveComponent("blinkstaff")
	end
	
   if inst.components.inventoryitem.owner then
      inst.components.inventoryitem.owner.components.talker:Say("万能工具：开启万能工具模式并关闭瞬移(此时请勿使用扫把更换皮肤）")
      
   end
  
  
   inst.components.named:SetName("懒人魔杖:（工具模式）" )
   
   if inst:HasTag("peppazhaoliao")  then 
     else
   inst:AddTag("peppazhaoliao")	
    end
	 
   
elseif inst.moshibaocun == 6 then
       inst.moshibaocun = 5 
   if inst:HasTag("peppazhaoliao")  then 
   inst:RemoveTag("peppazhaoliao")	
   end
		
 if inst.components.tool then
    inst:RemoveComponent("tool")
 end
 if inst.components.oar then
    inst:RemoveComponent("oar")
 end
 if inst.components.wateryprotection then
    inst:RemoveComponent("wateryprotection")
 end
 if inst.components.brush then
    inst:RemoveComponent("brush")
end

    if PEPPAFISHROD ~= 0 then
        if  inst.components.fishingrod then
            inst:RemoveComponent("fishingrod")
        end 
    end
    if PEPPAHOE ~= 0 then -- 锄头 0 关闭 1 征程 2 9坑
        if  inst.components.farmtiller then
            inst:RemoveComponent("farmtiller")
        end -- 没有锄地添加锄地组件
    end
    if not inst.components.blinkstaff then
   	inst:AddComponent("blinkstaff")
    inst.components.blinkstaff:SetFX("sand_puff_large_front", "sand_puff_large_back")   ----这是克雷新写的一个特效
	inst.components.blinkstaff.onblinkfn = onblink
	end

   if inst.components.inventoryitem.owner then
      inst.components.inventoryitem.owner.components.talker:Say("万能工具：关闭万能工具模式")
   end
   inst.components.named:SetName("懒人魔杖:（魔杖模式）" )
	end
	
 return false
	
end

local function bnnnnn(inst) ---除了耐久配置都一样，整合到一起

   if inst.moshibaocun == 2 then
	inst.moshibaocun = 2
   if PEPPAHAMMER ~= 0 then -- 锤子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.HAMMER,PEPPAHAMMER) -- 添加锤动作和工作效率
    end
    if PEPPAPICKAXE ~= 0 then -- 镐子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.MINE,PEPPAPICKAXE) -- 添加稿动作和工作效率
        inst.components.tool:EnableToughWork(true)
    end
    if PEPPASHOVEL ~= 0 then -- 铲子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.DIG,PEPPASHOVEL) -- 添加挖动作和工作效率
    end
    if PEPPAAXE ~= 0 then -- 斧子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.CHOP,PEPPAAXE) -- 添加砍动作和工作效率
    end

    if PEPPASCYTHE ~= 0 then -- 镰刀
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.SCYTHE) -- 添加镰刀

        inst.DoScythe = DoScythe
    inst.IsEntityInFront = IsEntityInFront
    inst.HarvestPickable = HarvestPickable
    end
    if PEPPABUGNET ~= 0 then -- 捕虫网
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.NET) -- 添加网动作
    end
    if PEPPAOAR ~= 0 then
        if not inst.components.oar then
            inst:AddComponent("oar")
        end --没有木浆添加木浆组件
        inst:AddTag("allow_action_on_impassable")
        if PEPPAOAR == 1 then
            inst.components.oar.force = 0.3
            inst.components.oar.max_velocity = 3.5
        end
        if PEPPAOAR == 2 then
            inst.components.oar.force = 0.5
            inst.components.oar.max_velocity = 5
            
        end
        if PEPPAOAR == 0 then
            inst:RemoveComponent("oar")
        end
    end

    if PEPPABRUSH ~= 0 then
        if not inst.components.brush then
            inst:AddComponent("brush")
        end --没有刷子添加刷子组件 
       
        
        
    end
   
    
   
    if PEPPAFISHROD ~= 0 then
        if not inst.components.fishingrod then
            inst:AddComponent("fishingrod")
        end -- 没有钓鱼竿添加钓鱼竿组件
    end
	
    if PEPPAXIAOLV ~= 0 then
        if not inst.components.fishingrod then
            return
        end
		
        inst.components.fishingrod:SetWaitTimes(1, 1)
        inst.components.fishingrod:SetStrainTimes(0, 100)
    end
	
	
    if PEPPAHOE ~= 0 then -- 锄头 0 关闭 1 征程 2 9坑
        if not inst.components.farmtiller then
            inst:AddComponent("farmtiller")
        end -- 没有锄地添加锄地组件
		
        inst:AddInherentAction(ACTIONS.TILL) -- 添加锄地动作
        -- 挖九格要修改锄地的方法，有时间再做
        ACTIONS.TILL.priority = 11

		if PEPPAHOE == 2 then 
            inst.components.farmtiller.Till = Till
		end
    end
    if PEPPAWATER ~= 0 then
        if not inst.components.wateryprotection then
            inst:AddComponent("wateryprotection")
        end
        inst:AddTag("wateringcan")
        if PEPPAWATER == 1 then
            inst.components.wateryprotection.addwetness = TUNING.WATERINGCAN_WATER_AMOUNT * 4--加湿
            inst.components.wateryprotection.temperaturereduction = TUNING.WATERINGCAN_TEMP_REDUCTION*10
            inst.components.wateryprotection:AddIgnoreTag("player")
        end
        if PEPPAWATER == 0 then
            inst:RemoveComponent("wateryprotection")
        end
          
       
       
    end
	
   -- if inst.components.inventoryitem.owner then
   -- inst.components.inventoryitem.owner.components.talker:Say("万能工具：开启万能工具模式")
   -- end
   inst.components.named:SetName("步行手杖:（工具模式）" )
  if inst:HasTag("peppazhaoliao")  then 
     else
   inst:AddTag("peppazhaoliao")	
     end
elseif inst.moshibaocun == 1 then
	 inst.moshibaocun = 1 
  if inst:HasTag("peppazhaoliao")  then
   inst:RemoveTag("peppazhaoliao")
  end
			if inst.components.tool then
				inst:RemoveComponent("tool")
			end
			if inst.components.oar then
				inst:RemoveComponent("oar")
			end
			if inst.components.wateryprotection then
                inst:RemoveComponent("wateryprotection")
            end
            if inst.components.brush then
                inst:RemoveComponent("brush")
            end
    if PEPPAFISHROD ~= 0 then
        if  inst.components.fishingrod then
            inst:RemoveComponent("fishingrod")
        end 
    end

    if PEPPAHOE ~= 0 then -- 锄头 0 关闭 1 征程 2 9坑
        if  inst.components.farmtiller then
            inst:RemoveComponent("farmtiller")
        end -- 没有锄地添加锄地组件
		
    end
   -- if inst.components.inventoryitem.owner then
   -- inst.components.inventoryitem.owner.components.talker:Say("万能工具：关闭万能工具模式")
   -- end
   inst.components.named:SetName("步行手杖:（手杖模式）" )
elseif inst.moshibaocun == 6 then
	 inst.moshibaocun = 6 
   if PEPPAHAMMER ~= 0 then -- 锤子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.HAMMER,PEPPAHAMMER) -- 添加锤动作和工作效率
    end
    if PEPPAPICKAXE ~= 0 then -- 镐子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.MINE,PEPPAPICKAXE) -- 添加稿动作和工作效率
        inst.components.tool:EnableToughWork(true)
    end
    if PEPPASHOVEL ~= 0 then -- 铲子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.DIG,PEPPASHOVEL) -- 添加挖动作和工作效率
    end
    if PEPPAAXE ~= 0 then -- 斧子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.CHOP,PEPPAAXE) -- 添加砍动作和工作效率
    end

    if PEPPASCYTHE ~= 0 then -- 镰刀
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.SCYTHE) -- 添加镰刀

        inst.DoScythe = DoScythe
    inst.IsEntityInFront = IsEntityInFront
    inst.HarvestPickable = HarvestPickable
    end
    if PEPPABUGNET ~= 0 then -- 捕虫网
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.NET) -- 添加网动作
    end
    if PEPPAOAR ~= 0 then
        if not inst.components.oar then
            inst:AddComponent("oar")
        end --没有木浆添加木浆组件
        inst:AddTag("allow_action_on_impassable")
        if PEPPAOAR == 1 then
            inst.components.oar.force = 0.3
            inst.components.oar.max_velocity = 3.5
        end
        if PEPPAOAR == 2 then
            inst.components.oar.force = 0.5
            inst.components.oar.max_velocity = 5
        end
        if PEPPAOAR == 0 then
            inst:RemoveComponent("oar")
        end
    end

    if PEPPABRUSH ~= 0 then
        if not inst.components.brush then
            inst:AddComponent("brush")
        end --没有刷子添加刷子组件 
        
        
    end
   
    
    if PEPPAHOE ~= 0 then -- 锄头 0 关闭 1 征程 2 9坑
        if not inst.components.farmtiller then
            inst:AddComponent("farmtiller")
        end -- 没有锄地添加锄地组件
		
        inst:AddInherentAction(ACTIONS.TILL) -- 添加锄地动作
        -- 挖九格要修改锄地的方法，有时间再做
        ACTIONS.TILL.priority = 11

		if PEPPAHOE == 2 then 
            inst.components.farmtiller.Till = Till
		end
    end
    if PEPPAWATER ~= 0 then
        if not inst.components.wateryprotection then
            inst:AddComponent("wateryprotection")
        end
        inst:AddTag("wateringcan")
        if PEPPAWATER == 1 then
            inst.components.wateryprotection.addwetness = TUNING.WATERINGCAN_WATER_AMOUNT * 4--加湿
            inst.components.wateryprotection.temperaturereduction = TUNING.WATERINGCAN_TEMP_REDUCTION*10
            inst.components.wateryprotection:AddIgnoreTag("player")
        end
        if PEPPAWATER == 0 then
            inst:RemoveComponent("wateryprotection")
        end
          
       
           
       
    end
    if PEPPAFISHROD ~= 0 then
        if not inst.components.fishingrod then
            inst:AddComponent("fishingrod")
        end -- 没有钓鱼竿添加钓鱼竿组件
    end
    if PEPPAXIAOLV ~= 0 then
        if not inst.components.fishingrod then
            return
        end
		
        inst.components.fishingrod:SetWaitTimes(1, 1)
        inst.components.fishingrod:SetStrainTimes(0, 100)
    end

    if inst.components.blinkstaff then
   	inst:RemoveComponent("blinkstaff")
	end
	
   -- if inst.components.inventoryitem.owner then
   -- inst.components.inventoryitem.owner.components.talker:Say("万能工具：开启万能工具模式并关闭瞬移")
   -- end
   inst.components.named:SetName("懒人魔杖:（工具模式）" )
   
   if inst:HasTag("peppazhaoliao")  then 
     else
   inst:AddTag("peppazhaoliao")	
    end
	 
   
elseif inst.moshibaocun == 5 then
       inst.moshibaocun = 5 
   if inst:HasTag("peppazhaoliao")  then 
   inst:RemoveTag("peppazhaoliao")	
   end
		
 if inst.components.tool then
    inst:RemoveComponent("tool")
 end
 if inst.components.oar then
    inst:RemoveComponent("oar")
end
if inst.components.wateryprotection then
    inst:RemoveComponent("wateryprotection")
end
if inst.components.brush then
    inst:RemoveComponent("brush")
end
    if PEPPAFISHROD ~= 0 then
        if  inst.components.fishingrod then
            inst:RemoveComponent("fishingrod")
        end 
    end
    if PEPPAHOE ~= 0 then -- 锄头 0 关闭 1 征程 2 9坑
        if  inst.components.farmtiller then
            inst:RemoveComponent("farmtiller")
        end -- 没有锄地添加锄地组件
    end
    if not inst.components.blinkstaff then
   	inst:AddComponent("blinkstaff")
    inst.components.blinkstaff:SetFX("sand_puff_large_front", "sand_puff_large_back")   ----这是克雷新写的一个特效
	inst.components.blinkstaff.onblinkfn = onblink
	end

   -- if inst.components.inventoryitem.owner then
   -- inst.components.inventoryitem.owner.components.talker:Say("万能工具：关闭万能工具模式")
   -- end
   inst.components.named:SetName("懒人魔杖:（魔杖模式）" )
	end
	
 return false
	
end
----------这里没必要移除的功能，如果你非要移除你可以自行加入上方的列表内
local function bn2(inst) ---这样做避免了重复触发添加的未必要代码
    if PEPPASPEED ~= 0 then -- 移速

        if inst.components.equippable then
            inst.components.equippable.walkspeedmult = PEPPASPEED
        end

    end
    
       
    

    
	
    if PEPPADAMAGE ~= 0 then -- 伤害
        if not inst.components.weapon then
            inst:AddComponent("weapon")
        end -- 没有武器添加武器组件
        inst.components.weapon:SetDamage(PEPPADAMAGE) -- 设置伤害
    end

    if PEPPARANGE ~= 0 then -- 伤害
        if not inst.components.weapon then
            inst:AddComponent("weapon")
        end -- 没有武器添加武器组件
        inst.components.weapon:SetRange(PEPPARANGE) -- 设置攻击距离
    end

    if PEPPADUMBBELL ~= 0 then -- 大力士
        inst:AddTag("dumbbell") -- 加个标签
    end
    if PEPPARAIN ~= 0 then -- 防雨
        if not inst.components.equippable then
            inst:AddComponent("equippable")
        end -- 没有装备添加装备组件
        if not inst.components.waterproofer then
            inst:AddComponent("waterproofer")
        end -- 没有防雨添加防雨组件
        inst.components.waterproofer:SetEffectiveness(PEPPARAIN) 
    end
    if PEPPATHUNDER ~= 0 then -- 防雷
        if not inst.components.equippable then
            inst:AddComponent("equippable")
        end -- 没有装备添加装备组件
        inst.components.equippable.insulated = true -- 防雷
    end
	
end
----------------------------------------------------------------------


local function bn3(inst) ---这样是为了 直接添加 而不需要切换
   if PEPPAHAMMER ~= 0 then -- 锤子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.HAMMER,PEPPAHAMMER) -- 添加锤动作和工作效率
    end
    if PEPPAPICKAXE ~= 0 then -- 镐子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.MINE,PEPPAPICKAXE) -- 添加稿动作和工作效率
        inst.components.tool:EnableToughWork(true)
    end
    if PEPPASHOVEL ~= 0 then -- 铲子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.DIG,PEPPASHOVEL) -- 添加挖动作和工作效率
    end
    if PEPPAAXE ~= 0 then -- 斧子
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.CHOP,PEPPAAXE) -- 添加砍动作和工作效率
    end
    if PEPPASCYTHE ~= 0 then -- 镰刀
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.SCYTHE) -- 添加镰刀

        inst.DoScythe = DoScythe
    inst.IsEntityInFront = IsEntityInFront
    inst.HarvestPickable = HarvestPickable
    end
    if PEPPABUGNET ~= 0 then -- 捕虫网
        if not inst.components.tool then
            inst:AddComponent("tool")
        end -- 没有工具添加工具组件
        inst.components.tool:SetAction(ACTIONS.NET) -- 添加网动作
    end
    
    if PEPPAOAR ~= 0 then
        if not inst.components.oar then
            inst:AddComponent("oar")
        end --没有木浆添加木浆组件
        inst:AddTag("allow_action_on_impassable")
        if PEPPAOAR == 1 then
            inst.components.oar.force = 0.3
            inst.components.oar.max_velocity = 3.5
        end
        if PEPPAOAR == 2 then
            inst.components.oar.force = 0.5
            inst.components.oar.max_velocity = 5
            
        end
        if PEPPAOAR == 0 then
            inst:RemoveComponent("oar")
        end
    end

    if PEPPABRUSH ~= 0 then
        if not inst.components.brush then
            inst:AddComponent("brush")
        end --没有刷子添加刷子组件 
       
        
    end
   
    if PEPPAFISHROD ~= 0 then
        if not inst.components.fishingrod then
            inst:AddComponent("fishingrod")
        end -- 没有钓鱼竿添加钓鱼竿组件
    end
    if PEPPAXIAOLV ~= 0 then
        if not inst.components.fishingrod then
            return
        end
        inst.components.fishingrod:SetWaitTimes(1, 1)
        inst.components.fishingrod:SetStrainTimes(0, 100)
    end

    if PEPPAHOE ~= 0 then -- 锄头 0 关闭 1 征程 2 9坑
        if not inst.components.farmtiller then
            inst:AddComponent("farmtiller")
        end -- 没有锄地添加锄地组件
        inst:AddInherentAction(ACTIONS.TILL) -- 添加锄地动作
        -- 挖九格要修改锄地的方法，有时间再做
        ACTIONS.TILL.priority = 11

		if PEPPAHOE == 2 then 
            inst.components.farmtiller.Till = Till
		end
       

    end
    if PEPPAWATER ~= 0 then
        if not inst.components.wateryprotection then
            inst:AddComponent("wateryprotection")
        end
        inst:AddTag("wateringcan")
        if PEPPAWATER == 1 then
            inst.components.wateryprotection.addwetness = TUNING.WATERINGCAN_WATER_AMOUNT * 4--加湿
            inst.components.wateryprotection.temperaturereduction = TUNING.WATERINGCAN_TEMP_REDUCTION*10
            inst.components.wateryprotection:AddIgnoreTag("player")
        end
        if PEPPAWATER == 0 then
            inst:RemoveComponent("wateryprotection")
        end
          
       
       
    end

    if PEPPASPEED ~= 0 then -- 移速

        if inst.components.equippable then
            inst.components.equippable.walkspeedmult = PEPPASPEED
        end

    end
    
	
    if PEPPADAMAGE ~= 0 then -- 伤害
        if not inst.components.weapon then
            inst:AddComponent("weapon")
        end -- 没有武器添加武器组件
        inst.components.weapon:SetDamage(PEPPADAMAGE) -- 设置伤害
    end
    if PEPPADUMBBELL ~= 0 then -- 大力士
        inst:AddTag("dumbbell") -- 加个标签
    end
    if PEPPARAIN ~= 0 then -- 防雨
        if not inst.components.equippable then
            inst:AddComponent("equippable")
        end -- 没有装备添加装备组件
        if not inst.components.waterproofer then
            inst:AddComponent("waterproofer")
        end -- 没有防雨添加防雨组件
        inst.components.waterproofer:SetEffectiveness(PEPPARAIN) 
    end
    if PEPPATHUNDER ~= 0 then -- 防雷
        if not inst.components.equippable then
            inst:AddComponent("equippable")
        end -- 没有装备添加装备组件
        inst.components.equippable.insulated = true -- 防雷
    end
	
end


----------动态添加表

local function OnSave(inst, data)
	data.moshibaocun = inst.moshibaocun
end
local function onload(inst,data)
    if data ~= nil then
		if data.moshibaocun ~= nil then inst.moshibaocun = data.moshibaocun;end
    end
bnnnnn(inst)
end
------------驯服牦牛

local function CowboyOnMounted(owner, data)							-----给玩家载入驯服牛的代码检测
    local hat = owner.components.inventory ~= nil and owner.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) or nil --手上物品
    if hat == nil or (hat ~= nil and hat.prefab ~= "cane" and hat.prefab ~= "orangestaff") then			----如果不是手杖或懒人魔杖终止
        return
    end

    if data ~= nil and data.target ~= nil then
        local mymount = data.target     --获取牛
        local Domestication = mymount.components.domesticatable or nil

        if Domestication ~= nil and hat.cowboytask == nil then
            hat.cowboytask = hat:DoPeriodicTask(5, function()
                Domestication:DeltaDomestication(TUNING.BEEFALO_DOMESTICATION_GAIN_DOMESTICATION * PEPPAXUNNIU)
            end)
        end
    end
end

local function CowboyOnDismounted(owner, data)							-----给玩家载入驯服牛的代码判定终止			
    local hat = owner.components.inventory ~= nil and owner.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) or nil --手上物品

    if hat == nil or (hat ~= nil and hat.prefab ~= "cane" and hat.prefab ~= "orangestaff") then
        return
    end

    if hat.cowboytask ~= nil then										----取消牛仔循环任务
        hat.cowboytask:Cancel()
        hat.cowboytask = nil
    end
end

-------------------修改手杖
local function onequip(inst, owner)			----如果装备手杖则
    -- local skin_build = inst:GetSkinBuild()
    -- if skin_build ~= nil then
        -- owner:PushEvent("equipskinneditem", inst:GetSkinName())
        -- owner.AnimState:OverrideItemSkinSymbol("swap_object", skin_build, "swap_cane", inst.GUID, "swap_cane")
    -- else
        -- owner.AnimState:OverrideSymbol("swap_object", "swap_cane", "swap_cane")
    -- end
	
if owner:HasTag("player") then ----如果持有者是玩家
if owner.components.rider ~= nil then    ----如果人物是骑手
	if owner.components.rider:IsRiding() then --正在骑牛
		local mymount = owner.components.rider:GetMount() or nil --获取牛
		if mymount ~= nil then 	---如果牛存在
			local Domestication = mymount.components.domesticatable or nil   --获取牛的驯化组件
			if Domestication ~= nil and inst.cowboytask == nil then	---如果驯化组件和牛仔任务存在
				inst.cowboytask = inst:DoPeriodicTask(5, function()---执行在手杖上,且随时关闭任务
					-- print(inst)		---检测执行在什么东西上了，代码是否运行
					Domestication:DeltaDomestication(TUNING.BEEFALO_DOMESTICATION_GAIN_DOMESTICATION * PEPPAXUNNIU)								----驯牛组件翻倍
				end)
			end
		end
	end
end
        owner:ListenForEvent("mounted", CowboyOnMounted)				-----载入任务
        owner:ListenForEvent("dismounted", CowboyOnDismounted)			-----载入任务
end
    -- owner.AnimState:Show("ARM_carry")
    -- owner.AnimState:Hide("ARM_normal")
	
    -- owner:AddTag("beefalo") --牛牛的标签，加入后不会被发情牛主动攻击
end

local function onunequip(inst, owner)		----如果卸载手杖
    -- local skin_build = inst:GetSkinBuild()
    -- if skin_build ~= nil then
        -- owner:PushEvent("unequipskinneditem", inst:GetSkinName())
    -- end
	
	
    if owner:HasTag("player") then	---如果是玩家则移除组件移除任务移除定时器
        if inst.cowboytask ~= nil then
            inst.cowboytask:Cancel()
            inst.cowboytask = nil
        end															----强行移除计时任务
        owner:RemoveEventCallback("mounted", CowboyOnMounted)		----移除任务
        owner:RemoveEventCallback("dismounted", CowboyOnDismounted)	----移除任务
	end
	
    -- owner.AnimState:Hide("ARM_carry")
    -- owner.AnimState:Show("ARM_normal")
    -- owner:RemoveTag("beefalo")	---移除牛牛标签
end
---------------------------------------------修改懒人魔杖
local function onequip2(inst, owner)			----如果装备懒人魔杖
            -- local skin_build = inst:GetSkinBuild()
            -- if skin_build ~= nil then
                -- owner:PushEvent("equipskinneditem", inst:GetSkinName())
                -- owner.AnimState:OverrideItemSkinSymbol("swap_object", skin_build, "swap_orangestaff", inst.GUID, "swap_staffs")
            -- else
                -- owner.AnimState:OverrideSymbol("swap_object", "swap_staffs", "swap_orangestaff")
            -- end
			
			
			
			

if owner:HasTag("player") then ----如果持有者是玩家
if owner.components.rider ~= nil then    ----如果人物是骑手
	if owner.components.rider:IsRiding() then --正在骑牛
		local mymount = owner.components.rider:GetMount() or nil --获取牛
		if mymount ~= nil then 	---如果牛存在
			local Domestication = mymount.components.domesticatable or nil   --获取牛的驯化组件
			if Domestication ~= nil and inst.cowboytask == nil then	---如果驯化组件和牛仔任务存在
				inst.cowboytask = inst:DoPeriodicTask(5, function()---执行在手杖上,且随时关闭任务
					-- print(inst)		---检测执行在什么东西上了，代码是否运行
					Domestication:DeltaDomestication(TUNING.BEEFALO_DOMESTICATION_GAIN_DOMESTICATION * PEPPAXUNNIU)								----驯牛组件翻倍
				end)
			end
		end
	end
end
        owner:ListenForEvent("mounted", CowboyOnMounted)				-----载入任务
        owner:ListenForEvent("dismounted", CowboyOnDismounted)			-----载入任务
end
    -- owner.AnimState:Show("ARM_carry")
    -- owner.AnimState:Hide("ARM_normal")
	
    -- owner:AddTag("beefalo") --牛牛的标签，加入后不会被发情牛主动攻击
end

local function onunequip2(inst, owner)		----如果卸载懒人魔杖
    -- local skin_build = inst:GetSkinBuild()
    -- if skin_build ~= nil then
        -- owner:PushEvent("unequipskinneditem", inst:GetSkinName())
    -- end
	
	
    if owner:HasTag("player") then	---如果是玩家则移除组件移除任务移除定时器
        if inst.cowboytask ~= nil then
            inst.cowboytask:Cancel()
            inst.cowboytask = nil
        end															----强行移除计时任务
        owner:RemoveEventCallback("mounted", CowboyOnMounted)		----移除任务
        owner:RemoveEventCallback("dismounted", CowboyOnDismounted)	----移除任务
	end
	
    -- owner.AnimState:Hide("ARM_carry")
    -- owner.AnimState:Show("ARM_normal")
    -- owner:RemoveTag("beefalo")	---移除牛牛标签
end
---------------------------------------------
AddPrefabPostInit("cane", function(inst) -- 修改手杖


    if not TheWorld.ismastersim then -- 不是主机
        return -- 返回
    end

	bn2(inst)	
	

if PEPPAXUNNIU ~= 0 then


        local oldonequipfn = inst.components.equippable.onequipfn -- 获取旧方法
        local oldonunequipfn = inst.components.equippable.onunequipfn -- 获取旧方法
        inst.components.equippable.onequipfn = function(inst, owner) -- 新方法
            onequip(inst, owner) --执行
            if oldonequipfn then
                oldonequipfn(inst, owner) -- 执行旧方法
            end
        end
        inst.components.equippable.onunequipfn = function(inst, owner) -- 新方法
            onunequip(inst, owner)
            if oldonunequipfn then
                oldonunequipfn(inst, owner) -- 执行旧方法
            end
        end

end
	
if PEPPAQIEHUAN  then

    if PEPPAFISHROD ~= 0 then
		inst:AddComponent("fishingrod")
	end
    if PEPPAXIAOLV ~= 0 then
        inst.components.fishingrod:SetWaitTimes(1, 1)
        inst.components.fishingrod:SetStrainTimes(0, 100)
    end

    inst.moshibaocun = 1
	inst:AddComponent("named")
    inst:AddComponent("useableitem")                        --切换功能
	inst.components.useableitem:SetOnUseFn(bn)
	inst.OnSave = OnSave	
    inst.OnLoad = onload
	
else
bn3(inst)	
end

if  PEPPAZHAOLIAO  ~= 0 then
inst:DoPeriodicTask(1, function()
	if PEPPAQIEHUAN and inst:HasTag("peppazhaoliao") and  PEPPAZHAOLIAO  ~= 0 or not PEPPAQIEHUAN  and PEPPAZHAOLIAO  ~= 0 then
		local x, y, z = inst.Transform:GetWorldPosition() -- 获取实体坐标
		local ens = TheSim:FindEntities(x, 0, z, PEPPAZHAOLIAO, nil, {"INLIMBO"})
			for i, v in ipairs(ens) do
				if v.components.farmplanttendable ~= nil then
				   v.components.farmplanttendable:TendTo(inst)
				end

			end	
	end
end)
end

    if A ~= 0 then -- 耐久
        if not inst.components.finiteuses then
            inst:AddComponent("finiteuses")
        end -- 没有耐久添加耐久组件
        inst.components.finiteuses:SetMaxUses(A) -- 设置最大耐久
        inst.components.finiteuses:SetUses(A) -- 设置耐久
        inst.components.finiteuses:SetOnFinished(inst.Remove) -- 耐久用完时移除
    end


end)

if PEPPAJICHENG ~= 0 then
    AddPrefabPostInit("orangestaff", function(inst) -- 修改手杖
        if not TheWorld.ismastersim then -- 不是主机
            return -- 返回
        end
		
if PEPPAXUNNIU ~= 0 then	
        local oldonequipfn = inst.components.equippable.onequipfn -- 获取旧方法
        local oldonunequipfn = inst.components.equippable.onunequipfn -- 获取旧方法
        inst.components.equippable.onequipfn = function(inst, owner) -- 新方法
            onequip2(inst, owner) 
            if oldonequipfn then
                oldonequipfn(inst, owner) -- 执行旧方法
            end
        end
        inst.components.equippable.onunequipfn = function(inst, owner) -- 新方法
            onunequip2(inst, owner)
            if oldonunequipfn then
                oldonunequipfn(inst, owner) -- 执行旧方法
            end
        end
end
	
	bn2(inst)
if PEPPAQIEHUAN  then
    if PEPPAFISHROD ~= 0 then
		inst:AddComponent("fishingrod")
	end
    if PEPPAXIAOLV ~= 0 then
        inst.components.fishingrod:SetWaitTimes(1, 1)
        inst.components.fishingrod:SetStrainTimes(0, 100)
    end

    inst.moshibaocun = 5
	inst:AddComponent("named")	
    inst:AddComponent("useableitem")                        --切换功能
	inst.components.useableitem:SetOnUseFn(bn) 
	inst.OnSave = OnSave
    inst.OnLoad = onload

else
bn3(inst)
end
if  PEPPAZHAOLIAO  ~= 0 then
inst:DoPeriodicTask(1, function()
	if PEPPAQIEHUAN and inst:HasTag("peppazhaoliao") and  PEPPAZHAOLIAO  ~= 0 or not PEPPAQIEHUAN  and PEPPAZHAOLIAO  ~= 0 then
		local x, y, z = inst.Transform:GetWorldPosition() -- 获取实体坐标
		local ens = TheSim:FindEntities(x, 0, z, PEPPAZHAOLIAO, nil, {"INLIMBO"})
			for i, v in ipairs(ens) do
				if v.components.farmplanttendable ~= nil then
				   v.components.farmplanttendable:TendTo(inst)
				end

			end	
	end
end)
end
        if PEPPANAIJIU == 99999 then
            inst:AddTag("Infinite")
            inst:AddTag("hide_percentage")
            local function DoNothing()
                return
            end
            local finiteuses = inst.components.finiteuses
            if finiteuses then
                finiteuses.Use = DoNothing
            end

        else
            if inst.components.finiteuses then
                inst.components.finiteuses:SetMaxUses(20 * PEPPANAIJIU) -- 默认不是20吗？
                inst.components.finiteuses:SetUses(20 * PEPPANAIJIU)
            end
        end

    end)
end

if PEPPABAT == 1 then


AddPrefabPostInit("hambat",
function(inst)
    if not TheWorld.ismastersim then
        return
    end
    if inst.components.equippable then
        local _onequip = inst.components.equippable.onequipfn
        inst.components.equippable:SetOnEquip(function(inst, owner)
            _onequip(inst, owner)
            if inst.components.weapon then
                inst.components.weapon:SetDamage(TUNING.HAMBAT_DAMAGE)
            end
        end)

        local _onunequip = inst.components.equippable.onunequipfn
        inst.components.equippable:SetOnUnequip(function(inst, owner)
            _onunequip(inst, owner)
            if inst.components.weapon then
                inst.components.weapon:SetDamage(TUNING.HAMBAT_DAMAGE)
            end
        end)
    end

    if inst.components.weapon then
        inst.components.weapon:SetOnAttack(function() end)
    end

   -- inst.components.weapon:SetDamage(TUNING.HAMBAT_DAMAGE)

    --inst.components.weapon:SetOnAttack(function()
       -- inst.components.weapon:SetDamage(TUNING.HAMBAT_DAMAGE)
        -- print("HAMBAT  HIT ",math.random(100))
        -- print("attacker",attacker,"target:",target)
   -- end)
    -- inst:DoTaskInTime(1,function( ... )
    --     print("infot : habat  upgreade")
    -- end)

   -- inst:ListenForEvent("ondropped",function( ... )
        -- body
        --print(inst ,"ondropped  event")
    --end)
end
)
end