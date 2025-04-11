local function CcsItemSkin2(item,name, data, notemp)
    local d = {}
    d.rarity = "木之本樱"
    d.rarityorder = 2
	d.raritycorlor = { 0/255, 255/255, 249/255, 1 }
    d.release_group = -1001
	-- d.checkfn = CCSAPI.CcsSkinCheckFn
    -- d.checkclientfn = CCSAPI.CcsSkinCheckClientFn
    d.FrameSymbol = "Reward"
    for k, v in pairs(data) do
        d[k] = v
    end
    CCSAPI.MakeItemSkin(item, name, d)
    -- if not notemp then
    --     local d2 = shallowcopy(d)
    --     d2.rarity = "限时体验"
    --     d2.rarityorder = 80
    --     d2.raritycorlor = {0.957, 0.769, 0.188, 1}
    --     d2.FrameSymbol = "heirloom"
    --     d2.name = data.name .. "(限时)"
    --     CCSAPI.MakeItemSkin(item, name .. "_tmp", d2)
    -- end
end

local function CcsItemSkin(item,name, data, notemp)
    local d = {}
    d.rarity = "木之本樱"
    d.rarityorder = 2
	d.raritycorlor = { 0/255, 255/255, 249/255, 1 }
    d.release_group = -1001
    d.FrameSymbol = "Reward"
    d.checkfn = CCSAPI.CcsSkinCheckFn
    d.checkclientfn = CCSAPI.CcsSkinCheckClientFn
    for k, v in pairs(data) do
        d[k] = v
    end
    CCSAPI.MakeItemSkin(item, name, d)
end

CcsItemSkin("ccs_hat1","ccs_hat1_skins1",{
            name = "学生帽",
            atlas = "images/inventoryimages/ccs_hat1_skins1.xml",
            image = "ccs_hat1_skins1",
            build = "ccs_hat1_skins1",
            bank =  "ccs_hat1_skins1",
            basebuild = "ccs_hat1",
            basebank =  "ccs_hat1",
        })

CcsItemSkin2("ccs_hat1","ccs_hat1_skins2_yx",{
            name = "隐形帽子",
            atlas = "images/inventoryimages/ccs_hat1.xml",
            image = "ccs_hat1",
            build = "ccs_hat1",
            bank =  "ccs_hat1",
            basebuild = "ccs_hat1",
            basebank =  "ccs_hat1",
        })
		
CCSAPI.MakeItemSkin("ccs_light","ccs_light_skins1",{
            name = "",
            atlas = "images/inventoryimages/ccs_light.xml",
            image = "ccs_light",
            build = "ccs_light_skins1",
            bank =  "ccs_light_skins1",
            basebuild = "ccs_light",
            basebank =  "ccs_light",
        })
		
CCSAPI.MakeItemSkin("ccs_light2","ccs_light2_skins1",{
            name = "",
            atlas = "images/inventoryimages/ccs_light.xml",
            image = "ccs_light",
            build = "ccs_light_skins1",
            bank =  "ccs_light_skins1",
            basebuild = "ccs_light",
            basebank =  "ccs_light",
        })

CCSAPI.MakeItemSkinDefaultImage('ccs_bag', 'images/inventoryimages/ccs_bag.xml', 'ccs_bag')
CcsItemSkin("ccs_bag","ccs_bag_skins1",{
            name = "友枝学校背包",
            atlas = "images/inventoryimages/ccs_bag_skins1.xml",
            image = "ccs_bag_skins1",
            build = "ccs_bag_skins1",
            bank =  "ccs_bag_skins1",
            basebuild = "ccs_bag",
            basebank =  "ccs_bag",
        })

CcsItemSkin("ccs_bag","ccs_bag_skins2",{
            name = "樱花之翼",
            atlas = "images/inventoryimages/ccs_bag_skins2.xml",
            image = "ccs_bag_skins2",
            build = "ccs_bag_skins2",
            bank =  "ccs_bag_skins2",
            basebuild = "ccs_bag",
            basebank =  "ccs_bag",
        })

CcsItemSkin("ccs_bag","shiranui_fan",{
            name = "定制-不知火",
            atlas = "images/inventoryimages/shiranui_fan.xml",
            image = "shiranui_fan",
            build = "shiranui_fan",
            bank =  "shiranui_fan",
            basebuild = "ccs_bag",
            basebank =  "ccs_bag",
        })
CcsItemSkin("ccs_bag","ccs_bag_skin_limao",{
            name = "礼帽",
            atlas = "images/inventoryimages/ccs_bag_skin_limao.xml",
            image = "ccs_bag_skin_limao",
            build = "ccs_bag_skin_limao",
            bank =  "ccs_bag_skin_limao",
            basebuild = "ccs_bag",
            basebank =  "ccs_bag",
        })
CcsItemSkin("ccs_bag","ccs_bag_skin_white",{
            name = "白色蝴蝶结",
            atlas = "images/inventoryimages/ccs_bag_skin_white.xml",
            image = "ccs_bag_skin_white",
            build = "ccs_bag_skin_white",
            bank =  "ccs_bag_skin_white",
            basebuild = "ccs_bag",
            basebank =  "ccs_bag",
        })
		
CcsItemSkin("ccs_magic_wand1","ccs_magic_wand1_skins1",{
            name = "知世的手杖",
            atlas = "images/inventoryimages/ccs_magic_wand1_skins1.xml",
            image = "ccs_magic_wand1_skins1",
            build = "ccs_magic_wand1_skins1",
            bank =  "ccs_magic_wand1_skins1",
            basebuild = "ccs_magic_wand1",
            basebank =  "ccs_magic_wand1",
        })
CcsItemSkin("ccs_magic_wand1","ccs_magic_wand1_skin_moon",{
            name = "定制：夜含",
            atlas = "images/inventoryimages/ccs_magic_wand1_skin_moon.xml",
            image = "ccs_magic_wand1_skin_moon",
            build = "ccs_magic_wand1_skin_moon",
            bank =  "ccs_magic_wand1_skin_moon",
            basebuild = "ccs_magic_wand1",
            basebank =  "ccs_magic_wand1",
        })
CCSAPI.MakeItemSkin(
            'ccs_magic_wand1',
            'ccs_magic_wand1_skin_cat',
            {
                name = "定制：玲珑",
                atlas = "images/inventoryimages/ccs_magic_wand2_skin_cat.xml",
                image = "ccs_magic_wand2_skin_cat",
                build = "ccs_magic_wand1_skin_cat",
                bank =  "ccs_magic_wand1_skin_cat",
                basebuild = "ccs_magic_wand1",
                basebank =  "ccs_magic_wand1",
                checkfn = function (inventory, name)
                    return CCSAPI.CcsSkinCheckFn(inventory, "ccs_magic_wand2_skin_cat")
                end,
                checkclientfn = function (inventory, userid, name)
                    return CCSAPI.CcsSkinCheckClientFn(inventory, userid, "ccs_magic_wand2_skin_cat")
                end
            }
        )

CcsItemSkin("ccs_magic_wand2","ccs_magic_wand2_skins1",{
            name = "樱花法杖",
            atlas = "images/inventoryimages/ccs_magic_wand2_skins1.xml",
            image = "ccs_magic_wand2_skins1",
            build = "ccs_magic_wand2_skins1",
            bank =  "ccs_magic_wand2_skins1",
            basebuild = "ccs_magic_wand2",
            basebank =  "ccs_magic_wand2",
        })
CcsItemSkin("ccs_magic_wand2","ccs_magic_wand2_skin_cat",{
            name = "定制：玲珑",
            atlas = "images/inventoryimages/ccs_magic_wand2_skin_cat.xml",
            image = "ccs_magic_wand2_skin_cat",
            build = "ccs_magic_wand2_skin_cat",
            bank =  "ccs_magic_wand2_skin_cat",
            basebuild = "ccs_magic_wand2",
            basebank =  "ccs_magic_wand2",
        })
CcsItemSkin("ccs_magic_wand2","ccs_magic_wand2_skin_yingcao",{
            name = "定制：萤草",
            atlas = "images/inventoryimages/ccs_magic_wand2_skin_yingcao.xml",
            image = "ccs_magic_wand2_skin_yingcao",
            build = "ccs_magic_wand2_skin_yingcao",
            bank =  "ccs_magic_wand2_skin_yingcao",
            basebuild = "ccs_magic_wand2",
            basebank =  "ccs_magic_wand2",
        })
CCSAPI.MakeItemSkin(
            'ccs_magic_wand2',
            'ccs_magic_wand2_skin_moon',
            {
                name = "定制：夜含",
                atlas = "images/inventoryimages/ccs_magic_wand1_skin_moon.xml",
                image = "ccs_magic_wand1_skin_moon",
                build = "ccs_magic_wand2_skin_moon",
                bank =  "ccs_magic_wand2_skin_moon",
                basebuild = "ccs_magic_wand2",
                basebank =  "ccs_magic_wand2",
                checkfn = function (inventory, name)
                    return CCSAPI.CcsSkinCheckFn(inventory, "ccs_magic_wand1_skin_moon")
                end,
                checkclientfn = function (inventory, userid, name)
                    return CCSAPI.CcsSkinCheckClientFn(inventory, userid, "ccs_magic_wand1_skin_moon")
                end
            }
        )
		
CcsItemSkin("ccs_bag","ccs_bag_skins3",{
            name = "知世做的翅膀",
            atlas = "images/inventoryimages/ccs_bag_skins3.xml",
            image = "ccs_bag_skins3",
            build = "ccs_bag_skins3",
            bank =  "ccs_bag_skins3",
            basebuild = "ccs_bag",
            basebank =  "ccs_bag",
        })
		
CcsItemSkin("ccs_bag","ccs_bag_skins4",{
            name = "天使之翼",
            atlas = "images/inventoryimages/ccs_bag_skins4.xml",
            image = "ccs_bag_skins4",
            build = "ccs_bag_skins4",
            bank =  "ccs_bag_skins4",
            basebuild = "ccs_bag",
            basebank =  "ccs_bag",
        })

CcsItemSkin("ccs_bag","ccs_bag_skins5",{
            name = "桃花包",
            atlas = "images/inventoryimages/ccs_bag_skins5.xml",
            image = "ccs_bag_skins5",
            build = "ccs_bag_skins5",
            bank =  "ccs_bag_skins5",
            basebuild = "ccs_bag",
            basebank =  "ccs_bag",
        })
