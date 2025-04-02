GLOBAL.setmetatable(env,{__index=function(t,k) return GLOBAL.rawget(GLOBAL,k) end}) 

--Cardcaptor Sakura ,ccs,库洛魔法使
--参考了很多其他大佬的写法，注意鉴别！
PrefabFiles = {
	"ccs",
	"ccs_bag",
	"ccs_bag2",
	"ccs_hat1",
	"ccs_magic_wand1",
	"ccs_magic_wand2",
	"ccs_magic_wand3",
	"ccs_fx",
	"ccs_cards",
	"ccs_monster_cards",
	"ccs_buffs",
	"ccs_card_box",
	"ccs_jt",
	--"ccs_chest",
	"ccs_chest2",
	"ccs_chest3",
	"ccs_oven",
	"ccs_skirt1",
	"ccs_sakuras",
	"ccs_amulet",
	"ccs_light",
	"ccs_light3",
	"ccs_tent",
	"ccs_paper",
	"ccs_foods",
	"ccs_xk",
	"ccs_sb",
	"ccs_ice_box",
	"ccs_broom",
	"ccs_piano",
	"ccs_trash",
	"ccs_magic",
	"ccs_fountain",
	"ccs_food_ingredients",
	"ccs_plants",
	"ccs_plant_prd",
	"ccs_street_lamp",
	"ccs_sakura_tree",
	--"ccs_sakura_tree3",
	--"ccs_crystal_tree",
	"ccs_guard",
	"ccs_frog_yf",
	"walls_ccs",
	"ccs_miniboatlantern",
	"ccs_crystallization",
	"ccs_beebox",
	"ccs_butterfly",
	"ccs_flower",
	"ccs_bee",
	"ccs_starstaff",
	"ccs_projectile",
	"ccs_lifestaff",
	"fence_ccsstrawberry",
	"xiaoying_leaf_fx",
	"ccs_chair",
	"ccs_throne",
	"ccs_throne_flower",
	"ccs_treasurechest",
	"ccs_flowerpot",
	"ccs_shipwrecked",
	"brc_swing",
    "brc_swing_double",
    "brc_hotspring",
	"ccs_bunny_fluorescen",
	"ccs_bunny_fluorescen2",
	"ccs_dynamicbag",
	"ccs_dynamicweapon",
	"ccs_cookpot",
	"ccs_cookpot2",
	"ccs_lizifx_ranibowspark",
	"ccs_lizifx_bubble",
	"ccs_self_light"
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/ccs.tex" ), --存档图片
    Asset( "ATLAS", "images/saveslot_portraits/ccs.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/ccs.tex" ), --选择界面图标
    Asset( "ATLAS", "images/selectscreen_portraits/ccs.xml" ),
		
    Asset( "IMAGE", "bigportraits/ccs.tex" ), --人物大图（方形的那个）
    Asset( "ATLAS", "bigportraits/ccs.xml" ),
	Asset( "IMAGE", "bigportraits/shiranui.tex" ), --人物大图（方形的那个）
    Asset( "ATLAS", "bigportraits/shiranui.xml" ),
	Asset( "IMAGE", "bigportraits/daji.tex" ), --人物大图（方形的那个）
    Asset( "ATLAS", "bigportraits/daji.xml" ),
	Asset( "IMAGE", "bigportraits/ccs_skins_bronya.tex" ), --人物大图（方形的那个）
    Asset( "ATLAS", "bigportraits/ccs_skins_bronya.xml" ),
	
	Asset( "IMAGE", "images/map_icons/ccs.tex" ), --小地图
	Asset( "ATLAS", "images/map_icons/ccs.xml" ),
	
	Asset( "IMAGE", "images/map_icons/ccs_jt.tex" ), --小地图
	Asset( "ATLAS", "images/map_icons/ccs_jt.xml" ),
	
	Asset( "IMAGE", "images/map_icons/ccs_light.tex" ), --小地图
	Asset( "ATLAS", "images/map_icons/ccs_light.xml" ),
	
	Asset( "IMAGE", "images/map_icons/ccs_chest.tex" ), --小地图
	Asset( "ATLAS", "images/map_icons/ccs_chest.xml" ),

	Asset( "IMAGE", "images/map_icons/ccs_chest2.tex" ), --小地图
	Asset( "ATLAS", "images/map_icons/ccs_chest2.xml" ),
	
	Asset( "IMAGE", "images/map_icons/ccs_chest3.tex" ), --小地图
	Asset( "ATLAS", "images/map_icons/ccs_chest3.xml" ),
	
	Asset( "IMAGE", "images/map_icons/ccs_oven.tex" ), --小地图
	Asset( "ATLAS", "images/map_icons/ccs_oven.xml" ),
	
	Asset( "IMAGE", "images/map_icons/ccs_tent.tex" ), --小地图
	Asset( "ATLAS", "images/map_icons/ccs_tent.xml" ),
	
	Asset( "IMAGE", "images/map_icons/ccs_ice_box.tex" ), --小地图
	Asset( "ATLAS", "images/map_icons/ccs_ice_box.xml" ),
	
	Asset( "IMAGE", "images/map_icons/ccs_piano.tex" ), --小地图
	Asset( "ATLAS", "images/map_icons/ccs_piano.xml" ),
	
	Asset( "IMAGE", "images/map_icons/ccs_trash.tex" ), --小地图
	Asset( "ATLAS", "images/map_icons/ccs_trash.xml" ),
	
	Asset( "IMAGE", "images/map_icons/ccs_fountain.tex" ), --小地图
	Asset( "ATLAS", "images/map_icons/ccs_fountain.xml" ),

	Asset( "IMAGE", "images/map_icons/shiranui.tex" ), --小地图
	Asset( "ATLAS", "images/map_icons/shiranui.xml" ),
	Asset( "IMAGE", "images/map_icons/ccs_skins_bronya.tex" ), --小地图
	Asset( "ATLAS", "images/map_icons/ccs_skins_bronya.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ccs.tex" ), --tab键人物列表显示的头像
    Asset( "ATLAS", "images/avatars/avatar_ccs.xml" ),
	Asset( "IMAGE", "images/avatars/avatar_shiranui.tex" ), --tab键人物列表显示的头像
    Asset( "ATLAS", "images/avatars/avatar_shiranui.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_ccs.tex" ),--tab键人物列表显示的头像（死亡）
    Asset( "ATLAS", "images/avatars/avatar_ghost_ccs.xml" ),
	Asset( "IMAGE", "images/avatars/avatar_ghost_shiranui.tex" ),--tab键人物列表显示的头像（死亡）
    Asset( "ATLAS", "images/avatars/avatar_ghost_shiranui.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_ccs.tex" ), --人物检查按钮的图片
    Asset( "ATLAS", "images/avatars/self_inspect_ccs.xml" ),
	Asset( "IMAGE", "images/avatars/self_inspect_shiranui.tex" ), --人物检查按钮的图片
    Asset( "ATLAS", "images/avatars/self_inspect_shiranui.xml" ),
	
	Asset( "IMAGE", "images/names_ccs.tex" ),  --人物名字
    Asset( "ATLAS", "images/names_ccs.xml" ),
	
    Asset( "IMAGE", "bigportraits/ccs_none.tex" ),  --人物大图（椭圆的那个）
    Asset( "ATLAS", "bigportraits/ccs_none.xml" ),
	
	Asset("ANIM", "anim/ccs_magic.zip"),
	Asset("ANIM", "anim/player_transparent.zip"), 
	Asset("ANIM", "anim/player_portal_shipwrecked.zip"), 
	Asset("ANIM", "anim/ccs_portal_shipwrecked.zip"), 
	Asset("ANIM", "anim/brc_sit.zip"),

	
	Asset("IMAGE", "images/inventoryimages/ccs_magic.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_magic.xml"),
	
	Asset("IMAGE", "images/inventoryimages/ccs_xk_item.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_xk_item.xml"),
	
	Asset("IMAGE", "images/inventoryimages/ccs_sb_item.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_sb_item.xml"),
	
	Asset("IMAGE", "images/inventoryimages/ccs_piano2.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_piano2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/ccs_tab2.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_tab2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/ccs_tab3.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_tab3.xml"),
	
	Asset("IMAGE", "images/inventoryimages/ccs_tab4.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_tab4.xml"),
	
	--皮肤资源
	Asset("ANIM", "anim/skeletonxk.zip"),
	Asset("ANIM", "anim/skeletonxk2.zip"),
	
	Asset("ANIM", "anim/skeletonsibi.zip"),
	Asset("ANIM", "anim/skeletonsibi2.zip"),
	
	Asset("ANIM", "anim/ccs_hat_skins8.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_hat_skins8.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_hat_skins8.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat_skins8.xml",256),

	Asset("ANIM", "anim/ccs_hat_skin_spring.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_hat_skin_spring.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_hat_skin_spring.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat_skin_spring.xml",256),

	Asset("ANIM", "anim/ccs_hat_skin_cn.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_hat_skin_cn.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_hat_skin_cn.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat_skin_cn.xml",256),

	Asset("ANIM", "anim/ccs_hat_skin_limao.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_hat_skin_limao.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_hat_skin_limao.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat_skin_limao.xml",256),

	Asset("ANIM", "anim/ccs_hat_skin_qqj.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_hat_skin_qqj.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_hat_skin_qqj.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat_skin_qqj.xml",256),

	Asset("ANIM", "anim/ccs_hat_skin_alice.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_hat_skin_alice.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_hat_skin_alice.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat_skin_alice.xml",256),

	Asset("ANIM", "anim/ccs_hat_skin_catear.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_hat_skin_catear.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_hat_skin_catear.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat_skin_catear.xml",256),

	Asset("ANIM", "anim/ccs_hat_skin_bronya.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_hat_skin_bronya.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_hat_skin_bronya.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat_skin_bronya.xml",256),
	
	Asset("ANIM", "anim/ccs_sb_item_skins7.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_sb_item_skins7.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_sb_item_skins7.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sb_item_skins7.xml",256),
	
	Asset("ANIM", "anim/ccs_sb_item_skins8.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_sb_item_skins8.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_sb_item_skins8.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sb_item_skins8.xml",256),

	Asset("ANIM", "anim/ccs_sb_item_skins9.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_sb_item_skins9.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_sb_item_skins9.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sb_item_skins9.xml",256),
	
	Asset("ANIM", "anim/ccs_sb_item_skins10.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_sb_item_skins10.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_sb_item_skins10.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sb_item_skins10.xml",256),

	Asset("ANIM", "anim/ccs_sb_item_skins11.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_sb_item_skins11.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_sb_item_skins11.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sb_item_skins11.xml",256),
	Asset("IMAGE", "images/inventoryimages/ccs_xk_item_skins11.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_xk_item_skins11.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_xk_item_skins11.xml",256),

	Asset("ANIM", "anim/ccs_sb_item_skins12.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_sb_item_skins12.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_sb_item_skins12.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sb_item_skins12.xml",256),
	Asset("IMAGE", "images/inventoryimages/ccs_xk_item_skins12.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_xk_item_skins12.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_xk_item_skins12.xml",256),

	Asset("ANIM", "anim/ccs_sb_item_skins13.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_sb_item_skins13.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_sb_item_skins13.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sb_item_skins13.xml",256),
	Asset("IMAGE", "images/inventoryimages/ccs_xk_item_skins13.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_xk_item_skins13.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_xk_item_skins13.xml",256),

	Asset("ANIM", "anim/ccs_sb_item_skins14.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_sb_item_skins14.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_sb_item_skins14.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sb_item_skins14.xml",256),
	Asset("ANIM", "anim/ccs_xk_item_skins14.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_xk_item_skins14.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_xk_item_skins14.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_xk_item_skins14.xml",256),

	Asset("ANIM", "anim/ccs_sb_item_skins15.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_sb_item_skins15.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_sb_item_skins15.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sb_item_skins15.xml",256),
	Asset("IMAGE", "images/inventoryimages/ccs_xk_item_skins15.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_xk_item_skins15.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_xk_item_skins15.xml",256),

	Asset("ANIM", "anim/ccs_sb_item_skins16.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_sb_item_skins16.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_sb_item_skins16.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sb_item_skins16.xml",256),
	Asset("IMAGE", "images/inventoryimages/ccs_xk_item_skins16.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_xk_item_skins16.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_xk_item_skins16.xml",256),

	Asset("ANIM", "anim/ui_xksb_blue.zip"),
	Asset("ANIM", "anim/ccs_sb_item_skins17.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_sb_item_skins17.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_sb_item_skins17.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sb_item_skins17.xml",256),
	Asset("IMAGE", "images/inventoryimages/ccs_xk_item_skins17.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_xk_item_skins17.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_xk_item_skins17.xml",256),

	Asset("ANIM", "anim/ui_xksb_black.zip"),
	Asset("ANIM", "anim/ccs_sb_item_skins18.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_sb_item_skins18.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_sb_item_skins18.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sb_item_skins18.xml",256),
	Asset("IMAGE", "images/inventoryimages/ccs_xk_item_skins18.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_xk_item_skins18.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_xk_item_skins18.xml",256),
	
	Asset("ANIM", "anim/ccs_xk_item_sxz_skins.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_sb_item_sxz_skins1.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_sb_item_sxz_skins1.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sb_item_sxz_skins1.xml",256),
	
	Asset("IMAGE", "images/inventoryimages/ccs_sb_item_sxz_skins2.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_sb_item_sxz_skins2.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sb_item_sxz_skins2.xml",256),
	
	Asset("IMAGE", "images/inventoryimages/ccs_sb_item_sxz_skins3.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_sb_item_sxz_skins3.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sb_item_sxz_skins3.xml",256),
	
	Asset("ANIM", "anim/ccs_miniboatlantern_skins1.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_miniboatlantern_skins1.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_miniboatlantern_skins1.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_miniboatlantern_skins1.xml",256),
	
	Asset( "IMAGE", "bigportraits/ccs_skins1.tex" ),  
    Asset( "ATLAS", "bigportraits/ccs_skins1.xml" ),
	
	Asset( "IMAGE", "bigportraits/ccs_skins2.tex" ),  
    Asset( "ATLAS", "bigportraits/ccs_skins2.xml" ),
	
	Asset("ANIM", "anim/ccs_hat1_skins1.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_hat1_skins1.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_hat1_skins1.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat1_skins1.xml",256),
    
	Asset("ANIM", "anim/ccs_hat1_skins2.zip"),
	Asset("IMAGE", "images/inventoryimages/ccs_hat1_skins2.tex"),
	Asset("ATLAS", "images/inventoryimages/ccs_hat1_skins2.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat1_skins2.xml",256),
    
	Asset("ANIM", "anim/ccs_bag_skins1.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_bag_skins1.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_bag_skins1.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_bag_skins1.xml",256),
    
	Asset("ANIM", "anim/ccs_bag_skins2.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_bag_skins2.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_bag_skins2.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/ccs_bag_skins2.xml",256),
    
	Asset("ANIM", "anim/ccs_bag_skins3.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_bag_skins3.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_bag_skins3.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_bag_skins3.xml",256),

	Asset("ANIM", "anim/ccs_bag_skins4.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_bag_skins4.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_bag_skins4.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_bag_skins4.xml",256),

	Asset("ANIM", "anim/ccs_bag_skins5.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_bag_skins5.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_bag_skins5.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_bag_skins5.xml",256),

	Asset("ANIM", "anim/ccs_bag_skin_limao.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_bag_skin_limao.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_bag_skin_limao.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_bag_skin_limao.xml",256),

	Asset("ANIM", "anim/ccs_bag_skin_hanbao.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_bag_skin_hanbao.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_bag_skin_hanbao.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_bag_skin_hanbao.xml",256),
	
	Asset("ANIM", "anim/ccs_magic_wand1_skins1.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_magic_wand1_skins1.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_magic_wand1_skins1.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_magic_wand1_skins1.xml",256),

	Asset("ANIM", "anim/ccs_magic_wand1_skin_moon.zip"), 
	Asset("ANIM", "anim/ccs_magic_wand1_skin_cat.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_magic_wand1_skin_moon.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_magic_wand1_skin_moon.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_magic_wand1_skin_moon.xml",256),
	
	Asset("ANIM", "anim/ccs_magic_wand2_skins1.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_magic_wand2_skins1.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_magic_wand2_skins1.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_magic_wand2_skins1.xml",256),

	Asset("ANIM", "anim/ccs_magic_wand2_skin_cat.zip"), 
	Asset("ANIM", "anim/ccs_magic_wand2_skin_moon.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_magic_wand2_skin_cat.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_magic_wand2_skin_cat.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_magic_wand2_skin_cat.xml",256),
	
	Asset("ANIM", "anim/ccs_bag_skins4.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_bag_skins4.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_bag_skins4.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_bag_skins4.xml",256),

	Asset("ANIM", "anim/ccs_bag_skin_white.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_bag_skin_white.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_bag_skin_white.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_bag_skin_white.xml",256),

	Asset("ANIM", "anim/ccs_bag_skin_chikawa1.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_bag_skin_chikawa1.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_bag_skin_chikawa1.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_bag_skin_chikawa1.xml",256),

	Asset("ANIM", "anim/ccs_bag_skin_chikawa2.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_bag_skin_chikawa2.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_bag_skin_chikawa2.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_bag_skin_chikawa2.xml",256),

	Asset("ANIM", "anim/ccs_bag_skin_chikawa3.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_bag_skin_chikawa3.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_bag_skin_chikawa3.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_bag_skin_chikawa3.xml",256),
	
	Asset("ANIM", "anim/ccs_xk_skins1.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_xk_skins1.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_xk_skins1.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_xk_skins1.xml",256),
	
	Asset("ANIM", "anim/ccs_sb_skins1.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_sb_skins1.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_sb_skins1.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sb_skins1.xml",256),
	
	Asset("ANIM", "anim/ccs_magic_wand3_skins1.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_magic_wand3_skins1.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_magic_wand3_skins1.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_magic_wand3_skins1.xml",256),
	
	Asset("ANIM", "anim/ccs_magic_wand3_skins2.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_magic_wand3_skins2.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_magic_wand3_skins2.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_magic_wand3_skins2.xml",256),

	Asset("ANIM", "anim/ccs_magic_wand3_skins3.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_magic_wand3_skins3.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_magic_wand3_skins3.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_magic_wand3_skins3.xml",256),

	Asset("ANIM", "anim/ccs_magic_wand3_skins4.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_magic_wand3_skins4.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_magic_wand3_skins4.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_magic_wand3_skins4.xml",256),

	Asset("ANIM", "anim/ccs_magic_wand3_skins5.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_magic_wand3_skins5.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_magic_wand3_skins5.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_magic_wand3_skins5.xml",256),

	Asset("ANIM", "anim/ccs_magic_wand3_skins6.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_magic_wand3_skins6.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_magic_wand3_skins6.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_magic_wand3_skins6.xml",256),

	Asset("ANIM", "anim/ccs_magic_wand3_skins7.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_magic_wand3_skins7.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_magic_wand3_skins7.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_magic_wand3_skins7.xml",256),

	Asset("ANIM", "anim/ccs_magic_wand3_skins8.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_magic_wand3_skins8.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_magic_wand3_skins8.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_magic_wand3_skins8.xml",256),

	Asset("ANIM", "anim/ccs_magic_wand3_skins9.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_magic_wand3_skins9.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_magic_wand3_skins9.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_magic_wand3_skins9.xml",256),

	Asset("ANIM", "anim/ccs_sword_skins2.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_sword_skins2.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_sword_skins2.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sword_skins2.xml",256),

	Asset("ANIM", "anim/ccs_sword_skins3.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_sword_skins3.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_sword_skins3.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sword_skins3.xml",256),

	Asset("ANIM", "anim/ccs_sword_skins4.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_sword_skins4.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_sword_skins4.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sword_skins4.xml",256),

	Asset("ANIM", "anim/ccs_sword_skins5.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_sword_skins5.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_sword_skins5.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sword_skins5.xml",256),

	Asset("ANIM", "anim/ccs_sword_skins6.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_sword_skins6.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_sword_skins6.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sword_skins6.xml",256),

	Asset("ANIM", "anim/ccs_sword_skin_qingying.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_sword_skin_qingying.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_sword_skin_qingying.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sword_skin_qingying.xml",256),

	Asset("ANIM", "anim/ccs_starstaff_skin_flower.zip"),  --地上的动画
	Asset("ATLAS", "images/inventoryimages/ccs_starstaff_skin_flower.xml"), --加载物品栏贴图
    Asset("IMAGE", "images/inventoryimages/ccs_starstaff_skin_flower.tex"),
	Asset("ANIM", "anim/ccs_starstaff_skin1.zip"),  --地上的动画
	Asset("ATLAS", "images/inventoryimages/ccs_starstaff_skin1.xml"), --加载物品栏贴图
    Asset("IMAGE", "images/inventoryimages/ccs_starstaff_skin1.tex"),
	Asset("ANIM", "anim/ccs_starstaff_skin_snow.zip"),  --地上的动画
	Asset("ATLAS", "images/inventoryimages/ccs_starstaff_skin_snow.xml"), --加载物品栏贴图
    Asset("IMAGE", "images/inventoryimages/ccs_starstaff_skin_snow.tex"),
	
	Asset("ANIM", "anim/ccs_hat_skins3.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_hat_skins3.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_hat_skins3.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat_skins3.xml",256),
	
	Asset("ANIM", "anim/ccs_hat_skins4.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_hat_skins4.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_hat_skins4.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat_skins4.xml",256),
	
	Asset("ANIM", "anim/ccs_hat_skins6.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_hat_skins6.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_hat_skins6.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat_skins6.xml",256),
	
	Asset("ANIM", "anim/ccs_hat_skins7.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_hat_skins7.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_hat_skins7.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat_skins7.xml",256),

	Asset("ANIM", "anim/ccs_hat_skin_kioku.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_hat_skin_kioku.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_hat_skin_kioku.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat_skin_kioku.xml",256),

	Asset("ANIM", "anim/ccs_hat_skin_star.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_hat_skin_star.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_hat_skin_star.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat_skin_star.xml",256),

	Asset("ANIM", "anim/ccs_hat_skin_chuqing.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_hat_skin_chuqing.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_hat_skin_chuqing.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat_skin_chuqing.xml",256),

	Asset("ANIM", "anim/ccs_hat_skin_white.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_hat_skin_white.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_hat_skin_white.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat_skin_white.xml",256),

	Asset("ANIM", "anim/ccs_hat_skin_lotus.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_hat_skin_lotus.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_hat_skin_lotus.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_hat_skin_lotus.xml",256),
	
	Asset("ANIM", "anim/ccs_light3_skins1.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_light3_skins1.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_light3_skins1.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_light3_skins1.xml",256),
	
	Asset("ANIM", "anim/ccs_light3_skins2.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_light3_skins2.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_light3_skins2.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_light3_skins2.xml",256),
	
	Asset("ANIM", "anim/ccs_sword_skins1.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_sword_skins1.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_sword_skins1.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sword_skins1.xml",256),

	Asset("ANIM", "anim/ccs_bow_skin_rain.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_bow_skin_rain.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_bow_skin_rain.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_bow_skin_rain.xml",256),

	Asset("ANIM", "anim/ccs_bow_skin_madoka.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_bow_skin_madoka.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_bow_skin_madoka.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_bow_skin_madoka.xml",256),

	Asset("ANIM", "anim/ccs_bow_skin_amosi.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_bow_skin_amosi.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_bow_skin_amosi.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_bow_skin_amosi.xml",256),
	
	Asset("ANIM", "anim/ccs_light_skins1.zip"), 
	
	Asset("ANIM", "anim/ccs_sb_item.zip"), 
	Asset("ANIM", "anim/ccs_sb_item_skins1.zip"), 
	Asset("ANIM", "anim/ccs_xk_item_skins1.zip"), 
	
	Asset("ANIM", "anim/ccs_xk_item_skins2.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_xk_item_skins2.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_xk_item_skins2.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_xk_item_skins2.xml",256),
	
	Asset("ANIM", "anim/ccs_sb_item_skins2.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_sb_item_skins2.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_sb_item_skins2.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_sb_item_skins2.xml",256),
	
	Asset("ANIM", "anim/ccs_skirt_skins1.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_skirt_skins1.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_skirt_skins1.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_skirt_skins1.xml",256),

	Asset("ANIM", "anim/ccs_skirt_skin_xigewen.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_skirt_skin_xigewen.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_skirt_skin_xigewen.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_skirt_skin_xigewen.xml",256),

	Asset("ANIM", "anim/ccs_skirt_skin_madoka.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_skirt_skin_madoka.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_skirt_skin_madoka.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_skirt_skin_madoka.xml",256),

	-- Asset("ANIM", "anim/ccs_skirt_skin_flower.zip"), 
	-- Asset("IMAGE", "images/inventoryimages/ccs_skirt_skin_flower.tex"), 
	-- Asset("ATLAS", "images/inventoryimages/ccs_skirt_skin_flower.xml"),
    -- Asset("ATLAS_BUILD", "images/inventoryimages/ccs_skirt_skin_flower.xml",256),

	Asset("ANIM", "anim/ccs_street_lamp_skin1.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_street_lamp_skin1.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_street_lamp_skin1.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_street_lamp_skin1.xml",256),

	Asset("ANIM", "anim/ccs_flowerpot_skin1.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_flowerpot_skin1.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_flowerpot_skin1.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_flowerpot_skin1.xml",256),

	Asset("ANIM", "anim/ccs_flowerpot_skin2.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_flowerpot_skin2.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_flowerpot_skin2.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_flowerpot_skin2.xml",256),

	Asset("ANIM", "anim/ccs_flowerpot_skin3.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_flowerpot_skin3.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_flowerpot_skin3.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_flowerpot_skin3.xml",256),

	Asset("ANIM", "anim/ccs_flowerpot_skin4.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_flowerpot_skin4.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_flowerpot_skin4.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_flowerpot_skin4.xml",256),

	Asset("ANIM", "anim/ccs_ice_box_skin1.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_ice_box_skin1.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_ice_box_skin1.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_ice_box_skin1.xml",256),

	Asset("ANIM", "anim/ccs_ice_box_skin2.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_ice_box_skin2.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_ice_box_skin2.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_ice_box_skin2.xml",256),

	Asset("ANIM", "anim/ccs_ice_box_skin3.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_ice_box_skin3.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_ice_box_skin3.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_ice_box_skin3.xml",256),

	Asset("ANIM", "anim/ccs_trash_skin1.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_trash_skin1.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_trash_skin1.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_trash_skin1.xml",256),

	Asset("ANIM", "anim/ccs_trash_skin2.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_trash_skin2.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_trash_skin2.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_trash_skin2.xml",256),

	Asset("ANIM", "anim/ccs_trash_skin3.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_trash_skin3.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_trash_skin3.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_trash_skin3.xml",256),

	Asset("ANIM", "anim/ccs_guard_skin1.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_guard_skin1.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_guard_skin1.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_guard_skin1.xml",256),

	Asset("ANIM", "anim/ccs_guard_skin2.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_guard_skin2.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_guard_skin2.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_guard_skin2.xml",256),

	Asset("ANIM", "anim/ccs_jt_skins1.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_jt_skins1.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_jt_skins1.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_jt_skins1.xml",256),

	Asset("ANIM", "anim/ccs_jt_skins2.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_jt_skins2.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_jt_skins2.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_jt_skins2.xml",256),

	Asset("ANIM", "anim/ccs_jt_skins3.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_jt_skins3.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_jt_skins3.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_jt_skins3.xml",256),

	Asset("ANIM", "anim/ccs_jt_skins4.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_jt_skins4.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_jt_skins4.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_jt_skins4.xml",256),

	Asset("ANIM", "anim/ccs_amulet_skin1.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_amulet_skin1.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_amulet_skin1.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_amulet_skin1.xml",256),
	Asset("ANIM", "anim/ccs_amulet_skin2.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_amulet_skin2.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_amulet_skin2.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_amulet_skin2.xml",128),
	Asset("ANIM", "anim/ccs_amulet_skin3.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_amulet_skin3.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_amulet_skin3.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_amulet_skin3.xml",256),

	Asset("ANIM", "anim/shiranui_fan.zip"),  --动画文件
	Asset("IMAGE", "images/inventoryimages/shiranui_fan.tex"), --物品栏贴图
	Asset("ATLAS", "images/inventoryimages/shiranui_fan.xml"),

	Asset("ANIM", "anim/ccs_pack_gift_skin1.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_pack_gift_skin1.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_pack_gift_skin1.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_pack_gift_skin1.xml",256),
	Asset("ANIM", "anim/ccs_pack_gift_skin2.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_pack_gift_skin2.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_pack_gift_skin2.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_pack_gift_skin2.xml",256),
	Asset("ANIM", "anim/ccs_pack_gift_skin3.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_pack_gift_skin3.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_pack_gift_skin3.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_pack_gift_skin3.xml",256),
	Asset("ANIM", "anim/ccs_pack_gift_skin4.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_pack_gift_skin4.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_pack_gift_skin4.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_pack_gift_skin4.xml",256),
	Asset("ANIM", "anim/ccs_pack_gift_skin5.zip"), 
	Asset("IMAGE", "images/inventoryimages/ccs_pack_gift_skin5.tex"), 
	Asset("ATLAS", "images/inventoryimages/ccs_pack_gift_skin5.xml"),
    Asset("ATLAS_BUILD", "images/inventoryimages/ccs_pack_gift_skin5.xml",256),

	Asset("ANIM", "anim/ccs_cookpot_skin_green.zip"),
	Asset("ATLAS", "images/inventoryimages/ccs_cookpot_skin_green.xml"), 
    Asset("IMAGE", "images/inventoryimages/ccs_cookpot_skin_green.tex"),
	Asset("ANIM", "anim/ccs_cookpot_skin_purple.zip"),
	Asset("ATLAS", "images/inventoryimages/ccs_cookpot_skin_purple.xml"), 
    Asset("IMAGE", "images/inventoryimages/ccs_cookpot_skin_purple.tex"),

	Asset("ANIM", "anim/ccs_cookpot2_skin_rabbit.zip"),
	Asset("ATLAS", "images/inventoryimages/ccs_cookpot2_skin_rabbit.xml"), 
    Asset("IMAGE", "images/inventoryimages/ccs_cookpot2_skin_rabbit.tex"),

	Asset("ANIM", "anim/ccs_cookpot2_skin_white.zip"),
	Asset("ATLAS", "images/inventoryimages/ccs_cookpot2_skin_white.xml"), 
    Asset("IMAGE", "images/inventoryimages/ccs_cookpot2_skin_white.tex"),

	Asset("ANIM", "anim/ccs_cards_21_skins1.zip"),
	Asset("ATLAS", "images/inventoryimages/ccs_cards_21_skins1.xml"), 
    Asset("IMAGE", "images/inventoryimages/ccs_cards_21_skins1.tex"),
	
	Asset("ANIM", "anim/ccs_shield_fx.zip"), 
	
	Asset("ANIM", "anim/skeletonjy.zip"),
	Asset("ANIM", "anim/skeletonjy2.zip"),
	Asset("ANIM", "anim/skeletonwsq.zip"),
	Asset("ANIM", "anim/skeletonwsq2.zip"),
	Asset("ANIM", "anim/skeletonxb.zip"),
	Asset("ANIM", "anim/skeletonxb2.zip"),

}

