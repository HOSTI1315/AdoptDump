--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FurnitureSelectorApp.HoverImageButton (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("MouseCursorHider")
local v_u_3 = v1("Signal")
local v4 = v1("Class")
local v_u_5 = v1("package:Promise")
local v_u_6 = game:GetService("Players")
local v_u_7 = game:GetService("UserInputService")
local v_u_8 = {
    [Enum.UserInputType.MouseButton1] = true,
    [Enum.UserInputType.Touch] = true,
    [Enum.UserInputType.Gamepad1] = {
        [Enum.KeyCode.ButtonB] = true,
        [Enum.KeyCode.ButtonR2] = true
    }
}
local function v_u_9() end
local v10 = v4("HoverImageButton")
function v10.__init(p_u_11, p12, p13, p14)
    p_u_11.enabled = true
    p_u_11.should_hide_mouse = p14
    p_u_11.button = p12
    p_u_11.container = p12.Container
    p_u_11.billboard = p13
    p_u_11.MouseButton1Down = v_u_3.new()
    p_u_11.MouseButton1Up = v_u_3.new()
    p_u_11.MouseEnter = p_u_11.button.MouseEnter
    p_u_11.MouseLeave = v_u_3.new()
    p_u_11.button_1_down_proxy = v_u_3.new()
    p_u_11.base_color = p_u_11.container.InnerCircle.ImageColor3
    p_u_11.hover_color = p_u_11.container.InnerCircle.BackgroundColor3
    p_u_11.crossout = Instance.new("ImageLabel")
    p_u_11.crossout.Name = "Cross"
    p_u_11.crossout.Image = "rbxassetid://1934436995"
    p_u_11.crossout.Size = UDim2.new(0, 54, 0, 54)
    p_u_11.crossout.Position = UDim2.new(0.5, 0, 0.5, 0)
    p_u_11.crossout.AnchorPoint = Vector2.new(0.5, 0.5)
    p_u_11.crossout.BackgroundTransparency = 1
    p_u_11.crossout.Visible = false
    p_u_11.crossout.ZIndex = 4
    p_u_11.crossout.Parent = p_u_11.container
    local v_u_15 = false
    local v_u_16 = v_u_5.resolve()
    local v_u_17 = p_u_11.button.Size
    p_u_11.button.MouseButton1Down:Connect(function()
        p_u_11.button_1_down_proxy:Fire()
    end)
    p_u_11.button_1_down_proxy:Connect(function()
        if p_u_11.enabled then
            if v_u_15 then
                v_u_16:cancel()
            else
                local v_u_18 = v_u_9
                if p_u_11.should_hide_mouse then
                    v_u_18 = v_u_2.hide()
                end
                p_u_11.MouseButton1Down:Fire()
                p_u_11.button.Size = UDim2.new(0, 2000, 0, 2000)
                v_u_15 = true
                v_u_16 = v_u_5.fromEvent(v_u_7.InputEnded, function(p19)
                    local v20 = v_u_8[p19.UserInputType]
                    if v20 then
                        if type(v20) == "table" then
                            return v20[p19.KeyCode] and true or false
                        else
                            return v20 and true or false
                        end
                    else
                        return false
                    end
                end):finally(function()
                    v_u_18()
                    p_u_11.MouseButton1Up:Fire()
                    p_u_11.button.Size = v_u_17
                    if not p_u_11:_is_mouse_on_button() then
                        p_u_11.container.InnerCircle.ImageColor3 = p_u_11.base_color
                        p_u_11.MouseLeave:Fire()
                    end
                    v_u_15 = false
                end)
            end
        else
            return
        end
    end)
    p_u_11.button.MouseEnter:Connect(function()
        if p_u_11.enabled then
            p_u_11.container.InnerCircle.ImageColor3 = p_u_11.hover_color
        end
    end)
    p_u_11.button.MouseLeave:Connect(function()
        p_u_11.container.InnerCircle.ImageColor3 = p_u_11.base_color
        p_u_11.MouseLeave:Fire()
    end)
end
function v10._is_mouse_on_button(p21)
    if not p21.billboard.Adornee then
        return false
    end
    local v22 = v_u_6.LocalPlayer:GetMouse()
    local v23 = workspace.CurrentCamera:WorldToScreenPoint(p21.billboard.Adornee.CFrame:PointToWorldSpace(p21.billboard.StudsOffsetWorldSpace))
    local v24 = p21.button.AbsolutePosition + Vector2.new(v23.X, v23.Y) - p21.billboard.AbsoluteSize / 2
    local v25 = Rect.new(v24, v24 + p21.button.AbsoluteSize)
    return v22.X >= v25.Min.X and (v22.X <= v25.Max.X and v22.Y >= v25.Min.Y) and v22.Y <= v25.Max.Y
end
function v10.fire_button_1_down(p26)
    p26.button_1_down_proxy:Fire()
end
function v10.set_enabled(p27, p28)
    p27.crossout.Visible = not p28
    p27.enabled = p28
end
function v10.get_colors(p29)
    return p29.base_color, p29.hover_color
end
function v10.set_colors(p30, p31, p32)
    p30.base_color = p31
    p30.hover_color = p32
    if p30:_is_mouse_on_button() then
        p30.container.InnerCircle.ImageColor3 = p30.hover_color
    else
        p30.container.InnerCircle.ImageColor3 = p30.base_color
    end
end
function v10.get_image(p33)
    return p33.container.Icon.Image
end
function v10.set_image(p34, p35)
    p34.container.Icon.Image = p35
end
function v10.get_container(p36)
    return p36.container
end
return v10