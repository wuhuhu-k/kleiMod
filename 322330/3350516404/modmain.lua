local MESSAGES = {
    zh = {
        NO_CHESTS = "附近没有可用的存储容器！",
        NO_MATCHING_ITEMS = "附近箱子里没有和身上相同的物品！",
        NO_ITEMS_EXCEED_THRESHOLD = "没有超过保留阈值的物品需要存储！",
        NO_SPACE = "可以放的箱子里没有地方了！",
        STASH_SUCCESS = "成功存入 %d 个物品！",
        RETENTION_AMOUNT = "(保留数量: %d)",
        FILTERED_PREFIX = "已过滤: ",
        PROTECTED_PREFIX = "已保护: ",
        SLOT_FORMAT = "%d号格",
        ADMIN_ONLY = "只有管理员才可以使用此功能！",
        FILTER_NAMES = {
            blacklist = "黑名单",
            food = "食物",
            clothes = "衣物",
            armor = "护甲",
            weapon = "武器",
            tool = "工具",
            material = "材料",
            gem = "宝石",
            cooks = "料理"
        }
    },
    en = {
        NO_CHESTS = "No available storage containers nearby!",
        NO_MATCHING_ITEMS = "No matching items in nearby chests!",
        NO_ITEMS_EXCEED_THRESHOLD = "No items exceed retention threshold!",
        NO_SPACE = "No space in compatible chests!",
        STASH_SUCCESS = "Successfully stored %d items!",
        RETENTION_AMOUNT = "(Retention Amount: %d)",
        FILTERED_PREFIX = "Filtered: ",
        PROTECTED_PREFIX = "Protected: ",
        SLOT_FORMAT = "Slot %d",
        ADMIN_ONLY = "Only administrators can use this feature!",
        FILTER_NAMES = {
            blacklist = "Blacklist",
            food = "Food",
            clothes = "Clothes",
            armor = "Armor",
            weapon = "Weapons",
            tool = "Tools",
            material = "Materials",
            gem = "Gems",
            cooks = "Cooked Food"
        }
    }
}

local function GetLanguage()
    local language = GLOBAL.LanguageTranslator.defaultlang
    if language == "zh" or 
       language == "simplified_chinese" or 
       language == "traditional_chinese" or 
       language == "zht" or 
       language == "zhr" then
        return "zh"
    end
    return "en"
end

local function GetMessage(key)
    local lang = GetLanguage()
    if MESSAGES[lang] and MESSAGES[lang][key] then
        return MESSAGES[lang][key]
    end
    if MESSAGES["en"] and MESSAGES["en"][key] then
        return MESSAGES["en"][key]
    end
    return "Message not found: " .. tostring(key)
end

local SEARCH_RANGE = GetModConfigData("SEARCH_RANGE")
local STASH_KEY = GetModConfigData("STASH_KEY")
local PERMISSION_MODE = GetModConfigData("PERMISSION_MODE")
local ENABLE_BLACKLIST = GetModConfigData("ENABLE_BLACKLIST")
local PROTECTED_SLOTS = GetModConfigData("PROTECTED_SLOTS")
local CHECK_NESTED_CONTAINERS = GetModConfigData("CHECK_NESTED_CONTAINERS")
local ENABLE_RESOURCE_THRESHOLD = GetModConfigData("ENABLE_RESOURCE_THRESHOLD")
local RESOURCE_THRESHOLD_AMOUNT = GetModConfigData("RESOURCE_THRESHOLD_AMOUNT")
local BASIC_RESOURCES_ONLY = GetModConfigData("BASIC_RESOURCES_ONLY")

local TYPE_FILTERS = {
    food = GetModConfigData("FILTER_FOOD"),
	clothes = GetModConfigData("FILTER_CLOTHES"),
    armor = GetModConfigData("FILTER_ARMOR"),
    weapon = GetModConfigData("FILTER_WEAPON"),
    tool = GetModConfigData("FILTER_TOOL"),
    material = GetModConfigData("FILTER_MATERIAL"),
    gem = GetModConfigData("FILTER_GEM"),
	cooks = GetModConfigData("FILTER_COOKS"),
}

local FilterRules = require("filter_rules")
local BLACKLIST = ENABLE_BLACKLIST and require("blacklist") or {}

