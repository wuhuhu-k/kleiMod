local assets =
{
    Asset("ANIM", "anim/ccs_starstaff.zip"),  --地上的动画
	Asset("ATLAS", "images/inventoryimages/ccs_starstaff.xml"), --加载物品栏贴图
    Asset("IMAGE", "images/inventoryimages/ccs_starstaff.tex"),

}

--信息显示
local function get_name(inst)
    local name = STRINGS.NAMES[string.upper(inst.prefab)] or "星星法杖"
    local opalpreciousgemcount = inst.net_opalpreciousgemcount:value()
    local yellowgemcount = inst.net_yellowgemcount:value()


    local named =
        name ..
        '\n位面伤害强化:' .. yellowgemcount .. '\n真实伤害强化:' .. opalpreciousgemcount

    return named
end

--内置cd
local function OnCooldown(inst)
    inst._cdtask = nil
end

local dynamicweapon_skin_data = {
	ccs_sword_skins3 = true
}

local function SetFxOwner(inst, owner, fx)
	-- if inst.blade1 then
	-- 	inst.blade1:Remove()
	-- 	inst.blade1 = nil
	-- end
	-- if inst.blade2 then
	-- 	inst.blade2:Remove()
	-- 	inst.blade2 = nil
	-- end
    if inst.blade1 == nil and fx then
        inst.blade1 = SpawnPrefab(fx)
    end
	if inst.blade2 == nil and fx then
        inst.blade2 = SpawnPrefab(fx)
    end

    if owner ~= nil then
		if inst.blade1 and inst.blade2 then
			inst.blade1.entity:SetParent(owner.entity)
        	inst.blade2.entity:SetParent(owner.entity)
        	inst.blade1.Follower:FollowSymbol(owner.GUID, "swap_object", nil, nil, nil, true, nil, 0, 3)
        	inst.blade2.Follower:FollowSymbol(owner.GUID, "swap_object", nil, nil, nil, true, nil, 5, 8)
        	inst.blade1.components.highlightchild:SetOwner(owner)
        	inst.blade2.components.highlightchild:SetOwner(owner)
		end
		

    else
        if inst.blade1 then
            inst.blade1:Remove()
            inst.blade1 = nil
        end
		if inst.blade2 then
            inst.blade2:Remove()
            inst.blade2 = nil
        end

    end
end


--附加效果
local function Sideeffect(inst, attacker, target)
    if attacker and inst._cdtask == nil then
        inst._cdtask = inst:DoTaskInTime(3, OnCooldown)
        if target and target:IsValid() then
            local x, y, z = target.Transform:GetWorldPosition()
            local fx = SpawnPrefab("ccs_star_burst")
            fx.Transform:SetPosition(x,y,z)
            target:DoTaskInTime(1,function ()
                if target and target:IsValid() then
                    local combat = attacker.components.combat
	                local mul = (combat.damagemultiplier or 0.9) * (combat.externaldamagemultipliers:Get())
                    local x, y, z = target.Transform:GetWorldPosition()
                    local ents = TheSim:FindEntities(x, y, z, 4, {"_combat", "_health"}, { "INLIMBO", "companion", "wall", "abigail", "shadowminion", "player", "playerghost", "erd_doll" })
                    for _, v in ipairs(ents) do
                        if v.components.health and not v.components.health:IsDead() and v.components.combat then
                            
                            local val = (inst.opalpreciousgemcount + inst.yellowgemcount + 50)/4
            
                            v.components.health:DoDelta(-val * mul, nil, inst.prefab, false, attacker, true) --造成伤害
                            if v.components.health:IsDead() and attacker and attacker:IsValid() then --推送死亡事件。击杀者为装备者
                                attacker:PushEvent("killed", { victim = v })
                                if v.components.combat ~= nil and v.components.combat.onkilledbyother ~= nil then
                                    v.components.combat.onkilledbyother(v, attacker)
                                end
                            end
                        end
                    end
                end
                
            end)
        end
    end
end

