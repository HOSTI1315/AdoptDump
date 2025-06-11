--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.WaitersNotepadApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("XboxSupport")
local v4 = v2("WaitersNotepadApp", v1("UIBaseApp"))
function v4.open_notepad(p5)
    p5.UIManager.set_app_visibility(p5.ClassName, true)
    repeat
        task.wait(0.1)
    until not p5.UIManager.is_visible(p5.ClassName)
end
function v4.show(p6)
    p6.instance.Frame.Visible = true
end
function v4.hide(p7)
    p7.instance.Frame.Visible = false
end
function v4.start(p_u_8)
    local v9 = p_u_8.UIManager.wrap(p_u_8.instance.Frame.Body.ButtonFrame.ExitButton, "DepthButton")
    v9:set_state("cancel")
    v9:start({
        ["mouse_button1_click"] = function()
            p_u_8.UIManager.set_app_visibility(p_u_8.ClassName, false)
        end
    })
    v_u_3.quick_watch({
        ["selection_parent"] = p_u_8.instance.Frame,
        ["default_selection"] = p_u_8.instance.Frame.Body.TextFrame.Textbox,
        ["app_name"] = p_u_8.ClassName
    })
end
return v4