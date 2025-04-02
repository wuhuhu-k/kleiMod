-- 名称
name = "佩奇的神奇手杖"
-- 描述
description = [[
    这算是我第一个花了这么多心血去制作的模组，起初就是为了方便自己，不想看到各种耐久的工具乱丢乱放，所以才做了这个模组。我是一个还算是严谨的人，当看到模组有哪些功能用起来不舒服或者不方便的时候，我就会想尽办法让它变得完美，在追求稳定而且不丧失平衡的前提下方便使用。
	但是，总有一群人不知道是怎么想的，在没有真正了解这个模组的情况下给了差评。确实，每个人的喜好都不一样，有人觉得模组有失平衡，有的人却觉得非常方便。只是真心希望如果这个模组给你带来了一丝丝便捷请给予一个赞！也真心的希望如果你不喜欢这个模组悄悄路过就好，不要狠心留个差评。如果有Bug请评论区反馈，我们一起讨论嘛~ 也没什么大不了的，修就是了！
	我们谁都有过热情，我和其他大多数模组作者一样对这个游戏充满热爱，也想留下点什么。但，时间终将会消磨一切，真正促使我坚持下来的动力是什么呢？
	"滚滚红尘，时光留不住我们的青春岁月，留不住我们人世沧桑，但唯一能留得住的是我们那些年最美好的记忆。"

	

    ]]
-- 作者
author = "󰀉Peppa󰀉"
-- 版本
version = "2.2"
-- klei官方论坛地址，为空则默认是工坊的地址
forumthread = ""
-- modicon
icon_atlas = "modicon.xml"
 icon = "modicon.tex"

forumthread = ""

api_version = 10

priority = -100000

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false

all_clients_require_mod = true
client_only_mod = false
server_only_mod = true

server_filter_tags = { "佩奇", "Peppa", "佩奇的神奇手杖", "Peppa's Super Cane", "万能工具", "Tool", "步行手杖" }


configuration_options =