-- 有效容器类型列表你可以在这里加你想要的容器
local VALID_CHEST_TYPES = {
    "treasurechest", 
    "dragonflychest", 
    "icebox", 
    "saltbox", 
    "storeroom",  
    "hiddenmoonlight",
    "chest_whitewood",
    "chest_whitewood_big", 
    "chest_whitewood_big_inf", 
    "chest_whitewood_inf",
    "hiddenmoonlight_inf"
}

local BASIC_RESOURCES = {
    cutgrass = true,    
    twigs = true,       
    rocks = true,       
    goldnugget = true,  
    log = true,         
    nitre = true,       
    flint = true,       
}

local function IsBasicResource(prefab)
    if not BASIC_RESOURCES_ONLY then
        return true  
    end
    return BASIC_RESOURCES[prefab] == true
end

local function SpawnFx(chest) 
    if not GLOBAL.TheWorld.ismastersim then return end
    local fx = GLOBAL.SpawnPrefab("statue_transition_2")
    if fx then
        local x, y, z = chest.Transform:GetWorldPosition()
        fx.Transform:SetPosition(x, y, z)
    end
end

local function IsItemOfType(item, type_name)
    if not item then return false end
    
    if FilterRules.SPECIAL_CASES[item.prefab] then
        for _, special_type in ipairs(FilterRules.SPECIAL_CASES[item.prefab]) do
            if special_type == type_name then
                return true
            end
        end
    end
    
    if FilterRules.TYPE_TAGS[type_name] then
        for _, tag in ipairs(FilterRules.TYPE_TAGS[type_name]) do
            if item:HasTag(tag) then
                return true
            end
        end
    end
    
    if FilterRules.TYPE_COMPONENTS[type_name] then
        for _, component in ipairs(FilterRules.TYPE_COMPONENTS[type_name]) do
            if item.components[component] then
                return true
            end
        end
    end
    
    return false
end

local function IsItemBlacklisted(prefab)
    if not ENABLE_BLACKLIST then return false end
    for _, blacklisted_prefab in ipairs(BLACKLIST) do
        if prefab == blacklisted_prefab then
            return true
        end
    end
    return false
end

local function IsCookedFood(item)
    if not item then return false end
    
     if FilterRules.SPECIAL_CASES[item.prefab] and FilterRules.SPECIAL_CASES[item.prefab][1] == "cooks" then
        return true
    end
    
    if item:HasTag("preparedfood") then
        return true
    end
    
	-- if item.components.edible and item.components.perishable and item:HasTag("cookable") then
     --   return true
   -- end
	
    
    return false
end

local function CanChestAcceptItem(chest, prefab)
    if not chest or not chest:IsValid() or not chest.components.container then 
        return false 
    end
    
    local container = chest.components.container
    if container.slots then
        for _, item in pairs(container.slots) do
            if item and item:IsValid() and item.prefab == prefab and
               item.components.stackable and item.components.stackable:RoomLeft() > 0 then
                return true
            end
        end
    end
    
    return not container:IsFull()
end



local function ShouldFilterItem(item)
    if not item then return false end
    
    if ENABLE_BLACKLIST and IsItemBlacklisted(item.prefab) then
        return true
    end
    
    if TYPE_FILTERS.cooks and IsCookedFood(item) then
        return true
    end
    
    for type_name, enabled in pairs(TYPE_FILTERS) do
        if type_name ~= "cooks" and enabled and IsItemOfType(item, type_name) then
            return true
        end
    end
    
    return false
end




local function CheckPartialStacks(container, prefab)
    if not container or not container.slots then return {} end
    local partial_stacks = {}
    for slot, item in pairs(container.slots) do
        if item and item:IsValid() and item.prefab == prefab and 
           item.components.stackable and 
           item.components.stackable:RoomLeft() > 0 then
            table.insert(partial_stacks, item)
        end
    end
    return partial_stacks
end

local function SafeRemoveItem(container, item)
    if not item or not item:IsValid() or not container then return false end
    if container.RemoveItem then
        container:RemoveItem(item, true)
        return true
    end
    return false
end