CcsItemSkin("ccs_bag","ccs_bag_skin_dinosaur",{
            name = "定制：恐龙扛喵",
            atlas = "images/inventoryimages/ccs_bag_skin_dinosaur.xml",
            image = "ccs_bag_skin_dinosaur",
            build = "ccs_bag_skin_dinosaur",
            bank =  "ccs_bag_skin_dinosaur",
            basebuild = "ccs_bag",
            basebank =  "ccs_bag",
            init_fn = function(inst)
                if inst._state then
                    inst._state:set(2)
                    inst.components.container:WidgetSetup("ccs_dinosaur_bag")
                    inst.components.container:Close()
                end
            end,
            clear_fn = function(inst)
                inst._state:set(1)
                inst.components.container:WidgetSetup("ccs_bag")
                inst.components.container:Close()
            end,
        })

CcsItemSkin("ccs_bag","ccs_bag_skin_hanbao",{
            name = "定制：憨包",
            atlas = "images/inventoryimages/ccs_bag_skin_hanbao.xml",
            image = "ccs_bag_skin_hanbao",
            build = "ccs_bag_skin_hanbao",
            bank =  "ccs_bag_skin_hanbao",
            basebuild = "ccs_bag",
            basebank =  "ccs_bag",
            init_fn = function(inst)
                if inst._state then
                    inst._state:set(3)
                    inst.components.container:WidgetSetup("ccs_hanbao_bag")
                    inst.components.container:Close()
                end
            end,
            clear_fn = function(inst)
                inst._state:set(1)
                inst.components.container:WidgetSetup("ccs_bag")
                inst.components.container:Close()
            end,
        })
CcsItemSkin("ccs_bag","ccs_bag_skin_chikawa1",{
            name = "chikawa1",
            atlas = "images/inventoryimages/ccs_bag_skin_chikawa1.xml",
            image = "ccs_bag_skin_chikawa1",
            build = "ccs_bag_skin_chikawa1",
            bank =  "ccs_bag_skin_chikawa1",
            basebuild = "ccs_bag",
            basebank =  "ccs_bag",
        })
CcsItemSkin("ccs_bag","ccs_bag_skin_chikawa2",{
            name = "chikawa2",
            atlas = "images/inventoryimages/ccs_bag_skin_chikawa2.xml",
            image = "ccs_bag_skin_chikawa2",
            build = "ccs_bag_skin_chikawa2",
            bank =  "ccs_bag_skin_chikawa2",
            basebuild = "ccs_bag",
            basebank =  "ccs_bag",
        })
CcsItemSkin("ccs_bag","ccs_bag_skin_chikawa3",{
            name = "chikawa3",
            atlas = "images/inventoryimages/ccs_bag_skin_chikawa3.xml",
            image = "ccs_bag_skin_chikawa3",
            build = "ccs_bag_skin_chikawa3",
            bank =  "ccs_bag_skin_chikawa3",
            basebuild = "ccs_bag",
            basebank =  "ccs_bag",
        })
-- CcsItemSkin("ccs_hat1","ccs_hat1_skins2",{
--             name = "魔女战斗帽",
--             atlas = "images/inventoryimages/ccs_hat1_skins2.xml",
--             image = "ccs_hat1_skins2",
--             build = "ccs_hat1_skins2",
--             bank =  "ccs_hat1_skins2",
--             basebuild = "ccs_hat1",
--             basebank =  "ccs_hat1",
--         })
CCSAPI.MakeItemSkinDefaultImage('ccs_starstaff', 'images/inventoryimages/ccs_starstaff.xml', 'ccs_starstaff')
CcsItemSkin("ccs_starstaff","ccs_starstaff_skin_flower",{
    name = "花朵法杖",
    atlas = "images/inventoryimages/ccs_starstaff_skin_flower.xml",
    image = "ccs_starstaff_skin_flower",
    build = "ccs_starstaff_skin_flower",
    bank =  "ccs_starstaff_skin_flower",
    basebuild = "ccs_starstaff",
    basebank =  "ccs_starstaff",
})
CcsItemSkin("ccs_starstaff","ccs_starstaff_skin1",{
    name = "定制-胡桃夹子",
    atlas = "images/inventoryimages/ccs_starstaff_skin1.xml",
    image = "ccs_starstaff_skin1",
    build = "ccs_starstaff_skin1",
    bank =  "ccs_starstaff_skin1",
    basebuild = "ccs_starstaff",
    basebank =  "ccs_starstaff",
})
CcsItemSkin("ccs_starstaff","ccs_starstaff_skin_snow",{
    name = "定制-凝霜",
    atlas = "images/inventoryimages/ccs_starstaff_skin_snow.xml",
    image = "ccs_starstaff_skin_snow",
    build = "ccs_starstaff_skin_snow",
    bank =  "ccs_starstaff_skin_snow",
    basebuild = "ccs_starstaff",
    basebank =  "ccs_starstaff",
    clear_fn = function (inst)
        inst:RemoveTag("snowlizifx")
    end,
    init_fn = function (inst)
        inst:AddTag("snowlizifx")
    end
})
CcsItemSkin("ccs_starstaff","ccs_magic_wand3_skins9",{
    name = "定制-知更鸟法杖",
    atlas = "images/inventoryimages/ccs_magic_wand3_skins9.xml",
    image = "ccs_magic_wand3_skins9",
    build = "ccs_magic_wand3_skins9",
    bank =  "ccs_magic_wand3_skins9",
    basebuild = "ccs_starstaff",
    basebank =  "ccs_starstaff",
    clear_fn = function (inst)
        inst:RemoveTag("harlequinlizifx")
    end,
    init_fn = function (inst)
        inst:AddTag("harlequinlizifx")
    end
})
		
CCSAPI.MakeItemSkinDefaultImage('ccs_magic_wand3', 'images/inventoryimages/ccs_magic_wand3.xml', 'ccs_magic_wand3')
CcsItemSkin("ccs_magic_wand3","ccs_magic_wand3_skins1",{
            name = "星光法杖",
            atlas = "images/inventoryimages/ccs_magic_wand3_skins1.xml",
            image = "ccs_magic_wand3_skins1",
            build = "ccs_magic_wand3_skins1",
            bank =  "ccs_magic_wand3_skins1",
            basebuild = "ccs_magic_wand3",
            basebank =  "ccs_magic_wand3",
        })
		
CcsItemSkin("ccs_magic_wand3","ccs_magic_wand3_skins2",{
            name = "星月法杖",
            atlas = "images/inventoryimages/ccs_magic_wand3_skins2.xml",
            image = "ccs_magic_wand3_skins2",
            build = "ccs_magic_wand3_skins2",
            bank =  "ccs_magic_wand3_skins2",
            basebuild = "ccs_magic_wand3",
            basebank =  "ccs_magic_wand3",
        })

CcsItemSkin("ccs_magic_wand3","ccs_magic_wand3_skins3",{
            name = "玉桂伞",
            atlas = "images/inventoryimages/ccs_magic_wand3_skins3.xml",
            image = "ccs_magic_wand3_skins3",
            build = "ccs_magic_wand3_skins3",
            bank =  "ccs_magic_wand3_skins3",
            basebuild = "ccs_magic_wand3",
            basebank =  "ccs_magic_wand3",
        })

CcsItemSkin("ccs_magic_wand3","ccs_magic_wand3_skins4",{
            name = "定制-绝代制杖",
            atlas = "images/inventoryimages/ccs_magic_wand3_skins4.xml",
            image = "ccs_magic_wand3_skins4",
            build = "ccs_magic_wand3_skins4",
            bank =  "ccs_magic_wand3_skins4",
            basebuild = "ccs_magic_wand3",
            basebank =  "ccs_magic_wand3",
            clear_fn = function (inst)
                inst:RemoveTag("greenleaffx")
            end,
            init_fn = function (inst)
                inst:AddTag("greenleaffx")
            end
        })

CcsItemSkin("ccs_magic_wand3","ccs_magic_wand3_skins5",{
            name = "定制-心向标仪",
            atlas = "images/inventoryimages/ccs_magic_wand3_skins5.xml",
            image = "ccs_magic_wand3_skins5",
            build = "ccs_magic_wand3_skins5",
            bank =  "ccs_magic_wand3_skins5",
            basebuild = "ccs_magic_wand3",
            basebank =  "ccs_magic_wand3",
        })
CcsItemSkin("ccs_magic_wand3","ccs_magic_wand3_skins6",{
            name = "定制-救济",
            atlas = "images/inventoryimages/ccs_magic_wand3_skins6.xml",
            image = "ccs_magic_wand3_skins6",
            build = "ccs_magic_wand3_skins6",
            bank =  "ccs_magic_wand3_skins6",
            basebuild = "ccs_magic_wand3",
            basebank =  "ccs_magic_wand3",
        })
CcsItemSkin("ccs_magic_wand3","ccs_magic_wand3_skins7",{
            name = "定制-朝露",
            atlas = "images/inventoryimages/ccs_magic_wand3_skins7.xml",
            image = "ccs_magic_wand3_skins7",
            build = "ccs_magic_wand3_skins7",
            bank =  "ccs_magic_wand3_skins7",
            basebuild = "ccs_magic_wand3",
            basebank =  "ccs_magic_wand3",
            clear_fn = function (inst)
                inst:RemoveTag("bubblefx")
            end,
            init_fn = function (inst)
                inst:AddTag("bubblefx")
            end
        })
CcsItemSkin("ccs_magic_wand3","ccs_magic_wand3_skins8",{
            name = "定制-天使的花束",
            atlas = "images/inventoryimages/ccs_magic_wand3_skins8.xml",
            image = "ccs_magic_wand3_skins8",
            build = "ccs_magic_wand3_skins8",
            bank =  "ccs_magic_wand3_skins8",
            basebuild = "ccs_magic_wand3",
            basebank =  "ccs_magic_wand3",
        })

CCSAPI.MakeItemSkinDefaultImage('ccs_xk_item', 'images/inventoryimages/ccs_pack_gift.xml', 'ccs_pack_gift')
CcsItemSkin("ccs_xk_item","ccs_xk_item_skins1",{
            name = "甜品小可",
            atlas = "images/inventoryimages/ccs_xk_skins1.xml",
            image = "ccs_xk_skins1",
            build = "ccs_xk_item_skins1",
            bank =  "ccs_xk_item_skins1",
            basebuild = "ccs_pack_gift",
            basebank =  "ccs_pack_gift",
        })
		
CcsItemSkin("ccs_xk_item","ccs_xk_item_skins2",{
            name = "游戏机小可",
            atlas = "images/inventoryimages/ccs_xk_item_skins2.xml",
            image = "ccs_xk_item_skins2",
            build = "ccs_xk_item_skins2",
            bank =  "ccs_xk_item_skins2",
            basebuild = "ccs_pack_gift",
            basebank =  "ccs_pack_gift",
        })
		