{
	
		{name = "", label = "【手杖功能/cane function】", options = {{description = "", data = ""},}, default = "",},
			{
		name = "peppacane",
		label = "【★★★★★萌新专属/Noob Only】",
		hover = "你现在可以制作海象牙啦~在精炼栏制作！\nYou can make Walrus Tusk under REFINE table at the start of the game! ",
		options =
		{
			{description = "开启/on",data = 1 ,hover = "默认开启/on by default"},
			{description = "关闭/off",data = 0},


		},
		default = 0,
	},

	{
		name = "peppaqiehuan",
		label = "【游戏内切换功能/mode toggle】",
		hover = "右键手杖切换魔杖/工具模式（防止误触）\nRight click the cane for tool mode or cane mode",
		options =
		{
			{description = "开启/on",data = true ,hover = "默认开启/on by default"},
			{description = "关闭/off",data = false},


		},
		default = true,
	},
	

	{
	  name = "peppahammer",
	  label = "【锤功能/hammer】",
	  hover = "peppa步行手杖的锤子功能\nHammer function",
	   options = 
        {		
			{description = "关闭/off", data = 0,hover = "默认关闭/off by default"},
			{description = "默认效率/default", data = 1,hover = "小锤40"},
			{description = "10倍效率/10x efficiency", data = 10,hover = "大锤80"},
     	 },
	    default = 0,
	
	},
	{
	  name = "peppapickaxe",
	  label = "【镐功能/pickaxe】",
	  hover = "peppa步行手杖的镐子功能\nPickaxe function",
	   options = 
        {		
			{description = "关闭/off", data = 0,hover = "默认关闭/off by default"},
			{description = "默认效率/default", data = 1},
			{description = "5倍效率/5x efficiency", data = 5},
			{description = "10倍效率/10x efficiency", data = 10},
			{description = "20倍效率/20x efficiency", data = 20},
     	 },
	    default = 0,
	
	},
	{
	  name = "peppashovel",
	  label = "【铲功能/shovel】",
	  hover = "peppa步行手杖的铲子功能\nShovel function",
	   options = 
        {		
			{description = "关闭/off", data = 0,hover = "默认关闭/off by default"},
			{description = "默认效率/default", data = 1},
			{description = "10倍效率/10x efficiency", data = 10},
     	 },
	    default = 0,
	
	},
	{
	  name = "peppaaxe",
	  label = "【斧功能/axe】",
	  hover = "peppa步行手杖的斧子功能\nAxe function",
	   options = 
        {		
			{description = "关闭/off", data = 0,hover = "默认关闭/off by default"},
			{description = "默认效率/default", data = 1},
			{description = "5倍效率/5x efficiency", data = 5},
			{description = "15倍效率/15x efficiency", data = 15},
     	 },
	    default = 0,
	
	},
	{
		name = "peppascythe",
		label = "【暗影收割者镰刀/Shadow Reaper】",
		hover = "官方暗影收割者镰刀功能\nShadow Reaper function",
		 options = 
		  {		
			  {description = "关闭/off", data = 0,hover = "默认关闭/off by default"},
			  {description = "开启/on", data = 1},
			},
		  default = 0,
	  
	  },
	{
	  name = "peppabugnet",
	  label = "【捕虫网/bug net】",
	  hover = "peppa步行手杖的捕虫网功能\nBug net function",
	   options = 
        {		
			{description = "关闭/off", data = 0,hover = "默认关闭/off by default"},
			{description = "开启/on", data = 1},
     	 },
	    default = 0,
	
	},
	{
	  name = "peppafishrod",
	  label = "【钓竿/fish rod】",
	  hover = "peppa步行手杖的钓竿功能\nFishing rod function(ponds only)",
	   options = 
        {		
			{description = "关闭/off", data = 0,hover = "默认关闭/off by default"},
			{description = "开启/on", data = 1},
     	 },
	    default = 0,
	
	},
	{
		name = "peppaxiaolv",
		label = "【钓鱼效率选择/fishing efficiency】",
		hover = "钓鱼秒上钩\nInstant fishing",
		options =
		{
			{description = "关闭/off", data = 0,hover = "默认关闭/off by default"},
			{description = "开启/on", data = 1},
		},
		default = 0,
	},
	{
	  name = "peppahoe",
	  label = "【园艺锄/hoe】",
	  hover = "peppa步行手杖的园艺锄功能\nHoe function",
	   options = 
        {		
			{description = "关闭/off", data = 0,hover = "默认关闭/off by default"},
			{description = "默认效率/default", data = 1},
			{description = "一锄九坑/9x efficiency", data = 2},
     	 },
	    default = 0,
	
	},
	{
		name = "peppawater",
		label = "【水壶/watering can】",
		hover = "选择开启步行手杖的水壶功能\nWatering can function",
		options =
		{
			{description = "关闭/off",data = 0},
			{description = "打开/on",data = 1},
		},
		default = 0,
	},
	{
		name = "peppazhaoliao",
		label = "【照料农场/talk to plants】",
		hover = "peppa步行手杖的照料农场配置\nTalking to plants",
		 options = 
		  {		
			  {description = "关闭/off", data = 0,hover = "默认关闭/off by default"},
			  {description = "开启/on", data = 6,hover = "大约2格子地皮/about 2 turf radius"},
			  {description = "全屏照料/full screen", data = 32},
			  
			},
		  default = 0,
	},
	{
		name = "peppaoar",
		label = "【船桨/paddle】",
		hover = "选择步行手杖的船桨功能\nPaddle function",
		options =
		{
			{description = "关闭/off",data = 0},
			{description = "浮木桨/driftwood paddle",data = 1},
			{description = "邪天翁喙/malba paddle",data = 2},
		},
		default = 0,
	},

	{
	  name = "peppaspeed",
	  label = "【移速/speed boost】",
	  hover = "peppa步行手杖的移速配置\nSpeed boost function",
	   options = 
        {		
			{description = "关闭/off", data = 0,hover = "默认关闭/off by default"},
			{description = "150%", data = 1.50},
			{description = "175%", data = 1.75},
			{description = "200%", data = 2.00},
			{description = "225%", data = 2.25},
			{description = "250%", data = 2.50},
			-- {description = "275%", data = 2.75},--游戏限制不能太高
			-- {description = "300%", data = 3.00},
     	 },
	    default = 0,
	
	},
	{
	  name = "peppalight",
	  label = "【发光/glow】",
	  hover = "peppa步行手杖的发光范围配置\nGlowing function",
	   options = 
        {		
			{description = "关闭/off", data = 0,hover = "默认关闭/off by default"},
			{description = "保命微光/no dark death", data = 1},
			{description = "普通范围/5x radius", data = 5},
			{description = "超大范围/10x radius", data = 10},

			
     	 },
	    default = 0,
	},
	
	
	{
	  name = "peppadamage",
	  label = "【伤害/damage】",
	  hover = "peppa步行手杖的伤害配置\nBecome death itself",
	   options = 
        {		
			{description = "关闭/off", data = 0,hover = "默认关闭/off by default"},
			{description = "34", data = 34},
			{description = "51", data = 51},
			{description = "68", data = 68},
			{description = "134", data = 134},
			{description = "9999999", data = 9999999},
     	 },
	    default = 0,
	
	},

	{
		name = "pepparange",
		label = "【攻击距离/attack range】",
		hover = "peppa步行手杖的攻击距离配置\nHolding a 40-meter-long machete xD",
		 options = 
		  {		
			  {description = "关闭/off", data = 0,hover = "默认关闭/off by default"},
			  {description = "两倍距离/2x", data = 2},
			  {description = "三倍距离/3x", data = 3},
			  {description = "四倍距离/4x", data = 4},
			  {description = "五倍距离/5x", data = 5},
			  {description = "六倍距离/6x", data = 6},
			  {description = "七倍距离/7x", data = 7},
			  {description = "八倍距离/8x", data = 8},
			  {description = "九倍距离/9x", data = 9},
			  {description = "十倍距离/10x", data = 10},
			  {description = "十五倍距离/15x", data = 15},
			  {description = "二十倍距离/20x", data = 20},
			},
		  default = 0,
	  
	  },

	{
	  name = "peppadumbbell",
	  label = "【沃尔夫冈哑铃/dumbbell】",
	  hover = "大力士携带移动不掉力量值\nWolfang no mightyness drop",
	   options = 
        {		
			{description = "关闭/off", data = 0,hover = "默认关闭/off by default"},
			{description = "开启/on", data = 1},
     	 },
	    default = 0,
	
	},

	{
		name = "peppabrush",
		label = "【钢羊刷/brush】",
		hover = "选择步行手杖的钢羊刷功能\nBrush beefalo, not your teeth",
		options = 
		{
			{description = "关闭/off",data = 0},
			{description = "打开/on",data = 1},
			
		},
		default = 0,
	},

	{
		name = "peppaxunniu",
		label = "【手杖加速训牛/speed up taming】",
		hover = "是否开启加速训牛的功能\nThey think cane is hot",
		options =
		{
			{description = "关闭/off", data = 0,hover = "关闭/not speeding up at all"},
			{description = "一倍/1x", data = 6,hover = "一倍速度/cane is hot"},
			{description = "两倍/2x", data = 12,hover = "二倍速度/cane is very hot"},
			{description = "五倍/5x", data = 30,hover = "五倍速度/cane is very very very hot"},
			{description = "十倍/10x", data = 60,hover = "十倍速度/WOW!!! You'r a beefalo lord!"},
			{description = "二十倍/20x", data = 120,hover = "二十倍速度/WOW!!! You'r an amazing beefalo god!"},
			{description = "五十倍/50x", data = 300,hover = "五十倍速度/HA! HA! HA! Summon your beefalo!"},
			{description = "一百倍/100x", data = 600,hover = "一百倍速度/WOOHOO!!! Only takes 40 seconds!"},
		},
		default = 0,
	},

	{
	  name = "pepparain",
	  label = "【防雨/no wetness】",
	  hover = "peppa步行手杖的防雨配置\nCane form umbrella",
	   options = 
        {		
			{description = "关闭/off", data = 0,hover = "默认关闭/off by default"},
			{description = "25%", data = 0.25},
			{description = "50%", data = 0.50},
			{description = "75%", data = 0.75},
			{description = "100%", data = 1.00},
     	 },
	    default = 0,
	
	},


	{
	  name = "peppathunder",
	  label = "【防雷/avoid thunder】",
	  hover = "peppa步行手杖的防雷配置\nGod needs to find another Wes",
	   options = 
        {		
			{description = "关闭/off", data = 0,hover = "默认关闭/off by default"},
			{description = "开启/on", data = 1},
     	 },
	    default = 0,
	
	},
	{
		name = "peppafuhuo",
		label = "【作祟重生/haunt to revive】",
		hover = "死亡后可以作祟手杖复活\nHow many skeleton do we have already?",
		options = {
			
			{description = "关闭/off",data = 0},
			{description = "打开/on",data = 1},
		},
		default = 0,
	},
	{
		name = "peppatashui",
		label = "【踏水而行/walk on the sea】",
		hover = "手持手杖可在水上行走\nMama, I saw JESUS!",
		options = {
			
			{description = "关闭/off",data = 0},
			{description = "打开/on",data = 1},
		},
		default = 0,
	},
	{
		name = "peppajicheng",
		label = "【懒人魔杖继承/inherit function】",
		hover = "开启懒人魔杖继承以上所有功能\nInherit all above functions for lazy explorer",
		options =
		{
			{description = "关闭/off",data = 0 ,hover = "默认关闭/off by default"},
			{description = "开启/on",data = 1},


		},
		default = 1,
	},

	{
		name = "peppanaijiu",
		label = "【懒人魔杖耐久/duribility】",
		hover = "选择懒人魔杖的耐久(需要开启上面继承功能才可以生效)\nDurbility for lazy explorer(must enable inherit function to work)",
		options =
		{
			{description = "默认/default", data = 1},
			{description = "40", data = 2},
			{description = "60", data = 3},
			{description = "80", data = 4},
			{description = "100", data = 5},
			{description = "120", data = 6},
			{description = "140", data = 7},
			{description = "160", data = 8},
			{description = "180", data = 9},
			{description = "200", data = 10},
			{description = "永久/infinity", data = 99999},


		},
		default = 1,
	},

	{name = "", label = "【其他功能/other function】", options = {{description = "", data = ""},}, default = "",},

	{
		name = "peppazhanniu",
		label = "【秒骑战牛/ride beef】",
		hover = "骑战牛前无需喂食就能骑\nInstant fighter beefalo ride without feeding",
		options = {
			
			{description = "关闭/off",data = 0},
			{description = "打开/on",data = 1},
		},
		default = 0,
	},
	{
		name = "peppaemo",
		label = "【全图传送/tp everywhere】",
		hover = "全图传送(沃拓克斯和自动寻路模组需卸下手杖/魔杖使用原有灵魂跳跃和寻路避免冲突)--不笑猫\nTo avoid conflicts, wortox or pathfind mod need to unequip cane/staff when using",
		options = {
			
			{description = "关闭/off",data = 0},
			{description = "全部都能传送/both",data = 1,hover = "步行手杖/懒人魔杖都可以传送(both cane and lazy explorer can teleport)"},
			{description = "仅限懒人魔杖/staff only",data = 2,hover = "只有懒人魔杖可以传送(only lazy explorer can teleport)"},
		},
		default = 0,
	},
	{
		name = "peppawendy",
		label = "【温蒂加强/stronger Wendy】",
		hover = "加强弱小的温蒂攻击倍率\nWhen did Wendy got the gym membership card?",
		options = {
			
			{description = "关闭/off(0.75x)",data = 0},
			{description = "1倍攻击倍率/1x",data = 1,hover = "1x wilson"},
			{description = "1.5倍攻击倍率/1.5x",data = 2,hover = "1.5x Wilson"},
			{description = "2倍攻击倍率/2x",data = 3,hover = "WOLFGANG"},
			
		},
		default = 0,
	},
	{
		name = "peppabat",
		label = "【火腿棒加强/enhanced hambat】",
		hover = "火腿棒不会随新鲜度降低伤害\nhambat will not decrease damage with freshness",
		options = {
			
			{description = "关闭/off",data = 0},
			{description = "打开/on",data = 1},
		},
		default = 0,
	},
	{name = "", label = "【薇洛技能加强/enhanced willow】", options = {{description = "", data = ""},}, default = "",},

	{
		name = "weiluo_ember_throw",
		label = "火焰投掷余烬消耗量/Flame Throwing",
		options = 	{
						{description = "正常/Normal", data = 1, hover = "火焰投掷技能正常消耗余烬\nNormal cost ember consumption of Flame Throwing"},
						{description = "零消耗/Zero-Cost", data = 0, hover = "火焰投掷技能零消耗余烬\nZero cost ember consumption of Flame Throwing"}
					},
		default = 1,
	},
	
	{
		name = "weiluo_ember_burst",
		label = "燃烧术余烬消耗量/Spontaneous Combustion",
		options = 	{
						{description = "正常/Normal", data = 4, hover = "燃烧术技能正常消耗余烬\nNormal cost ember consumption of Spontaneous Combustion"},
						{description = "零消耗/Zero-Cost", data = 0, hover = "燃烧术技能零消耗余烬\nZero cost ember consumption of Spontaneous Combustion"}
					},
		default = 4,
	},
	
	{
		name = "weiluo_ember_ball",
		label = "火球术余烬消耗量/FireBall ",
		options = 	{
						{description = "正常/Normal", data = 2, hover = "火球术技能正常消耗余烬\nNormal cost ember consumption of FireBall"},
						{description = "零消耗/Zero-Cost", data = 0, hover = "火球术技能零消耗余烬\nZero cost ember consumption of Fire Ball"}
					},
		default = 2,
	},
	
	{
		name = "weiluo_ember_frenzy",
		label = "狂热焚烧余烬消耗量/FireFrenzy",
		options = 	{
						{description = "正常/Normal", data = 2, hover = "狂热焚烧技能正常消耗余烬\nNormal cost ember consumption of FireFrenzy"},
						{description = "零消耗/Zero-Cost", data = 0, hover = "狂热焚烧技能零消耗余烬\nZero cost ember consumption of FireFrenzy"}
					},
		default = 2,
	},
	
	{
		name = "weiluo_ember_lunar",
		label = "月焰余烬消耗量/Lunar Fire-Raiser",
		options = 	{
						{description = "正常/Normal", data = 5, hover = "月焰技能正常消耗余烬\nNormal cost ember consumption of Lunar Fire-Raiser"},
						{description = "零消耗/Zero-Cost", data = 0, hover = "月焰技能零消耗余烬\nZero cost ember consumption of Lunar Fire-Raiser"}
					},
		default = 5,
	},
	{
		name = "weiluo_lunar_fire_cooldown",
		label = "月焰冷却时间/CD of Lunar Fire",
		options = 	{
						{description = "正常/Normal", data = 13, hover = "月焰技能正常冷却时间\nNormal Cool-Down Time of Lunar Fire-Raiser"},
						{description = "无冷却/NO CD", data = 0, hover = "月焰技能无冷却时间\nZero Cool-Down Time of Lunar Fire-Raiser"}
					},
		default = 13,
	},
	{
		name = "weiluo_ember_shadow",
		label = "影焰余烬消耗量/Shadow Fire-Raiser",
		options = 	{
						{description = "正常/Normal", data = 5, hover = "影焰技能正常消耗余烬\nNormal cost ember consumption of Shadow Fire-Raiser"},
						{description = "零消耗/Zero-Cost", data = 0, hover = "影焰技能零消耗余烬\nZero cost ember consumption of Shadow Fire-Raiser"}
					},
		default = 5,
	},
	{
		name = "weiluo_shadow_fire_cooldown",
		label = "影焰冷却时间/CD of Shadow Fire",
		options = 	{
						{description = "正常/Normal", data = 8, hover = "影焰技能正常冷却时间\nNormal Cool-Down Time of Shadow Fire-Raiser"},
						{description = "无冷却/NO CD", data = 0, hover = "影焰技能无冷却时间\nZero Cool-Down Time of Shadow Fire-Raiser"}
					},
		default = 8,
	},

	
	--{name = "", label = "【多种能力/other ability】", hover = "其他模组若拥有相同功能请一定关闭以下功能防止冲突",options = {{description = "", data = ""},}, default = "",},
	--[[{
		name = "chushi",
		label = "【沃利/Warly】",
		hover = "拥有制作和使用专属厨具的能力\nWarly's crafts and skills",
		options = {
			
			{description = "关闭/off",data = false},
			{description = "打开/on",data = true},
		},
		default = false,
	},
	{
		name = "peppawangda",
		label = "【旺达/Wanda】",
		hover = "拥有制作和使用旺达所有表的能力\nable to make and use all Wanda's watches",
		options = {
			
			{description = "关闭/off",data = false},
			{description = "打开/on",data = true},
		},
		default = false,
	},
	{
		name = "nvgong",
		label = "【薇诺娜/Winona】",
		hover = "拥有制作女工专属物品的能力\nWinona's crafts",
		options = {
			
			{description = "关闭/off",data = false},
			{description = "打开/on",data = true},
		},
		default = false,
	},
	{
		name = "nvwushen",
		label = "【薇格弗德/Wigfrid】",
		hover = "拥有制作战斗头盔和战斗长矛的能力\nWigfrid's crafts",
		options = {
			
			{description = "关闭/off",data = false},
			{description = "打开/on",data = true},
		},
		default = false,
	},
	{
		name = "zhiwuren",
		label = "【沃姆伍德/Wormwood】",
		hover = "拥有制作植物人专属物品和种地的能力\nWormwood's ability and skills",
		options = {
			
			{description = "关闭/off",data = false},
			{description = "打开/on",data = true},
		},
		default = false,
	},
	{
		name = "laonainai",
		label = "【薇克巴顿/Wickerbottom】",
		hover = "拥有制作书籍和读书的能力craft and read\nWhere are all those IQ during finals",
		options = {
			
			{description = "关闭/off",data = false},
			{description = "打开/on",data = true},
		},
		default = false,
	},]]
	
	
	
	
	
	

	

}