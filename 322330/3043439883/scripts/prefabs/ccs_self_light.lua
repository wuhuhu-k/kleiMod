local function lightFn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddLight()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	inst.AddTag(inst, "FX")

	inst.Light:SetRadius(20)
	inst.Light:SetFalloff(0.5)
	inst.Light:SetIntensity(0.8)
	inst.Light:SetColour(180 / 255, 195 / 255, 150 / 255)

	inst.Light:Enable(false)

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst.persists = false

	return inst
end


return Prefab("ccs_self_light", lightFn)