--固有真伤
local function DoRealDelta(inst, attacker, target)

    if target.components.health and not target.components.health:IsDead() then
        local combat = attacker.components.combat
	    local mul = (combat.damagemultiplier or 0.9) * (combat.externaldamagemultipliers:Get())

        local damage = inst.opalpreciousgemcount or 0
        target.components.health:DoDelta( - damage * mul, nil, inst.prefab, false, attacker, true)
        if target.components.health:IsDead() then	--推送死亡事件。击杀者为装备者
            attacker:PushEvent("killed", { victim = target })
            if target.components.combat ~= nil and target.components.combat.onkilledbyother ~= nil then
                target.components.combat.onkilledbyother(target, attacker)
            end
        end

    end
end

--满级火牌
local function redattack(inst, attacker, target)

    attacker.SoundEmitter:PlaySound(inst.skin_sound or 'dontstarve/wilson/fireball_explo')

    if not target:IsValid() then
        return
    elseif target.components.burnable ~= nil and not target.components.burnable:IsBurning() then
        if target.components.freezable ~= nil and target.components.freezable:IsFrozen() then
            target.components.freezable:Unfreeze()
        elseif
            target.components.fueled == nil or
                (target.components.fueled.fueltype ~= FUELTYPE.BURNABLE and
                    target.components.fueled.secondaryfueltype ~= FUELTYPE.BURNABLE)
         then
            target.components.burnable:Ignite(true, attacker)
            if target.components.propagator ~= nil then --不会引燃其他东西，但也没燃烧伤害
                target.components.propagator:StopSpreading()
            end
            if target.ccs_burning then
                target.ccs_burning:Cancel()
            end
            target.ccs_burning =
                    target:DoPeriodicTask(
                    1,
                    function()
                        --自定义燃烧伤害
                        if
                            target.components.burnable ~= nil and target.components.burnable:IsBurning() and 
                                target.components.health ~= nil
                         then
                            if not target.components.health:IsDead() then
                                target.components.health:DoDelta( - 10, nil, inst.prefab, false, attacker, true)
                                if target.components.health:IsDead() then	--推送死亡事件。击杀者为装备者
                                    attacker:PushEvent("killed", { victim = target })
                                    if target.components.combat ~= nil and target.components.combat.onkilledbyother ~= nil then
                                        target.components.combat.onkilledbyother(target, attacker)
                                    end
                                end
                            end
                        else
                            if target.ccs_burning then
                                target.ccs_burning:Cancel()
                                target.ccs_burning = nil
                            end
                        end
                    end
                )

        end
    end

    if target.components.freezable ~= nil then
        target.components.freezable:AddColdness(-1)
        if target.components.freezable:IsFrozen() then
            target.components.freezable:Unfreeze()
        end
    end

    if target.components.sleeper ~= nil and target.components.sleeper:IsAsleep() then
        target.components.sleeper:WakeUp()
    end

    if target.components.combat ~= nil then
        target.components.combat:SuggestTarget(attacker)
    end

    DoRealDelta(inst, attacker, target)


end

--消牌
local function blueattack(inst, attacker, target)

    DoRealDelta(inst, attacker, target)

    if target.components.health:GetPercent() <= .05 then
        local x,y,z = target:GetPosition():Get() --获取目标位置
        SpawnPrefab("fx_boat_pop").Transform:SetPosition(x,y,z)   
        local a = target.components.health.maxhealth
        target.components.health:DoDelta(-a,nil,nil,true,nil,true)
        if target.components.health:IsDead() then	--推送死亡事件。击杀者为装备者
            attacker:PushEvent("killed", { victim = target })
            if target.components.combat ~= nil and target.components.combat.onkilledbyother ~= nil then
                target.components.combat.onkilledbyother(target, attacker)
            end		
        end	
    end
    
end

--满级矢牌
local function brillianceattack(inst, attacker, target)

    DoRealDelta(inst, attacker, target)

    if target.components.health and not target.components.health:IsDead() then
        local damage = target.components.health.maxhealth * 0.01
        target.components.health:DoDelta( - damage, nil, inst.prefab, false, attacker, true)
        if target.components.health:IsDead() then	--推送死亡事件。击杀者为装备者
            attacker:PushEvent("killed", { victim = target })
            if target.components.combat ~= nil and target.components.combat.onkilledbyother ~= nil then
                target.components.combat.onkilledbyother(target, attacker)
            end
        end

    end
