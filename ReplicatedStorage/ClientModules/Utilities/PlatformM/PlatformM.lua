--// ReplicatedStorage.ClientModules.Utilities.PlatformM (ModuleScript)

local v_u_1 = {}
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("GuiService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("UserInputService")
local v_u_6 = Instance.new("BindableEvent")
local v_u_7 = false
local v_u_8 = nil
local v_u_9 = {
    ["ButtonA"] = nil,
    ["ButtonB"] = "rbxassetid://1299025101",
    ["ButtonX"] = "rbxassetid://2842612058",
    ["ButtonY"] = "rbxassetid://1299184901",
    ["ButtonSelect"] = "rbxassetid://1299091898",
    ["ButtonLB"] = "rbxassetid://14384349473",
    ["ButtonRB"] = "rbxassetid://17160989707",
    ["ButtonLT"] = "rbxassetid://2297314065",
    ["ButtonCross"] = "rbxassetid://15151476377",
    ["ButtonCircle"] = "rbxassetid://15151475937",
    ["ButtonTriangle"] = "rbxassetid://15151476302",
    ["ButtonSquare"] = "rbxassetid://15151476227",
    ["ButtonShare"] = "rbxassetid://15161556542",
    ["ButtonTouchpad"] = "rbxassetid://15244483736",
    ["ButtonL1"] = "rbxassetid://14384349473",
    ["ButtonR1"] = "rbxassetid://17160989707",
    ["ButtonL2"] = "rbxassetid://2297314065",
    ["DPadUp"] = "rbxassetid://2045013442",
    ["DPadDown"] = "rbxassetid://15489835098",
    ["DPadLeft"] = "rbxassetid://15489835161",
    ["DPadRight"] = "rbxassetid://15489835223"
}
local v_u_10 = {
    ["ButtonCross"] = "X",
    ["ButtonCircle"] = "O"
}
local v_u_11 = {
    [Enum.UserInputType.Gamepad1] = true,
    [Enum.UserInputType.Gamepad2] = true,
    [Enum.UserInputType.Gamepad3] = true,
    [Enum.UserInputType.Gamepad4] = true,
    [Enum.UserInputType.Gamepad5] = true,
    [Enum.UserInputType.Gamepad6] = true,
    [Enum.UserInputType.Gamepad7] = true,
    [Enum.UserInputType.Gamepad8] = true
}
v_u_1.platform = {
    ["phone"] = "phone",
    ["tablet"] = "tablet",
    ["console"] = "console",
    ["desktop"] = "desktop"
}
local function v_u_15()
    if not (v_u_4:IsStudio() and v_u_5.TouchEnabled) then
        return false
    end
    local v12 = Instance.new("ScreenGui")
    v12.Name = "StudioMobileEmulatorCatch"
    v12.Parent = v_u_2.LocalPlayer.PlayerGui
    local v13 = Instance.new("TextBox")
    v13.Text = ""
    v13.BackgroundTransparency = 1
    v13.TextTransparency = 1
    v13.Parent = v12
    v13:CaptureFocus()
    local v14 = v_u_5.OnScreenKeyboardVisible
    v13:ReleaseFocus()
    v12:Destroy()
    return v14
end
v_u_1.platform = {
    ["phone"] = "phone",
    ["tablet"] = "tablet",
    ["console"] = "console",
    ["desktop"] = "desktop"
}
function v_u_1.get_platform()
    if v_u_8 then
        return v_u_8
    end
    if v_u_15() or v_u_5.TouchEnabled and not v_u_5.MouseEnabled then
        local v16 = game.Players.LocalPlayer:GetMouse()
        local v17 = v16.ViewSizeX
        local v18 = v16.ViewSizeY
        if v17 < 800 or v18 < 650 then
            v_u_8 = v_u_1.platform.phone
        else
            v_u_8 = v_u_1.platform.tablet
        end
    elseif v_u_3:IsTenFootInterface() then
        v_u_8 = v_u_1.platform.console
    else
        v_u_8 = v_u_1.platform.desktop
    end
    return v_u_8
end
function v_u_1.run(p19)
    local v20 = p19[v_u_1.get_platform()]
    if v20 then
        while typeof(v20) == "string" do
            v20 = p19[v20]
        end
    elseif p19.default then
        v20 = p19.default
    end
    if v20 then
        return v20()
    else
        return nil
    end
end
function v_u_1.is_mouse_enabled()
    return v_u_5.MouseEnabled
end
function v_u_1.mouse_down_or_click()
    return v_u_5.TouchEnabled and "MouseButton1Click" or "MouseButton1Down"
end
function v_u_1.is_using_gamepad()
    return v_u_7 and true or false
end
function v_u_1.get_gamepad_changed()
    return v_u_6.Event
end
function v_u_1.get_custom_icon(p21)
    return v_u_9[v_u_5:GetStringForKeyCode(p21)] or v_u_5:GetImageForKeyCode(p21)
end
function v_u_1.get_player_facing_button_name(p22)
    local v23 = v_u_5:GetStringForKeyCode(p22)
    if v_u_10[v23] then
        return v_u_10[v23]
    elseif v23:sub(1, 6) == "Button" then
        return v23:sub(7, -1)
    elseif v23:sub(1, 4) == "DPad" then
        return v23:sub(5, -1)
    else
        return v23
    end
end
function v_u_1.init()
    v_u_7 = v_u_5.GamepadEnabled
    v_u_5.LastInputTypeChanged:Connect(function(p24)
        if p24.Value ~= Enum.UserInputType.Focus then
            local v25 = v_u_11[p24] == true
            if v_u_8 ~= "desktop" and v_u_8 ~= "console" then
                v25 = false
            end
            if v25 ~= v_u_7 then
                v_u_3.SelectedObject = nil
                v_u_7 = v25
                v_u_6:Fire(v25)
            end
        end
    end)
end
return v_u_1