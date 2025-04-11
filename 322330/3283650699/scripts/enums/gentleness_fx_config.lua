----
---文件处理时间:2024-07-01 23:48:41
---

local function IntColour(r, g, b, a)
    return { r / 255, g / 255, b / 255, a / 255 }
end

local HH_LIST = {
    ["gentleness_fx_cat"] = {
        ["tex"] = resolvefilepath("images/gentleness_image/gentleness_fx_cat.tex"),
        ["shader"] = "shaders/particle.ksh",
        ["color_envelope"] = {
            { 0, IntColour(255, 255, 255, 200) },
            { 1, IntColour(255, 255, 255, 255) },
        },
        ["scale_envelope"] = {
            { 0, { 1.8, 1.8 } },
            { 0.3, { 0.9, 0.9 } },
            { 1, { 0, 0 } },
        },
        ["life_time"] = 0.3,
        
        ["emitters_num"] = 1,
        ["max_num"] = 120,
        ["blend_mode"] = BLENDMODE["AlphaBlended"],
        ["need_kill_all"] = false,
    },
}
return HH_LIST
