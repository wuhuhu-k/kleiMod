----
---文件处理时间:2024-07-01 23:48:41
---
local HH_UTILS = require("utils/gentleness_utils")
local string_list = {
    "1", "2", "3", "4", "5", "6", "7", "8", "9",
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
}
local function getRandomId()
    local result_str = ""
    for i = 1, 18 do
        local random_index = math["random"](1, #string_list)
        result_str = result_str .. string_list[random_index]
    end
    return result_str
end
local HH_COM = Class(function(self, inst)
    self["inst"] = inst
    self["uid"] = getRandomId()
end)

function HH_COM:GetUid()
    return self["uid"]
end

function HH_COM:OnSave()
    return { ["uid"] = self["uid"], }
end
function HH_COM:OnLoad(data)
    if not data then
        return
    end
    self["uid"] = data["uid"] or getRandomId()
end
return HH_COM
