require "prefabutil"
require("worldsettingsutil")

local assets =
{
    Asset("ANIM", "anim/ccs_bee_box.zip"),
	Asset("ATLAS", "images/inventoryimages/ccs_beebox.xml"),
	Asset("IMAGE", "images/inventoryimages/ccs_beebox.tex"),

}

local prefabs =
{
    "bee",
    "honey",
    "honeycomb",
    "collapse_small",
}

FLOWER_TEST_RADIUS = 30

local levels =
{
    { amount=6, idle="honey3", hit="hit_honey3" },
    { amount=3, idle="honey2", hit="hit_honey2" },
    { amount=1, idle="honey1", hit="hit_honey1" },
    { amount=0, idle="idle", hit="hit_idle" },
}

local FLOWER_MUST_TAG = {"flower"}
local function CanStartGrowing(inst)
    return not inst:HasTag("burnt") and
        inst.components.harvestable and
        --[[not TheWorld.state.iswinter and--]]
        (inst.components.childspawner and inst.components.childspawner:NumChildren() > 0) and
        FindEntity(inst, FLOWER_TEST_RADIUS, nil, FLOWER_MUST_TAG)
end

local function Stop(inst)
    if inst.components.harvestable ~= nil and inst.components.harvestable.growtime ~= nil then
        inst.components.harvestable:PauseGrowing()
    end
    if inst.components.childspawner ~= nil then
        inst.components.childspawner:StopSpawning()
    end
end

local function Start(inst)
    if CanStartGrowing(inst) and inst.components.harvestable.growtime then
        inst.components.harvestable:StartGrowing()
    end
    if inst.components.childspawner ~= nil then
        inst.components.childspawner:StartSpawning()
    end
end

local function OnIsCaveDay(inst, isday)
    if not isday then
        Stop(inst)
    elseif not (--[[TheWorld.state.iswinter or--]] inst:HasTag("burnt"))
        and inst:IsInLight() then
        Start(inst)
    end
end

local function OnEnterLight(inst)
    if not (--[[TheWorld.state.iswinter or--]] inst:HasTag("burnt"))
        and TheWorld.state.iscaveday then
        Start(inst)
    end
end

local function OnEnterDark(inst)
    Stop(inst)
end

