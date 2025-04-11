----
---文件处理时间:2024-07-01 23:48:41
---
local HH_UTILS = require("utils/gentleness_utils")
local HH_CLIENT = Class(function(self, inst)
    self["inst"] = inst
end)
function HH_CLIENT:SetValue(key, data)
    self[key] = data
    self["inst"]:PushEvent(key)
end
function HH_CLIENT:GetValue(key)
    if type(key) == "string" and self[key] and type(self[key]) == "table" then
        return HH_UTILS:HHCopyTable(self[key])
    end
    return self[key]
end
return HH_CLIENT
