--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.SettingsApp.ColorPicker (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Signal")
local v_u_4 = v1("ColorThemeDB")
local v_u_5 = v1("package:Sift")
local v6 = v1("package:t")
local v7 = v2("ColorPicker", v1("UIBaseElement"))
local v_u_8 = v6.strictInterface({
    ["default"] = v6.union(v6.string, v6.Color3),
    ["theme_colors_only"] = v6.optional(v6.boolean),
    ["callback"] = v6.optional(v6.callback)
})
function v7._prompt_and_set_color(p9)
    if p9.options.theme_colors_only then
        if not p9.UIManager.apps.DialogApp:dialog_is_visible("ThemeColorDialog") then
            local _, v10 = p9.UIManager.apps.DialogApp:dialog({
                ["dialog_type"] = "ThemeColorDialog"
            })
            p9:set(v10)
        end
    else
        local v11 = p9.UIManager.apps.ColorPickerApp:pick_color({
            ["request_source"] = "settings_color_picker",
            ["starter_color"] = p9.color,
            ["preview_callback"] = p9.options.callback
        })
        if v11 then
            p9:set(v11)
        elseif p9.options.callback then
            p9.options.callback(p9.color)
        end
    end
end
function v7.console_activated(p12)
    p12:_prompt_and_set_color()
end
function v7.get(p13)
    return p13.color
end
function v7.set(p14, p15)
    p14.color = p15
    if type(p15) == "string" then
        p15 = v_u_4.themes[p14.color].saturated
    end
    local v16, v17, v18 = Color3.toHSV(p15)
    local v19 = Color3.fromHSV
    local v20 = v18 - 0.22
    local v21 = v19(v16, v17, (math.clamp(v20, 0, 1)))
    p14.color_button:set_face_shadow_color(p15, v21)
    p14.changed:fire(p14.color)
end
function v7.start(p_u_22, p23)
    local v24 = v_u_8(p23)
    assert(v24, "Options failed to validate.")
    p_u_22.options = v_u_5.Dictionary.copy(p23)
    p_u_22.changed = v_u_3.new()
    p_u_22.color = p_u_22.options.default
    p_u_22.color_button = p_u_22.UIManager.wrap(p_u_22.instance.Color, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_22:_prompt_and_set_color()
        end
    })
    return p_u_22
end
return v7