local function IsValidChestType(prefab)
    for _, valid_type in ipairs(VALID_CHEST_TYPES) do
        if prefab == valid_type then
            return true
        end
    end
    return false
end

local function GetChestItemTypes(chest)
    local item_types = {}
    if chest and chest.components.container then
        for slot, item in pairs(chest.components.container.slots) do
            if item and item:IsValid() then
                item_types[item.prefab] = true
            end
        end
    end
    return item_types
end

local function CheckContainerItems(container, items, checked_containers)
    if not container or not container.slots then return end
    if checked_containers[container] then return end  
    
    checked_containers[container] = true
    
    for slot, item in pairs(container.slots) do
        if item and item:IsValid() and not ShouldFilterItem(item) then
            if item.components.container and item.components.container.slots then
                CheckContainerItems(item.components.container, items, checked_containers)
            end
            
            table.insert(items, {
                item = item,
                container = container,
                slot = slot
            })
        end
    end
end


local function GetPlayerItems(player)
    if not player or not player:IsValid() or not player.components.inventory then 
        return {}, {}, {}, {} 
    end
    
    local items = {}
    local item_counts = {}
    local inventory_items = {}
    local backpack_items = {}
    local inventory = player.components.inventory
    
    local function CountItem(item, is_inventory)
        if item and item:IsValid() then
            local prefab = item.prefab
            if prefab then
                item_counts[prefab] = (item_counts[prefab] or 0) + 
                    (item.components.stackable and item.components.stackable.stacksize or 1)
            end
        end
    end
    
    if inventory.itemslots then
        for slot, item in pairs(inventory.itemslots) do
            if item and item:IsValid() and not table.contains(PROTECTED_SLOTS, slot) and
               not ShouldFilterItem(item) then
                
                CountItem(item, true)
                local item_data = {
                    item = item,
                    container = inventory,
                    slot = slot,
                    is_inventory = true
                }
                table.insert(inventory_items, item_data)
                table.insert(items, item_data)
                
                if item.components.container and item.components.container.slots then
                    for bslot, bitem in pairs(item.components.container.slots) do
                        if bitem and bitem:IsValid() and not ShouldFilterItem(bitem) then
                            CountItem(bitem, false)
                            local backpack_data = {
                                item = bitem,
                                container = item.components.container,
                                slot = bslot,
                                is_inventory = false
                            }
                            table.insert(backpack_items, backpack_data)
                            table.insert(items, backpack_data)
                        end
                    end
                end
            end
        end
    end
    
    if inventory.equipslots then
        for slot_name, equipped_item in pairs(inventory.equipslots) do
            if equipped_item and equipped_item:IsValid() and
               equipped_item.components.container and equipped_item.components.container.slots then
                for eslot, eitem in pairs(equipped_item.components.container.slots) do
                    if eitem and eitem:IsValid() and not ShouldFilterItem(eitem) then
                        CountItem(eitem, false)
                        local backpack_data = {
                            item = eitem,
                            container = equipped_item.components.container,
                            slot = eslot,
                            is_inventory = false
                        }
                        table.insert(backpack_items, backpack_data)
                        table.insert(items, backpack_data)
                    end
                end
            end
        end
    end
    
    return items, item_counts, inventory_items, backpack_items
end