AddMinimapAtlas("images/map_icons/ccs.xml")  --增加小地图图标
AddMinimapAtlas("images/map_icons/ccs_jt.xml") 
AddMinimapAtlas("images/map_icons/ccs_light.xml") 
AddMinimapAtlas("images/map_icons/ccs_chest.xml") 
AddMinimapAtlas("images/map_icons/ccs_chest2.xml") 
AddMinimapAtlas("images/map_icons/ccs_chest3.xml") 
AddMinimapAtlas("images/map_icons/ccs_tent.xml") 
AddMinimapAtlas("images/map_icons/ccs_oven.xml") 
AddMinimapAtlas("images/map_icons/ccs_ice_box.xml") 
AddMinimapAtlas("images/map_icons/ccs_piano.xml")
AddMinimapAtlas("images/map_icons/ccs_trash.xml")
AddMinimapAtlas("images/map_icons/ccs_fountain.xml")
AddMinimapAtlas("images/map_icons/shiranui.xml")
AddMinimapAtlas("images/map_icons/ccs_skins_bronya.xml")

AddModCharacter("ccs", "FEMALE") 	

GLOBAL.CCSAPI = env
modimport("scripts/ccs_string")
modimport("scripts/ccs_tuning")
modimport("scripts/ccs_main/ccs_api")
modimport("scripts/ccs_main/ccs_magic")
modimport("scripts/ccs_main/ccs_tech")
modimport("scripts/ccs_recipes")
modimport("scripts/ccs_main/ccs_action")
modimport("scripts/ccs_main/ccs_sg")
modimport("scripts/ccs_main/ccs_containers")
modimport("scripts/ccs_main/ccs_skin_ownership")
modimport("scripts/ccs_main/ccs_skin")
modimport("scripts/ccs_main/ccs_skin_list")
modimport("scripts/ccs_main/ccs_text")
modimport("scripts/ccs_main/ccs_rpc")
modimport("scripts/ccs_foods")
modimport("scripts/ccs_turf")

if TUNING.CCS_CARD14_ENBLE then
	modimport("scripts/ccs_main/ccs_time_stop")
end


AddReplicableComponent("ccs_card_level")
AddReplicableComponent("ccs_magic")
AddReplicableComponent("ccs_flying")
AddReplicableComponent("ccs_pack")



local function setLight(inst)
	local owner = inst.components.inventoryitem ~= nil and inst.components.inventoryitem.owner or nil

	if owner ~= nil then
		if inst._light ~= nil and inst._light:IsValid() then
			inst._light.entity:SetParent(owner.entity)
			if inst.components.equippable ~= nil and inst.components.equippable:IsEquipped() then
				if TheWorld ~= nil and TheWorld.state ~= nil and TheWorld.state.isnight then
					inst._light.Light:Enable(true)
				else
					inst._light.Light:Enable(false)
				end
			else
				inst._light.Light:Enable(false)
			end
		end
	else
		if inst._light ~= nil and inst._light:IsValid() then
			inst._light.entity:SetParent(inst.entity)
			inst._light.Light:Enable(true)
		end
	end
end

local function onRemove(inst)
	if inst._light ~= nil then
		if inst._light:IsValid() then
			inst._light:Remove()
		end
		inst._light = nil
	end
end