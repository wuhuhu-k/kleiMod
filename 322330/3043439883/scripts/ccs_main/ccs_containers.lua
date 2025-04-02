local containers = require "containers"
local params = containers.params

local ImageButton = require "widgets/imagebutton"
local function AddButton(config,name,pos,fn,postfn)
    local btn
    local data  = {tokill = {}}
    local CcsOnOpenFn = config.CcsOnOpenFn 
    config.CcsOnOpenFn = function(self,inst,doer,...)
        if btn and btn.inst and btn.inst.widget then btn:Kill() btn = nil end
        btn = self:AddChild(ImageButton("images/ui.xml", "button_small.tex", "button_small_over.tex", "button_small_disabled.tex", nil, nil, {1,1}, {0,0}))
        btn.image:SetScale(1.07)
        btn.text:SetPosition(2,-2)
        btn:SetPosition(pos:Get())
        btn:SetText(name)

        btn:SetFont(BUTTONFONT)
        btn:SetDisabledFont(BUTTONFONT)
        btn:SetTextSize(33)
        btn.text:SetVAlign(ANCHOR_MIDDLE)
        btn.text:SetColour(0, 0, 0, 1)

        if fn then
            btn:SetOnClick(function()
                if doer ~= nil then
                    if doer:HasTag("busy") then
                        --Ignore button click when doer is busy
                        return
                    elseif doer.components.playercontroller ~= nil then
                        local iscontrolsenabled, ishudblocking = doer.components.playercontroller:IsEnabled()
                        if not (iscontrolsenabled or ishudblocking) then
                            --Ignore button click when controls are disabled
                            --but not just because of the HUD blocking input
                            return
                        end
                    end
                end
                fn(inst, doer,btn,self,data)
            end)
        end
        if postfn then
            postfn(btn,inst,name,self,data,...)
        end
        if CcsOnOpenFn then
            return CcsOnOpenFn(self,inst, doer,...)
        end
    end
    local CcsOnCloseFn = config.CcsOnCloseFn
    config.CcsOnCloseFn = function(self,inst,doer,...)
        if btn and btn.inst and btn.inst.widget  then btn:Kill() btn = nil end
        for k,v in pairs (data.tokill) do
            if v and v.inst and v.inst.widget then 
                v:Kill()
            end
        end
    end

end

--魔杖
params.ccs_magic_wand3 =
{
    widget =
    {
        slotpos =
        {		
			Vector3(0,   32 + 24,  0),
			Vector3(0,   32 - 46,  0),
			Vector3(0,   32 - 116,  0),
        },
        animbank = "ui_cookpot_1x2",
        animbuild = "ui_cookpot_1x2",
        pos = Vector3(0, 110, 0),		
    },
    type = "hand_inv",
}

function params.ccs_magic_wand3.itemtestfn(container, item, slot)
    return item:HasTag("ccs_card")
end

--背包
params.ccs_bag =
{
    widget =
    {
        slotpos = {},
        animbank = "ui_krampusbag_2x8",
        animbuild = "ccs_bag_2x9",
        --pos = Vector3(-5, -120, 0),
        pos = Vector3(-10, -50, 0),
    },
    issidewidget = true,
    type = "pack",
    openlimit = 1,
}

for y = 0, 8 do
    table.insert(params.ccs_bag.widget.slotpos, Vector3(-162, -75 * y + 240, 0))
    table.insert(params.ccs_bag.widget.slotpos, Vector3(-162 + 75, -75 * y + 240, 0))
end

params.ccs_dinosaur_bag =
{
    widget =
    {
        slotpos = {},
        slotbg = {},
        animbank = "ui_krampusbag_2x8",
        animbuild = "ui_dinosaur_bag_2x9",
        --pos = Vector3(-5, -120, 0),
        pos = Vector3(-10, -50, 0),
    },
    issidewidget = true,
    type = "pack",
    openlimit = 1,
}

for y = 0, 8 do
    table.insert(params.ccs_dinosaur_bag.widget.slotpos, Vector3(-156, -75 * y + 321, 0))
    table.insert(params.ccs_dinosaur_bag.widget.slotpos, Vector3(-156 + 75, -75 * y + 321, 0))
end
for i = 0, 17 do
    table.insert(
            params.ccs_dinosaur_bag.widget.slotbg,
            {image = 'ui_dinosaur_slot.tex', atlas = 'images/inventoryimages/ui_dinosaur_slot.xml'}
        )
end

params.ccs_hanbao_bag =
{
    widget =
    {
        slotpos = {},
        slotbg = {},
        animbank = "ui_krampusbag_2x8",
        animbuild = "ui_hanbao_bag_2x9",
        --pos = Vector3(-5, -120, 0),
        pos = Vector3(-10, -50, 0),
    },
    issidewidget = true,
    type = "pack",
    openlimit = 1,
}

