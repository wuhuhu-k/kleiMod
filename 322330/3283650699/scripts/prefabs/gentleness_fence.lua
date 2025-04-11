local HH_UTILS = require("utils/gentleness_utils")
local SKIN_CONFIG = require("enums/gentleness_skin")
local assets = {
    Asset("ANIM", "anim/gentleness_fence.zip"),
    Asset("ANIM", "anim/fence.zip"),
}
local wall_prefabs = {
    "collapse_small",
}
local function GetItemSkinName(inst)
    local base = inst["prefab"]
    if type(inst["g_item_skin"]) == "string" then
        base = inst["g_item_skin"]
    end
    return tostring(base)
end
local DOOR_LOOT = { "boards", "boards", "rope" }
local FENCE_LOOT = { "twigs" }

local FINDDOOR_MUST_TAGS = { "door" }
local FINDWALL_MUST_TAGS = { "wall" }
local FINDWALL_CANT_TAGS = { "alignwall" }

local ROT_SIDES = 8
local function CalcRotationEnum(rot)
    return math.floor((math.floor(rot + 0.5) / 45) % ROT_SIDES)
end

local function CalcFacingAngle(rot)
    return CalcRotationEnum(rot) * 45
end

local function IsNarrow(inst)
    return CalcRotationEnum(inst.Transform:GetRotation()) % 2 == 0
end

local function IsEnumNarrow(enum)
    return enum % 2 == 0
end

local function IsSwingRight(inst)
    if inst._isswingright ~= nil then
        return inst._isswingright:value()
    end
    return inst.isswingright == true
end

local function IsOpen(inst)
    return inst._isopen ~= nil and inst._isopen:value()
end

local function GetAnimName(inst, basename)
    return basename
            .. (IsSwingRight(inst) and "right" or "")
            .. (IsOpen(inst) and "_open" or "")
end

local function GetAnimState(inst)
    return (inst.dooranim or inst).AnimState
end

-------------------------------------------------------------------------------
--Networked data
local function GetDoorRotationOffset(inst, rot)
    --angle1 to get back to hinge
    --angle2 to open door using hinge as pivot
    local sign = IsSwingRight(inst) and -1 or 1
    local angle1 = inst.Transform:GetRotation() * DEGREES
    local angle2 = angle1 + sign * rot * DEGREES
    local len = sign * (IsNarrow(inst) and .5 or .707)
    return
    len * (math.sin(angle2) - math.sin(angle1)),
    0,
    len * (math.cos(angle2) - math.cos(angle1))
end

local function OnDoorStateDirty(inst)
    --V2C: AnimState:SetSortWorldOffset is client side
    if inst.dooranim ~= nil and inst._isopen ~= nil then
        if inst._isopen:value() then
            inst.dooranim.AnimState:SetSortWorldOffset(GetDoorRotationOffset(inst, 100))
        else
            inst.dooranim.AnimState:SetSortWorldOffset(0, 0, 0)
        end
    end
end

local function OnInitDoorClient(inst)
    --V2C: No point doing it any earlier because we need to wait for rotation to set
    inst:ListenForEvent("doorstatedirty", OnDoorStateDirty)
    OnDoorStateDirty(inst)
end

local function OnWallAnimReplicated(inst)
    local parent = inst.entity:GetParent()
    if parent ~= nil then
        parent.highlightforward = inst
        parent.dooranim = inst
    end
end

-------------------------------------------------------------------------------
-- Fence/Gate Alignment

local function SetIsSwingRight(inst, is_swing_right)
    if inst._isswingright ~= nil then
        inst._isswingright:set(is_swing_right)
    else
        inst.isswingright = is_swing_right
    end
    OnDoorStateDirty(inst)
end

