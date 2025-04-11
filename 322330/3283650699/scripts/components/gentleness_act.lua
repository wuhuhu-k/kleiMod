local function launchItem(item, angle)
    if not item["Physics"] then
        return
    end
    local speed = math["random"]() * 4
    angle = (angle + math["random"]() * 60 - 30) * DEGREES
    item["Physics"]:SetVel(speed * math["cos"](angle), math["random"]() * 2 + 4, speed * math["sin"](angle))
end
local HH_COM = Class(function(self, inst)
    self["inst"] = inst
end)
----
---彩虹路地板-捡起来
---
function HH_COM:PickColorLand(pos, doer)
    local res = false
    local x, y, z = pos:Get()
    local ents = TheSim:FindEntities(x, y, z, 2, { "gentleness_color_land" }, { "INLIMBO" }, nil)
    for _, v in ipairs(ents) do
        v:Remove()
        local spawn_item = SpawnPrefab("gentleness_color_land_item")
        if spawn_item and spawn_item["Transform"] then
            spawn_item["Transform"]:SetPosition(x, y, z)
            launchItem(spawn_item, math["random"](1, 360))
        end
        res = true
    end
    return res
end
return HH_COM