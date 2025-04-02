local assets1=
{
    Asset("ANIM", "anim/ccs_sword_skins3.zip"),
}
local assets2=
{
    Asset("ANIM", "anim/ccs_magic_wand2_skin_yingcao.zip"),
    Asset("IMAGE", "images/inventoryimages/ccs_magic_wand2_skin_yingcao.tex"), --物品栏贴图
	Asset("ATLAS", "images/inventoryimages/ccs_magic_wand2_skin_yingcao.xml"),
}


local function makefx(name, build, assets)
	
	local function fxfn()
        local inst = CreateEntity()
    
        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddFollower()
        inst.entity:AddNetwork()
    
        inst.AnimState:SetBank(build)
        inst.AnimState:SetBuild(build)
        inst.AnimState:PlayAnimation("idle_loop", true)
    
        inst:AddTag("FX")
        inst:AddTag("NOCLICK")
        inst:AddTag("NOBLOCK")
    
        inst:AddComponent("highlightchild")
    
        inst.entity:SetPristine()
    
        if not TheWorld.ismastersim then
            return inst
        end
    
        inst.persists = false
    
        return inst
    end

	return Prefab(name.."_fx", fxfn, assets)
end

return makefx("ccs_sword_skins3","ccs_sword_skins3",assets1),
makefx("ccs_magic_wand2_skin_yingcao","ccs_magic_wand2_skin_yingcao",assets2)