local function GetPairedDoor(inst, rot)
    local x, y, z = inst.Transform:GetWorldPosition()

    local swingright = IsSwingRight(inst)
    local search_dist = IsNarrow(inst) and 1.2 or 1.6

    local search_x = -math.sin(rot / RADIANS) * search_dist
    local search_y = math.cos(rot / RADIANS) * search_dist

    search_x = x + (swingright and search_x or -search_x)
    search_y = z + (swingright and -search_y or search_y)

    local paired_door = TheSim:FindEntities(search_x, 0, search_y, 0.75, FINDDOOR_MUST_TAGS)[1]
    return paired_door
end

local function FindPairedDoor(inst)

    local rot = inst.Transform:GetRotation()
    local other_door = GetPairedDoor(inst, rot)

    -- On a boat and didn't find anything? Try again, but taking boat rotation into account
    local boat = inst:GetCurrentPlatform()
    if other_door == nil and boat and boat:HasTag("boat") then
        local boat_rotation = boat.Transform:GetRotation()
        other_door = GetPairedDoor(inst, rot - boat_rotation)
    end

    if other_door then
        local swingright = IsSwingRight(inst)
        local opposite_swing = swingright ~= IsSwingRight(other_door)

        -- Round rotating angles to three decimal places to avoid imprecision when comparing the door rotations
        local door_rotation = math.floor(inst.Transform:GetRotation() * 1000) / 1000
        local other_rotation = math.floor(other_door.Transform:GetRotation() * 1000) / 1000
        local opposite_rotation = door_rotation ~= other_rotation
        return (opposite_swing ~= opposite_rotation) and other_door or nil
    end

    return nil
end

local function SetOffset(inst, offset)
    if inst.dooranim ~= nil then
        inst.dooranim.Transform:SetPosition(offset, 0, 0)
    end
end

local function ApplyDoorOffset(inst)
    SetOffset(inst, inst.offsetdoor and 0.45 or 0)
end

local function SetOrientation(inst, rotation, rotation_enum)
    --rotation = CalcFacingAngle(rotation)

    inst.Transform:SetRotation(rotation)

    if inst.anims.narrow then
        local is_narrow = false
        if rotation_enum ~= nil then
            is_narrow = IsEnumNarrow(rotation_enum)
        else
            is_narrow = IsNarrow(inst)
        end

        if is_narrow then
            if not inst.bank_narrow_set then
                inst.bank_narrow_set = true
                inst.bank_wide_set = nil
                GetAnimState(inst):SetBank(inst.anims.narrow)
            end
        else
            if not inst.bank_wide_set then
                inst.bank_wide_set = true
                inst.bank_narrow_set = nil
                GetAnimState(inst):SetBank(inst.anims.wide)
            end
        end

        if inst.isdoor then
            ApplyDoorOffset(inst)
        end
    end
end

local function _calcdooroffset(inst)
    if inst == nil or not inst.isdoor then
        return false
    end

    local x, y, z = inst.Transform:GetWorldPosition()
    local rot = inst.Transform:GetRotation()

    local search_x = -math.sin(rot / RADIANS) * 1.2
    local search_y = math.cos(rot / RADIANS) * 1.2

    local walls = TheSim:FindEntities(x + search_x, 0, z - search_y, 0.25, FINDWALL_MUST_TAGS, FINDWALL_CANT_TAGS)
    if #walls == 0 then
        walls = TheSim:FindEntities(x - search_x, 0, z + search_y, 0.25, FINDWALL_MUST_TAGS, FINDWALL_CANT_TAGS)
    end
    return #walls > 0
end

local function RefreshDoorOffset(inst)
    if inst == nil or (not inst.isdoor) then
        return
    end

    if not IsNarrow(inst) then
        inst.offsetdoor = false
        ApplyDoorOffset(inst)
        return
    end

    local do_offset = _calcdooroffset(inst)

    local otherdoor = FindPairedDoor(inst)
    if otherdoor and do_offset == false then
        do_offset = _calcdooroffset(otherdoor)
    end

    if inst.offsetdoor ~= do_offset then
        inst.offsetdoor = do_offset
        ApplyDoorOffset(inst)
    end
