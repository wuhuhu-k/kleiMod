local function IsDST() 
    return GLOBAL.TheSim:GetGameID() == "DST"
end

if IsDST() then
    modimport("blacklist")
    modimport("filter_rules")
end