----
---文件处理时间:2024-07-01 23:48:41
---
local HH_UTILS = require("utils/gentleness_utils")

local function client_magic(self, magic_num)
    if self["inst"] and self["inst"]["gentleness_magic_num"] then
        self["inst"]["gentleness_magic_num"]:set(magic_num)
    end
end
local HH_COM = Class(function(self, inst)
    self["inst"] = inst
    self["magic"] = 150
    self["max_magic"] =150
end,
        nil,
        {
            ["magic"] = client_magic,
        })

function HH_COM:DoDelta(amount)
    if not HH_UTILS:IsHHType(amount, "number") then
        return false, "参数错误"
    end
    local old_magic = self["magic"]
    if amount >= 0 then
        self["magic"] = math["min"](old_magic + amount, self["max_magic"])
    else
        self["magic"] = math["max"](old_magic + amount, 0)
    end
    return true, "成功"
end

function HH_COM:SetMaxMagic(max_value)
    self["max_magic"] = max_value
    self["magic"] = max_value
end

function HH_COM:GetCurrentMagic()
    return self["magic"]
end

function HH_COM:OnSave()
    return {
        ["magic"] = self["magic"],
    }
end
function HH_COM:OnLoad(data)
    if not data then
        return
    end
    self["magic"] = data["magic"]
end
return HH_COM