end

local function FixUpFenceOrientation(inst, deployedrotation)
    local x, y, z = inst.Transform:GetWorldPosition()
    local neighbors = TheSim:FindEntities(x, 0, z, 1.5, FINDWALL_MUST_TAGS)

    local rot = inst.Transform:GetRotation()
    local neighbor_index = 1
    local neighbor = neighbors[neighbor_index]
    if deployedrotation ~= nil then
        --has a value for spawned items
        neighbor_index = 2
        neighbor = neighbors[neighbor_index]
        rot = deployedrotation
    end

    if inst.isdoor then
        SetIsSwingRight(inst, false) --set it to false and assume we'll recalculate each frame
    end

    --Only look for parallel fence/gate neighbours when matching rotation and doing swing-side changes
    local this_e = CalcRotationEnum(rot)
    local neighbor_e = nil
    while neighbor ~= nil do
        neighbor_e = CalcRotationEnum(neighbor.Transform:GetRotation())

        if (neighbor.isdoor or neighbor.prefab == "gentleness_fence") and (this_e % (ROT_SIDES / 2) == neighbor_e % (ROT_SIDES / 2)) then
            --found a parallel fence/gate neighbour!
            break
        end
        neighbor_index = neighbor_index + 1
        neighbor = neighbors[neighbor_index]
    end

    if neighbor == nil then
        --no fence/gates, try the first item again it should be a wall
        rot = inst.Transform:GetRotation()
        neighbor = neighbors[1]
        if deployedrotation ~= nil then
            --has a value for spawned items
            neighbor = neighbors[2]
            rot = deployedrotation
        end
    end

    if neighbor ~= nil then
        --align with fence/gate neighbor if we're placing from behind. This exists so that you can fix a hole in a wall from the back of wall. Needed for the case where the camera is obstructed from placing from the front of the wall
        if (neighbor.isdoor or neighbor.prefab == "gentleness_fence") and (this_e + ROT_SIDES / 2) % ROT_SIDES == neighbor_e then
            rot = rot + 180
            this_e = CalcRotationEnum(rot)
        end

        if inst.isdoor then
            if neighbor.isdoor then
                if this_e == neighbor_e then
                    SetIsSwingRight(inst, not IsSwingRight(neighbor))
                end
            else
                local x, y, z = inst.Transform:GetWorldPosition()
                local x1, y1, z1 = neighbor.Transform:GetWorldPosition()
                local rot_to_neighbor = math.atan2(x - x1, z - z1) * RADIANS

                local swing_right = (CalcRotationEnum(rot_to_neighbor) + 4) % ROT_SIDES == CalcRotationEnum(rot)

                SetIsSwingRight(inst, swing_right)
            end
        end
    end

    SetOrientation(inst, rot)
    RefreshDoorOffset(inst)

    GetAnimState(inst):PlayAnimation(GetAnimName(inst, "idle"))
end

-------------------------------------------------------------------------------

local function OnIsPathFindingDirty(inst)
    if inst._ispathfinding:value() then
        if inst._pfpos == nil and inst:GetCurrentPlatform() == nil then
            inst._pfpos = inst:GetPosition()
            TheWorld.Pathfinder:AddWall(inst._pfpos:Get())
        end
    elseif inst._pfpos ~= nil then
        TheWorld.Pathfinder:RemoveWall(inst._pfpos:Get())
        inst._pfpos = nil
    end
end

local function InitializePathFinding(inst)
    inst:ListenForEvent("onispathfindingdirty", OnIsPathFindingDirty)
    OnIsPathFindingDirty(inst)
end

local function makeobstacle(inst)
    inst.Physics:SetActive(true)
    inst._ispathfinding:set(true)
end

local function clearobstacle(inst)
    inst.Physics:SetActive(false)
    inst._ispathfinding:set(false)
end

