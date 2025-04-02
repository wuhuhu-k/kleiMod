local assets_starhit = { --星星法球特效
    Asset("ANIM", "anim/ccs_star_projectile.zip"),

}

--投掷抛射物
local function OnThrown(inst, owner, target)
    if inst.mark == 'ccs_bow_prj' then
        inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
        inst.Physics:SetMotorVel(inst.components.projectile.speed, -0.4, 0)
        return
    end
end

--创建抛射物拖尾
local function CreateTail(bank, build, lightoverride, addcolour, multcolour)
    local inst = CreateEntity()

    inst:AddTag('FX')
    inst:AddTag('NOCLICK')
    --[[Non-networked entity]]
    inst.entity:SetCanSleep(false)
    inst.persists = false

    inst.entity:AddTransform()
    inst.entity:AddAnimState()

    MakeInventoryPhysics(inst)
    inst.Physics:ClearCollisionMask()

    inst.AnimState:SetBank(bank)
    inst.AnimState:SetBuild(build)
    inst.AnimState:PlayAnimation('disappear')
    if addcolour ~= nil then
        inst.AnimState:SetAddColour(unpack(addcolour))
    end
    if multcolour ~= nil then
        inst.AnimState:SetMultColour(unpack(multcolour))
    end
    if lightoverride > 0 then
        inst.AnimState:SetLightOverride(lightoverride)
    end
    inst.AnimState:SetFinalOffset(3)

    inst:ListenForEvent('animover', inst.Remove)

    return inst
end

--更新抛射物拖尾
local function OnUpdateProjectileTail(inst, bank, build, speed, lightoverride, addcolour, multcolour, hitfx, tails)
    local x, y, z = inst.Transform:GetWorldPosition()
    for tail, _ in pairs(tails) do
        tail:ForceFacePoint(x, y, z)
    end
    if inst.entity:IsVisible() then
        local tail = CreateTail(bank, build, lightoverride, addcolour, multcolour)
        local rot = inst.Transform:GetRotation()
        tail.Transform:SetRotation(rot)
        rot = rot * DEGREES
        local offsangle = math.random() * 2 * PI
        local offsradius = math.random() * .2 + .2
        local hoffset = math.cos(offsangle) * offsradius
        local voffset = math.sin(offsangle) * offsradius
        tail.Transform:SetPosition(x + math.sin(rot) * hoffset, y + voffset, z + math.cos(rot) * hoffset)
        tail.Physics:SetMotorVel(speed * (.2 + math.random() * .3), 0, 0)
        tails[tail] = true
        inst:ListenForEvent(
            'onremove',
            function(tail)
                tails[tail] = nil
            end,
            tail
        )
        tail:ListenForEvent(
            'onremove',
            function(inst)
                tail.Transform:SetRotation(tail.Transform:GetRotation() + math.random() * 30 - 15)
            end,
            inst
        )
    end
end

--制造抛射物
local function MakeProjectile(name, bank, build, speed, lightoverride, addcolour, multcolour, hitfx, hitdist, tail, heal, arrow)
    local assets = {
        Asset('ANIM', 'anim/' .. build .. '.zip')
    }

    local prefabs = hitfx ~= nil and { hitfx } or nil

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)
        RemovePhysicsColliders(inst)

        inst.AnimState:SetBank(bank)
        inst.AnimState:SetBuild(build)
        inst.AnimState:PlayAnimation('idle_loop', true)
        if arrow then
            inst.AnimState:SetScale(2.3,2.3,2.3)
        end
        if addcolour ~= nil then
            inst.AnimState:SetAddColour(unpack(addcolour))
        end
        if multcolour ~= nil then
            inst.AnimState:SetMultColour(unpack(multcolour))
        end
        if lightoverride and lightoverride > 0 then
            inst.AnimState:SetLightOverride(lightoverride)
        end
        inst.AnimState:SetFinalOffset(-1)
        inst.AnimState:SetBloomEffectHandle('shaders/anim.ksh')

        

        --抛射物(从抛射物组件)添加到原始状态进行优化
        inst:AddTag('projectile')

        if not TheNet:IsDedicated() and tail == true then
            inst:DoPeriodicTask(
                0,
                OnUpdateProjectileTail,
                nil,
                bank,
                build,
                speed,
                lightoverride,
                addcolour,
                multcolour,
                hitfx,
                {}
            )
        end

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst.level = 0
        inst.mark = name

        inst.persists = false

        inst:AddComponent('projectile')

        if arrow then
            inst.components.projectile:SetLaunchOffset(Vector3(1, 0.9, 0))
            inst.components.projectile:SetOnThrownFn(OnThrown)
        end

        inst.components.projectile:SetSpeed(speed)
        inst.components.projectile:SetHoming(true)
        inst.components.projectile:SetHitDist(hitdist or 0.5)
        inst.components.projectile.onhit = function(inst, owner, target)
            if hitfx then
                local fx = SpawnPrefab(hitfx)
                fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
                fx:DoTaskInTime(
                    2,
                    function(fx)
                        if fx then
                            fx:Remove()
                        end
                    end
                )
            end
            if heal then
                target.components.health:DoDelta(2 + inst.level)
            end
            inst:Remove()
        end
        inst.components.projectile:SetOnMissFn(inst.Remove)

        inst:DoTaskInTime(10, inst.Remove)

        return inst
    end

    return Prefab(name, fn, assets, prefabs)
