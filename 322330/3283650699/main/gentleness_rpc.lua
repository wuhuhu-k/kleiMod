----
---文件处理时间:2024-07-01 23:48:41
---
local HH_UTILS = require("utils/gentleness_utils")
local table_key = {
}
AddClientModRPCHandler("gentleness_rpc", "gentleness_client_value", function(key, data)
    if not ThePlayer then
        return
    end
    if not HH_UTILS:HasComponents(ThePlayer, "gentleness_client") then
        ThePlayer:AddComponent("gentleness_client")
    end
    if key and type(key) == "string" then
        if table_key[key] then
            ThePlayer["components"]["gentleness_client"]:SetValue(key, HH_UTILS:StrToTable(data))
        else
            ThePlayer["components"]["gentleness_client"]:SetValue(key, data)
        end
    end
end)

AddModRPCHandler("gentleness_rpc", "gentleness_buy_item", function(player, rpc_name, item_id, item_value)
    if not HH_UTILS:NotIsDead(player) or not HH_UTILS:IsHHType(rpc_name, "string") then
        HH_UTILS:HHSay(player, "当前状态禁止操作")
        return
    end
    if not HH_UTILS:HasComponents(player, "gentleness_player") then
        HH_UTILS:HHSay(player, "你为什么要乱调RPC")
        return
    end
    if rpc_name == "buy_box" and HH_UTILS:IsHHType(item_id, "string") then
        player["components"]["gentleness_player"]:BuyBox(item_id, item_value)
    elseif rpc_name == "close_shop" then
        HH_UTILS:HHKillTask(player, "g_check_coin_task")
    end


end)