local function onremove(inst)
    inst._ispathfinding:set_local(false)
    OnIsPathFindingDirty(inst)
end

local function keeptargetfn()
    return false
end

local function onhammered(inst)
    inst.components.lootdropper:DropLoot()

    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")

    inst:Remove()
end

local function onworked(inst)
    GetAnimState(inst):PlayAnimation(GetAnimName(inst, "hit"))
    GetAnimState(inst):PushAnimation(GetAnimName(inst, "idle"), false)
end

local function onhit(inst, attacker, damage)
    inst.components.workable:WorkedBy(attacker)
end

local function junk_spawnhitfx(inst)
    local fx = SpawnPrefab("junk_break_fx")
    local x, y, z = inst.Transform:GetWorldPosition()
    local scale = 0.7 + math.random() * 0.2
    fx.Transform:SetPosition(x, y + math.random(), z)
    fx.Transform:SetScale(scale, scale, scale)
    return fx
end

local function junk_onworkfinishedfn(inst, worker)
    if not worker:HasTag("junkmob") then
        inst.components.lootdropper:DropLoot()
    end
    junk_spawnhitfx(inst)
    inst:Remove()
end

local function junk_onworkfn(inst, worker, workleft, numworks)
    if numworks == 0 then
        if worker:HasTag("junkmob") then
            junk_spawnhitfx(inst)
        elseif worker:HasTag("junk") then
            --junk repairs junk XD
            inst.components.workable:SetWorkLeft(3)
            inst.components.health:SetPercent(1)
        end
    end
    onworked(inst)
end

local function junk_workmultiplierfn(inst, worker, numworks)
    return worker:HasTag("junk") and 0 or nil
end

-------------------------------------------------------------------------------
local function SetIsOpen(inst, isopen)
    inst._isopen:set(isopen)
    OnDoorStateDirty(inst)
end

local function OpenDoor(inst, skiptransition)
    if inst == nil then
        return
    end

    SetIsOpen(inst, true)
    clearobstacle(inst)

    if not skiptransition then
        inst.SoundEmitter:PlaySound("dontstarve/common/together/gate/open")
    end

    GetAnimState(inst):PlayAnimation(GetAnimName(inst, "idle"))
end

local function CloseDoor(inst, skiptransition)
    if inst == nil then
        return
    end

    SetIsOpen(inst, false)
    makeobstacle(inst)

    if not skiptransition then
        inst.SoundEmitter:PlaySound("dontstarve/common/together/gate/close")
    end

    GetAnimState(inst):PlayAnimation(GetAnimName(inst, "idle"))
end

local function ToggleDoor(inst)
    inst.components.activatable.inactive = true

    if inst._isunlocked ~= nil and not inst._isunlocked:value() then
        return false, "LOCKED_GATE"
    end

    if IsOpen(inst) then
        CloseDoor(inst)
        CloseDoor(FindPairedDoor(inst))
    else
        OpenDoor(inst)
        OpenDoor(FindPairedDoor(inst))
    end
end

local function getdooractionstring(inst)
    return IsOpen(inst) and "CLOSE" or "OPEN"
end

local function lockabledoor_displaynamefn(inst)
    return not inst._isunlocked:value() and STRINGS.NAMES[string.upper(inst.prefab .. "_locked")] or nil
end

local function lockabledoor_getstatus(inst)
    return not inst._isunlocked:value() and "LOCKED" or nil
end

local function onusekey(inst, key, doer)
    if not key:IsValid() or key.components.klaussackkey == nil or inst._isunlocked:value() then
        return false, nil, false
    elseif key.components.klaussackkey.keytype ~= inst.klaussackkeyid then
        return false, "QUAGMIRE_WRONGKEY", false
    end

    inst._isunlocked:set(true)
    local otherdoor = FindPairedDoor(inst)
    if otherdoor ~= nil then
        otherdoor._isunlocked:set(true)
    end

    inst.SoundEmitter:PlaySound("dontstarve/quagmire/common/safe/key")

    ToggleDoor(inst)

    return true, nil, true