local function OptimizedTryStashItem(item, chest, container, amount_to_store)
    if not item or not chest or not amount_to_store or amount_to_store <= 0 or
       not item:IsValid() or not chest:IsValid() or not chest.components.container then 
        return false, 0
    end
    
    if item.components.container and item.components.container.slots then
        return false, 0
    end
    
    local item_prefab = item.prefab
    if not item_prefab then
        return false, 0
    end

    local is_stackable = item.components.stackable ~= nil
    
    if is_stackable then
        local stashed_amount = 0
        local remaining = amount_to_store
        
        local original_perishable = item.components.perishable
        local original_percent = original_perishable and original_perishable:GetPercent() or nil
        
        local partial_stacks = CheckPartialStacks(chest.components.container, item_prefab)
        for _, target in ipairs(partial_stacks) do
            if remaining > 0 and target and target:IsValid() and target.components.stackable then
                local space = target.components.stackable:RoomLeft()
                if space and space > 0 then
                    if original_perishable and target.components.perishable then
                        local target_percent = target.components.perishable:GetPercent()
                        local target_size = target.components.stackable.stacksize
                        local transfer = math.min(space, remaining)
                        
                        local weighted_percent = (target_percent * target_size + original_percent * transfer) / (target_size + transfer)
                        target.components.perishable:SetPercent(weighted_percent)
                    end
                    
                    local transfer = math.min(space, remaining)
                    target.components.stackable:SetStackSize(target.components.stackable.stacksize + transfer)
                    stashed_amount = stashed_amount + transfer
                    remaining = remaining - transfer
                end
            end
        end
        
        if remaining > 0 and not chest.components.container:IsFull() then
            local new_item = GLOBAL.SpawnPrefab(item_prefab)
            if new_item and new_item.components.stackable then
                if original_perishable and new_item.components.perishable then
                    new_item.components.perishable:SetPercent(original_percent)
                end
                
                new_item.components.stackable:SetStackSize(remaining)
                if chest.components.container:GiveItem(new_item) then
                    stashed_amount = stashed_amount + remaining
                    remaining = 0
                else
                    new_item:Remove()
                end
            end
        end
        
        if stashed_amount > 0 and item:IsValid() then
            local new_size = item.components.stackable.stacksize - stashed_amount
            if new_size > 0 then
                item.components.stackable:SetStackSize(new_size)
            else
                if container then
                    container:RemoveItem(item, true)
                end
                item:Remove()
            end
        end
        
        return stashed_amount > 0, stashed_amount
    else
        if not chest.components.container:IsFull() then
            local new_item = GLOBAL.SpawnPrefab(item_prefab)
            if new_item then
                if item.components.perishable and new_item.components.perishable then
                    new_item.components.perishable:SetPercent(item.components.perishable:GetPercent())
                end
                
                if chest.components.container:GiveItem(new_item) then
                    if container then
                        container:RemoveItem(item, true)
                    end
                    item:Remove()
                    return true, 1
                else
                    new_item:Remove()
                end
            end
        end
        return false, 0
    end
end


