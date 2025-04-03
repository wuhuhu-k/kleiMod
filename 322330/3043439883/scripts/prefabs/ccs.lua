local MakePlayerCharacter = require "prefabs/player_common"
local ccs_card_collection = TUNING.CCS_CARD_COLLECTION
local gl = 0.008
local gl2 = 0.001
if ccs_card_collection == 1 then
	gl = gl * 10
	gl2 = gl2 * 10
end

local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
	Asset( "ANIM", "anim/ccs.zip" ),
	Asset("ANIM", "anim/ccs_fly.zip"),
	Asset("ANIM", "anim/ccsflyrun.zip"),
	Asset( "ANIM", "anim/ccs_skins1.zip" ),
	-- Asset( "ANIM", "anim/ccs_skins2.zip" ),
	Asset( "ANIM", "anim/ccs_skins3.zip" ),
	Asset( "ANIM", "anim/ccs_skins4.zip" ),
	Asset( "ANIM", "anim/ccs_skins5.zip" ),
	Asset( "ANIM", "anim/ccs_skins6.zip" ),
	Asset( "ANIM", "anim/ccs_skins7.zip" ),
	Asset( "ANIM", "anim/ccs_skins8.zip" ),
	Asset( "ANIM", "anim/ccs_skins_spring.zip" ),
	Asset( "ANIM", "anim/ccs_skins_marinn.zip" ),
	Asset( "ANIM", "anim/ccs_skins_madoka.zip" ),
	Asset( "ANIM", "anim/ccs_skins_madoka1.zip" ),
	Asset( "ANIM", "anim/ccs_skins_qqj.zip" ),
	Asset( "ANIM", "anim/ccs_skins_catear.zip" ),
	Asset( "ANIM", "anim/ccs_skins_alice.zip" ),
	Asset( "ANIM", "anim/ccs_skins_kioku.zip" ),
	Asset( "ANIM", "anim/zhishi.zip" ),
	Asset( "ANIM", "anim/ccs_skins_haiyu.zip" ),
	Asset( "ANIM", "anim/shiranui.zip" ),
	Asset( "ANIM", "anim/daji.zip" ),
	Asset( "ANIM", "anim/ccs_skins_bronya.zip" ),
	Asset( "ANIM", "anim/ccs_skins_cn.zip" ),
	Asset( "ANIM", "anim/ccs_skins_limao.zip" ),
	Asset( "ANIM", "anim/ccs_skins_chuqing.zip" ),
	Asset( "ANIM", "anim/ccs_skins_yl.zip" ),
	Asset( "ANIM", "anim/ccs_skins_white.zip" ),
	Asset( "ANIM", "anim/ccs_skins_lotus.zip" ),
	Asset( "ANIM", "anim/ccs_skins_sea.zip" ),
	Asset( "ANIM", "anim/ghost_ccs_build.zip" ),
	Asset( "ANIM", "anim/ghost_shiranui_build.zip" ),
	Asset( "ANIM", "anim/ghost_bronya_build.zip" ),
	Asset( "ANIM", "anim/ccs_spell_anim.zip" ),
}

local prefabs = {}	
local start_inv = {"ccs_bag"}

if TUNING.GAMEMODE_STARTING_ITEMS then
    if TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT then
		TUNING.GAMEMODE_STARTING_ITEMS.DEFAULT.CCS = {"ccs_bag"}
	end
	TUNING.STARTING_ITEM_IMAGE_OVERRIDE.ccs_bag =  {atlas = "images/inventoryimages/ccs_bag.xml", image = "ccs_bag.tex" }

	TUNING.CCS_HEALTH = 150
	TUNING.CCS_HUNGER = 150
	TUNING.CCS_SANITY = 150
end

STRINGS.CHARACTER_TITLES.ccs = "小樱"
STRINGS.CHARACTER_NAMES.ccs = "小樱"
STRINGS.CHARACTER_DESCRIPTIONS.ccs = "木之本樱"
STRINGS.CHARACTER_SURVIVABILITY.ccs = "收服卡牌的道路总有艰辛"
STRINGS.NAMES.CCS = "小樱"
local speech = require "speech_Ccs" 
STRINGS.CHARACTERS.CCS = speech

