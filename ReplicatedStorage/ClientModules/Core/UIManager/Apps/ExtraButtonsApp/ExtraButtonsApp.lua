--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.ExtraButtonsApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("ClientData")
local v_u_3 = v_u_1("PlatformM")
local v4 = v_u_1("Class")
local v_u_5 = v_u_1("ClientStore")
local v_u_6 = v_u_1("Signal")
local v_u_7 = v_u_1("XboxSupport")
local v_u_8 = v_u_1("package:Sift")
local v_u_9 = v_u_3.get_platform()
local v10 = v4("ExtraButtonsApp", v_u_1("UIBaseApp"))
function v10.show(p11)
    p11.instance.Enabled = true
end
function v10.hide(p12)
    p12.instance.Enabled = false
    if p12.watch then
        p12.watch:deactivate()
    end
end
function v10.refresh(p13, p14)
    local v15 = p13.UIManager.is_closed({
        "MainMenuApp",
        "AvatarEditorApp",
        "MannequinPurchaseApp",
        "JackboxRewardApp",
        "StickerRewardsApp",
        "TradeApp",
        "TradeHistoryApp",
        "TradePreviewApp",
        "PlayerSpectateApp",
        "MinigameRewardsApp",
        "MinigameNewsPaperApp",
        "FocusPetApp",
        "MockFocusPetApp",
        "LikesRewardApp"
    })
    if not p14[p13.ClassName] then
        v15 = false
    end
    if p13.UIManager.apps.HouseEditorWrapperApp.editor_open and p13.UIManager.apps.HouseEditorWrapperApp.drawer_open then
        v15 = false
    end
    if v_u_9 == v_u_3.platform.tablet then
        local v16 = v_u_1("HouseClient")
        local v17 = v_u_2.get("house_interior")
        if v17 then
            v17 = v17.allows_coop_building
        end
        if v17 then
            v17 = v16.can_edit_current_house()
        end
        if v17 or v_u_5.store:getState().house_editor_state == "Disabled" then
            p13.instance.Frame.Position = UDim2.new(1, -45, 0, 180)
        else
            p13.instance.Frame.Position = UDim2.new(1, -45, 0, 100)
        end
    end
    p13:set_visibility(v15)
end
function v10._refresh_gamepad_selections(p18)
    local v21 = v_u_8.List.filter(p18.instance.Frame:GetChildren(), function(p19)
        local v20 = p19:IsA("ImageButton")
        if v20 then
            v20 = p19.Visible
        end
        return v20
    end)
    p18.sorted_buttons = v_u_8.List.sort(v21, function(p22, p23)
        return p22.AbsolutePosition.Y < p23.AbsolutePosition.Y
    end)
    for v24, v25 in p18.sorted_buttons do
        if v24 > 0 then
            v25.NextSelectionUp = p18.sorted_buttons[v24 - 1]
        end
        if v24 < #p18.sorted_buttons then
            v25.NextSelectionDown = p18.sorted_buttons[v24 + 1]
        end
    end
    for v26, v27 in p18.sorted_buttons do
        if v26 == #p18.sorted_buttons then
            p18.button_gamepad_icons[v27]:update_key(p18.watch:is_active() and Enum.KeyCode.ButtonB or Enum.KeyCode.DPadRight)
        else
            p18.button_gamepad_icons[v27]:update_key(nil)
        end
    end
end
function v10.register_button(p_u_28, p29)
    local v30 = p29.priority
    local v31 = p29.text
    local v_u_32 = p29.mouse_button1_click
    local v33 = p_u_28.template_button:clone()
    v33.Face.TextLabel.Text = v31
    v33.LayoutOrder = v30
    v33.Visible = false
    v33.Parent = p_u_28.instance.Frame
    local v34 = p_u_28.UIManager.wrap(v33, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            if p_u_28.watch then
                p_u_28.watch:deactivate()
            end
            v_u_32()
        end
    })
    v34:set_state("cancel")
    v33:GetPropertyChangedSignal("Visible"):Connect(function()
        p_u_28:_refresh_gamepad_selections()
    end)
    p_u_28.button_gamepad_icons[v33] = p_u_28.UIManager.wrap(v33.XboxButton, "GamepadIcon"):start({
        ["key"] = Enum.KeyCode.DPadRight,
        ["on_update"] = function(p35, p36)
            local v37 = p35.instance
            if p36 then
                if p35:get_key() == Enum.KeyCode.DPadRight then
                    v37.ImageTransparency = 0.3
                    v37.Size = UDim2.new(0, 58, 0, 58)
                    v37.Position = UDim2.new(1, 20, 0, 0)
                else
                    v37.ImageTransparency = 0
                    v37.Size = UDim2.new(0, 40, 0, 40)
                    v37.Position = UDim2.new(1, 20, 0, 5)
                end
            end
            v37.Visible = p36
        end
    })
    p_u_28:_refresh_gamepad_selections()
    return v34