GLOBAL.ServerAutoStore = function(player)
    if not player or not player:IsValid() then return end
    if not player.components.inventory then return end
    
    local x, y, z = player.Transform:GetWorldPosition()
    local ents = GLOBAL.TheSim:FindEntities(x, y, z, SEARCH_RANGE)
    
    local chests = {}
    for _, ent in pairs(ents) do
        if IsValidChestType(ent.prefab) and 
           ent:IsValid() and 
           not ent:HasTag("burnt") and
           ent.components.container then
            local chest_x, chest_y, chest_z = ent.Transform:GetWorldPosition()
            local dist = math.sqrt((x - chest_x)^2 + (z - chest_z)^2)
            table.insert(chests, {chest = ent, distance = dist})
        end
    end
    
    table.sort(chests, function(a, b)
        return a.distance < b.distance
    end)
    
    if #chests == 0 then
        if player.components.talker then
            player.components.talker:Say(GetMessage("NO_CHESTS"))
        end
        return
    end
    
    local player_items, item_counts, inventory_items, backpack_items = GetPlayerItems(player)
    local total_stashed = 0
    local matching_items_found = false   
    local items_by_prefab = {}
    local inventory_counts = {}
    for _, data in ipairs(player_items) do
        if data.item and data.item:IsValid() then
            local prefab = data.item.prefab
            items_by_prefab[prefab] = items_by_prefab[prefab] or {
                inventory = {},
                backpack = {}
            }
            if data.is_inventory then
                table.insert(items_by_prefab[prefab].inventory, data)
                inventory_counts[prefab] = (inventory_counts[prefab] or 0) + 
                    (data.item.components.stackable and data.item.components.stackable.stacksize or 1)
            else
                table.insert(items_by_prefab[prefab].backpack, data)
            end
        end
    end
    
    local valid_chests = {}
    for _, chest_data in ipairs(chests) do
        if chest_data.chest and chest_data.chest:IsValid() then
            local types = GetChestItemTypes(chest_data.chest)
            for prefab in pairs(types) do
                valid_chests[prefab] = valid_chests[prefab] or {}
                table.insert(valid_chests[prefab], chest_data.chest)
            end
        end
    end
    
    for prefab, items in pairs(items_by_prefab) do
        local is_resource = IsBasicResource(prefab)
        
        if valid_chests[prefab] and #valid_chests[prefab] > 0 then
            matching_items_found = true
            local total_count = item_counts[prefab] or 0
            local inventory_count = inventory_counts[prefab] or 0
            local backpack_count = total_count - inventory_count
            
            if is_resource and ENABLE_RESOURCE_THRESHOLD then
                if total_count > RESOURCE_THRESHOLD_AMOUNT then
                    local keep_in_inventory = inventory_count >= backpack_count
                    
                    if keep_in_inventory then
                        for _, back_data in ipairs(items.backpack) do
                            if back_data.item and back_data.item:IsValid() then
                                local count = back_data.item.components.stackable 
                                    and back_data.item.components.stackable.stacksize 
                                    or 1
                                
                                for _, chest in ipairs(valid_chests[prefab]) do
                                    if chest and chest:IsValid() then
                                        local success, stashed = OptimizedTryStashItem(back_data.item, chest, back_data.container, count)
                                        if success then
                                            total_stashed = total_stashed + stashed
                                            SpawnFx(chest)  
                                            if not back_data.item:IsValid() then
                                                break
                                            end
                                            break
                                        end
                                    end
                                end
                            end
                        end
                        
                        if inventory_count > RESOURCE_THRESHOLD_AMOUNT then
                            local excess = inventory_count - RESOURCE_THRESHOLD_AMOUNT
                            for _, inv_data in ipairs(items.inventory) do
                                if excess > 0 and inv_data.item and inv_data.item:IsValid() then
                                    local current_size = inv_data.item.components.stackable.stacksize
                                    local can_store = math.min(excess, current_size)
                                    
                                    for _, chest in ipairs(valid_chests[prefab]) do                
                                        if chest and chest:IsValid() and CanChestAcceptItem(chest, prefab) then
                                            local success, stashed = OptimizedTryStashItem(inv_data.item, chest, player.components.inventory, can_store)
                                            if success then
                                                total_stashed = total_stashed + stashed
                                                excess = excess - stashed
                                                inventory_count = inventory_count - stashed
                                                SpawnFx(chest)
                                                if not inv_data.item:IsValid() then
                                                    break
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    else
                        for _, inv_data in ipairs(items.inventory) do
                            if inv_data.item and inv_data.item:IsValid() then
                                local count = inv_data.item.components.stackable 
                                    and inv_data.item.components.stackable.stacksize 
                                    or 1
                                    
                                for _, chest in ipairs(valid_chests[prefab]) do
                                    if chest and chest:IsValid() then
                                        local success, stashed = OptimizedTryStashItem(inv_data.item, chest, player.components.inventory, count)
                                        if success then
                                            total_stashed = total_stashed + stashed
                                            SpawnFx(chest)  
                                            if not inv_data.item:IsValid() then
                                                break
                                            end
                                            break
                                        end
                                    end
                                end
                            end
                        end
                        
                        local backpack_excess = backpack_count - RESOURCE_THRESHOLD_AMOUNT
                        if backpack_excess > 0 then
                            for _, back_data in ipairs(items.backpack) do
                                if backpack_excess > 0 and back_data.item and back_data.item:IsValid() then
                                    local current_size = back_data.item.components.stackable.stacksize
                                    local can_store = math.min(backpack_excess, current_size)
                                    
                                    for _, chest in ipairs(valid_chests[prefab]) do
                                        if chest and chest:IsValid() and CanChestAcceptItem(chest, prefab) then
                                            local success, stashed = OptimizedTryStashItem(back_data.item, chest, back_data.container, can_store)
                                            if success then
                                                total_stashed = total_stashed + stashed
                                                backpack_excess = backpack_excess - stashed
                                                backpack_count = backpack_count - stashed
                                                SpawnFx(chest)
                                                if not back_data.item:IsValid() then
                                                    break
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            else

                for _, data_list in pairs({items.inventory, items.backpack}) do
    for _, item_data in ipairs(data_list) do
        if item_data.item and item_data.item:IsValid() then
            for _, chest in ipairs(valid_chests[prefab]) do
                if chest and chest:IsValid() and CanChestAcceptItem(chest, prefab) then
                    local success, stashed = OptimizedTryStashItem(item_data.item, chest, item_data.container, 
                        item_data.item.components.stackable and item_data.item.components.stackable.stacksize or 1)
                    if success then
                        total_stashed = total_stashed + stashed
                        SpawnFx(chest)
                        if not item_data.item:IsValid() then
                            break
                        end
                    end
                end
            end
        end
    end