-- 当人物复活的时
local function onbecamehuman(inst)
end
--当人物死亡的时
local function onbecameghost(inst)
end

-- 重载游戏或者生成一个玩家的时候
local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end


local common_postinit = function(inst) 
	inst.MiniMapEntity:SetIcon( "ccs.tex" )
	inst:AddTag("masterchef")         
	inst:AddTag("professionalchef") 
	inst:AddTag("fastpicker")  
	inst:AddTag("fastpick")  
	inst:AddTag("ccs")
	inst:AddTag("reader")
	inst:AddTag("bookbuilder")
	inst:DoTaskInTime(0,function()
		if inst.replica.builder then   
			local old_HasCharacterIngredient = inst.replica.builder.HasCharacterIngredient  
			inst.replica.builder.HasCharacterIngredient = function(self,ingredient,...)  
				if ingredient.type == CHARACTER_INGREDIENT.CCS_MAGIC then  
					if self.inst.replica.ccs_magic.current ~= nil then
						local current = math.ceil(self.inst.replica.ccs_magic.current:value())
						return (self.classified.isfreebuildmode:value() and 0) or current >= ingredient.amount,current  
					end
				end
				return old_HasCharacterIngredient(self,ingredient,...)
            end 
        end 
    end)
end

local function ontechtreechange(inst,data)
	local magic = data.level.MAGIC 
	if magic >= 5 then
		inst.components.builder.accessible_tech_trees.ANCIENT = 4
		inst.ccs_ancient4 = true
	else
		if inst.ccs_ancient4 then
			inst.ccs_ancient4 = false
			inst.components.builder.accessible_tech_trees.ANCIENT = 0
		end
	end
end

local function ccs_cookitem(inst, data)
	if inst.ccs_ccs_cards_20_bd == nil then
		inst.ccs_ccs_cards_20_bd = 0
	end
	inst.ccs_ccs_cards_20_bd = inst.ccs_ccs_cards_20_bd + 1
	local potgl = gl
	if data.cookpot and data.cookpot.prefab == "ccs_cookpot" then
		potgl = potgl + 0.01
	end
	if inst.ccs_ccs_cards_20_bd >= 300 or math.random() <= potgl then
		inst.ccs_ccs_cards_20_bd = 0
		local card = SpawnPrefab("ccs_cards_20")
		card.components.ccs_card_level:SetMaster(inst.name,inst.userid)
		inst.components.inventory:GiveItem(card)
	end
end

local function picksomething(inst,data)
	inst.components.ccs_valid.hp_bd = inst.components.ccs_valid.hp_bd + 1
	if data and data.loot then
		if data.loot.prefab == "petals" or data.loot.prefab == "petals_rose" or data.loot.prefab == "petals_orchid" or data.loot.prefab == "petals_lily" then
			if math.random() <= gl or inst.components.ccs_valid.hp_bd >= 200 then
				inst.components.ccs_valid.hp_bd = 0
				local card = SpawnPrefab("ccs_cards_9")
				card.components.ccs_card_level:SetMaster(inst.name,inst.userid)
				inst.components.inventory:GiveItem(card)
			end
			if math.random() <= 0.002 then
				local petals = SpawnPrefab("ccs_sakura1")
				inst.components.inventory:GiveItem(petals)
			end
		end
	end
	if math.random() <= gl2 then
		local card = SpawnPrefab("ccs_cards_3")
		card.components.ccs_card_level:SetMaster(inst.name,inst.userid)
		inst.components.inventory:GiveItem(card)
	end
	if math.random() <= gl2 then
		local card = SpawnPrefab("ccs_cards_17")
		card.components.ccs_card_level:SetMaster(inst.name,inst.userid)
		inst.components.inventory:GiveItem(card)
	end
