--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.HouseEditorWrapperApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Signal")
local v3 = v1("Class")("HouseEditorWrapperApp", v1("UIBaseApp"))
function v3.show(_) end
function v3.hide(p4)
    local v5 = p4.UIManager.apps.FurnitureSelectorApp
    if v5:is_selecting() then
        v5:deselect_all()
    end
end
function v3.set_topbar_width(p6, p7)
    if p7 ~= p6.topbar_width then
        p6.topbar_width = p7
        p6.topbar_width_changed:Fire()
    end
end
function v3.get_topbar_width(p8)
    return not p8.topbar_visible and 0 or p8.topbar_width
end
function v3.mark_topbar_visible(p9, p10)
    local v11 = p9.topbar_visible
    p9.topbar_visible = p10
    if p9.topbar_visible ~= v11 then
        p9.topbar_width_changed:Fire()
    end
end
function v3.is_topbar_visible(p12)
    return p12.topbar_visible
end
function v3.clear_drawer(p13)
    if p13.set_drawer then
        p13.set_drawer(nil)
    end
end
function v3.enter_edit_mode(_)
    warn("HouseEditorWrapperApp:enter_edit_mode() is not initialized yet!")
end
function v3.exit_edit_mode(_)
    warn("HouseEditorWrapperApp:exit_edit_mode() is not initialized yet!")
end
function v3.refresh(p14, p15)
    local v16 = p14.UIManager.is_closed({
        "TradeApp",
        "TradeHistoryApp",
        "TradePreviewApp",
        "MannequinPurchaseApp",
        "AvatarEditorApp",
        "FocusPetApp",
        "MockFocusPetApp"
    })
    if not p15[p14.ClassName] then
        v16 = false
    end
    if p14.UIManager.apps.HideGuiApp:should_hide_app(p14.ClassName) then
        v16 = false
    end
    p14:set_visibility(v16)
    if game.Players.LocalPlayer.PlayerGui:FindFirstChild("HouseEditorApp") then
        game.Players.LocalPlayer.PlayerGui.HouseEditorApp.Enabled = v16
    end
end
function v3.start(p17)
    p17.editor_open = false
    p17.drawer_open = false
    p17.topbar_visible = false
    p17.topbar_width = 0
    p17.topbar_width_changed = v_u_2.new()
    p17.drawer_clicked = v_u_2.new()
    p17.exit_editor_clicked = v_u_2.new()
end
return v3