end

-------------------------------------------------------------------------------

local function onsave(inst, data)

    -- If we're on a boat, save boat rotation value in its own value separate from the standard rotation data
    local boat = inst:GetCurrentPlatform()
    if boat and boat:HasTag("boat") then
        data.boatrotation = inst.Transform:GetRotation()
    else
        local rot = CalcRotationEnum(inst.Transform:GetRotation())
        data.rot = rot > 0 and rot or nil
    end

    data.offsetdoor = inst.offsetdoor
    data.swingright = inst._isswingright ~= nil and inst._isswingright:value() or nil
    data.isopen = inst._isopen ~= nil and inst._isopen:value() or nil
    data.isunlocked = inst._isunlocked ~= nil and inst._isunlocked:value() or nil
    data.variant_num = inst.variant_num or nil
end

local function onload(inst, data)
    if data ~= nil then
        if inst._isunlocked ~= nil then
            inst._isunlocked:set(data.isunlocked == true)
        end

        inst.offsetdoor = data.offsetdoor

        if inst._isswingright ~= nil then
            SetIsSwingRight(inst, data.swingright or (data.doorpairside == 2)) -- data.doorpairside is deprecated v2, swingright is v3
        end

        local rotation = 0
        inst.loaded_rotation_enum = 0
        if data.rotation ~= nil then
            -- very old style of save data. updates save data to v2 format, safe to remove this when we go out of the beta branch
            rotation = data.rotation - 90
            inst.loaded_rotation_enum = CalcRotationEnum(rotation)
        elseif data.rot ~= nil then
            rotation = data.rot * 45
            inst.loaded_rotation_enum = data.rot
        end
        SetOrientation(inst, rotation)

        if data.isopen then
            OpenDoor(inst, true)
        elseif inst._isswingright ~= nil and inst._isswingright:value() then
            GetAnimState(inst):PlayAnimation(GetAnimName(inst, "idle"))
        end

        if data.variant_num then
            inst.variant_num = data.variant_num
            inst.AnimState:SetBuild(inst.basebuild .. inst.variant_num)
        end
    end
end

local function onloadpostpass(inst, newents, data)
    if data == nil then
        --Don't crash on mods placing fences in worldgen
        return
    end

    inst:DoTaskInTime(0, function(inst)
        -- If fences are placed on rotated boats, we need to account for the boat's rotation
        if data.boatrotation ~= nil then
            -- New method for loading rotation on boats; set the orientation directly
            local rot_enum = CalcRotationEnum(inst.Transform:GetRotation())
            SetOrientation(inst, data.boatrotation, rot_enum)
        else
            -- Old method for loading rotation on boats
            local boat = inst:GetCurrentPlatform()
            if boat and boat:HasTag("boat") then
                local fence_rotation = inst.Transform:GetRotation()
                local boat_rotation = boat.Transform:GetRotation()

                if fence_rotation < 0 then
                    fence_rotation = 360 + fence_rotation
                end

                local fence_rotation_enum = inst.loaded_rotation_enum
                local boat_rot_enum = CalcRotationEnum(boat_rotation)

                local base_rotation_enum = fence_rotation_enum - boat_rot_enum
                SetOrientation(inst, base_rotation_enum * 45 + boat_rotation)

                inst.loaded_rotation_enum = nil
            end
        end
    end)