end

local function itemget(inst,data)
	if data and data.item then
		if data.item and data.item.prefab == "ccs_cards_3" then
			inst:AddTag("ccs_cards_3_enble")
			if data.item.components.ccs_card_level:GetLevel() >= 2 then
				inst:AddTag("ccs_cards_3_enble_2")
			end
		end
		if data.item and data.item.prefab == "cursed_monkey_token" then
			inst.components.cursable:RemoveCurse("MONKEY",99)
		end
		if data.item and data.item.components.ccs_card_level and data.item.components.ccs_card_level.masterid == nil then
			data.item.components.ccs_card_level:SetMaster(inst.name,inst.userid)
		end
		if data.item and data.item.prefab == "ccs_cards_28" then
			if data.item.components.ccs_card_level:GetLevel() >= 3 then
				inst:AddTag("ccs_cards_28_level3")
			end
		end
	end
end

local function itemlose(inst,data)
	if data.prev_item.prefab == "ccs_cards_3" then
		inst:RemoveTag("ccs_cards_3_enble")
		inst:RemoveTag("ccs_cards_3_enble_2")
	end
	if data.prev_item.prefab == "ccs_cards_28" then
		inst:RemoveTag("ccs_cards_28_level3")
	end
end

local function onnewstate(inst,data)
	local isfly = inst.components.ccs_flying.isfly
	local action = inst.components.ccs_flying.action
	if isfly then
		local enble = table.contains(action,data.statename)
		if enble == false then
			inst.components.ccs_flying:Land()
		end
	end
end

local function death(inst)
	inst.components.ccs_magic:DoDelta(-99999)
end

local num = 2
if TUNING.CCS_SAN_DEL == 1 then
	num = 0
elseif TUNING.CCS_SAN_DEL == 2 then
	num = 1
end

local function attacked(inst)
	inst.components.sanity:DoDelta(-num)
end

local skin_equip_rules = {
    ["ccs_skins_madoka"] = true,
    ["ccs_skins_madoka1"] = true,
	["ccs_skins_chuqing"] = true,
	["ccs_skins_sea"] = true,
}

local function onequip(inst, data)
    local skin_name = inst.components.skinner and inst.components.skinner.skin_name
    if not skin_name then
        return
    end
    
    if skin_equip_rules[skin_name] then
        if data.eslot == EQUIPSLOTS.HEAD then
            inst.AnimState:Hide('HEAD')
            inst.AnimState:Show('HEAD_HAT')
            inst.AnimState:ClearOverrideSymbol('swap_hat')
        elseif (data.eslot == EQUIPSLOTS.BODY or data.eslot == EQUIPSLOTS.BACK or data.eslot == EQUIPSLOTS.NECK) and not data.item:HasTag('heavy') then
            inst.AnimState:ClearOverrideSymbol('swap_body')
            inst.AnimState:ClearOverrideSymbol('swap_body_tall')
        end
    end
end

local function unequip(inst, data)
    local skin_name = inst.components.skinner and inst.components.skinner.skin_name
    if not skin_name then
        return
    end
    
    if skin_equip_rules[skin_name] then
        if data.eslot == EQUIPSLOTS.HEAD then
            inst.AnimState:Show('HEAD')
            inst.AnimState:Hide('HEAD_HAT')
        end
    end
end



