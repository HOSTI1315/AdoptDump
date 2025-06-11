--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.SettingsApp.GeneralButton (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ColorThemeManager")
local v_u_3 = v1("Signal")
local v4 = v1("Class")
local v_u_5 = v1("package:Sift")
local v6 = v1("package:t")
local v7 = v4("GeneralButton", v1("UIBaseElement"))
local v_u_8 = v6.strictInterface({
    ["default"] = v6.boolean,
    ["text"] = v6.optional(v6.string)
})
function v7.console_activated(p9)
    p9:set()
end
function v7.get(p10)
    return p10.value
end
function v7.set(p11)
    p11.value = not p11.value
    p11.changed:Fire()
end
function v7.start(p_u_12, p13)
    local v14 = v_u_8
    assert(v14(p13))
    p_u_12.options = v_u_5.Dictionary.copy(p13)
    p_u_12.changed = v_u_3.new()
    p_u_12.value = p_u_12.options.default
    p_u_12.button = p_u_12.UIManager.wrap(p_u_12.instance.Button, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_12:set()
        end
    })
    p_u_12.button.instance.Face.TextLabel.Text = p_u_12.options.text or ""
    p_u_12.button:set_basic_color(v_u_2.lookup("saturated"))
    v_u_2.get_theme_changed_signal():Connect(function()
        p_u_12.button:set_basic_color(v_u_2.lookup("saturated"))
    end)
    return p_u_12
end
return v7