end


local function PlayAnimAndRemove(inst, anim)
    inst.AnimState:PlayAnimation(anim)
    if not inst.removing then
        inst.removing = true
        inst:ListenForEvent("animover", inst.Remove)
    end
end

local function OnThrown_Star(inst, owner, target, attacker)
    inst.owner = owner
    if inst.bounces == nil then
        local weapon = attacker ~= nil and attacker.components.inventory ~= nil and
            attacker.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) or nil
        inst.bounces = weapon ~= nil and weapon.bouncemore == true and 9 or 5
        inst.initial_hostile = target ~= nil and target:IsValid() and target:HasTag("hostile")
    end
end

local BOUNCE_MUST_TAGS = { "_combat", "_health" }
local BOUNCE_NO_TAGS = { "INLIMBO", "wall", "notarget", "player", "companion", "flight", "invisible", "noattack",
    "hiding", "hive" }

local function TryBounce_Star(inst, x, z, attacker, target)
    -- 如果没有记录，则初始化为0
    if inst.bounced_targets[target] == nil then
        inst.bounced_targets[target] = 0
    end

    -- 增加当前目标的弹射次数
    inst.bounced_targets[target] = inst.bounced_targets[target] + 1

    -- 如果弹射次数已经达到2次，则返回
    if inst.bounced_targets[target] > 2 then
        inst:Remove()
        return
    end

    if attacker.components.combat == nil or not attacker:IsValid() then
        inst:Remove()
        return
    end

    local newtarget, newrecentindex, newhostile
    for i, v in ipairs(TheSim:FindEntities(x, 0, z, 15, BOUNCE_MUST_TAGS, BOUNCE_NO_TAGS)) do
        if v ~= target and v.entity:IsVisible() and
            not (v.components.health ~= nil and v.components.health:IsDead()) and
            attacker.components.combat:CanTarget(v) and not attacker.components.combat:IsAlly(v) and (inst.bounced_targets[v] == nil or inst.bounced_targets[v] < 2)
        then
            local vhostile = v:HasTag("hostile")
            local vrecentindex
            if inst.recenttargets ~= nil then
                for i1, v1 in ipairs(inst.recenttargets) do
                    if v == v1 then
                        vrecentindex = i1
                        break
                    end
                end
            end
            if inst.initial_hostile and not vhostile and vrecentindex == nil and v.components.locomotor == nil then
                --attack was initiated against a hostile target
                --skip if non-hostile, can't move, and has never been targeted
            elseif newtarget == nil then
                newtarget = v
                newrecentindex = vrecentindex
                newhostile = vhostile
            elseif vhostile and not newhostile then
                newtarget = v
                newrecentindex = vrecentindex
                newhostile = vhostile
            elseif vhostile or not newhostile then
                if vrecentindex == nil then
                    if newrecentindex ~= nil or (newtarget.prefab ~= target.prefab and v.prefab == target.prefab) then
                        newtarget = v
                        newrecentindex = vrecentindex
                        newhostile = vhostile
                    end
                elseif newrecentindex ~= nil and vrecentindex < newrecentindex then
                    newtarget = v
                    newrecentindex = vrecentindex
                    newhostile = vhostile
                end
            end
        end
    end

    if newtarget ~= nil then
        inst.Physics:Teleport(x, 0, z)
        inst:Show()
        inst.components.projectile:SetSpeed(20)
        if inst.recenttargets ~= nil then
            if newrecentindex ~= nil then
                table.remove(inst.recenttargets, newrecentindex)
            end
            table.insert(inst.recenttargets, target)
        else
            inst.recenttargets = { target }
        end
        inst.components.projectile:SetBounced(true)
        inst.components.projectile.overridestartpos = Vector3(x, 0, z)
        inst.components.projectile:Throw(inst.owner, newtarget, attacker)
    else
        inst:Remove()
    end
