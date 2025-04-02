local radian = math.pi / 180
local c = Class(function(self, inst)
    self.inst = inst
    self.player = nil
    self.circle = 0
    self.range = 2
    self.stoptime = 0
	self.isPlayingAnimationSequence = false
    self.inst:ListenForEvent("onclose",function ()
        self.stoptime = 0 
    end)
    inst:DoPeriodicTask(1, function()
        if not (self.player and self.inst and self.player:IsValid() and self.inst:IsValid()) then
            self.inst:Remove()
            return
        end
        if self.player and self.inst and self.player:IsValid() and self.inst:IsValid() and
            self.inst:GetDistanceSqToInst(self.player) > 100 then
            -- print("让我回来！")
            self.inst.Physics:Teleport(self.player.Transform:GetWorldPosition())
        end
    end)
end)

function c:Init(player)
    self.inst:DoTaskInTime(0, function()
        self.player = player
        local x, _, z = self.player.Transform:GetWorldPosition()
        self.inst.Transform:SetPosition(x, 0, z)
        self.inst:StartUpdatingComponent(self)
    end)
end

function c:PlayAnimationSequence()
    if self.isPlayingAnimationSequence then
        return
    end

    self.isPlayingAnimationSequence = true
    local anim_state = self.inst.AnimState
    local animations = {"animation2", "animation2", "animation2", "animation2", "animation1", "animation1", "animation2", "animation2", "animation"}
    
    local function playNextAnimation(index)
        if index > #animations then
            self.isPlayingAnimationSequence = false
			
            return
        end

        local animation = animations[index]
        anim_state:PlayAnimation(animation, index == 1)
        self.inst.animation_task = self.inst:DoTaskInTime(anim_state:GetCurrentAnimationLength(), function()
            anim_state:PushAnimation(animation, false)
            playNextAnimation(index + 1)
        end)
    end
    
    playNextAnimation(1)
end

function c:OnUpdate(dt)
	local skinname = self.inst.item:GetSkinName()
	if self.player == nil or not self.player:IsValid() then
		self.inst:Remove() -- 主人噶了 我也走了 
		return
	end
	if self.stoptime > 0 then
		self.stoptime = self.stoptime - dt
		self.inst.Physics:SetMotorVel(0, 0, 0)
		if (skinname == "ccs_sb_item_skins11" or skinname == "ccs_xk_item_skins11") and not self.inst.AnimState:IsCurrentAnimation("animation2") then
			self:PlayAnimationSequence()
		end
		return
	end
	if self.inst.components.container and self.inst.components.container:IsOpen() then
		self.inst.Physics:SetMotorVel(0, 0, 0)
		if (skinname == "ccs_sb_item_skins11" or skinname == "ccs_xk_item_skins11") and not self.inst.AnimState:IsCurrentAnimation("animation2") then
			self:PlayAnimationSequence()
		end
		return
	end
	local x1, y1, z1 = self.player.Transform:GetWorldPosition()
	local x2, _, z2 = self.inst.Transform:GetWorldPosition()
	local circle = math.atan2(x2 - x1, z2 - z1)
	x1 = x1 + self.range * math.sin(circle)
	z1 = z1 + self.range * math.cos(circle)
	--------------------跟随速度在这里
	local velocity = ((z2 - z1) ^ 2 + (x2 - x1) ^ 2) * 3 -- 默认按距离平方增长，倍率3
	--------------------跟随速度在这里
	velocity = math.clamp(velocity, -50, 50) -- 跑辣么快干什么 传送去！
	self.inst.Physics:SetMotorVel(velocity, 0, 0)
	self.inst:FacePoint(Vector3(x1, 0, z1))
	if skinname == "ccs_sb_item_skins11" or skinname == "ccs_xk_item_skins11" then
		if self.player and self.inst and self.player:IsValid() and self.inst:IsValid() then
			if self.inst:GetDistanceSqToInst(self.player) < 6 then
				if not self.inst.AnimState:IsCurrentAnimation("animation2") then
					self:PlayAnimationSequence()
				end
			else
				if not (self.inst.AnimState:IsCurrentAnimation("run_pre") or self.inst.AnimState:IsCurrentAnimation("run1_pre") or self.inst.AnimState:IsCurrentAnimation("run_loop")) then
					if self.inst.animation_task then
						self.inst.animation_task:Cancel()
						self.inst.animation_task = nil
					end
					self.isPlayingAnimationSequence = false
                    if self.inst.AnimState:IsCurrentAnimation("animation2") then
                        self.inst.AnimState:PlayAnimation("run1_pre")
					    self.inst.AnimState:PushAnimation("run_loop", true)
                    else
                        self.inst.AnimState:PlayAnimation("run_pre")
					    self.inst.AnimState:PushAnimation("run_loop", true)
                    end
					
				end
			end
		end
    elseif skinname == "ccs_sb_item_skins12" or skinname == "ccs_xk_item_skins12" then
        if not self.inst.animation_task then
            self.inst.animation_task = self.inst:DoPeriodicTask(10,function ()
                self.inst.AnimState:PlayAnimation("animation1")
                self.inst.AnimState:PushAnimation("animation", true)
            end)
        end
    else
        if self.inst.animation_task then
            self.inst.animation_task:Cancel()
            self.inst.animation_task = nil
        end
	end
end