end

--满级剑牌
local function swordattack(inst, attacker, target)

    DoRealDelta(inst, attacker, target)

    if target.components.health and not target.components.health:IsDead() then
        local damage = target.components.health.maxhealth * 0.015
        target.components.health:DoDelta( - damage, nil, inst.prefab, false, attacker, true)
        if target.components.health:IsDead() then	--推送死亡事件。击杀者为装备者
            attacker:PushEvent("killed", { victim = target })
            if target.components.combat ~= nil and target.components.combat.onkilledbyother ~= nil then
                target.components.combat.onkilledbyother(target, attacker)
            end
        end

    end
end

local function AcceptTest(inst, item)
    return item.prefab == "opalpreciousgem" or item.prefab == "yellowgem"
end

local function OnGetItemFromPlayer(inst, giver, item)

    if item.prefab == "opalpreciousgem" then
        local num = 1
		if item.components.stackable then
		    num = item.components.stackable.stacksize
		end
        inst.opalpreciousgemcount = inst.opalpreciousgemcount + num

    end

    if item.prefab == "yellowgem" then
        local num = 1
		if item.components.stackable then
		    num = item.components.stackable.stacksize
		end
        inst.yellowgemcount = inst.yellowgemcount + num
        inst.components.planardamage:SetBaseDamage(50 + inst.yellowgemcount)

    end


end

local function OnRefuseItem(inst, giver, item)
    if item.prefab ~= "opalpreciousgem" and item.prefab ~= "yellowgem" then
        giver.components.talker:Say("需要彩虹宝石和黄宝石")
    else
        inst.components.planardamage:SetBaseDamage(50 + inst.yellowgemcount)
    end
end

local skinfx = {
	ccs_starstaff_skin1 = "ccs_star_fx_pink",

}

local TRAIL_FLAGS = { "ccs_star_fx" }  
local function SpawnFx(inst)
    local owner = inst.components.inventoryitem:GetGrandOwner() or inst
    if not owner.entity:IsVisible() then
        return
    end

    local x, y, z = owner.Transform:GetWorldPosition()
    if owner.sg ~= nil and owner.sg:HasStateTag("moving") then
        local theta = -owner.Transform:GetRotation() * DEGREES
        local speed = owner.components.locomotor:GetRunSpeed() * .1
        x = x + speed * math.cos(theta)
        z = z + speed * math.sin(theta)
    end
    local mounted = owner.components.rider ~= nil and owner.components.rider:IsRiding()
    local map = TheWorld.Map
    local offset = FindValidPositionByFan(
        math.random() * 2 * PI,
        (mounted and 1 or .5) + math.random() * .5,
        4,
        function(offset)
            local pt = Vector3(x + offset.x, 0, z + offset.z)
            return map:IsPassableAtPoint(pt:Get())
                and not map:IsPointNearHole(pt)
                and #TheSim:FindEntities(pt.x, 0, pt.z, .7, TRAIL_FLAGS) <= 0
        end
    )

    if offset ~= nil then
        local fx_prefab = skinfx[inst.skinname]
        if fx_prefab then
            SpawnPrefab(fx_prefab).Transform:SetPosition(x + offset.x, 1.7, z + offset.z)
        end
    end
end

