----
---文件处理时间:2024-07-01 23:48:41
---
local HH_UTILS = require("utils/gentleness_utils")

local assert = {
    Asset("ANIM", "anim/gentleness_jasmine.zip"),
}

local function TriggerFlowerTag(inst, isadd)
    if isadd then
        inst:AddTag("flower")
    else
        inst:RemoveTag("flower")
    end
end
local function on_ignite(inst)
end

local function on_bush_burnt(inst)
    
    if inst["components"]["growable"].stage == 3 then
        inst["components"].lootdropper:SpawnLootPrefab("gentleness_jasmine_flower")
        inst["components"].lootdropper:SpawnLootPrefab("gentleness_jasmine_flower")
    end

    inst["components"]["growable"]:StopGrowing()
    TriggerFlowerTag(inst, false)
    DefaultBurntFn(inst)
end

local function on_dug_up(inst, digger)
    local withered = inst["components"]["witherable"] ~= nil and inst["components"]["witherable"]:IsWithered()
    
    if withered or inst["components"]["pickable"]:IsBarren() then
        inst["components"]["lootdropper"]:SpawnLootPrefab("twigs")
        inst["components"]["lootdropper"]:SpawnLootPrefab("twigs")
    else
        
        if inst["components"]["growable"]["stage"] == 3 then
            inst["components"]["lootdropper"]:SpawnLootPrefab("gentleness_jasmine_flower")
            inst["components"]["lootdropper"]:SpawnLootPrefab("gentleness_jasmine_flower")
            inst["components"]["lootdropper"]:SpawnLootPrefab("petals")
            inst["components"]["lootdropper"]:SpawnLootPrefab("petals")
        end
        inst["components"]["lootdropper"]:SpawnLootPrefab("gentleness_jasmine_withered")
    end
    inst:Remove()
end

local function set_stage1(inst)
    inst["components"]["pickable"]:ChangeProduct(nil)
    inst["components"]["pickable"]["canbepicked"] = false
    if not inst["components"]["pickable"]:IsBarren() then
        inst["AnimState"]:PlayAnimation("idle", true)
        TriggerFlowerTag(inst, true)
    else
        inst["AnimState"]:PlayAnimation("dead")
        TriggerFlowerTag(inst, false)
    end
end

local function grow_to_stage1(inst)
    inst["AnimState"]:PlayAnimation("dead_to_idle")
    inst["AnimState"]:PushAnimation("idle", true)
end

local function set_stage2(inst)
    inst["components"]["pickable"]:ChangeProduct(nil)
    inst["components"]["pickable"]["canbepicked"] = false
    TriggerFlowerTag(inst, true)
    inst["AnimState"]:PlayAnimation("grow")
end

local function grow_to_stage2(inst)
    
end

local function set_stage3(inst)
    inst["components"]["pickable"]:ChangeProduct(nil)
    inst["components"]["pickable"]["canbepicked"] = false
    TriggerFlowerTag(inst, true)
    inst["AnimState"]:PlayAnimation("idle_000", true)
end
local function grow_to_stage3(inst)
    inst["AnimState"]:PlayAnimation("grow_000")
    inst["AnimState"]:PushAnimation("idle_000", true)
end

local function set_stage4(inst)
    inst["components"]["pickable"]:ChangeProduct("gentleness_jasmine_flower")
    inst["components"]["pickable"]["canbepicked"] = true
    inst["components"]["pickable"]:Regen()
    TriggerFlowerTag(inst, true)
    inst["AnimState"]:PlayAnimation("idle_001", true)
end
local function grow_to_stage4(inst)
    inst["AnimState"]:PlayAnimation("grow_001")
    inst["AnimState"]:PushAnimation("idle_001", true)
end
local day_time = TUNING["TOTAL_DAY_TIME"]
local STAGE1 = "stage_1"
local STAGE2 = "stage_2"
local STAGE3 = "stage_3"
local STAGE4 = "stage_4"

local growth_stages = {
    {
        name = STAGE1,
        time = function(inst)
            return day_time
        end,
        fn = set_stage1,
        growfn = grow_to_stage1,
    },
    {
        name = STAGE2,
        time = function(inst)
            return day_time * 2
        end,
        fn = set_stage3,
        growfn = grow_to_stage3,
    },
    {
        name = STAGE3,
        time = function(inst)
            return day_time * 2
        end,
        fn = set_stage4,
        growfn = grow_to_stage4,
    },
    
    
    
    
    
    
    
    
}

local function onPickedFn(inst, picker)
    
    if inst["components"]["growable"] and
            inst["components"]["growable"]["stage"] == 3 and HH_UTILS:NotIsDead(picker)
            and HH_UTILS:HasComponents(picker, "inventory")
    then
        local spawn_1 = SpawnPrefab("petals")
        if spawn_1 and HH_UTILS:HasComponents(spawn_1, "stackable") then
            spawn_1["components"]["stackable"]:SetStackSize(2)
            picker["components"]["inventory"]:GiveItem(spawn_1)
        end
        local random_num = math.random()
        if random_num <= 0.05 then
            local spawn_flower = SpawnPrefab("gentleness_jasmine_seed")
            if spawn_flower then
                picker["components"]["inventory"]:GiveItem(spawn_flower)
            end
        end
    end
    
    
    local picked_anim = "picked"
    if inst["components"]["growable"]["stage"] == 3 then
        picked_anim = "picked_001"
    elseif inst["components"]["growable"]["stage"] == 2 then
        picked_anim = "picked_000"
    end
    inst["components"]["growable"]:SetStage(1)
    inst["AnimState"]:PlayAnimation(picked_anim)
    
    if inst["components"]["pickable"]:IsBarren() then
        inst["AnimState"]:PushAnimation("dead", false)
        inst["components"]["growable"]:StopGrowing()
        inst["components"]["growable"]["magicgrowable"] = false

        TriggerFlowerTag(inst, false)
    else
        inst["components"]["growable"]:StartGrowing()
        inst["AnimState"]:PushAnimation("idle", true)
    end