for y = 0, 8 do
    table.insert(params.ccs_hanbao_bag.widget.slotpos, Vector3(-183, -75 * y + 314, 0))
    table.insert(params.ccs_hanbao_bag.widget.slotpos, Vector3(-183 + 75, -75 * y + 314, 0))
end
for i = 0, 17 do
    table.insert(
            params.ccs_hanbao_bag.widget.slotbg,
            {image = 'ui_hanbao_slot.tex', atlas = 'images/inventoryimages/ui_hanbao_slot.xml'}
        )
end

-- function params.ccs_bag.widget:OnOpenFn(inst)
	-- CcsMakeWidgetMovable(self, "ccs_bag", Vector3(-5, -130, 0), {
		-- drag_offset = 0.6
	-- })
-- end

--卡牌盒
params.ccs_card_box =
{
	widget =
    {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ccs_card_box_5x5",
        pos = Vector3(0, 200, 0),
        side_align_tip = 160,
    },
    type = "chest",
}

for y = 4, 0, -1 do
    for x = 0, 4 do
        table.insert(params.ccs_card_box.widget.slotpos, Vector3(80 * x - 80 * 2 + 127, 80 * y - 80 * 2 + 92, 0))
    end
end

function params.ccs_card_box.itemtestfn(container, item, slot)
    return item:HasTag("ccs_card")
end

function params.ccs_card_box.widget:OnOpenFn(inst)
	CcsMakeWidgetMovable(self, "ccs_card_box", Vector3(0, 100, 0), {
		drag_offset = 0.6
	})
end

--卡牌盒2
params.ccs_bag2 =
{
	widget =
    {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ccs_card_box_5x5",
        pos = Vector3(0, 200, 0),
        side_align_tip = 160,
    },
    type = "chest",
}

for y = 4, 0, -1 do
    for x = 0, 4 do
        table.insert(params.ccs_bag2.widget.slotpos, Vector3(80 * x - 80 * 2 + 127, 80 * y - 80 * 2 + 92, 0))
    end
end

function params.ccs_bag2.itemtestfn(container, item, slot)
    return item:HasTag("ccs_card") or item:HasTag("ccs_monster_card") and not item.replica.container
end

function params.ccs_bag2.widget:OnOpenFn(inst)
	CcsMakeWidgetMovable(self, "ccs_bag2", Vector3(0, 100, 0), {
		drag_offset = 0.6
	})
end


--暗黑箱子
params.ccs_chest =
{
	widget =
    {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ccs_card_box_5x5",
        pos = Vector3(0, 100, 0),
        side_align_tip = 160,
    },
    type = "chest",
}

for y = 4, 0, -1 do
    for x = 0, 4 do
        table.insert(params.ccs_chest.widget.slotpos, Vector3(80 * x - 80 * 2 + 127, 80 * y - 80 * 2 + 92, 0))
    end
end

--樱花灯
params.ccs_light3 =
{
	widget =
    {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ccs_card_box_5x5",
        pos = Vector3(0, 100, 0),
        side_align_tip = 160,
		buttoninfo =
        {
            text = "一键收纳",
            position = Vector3(0, -165, 0),
        },
    },
    type = "chest",
}

function params.ccs_light3.widget.buttoninfo.fn(inst, doer)
	SendModRPCToServer(MOD_RPC["CCS"]["ccs_light3_sn"],inst)
end

function params.ccs_light3.widget.buttoninfo.validfn(inst)
    return true
end

AddButton(params.ccs_light3.widget, "拆除包囊", Vector3(150, -165, 0), function(inst)
	SendModRPCToServer(MOD_RPC["CCS"]["ccs_light3_cc"],inst)
end)

for y = 4, 0, -1 do
    for x = 0, 4 do
        table.insert(params.ccs_light3.widget.slotpos, Vector3(80 * x - 80 * 2 + 127, 80 * y - 80 * 2 + 92, 0))
    end
end


--小可
params.ccs_xk_rq =
{

    widget =
    {
        slotpos =
        {
            Vector3(0,   32 + 4,  0),
            Vector3(0, -(32 + 4), 0),
        },
        slotbg =
        {
        },
        animbank = "ui_cookpot_1x2",
        animbuild = "ui_cookpot_1x2",
        pos = Vector3(0, 60, 0),
    },
	type = "chest",
}

--冰箱
params.ccs_ice_box_rq =
{
    widget =
    {
        slotpos = {},					
        animbank = "ui_chest_3x3",		
        animbuild = "ccs_card_box_5x5",		
		pos = Vector3(0, 100, 0),
        side_align_tip = 160,				
    },
    type = "chest",						
}

for y = 4, 0, -1 do				
    for x = 0, 4 do
        table.insert(params.ccs_ice_box_rq.widget.slotpos, Vector3(80 * x - 80 * 2 + 127, 80 * y - 80 * 2 + 92, 0))
    end
end

function params.ccs_ice_box_rq.itemtestfn(container, item, slot)
    return not item.replica.container