CcsItemSkin("ccs_xk_item","ccs_xk_item_skins3",{
            name = "天使小可",
            atlas = "images/inventoryimages/ccs_xk_item_skins2.xml",
            image = "ccs_xk_item_skins2",
            build = "ccs_xk_item_skins2",
            bank =  "ccs_xk_item_skins2",
            basebuild = "ccs_pack_gift",
            basebank =  "ccs_pack_gift",
        })
    
CcsItemSkin("ccs_xk_item","ccs_xk_item_skins10",{
            name = "定制-天之幼子",
            atlas = "images/inventoryimages/ccs_sb_item_skins10.xml",
            image = "ccs_sb_item_skins10",
            build = "ccs_sb_item_skins10",
            bank =  "ccs_sb_item_skins10",
            basebuild = "ccs_pack_gift",
            basebank =  "ccs_pack_gift",
        })

CcsItemSkin("ccs_xk_item","ccs_xk_item_skins11",{
            name = "定制-大耳兽",
            atlas = "images/inventoryimages/ccs_xk_item_skins11.xml",
            image = "ccs_xk_item_skins11",
            build = "ccs_sb_item_skins11",
            bank =  "ccs_sb_item_skins11",
            basebuild = "ccs_pack_gift",
            basebank =  "ccs_pack_gift",
        })

CcsItemSkin("ccs_xk_item","ccs_xk_item_skins12",{
            name = "定制-火灵",
            atlas = "images/inventoryimages/ccs_xk_item_skins12.xml",
            image = "ccs_xk_item_skins12",
            build = "ccs_sb_item_skins12",
            bank =  "ccs_sb_item_skins12",
            basebuild = "ccs_pack_gift",
            basebank =  "ccs_pack_gift",
        })

CcsItemSkin("ccs_xk_item","ccs_xk_item_skins13",{
            name = "定制-人鱼之歌",
            atlas = "images/inventoryimages/ccs_xk_item_skins13.xml",
            image = "ccs_xk_item_skins13",
            build = "ccs_sb_item_skins13",
            bank =  "ccs_sb_item_skins13",
            basebuild = "ccs_pack_gift",
            basebank =  "ccs_pack_gift",
        })

CcsItemSkin("ccs_xk_item","ccs_xk_item_skins14",{
            name = "定制-熊仔",
            atlas = "images/inventoryimages/ccs_xk_item_skins14.xml",
            image = "ccs_xk_item_skins14",
            build = "ccs_xk_item_skins14",
            bank =  "ccs_xk_item_skins14",
            basebuild = "ccs_pack_gift",
            basebank =  "ccs_pack_gift",
        })
CcsItemSkin("ccs_xk_item","ccs_xk_item_skins15",{
            name = "定制-蔡文姬",
            atlas = "images/inventoryimages/ccs_xk_item_skins15.xml",
            image = "ccs_xk_item_skins15",
            build = "ccs_sb_item_skins15",
            bank =  "ccs_sb_item_skins15",
            basebuild = "ccs_pack_gift",
            basebank =  "ccs_pack_gift",
        })
CcsItemSkin("ccs_xk_item","ccs_xk_item_skins16",{
            name = "定制-瑶",
            atlas = "images/inventoryimages/ccs_xk_item_skins16.xml",
            image = "ccs_xk_item_skins16",
            build = "ccs_sb_item_skins16",
            bank =  "ccs_sb_item_skins16",
            basebuild = "ccs_pack_gift",
            basebank =  "ccs_pack_gift",
        })

CcsItemSkin("ccs_xk_item","ccs_xk_item_skins17",{
            name = "定制-海獭",
            atlas = "images/inventoryimages/ccs_xk_item_skins17.xml",
            image = "ccs_xk_item_skins17",
            build = "ccs_sb_item_skins17",
            bank =  "ccs_sb_item_skins17",
            basebuild = "ccs_pack_gift",
            basebank =  "ccs_pack_gift",
        })
CcsItemSkin("ccs_xk_item","ccs_xk_item_skins18",{
            name = "定制-喵鲨",
            atlas = "images/inventoryimages/ccs_xk_item_skins18.xml",
            image = "ccs_xk_item_skins18",
            build = "ccs_sb_item_skins18",
            bank =  "ccs_sb_item_skins18",
            basebuild = "ccs_pack_gift",
            basebank =  "ccs_pack_gift",
        })

CCSAPI.MakeItemSkinDefaultImage('ccs_sb_item', 'images/inventoryimages/ccs_sb_item.xml', 'ccs_sb_item')
CcsItemSkin("ccs_sb_item","ccs_sb_item_skins1",{
            name = "宝石斯比",
            atlas = "images/inventoryimages/ccs_sb_skins1.xml",
            image = "ccs_sb_skins1",
            build = "ccs_sb_item_skins1",
            bank =  "ccs_sb_item_skins1",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })
		
CcsItemSkin("ccs_sb_item","ccs_sb_item_skins2",{
            name = "恶魔斯比",
            atlas = "images/inventoryimages/ccs_sb_item_skins2.xml",
            image = "ccs_sb_item_skins2",
            build = "ccs_sb_item_skins2",
            bank =  "ccs_sb_item_skins2",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })
		
CcsItemSkin("ccs_sb_item","ccs_sb_item_skins3",{
            name = "大恶魔斯比",
            atlas = "images/inventoryimages/ccs_sb_item_skins2.xml",
            image = "ccs_sb_item_skins2",
            build = "ccs_sb_item_skins2",
            bank =  "ccs_sb_item_skins2",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })

CcsItemSkin("ccs_sb_item","ccs_sb_item_skins10",{
            name = "定制-天之幼子",
            atlas = "images/inventoryimages/ccs_sb_item_skins10.xml",
            image = "ccs_sb_item_skins10",
            build = "ccs_sb_item_skins10",
            bank =  "ccs_sb_item_skins10",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })

CcsItemSkin("ccs_sb_item","ccs_sb_item_skins11",{
            name = "定制-大耳兽",
            atlas = "images/inventoryimages/ccs_sb_item_skins11.xml",
            image = "ccs_sb_item_skins11",
            build = "ccs_sb_item_skins11",
            bank =  "ccs_sb_item_skins11",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })

CcsItemSkin("ccs_sb_item","ccs_sb_item_skins12",{
            name = "定制-火灵",
            atlas = "images/inventoryimages/ccs_sb_item_skins12.xml",
            image = "ccs_sb_item_skins12",
            build = "ccs_sb_item_skins12",
            bank =  "ccs_sb_item_skins12",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })

CcsItemSkin("ccs_sb_item","ccs_sb_item_skins13",{
            name = "定制-人鱼之歌",
            atlas = "images/inventoryimages/ccs_sb_item_skins13.xml",
            image = "ccs_sb_item_skins13",
            build = "ccs_sb_item_skins13",
            bank =  "ccs_sb_item_skins13",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })

CcsItemSkin("ccs_sb_item","ccs_sb_item_skins14",{
            name = "定制-瑞兔",
            atlas = "images/inventoryimages/ccs_sb_item_skins14.xml",
            image = "ccs_sb_item_skins14",
            build = "ccs_sb_item_skins14",
            bank =  "ccs_sb_item_skins14",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })
CcsItemSkin("ccs_sb_item","ccs_sb_item_skins15",{
            name = "定制-蔡文姬",
            atlas = "images/inventoryimages/ccs_sb_item_skins15.xml",
            image = "ccs_sb_item_skins15",
            build = "ccs_sb_item_skins15",
            bank =  "ccs_sb_item_skins15",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })
CcsItemSkin("ccs_sb_item","ccs_sb_item_skins16",{
            name = "定制-瑶",
            atlas = "images/inventoryimages/ccs_sb_item_skins16.xml",
            image = "ccs_sb_item_skins16",
            build = "ccs_sb_item_skins16",
            bank =  "ccs_sb_item_skins16",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })
CcsItemSkin("ccs_sb_item","ccs_sb_item_skins17",{
            name = "定制-海獭",
            atlas = "images/inventoryimages/ccs_sb_item_skins17.xml",
            image = "ccs_sb_item_skins17",
            build = "ccs_sb_item_skins17",
            bank =  "ccs_sb_item_skins17",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })
CcsItemSkin("ccs_sb_item","ccs_sb_item_skins18",{
            name = "定制-喵鲨",
            atlas = "images/inventoryimages/ccs_sb_item_skins18.xml",
            image = "ccs_sb_item_skins18",
            build = "ccs_sb_item_skins18",
            bank =  "ccs_sb_item_skins18",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })
CcsItemSkin("ccs_sb_item","ccs_sb_item_skins19",{
            name = "小小樱-你瞅啥",
            atlas = "images/inventoryimages/ccs_sb_item_skins19.xml",
            image = "ccs_sb_item_skins19",
            build = "ccs_sb_item_skins19",
            bank =  "ccs_sb_item_skins19",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
})
CcsItemSkin("ccs_sb_item","ccs_sb_item_skins20",{
    name = "小小樱-哼 鬼东西",
    atlas = "images/inventoryimages/ccs_sb_item_skins20.xml",
    image = "ccs_sb_item_skins20",
    build = "ccs_sb_item_skins20",
    bank =  "ccs_sb_item_skins20",
    basebuild = "ccs_sb_item",
    basebank =  "ccs_sb_item",
})

CcsItemSkin("ccs_sb_item","ccs_sb_item_skins_appale",{
    name = "定制：太阳果",
    atlas = "images/inventoryimages/ccs_sb_item_skins_appale.xml",
    image = "ccs_sb_item_skins_appale",
    build = "ccs_sb_item_skins_appale",
    bank =  "ccs_sb_item_skins_appale",
    basebuild = "ccs_sb_item",
    basebank =  "ccs_sb_item",
})

CcsItemSkin("ccs_sb_item","ccs_sb_item_skins_appale2",{
    name = "定制：开心果",
    atlas = "images/inventoryimages/ccs_sb_item_skins_appale2.xml",
    image = "ccs_sb_item_skins_appale2",
    build = "ccs_sb_item_skins_appale2",
    bank =  "ccs_sb_item_skins_appale2",
    basebuild = "ccs_sb_item",
    basebank =  "ccs_sb_item",
})

