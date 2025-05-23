local radian = math.pi / 180
local c = Class(function(self, inst)
    self.inst = inst
    self.player = nil
    self.circle = 0
    self.range = 2
    self.stoptime = 0
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

function c:OnUpdate(dt)
    if self.player == nil or not self.player:IsValid() then
        -- print( "主人噶了 我也走了" )
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
    self.circle = (self.circle + dt * 120) % 360
    local circle = (self.circle - 180) * radian

    local x1, y1, z1 = self.player.Transform:GetWorldPosition()
    x1 = x1 + self.range * math.sin(circle)
    z1 = z1 + self.range * math.cos(circle)
    local x2, _, z2 = self.inst.Transform:GetWorldPosition()
    --------------------跟随速度在这里
    local velocity = ((z2 - z1) ^ 2 + (x2 - x1) ^ 2) * 3 -- 默认按距离平方增长，倍率5
    --------------------跟随速度在这里
    velocity = math.clamp(velocity, -50, 50) -- 跑辣么快干什么 传送去！
    self.inst.Physics:SetMotorVel(velocity, 0, 0)
    self.inst:FacePoint(Vector3(x1, 0, z1))
end

function c:OnUpdate2(dt) -- 落后玩家一个身位左右的算法
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
end
return c