local function onhammered(inst, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
    inst.SoundEmitter:KillSound("loop")
    if inst.components.harvestable ~= nil then
        inst.components.harvestable:Harvest()
    end
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    inst:Remove()
end

local function onhit(inst, worker)
    -- if not inst:HasTag("burnt") then
        -- inst.AnimState:PlayAnimation(inst.anims.hit)
        -- inst.AnimState:PushAnimation(inst.anims.idle, false)
    -- end
end

local function setlevel(inst, level)
    if not inst:HasTag("burnt") then
        if inst.anims == nil then
            inst.anims = { idle = level.idle, hit = "idle" }
        else
            inst.anims.idle = level.idle
            inst.anims.hit = level.hit
        end
        inst.AnimState:PlayAnimation(inst.anims.idle)
    end
end

local function updatelevel(inst)
    if not inst:HasTag("burnt") then
        for k, v in pairs(levels) do
            if inst.components.harvestable.produce >= v.amount then
                setlevel(inst, v)
                break
            end
        end
    end
end

local function onharvest(inst, picker, produce)
    --print(inst, "onharvest")
    if not inst:HasTag("burnt") then
        if inst.components.harvestable then
            inst.components.harvestable:SetGrowTime(nil)
            inst.components.harvestable.pausetime = nil
            inst.components.harvestable:StopGrowing()
        end
		if produce == levels[1].amount then
			AwardPlayerAchievement("honey_harvester", picker)
		end
        updatelevel(inst)
        if inst.components.childspawner ~= nil --[[and not TheWorld.state.iswinter--]] then
            --inst.components.childspawner:ReleaseAllChildren(picker)
        end
    end
end

local function onchildgoinghome(inst, data)
    if not inst:HasTag("burnt") and
        data.child ~= nil and
        data.child.components.pollinator ~= nil and
        data.child.components.pollinator:HasCollectedEnough() and
        inst.components.harvestable ~= nil then
        inst.components.harvestable:Grow()
    end
end

local function OnSave(inst, data)
    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
        data.burnt = true
    end
end

local function TryStartSleepGrowing(inst)
    if CanStartGrowing(inst) then
        inst.components.harvestable:SetGrowTime(TUNING.BEEBOX_HONEY_TIME)
        inst.components.harvestable:StartGrowing()
    elseif inst.components.harvestable then
        inst.components.harvestable:PauseGrowing()
    end
end

local function StopSleepGrowing(inst)
    if not inst:HasTag("burnt") and inst.components.harvestable ~= nil then
        inst.components.harvestable:SetGrowTime(nil)
        inst.components.harvestable:PauseGrowing()
    end
end

local function OnLoad(inst, data)
    --print(inst, "OnLoad")
    if data ~= nil and data.burnt then
        inst.components.burnable.onburnt(inst)
    else
        updatelevel(inst)
    end
end

local function onbuilt(inst)
    --inst.AnimState:PlayAnimation("place")
    inst.AnimState:PlayAnimation("idle")
    inst.SoundEmitter:PlaySound("dontstarve/common/bee_box_craft")
end

local function onignite(inst)
    if inst.components.childspawner ~= nil then
        inst.components.childspawner:ReleaseAllChildren()
        inst.components.childspawner:StopSpawning()
    end
end

local function OnEntityWake(inst)
    StopSleepGrowing(inst)
    inst.SoundEmitter:PlaySound("dontstarve/bee/bee_box_LP", "loop")
end

local function OnEntitySleep(inst)
    TryStartSleepGrowing(inst)
    inst.SoundEmitter:KillSound("loop")
end

local function GetStatus(inst)
    return inst.components.harvestable ~= nil
        and (   (inst.components.harvestable.produce >= inst.components.harvestable.maxproduce and "READY") or
                (inst.components.harvestable:CanBeHarvested() and "SOMEHONEY") or
                ((inst.components.childspawner == nil or inst.components.childspawner:NumChildren() <= 0) and "NOHONEY")
            )
        or nil
end

local function AsleepHoneyGrowth(inst)
    if inst:IsAsleep() then
        TryStartSleepGrowing(inst)
    end
end

local function SeasonalSpawnChanges(inst, season)
    if inst.components.childspawner then
        if season == SEASONS.SPRING then
            inst.components.childspawner:SetRegenPeriod(TUNING.BEEBOX_REGEN_TIME / TUNING.SPRING_COMBAT_MOD)
            inst.components.childspawner:SetSpawnPeriod(TUNING.BEEBOX_RELEASE_TIME / TUNING.SPRING_COMBAT_MOD)
            inst.components.childspawner:SetMaxChildren(TUNING.BEEBOX_BEES * TUNING.SPRING_COMBAT_MOD)
        else
            inst.components.childspawner:SetRegenPeriod(TUNING.BEEBOX_REGEN_TIME)
            inst.components.childspawner:SetSpawnPeriod(TUNING.BEEBOX_RELEASE_TIME)
            inst.components.childspawner:SetMaxChildren(TUNING.BEEBOX_BEES)
        end
    end
end

local function OnPreLoad(inst, data)
    WorldSettings_ChildSpawner_PreLoad(inst, data, TUNING.BEEBOX_RELEASE_TIME, TUNING.BEEBOX_REGEN_TIME)
end

local function MakeBeebox(name, common_postinit, master_postinit)

    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddMiniMapEntity()
        inst.entity:AddNetwork()
        inst.entity:AddLightWatcher()

        MakeObstaclePhysics(inst, .5)

        --inst.MiniMapEntity:SetIcon("beebox.png")

        inst.AnimState:SetBank("bee_box")
        inst.AnimState:SetBuild("bee_box")
        inst.AnimState:PlayAnimation("idle")

        inst:AddTag("structure")
        inst:AddTag("playerowned")
        inst:AddTag("beebox")

        MakeSnowCoveredPristine(inst)

        if common_postinit ~= nil then
            common_postinit(inst)
        end

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        ---------------------

        inst:AddComponent("harvestable")
        inst.components.harvestable:SetUp("honey", 8, nil, onharvest, updatelevel)
        inst:ListenForEvent("childgoinghome", onchildgoinghome)
        -------------------

        inst:AddComponent("childspawner")
        inst.components.childspawner.childname = "ccs_bee"
        inst.components.childspawner.allowwater = true
        SeasonalSpawnChanges(inst, TheWorld.state.season)
        inst:WatchWorldState("season", SeasonalSpawnChanges)
        WorldSettings_ChildSpawner_SpawnPeriod(inst, TUNING.BEEBOX_RELEASE_TIME, TUNING.BEEBOX_ENABLED)
        WorldSettings_ChildSpawner_RegenPeriod(inst, TUNING.BEEBOX_REGEN_TIME, TUNING.BEEBOX_ENABLED)
        if not TUNING.BEEBOX_ENABLED then
            inst.components.childspawner.childreninside = 0
        end

        if TheWorld.state.isday --[[and not TheWorld.state.iswinter--]] then
            inst.components.childspawner:StartSpawning()
        end

        --inst:WatchWorldState("iswinter", AsleepHoneyGrowth)
        inst:WatchWorldState("iscaveday", OnIsCaveDay)
        inst:ListenForEvent("enterlight", OnEnterLight)
        inst:ListenForEvent("enterdark", OnEnterDark)

        inst:AddComponent("inspectable")
        inst.components.inspectable.getstatus = GetStatus

        updatelevel(inst)

        MakeHauntableWork(inst)

        MakeSnowCovered(inst)
        inst:ListenForEvent("onbuilt", onbuilt)

        inst.OnSave = OnSave
        inst.OnLoad = OnLoad
        inst.OnEntitySleep = OnEntitySleep
        inst.OnEntityWake = OnEntityWake

        if master_postinit then
            master_postinit(inst)
        end

        inst.OnPreLoad = OnPreLoad

        return inst
    end

    return Prefab(name, fn, assets, prefabs)
end

local function ccs_beebox_common(inst)
    inst.AnimState:SetBank("ccs_bee_box")
    inst.AnimState:SetBuild("ccs_bee_box")
    inst.AnimState:PlayAnimation("idle")
	inst.Transform:SetScale(2, 2, 2)
end

local function ccs_beebox_master(inst)
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)

    MakeMediumBurnable(inst, nil, nil, true)
    MakeLargePropagator(inst)
    inst:ListenForEvent("onignite", onignite)
end

return MakeBeebox("ccs_beebox", ccs_beebox_common, ccs_beebox_master),
	MakePlacer("ccs_beebox_placer", "ccs_bee_box", "ccs_bee_box", "idle",false, nil, nil, 2)