CCSAPI.MakeItemSkinDefaultImage('ccs_flowerpot', 'images/inventoryimages/ccs_flowerpot.xml', 'ccs_flowerpot')
CcsItemSkin2("ccs_flowerpot","ccs_flowerpot_skin1",{
                    name = "魔法花盆",
                    atlas = "images/inventoryimages/ccs_flowerpot_skin1.xml",
                    image = "ccs_flowerpot_skin1",
                    build = "ccs_flowerpot_skin1",
                    bank =  "ccs_flowerpot_skin1",
                    basebuild = "ccs_flowerpot",
                    basebank =  "ccs_flowerpot",
                })
CcsItemSkin2("ccs_flowerpot","ccs_flowerpot_skin2",{
                    name = "魔法花盆",
                    atlas = "images/inventoryimages/ccs_flowerpot_skin2.xml",
                    image = "ccs_flowerpot_skin2",
                    build = "ccs_flowerpot_skin2",
                    bank =  "ccs_flowerpot_skin2",
                    basebuild = "ccs_flowerpot",
                    basebank =  "ccs_flowerpot",
                })
CcsItemSkin2("ccs_flowerpot","ccs_flowerpot_skin3",{
                    name = "魔法花盆",
                    atlas = "images/inventoryimages/ccs_flowerpot_skin3.xml",
                    image = "ccs_flowerpot_skin3",
                    build = "ccs_flowerpot_skin3",
                    bank =  "ccs_flowerpot_skin3",
                    basebuild = "ccs_flowerpot",
                    basebank =  "ccs_flowerpot",
                })
CcsItemSkin2("ccs_flowerpot","ccs_flowerpot_skin4",{
                    name = "魔法花盆",
                    atlas = "images/inventoryimages/ccs_flowerpot_skin4.xml",
                    image = "ccs_flowerpot_skin4",
                    build = "ccs_flowerpot_skin4",
                    bank =  "ccs_flowerpot_skin4",
                    basebuild = "ccs_flowerpot",
                    basebank =  "ccs_flowerpot",
                })

CCSAPI.MakeItemSkinDefaultImage('ccs_hat1', 'images/inventoryimages/ccs_hat1.xml', 'ccs_hat1')
CcsItemSkin("ccs_hat1","ccs_hat_skins3",{
            name = "樱の簪花",
            atlas = "images/inventoryimages/ccs_hat_skins3.xml",
            image = "ccs_hat_skins3",
            build = "ccs_hat_skins3",
            bank =  "ccs_hat_skins3",
            basebuild = "ccs_hat1",
            basebank =  "ccs_hat1",
        })
		
CcsItemSkin("ccs_hat1","ccs_hat_skins4",{
            name = "98颗星星",
            atlas = "images/inventoryimages/ccs_hat_skins4.xml",
            image = "ccs_hat_skins4",
            build = "ccs_hat_skins4",
            bank =  "ccs_hat_skins4",
            basebuild = "ccs_hat1",
            basebank =  "ccs_hat1",
        })
		
CcsItemSkin("ccs_hat1","ccs_hat_skins5",{
            name = "98颗流星",
            atlas = "images/inventoryimages/ccs_hat_skins4.xml",
            image = "ccs_hat_skins4",
            build = "ccs_hat_skins4",
            bank =  "ccs_hat_skins4",
            basebuild = "ccs_hat1",
            basebank =  "ccs_hat1",
        })
		
CcsItemSkin("ccs_hat1","ccs_hat_skins6",{
            name = "红桃王冠",
            atlas = "images/inventoryimages/ccs_hat_skins6.xml",
            image = "ccs_hat_skins6",
            build = "ccs_hat_skins6",
            bank =  "ccs_hat_skins6",
            basebuild = "ccs_hat1",
            basebank =  "ccs_hat1",
        })
		
CcsItemSkin("ccs_hat1","ccs_hat_skins7",{
            name = "星星王冠",
            atlas = "images/inventoryimages/ccs_hat_skins7.xml",
            image = "ccs_hat_skins7",
            build = "ccs_hat_skins7",
            bank =  "ccs_hat_skins7",
            basebuild = "ccs_hat1",
            basebank =  "ccs_hat1",
        })
		
CcsItemSkin("ccs_hat1","ccs_hat_skins8",{
            name = "格格帽",
            atlas = "images/inventoryimages/ccs_hat_skins8.xml",
            image = "ccs_hat_skins8",
            build = "ccs_hat_skins8",
            bank =  "ccs_hat_skins8",
            basebuild = "ccs_hat1",
            basebank =  "ccs_hat1",
        })

CcsItemSkin2("ccs_hat1","ccs_hat_skin_cn",{
            name = "中华娘",
            atlas = "images/inventoryimages/ccs_hat_skin_cn.xml",
            image = "ccs_hat_skin_cn",
            build = "ccs_hat_skin_cn",
            bank =  "ccs_hat_skin_cn",
            basebuild = "ccs_hat1",
            basebank =  "ccs_hat1",
        })

CcsItemSkin("ccs_hat1","ccs_hat_kinomoto",{
            name = "定制：Kinomoto",
            atlas = "images/inventoryimages/ccs_hat_kinomoto.xml",
            image = "ccs_hat_kinomoto",
            build = "ccs_hat_kinomoto",
            bank =  "ccs_hat_kinomoto",
            basebuild = "ccs_hat1",
            basebank =  "ccs_hat1",
        })

CcsItemSkin("ccs_hat1","ccs_hat_skins_pinkcollege",{
            name = "粉色学院帽",
            atlas = "images/inventoryimages/ccs_hat_skins_pinkcollege.xml",
            image = "ccs_hat_skins_pinkcollege",
            build = "ccs_hat_skins_pinkcollege",
            bank =  "ccs_hat_skins_pinkcollege",
            basebuild = "ccs_hat1",
            basebank =  "ccs_hat1",
        })
        
CcsItemSkin("ccs_hat1","ccs_hat_skin_spring",{
    name = "春之樱",
    atlas = "images/inventoryimages/ccs_hat_skin_spring.xml",
    image = "ccs_hat_skin_spring",
    build = "ccs_hat_skin_spring",
    bank =  "ccs_hat_skin_spring",
    basebuild = "ccs_hat1",
    basebank =  "ccs_hat1",
})   

CcsItemSkin("ccs_hat1","ccs_hat_skin_limao",{
    name = "礼帽",
    atlas = "images/inventoryimages/ccs_hat_skin_limao.xml",
    image = "ccs_hat_skin_limao",
    build = "ccs_hat_skin_limao",
    bank =  "ccs_hat_skin_limao",
    basebuild = "ccs_hat1",
    basebank =  "ccs_hat1",
})

CcsItemSkin("ccs_hat1","ccs_hat_skin_qqj",{
    name = "定制：千千绝",
    atlas = "images/inventoryimages/ccs_hat_skin_qqj.xml",
    image = "ccs_hat_skin_qqj",
    build = "ccs_hat_skin_qqj",
    bank =  "ccs_hat_skin_qqj",
    basebuild = "ccs_hat1",
    basebank =  "ccs_hat1",
})

CcsItemSkin("ccs_hat1","ccs_hat_skin_alice",{
    name = "爱丽丝",
    atlas = "images/inventoryimages/ccs_hat_skin_alice.xml",
    image = "ccs_hat_skin_alice",
    build = "ccs_hat_skin_alice",
    bank =  "ccs_hat_skin_alice",
    basebuild = "ccs_hat1",
    basebank =  "ccs_hat1",
})

CcsItemSkin("ccs_hat1","ccs_hat_skin_catear",{
    name = "粉色猫耳",
    atlas = "images/inventoryimages/ccs_hat_skin_catear.xml",
    image = "ccs_hat_skin_catear",
    build = "ccs_hat_skin_catear",
    bank =  "ccs_hat_skin_catear",
    basebuild = "ccs_hat1",
    basebank =  "ccs_hat1",
})

CcsItemSkin("ccs_hat1","ccs_hat_skin_kioku",{
    name = "定制：小小回忆",
    atlas = "images/inventoryimages/ccs_hat_skin_kioku.xml",
    image = "ccs_hat_skin_kioku",
    build = "ccs_hat_skin_kioku",
    bank =  "ccs_hat_skin_kioku",
    basebuild = "ccs_hat1",
    basebank =  "ccs_hat1",
})

CcsItemSkin("ccs_hat1","ccs_hat_skin_star",{
    name = "星河入梦",
    atlas = "images/inventoryimages/ccs_hat_skin_star.xml",
    image = "ccs_hat_skin_star",
    build = "ccs_hat_skin_star",
    bank =  "ccs_hat_skin_star",
    basebuild = "ccs_hat1",
    basebank =  "ccs_hat1",
    clear_fn = function (inst)
        inst.AnimState:PlayAnimation("idle")
    end,
    init_fn = function (inst)
        inst.AnimState:PlayAnimation("idle", true)
    end
})

CcsItemSkin("ccs_hat1","ccs_hat_skin_bronya",{
    name = "定制：蝴蝶结丝带",
    atlas = "images/inventoryimages/ccs_hat_skin_bronya.xml",
    image = "ccs_hat_skin_bronya",
    build = "ccs_hat_skin_bronya",
    bank =  "ccs_hat_skin_bronya",
    basebuild = "ccs_hat1",
    basebank =  "ccs_hat1",
    clear_fn = function (inst)
        inst.AnimState:PlayAnimation("idle")
    end,
    init_fn = function (inst)
        inst.AnimState:PlayAnimation("idle", true)
    end
})

CcsItemSkin("ccs_hat1","ccs_hat_skin_chuqing",{
    name = "定制：初晴",
    atlas = "images/inventoryimages/ccs_hat_skin_chuqing.xml",
    image = "ccs_hat_skin_chuqing",
    build = "ccs_hat_skin_chuqing",
    bank =  "ccs_hat_skin_chuqing",
    basebuild = "ccs_hat1",
    basebank =  "ccs_hat1",
})
CcsItemSkin("ccs_hat1","ccs_hat_skin_white",{
    name = "白色头冠",
    atlas = "images/inventoryimages/ccs_hat_skin_white.xml",
    image = "ccs_hat_skin_white",
    build = "ccs_hat_skin_white",
    bank =  "ccs_hat_skin_white",
    basebuild = "ccs_hat1",
    basebank =  "ccs_hat1",
})
CcsItemSkin("ccs_hat1","ccs_hat_skin_lotus",{
    name = "荷花",
    atlas = "images/inventoryimages/ccs_hat_skin_lotus.xml",
    image = "ccs_hat_skin_lotus",
    build = "ccs_hat_skin_lotus",
    bank =  "ccs_hat_skin_lotus",
    basebuild = "ccs_hat1",
    basebank =  "ccs_hat1",
})