end
local function fence_fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState() --V2C: need this even if we are door, for mouseover sorting
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.Transform:SetEightFaced()

    inst:SetDeploySmartRadius(0.5) --DEPLOYMODE.WALL assumes spacing of 1

    MakeObstaclePhysics(inst, 0.3)
    inst.Physics:SetDontRemoveOnSleep(true)

    inst:AddTag("wall")
    inst:AddTag("fence")
    inst:AddTag("alignwall")
    inst:AddTag("noauradamage")
    inst:AddTag("rotatableobject")
    inst.AnimState:SetBank("gentleness_fence")
    inst.AnimState:SetBuild("gentleness_fence")
    inst.AnimState:PlayAnimation("idle")
    inst["Transform"]:SetScale(0.8, 0.8, 0.8)

    MakeSnowCoveredPristine(inst)

    inst._pfpos = nil
    inst._ispathfinding = net_bool(inst.GUID, "_ispathfinding", "onispathfindingdirty")
    makeobstacle(inst)
    inst:DoTaskInTime(0, InitializePathFinding)

    inst.OnRemoveEntity = onremove
    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst.anims = { wide = "gentleness_fence", narrow = "gentleness_fence" }

    inst:AddComponent("workable")
    inst["components"]["workable"]:SetWorkAction(ACTIONS["HAMMER"])
    inst["components"]["workable"]:SetWorkLeft(2)
    inst.components.workable:SetOnFinishCallback(function(_inst, worker)
        _inst["components"]["lootdropper"]:DropLoot()
        local fx = SpawnPrefab("collapse_small")
        if fx then
            fx["Transform"]:SetPosition(_inst["Transform"]:GetWorldPosition())
            fx:SetMaterial("wood")
        end
        _inst:Remove()
    end)

    inst:AddComponent("lootdropper")
    inst.components.lootdropper:SetLoot({ "twigs" })

    MakeSnowCovered(inst)
    inst.OnSave = onsave
    inst.OnLoad = onload
    inst.OnLoadPostPass = onloadpostpass
    inst.SetOrientation = SetOrientation

    return inst
end
local inv_assets = {
    Asset("ANIM", "anim/gentleness_fence.zip"),

}
local function ondeploywall(inst, pt, deployer, rot)
    -- 增加关联皮肤
    local wall = SpawnPrefab("gentleness_fence")
    if wall ~= nil then
        local item_skin = GetItemSkinName(inst)
        local item_prefab = wall["prefab"]
        ----------------------------------------------------------
        if HH_UTILS:IsHHType(SKIN_CONFIG[item_prefab], "table") then
            for i, v in ipairs(SKIN_CONFIG[item_prefab]) do
                if HH_UTILS:IsHHType(v, "table") and v["skin_id"] == item_skin and v["skin_server"]
                        and HH_UTILS:HasComponents(deployer, "gentleness_skin") then
                    local success, message = deployer["components"]["gentleness_skin"]:BuildChangeSkin(wall, item_skin)
                    --v["skin_server"](wall, item_skin)
                end
            end
        end
        ----------------------------------------------------------
        local x = math.floor(pt.x) + .5
        local z = math.floor(pt.z) + .5

        wall.Physics:SetCollides(false)
        wall.Physics:Teleport(x, 0, z)
        wall.Physics:SetCollides(true)
        inst.components.stackable:Get():Remove()

        FixUpFenceOrientation(wall, rot or 0)

        wall.SoundEmitter:PlaySound("dontstarve/common/place_structure_wood")
    end
end

local function updateSkinId(inst, name)
    if inst and inst["g_net_ui"] then
        local net_ui_name = inst["g_net_skin_id"]:value()
        if HH_UTILS:IsHHType(SKIN_CONFIG[name], "table") then
            local skin_list = SKIN_CONFIG[name]
            for i, v in ipairs(skin_list) do
                if HH_UTILS:IsHHType(v, "table") and net_ui_name == v["skin_id"] then
                    inst["skinname"] = net_ui_name
                end
            end
        end
    end