local function onequip(inst, owner) --装备

    if owner == nil or not owner:HasTag("ccs") then 
        owner:DoTaskInTime(
            0,
            function()
                local inventory = owner.components.inventory
                if inventory then
                    inventory:DropItem(inst)
                end
            end
        )
    else
        if inst.components.container ~= nil then
            inst.components.container:Open(owner)
        end
        if inst:HasTag("is_sword") then
            local skin_build2 
            for k,v in pairs(inst.components.container.slots) do
                if v and v.prefab == "ccs_cards_12" then
                    skin_build2 = v:GetSkinBuild()
                    break
                end
            end
            if skin_build2 then
                owner.AnimState:OverrideSymbol("swap_object", skin_build2, "swap_weapon")
            else
                owner.AnimState:OverrideSymbol("swap_object", "ccs_sword", "swap_weapon")	
            end
            if dynamicweapon_skin_data[skin_build2] then
                SetFxOwner(inst, owner, skin_build2 .. "_fx")
            end
        -- elseif inst:HasTag("ccs_bow") then
        --     local skin_build3 
        --     for k,v in pairs(inst.components.container.slots) do
        --         if v and v.prefab == "ccs_cards_15" then
        --             skin_build3 = v:GetSkinBuild()
        --             break
        --         end
        --     end
        --     if skin_build3 then
        --         owner.AnimState:OverrideSymbol("swap_object", skin_build3, "swap_weapon")
        --     else
        --         owner.AnimState:OverrideSymbol("swap_object", "ccs_bow", "swap_weapon")	
        --     end
        else
            local skin_build = inst:GetSkinBuild()
            if skin_build ~= nil then
                owner:PushEvent("equipskinneditem", inst:GetSkinName())
                owner.AnimState:OverrideItemSkinSymbol("swap_object", skin_build, "swap_weapon", inst.GUID, "swap_weapon")
            else
                owner.AnimState:OverrideSymbol("swap_object", "ccs_starstaff", "swap_weapon")
            end

            
        end
        owner.AnimState:Show("ARM_carry")
        owner.AnimState:Hide("ARM_normal")

        if inst.skinname ~= nil and skinfx[inst.skinname] ~= nil then
            if inst.ccs_magic_wand_fx_task == nil then
                inst.ccs_magic_wand_fx_task = inst:DoPeriodicTask(6 * FRAMES, SpawnFx, 2 * FRAMES)
            end
        end

        if inst:HasTag("snowlizifx") then
			if inst._vfx_fx_inst == nil then
				inst._vfx_fx_inst = SpawnPrefab('cane_candy_fx')
				inst._vfx_fx_inst.entity:AddFollower()
			end
			inst._vfx_fx_inst.entity:SetParent(owner.entity)
			inst._vfx_fx_inst.Follower:FollowSymbol(owner.GUID, 'swap_object', 0, -220, 0)
        elseif inst:HasTag("harlequinlizifx") then
            if inst._vfx_fx_inst == nil then
				inst._vfx_fx_inst = SpawnPrefab('cane_harlequin_fx')
				inst._vfx_fx_inst.entity:AddFollower()
			end
			inst._vfx_fx_inst.entity:SetParent(owner.entity)
			inst._vfx_fx_inst.Follower:FollowSymbol(owner.GUID, 'swap_object', 0, -220, 0)
		end
    end

end


local function onunequip(inst, owner) --解除装备
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
    local skin_build = inst:GetSkinBuild()
    if skin_build ~= nil then
        owner:PushEvent("unequipskinneditem", inst:GetSkinName())
    end	

    if inst.components.container ~= nil then
        inst.components.container:Close(owner)
    end
    if inst.ccs_magic_wand_fx_task ~= nil then
        inst.ccs_magic_wand_fx_task:Cancel()
        inst.ccs_magic_wand_fx_task = nil
    end
    if inst._vfx_fx_inst ~= nil then
        inst._vfx_fx_inst:Remove()
        inst._vfx_fx_inst = nil
    end
    SetFxOwner(inst, nil)

end