CcsItemSkin("ccs_hat1","ccs_hat_zr",{
    name = "灼蕊",
    atlas = "images/inventoryimages/ccs_hat_zr.xml",
    image = "ccs_hat_zr",
    build = "ccs_hat_zr",
    bank =  "ccs_hat_zr",
    basebuild = "ccs_hat1",
    basebank =  "ccs_hat1",
})

CcsItemSkin("ccs_light3","ccs_light3_skins1",{
            name = "森林里的星星",
            atlas = "images/inventoryimages/ccs_light3_skins1.xml",
            image = "ccs_light3_skins1",
            build = "ccs_light3_skins1",
            bank =  "ccs_light3_skins1",
            basebuild = "ccs_light3",
            basebank =  "ccs_light3",
            clear_fn = function (inst)
                inst.AnimState:PlayAnimation("idle")
            end,
            init_fn = function (inst)
                inst.AnimState:PlayAnimation("idle", true)
            end
        })

CcsItemSkin2("ccs_light3","ccs_light3_skins2",{
            name = "小可的灯",
            atlas = "images/inventoryimages/ccs_light3_skins2.xml",
            image = "ccs_light3_skins2",
            build = "ccs_light3_skins2",
            bank =  "ccs_light3_skins2",
            basebuild = "ccs_light3",
            basebank =  "ccs_light3",
        })
		
CcsItemSkin2("ccs_miniboatlantern","ccs_miniboatlantern_skins1",{
            name = "水灯2",
            atlas = "images/inventoryimages/ccs_miniboatlantern_skins1.xml",
            image = "ccs_miniboatlantern_skins1",
            build = "ccs_miniboatlantern_skins1",
            bank =  "ccs_miniboatlantern_skins1",
            basebuild = "ccs_miniboatlantern",
            basebank =  "ccs_miniboatlantern",
        })
		
CCSAPI.MakeItemSkinDefaultImage('ccs_cards_12', 'images/inventoryimages/ccs_cards/ccs_cards_12.xml', 'ccs_cards_12')
CcsItemSkin("ccs_cards_12","ccs_sword_skins1",{
            name = "冰花之剑",
            atlas = "images/inventoryimages/ccs_sword_skins1.xml",
            image = "ccs_sword_skins1",
            build = "ccs_sword_skins1",
            bank =  "ccs_sword_skins1",
            basebuild = "ccs_cards",
            basebank =  "ccs_cards",
        })

CcsItemSkin("ccs_cards_12","ccs_sword_skins2",{
            name = "定制-一念花开",
            atlas = "images/inventoryimages/ccs_sword_skins2.xml",
            image = "ccs_sword_skins2",
            build = "ccs_sword_skins2",
            bank =  "ccs_sword_skins2",
            basebuild = "ccs_cards",
            basebank =  "ccs_cards",
        })
        
CcsItemSkin("ccs_cards_12","ccs_sword_skins3",{
            name = "定制-青霜之刃",
            atlas = "images/inventoryimages/ccs_sword_skins3.xml",
            image = "ccs_sword_skins3",
            build = "ccs_sword_skins3",
            bank =  "ccs_sword_skins3",
            basebuild = "ccs_cards",
            basebank =  "ccs_cards",
        })

CcsItemSkin("ccs_cards_12","ccs_sword_skins4",{
            name = "定制-闇一文字",
            atlas = "images/inventoryimages/ccs_sword_skins4.xml",
            image = "ccs_sword_skins4",
            build = "ccs_sword_skins4",
            bank =  "ccs_sword_skins4",
            basebuild = "ccs_cards",
            basebank =  "ccs_cards",
        })
CcsItemSkin("ccs_cards_12","ccs_sword_skin_qingying",{
            name = "定制-清影",
            atlas = "images/inventoryimages/ccs_sword_skin_qingying.xml",
            image = "ccs_sword_skin_qingying",
            build = "ccs_sword_skin_qingying",
            bank =  "ccs_sword_skin_qingying",
            basebuild = "ccs_cards",
            basebank =  "ccs_cards",
        })
CcsItemSkin("ccs_cards_12","ccs_sword_skins6",{
            name = "定制-擷生之径",
            atlas = "images/inventoryimages/ccs_sword_skins6.xml",
            image = "ccs_sword_skins6",
            build = "ccs_sword_skins6",
            bank =  "ccs_sword_skins6",
            basebuild = "ccs_cards",
            basebank =  "ccs_cards",
        })
CCSAPI.MakeItemSkin(
            'ccs_cards_12',
            'ccs_sword_skins5',
            {
                name = "定制-救济",
                atlas = "images/inventoryimages/ccs_sword_skins5.xml",
                image = "ccs_sword_skins5",
                build = "ccs_sword_skins5",
                bank =  "ccs_sword_skins5",
                basebuild = "ccs_cards",
                basebank =  "ccs_cards",
                checkfn = function (inventory, name)
                    return CCSAPI.CcsSkinCheckFn(inventory, "ccs_magic_wand3_skins6")
                end,
                checkclientfn = function (inventory, userid, name)
                    return CCSAPI.CcsSkinCheckClientFn(inventory, userid, "ccs_magic_wand3_skins6")
                end
            }
        )

CCSAPI.MakeItemSkinDefaultImage('ccs_cards_15', 'images/inventoryimages/ccs_cards/ccs_cards_15.xml', 'ccs_cards_15')
CcsItemSkin("ccs_cards_15","ccs_bow_skin_rain",{
    name = "白雨心弦",
    atlas = "images/inventoryimages/ccs_bow_skin_rain.xml",
    image = "ccs_bow_skin_rain",
    build = "ccs_bow_skin_rain",
    bank =  "ccs_bow_skin_rain",
    basebuild = "ccs_cards",
    basebank =  "ccs_cards",
})

CcsItemSkin("ccs_cards_15","ccs_bow_skin_madoka",{
    name = "定制-圆环之理",
    atlas = "images/inventoryimages/ccs_bow_skin_madoka.xml",
    image = "ccs_bow_skin_madoka",
    build = "ccs_bow_skin_madoka",
    bank =  "ccs_bow_skin_madoka",
    basebuild = "ccs_cards",
    basebank =  "ccs_cards",
})

CcsItemSkin("ccs_cards_15","ccs_bow_skin_amosi",{
    name = "定制-阿莫斯之弓",
    atlas = "images/inventoryimages/ccs_bow_skin_amosi.xml",
    image = "ccs_bow_skin_amosi",
    build = "ccs_bow_skin_amosi",
    bank =  "ccs_bow_skin_amosi",
    basebuild = "ccs_cards",
    basebank =  "ccs_cards",
})

CcsItemSkin("ccs_cards_15","ccs_bow_skin_rose",{
    name = "定制：荆棘玫瑰之弓",
    atlas = "images/inventoryimages/ccs_bow_skin_rose.xml",
    image = "ccs_bow_skin_rose",
    build = "ccs_bow_skin_rose",
    bank =  "ccs_bow_skin_rose",
    basebuild = "ccs_cards",
    basebank =  "ccs_cards",
})

CCSAPI.MakeItemSkinDefaultImage('ccs_cards_21', 'images/inventoryimages/ccs_cards/ccs_cards_21.xml', 'ccs_cards_21')
CcsItemSkin("ccs_cards_21","ccs_cards_21_skins1",{
            name = "定制-未命名",
            atlas = "images/inventoryimages/ccs_cards_21_skins1.xml",
            image = "ccs_cards_21_skins1",
            build = "ccs_cards_21_skins1",
            bank =  "ccs_cards_21_skins1",
            basebuild = "ccs_cards",
            basebank =  "ccs_cards",
        })
		
--
CcsItemSkin("ccs_sb_item","ccs_sb_item_sxz_skins1",{
            name = "吉依",
            atlas = "images/inventoryimages/ccs_sb_item_sxz_skins1.xml",
            image = "ccs_sb_item_sxz_skins1",
            build = "ccs_xk_item_sxz_skins",
            bank =  "ccs_sb_item_sxz_skins1",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })
		
CcsItemSkin("ccs_sb_item","ccs_sb_item_sxz_skins2",{
            name = "吉依2",
            atlas = "images/inventoryimages/ccs_sb_item_sxz_skins1.xml",
            image = "ccs_sb_item_sxz_skins1",
            build = "ccs_xk_item_sxz_skins",
            bank =  "ccs_sb_item_sxz_skins1",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })
		
CcsItemSkin("ccs_sb_item","ccs_sb_item_sxz_skins3",{
            name = "乌萨奇",
            atlas = "images/inventoryimages/ccs_sb_item_sxz_skins3.xml",
            image = "ccs_sb_item_sxz_skins3",
            build = "ccs_xk_item_sxz_skins",
            bank =  "ccs_sb_item_sxz_skins3",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })
		
CcsItemSkin("ccs_sb_item","ccs_sb_item_sxz_skins4",{
            name = "乌萨奇2",
            atlas = "images/inventoryimages/ccs_sb_item_sxz_skins3.xml",
            image = "ccs_sb_item_sxz_skins3",
            build = "ccs_xk_item_sxz_skins",
            bank =  "ccs_sb_item_sxz_skins3",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })
		
CcsItemSkin("ccs_sb_item","ccs_sb_item_sxz_skins5",{
            name = "小八",
            atlas = "images/inventoryimages/ccs_sb_item_sxz_skins2.xml",
            image = "ccs_sb_item_sxz_skins2",
            build = "ccs_xk_item_sxz_skins",
            bank =  "ccs_sb_item_sxz_skins2",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })
		
CcsItemSkin("ccs_sb_item","ccs_sb_item_sxz_skins6",{
            name = "小八2",
            atlas = "images/inventoryimages/ccs_sb_item_sxz_skins2.xml",
            image = "ccs_sb_item_sxz_skins2",
            build = "ccs_xk_item_sxz_skins",
            bank =  "ccs_sb_item_sxz_skins2",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })
		
CcsItemSkin("ccs_sb_item","ccs_sb_item_skins7",{
            name = "蛋黄哥",
            atlas = "images/inventoryimages/ccs_sb_item_skins7.xml",
            image = "ccs_sb_item_skins7",
            build = "ccs_sb_item_skins7",
            bank =  "ccs_sb_item_skins7",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })
		
		
CcsItemSkin("ccs_sb_item","ccs_sb_item_skins8",{
            name = "美乐蒂",
            atlas = "images/inventoryimages/ccs_sb_item_skins8.xml",
            image = "ccs_sb_item_skins8",
            build = "ccs_sb_item_skins8",
            bank =  "ccs_sb_item_skins8",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })

