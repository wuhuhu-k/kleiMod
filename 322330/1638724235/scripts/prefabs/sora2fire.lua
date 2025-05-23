--[[
授权级别:参考级
Copyright 2022 [FL]。此产品仅授权在 Steam 和WeGame平台指定账户下，
Steam平台：MySora 模组ID：workshop-1638724235
WeGame平台: 穹の空 模组ID：workshop-2199027653598519351
禁止一切搬运！二次发布！自用！尤其是自用!
禁止一切搬运！二次发布！自用！尤其是自用!
禁止一切搬运！二次发布！自用！尤其是自用!

基于本mod的patch包 补丁包等 在以下情况下被允许：
1，原则上允许patch和补丁，但是请最好和我打声招呼。
2, patch包 补丁包浏览权限 请优先选择成“不公开” 或者 “仅好友可见”
3，禁止修改经验、进食、皮肤、热更相关内容。
4，本人保留要求相关patch、补丁包下架和做出反制的权利 。
5，之后会有详细的说明放置于mod根目录下的 ReadMe.txt文件，会提供更详细的说明和示例。


声明：本MOD所有内容不用于盈利，且拒绝接受捐赠、红包等行为。

对moder:
授权声明：
1,本mod内源码会严格分为'参考级'和'开放级',我会在源码内标明。
其中'参考级'允许作为参考,可以按照我的思路自行编写其他逻辑,但是禁止直接复制粘贴.
'开放级'允许直接复制粘贴后使用,并允许根据自己的需要进行修改,
但是我期望尽量减少修改以保证兼容和后续更新带来的麻烦,如果有功能改动可以和我沟通进行合并。
未标明的文件，默认授权级别为'参考级'。
2,本mod内贴图、动画相关文件禁止挪用,毕竟这是我自己花钱买的.
3,严禁直接修改本mod内文件后二次发布。
4,从本mod内提前的源码请保留版权信息,并且禁止加密、混淆。
]]
require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/sora2fire.zip"),
    Asset("ANIM", "anim/sorachest.zip"),
	Asset("ATLAS", "images/inventoryimages/sora2fire.xml"),
	Asset("IMAGE", "images/inventoryimages/sora2fire.tex"),
	Asset("ATLAS_BUILD", "images/inventoryimages/sora2fire.xml", 256)
}
for k,v in pairs({"xhl","hrh","hjl","hhl"}) do 
    table.insert(assets, Asset("ANIM", "anim/sora2fire_"..v..".zip"))
    table.insert(assets,Asset("ATLAS", "images/inventoryimages/sora2fire_"..v..".xml"))
	table.insert(assets,Asset("IMAGE", "images/inventoryimages/sora2fire_"..v..".tex"))
	table.insert(assets,Asset("ATLAS_BUILD", "images/inventoryimages/sora2fire_"..v..".xml", 256))
end
local prefabs =
{
    "collapse_small",
}
local function onrefresh(inst)
	local container = inst.components.container
		for i = 1, container:GetNumSlots() do
	        local item = container:GetItemInSlot(i)
	     	if item then 
	     		local replacement = nil 
				if item.components.cookable or item.components.burnable then 
					inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel") 
					local fx = SpawnPrefab("collapse_small")
					local pos = Vector3(inst.Transform:GetWorldPosition())
					fx.Transform:SetScale(0.5, 0.5, 0.5)
					fx.Transform:SetPosition(pos:Get())
					local fx2 = SpawnPrefab("small_puff")
					fx2.entity:SetParent(inst.entity)
					fx2.Transform:SetPosition(0, 3, 0)
				end
		     	if item.components.cookable then 
		     		replacement = item.components.cookable.product
		     	elseif item.prefab == "log" then 
		     		replacement = "charcoal"
		     	elseif item.components.burnable then 
		     		replacement = "ash"				
		     	end  
		     	if replacement then 
                    if type(replacement) == "function" then
                        replacement = replacement(item,inst)
                    end
                    if type(replacement) == "string" then
                        local stacksize = 1 
                        if item.components.stackable then 
                            stacksize = item.components.stackable:StackSize()
                        end 
                        local newprefab = SpawnPrefab(replacement)
                        if newprefab.components.stackable then 
                            newprefab.components.stackable:SetStackSize(stacksize)
                        end 
                        container.ignoreoverstacked = true
                        container:RemoveItemBySlot(i)
                        container.ignoreoverstacked  = false
                        item:Remove()
                        container:GiveItem(newprefab, i)
                    end
	     		end 
		     end 
		end 
		return false 
end

local function onopen(inst)
    --inst.AnimState:PlayAnimation("open")
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_open")
end

local function onclose(inst)
	onrefresh(inst)
    --inst.AnimState:PlayAnimation("close")
	--inst.AnimState:PlayAnimation("closed")
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_close")
end

local function onhammered(inst, worker)
    inst.components.lootdropper:DropLoot()
    inst.components.container:DropEverything()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
end

local function onhit(inst, worker)
    --inst.AnimState:PlayAnimation("hit")
    inst.components.container:DropEverything()
    --inst.AnimState:PushAnimation("closed", false)
    inst.components.container:Close()
end