local master_postinit = function(inst)
	inst:ListenForEvent("techtreechange",ontechtreechange)
	inst:ListenForEvent("ccs_cookitem",ccs_cookitem)
	inst:ListenForEvent("picksomething",picksomething)
	inst:ListenForEvent("itemget",itemget)
	inst:ListenForEvent("itemlose",itemlose)
	inst:ListenForEvent("newstate",onnewstate)
	inst:ListenForEvent("death", death)		
	inst:ListenForEvent("attacked",attacked)	
	inst:ListenForEvent('equip', onequip)
    inst:ListenForEvent('unequip', unequip)
	
	
	-- 人物音效
	inst.soundsname = "wendy"

	inst.components.health:SetMaxHealth(TUNING.CCS_HEALTH)
	inst.components.hunger:SetMax(TUNING.CCS_HUNGER)
	inst.components.sanity:SetMax(TUNING.CCS_SANITY)
	
	inst.components.combat.damagemultiplier = 0.9
	inst.components.health:SetAbsorptionAmount(0.1)
	
	inst.components.builder.science_bonus = 1
	inst.components.builder.magic_bonus = 2	
	
	inst:AddComponent("ccs_magic")
	inst.components.ccs_magic:SetMax(100)
	inst.components.ccs_magic:SetMagicRecovery(5/60)
	
	inst:AddComponent("ccs_flying") 
	
	--inst.components.petleash:SetMaxPets(3)
	
	inst:AddComponent("reader")
	local old_Read = inst.components.reader.Read   
	inst.components.reader.Read = function(self,book,...) 
		if book.components.book then
			self.inst.components.sanity:DoDelta(-10)
		end
		return old_Read(self,book,...) 
	end  

	
	--制作解锁	  
	local old_HasCharacterIngredient = inst.components.builder.HasCharacterIngredient   
		inst.components.builder.HasCharacterIngredient = function(self,ingredient,...) 
			if ingredient.type == CHARACTER_INGREDIENT.CCS_MAGIC then  
				if self.inst.components.ccs_magic ~= nil then	
					return (self.freebuildmode and 0) or 
					math.ceil(self.inst.components.ccs_magic.current) >= ingredient.amount, self.inst.components.ccs_magic.current
				end 
            end
		return old_HasCharacterIngredient(self,ingredient,...)
	end  

	--扣魔法
	local old_RemoveIngredients = inst.components.builder.RemoveIngredients
	inst.components.builder.RemoveIngredients = function(self,ingredients,recname)
		local recipe = AllRecipes[recname]
		if recipe then
			for k,v in pairs(recipe.character_ingredients) do
				if v.type == CHARACTER_INGREDIENT.CCS_MAGIC then 
					local current = math.ceil(self.inst.components.ccs_magic.current)
					if current >= v.amount then  
						inst.components.ccs_magic:DoDelta(-v.amount)  
					end
				end
			end
		end
		return old_RemoveIngredients(self,ingredients,recname)   
	end	
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
	
end

local function MakeCcsSkin(name, data, notemp)
    local d = {}
    d.rarity = "木之本樱"
    d.rarityorder = 2
	d.raritycorlor = { 0/255, 255/255, 249/255, 1 }
    d.release_group = -1001
    d.skin_tags = {"BASE", "ccs", "CHARACTER"}
    d.skins = {
        normal_skin = name,
        ghost_skin = "ghost_hina_build"
    }
    d.checkfn = CCSAPI.CcsSkinCheckFn
    d.checkclientfn = CCSAPI.CcsSkinCheckClientFn
    d.share_bigportrait_name = "css"
    d.FrameSymbol = "Reward"
    for k, v in pairs(data) do
        d[k] = v
    end
    CCSAPI.MakeCharacterSkin("ccs", name, d)
    -- if not notemp then
    --     local d2 = shallowcopy(d)
    --     d2.rarity = "限时体验"
    --     d2.rarityorder = 80
    --     d2.raritycorlor = {0.957, 0.769, 0.188, 1}
    --     d2.FrameSymbol = "heirloom"
    --     d2.name = data.name .. "(限时)"
    --     CCSAPI.MakeCharacterSkin("ccs", name .. "_tmp", d2)
    -- end
end