end


local function OnHit_Star(inst, attacker, target)
    local blast = SpawnPrefab("ccs_star_hit_fx")
    local x, y, z
    if target:IsValid() then
        local radius = target:GetPhysicsRadius(0) + .2
        local angle = (inst.Transform:GetRotation() + 180) * DEGREES
        x, y, z = target.Transform:GetWorldPosition()
        x = x + math.cos(angle) * radius + GetRandomMinMax(-.2, .2)
        y = GetRandomMinMax(.1, .3)
        z = z - math.sin(angle) * radius + GetRandomMinMax(-.2, .2)
        --blast:PushFlash(target)
    else
        x, y, z = inst.Transform:GetWorldPosition()
    end
    blast.Transform:SetPosition(x, y, z)

    if inst.bounces ~= nil and inst.bounces > 1 and attacker ~= nil and attacker.components.combat ~= nil and attacker:IsValid() then
        inst.bounces = inst.bounces - 1
        inst.Physics:Stop()
        inst:Hide()
        inst:DoTaskInTime(.1, TryBounce_Star, x, z, attacker, target)
    else
        inst:Remove()
    end
end

local function OnMiss(inst, attacker, target)
    if not inst.AnimState:IsCurrentAnimation("disappear") then
        PlayAnimAndRemove(inst, "disappear")
    end
end

local function fn_bounce_star()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddPhysics()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
    RemovePhysicsColliders(inst)

    inst:AddTag("FX")
    inst:AddTag("NOCLICK")

    inst.bounced_targets = {}

    inst.AnimState:SetBank("ccs_star_projectile")
    inst.AnimState:SetBuild("ccs_star_projectile")
    inst.AnimState:PlayAnimation("idle_loop", true)
    -- inst.AnimState:SetAddColour(unpack({0, 255, 0, 0}))
    inst.AnimState:SetLightOverride(1)
    -- inst.AnimState:SetSymbolMultColour("light_bar", 1, 1, 1, .5)
    -- inst.AnimState:SetSymbolBloom("light_bar")
    -- --inst.AnimState:SetSymbolBloom("pb_energy_loop")
    -- inst.AnimState:SetSymbolBloom("glow")

    inst.AnimState:SetFinalOffset(-1)
    inst.AnimState:SetBloomEffectHandle('shaders/anim.ksh')

    --projectile (from projectile component) added to pristine state for optimization
    inst:AddTag("projectile")

    if not TheNet:IsDedicated() then
        inst:DoPeriodicTask(
            0,
            OnUpdateProjectileTail,
            nil,
            "ccs_star_projectile",
            "ccs_star_projectile",
            20,
            1,
            nil,
            nil,
            'ccs_star_hit_fx',
            {}
        )
    end

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("projectile")
    inst.components.projectile:SetSpeed(20)
    inst.components.projectile:SetRange(20)
    inst.components.projectile:SetOnThrownFn(OnThrown_Star)
    inst.components.projectile:SetOnHitFn(OnHit_Star)
    inst.components.projectile:SetOnMissFn(OnMiss)

    inst.persists = false

    inst:DoTaskInTime(15, inst.Remove)

    return inst
end

local function starhit_fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank('ccs_star_projectile')
    inst.AnimState:SetBuild('ccs_star_projectile')
    inst.AnimState:PlayAnimation('blast' .. math.random(1, 2))
    inst.AnimState:SetBloomEffectHandle('shaders/anim.ksh')
    inst.AnimState:SetLightOverride(1)
    inst.AnimState:SetFinalOffset(3)

    inst:AddTag('FX')
    inst:AddTag('NOCLICK')

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.persists = false

    inst:ListenForEvent('animover', inst.Remove)

    return inst
end

return MakeProjectile(
    'ccs_bow_prj',
    'ccs_bow_prj',
    'ccs_bow_prj',
    30,
    1,
    nil,
    nil,
    nil,
    1,
    false,
    false,
    true
),

Prefab("ccs_star_hit_fx", starhit_fn, assets_starhit),
Prefab("ccs_star_bounce", fn_bounce_star, assets_starhit)