end
function v10.unregister_button(p38, p39)
    if p38.button_gamepad_icons[p39] then
        p38.button_gamepad_icons[p39]:destroy()
        p38.button_gamepad_icons[p39] = nil
    end
    p39.instance:Destroy()
    p38:_refresh_gamepad_selections()
end
function v10.get_list_top_position(p40)
    local v41 = p40.instance.Frame.UIListLayout
    local v42 = -v41.AbsoluteContentSize.Y
    if p40.instance.Enabled then
        if v42 < 0 then
            v42 = v42 - v41.Padding.Offset
        end
    else
        v42 = 0
    end
    return p40.instance.Frame.Position + UDim2.new(0, 0, 0, v42)
end
function v10.get_list_top_position_changed_signal(p43)
    return p43.list_top_position_changed
end
function v10.start(p_u_44)
    p_u_44.template_button = p_u_44.instance.Frame.ButtonTemplate
    p_u_44.template_button.Parent = nil
    p_u_44.button_gamepad_icons = {}
    p_u_44.sorted_buttons = {}
    if v_u_9 == v_u_3.platform.phone then
        p_u_44.instance.Frame.AnchorPoint = Vector2.new(1, 0)
        p_u_44.instance.Frame.Position = UDim2.new(1, -35, 0, 62)
        p_u_44.instance.Frame.Size = UDim2.new(0, 129, 0.5, 0)
    elseif v_u_9 == v_u_3.platform.tablet then
        p_u_44.instance.Frame.AnchorPoint = Vector2.new(1, 0)
        p_u_44.instance.Frame.Position = UDim2.new(1, -45, 0, 100)
        p_u_44.instance.Frame.Size = UDim2.new(0, 129, 0.5, 0)
        p_u_44.template_button.Size = UDim2.new(1, 0, 0, 55)
        p_u_44.instance.Frame.UIListLayout.Padding = UDim.new(0, 6)
        p_u_44.instance.Frame.Size = UDim2.new(0, 180, 0.5, 0)
    else
        p_u_44.instance.Frame.AnchorPoint = Vector2.new(0, 1)
        p_u_44.instance.Frame.Position = UDim2.new(0, 10, 1, -10)
        p_u_44.instance.Frame.Size = UDim2.new(0, 129, 0.5, 0)
        p_u_44.template_button.Size = UDim2.new(1, 0, 0, 55)
        p_u_44.instance.Frame.UIListLayout.Padding = UDim.new(0, 6)
        p_u_44.instance.Frame.Size = UDim2.new(0, 180, 0.5, 0)
        p_u_44.instance.Frame.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    end
    p_u_44.list_top_position_changed = v_u_6.new()
    p_u_44.instance.Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        p_u_44.list_top_position_changed:Fire()
    end)
    p_u_44.instance.Frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
        p_u_44.list_top_position_changed:Fire()
    end)
    p_u_44.instance.Frame.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        p_u_44.list_top_position_changed:Fire()
        p_u_44:_refresh_gamepad_selections()
    end)
    p_u_44.instance:GetPropertyChangedSignal("Enabled"):Connect(function()
        p_u_44.list_top_position_changed:Fire()
    end)
    p_u_44.watch = v_u_7.quick_watch({
        ["selection_parent"] = p_u_44.instance.Frame,
        ["default_selection"] = function()
            return p_u_44.sorted_buttons[#p_u_44.sorted_buttons]
        end,
        ["app_name"] = p_u_44.ClassName,
        ["quick_open_button"] = Enum.KeyCode.DPadRight,
        ["save_last_selection"] = false,
        ["open_override"] = function()
            return #p_u_44.sorted_buttons > 0
        end,
        ["close_override"] = function()
            if p_u_44.watch then
                p_u_44.watch:deactivate()
            end
            return false
        end,
        ["setup_button_actions"] = function()
            p_u_44:_refresh_gamepad_selections()
        end,
        ["teardown_button_actions"] = function()
            local v45 = p_u_44.sorted_buttons[#p_u_44.sorted_buttons]
            if v45 then
                v45 = p_u_44.button_gamepad_icons[v45]
            end
            if v45 then
                v45:update_key(Enum.KeyCode.DPadRight)
            end
        end
    })
end
return v10