local function MakeCcsSkin2(name, data, notemp)
    local d = {}
    d.rarity = "木之本樱"
    d.rarityorder = 2
	d.raritycorlor = { 0/255, 255/255, 249/255, 1 }
    d.release_group = -1001
    d.skin_tags = {"BASE", "ccs", "CHARACTER"}
    d.skins = {
        normal_skin = name,
        ghost_skin = "ghost_hina_build"
    }
    d.share_bigportrait_name = "css"
    d.FrameSymbol = "Reward"
    for k, v in pairs(data) do
        d[k] = v
    end
    CCSAPI.MakeCharacterSkin("ccs", name, d)
    -- if not notemp then
    --     local d2 = shallowcopy(d)
    --     d2.rarity = "限时体验"
    --     d2.rarityorder = 80
    --     d2.raritycorlor = {0.957, 0.769, 0.188, 1}
    --     d2.FrameSymbol = "heirloom"
    --     d2.name = data.name .. "(限时)"
    --     CCSAPI.MakeCharacterSkin("ccs", name .. "_tmp", d2)
    -- end
end

MakeCcsSkin("ccs_none",{
    name = "友枝学校校服",
    des = "很乖的学生",
    quotes = "木之本樱",
    rarity = "经典",
	rarityorder = 1,
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    skins = {normal_skin = "ccs", ghost_skin = "ghost_ccs_build"},
	build_name_override = "ccs",
	share_bigportrait_name = "ccs_none",
})
	
--[[MakeCcsSkin("ccs_skins1",{
	name = "知世做的衣服",
    des = "有点奇怪但很好看",
    quotes = "木之本樱",
    rarity = "稀有",
	rarityorder = 2,
	raritycorlor = { 0/255, 255/255, 249/255, 1 },
    skins = {normal_skin = "ccs_skins1", ghost_skin = "ghost_ccs_build"},
    build_name_override = "ccs_skins1",
	share_bigportrait_name = "ccs_skins1",
})	--]]

-- MakeCcsSkin2("ccs_skins2",{
-- 	name = "知世的力量",
--     des = "魔女战斗服",
--     quotes = "木之本樱",
--     rarity = "稀有",
-- 	rarityorder = 2,
-- 	raritycorlor = { 0/255, 255/255, 249/255, 1 },
--     skins = {normal_skin = "ccs_skins2", ghost_skin = "ghost_ccs_build"},
--     build_name_override = "ccs_skins2",
-- 	share_bigportrait_name = "ccs_skins2", 
-- })

MakeCcsSkin("ccs_skins3",{
	name = "知世的礼物",
    des = "送给每个玩家的生日礼物",
    quotes = "送给每个玩家的生日礼物",
    rarity = "生日限定",
	rarityorder = 3,
	raritycorlor = { 0/255, 255/255, 249/255, 1 },
    skins = {normal_skin = "ccs_skins3", ghost_skin = "ghost_ccs_build"},
    build_name_override = "ccs_skins3",
	share_bigportrait_name = "ccs_none", 
})

MakeCcsSkin("ccs_skins4",{
	name = "红桃礼服",
    des = "红桃礼服",
    quotes = "红桃礼服",
    rarity = "红桃礼服",
	rarityorder = 3,
	raritycorlor = { 0/255, 255/255, 249/255, 1 },
    skins = {normal_skin = "ccs_skins4", ghost_skin = "ghost_ccs_build"},
    build_name_override = "ccs", 
	share_bigportrait_name = "ccs_none", 
})

MakeCcsSkin("ccs_skins5",{
	name = "星星礼服",
    des = "星星礼服",
    quotes = "星星礼服",
    rarity = "星星礼服",
	rarityorder = 3,
	raritycorlor = { 0/255, 255/255, 249/255, 1 },
    skins = {normal_skin = "ccs_skins5", ghost_skin = "ghost_ccs_build"},
    build_name_override = "ccs",
	share_bigportrait_name = "ccs_none", 
})

MakeCcsSkin("ccs_skins6",{
	name = "花嫁小樱",
    des = "花嫁小樱",
    quotes = "花嫁小樱",
    rarity = "花嫁小樱",
	rarityorder = 3,
	raritycorlor = { 0/255, 255/255, 249/255, 1 },
    skins = {normal_skin = "ccs_skins6", ghost_skin = "ghost_ccs_build"},
    build_name_override = "ccs",
	share_bigportrait_name = "ccs_none", 
})