CcsItemSkin("ccs_sb_item","ccs_sb_item_skins9",{
            name = "玉桂狗",
            atlas = "images/inventoryimages/ccs_sb_item_skins9.xml",
            image = "ccs_sb_item_skins9",
            build = "ccs_sb_item_skins9",
            bank =  "ccs_sb_item_skins9",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })
--
CcsItemSkin("ccs_xk_item","ccs_xk_item_sxz_skins1",{
            name = "吉依",
            atlas = "images/inventoryimages/ccs_sb_item_sxz_skins1.xml",
            image = "ccs_sb_item_sxz_skins1",
            build = "ccs_xk_item_sxz_skins",
            bank =  "ccs_sb_item_sxz_skins1",
            basebuild = "ccs_xk_item",
            basebank =  "ccs_xk_item",
        })

CcsItemSkin("ccs_xk_item","ccs_xk_item_sxz_skins2",{
            name = "吉依2",
            atlas = "images/inventoryimages/ccs_sb_item_sxz_skins1.xml",
            image = "ccs_sb_item_sxz_skins1",
            build = "ccs_xk_item_sxz_skins",
            bank =  "ccs_sb_item_sxz_skins1",
            basebuild = "ccs_xk_item",
            basebank =  "ccs_xk_item",
        })
		
CcsItemSkin("ccs_xk_item","ccs_xk_item_sxz_skins3",{
            name = "乌萨奇",
            atlas = "images/inventoryimages/ccs_sb_item_sxz_skins3.xml",
            image = "ccs_sb_item_sxz_skins3",
            build = "ccs_xk_item_sxz_skins",
            bank =  "ccs_sb_item_sxz_skins3",
            basebuild = "ccs_xk_item",
            basebank =  "ccs_xk_item",
        })
		

CcsItemSkin("ccs_xk_item","ccs_xk_item_sxz_skins4",{
            name = "乌萨奇2",
            atlas = "images/inventoryimages/ccs_sb_item_sxz_skins3.xml",
            image = "ccs_sb_item_sxz_skins3",
            build = "ccs_xk_item_sxz_skins",
            bank =  "ccs_sb_item_sxz_skins3",
            basebuild = "ccs_xk_item",
            basebank =  "ccs_xk_item",
        })
		

CcsItemSkin("ccs_xk_item","ccs_xk_item_sxz_skins5",{
            name = "小八",
            atlas = "images/inventoryimages/ccs_sb_item_sxz_skins2.xml",
            image = "ccs_sb_item_sxz_skins2",
            build = "ccs_xk_item_sxz_skins",
            bank =  "ccs_sb_item_sxz_skins2",
            basebuild = "ccs_xk_item",
            basebank =  "ccs_xk_item",
        })
		
CcsItemSkin("ccs_xk_item","ccs_xk_item_sxz_skins6",{
            name = "小八2",
            atlas = "images/inventoryimages/ccs_sb_item_sxz_skins2.xml",
            image = "ccs_sb_item_sxz_skins2",
            build = "ccs_xk_item_sxz_skins",
            bank =  "ccs_sb_item_sxz_skins2",
            basebuild = "ccs_xk_item",
            basebank =  "ccs_xk_item",
        })
		
				
CcsItemSkin("ccs_xk_item","ccs_xk_item_skins7",{
            name = "蛋黄哥",
            atlas = "images/inventoryimages/ccs_sb_item_skins7.xml",
            image = "ccs_sb_item_skins7",
            build = "ccs_sb_item_skins7",
            bank =  "ccs_sb_item_skins7",
            basebuild = "ccs_xk_item",
            basebank =  "ccs_xk_item",
        })
		
		
CcsItemSkin("ccs_xk_item","ccs_xk_item_skins8",{
            name = "美乐蒂",
            atlas = "images/inventoryimages/ccs_sb_item_skins8.xml",
            image = "ccs_sb_item_skins8",
            build = "ccs_sb_item_skins8",
            bank =  "ccs_sb_item_skins8",
            basebuild = "ccs_xk_item",
            basebank =  "ccs_xk_item",
        })

CcsItemSkin("ccs_xk_item","ccs_xk_item_skins9",{
            name = "玉桂狗",
            atlas = "images/inventoryimages/ccs_sb_item_skins9.xml",
            image = "ccs_sb_item_skins9",
            build = "ccs_sb_item_skins9",
            bank =  "ccs_sb_item_skins9",
            basebuild = "ccs_xk_item",
            basebank =  "ccs_xk_item",
        })

CcsItemSkin("ccs_sb_item","ccs_sbxk_item_tusi",{
            name = "定制：吐司啵啵",
            atlas = "images/inventoryimages/ccs_sbxk_item_tusi.xml",
            image = "ccs_sbxk_item_tusi",
            build = "ccs_sbxk_item_tusi",
            bank =  "ccs_sbxk_item_tusi",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })

CcsItemSkin("ccs_xk_item","ccs_sbxk_item_tusi",{
            name = "定制：吐司啵啵",
            atlas = "images/inventoryimages/ccs_sbxk_item_tusi.xml",
            image = "ccs_sbxk_item_tusi",
            build = "ccs_sbxk_item_tusi",
            bank =  "ccs_sbxk_item_tusi",
            basebuild = "ccs_sb_item",
            basebank =  "ccs_sb_item",
        })

CcsItemSkin("ccs_skirt1","ccs_skirt_skins1",{
            name = "格格裙",
            atlas = "images/inventoryimages/ccs_skirt_skins1.xml",
            image = "ccs_skirt_skins1",
            build = "ccs_skirt_skins1",
            bank =  "ccs_skirt_skins1",
            basebuild = "ccs_skirt1",
            basebank =  "ccs_skirt1",
        })								

-- CcsItemSkin("ccs_skirt1","ccs_skirt_skin_flower",{
--     name = "春之樱",
--     atlas = "images/inventoryimages/ccs_skirt_skin_flower.xml",
--     image = "ccs_skirt_skin_flower",
--     build = "ccs_skirt_skin_flower",
--     bank =  "ccs_skirt_skin_flower",
--     basebuild = "ccs_skirt1",
--     basebank =  "ccs_skirt1",
-- })		

CcsItemSkin("ccs_skirt1","ccs_skirt_skin_xigewen",{
    name = "定制-看你啦",
    atlas = "images/inventoryimages/ccs_skirt_skin_xigewen.xml",
    image = "ccs_skirt_skin_xigewen",
    build = "ccs_skirt_skin_xigewen",
    bank =  "ccs_skirt_skin_xigewen",
    basebuild = "ccs_skirt1",
    basebank =  "ccs_skirt1",
})

CcsItemSkin("ccs_skirt1","ccs_skirt_skin_madoka",{
    name = "定制-小圆的礼服",
    atlas = "images/inventoryimages/ccs_skirt_skin_madoka.xml",
    image = "ccs_skirt_skin_madoka",
    build = "ccs_skirt_skin_madoka",
    bank =  "ccs_skirt_skin_madoka",
    basebuild = "ccs_skirt1",
    basebank =  "ccs_skirt1",
})


CcsItemSkin2("ccs_street_lamp","ccs_street_lamp_skin1",{
            name = "兔子灯",
            atlas = "images/inventoryimages/ccs_street_lamp_skin1.xml",
            image = "ccs_street_lamp_skin1",
            build = "ccs_street_lamp_skin1",
            bank =  "ccs_street_lamp_skin1",
            basebuild = "ccs_street_lamp",
            basebank =  "ccs_street_lamp",
        })


CCSAPI.MakeItemSkinDefaultImage('ccs_ice_box', 'images/inventoryimages/ccs_ice_box.xml', 'ccs_ice_box')
CcsItemSkin("ccs_ice_box","ccs_ice_box_skin1",{
            name = "菠萝包",
            atlas = "images/inventoryimages/ccs_ice_box_skin1.xml",
            image = "ccs_ice_box_skin1",
            build = "ccs_ice_box_skin1",
            bank =  "ccs_ice_box_skin1",
            basebuild = "ccs_ice_box",
            basebank =  "ccs_ice_box",
        })
CcsItemSkin("ccs_ice_box","ccs_ice_box_skin2",{
            name = "定制：星之鼓动",
            atlas = "images/inventoryimages/ccs_ice_box_skin2.xml",
            image = "ccs_ice_box_skin2",
            build = "ccs_ice_box_skin2",
            bank =  "ccs_ice_box_skin2",
            basebuild = "ccs_ice_box",
            basebank =  "ccs_ice_box",
        })
CcsItemSkin("ccs_ice_box","ccs_ice_box_skin3",{
            name = "定制：宝宝奶昔",
            atlas = "images/inventoryimages/ccs_ice_box_skin3.xml",
            image = "ccs_ice_box_skin3",
            build = "ccs_ice_box_skin3",
            bank =  "ccs_ice_box_skin3",
            basebuild = "ccs_ice_box",
            basebank =  "ccs_ice_box",
            init_fn = function(inst)
                if inst._state then
                    inst._state:set(2)
                    inst.components.container:WidgetSetup("ccs_ice_box_xigewen")
                    inst.components.container:Close()
                end
            end,
            clear_fn = function(inst)
                inst._state:set(1)
                inst.components.container:WidgetSetup("ccs_ice_box_rq")
                inst.components.container:Close()
            end,
        })

CCSAPI.MakeItemSkinDefaultImage('ccs_trash', 'images/inventoryimages/ccs_trash.xml', 'ccs_trash')
CcsItemSkin2("ccs_trash","ccs_trash_skin1",{
    name = "仓鼠噗噗",
    atlas = "images/inventoryimages/ccs_trash_skin1.xml",
    image = "ccs_trash_skin1",
    build = "ccs_trash_skin1",
    bank =  "ccs_trash_skin1",
    basebuild = "ccs_trash",
    basebank =  "ccs_trash",
})

CcsItemSkin("ccs_trash","ccs_trash_skin2",{
    name = "瓶中玫瑰",
    atlas = "images/inventoryimages/ccs_trash_skin2.xml",
    image = "ccs_trash_skin2",
    build = "ccs_trash_skin2",
    bank =  "ccs_trash_skin2",
    basebuild = "ccs_trash",
    basebank =  "ccs_trash",
})

CcsItemSkin("ccs_trash","ccs_trash_skin3",{
    name = "定制：丘比",
    atlas = "images/inventoryimages/ccs_trash_skin3.xml",
    image = "ccs_trash_skin3",
    build = "ccs_trash_skin3",
    bank =  "ccs_trash_skin3",
    basebuild = "ccs_trash",
    basebank =  "ccs_trash",
})