end
local function item_fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst:AddTag("fencebuilder")

    inst.AnimState:SetBank("gentleness_fence")
    inst.AnimState:SetBuild("gentleness_fence")
    inst.AnimState:PlayAnimation("inventory")

    MakeInventoryFloatable(inst, "small", nil, 1.1)
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst["components"]["inventoryitem"]["imagename"] = "gentleness_fence_item"
    inst["components"]["inventoryitem"]["atlasname"] = "images/gentleness_image/gentleness_fence_item.xml"

    inst:AddComponent("deployable")
    inst.components.deployable.ondeploy = ondeploywall
    inst.components.deployable:SetDeployMode(DEPLOYMODE.WALL)

    MakeSmallBurnable(inst, TUNING.MED_BURNTIME)
    MakeSmallPropagator(inst)

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL

    MakeHauntableLaunch(inst)
    inst["skinname"] = "gentleness_fence_item"

    return inst
end
-------------------------------------------------------------------------

local function placerupdate(inst)
    FixUpFenceOrientation(inst, nil)
end

local function MakeWallPlacer(placer, placement, anims, isdoor)
    local CreateDoorAnim = isdoor and function(inst)
        local _inst = CreateEntity()
        _inst.entity:AddTransform()
        _inst.entity:AddAnimState()

        _inst.Transform:SetEightFaced()

        _inst.AnimState:SetBank("gentleness_fence_gate")
        _inst.AnimState:SetBuild("gentleness_fence_gate")
        _inst.AnimState:PlayAnimation("idle")
        _inst.AnimState:Hide("mouseover")
        _inst.AnimState:SetLightOverride(1)

        _inst:AddTag("CLASSIFIED")
        _inst:AddTag("NOCLICK")
        _inst:AddTag("placer")
        --[[Non-networked entity]]
        _inst.entity:SetCanSleep(false)
        _inst.persists = false

        return _inst
    end or nil

    return MakePlacer(
            placer,
            "gentleness_fence",
            "gentleness_fence",
            "idle",
            nil, nil, true, 0.8, 0, "eight",
            function(inst)
                inst.components.placer.onupdatetransform = placerupdate
                inst.anims = anims
                if isdoor then
                    inst.isdoor = true
                    inst.isswingright = false
                    inst.dooranim = CreateDoorAnim()
                    inst.dooranim.entity:SetParent(inst.entity)
                    inst.components.placer:LinkEntity(inst.dooranim)
                end
            end)
end
local door_assets = {
    Asset("ANIM", "anim/gentleness_fence_gate.zip"),
    Asset("ANIM", "anim/fence_gate.zip"),
}
local gate_name = "gentleness_fence_gate"
local function door_fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.Transform:SetEightFaced()

    inst:SetDeploySmartRadius(0.5)

    MakeObstaclePhysics(inst, 0.3)
    inst.Physics:SetDontRemoveOnSleep(true)

    inst:AddTag("wall")
    inst:AddTag("fence")
    inst:AddTag("alignwall")
    inst:AddTag("noauradamage")
    inst:AddTag("rotatableobject")
    --inst.AnimState:SetBank("gentleness_fence_gate")
    --inst.AnimState:SetBuild("gentleness_fence_gate")
    --inst.AnimState:PlayAnimation("idle")

    inst.isdoor = true
    inst:AddTag("door")
    inst._isopen = net_bool(inst.GUID, gate_name .. "._open", "doorstatedirty")
    inst._isswingright = net_bool(inst.GUID, gate_name .. "._swingright", "doorstatedirty")
    inst.GetActivateVerb = getdooractionstring

    inst._pfpos = nil
    inst._ispathfinding = net_bool(inst.GUID, "_ispathfinding", "onispathfindingdirty")
    makeobstacle(inst)
    inst:DoTaskInTime(0, InitializePathFinding)

    inst.OnRemoveEntity = onremove
    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        inst:DoTaskInTime(0, OnInitDoorClient)
        return inst
    end

    inst:AddComponent("inspectable")

    inst.dooranim = SpawnPrefab(gate_name .. "_anim")
    if inst.dooranim then
        inst.dooranim.entity:SetParent(inst.entity)
        inst.highlightforward = inst.dooranim
    end

    inst.anims = { wide = gate_name, narrow = gate_name }

    inst:AddComponent("workable")
    inst["components"]["workable"]:SetWorkAction(ACTIONS["HAMMER"])
    inst["components"]["workable"]:SetWorkLeft(2)
    inst.components.workable:SetOnFinishCallback(function(_inst, worker)
        _inst["components"]["lootdropper"]:DropLoot()
        local fx = SpawnPrefab("collapse_small")
        if fx then
            fx["Transform"]:SetPosition(_inst["Transform"]:GetWorldPosition())
            fx:SetMaterial("wood")
        end
        _inst:Remove()
    end)

    inst:AddComponent("lootdropper")
    inst.components.lootdropper:SetLoot({ "twigs" })

    inst:AddComponent("activatable")
    inst.components.activatable.OnActivate = ToggleDoor
    inst.components.activatable.standingaction = true

    inst.OnSave = onsave
    inst.OnLoad = onload
    inst.OnLoadPostPass = onloadpostpass
    inst.SetOrientation = SetOrientation

    return inst