MakeCcsSkin("ccs_skins7",{
	name = "玉桂狗小樱",
    des = "玉桂狗小樱",
    quotes = "玉桂狗小樱",
    rarity = "玉桂狗小樱",
	rarityorder = 3,
	raritycorlor = { 0/255, 255/255, 249/255, 1 },
    skins = {normal_skin = "ccs_skins7", ghost_skin = "ghost_ccs_build"},
    build_name_override = "ccs",
	share_bigportrait_name = "ccs_none", 
})

MakeCcsSkin("ccs_skins8",{
	name = "玉桂狗小樱2",
    des = "玉桂狗小樱2",
    quotes = "玉桂狗小樱2",
    rarity = "玉桂狗小樱2",
	rarityorder = 3,
	raritycorlor = { 0/255, 255/255, 249/255, 1 },
    skins = {normal_skin = "ccs_skins8", ghost_skin = "ghost_ccs_build"},
    build_name_override = "ccs",
	share_bigportrait_name = "ccs_none", 
})

MakeCcsSkin("ccs_skins_spring",{
	name = "春之樱",
    des = "春之樱",
    quotes = "春之樱",
    rarity = "春之樱",
	rarityorder = 3,
	raritycorlor = { 0/255, 255/255, 249/255, 1 },
    skins = {normal_skin = "ccs_skins_spring", ghost_skin = "ghost_ccs_build"},
    build_name_override = "ccs",
	share_bigportrait_name = "ccs_none", 
})

MakeCcsSkin2("ccs_skins_marinn",{
    name = "梦梦",
    des = "梦梦",
    quotes = "梦梦",
    rarity = "梦梦",
	rarityorder = 1,
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    skins = {normal_skin = "ccs_skins_marinn", ghost_skin = "ghost_ccs_build"},
	build_name_override = "ccs",
	share_bigportrait_name = "ccs_none",
})

MakeCcsSkin("ccs_skins_madoka",{
    name = "圆环之理（长发）",
    des = "圆环之理",
    quotes = "圆环之理",
    rarity = "圆环之理",
	rarityorder = 1,
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    skins = {normal_skin = "ccs_skins_madoka", ghost_skin = "ghost_ccs_build"},
	build_name_override = "ccs_skins_madoka",
	share_bigportrait_name = "ccs_none",
	clear_fn = function (inst)
		inst:RemoveTag("ccs_flyrun")
	end,
	init_fn = function (inst)
		inst:AddTag("ccs_flyrun")
	end
})

MakeCcsSkin("ccs_skins_madoka1",{
    name = "圆环之理（短发）",
    des = "圆环之理",
    quotes = "圆环之理",
    rarity = "圆环之理",
	rarityorder = 1,
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    skins = {normal_skin = "ccs_skins_madoka1", ghost_skin = "ghost_ccs_build"},
	build_name_override = "ccs_skins_madoka1",
	share_bigportrait_name = "ccs_none",
	clear_fn = function (inst)
		inst:RemoveTag("ccs_flyrun")
	end,
	init_fn = function (inst)
		inst:AddTag("ccs_flyrun")
	end
})

MakeCcsSkin("ccs_skins_sea",{
    name = "定制：海的女儿",
    des = "定制：海的女儿",
    quotes = "定制：海的女儿",
    rarity = "定制：海的女儿",
	rarityorder = 1,
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    skins = {normal_skin = "ccs_skins_sea", ghost_skin = "ghost_ccs_build"},
	build_name_override = "ccs_skins_sea",
	share_bigportrait_name = "ccs_none",
	clear_fn = function (inst)
		inst:RemoveTag("ccs_flyrun")
	end,
	init_fn = function (inst)
		inst:AddTag("ccs_flyrun")
	end
})

MakeCcsSkin("ccs_skins_cn",{
    name = "中华娘",
    des = "中华娘",
    quotes = "中华娘",
    rarity = "中华娘",
	rarityorder = 1,
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    skins = {normal_skin = "ccs_skins_cn", ghost_skin = "ghost_ccs_build"},
	build_name_override = "ccs",
	share_bigportrait_name = "ccs_none",
})