CCSAPI.MakeItemSkinDefaultImage('ccs_guard', 'images/inventoryimages/ccs_guard.xml', 'ccs_guard')
CcsItemSkin2("ccs_guard","ccs_guard_skin1",{
    name = "仓鼠噗噗",
    atlas = "images/inventoryimages/ccs_guard_skin1.xml",
    image = "ccs_guard_skin1",
    build = "ccs_guard_skin1",
    bank =  "ccs_guard_skin1",
    basebuild = "ccs_guard",
    basebank =  "ccs_guard",
})
CcsItemSkin("ccs_guard","ccs_guard_skin2",{
    name = "定制：恶魔的救赎",
    atlas = "images/inventoryimages/ccs_guard_skin2.xml",
    image = "ccs_guard_skin2",
    build = "ccs_guard_skin2",
    bank =  "ccs_guard_skin2",
    basebuild = "ccs_guard",
    basebank =  "ccs_guard",
})

CcsItemSkin("ccs_guard","ccs_guard_pipo",{
    name = "定制：Pipo",
    atlas = "images/inventoryimages/ccs_guard_pipo.xml",
    image = "ccs_guard_pipo",
    build = "ccs_guard_pipo",
    bank =  "ccs_guard_pipo",
    basebuild = "ccs_guard",
    basebank =  "ccs_guard",
})

CCSAPI.MakeItemSkinDefaultImage('ccs_jt', 'images/inventoryimages/ccs_jt.xml', 'ccs_jt')
CcsItemSkin("ccs_jt","ccs_jt_skins1",{
    name = "瓶中爱心",
    atlas = "images/inventoryimages/ccs_jt_skins1.xml",
    image = "ccs_jt_skins1",
    build = "ccs_jt_skins1",
    bank =  "ccs_jt_skins1",
    basebuild = "ccs_jt",
    basebank =  "ccs_jt",
})

CcsItemSkin("ccs_jt","ccs_jt_skins2",{
    name = "定制：焰魔",
    atlas = "images/inventoryimages/ccs_jt_skins2.xml",
    image = "ccs_jt_skins2",
    build = "ccs_jt_skins2",
    bank =  "ccs_jt_skins2",
    basebuild = "ccs_jt",
    basebank =  "ccs_jt",
    init_fn = function(inst)
        if inst._state then
            inst._state:set(2)
            inst.Light:SetColour( 216/255, 160/255, 255/255, 1 )
            inst.Transform:SetScale(1.6, 1.6, 1.6)
        end
    end,
    clear_fn = function(inst)
        inst._state:set(1)
        inst.Light:SetColour( 0/255, 245/255, 255/255, 1 )
        inst.Transform:SetScale(2, 2, 2)
    end,
    
})

CcsItemSkin("ccs_jt","ccs_jt_skins3",{
    name = "定制：圆神",
    atlas = "images/inventoryimages/ccs_jt_skins3.xml",
    image = "ccs_jt_skins3",
    build = "ccs_jt_skins3",
    bank =  "ccs_jt_skins3",
    basebuild = "ccs_jt",
    basebank =  "ccs_jt",
    init_fn = function(inst)
        if inst._state then
            inst._state:set(3)
            inst.Light:SetColour( 255/255, 182/255, 193/255, 1 )
            inst.Transform:SetScale(1.8, 1.8, 1.8)
        end
    end,
    clear_fn = function(inst)
        inst._state:set(1)
        inst.Light:SetColour( 0/255, 245/255, 255/255, 1 )
        inst.Transform:SetScale(2, 2, 2)
    end,
    
})

CcsItemSkin("ccs_jt","ccs_jt_skins4",{
    name = "定制：咖啡甜心",
    atlas = "images/inventoryimages/ccs_jt_skins4.xml",
    image = "ccs_jt_skins4",
    build = "ccs_jt_skins4",
    bank =  "ccs_jt_skins4",
    basebuild = "ccs_jt",
    basebank =  "ccs_jt",
})

CCSAPI.MakeItemSkinDefaultImage('ccs_amulet', 'images/inventoryimages/ccs_amulet.xml', 'ccs_amulet')
CcsItemSkin("ccs_amulet","ccs_amulet_skin1",{
    name = "飘浮法球",
    atlas = "images/inventoryimages/ccs_amulet_skin1.xml",
    image = "ccs_amulet_skin1",
    build = "ccs_amulet_skin1",
    bank =  "ccs_amulet_skin1",
    basebuild = "ccs_amulet",
    basebank =  "ccs_amulet",
})
CcsItemSkin("ccs_amulet","ccs_amulet_skin2",{
    name = "定制-圆环之理",
    atlas = "images/inventoryimages/ccs_amulet_skin2.xml",
    image = "ccs_amulet_skin2",
    build = "ccs_amulet_skin2",
    bank =  "ccs_amulet_skin2",
    basebuild = "ccs_amulet",
    basebank =  "ccs_amulet",
})
CcsItemSkin("ccs_amulet","ccs_amulet_skin3",{
    name = "定制-天使熊",
    atlas = "images/inventoryimages/ccs_amulet_skin3.xml",
    image = "ccs_amulet_skin3",
    build = "ccs_amulet_skin3",
    bank =  "ccs_amulet_skin3",
    basebuild = "ccs_amulet",
    basebank =  "ccs_amulet",
})

local function PlayIdleLoop(inst, animation_queue, index)
    if inst.should_stop then
        return
    end
    local current_animation = animation_queue[index]
    if current_animation then
        inst.AnimState:PlayAnimation(current_animation)
        --递归调用下一动画
        inst:DoTaskInTime(inst.AnimState:GetCurrentAnimationLength(), function()
            if not inst.should_stop then
                local next_index = index + 1
                if next_index > #animation_queue then
                    next_index = 1  --回到队列的第一个动画
                end
                PlayIdleLoop(inst, animation_queue, next_index)
            end
        end)
    end
end

CCSAPI.MakeItemSkinDefaultImage('ccs_pack_gift', 'images/inventoryimages/ccs_pack_gift.xml', 'ccs_pack_gift')
CCSAPI.MakeItemSkin(
    'ccs_pack_gift',
    'ccs_pack_gift_skin1',
    {
        name = "斯比",
        atlas = "images/inventoryimages/ccs_pack_gift_skin1.xml",
        image = "ccs_pack_gift_skin1",
        build = "ccs_pack_gift_skin1",
        bank =  "ccs_pack_gift_skin1",
        basebuild = "ccs_pack_gift",
        basebank =  "ccs_pack_gift",
        clear_fn = function (inst)
            inst.should_stop = true
            inst.AnimState:PlayAnimation("idle")
        end,
        init_fn = function (inst)
            inst.should_stop = false
            local animation_queue = {"idle1", "idle2"} 
            PlayIdleLoop(inst, animation_queue, 1) 
        end,
        checkfn = function (inventory, name)
            return CCSAPI.CcsSkinCheckFn(inventory, "ccs_amulet_skin1")
        end,
        checkclientfn = function (inventory, userid, name)
            return CCSAPI.CcsSkinCheckClientFn(inventory, userid, "ccs_amulet_skin1")
        end
    }
)
CCSAPI.MakeItemSkin(
    'ccs_pack_gift',
    'ccs_pack_gift_skin2',
    {
        name = "兔子",
        atlas = "images/inventoryimages/ccs_pack_gift_skin2.xml",
        image = "ccs_pack_gift_skin2",
        build = "ccs_pack_gift_skin2",
        bank =  "ccs_pack_gift_skin2",
        basebuild = "ccs_pack_gift",
        basebank =  "ccs_pack_gift",
        clear_fn = function (inst)
            inst.should_stop = true
            inst.AnimState:PlayAnimation("idle")
        end,
        init_fn = function (inst)
            inst.should_stop = false
            local animation_queue = {"idle1", "idle2"} 
            PlayIdleLoop(inst, animation_queue, 1) 
        end,
        checkfn = function (inventory, name)
            return CCSAPI.CcsSkinCheckFn(inventory, "ccs_amulet_skin1")
        end,
        checkclientfn = function (inventory, userid, name)
            return CCSAPI.CcsSkinCheckClientFn(inventory, userid, "ccs_amulet_skin1")
        end
    }
)

CCSAPI.MakeItemSkin(
    'ccs_pack_gift',
    'ccs_pack_gift_skin3',
    {
        name = "兔子",
        atlas = "images/inventoryimages/ccs_pack_gift_skin3.xml",
        image = "ccs_pack_gift_skin3",
        build = "ccs_pack_gift_skin3",
        bank =  "ccs_pack_gift_skin3",
        basebuild = "ccs_pack_gift",
        basebank =  "ccs_pack_gift",
        clear_fn = function (inst)
            inst.should_stop = true
            inst.AnimState:PlayAnimation("idle")
        end,
        init_fn = function (inst)
            inst.should_stop = false
            local animation_queue = {"idle1", "idle2"} 
            PlayIdleLoop(inst, animation_queue, 1) 
        end,
        checkfn = function (inventory, name)
            return CCSAPI.CcsSkinCheckFn(inventory, "ccs_amulet_skin1")
        end,
        checkclientfn = function (inventory, userid, name)
            return CCSAPI.CcsSkinCheckClientFn(inventory, userid, "ccs_amulet_skin1")
        end
    }
)

CCSAPI.MakeItemSkin(
    'ccs_pack_gift',
    'ccs_pack_gift_skin4',
    {
        name = "圆环之理",
        atlas = "images/inventoryimages/ccs_pack_gift_skin4.xml",
        image = "ccs_pack_gift_skin4",
        build = "ccs_pack_gift_skin4",
        bank =  "ccs_pack_gift_skin4",
        basebuild = "ccs_pack_gift",
        basebank =  "ccs_pack_gift",
        checkfn = function (inventory, name)
            return CCSAPI.CcsSkinCheckFn(inventory, "ccs_amulet_skin2")
        end,
        checkclientfn = function (inventory, userid, name)
            return CCSAPI.CcsSkinCheckClientFn(inventory, userid, "ccs_amulet_skin2")
        end
    }
)
CCSAPI.MakeItemSkin(
    'ccs_pack_gift',
    'ccs_pack_gift_skin5',
    {
        name = "天使熊",
        atlas = "images/inventoryimages/ccs_pack_gift_skin5.xml",
        image = "ccs_pack_gift_skin5",
        build = "ccs_pack_gift_skin5",
        bank =  "ccs_pack_gift_skin5",
        basebuild = "ccs_pack_gift",
        basebank =  "ccs_pack_gift",
        checkfn = function (inventory, name)
            return CCSAPI.CcsSkinCheckFn(inventory, "ccs_amulet_skin3")
        end,
        checkclientfn = function (inventory, userid, name)
            return CCSAPI.CcsSkinCheckClientFn(inventory, userid, "ccs_amulet_skin3")
        end
    }
)
CCSAPI.MakeItemSkin(
    'ccs_pack_gift',
    'ccs_pack_gift_skin6',
    {
        name = "天使熊",
        atlas = "images/inventoryimages/ccs_amulet_skin3.xml",
        image = "ccs_amulet_skin3",
        build = "ccs_amulet_skin3",
        bank =  "ccs_amulet_skin3",
        basebuild = "ccs_pack_gift",
        basebank =  "ccs_pack_gift",
        checkfn = function (inventory, name)
            return CCSAPI.CcsSkinCheckFn(inventory, "ccs_amulet_skin3")
        end,
        checkclientfn = function (inventory, userid, name)
            return CCSAPI.CcsSkinCheckClientFn(inventory, userid, "ccs_amulet_skin3")
        end
    }
)