end

local function makeEmptyFn(inst)
    if not POPULATING then
        local emptying_dead = inst["AnimState"]:IsCurrentAnimation("dead1")
        inst["components"]["growable"]:SetStage(1)
        inst["components"]["growable"]:StartGrowing()
        inst["components"]["growable"]["magicgrowable"] = true
        if not (inst:HasTag("withered") or emptying_dead) then
            inst["AnimState"]:PlayAnimation("idle", false)
        else
            inst["AnimState"]:PlayAnimation("dead_to_idle")
            inst["AnimState"]:PushAnimation("idle", false)
        end
    end

    TriggerFlowerTag(inst, true)
end

local function makeBarrenFn(inst, wasempty)
    inst["components"]["growable"]:SetStage(1)
    inst["components"]["growable"]:StopGrowing()
    inst["components"]["growable"]["magicgrowable"] = false
    inst["AnimState"]:PlayAnimation("dead")
    TriggerFlowerTag(inst, false)
end

local function onTransplantFn(inst)
    inst["components"]["pickable"]:MakeBarren()
    
    TriggerFlowerTag(inst, false)
end

local function onRegenFn(inst)
    if inst["components"]["growable"].stage < 3 then
        inst["components"]["growable"]:SetStage(3)
    end
end

local function on_save(inst, data)
    if inst["components"].burnable ~= nil and inst["components"].burnable:IsBurning() then
        data.burning = true
    end
end

local function on_load(inst, data)
    if data == nil then
        return
    end

    if data.burning then
        on_bush_burnt(inst)
    elseif inst["components"].witherable:IsWithered() then
        inst["components"].witherable:ForceWither()
    elseif not inst["components"]["pickable"]:IsBarren() and data["growable"] ~= nil and data["growable"].stage == nil then
        inst["components"]["growable"]:SetStage(1)
    end
end

local function getJasmineDesc()
    local table_length = #TUNING["GENTLENESS_JASMINE_DESC"]
    local random_index = math["random"](1, table_length)
    return TUNING["GENTLENESS_JASMINE_DESC"][random_index] or "再见，就是一定会再次相见"
end
local function prefab_fn()
    local inst = CreateEntity()
    inst["entity"]:AddTransform()
    inst["entity"]:AddAnimState()
    inst["entity"]:AddNetwork()

    inst["AnimState"]:SetBank("gentleness_jasmine")
    inst["AnimState"]:SetBuild("gentleness_jasmine")
    inst["AnimState"]:PlayAnimation("idle", true)
    MakeSmallObstaclePhysics(inst, 0.1)

    inst:AddTag("bush")
    inst:AddTag("plant")
    inst:AddTag("rotatableobject") 
    inst:AddTag("witherable") 
    
    inst["entity"]:SetPristine()
    if not TheWorld["ismastersim"] then
        return inst
    end
    inst:AddComponent("inspectable")
    inst["components"]["inspectable"]:SetDescription(getJasmineDesc())

    MakeMediumBurnable(inst)
    inst["components"]["burnable"]:SetOnBurntFn(on_bush_burnt)
    inst["components"]["burnable"]:SetOnIgniteFn(on_ignite)

    inst:AddComponent("lootdropper")

    inst:AddComponent("workable")
    inst["components"]["workable"]:SetWorkAction(ACTIONS["DIG"])
    inst["components"]["workable"]:SetWorkLeft(1)
    inst["components"]["workable"]:SetOnFinishCallback(on_dug_up)
    inst:AddComponent("pickable")
    inst["components"]["pickable"]["picksound"] = "dontstarve/wilson/harvest_berries"
    inst["components"]["pickable"]["numtoharvest"] = 2
    inst["components"]["pickable"]["onpickedfn"] = onPickedFn
    inst["components"]["pickable"]["makeemptyfn"] = makeEmptyFn
    inst["components"]["pickable"]["makebarrenfn"] = makeBarrenFn
    inst["components"]["pickable"]["ontransplantfn"] = onTransplantFn
    inst["components"]["pickable"]["onregenfn"] = onRegenFn
    
    inst["components"]["pickable"]["max_cycles"] = 20
    inst["components"]["pickable"]["cycles_left"] = inst["components"]["pickable"]["max_cycles"]
    inst:AddComponent("witherable")

    inst:AddComponent("growable")
    inst["components"]["growable"]["stages"] = growth_stages
    inst["components"]["growable"]["loopstages"] = false
    inst["components"]["growable"]["springgrowth"] = true
    inst["components"]["growable"]["magicgrowable"] = true
    
    inst["components"]["growable"]:SetStage(1)
    inst["components"]["growable"]:StartGrowing()

    
    
    
    TriggerFlowerTag(inst, true)
    inst["OnSave"] = on_save
    inst["OnLoad"] = on_load

    return inst
end
return Prefab("gentleness_jasmine", prefab_fn, assert)