MakeCcsSkin("ccs_skins_limao",{
    name = "陌上红樱",
    des = "陌上红樱",
    quotes = "陌上红樱",
    rarity = "陌上红樱",
	rarityorder = 1,
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    skins = {normal_skin = "ccs_skins_limao", ghost_skin = "ghost_ccs_build"},
	build_name_override = "ccs",
	share_bigportrait_name = "ccs_none",
})

CCSAPI.MakeCharacterSkin("ccs","shiranui",{
    name = "定制：不知火",
    des = "定制：不知火",
    quotes = "定制：不知火",
    rarity = "定制：不知火",
	rarityorder = 2,
	raritycorlor = { 0/255, 255/255, 249/255, 1 },
    skins = {normal_skin = "shiranui", ghost_skin = "ghost_shiranui_build"},
    skin_tags = {"shiranui", "ccs", "CHARACTER"},
	build_name_override = "ccs",
	FrameSymbol = "Reward",
	clear_fn = function (inst)
		inst.MiniMapEntity:SetIcon( "ccs.tex" )
	end,
	init_fn = function (inst)
		inst.MiniMapEntity:SetIcon( "shiranui.tex" )
	end,
    checkfn = CCSAPI.CcsSkinCheckFn,
    checkclientfn = CCSAPI.CcsSkinCheckClientFn
})

CCSAPI.MakeCharacterSkin("ccs","ccs_skins_bronya",{
    name = "定制：Bronya Zaychik",
    des = "定制：Bronya Zaychik",
    quotes = "定制：Bronya Zaychik",
    rarity = "定制：Bronya Zaychik",
	rarityorder = 2,
	raritycorlor = { 0/255, 255/255, 249/255, 1 },
    skins = {normal_skin = "ccs_skins_bronya", ghost_skin = "ghost_bronya_build"},
    skin_tags = {"ccs_skins_bronya", "ccs", "CHARACTER"},
	build_name_override = "ccs",
	FrameSymbol = "Reward",
	clear_fn = function (inst)
		inst.MiniMapEntity:SetIcon( "ccs.tex" )
	end,
	init_fn = function (inst)
		inst.MiniMapEntity:SetIcon( "ccs_skins_bronya.tex" )
	end,
    checkfn = CCSAPI.CcsSkinCheckFn,
    checkclientfn = CCSAPI.CcsSkinCheckClientFn
})

CCSAPI.MakeCharacterSkin("ccs","daji",{
    name = "定制：九尾",
    des = "定制：九尾",
    quotes = "定制：九尾",
    rarity = "定制：九尾",
	rarityorder = 2,
	raritycorlor = { 0/255, 255/255, 249/255, 1 },
    skins = {normal_skin = "daji", ghost_skin = "ghost_ccs_build"},
    skin_tags = {"daji", "ccs", "CHARACTER"},
	build_name_override = "ccs",
	FrameSymbol = "Reward",
    checkfn = CCSAPI.CcsSkinCheckFn,
    checkclientfn = CCSAPI.CcsSkinCheckClientFn
})

MakeCcsSkin("ccs_skins_qqj",{
    name = "定制：千千绝",
    des = "定制：千千绝",
    quotes = "定制：千千绝",
    rarity = "定制：千千绝",
	rarityorder = 1,
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    skins = {normal_skin = "ccs_skins_qqj", ghost_skin = "ghost_ccs_build"},
	build_name_override = "ccs",
	share_bigportrait_name = "ccs_none",
})
CCSAPI.MakeCharacterSkin("ccs","zhishi",{
    name = "定制：小樱cos知世",
    des = "定制：小樱cos知世",
    quotes = "定制：小樱cos知世",
    rarity = "定制：小樱cos知世",
	rarityorder = 2,
	raritycorlor = { 0/255, 255/255, 249/255, 1 },
    skins = {normal_skin = "zhishi", ghost_skin = "ghost_ccs_build"},
    skin_tags = {"zhishi", "ccs", "CHARACTER"},
	build_name_override = "ccs",
	FrameSymbol = "Reward",
    checkfn = CCSAPI.CcsSkinCheckFn,
    checkclientfn = CCSAPI.CcsSkinCheckClientFn
})


