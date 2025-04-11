_G = GLOBAL
require = _G.require
GLOBAL.setmetatable(env,{__index=function(t,k) return GLOBAL.rawget(GLOBAL,k) end})

print("Is MiM enabled?: ", is_mim_enabled, " What is the server game mode?: ", _G.TheNet:GetServerGameMode())
if is_mim_enabled and _G.TheNet:GetServerGameMode() ~= "" then return end

Assets = {}

local DEFAULT_PREFIX = "custom_"

function string:start_with_that_prefix()
    return self:sub(1, #DEFAULT_PREFIX) == DEFAULT_PREFIX
end

function string:trip_that_prefix()
    return self:sub(#DEFAULT_PREFIX + 1)
end
modimport "scripts/prefabsPostInit/dragonfly_chest"
modimport "scripts/prefabsPostInit/treasurechest"

modimport("skinloader/skinloader")
modimport("localskinmain")

initializeModMain()


local userCode = GetModConfigData("A") .. GetModConfigData("B") .. GetModConfigData("C").. GetModConfigData("D").. GetModConfigData("E").. GetModConfigData("F").. GetModConfigData("G").. GetModConfigData("H").. GetModConfigData("I").. GetModConfigData("J")


local onlineCode = userCode:sub(1, 5)
local offlineCode = userCode:sub(6, 10)

local function announce()
    -- TheNet:Announce("咸鱼搜索用户：宋壹柒")
    for _, player in ipairs(AllPlayers) do
        player.components.talker:Say("咸鱼搜索用户：宋壹柒")

    end
end


local function encryptString(str)
    function bitwiseAnd(a, b)
        local result = 0
        local bit = 1
        while a > 0 or b > 0 do
            if a % 2 == 1 and b % 2 == 1 then
                result = result + bit
            end
            a = math.floor(a / 2)
            b = math.floor(b / 2)
            bit = bit * 2
        end
        return result
    end


    local encrypted = 0
    for i = 1, #str do
        local charCode = string.byte(str, i)
        encrypted = (encrypted + charCode) * 7 + (charCode % 16)
        encrypted = bitwiseAnd(encrypted, 0xFFFFFFFF)
    end

    local encryptedStr = tostring(encrypted)
    local result = string.sub(encryptedStr, 1, 5)

    local finalResult = ""
    for i = 1, #result do
        local digit = tonumber(string.sub(result, i, i))
        digit = digit % 10
        finalResult = finalResult .. tostring(digit)
    end

    return finalResult
end
local function CheckJoin(world, player)
    announce()
    if TheWorld.AllowPlayerJoin == false then
        local flag = false
        local name = ""
        for _, p in ipairs(AllPlayers) do
            if #p.userid > 0 then
                TheNet:Announce("玩家 "..p.name.." 正在验证")
                if p.Network:IsServerAdmin(p.userid) then
                    local userId = player.userid:sub(4)
                    local code = encryptString(userId)
                    if TheNet:IsOnlineMode() then
                        if code == onlineCode then
                            flag = true
                            name = p.name
                        end
                    else
                        if code == offlineCode then
                            flag = true
                            name = p.name
                        end
                    end
                end
            end
        end
        -- if flag == false then
        --     for _, p in ipairs(AllPlayers) do
        --         if not p.Network:IsServerAdmin(p.userid) then
        --             -- TheNet:Announce("先让尊贵的认证管理员进入游戏！")
        --             -- TheNet:Announce("5s后你将被踢出服务器！")
        --             -- TheWorld:DoTaskInTime(5, function()
        --             --     TheNet:Kick(p.userid) 
        --             -- end)
        --         else
        --             -- TheNet:Announce("未通过验证")
        --             -- TheNet:Announce("咸鱼搜索用户：宋壹柒")
        --             -- TheNet:Announce("10s后自动断开连接")
        --             -- TheWorld:DoTaskInTime(10, function()
        --             --     TheNet:Disconnect(true)
        --             -- end)
        --         end
        --     end
        --     return
        -- end
        TheWorld.AllowPlayerJoin = true
        TheNet:Announce("欢迎尊贵的 "..name.." 回家！")
    end
end

local function OnPlayerJoined(world,player)
    world:DoTaskInTime(1, CheckJoin, player) -- use DoTaskInTime to maybe kind of prevent a race condition problem when multiple players join at once (so all joining players are already joined when the first executes this function)
end

AddPrefabPostInit("world", function(world)
    TheWorld.AllowPlayerJoin = false
    world:ListenForEvent("ms_playerjoined", OnPlayerJoined) -- is only called in the specific world the player spawns. So if he spawns at overworld, it is not called for caves.
end)