-- 物品放入强化武器
local function itemget(inst, data)


    inst:DoTaskInTime(0.1,function ()
        
        -- if data.item.prefab == 'ccs_cards_11' and data.item.components.ccs_card_level and data.item.components.ccs_card_level:GetLevel() > 3  then 
        --     inst.components.weapon:SetOnAttack(redattack)
    
        if data.item.prefab == 'ccs_cards_22' then
            inst.components.weapon:SetOnAttack(blueattack)
    
        elseif data.item.prefab == 'ccs_cards_28' and data.item.components.ccs_card_level and data.item.components.ccs_card_level:GetLevel() > 2  then 
            inst.bouncemore = true
    
        elseif data.item.prefab == 'ccs_cards_15' and data.item.components.ccs_card_level and data.item.components.ccs_card_level:GetLevel() > 3  then 
            inst.components.weapon:SetOnAttack(brillianceattack)
    
    
        elseif data.item.prefab == 'ccs_cards_12' and data.item.components.ccs_card_level and data.item.components.ccs_card_level:GetLevel() > 3  then 
            
            inst.components.weapon:SetDamage(40)
            inst.components.weapon:SetRange(1.7)
            inst.components.weapon:SetProjectile(nil)
            inst.components.weapon:SetOnProjectileLaunched(nil)
            inst.components.weapon:SetOnAttack(swordattack)
    
    
            local owner = inst.components.inventoryitem.owner
            if  not owner  then
                return
            end
            inst:AddTag("is_sword")
            local skin_build = data.item:GetSkinBuild()
            if inst.components.equippable and inst.components.equippable:IsEquipped() then
                if skin_build then
                    owner.AnimState:OverrideSymbol("swap_object", skin_build, "swap_weapon")
                    inst.replica.inventoryitem:SetAtlas("images/inventoryimages/"..skin_build..".xml")	--更新物品栏贴图
                    inst.replica.inventoryitem:SetImage(skin_build)
                    inst:PushEvent("imagechange")
                    inst.AnimState:SetBank(skin_build) 		--更新地面动画
                    inst.AnimState:SetBuild(skin_build)
                    inst.AnimState:PlayAnimation("ccs_cards_12")
                    if dynamicweapon_skin_data[skin_build] then
                        SetFxOwner(inst, owner, skin_build .. "_fx")
                    end
                else
                    owner.AnimState:OverrideSymbol("swap_object", "ccs_sword", "swap_weapon")	--手持切换为剑形态
                    inst.replica.inventoryitem:SetAtlas("images/inventoryimages/ccs_sword.xml")	--更新物品栏贴图
                    inst.replica.inventoryitem:SetImage("ccs_sword")
                    inst:PushEvent("imagechange")
                    inst.AnimState:SetBank("ccs_sword") 		--更新地面动画
                    inst.AnimState:SetBuild("ccs_sword")
                    inst.AnimState:PlayAnimation("idle")
                end
            end
            
        end
    end)
    
end

--物品移出
local function itemlose(inst, data)

    inst.components.weapon:SetDamage(0)
    inst.components.weapon:SetRange(12)
    inst.components.weapon:SetProjectile("ccs_star_bounce")
    inst.components.weapon:SetOnAttack(DoRealDelta)
    inst.components.weapon:SetOnProjectileLaunched(Sideeffect)
    inst.bouncemore = false
    local owner = inst.components.inventoryitem.owner
    if  not owner  then
        return
    end
    if inst:HasTag("is_sword") then
        inst:RemoveTag("is_sword")
    end

    local skin_build = inst:GetSkinBuild()
	if skin_build ~= nil then
		owner:PushEvent("equipskinneditem", inst:GetSkinName())
		owner.AnimState:OverrideItemSkinSymbol("swap_object", skin_build, "swap_weapon", inst.GUID, "swap_weapon")
		inst.replica.inventoryitem:SetAtlas("images/inventoryimages/"..skin_build..".xml")	--更新物品栏贴图
		inst.replica.inventoryitem:SetImage(skin_build)
		inst.AnimState:SetBank(skin_build) 	
		inst.AnimState:SetBuild(skin_build)	
	else
		owner.AnimState:OverrideSymbol("swap_object", "ccs_starstaff", "swap_weapon")
		inst.replica.inventoryitem:SetAtlas("images/inventoryimages/ccs_starstaff.xml")	--更新物品栏贴图
		inst.replica.inventoryitem:SetImage("ccs_starstaff")
		inst.AnimState:SetBank("ccs_starstaff") 		--更新地面动画
		inst.AnimState:SetBuild("ccs_starstaff")	
	end	
	inst:PushEvent("imagechange")
	inst.AnimState:PlayAnimation("idle")
    SetFxOwner(inst, nil)
    