-- function c:OnUpdate(dt)
-- 	local skinname = self.inst.item:GetSkinName()
-- 	if TUNING.CCS_FLLOWER_STATE == 2 and skinname ~= "ccs_sb_item_skins11" then
-- 		if self.player == nil or not self.player:IsValid() then
-- 			-- print( "主人噶了 我也走了" )
-- 			self.inst:Remove() -- 主人噶了 我也走了 
-- 			return
-- 		end
-- 		if self.stoptime > 0 then
-- 			self.stoptime = self.stoptime - dt
-- 			self.inst.Physics:SetMotorVel(0, 0, 0)
-- 			return
-- 		end
-- 		if self.inst.components.container and self.inst.components.container:IsOpen() then
-- 			self.inst.Physics:SetMotorVel(0, 0, 0)
-- 			return
-- 		end
-- 		self.circle = (self.circle + dt * 120) % 360
-- 		local circle = (self.circle - 180) * radian

-- 		local x1, y1, z1 = self.player.Transform:GetWorldPosition()
-- 		x1 = x1 + self.range * math.sin(circle)
-- 		z1 = z1 + self.range * math.cos(circle)
-- 		local x2, _, z2 = self.inst.Transform:GetWorldPosition()
-- 		--------------------跟随速度在这里
-- 		local velocity = ((z2 - z1) ^ 2 + (x2 - x1) ^ 2) * 3 -- 默认按距离平方增长，倍率5
-- 		--------------------跟随速度在这里
-- 		velocity = math.clamp(velocity, -50, 50) -- 跑辣么快干什么 传送去！
-- 		self.inst.Physics:SetMotorVel(velocity, 0, 0)
-- 		self.inst:FacePoint(Vector3(x1, 0, z1))
-- 	else
-- 		if self.player == nil or not self.player:IsValid() then
-- 			self.inst:Remove() -- 主人噶了 我也走了 
-- 			return
-- 		end
-- 		if self.stoptime > 0 then
-- 			self.stoptime = self.stoptime - dt
-- 			self.inst.Physics:SetMotorVel(0, 0, 0)
-- 			if skinname == "ccs_sb_item_skins11" and not self.inst.AnimState:IsCurrentAnimation("animation2") then
-- 				self:PlayAnimationSequence()
-- 			end
-- 			return
-- 		end
-- 		if self.inst.components.container and self.inst.components.container:IsOpen() then
-- 			self.inst.Physics:SetMotorVel(0, 0, 0)
-- 			if skinname == "ccs_sb_item_skins11" and not self.inst.AnimState:IsCurrentAnimation("animation2") then
-- 				self:PlayAnimationSequence()
-- 			end
-- 			return
-- 		end
-- 		local x1, y1, z1 = self.player.Transform:GetWorldPosition()
-- 		local x2, _, z2 = self.inst.Transform:GetWorldPosition()
-- 		local circle = math.atan2(x2 - x1, z2 - z1)
-- 		x1 = x1 + self.range * math.sin(circle)
-- 		z1 = z1 + self.range * math.cos(circle)
-- 		--------------------跟随速度在这里
-- 		local velocity = ((z2 - z1) ^ 2 + (x2 - x1) ^ 2) * 3 -- 默认按距离平方增长，倍率3
-- 		--------------------跟随速度在这里
-- 		velocity = math.clamp(velocity, -50, 50) -- 跑辣么快干什么 传送去！
-- 		self.inst.Physics:SetMotorVel(velocity, 0, 0)
-- 		self.inst:FacePoint(Vector3(x1, 0, z1))
-- 		if skinname == "ccs_sb_item_skins11" then
-- 			if self.player and self.inst and self.player:IsValid() and self.inst:IsValid() then
-- 				if self.inst:GetDistanceSqToInst(self.player) < 6 then
-- 					if not self.inst.AnimState:IsCurrentAnimation("animation2") then
-- 						self:PlayAnimationSequence()
-- 					end
-- 				else
-- 					if not (self.inst.AnimState:IsCurrentAnimation("run_pre") or self.inst.AnimState:IsCurrentAnimation("run_loop")) then
-- 						if self.inst.animation_task then
-- 							self.inst.animation_task:Cancel()
-- 							self.inst.animation_task = nil
-- 						end
-- 						self.isPlayingAnimationSequence = false
-- 						self.inst.AnimState:PlayAnimation("run_pre")
-- 						self.inst.AnimState:PushAnimation("run_loop", true)
-- 					end
-- 				end
--             end

-- 		end
		
-- 	end
-- end

--[[function c:OnUpdate(dt) -- 落后玩家一个身位左右的算法
    if self.player == nil or not self.player:IsValid() then
        self.inst:Remove() -- 主人噶了 我也走了 
        return
    end
    if self.stoptime > 0 then
        self.stoptime = self.stoptime - dt
        self.inst.Physics:SetMotorVel(0, 0, 0)
        return
    end
    if self.inst.components.container and self.inst.components.container:IsOpen() then
        self.inst.Physics:SetMotorVel(0, 0, 0)
        return
    end
    local x1, y1, z1 = self.player.Transform:GetWorldPosition()
    local x2, _, z2 = self.inst.Transform:GetWorldPosition()
    local circle = math.atan2(x2 - x1, z2 - z1)
    x1 = x1 + self.range * math.sin(circle)
    z1 = z1 + self.range * math.cos(circle)
    --------------------跟随速度在这里
    local velocity = ((z2 - z1) ^ 2 + (x2 - x1) ^ 2) * 3 -- 默认按距离平方增长，倍率3
    --------------------跟随速度在这里
    velocity = math.clamp(velocity, -50, 50) -- 跑辣么快干什么 传送去！
    self.inst.Physics:SetMotorVel(velocity, 0, 0)
    self.inst:FacePoint(Vector3(x1, 0, z1))
end--]]
return c