end
--门动画实体
local function door_anim_fn()
    local inst = CreateEntity()
    inst:AddTag("can_offset_sort_pos")

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.Transform:SetEightFaced()

    inst.AnimState:SetBank("gentleness_fence_gate")
    inst.AnimState:SetBuild("gentleness_fence_gate")
    inst.AnimState:PlayAnimation("idle")
    inst["Transform"]:SetScale(0.8, 0.8, 0.8)
    inst:AddTag("FX")

    inst.AnimState:Hide("mouseover")
    MakeSnowCoveredPristine(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = OnWallAnimReplicated

        return inst
    end
    MakeSnowCovered(inst)

    inst.persists = false
    return inst
end

local function onDeployDoor(inst, pt, deployer, rot)
    -- 增加关联皮肤
    local wall = SpawnPrefab("gentleness_fence_gate")
    if wall ~= nil then
        local x = math.floor(pt.x) + .5
        local z = math.floor(pt.z) + .5
        wall.Physics:SetCollides(false)
        wall.Physics:Teleport(x, 0, z)
        wall.Physics:SetCollides(true)
        inst.components.stackable:Get():Remove()
        FixUpFenceOrientation(wall, rot or 0)
        wall.SoundEmitter:PlaySound("dontstarve/common/place_structure_wood")
    end
end
local function door_item_fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst:AddTag("fencebuilder")

    inst.AnimState:SetBank("gentleness_fence_gate")
    inst.AnimState:SetBuild("gentleness_fence_gate")
    inst.AnimState:PlayAnimation("inventory")

    MakeInventoryFloatable(inst, "small", nil, 1.1)
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst["components"]["inventoryitem"]["imagename"] = "gentleness_fence_gate_item"
    inst["components"]["inventoryitem"]["atlasname"] = "images/gentleness_image/gentleness_fence_gate_item.xml"

    inst:AddComponent("deployable")
    inst.components.deployable.ondeploy = onDeployDoor
    inst.components.deployable:SetDeployMode(DEPLOYMODE.WALL)

    MakeSmallBurnable(inst, TUNING.MED_BURNTIME)
    MakeSmallPropagator(inst)

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL

    MakeHauntableLaunch(inst)

    return inst
end
return
Prefab("gentleness_fence", fence_fn, assets),
Prefab("gentleness_fence_item", item_fn, inv_assets),
Prefab("gentleness_fence_gate_item", door_item_fn, door_assets),
Prefab("gentleness_fence_gate", door_fn, door_assets),
Prefab("gentleness_fence_gate_anim", door_anim_fn, door_assets),
MakeWallPlacer("gentleness_fence_item_placer", "fence", { wide = "gentleness_fence", narrow = "gentleness_fence" }, false),
MakeWallPlacer("gentleness_fence_gate_item_placer", "fence", { wide = "gentleness_fence_gate", narrow = "gentleness_fence_gate" }, true)