MakeCcsSkin("ccs_skins_haiyu",{
    name = "定制：叱咤月海鱼鱼猫",
    des = "定制：叱咤月海鱼鱼猫",
    quotes = "定制：叱咤月海鱼鱼猫",
    rarity = "定制：叱咤月海鱼鱼猫",
	rarityorder = 1,
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    skins = {normal_skin = "ccs_skins_haiyu", ghost_skin = "ghost_ccs_build"},
	share_bigportrait_name = "ccs_none",
	build_name_override = "ccs_skins_haiyu",
})

MakeCcsSkin("ccs_skins_alice",{
    name = "爱丽丝",
    des = "爱丽丝",
    quotes = "爱丽丝",
    rarity = "爱丽丝",
	rarityorder = 1,
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    skins = {normal_skin = "ccs_skins_alice", ghost_skin = "ghost_ccs_build"},
	build_name_override = "ccs",
	share_bigportrait_name = "ccs_none",
})

MakeCcsSkin("ccs_skins_catear",{
    name = "粉色猫耳",
    des = "粉色猫耳",
    quotes = "粉色猫耳",
    rarity = "粉色猫耳",
	rarityorder = 1,
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    skins = {normal_skin = "ccs_skins_catear", ghost_skin = "ghost_ccs_build"},
	build_name_override = "ccs",
	share_bigportrait_name = "ccs_none",
})

MakeCcsSkin("ccs_skins_kioku",{
    name = "定制：小小回忆",
    des = "定制：小小回忆",
    quotes = "定制：小小回忆",
    rarity = "定制：小小回忆",
	rarityorder = 1,
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    skins = {normal_skin = "ccs_skins_kioku", ghost_skin = "ghost_ccs_build"},
	build_name_override = "ccs",
	share_bigportrait_name = "ccs_none",
})

MakeCcsSkin("ccs_skins_chuqing",{
    name = "定制：初晴",
    des = "定制：初晴",
    quotes = "定制：初晴",
    rarity = "定制：初晴",
	rarityorder = 1,
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    skins = {normal_skin = "ccs_skins_chuqing", ghost_skin = "ghost_ccs_build"},
	build_name_override = "ccs",
	share_bigportrait_name = "ccs_none",
})
MakeCcsSkin("ccs_skins_yl",{
    name = "定制：知更鸟",
    des = "定制：知更鸟",
    quotes = "定制：知更鸟",
    rarity = "定制：知更鸟",
	rarityorder = 1,
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    skins = {normal_skin = "ccs_skins_yl", ghost_skin = "ghost_ccs_build"},
	build_name_override = "ccs_skins_yl",
	share_bigportrait_name = "ccs_none",
})
MakeCcsSkin("ccs_skins_white",{
    name = "透明翼",
    des = "透明翼",
    quotes = "透明翼",
    rarity = "透明翼",
	rarityorder = 1,
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    skins = {normal_skin = "ccs_skins_white", ghost_skin = "ghost_ccs_build"},
	build_name_override = "ccs",
	share_bigportrait_name = "ccs_none",
})
MakeCcsSkin("ccs_skins_lotus",{
    name = "荷花旗袍",
    des = "荷花旗袍",
    quotes = "荷花旗袍",
    rarity = "荷花旗袍",
	rarityorder = 1,
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    skins = {normal_skin = "ccs_skins_lotus", ghost_skin = "ghost_ccs_build"},
	build_name_override = "ccs",
	share_bigportrait_name = "ccs_none",
})




return MakePlayerCharacter("ccs", prefabs, assets, common_postinit, master_postinit, start_inv)
	