local function onbuilt(inst)
    --inst.AnimState:PlayAnimation("place")
    --inst.AnimState:PlayAnimation("closed")
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_craft")
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    inst.MiniMapEntity:SetIcon("sora2fire.tex")
	--MakeObstaclePhysics(inst, .4)
    --inst:AddTag("fridge")
    inst:AddTag("structure")
    inst:AddTag("nosteal")
    inst.AnimState:SetBank("sora2fire")
    inst.AnimState:SetBuild("sora2fire")
    inst.AnimState:PlayAnimation("idle")
    inst:AddComponent("soratwoface")
    inst.SoundEmitter:PlaySound("dontstarve/common/ice_box_LP", "idlesound")

    --MakeSnowCoveredPristine(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        inst.OnEntityReplicated = function(inst)
            inst.replica.container:WidgetSetup("sorafire")
        end
        return inst
    end

    inst:AddComponent("inspectable")
	inst.components.inspectable:SetDescription("烧光他们！")
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("sorafire")
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose

    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(2)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit) 

    inst:ListenForEvent("onbuilt", onbuilt)
	-- if TUNING.SMART_SIGN_DRAW_ENABLE then
	-- 	SMART_SIGN_DRAW(inst)
	-- end

    return inst
end
SoraAPI.MakeItemSkinDefaultData("sora2fire", {}, {})
local tname = "sora2fire_xhl"
    SoraAPI.MakeItemSkin("sora2fire",tname, {
        
        name = "小火龙",
        atlas = "images/inventoryimages/" .. tname .. ".xml",
        image = tname,
        build = tname,
        bank = tname,
        init_fn = function(inst)
        end,

        checkfn = SoraAPI.SoraSkinCheckFn,
        checkclientfn = SoraAPI.SoraSkinCheckClientFn
    })
    SoraAPI.MakeItemSkin("sora2fire",tname.."_tmp", {
        
        name = "小火龙(限时)",
        atlas = "images/inventoryimages/" .. tname .. ".xml",
        image = tname,
        build = tname,
        bank = tname,
        init_fn = function(inst)
        end,

        rarity = "限时体验",
        rarityorder = 80,
        raritycorlor = {0.957, 0.769, 0.188, 1},
        FrameSymbol = "heirloom",
        checkfn = SoraAPI.SoraSkinCheckFn,
        checkclientfn = SoraAPI.SoraSkinCheckClientFn
    })


    local tname = "sora2fire_hrh"
    SoraAPI.MakeItemSkin("sora2fire",tname, {
        
        name = "火绒狐",
        atlas = "images/inventoryimages/" .. tname .. ".xml",
        image = tname,
        build = tname,
        bank = tname,
        init_fn = function(inst)
        end,

        checkfn = SoraAPI.SoraSkinCheckFn,
        checkclientfn = SoraAPI.SoraSkinCheckClientFn
    })
    SoraAPI.MakeItemSkin("sora2fire",tname.."_tmp", {
        
        name = "火绒狐(限时)",
        atlas = "images/inventoryimages/" .. tname .. ".xml",
        image = tname,
        build = tname,
        bank = tname,
        init_fn = function(inst)
        end,

        rarity = "限时体验",
        rarityorder = 80,
        raritycorlor = {0.957, 0.769, 0.188, 1},
        FrameSymbol = "heirloom",
        checkfn = SoraAPI.SoraSkinCheckFn,
        checkclientfn = SoraAPI.SoraSkinCheckClientFn
    })

    local tname = "sora2fire_hhl"
    SoraAPI.MakeItemSkin("sora2fire",tname, {
        
        name = "火狐狸",
        atlas = "images/inventoryimages/" .. tname .. ".xml",
        image = tname,
        build = tname,
        bank = tname,
        init_fn = function(inst)
        end,

        checkfn = SoraAPI.SoraSkinCheckFn,
        checkclientfn = SoraAPI.SoraSkinCheckClientFn
    })
    SoraAPI.MakeItemSkin("sora2fire",tname.."_tmp", {
        
        name = "火狐狸(限时)",
        atlas = "images/inventoryimages/" .. tname .. ".xml",
        image = tname,
        build = tname,
        bank = tname,
        init_fn = function(inst)
        end,

        rarity = "限时体验",
        rarityorder = 80,
        raritycorlor = {0.957, 0.769, 0.188, 1},
        FrameSymbol = "heirloom",
        checkfn = SoraAPI.SoraSkinCheckFn,
        checkclientfn = SoraAPI.SoraSkinCheckClientFn
    })


    local tname = "sora2fire_hjl"
    SoraAPI.MakeItemSkin("sora2fire",tname, {
        
        name = "火伊布",
        atlas = "images/inventoryimages/" .. tname .. ".xml",
        image = tname,
        build = tname,
        bank = tname,
        init_fn = function(inst)
        end,

        checkfn = SoraAPI.SoraSkinCheckFn,
        checkclientfn = SoraAPI.SoraSkinCheckClientFn
    })
    SoraAPI.MakeItemSkin("sora2fire",tname.."_tmp", {
        
        name = "火伊布(限时)",
        atlas = "images/inventoryimages/" .. tname .. ".xml",
        image = tname,
        build = tname,
        bank = tname,
        init_fn = function(inst)
        end,

        rarity = "限时体验",
        rarityorder = 80,
        raritycorlor = {0.957, 0.769, 0.188, 1},
        FrameSymbol = "heirloom",
        checkfn = SoraAPI.SoraSkinCheckFn,
        checkclientfn = SoraAPI.SoraSkinCheckClientFn
    })

return Prefab("sora2fire", fn, assets, prefabs),
    MakePlacer("sora2fire_placer", "sora2fire", "sora2fire", "idle")
