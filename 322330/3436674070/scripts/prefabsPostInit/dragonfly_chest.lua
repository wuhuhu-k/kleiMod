
local function ShouldCollapse(inst)
	if inst.components.container and inst.components.container.infinitestacksize then
		--NOTE: should already have called DropEverything(nil, true) (worked or deconstructed)
		--      so everything remaining counts as an "overstack"
		local overstacks = 0
		for k, v in pairs(inst.components.container.slots) do
			local stackable = v.components.stackable
			if stackable then
				overstacks = overstacks + math.ceil(stackable:StackSize() / (stackable.originalmaxsize or stackable.maxsize))
				if overstacks >= TUNING.COLLAPSED_CHEST_EXCESS_STACKS_THRESHOLD then
					return true
				end
			end
		end
	end
	return false
end



local function OnRestoredFromCollapsed(inst)
	inst.AnimState:PlayAnimation("rebuild")
	inst.AnimState:PushAnimation("closed", false)
	inst.SoundEmitter:PlaySound("dontstarve/common/dragonfly_chest_craft")
end
local function onhammered(inst, worker)
    inst.components.lootdropper:DropLoot()
    if inst.components.container ~= nil then
        inst.components.container:DropEverything()
    end
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    inst:Remove()
end
local function DoUpgradeVisuals(inst)
    local skin_name = (inst.AnimState:GetSkinBuild() or ""):gsub("custom_dragonflychest_", "")
    inst.AnimState:SetBank("dragonfly_chest_upgraded")
    inst.AnimState:SetBuild("dragonfly_chest_upgraded")
    if skin_name ~= "" then
        skin_name = "custom_dragonflychest_upgraded_" .. skin_name
        inst.AnimState:SetSkin(skin_name, "dragonfly_chest_upgraded")
    end
end
local function upgrade_onhit(inst, worker)
	if inst.components.container ~= nil then
		inst.components.container:DropEverything(nil, true)
		inst.components.container:Close()
	end
	inst.AnimState:PlayAnimation("hit")
	inst.AnimState:PushAnimation("closed", false)
end

local function upgrade_onhammered(inst, worker)
	if ShouldCollapse(inst) then
		if TheWorld.Map:IsPassableAtPoint(inst.Transform:GetWorldPosition()) then
			inst.components.container:DropEverythingUpToMaxStacks(TUNING.COLLAPSED_CHEST_MAX_EXCESS_STACKS_DROPS)
			if not inst.components.container:IsEmpty() then
				ConvertToCollapsed(inst, true)
				return
			end
		else
			--sunk, drops more, but will lose the remainder
			inst.components.lootdropper:DropLoot()
			inst.components.container:DropEverythingUpToMaxStacks(TUNING.COLLAPSED_CHEST_EXCESS_STACKS_THRESHOLD)
			local fx = SpawnPrefab("collapse_small")
			fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
			fx:SetMaterial("wood")
			inst:Remove()
			return
		end
	end

	--fallback to default
	onhammered(inst, worker)
end

local function OnUpgrade(inst, performer, upgraded_from_item)
    local numupgrades = inst.components.upgradeable.numupgrades
    if numupgrades == 1 then
        inst._chestupgrade_stacksize = true
        if inst.components.container ~= nil then -- NOTES(JBK): The container component goes away in the burnt load but we still want to apply builds.
            inst.components.container:Close()
            inst.components.container:EnableInfiniteStackSize(true)
            inst.components.inspectable.getstatus = getstatus
        end
        if upgraded_from_item then
            -- Spawn FX from an item upgrade not from loads.
            local x, y, z = inst.Transform:GetWorldPosition()
            local fx = SpawnPrefab("chestupgrade_stacksize_taller_fx")
            fx.Transform:SetPosition(x, y, z)
            -- Delay chest visual changes to match fx.
            local total_hide_frames = 6 -- NOTES(JBK): Keep in sync with fx.lua! [CUHIDERFRAMES]
            inst:DoTaskInTime(total_hide_frames * FRAMES, DoUpgradeVisuals)
        else
            DoUpgradeVisuals(inst)
        end
    end
    inst.components.upgradeable.upgradetype = nil

    if inst.components.lootdropper ~= nil then
        inst.components.lootdropper:SetLoot({ "alterguardianhatshard" })
    end
	inst.components.workable:SetOnWorkCallback(upgrade_onhit)
	inst.components.workable:SetOnFinishCallback(upgrade_onhammered)
	inst:ListenForEvent("restoredfromcollapsed", OnRestoredFromCollapsed)
end


local function OnLoad(inst, data, newents)
    if inst.components.upgradeable ~= nil and inst.components.upgradeable.numupgrades > 0 then
        OnUpgrade(inst)
    end
end

AddPrefabPostInit("dragonflychest", function(inst)

    if not TheWorld.ismastersim then
        return inst
    end
    local upgradeable = inst.components.upgradeable
    -- upgradeable.upgradetype = UPGRADETYPES.CHEST
    upgradeable:SetOnUpgradeFn(OnUpgrade)
    -- This chest cannot burn.
	inst.OnLoad = OnLoad
end)