--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MinigameHotbarApp.MinigameHotbarApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("MinigameHotbarButton")
local v_u_4 = v1("PlatformM")
local v5 = v2("MinigameHotbarApp", v1("UIBaseApp"))
function v5.show(p6)
    p6.instance.Enabled = true
end
function v5.hide(p7)
    p7.instance.Enabled = false
end
function v5.reset_all_buttons(p8)
    for _, v9 in p8.hotbar_buttons do
        v9:reset()
    end
end
function v5.set_all_buttons_enabled(p10, p11)
    for _, v12 in p10.hotbar_buttons do
        v12:set_enabled(p11)
    end
end
function v5.get_button(p13, p14)
    return p13.hotbar_buttons[p14]
end
function v5.on_minigame_start(p15, p16)
    for v17, v18 in p16 do
        local v19 = v_u_3.new(p15.UIManager, p15.action_button_template:Clone())
        v19:start(v17, p15.hotbar, v18)
        p15.hotbar_buttons[v17] = v19
    end
    p15.UIManager.set_app_visibility(p15.ClassName, true)
end
function v5.on_minigame_end(p20)
    for _, v21 in p20.hotbar_buttons do
        v21:destroy()
    end
    p20.hotbar_buttons = {}
    p20.UIManager.set_app_visibility(p20.ClassName, false)
end
function v5._update_console_button_prompts(p22, p23)
    for _, v24 in p22.hotbar_buttons do
        v24:update_console_button_prompt(p23)
    end
end
function v5.start(p_u_25)
    p_u_25.hotbar = p_u_25.instance.Hotbar
    p_u_25.hotbar_buttons = {}
    p_u_25.action_button_template = p_u_25.hotbar.ActionButtonTemplate
    p_u_25.action_button_template.Parent = nil
    v_u_4.get_gamepad_changed():Connect(function(p26)
        p_u_25:_update_console_button_prompts(p26)
    end)
    p_u_25:_update_console_button_prompts(v_u_4.is_using_gamepad)
end
return v5