end

params.ccs_ice_box_xigewen =
{
    widget =
    {
        slotpos = {},					
        animbank = "ui_chest_3x3",		
        animbuild = "ui_xigewen_box",		
		pos = Vector3(0, 100, 0),
        slotbg = {},
        side_align_tip = 160,				
    },
    type = "chest",						
}

for y = 2, -2, -1 do
    for x = -2, 2 do
        table.insert(params.ccs_ice_box_xigewen.widget.slotpos, Vector3(80 * x + 5 , 80 * y - 25, 0))
    end
end

for i = 0, 24 do
    table.insert(
            params.ccs_ice_box_xigewen.widget.slotbg,
            {image = 'ui_xigewen_slot.tex', atlas = 'images/inventoryimages/ui_xigewen_slot.xml'}
        )
end


function params.ccs_ice_box_xigewen.itemtestfn(container, item, slot)
    return not item.replica.container
end

--水晶球
params.ccs_trash =
{
	widget =
    {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ccs_card_box_5x5",
        pos = Vector3(0, 200, 0),
        side_align_tip = 160,
		buttoninfo =
        {
            text = "清理垃圾",
            position = Vector3(0, -165, 0),
        }
    },
    type = "chest",
}

for y = 4, 0, -1 do
    for x = 0, 4 do
        table.insert(params.ccs_trash.widget.slotpos, Vector3(80 * x - 80 * 2 + 127, 80 * y - 80 * 2 + 92, 0))
    end
end

function params.ccs_trash.widget.buttoninfo.fn(inst, doer)
	SendModRPCToServer(MOD_RPC["CCS"]["CCS_trash_rpc"],inst)
end

function params.ccs_trash.widget.buttoninfo.validfn(inst)
    return true
end

function params.ccs_trash.widget:OnOpenFn(inst)
	CcsMakeWidgetMovable(self, "ccs_trash", Vector3(0, 100, 0), {
		drag_offset = 0.6
	})
end


for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end

--星星法杖
params.ccs_starstaff = {
    widget = {
        slotpos = {
            Vector3(0, 32 + 4, 0)
        },
        animbank = 'ui_cookpot_1x2',
        animbuild = 'ui_cookpot_1x2',
        pos = Vector3(0, 15, 0)
    },
    type = 'hand_inv'
}

function params.ccs_starstaff.itemtestfn(container, item, slot)
    return not item.replica.container
end

--生命法杖
params.ccs_lifestaff = {
    widget = {
        slotpos = {
            Vector3(0, 32 + 4, 0)
        },
        animbank = 'ui_cookpot_1x2',
        animbuild = 'ui_cookpot_1x2',
        pos = Vector3(0, 15, 0)
    },
    type = 'hand_inv'
}

function params.ccs_lifestaff.itemtestfn(container, item, slot)
    return not item.replica.container
end

--储物箱
params.ccs_treasurechest =
{
    widget =
    {
        slotpos = {},					
        animbank = "ui_chest_3x3",		
        animbuild = "ccs_card_box_5x5",		
		pos = Vector3(0, 100, 0),
        side_align_tip = 160,				
    },
    type = "chest",						
}

for y = 4, 0, -1 do				
    for x = 0, 4 do
        table.insert(params.ccs_treasurechest.widget.slotpos, Vector3(80 * x - 80 * 2 + 127, 80 * y - 80 * 2 + 92, 0))
    end
end

--xksb皮肤ui
params.ccs_bluepet =
{
    widget =
    {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ui_xksb_blue",
        pos = Vector3(0, 200, 0),
        slotbg = {},
        side_align_tip = 160,
    },
    type = "chest",
}

for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(params.ccs_bluepet.widget.slotpos, Vector3(80 * x - 80 * 2 + 80, 80 * y - 85 * 2 + 80, 0))
    end
end

for i = 0, 8 do
    table.insert(
            params.ccs_bluepet.widget.slotbg,
            {image = 'ui_xigewen_slot.tex', atlas = 'images/inventoryimages/ui_xigewen_slot.xml'}
        )
end


function params.ccs_bluepet.itemtestfn(container, item, slot)
    return not item.replica.container
end

params.ccs_blackpet =
{
    widget =
    {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ui_xksb_black",
        pos = Vector3(0, 200, 0),
        slotbg = {},
        side_align_tip = 160,
    },
    type = "chest",
}

for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(params.ccs_blackpet.widget.slotpos, Vector3(80 * x - 80 * 2 + 80, 80 * y - 85 * 2 + 80, 0))
    end
end

for i = 0, 8 do
    table.insert(
            params.ccs_blackpet.widget.slotbg,
            {image = 'ui_xigewen_slot.tex', atlas = 'images/inventoryimages/ui_xigewen_slot.xml'}
        )
end


function params.ccs_blackpet.itemtestfn(container, item, slot)
    return not item.replica.container
end
