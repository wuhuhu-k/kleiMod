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
--require "config/debug"
require "prefabutil"

local Ccs_pack = Class(function(self, inst)
	self.inst = inst
	self.placerstring = net_string(inst.GUID,"Ccs_pack.placerstring","ccs_placerstringdirty")
    inst:ListenForEvent("ccs_placerstringdirty",function() self:ondirty() end)
end)
function Ccs_pack:SetPlacer(prefab,bank,build,anim)
    local suc,str = pcall(json.encode,{
        prefab = prefab,
        bank = bank,
        build=build,
        anim = anim,
    })
    if suc then
        self.placerstring:set(str)
    end
    
end
function Ccs_pack:ondirty()
    local str = self.placerstring:value()
    local suc,tb = pcall(json.decode,str)
    if suc and tb.prefab and tb.bank and tb.build and tb.anim then
        if Prefabs[tb.prefab.."_placer"] then
            self.inst.overridedeployplacername = tb.prefab.."_placer"
            return
        end
        local helpname = string.format("soraplacer_%s_%s_%s",tb.bank,tb.build,tb.anim):lower()
        if helpname:find("fromnum") then
            self.inst.overridedeployplacername = nil
        end
        if Prefabs[helpname] then
            self.inst.overridedeployplacername = helpname
            return
        end
        local newplacer = MakePlacer(helpname,tb.bank,tb.build,tb.anim)
        RegisterPrefabs(newplacer)
        TheSim:LoadPrefabs({helpname})
        self.inst.overridedeployplacername = helpname
        return
    end
end

return Ccs_pack