end

--保存数据
local function OnSave(inst, data)
    data.opalpreciousgemcount = inst.opalpreciousgemcount or 0
    data.yellowgemcount = inst.yellowgemcount or 0
    data.bouncemore = inst.bouncemore 
end

--加载数据
local function OnLoad(inst, data)

    inst.opalpreciousgemcount = data and data.opalpreciousgemcount or 0
    inst.yellowgemcount = data and data.yellowgemcount or 0
    inst.bouncemore = data.bouncemore 
    inst.components.planardamage:SetBaseDamage(50 + inst.yellowgemcount)

end

local function fn()

    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
    MakeInventoryFloatable(inst, "med", nil, 0.75) --漂浮

    inst.AnimState:SetBank("ccs_starstaff")  --地上动画
    inst.AnimState:SetBuild("ccs_starstaff")
    inst.AnimState:PlayAnimation("idle")


    inst.entity:SetPristine()

    inst.bouncemore = false
    inst.opalpreciousgemcount  = 0  -- 初始化彩虹宝石数量
    inst.yellowgemcount = 0  -- 初始化黄宝石数量

    inst.net_opalpreciousgemcount= net_ushortint(inst.GUID, "opalpreciousgemcount")
    inst.net_yellowgemcount = net_ushortint(inst.GUID, "yellowgemcount")

    inst.entity:SetPristine()
    inst.displaynamefn = get_name

    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst)
            if inst.replica.container then
                inst.replica.container:WidgetSetup('ccs_starstaff')
            end
        end
        return inst
    end

    inst:AddTag("meteor_protection") --防止被流星破坏
    inst:AddTag("nosteal") --防止被火药猴偷走
    inst:AddTag("NORATCHECK") --mod兼容：永不妥协。该道具不算鼠潮分
    inst:AddTag("ccs_starstaff")
    inst:AddTag("ccstrader")

    inst:ListenForEvent('itemget', itemget)
    inst:ListenForEvent('itemlose', itemlose)

    inst:AddComponent("weapon") --增加武器组件 有了这个才可以打人
    inst.components.weapon:SetDamage(0) --设置伤害
    inst.components.weapon:SetRange(12)
    inst.components.weapon:SetProjectile("ccs_star_bounce")
    inst.components.weapon:SetOnAttack(DoRealDelta)
    inst.components.weapon:SetOnProjectileLaunched(Sideeffect)

    inst:AddComponent("planardamage") --位面伤害
    inst.components.planardamage:SetBaseDamage(50)

    inst:AddComponent("trader") --交易组件，给东西
    inst.components.trader:SetAcceptTest(AcceptTest)
    inst.components.trader.onaccept = OnGetItemFromPlayer
    inst.components.trader.onrefuse = OnRefuseItem
    -- inst.cantrader = TraderCount

    inst:AddComponent("inspectable") --可检查组件

    inst:AddComponent("inventoryitem") --物品组件
	inst.components.inventoryitem.atlasname = "images/inventoryimages/ccs_starstaff.xml"--加载物品栏贴图 mod物品必须有
    inst.components.inventoryitem.imagename = "ccs_starstaff" --物品贴图

    inst:AddComponent("equippable") --可装备组件
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)
    -- inst.components.equippable.restrictedtag = "ccs"
    inst.components.equippable.walkspeedmult = 1.25 --移速

    inst:AddComponent('container')
    inst.components.container:WidgetSetup('ccs_starstaff')

    MakeHauntableLaunch(inst)

    inst.OnSave = OnSave
    inst.OnLoad = OnLoad

    inst:DoPeriodicTask(
        1.5,
        function()
            inst.net_opalpreciousgemcount:set(inst.opalpreciousgemcount)
            inst.net_yellowgemcount:set(inst.yellowgemcount)

        end
    )

    return inst
end

return Prefab("ccs_starstaff", fn, assets)