end
            end
        end
    end
    
    if player.components.talker then
        local message = ""
        if #chests == 0 then
            message = GetMessage("NO_CHESTS")
        elseif not matching_items_found then
            message = GetMessage("NO_MATCHING_ITEMS")
        elseif total_stashed == 0 then
            if ENABLE_RESOURCE_THRESHOLD then
                message = GetMessage("NO_ITEMS_EXCEED_THRESHOLD")
            else
                message = GetMessage("NO_SPACE")
            end
        else
            message = string.format(GetMessage("STASH_SUCCESS"), total_stashed)
            
            if ENABLE_RESOURCE_THRESHOLD then
                message = message .. string.format(GetMessage("RETENTION_AMOUNT"), RESOURCE_THRESHOLD_AMOUNT)
            end

            local active_filters = {}
            if ENABLE_BLACKLIST then
                table.insert(active_filters, GetMessage("FILTER_NAMES").blacklist)
            end
            
            for type_name, enabled in pairs(TYPE_FILTERS) do
                if enabled then
                    table.insert(active_filters, GetMessage("FILTER_NAMES")[type_name])
                end
            end
            
            if #active_filters > 0 then
                message = message .. "\n" .. GetMessage("FILTERED_PREFIX") .. table.concat(active_filters, ", ")
            end
        end
        
        if #PROTECTED_SLOTS > 0 then
            message = message .. "\n" .. GetMessage("PROTECTED_PREFIX")
            for i, slot in ipairs(PROTECTED_SLOTS) do
                message = message .. string.format(GetMessage("SLOT_FORMAT"), slot)
                if i < #PROTECTED_SLOTS then
                    message = message .. ", "
                end
            end
        end    
                
        player.components.talker:Say(message)
    end
end

local AUTO_STORE_RPC = "AutoStoreRPC"
AddModRPCHandler("AutoStore", AUTO_STORE_RPC, function(player) 
    if PERMISSION_MODE == "ADMIN" and not player.Network:IsServerAdmin() then
        if player.components.talker then
            player.components.talker:Say(GetMessage("ADMIN_ONLY"))
        end
        return
    end
    
    GLOBAL.ServerAutoStore(player)
end)

if not GLOBAL.TheNet:IsDedicated() then
    local function ClientAutoStore()
        local player = GLOBAL.ThePlayer
        if player then
            SendModRPCToServer(MOD_RPC.AutoStore[AUTO_STORE_RPC])
        end
    end

    GLOBAL.TheInput:AddKeyDownHandler(GLOBAL[STASH_KEY], ClientAutoStore)
end





if GLOBAL.TheWorld then
    GLOBAL.TheWorld.AutoStore = {
        
        GetConfig = function()
            return {
                search_range = SEARCH_RANGE,
                enable_blacklist = ENABLE_BLACKLIST,
                type_filters = TYPE_FILTERS,
                permission_mode = PERMISSION_MODE
            }
        end,
        
        
        IsItemFiltered = ShouldFilterItem,
        
        
        IsValidContainer = IsValidChestType,
        
        
        TriggerStore = function(player)
            if player and player:IsValid() then
                GLOBAL.ServerAutoStore(player)
                return true
            end
            return false
        end
    }
end




-- 调试
if GLOBAL.CHEATS_ENABLED then
    print("[Auto Store] Mod initialized with:")
    print("  - Search Range:", SEARCH_RANGE)
    print("  - Enable Blacklist:", ENABLE_BLACKLIST)
    print("  - Permission Mode:", PERMISSION_MODE)
    local active_filters = {}
    for type_name, enabled in pairs(TYPE_FILTERS) do
        if enabled then
            table.insert(active_filters, type_name)
        end
    end
    print("  - Active Filters:", table.concat(active_filters, ", "))
end