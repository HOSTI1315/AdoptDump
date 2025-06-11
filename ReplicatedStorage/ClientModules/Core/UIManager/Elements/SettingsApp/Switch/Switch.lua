--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.SettingsApp.Switch (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("ColorThemeManager")
local v_u_4 = v1("ColorThemeDB")
local v_u_5 = v1("Signal")
local v_u_6 = v1("TweenPromise")
local v7 = v1("package:t")
local v_u_8 = v1("package:Sift")
local v_u_9 = v1("package:Promise")
local v10 = v2("Switch", v1("UIBaseElement"))
local v_u_11 = Color3.fromRGB(127, 127, 127)
local v_u_12 = v7.strictInterface({
    ["default"] = v7.boolean,
    ["color"] = v7.optional(v7.Color3)
})
function v10.console_activated(p13)
    p13:set(not p13.status)
end
function v10.get(p14)
    return p14.status
end
function v10.set(p15, p16)
    if p15.status ~= p16 then
        local v17 = p16 and (p15.options.color or v_u_4.themes[v_u_3.get_theme_color()].saturated) or v_u_11
        p15.slider.ImageColor3 = v17
        p15.scraggle.ImageColor3 = v17
        p15.tween_promise:cancel()
        p15.tween_promise = v_u_6.new(p15.slider, TweenInfo.new(0.1), {
            ["Position"] = UDim2.new(p16 and 0.5 or 0, 0, 0, 0)
        })
        p15.status = p16
        p15.changed:Fire(p15.status)
    end
end
function v10.start(p_u_18, p19)
    local v20 = v_u_12(p19)
    assert(v20, "Options failed to validate.")
    p_u_18.options = v_u_8.Dictionary.copy(p19)
    p_u_18.status = nil
    p_u_18.changed = v_u_5.new()
    p_u_18.tween_promise = v_u_9.resolve()
    p_u_18.button = p_u_18.instance.Button
    p_u_18.slider = p_u_18.button.Slider
    p_u_18.scraggle = p_u_18.instance.Scraggle
    p_u_18:set(p_u_18.options.default)
    p_u_18.button.Activated:Connect(function()
        p_u_18:set(not p_u_18.status)
    end)
    return p_u_18
end
return v10