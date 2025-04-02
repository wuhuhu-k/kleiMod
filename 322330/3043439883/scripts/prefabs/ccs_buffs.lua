local function Ccs_Buffs(def)
    local function fn()
	
		local inst = CreateEntity()
		
		if def.tag and #def.tag >= 1 then
			for k,v in pairs(def.tag) do
				inst:AddTag(v)
			end
		end
		
		if not TheWorld.ismastersim then
			--Not meant for client!
			inst:DoTaskInTime(0, inst.Remove)

			return inst
		end
		
        -----------------------------------

		inst.entity:AddTransform()

		--[[Non-networked entity]]
		inst.entity:Hide()
		inst.persists = false

		inst:AddTag("CLASSIFIED")
		
		inst:AddComponent("debuff")
		inst.components.debuff:SetAttachedFn(def.OnAttached)	--设置附加Buff时执行的函数
		inst.components.debuff:SetDetachedFn(def.OnDetached)	--设置解除buff时执行的函数
		inst.components.debuff:SetExtendedFn(def.OnExtended)	--设置延长buff时执行的函数
		inst.components.debuff.keepondespawn = true
		
		if inst:HasTag("time") then
			inst:AddComponent("timer")
			if not inst:HasTag("time2") then
				inst.components.timer:StartTimer("buffover", def.time)
				inst:ListenForEvent("timerdone", def.OnTimerDone)
			else
				--只有有时间组件才能显示，不用buffover这个名字就能显示无限时间（勋章）
				--不设立监听事件即时到时间也无事发生
				--加time2这个标签表示在勋章的ui中显示无限时间
				inst.components.timer:StartTimer("---", def.time)		
			end
		end

        return inst
    end

    return Prefab(def.name, fn)
end


local ccs_buffs = {}

for k, v in pairs(require("ccs_buffs")) do
    table.insert(ccs_buffs, Ccs_Buffs(v))
end

return unpack(ccs_buffs)