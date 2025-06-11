--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FocusPetApp.FocusPetAppSettingsPopup (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("ClientData")
local v_u_4 = v1("RouterClient")
local v5 = v2("FocusPetAppSettingsPopup", v1("UIBaseElement"))
function v5.start(p6)
    p6.shown_popup = (v_u_3.get("boolean_flags") or {}).focus_app_settings_popup or false
end
function v5.capture_focus(p_u_7)
    local v8 = v_u_3.get("boolean_flags") or {}
    p_u_7.shown_popup = p_u_7.shown_popup or v8.focus_app_settings_popup
    if not p_u_7.shown_popup then
        p_u_7.shown_popup = true
        v_u_4.get("AilmentsAPI/HideSettingsPopup"):FireServer()
        task.spawn(function()
            local v9 = {
                ["dialog_type"] = "ScrollingDialog",
                ["labels"] = {
                    {
                        ["text"] = "NEW! PET FOCUS",
                        ["size"] = 34,
                        ["padding"] = 20
                    },
                    {
                        ["text"] = "You are now able to view your pet and its needs from this more personal view!",
                        ["size"] = 24,
                        ["already_translated"] = false
                    },
                    {
                        ["text"] = "Miss the old view? Go to Settings, Gameplay, and turn on Advanced Pet Menu.",
                        ["size"] = 24,
                        ["already_translated"] = false
                    }
                },
                ["button"] = "Cool!",
                ["accept_delay"] = 2
            }
            p_u_7.UIManager.apps.DialogApp:dialog(v9)
        end)
    end
end
return v5