CCSAPI.MakeItemSkinDefaultImage('ccs_cookpot_item', 'images/inventoryimages/ccs_cookpot.xml', 'ccs_cookpot')
CcsItemSkin2("ccs_cookpot_item","ccs_cookpot_item_skin_purple",{
    name = "香水锅(紫)",
    atlas = "images/inventoryimages/ccs_cookpot_skin_purple.xml",
    image = "ccs_cookpot_skin_purple",
    build = "ccs_cookpot_skin_purple",
    bank =  "ccs_cookpot_skin_purple",
    basebuild = "ccs_cookpot",
    basebank =  "ccs_cookpot",
})
CcsItemSkin("ccs_cookpot_item","ccs_cookpot_item_skin_green",{
    name = "香水锅(绿)",
    atlas = "images/inventoryimages/ccs_cookpot_skin_green.xml",
    image = "ccs_cookpot_skin_green",
    build = "ccs_cookpot_skin_green",
    bank =  "ccs_cookpot_skin_green",
    basebuild = "ccs_cookpot",
    basebank =  "ccs_cookpot",
})

CCSAPI.MakeItemSkinDefaultImage('ccs_cookpot', 'images/inventoryimages/ccs_cookpot.xml', 'ccs_cookpot')
CcsItemSkin("ccs_cookpot","ccs_cookpot_skin_green",{
    name = "香水锅(绿)",
    atlas = "images/inventoryimages/ccs_cookpot_skin_green.xml",
    image = "ccs_cookpot_skin_green",
    build = "ccs_cookpot_skin_green",
    bank =  "ccs_cookpot_skin_green",
    basebuild = "ccs_cookpot",
    basebank =  "ccs_cookpot",
    init_fn = function(inst)
        if inst._state then
            inst._state:set(2)
            inst.components.container:WidgetSetup("ccs_cookpot_green")
            inst.components.container:Close()
        end
    end,
    clear_fn = function(inst)
        inst._state:set(1)
        inst.components.container:WidgetSetup("ccs_cookpot")
        inst.components.container:Close()
    end,
})
CcsItemSkin2("ccs_cookpot","ccs_cookpot_skin_purple",{
    name = "香水锅(紫)",
    atlas = "images/inventoryimages/ccs_cookpot_skin_purple.xml",
    image = "ccs_cookpot_skin_purple",
    build = "ccs_cookpot_skin_purple",
    bank =  "ccs_cookpot_skin_purple",
    basebuild = "ccs_cookpot",
    basebank =  "ccs_cookpot",
    init_fn = function(inst)
        if inst._state then
            inst._state:set(3)
            inst.components.container:WidgetSetup("ccs_cookpot_purple")
            inst.components.container:Close()
        end
    end,
    clear_fn = function(inst)
        inst._state:set(1)
        inst.components.container:WidgetSetup("ccs_cookpot")
        inst.components.container:Close()
    end,
})

CCSAPI.MakeItemSkinDefaultImage('ccs_cookpot2', 'images/inventoryimages/ccs_cookpot2.xml', 'ccs_cookpot2')
CcsItemSkin("ccs_cookpot2","ccs_cookpot2_skin_white",{
    name = "白色沙漏",
    atlas = "images/inventoryimages/ccs_cookpot2_skin_white.xml",
    image = "ccs_cookpot2_skin_white",
    build = "ccs_cookpot2_skin_white",
    bank =  "ccs_cookpot2_skin_white",
    basebuild = "ccs_cookpot2",
    basebank =  "ccs_cookpot2",
})
CcsItemSkin("ccs_cookpot2","ccs_cookpot_skin_rabbit",{
    name = "定制：兔子沙漏",
    atlas = "images/inventoryimages/ccs_cookpot2_skin_rabbit.xml",
    image = "ccs_cookpot2_skin_rabbit",
    build = "ccs_cookpot2_skin_rabbit",
    bank =  "ccs_cookpot2_skin_rabbit",
    basebuild = "ccs_cookpot2",
    basebank =  "ccs_cookpot2",
})

CCSAPI.MakeItemSkinDefaultImage('ccs_light2', 'images/inventoryimages/ccs_light.xml', 'ccs_light')
CCSAPI.MakeItemSkin(
    'ccs_light2',
    'ccs_light2_skins2',
    {
        name = "定制：焰魔",
        atlas = "images/inventoryimages/ccs_jt_skins2.xml",
        image = "ccs_jt_skins2",
        build = "ccs_jt_skins2",
        bank =  "ccs_jt_skins2",
        basebuild = "ccs_light",
        basebank =  "ccs_light",
        clear_fn = function (inst)
            inst.AnimState:PlayAnimation("anim",true)
        end,
        init_fn = function (inst)
            inst.AnimState:PlayAnimation("idle")
        end,
        checkfn = function (inventory, name)
            return CCSAPI.CcsSkinCheckFn(inventory, "ccs_jt_skins2")
        end,
        checkclientfn = function (inventory, userid, name)
            return CCSAPI.CcsSkinCheckClientFn(inventory, userid, "ccs_jt_skins2")
        end
    }
)
CCSAPI.MakeItemSkin(
    'ccs_light2',
    'ccs_light2_skins3',
    {
        name = "定制：圆神",
        atlas = "images/inventoryimages/ccs_jt_skins3.xml",
        image = "ccs_jt_skins3",
        build = "ccs_jt_skins3",
        bank =  "ccs_jt_skins3",
        basebuild = "ccs_light",
        basebank =  "ccs_light",
        clear_fn = function (inst)
            inst.AnimState:PlayAnimation("anim",true)
        end,
        init_fn = function (inst)
            inst.AnimState:PlayAnimation("idle")
        end,
        checkfn = function (inventory, name)
            return CCSAPI.CcsSkinCheckFn(inventory, "ccs_jt_skins3")
        end,
        checkclientfn = function (inventory, userid, name)
            return CCSAPI.CcsSkinCheckClientFn(inventory, userid, "ccs_jt_skins3")
        end
    }
)
CCSAPI.MakeItemSkin(
    'ccs_light2',
    'ccs_light2_skins4',
    {
        name = "定制：咖啡甜心",
        atlas = "images/inventoryimages/ccs_jt_skins4.xml",
        image = "ccs_jt_skins4",
        build = "ccs_jt_skins4",
        bank =  "ccs_jt_skins4",
        basebuild = "ccs_light",
        basebank =  "ccs_light",
        clear_fn = function (inst)
            inst.AnimState:PlayAnimation("anim",true)
        end,
        init_fn = function (inst)
            inst.AnimState:PlayAnimation("idle")
        end,
        checkfn = function (inventory, name)
            return CCSAPI.CcsSkinCheckFn(inventory, "ccs_jt_skins4")
        end,
        checkclientfn = function (inventory, userid, name)
            return CCSAPI.CcsSkinCheckClientFn(inventory, userid, "ccs_jt_skins4")
        end
    }
)

CCSAPI.MakeItemSkinDefaultImage('ccs_light', 'images/inventoryimages/ccs_light.xml', 'ccs_light')
CCSAPI.MakeItemSkin(
    'ccs_light',
    'ccs_light2_skins2',
    {
        name = "定制：焰魔",
        atlas = "images/inventoryimages/ccs_jt_skins2.xml",
        image = "ccs_jt_skins2",
        build = "ccs_jt_skins2",
        bank =  "ccs_jt_skins2",
        basebuild = "ccs_light",
        basebank =  "ccs_light",
        clear_fn = function (inst)
            inst.AnimState:PlayAnimation("anim",true)
        end,
        init_fn = function (inst)
            inst.AnimState:PlayAnimation("idle")
        end,
        checkfn = function (inventory, name)
            return CCSAPI.CcsSkinCheckFn(inventory, "ccs_jt_skins2")
        end,
        checkclientfn = function (inventory, userid, name)
            return CCSAPI.CcsSkinCheckClientFn(inventory, userid, "ccs_jt_skins2")
        end
    }
)
CCSAPI.MakeItemSkin(
    'ccs_light',
    'ccs_light2_skins3',
    {
        name = "定制：圆神",
        atlas = "images/inventoryimages/ccs_jt_skins3.xml",
        image = "ccs_jt_skins3",
        build = "ccs_jt_skins3",
        bank =  "ccs_jt_skins3",
        basebuild = "ccs_light",
        basebank =  "ccs_light",
        clear_fn = function (inst)
            inst.AnimState:PlayAnimation("anim",true)
        end,
        init_fn = function (inst)
            inst.AnimState:PlayAnimation("idle")
        end,
        checkfn = function (inventory, name)
            return CCSAPI.CcsSkinCheckFn(inventory, "ccs_jt_skins3")
        end,
        checkclientfn = function (inventory, userid, name)
            return CCSAPI.CcsSkinCheckClientFn(inventory, userid, "ccs_jt_skins3")
        end
    }
)
CCSAPI.MakeItemSkin(
    'ccs_light',
    'ccs_light2_skins4',
    {
        name = "定制：咖啡甜心",
        atlas = "images/inventoryimages/ccs_jt_skins4.xml",
        image = "ccs_jt_skins4",
        build = "ccs_jt_skins4",
        bank =  "ccs_jt_skins4",
        basebuild = "ccs_light",
        basebank =  "ccs_light",
        clear_fn = function (inst)
            inst.AnimState:PlayAnimation("anim",true)
        end,
        init_fn = function (inst)
            inst.AnimState:PlayAnimation("idle")
        end,
        checkfn = function (inventory, name)
            return CCSAPI.CcsSkinCheckFn(inventory, "ccs_jt_skins4")
        end,
        checkclientfn = function (inventory, userid, name)
            return CCSAPI.CcsSkinCheckClientFn(inventory, userid, "ccs_jt_skins4")
        end
    }
)