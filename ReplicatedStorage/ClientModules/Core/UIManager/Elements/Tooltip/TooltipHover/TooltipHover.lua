--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Tooltip.TooltipHover (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Maid")
local v_u_4 = v1("PlatformM")
local v5 = v1("package:t")
local v_u_6 = v1("package:Promise")
local v_u_7 = game:GetService("RunService")
local v_u_8 = game:GetService("GuiService")
local v_u_9 = game:GetService("UserInputService")
local v10 = v2("TooltipHover", v1("UIBaseElement"))
local v11 = v5.strictInterface
local v12 = {
    ["valid_platforms"] = v5.strictInterface({
        ["desktop"] = v5.boolean,
        ["console"] = v5.boolean,
        ["tablet"] = v5.boolean,
        ["phone"] = v5.boolean
    }),
    ["position"] = v5.strictInterface({
        ["x_clamped"] = v5.boolean,
        ["y_clamped"] = v5.boolean,
        ["x_flip"] = v5.boolean,
        ["y_flip"] = v5.boolean
    })
}
local v_u_13 = v11(v12)
function v10._position_at(p14, p15, p16)
    local v17 = p14.tooltip:get_container()
    local v18 = p14.options.position
    local v19 = workspace.CurrentCamera.ViewportSize
    local v20 = v18.x_flip and -1 or 1
    local v21 = v18.y_flip and -1 or 1
    local v22 = 20 + v17.AbsoluteSize.X
    local v23 = 0 + v17.AbsoluteSize.Y
    local v24 = p15 + v20 * v22
    local v25 = p16 + v21 * v23
    if v18.x_clamped then
        if v20 < 0 then
            local v26 = v19.X - v22
            v24 = math.clamp(v24, 0, v26)
        else
            local v27 = v19.X - v22
            v24 = math.clamp(p15, 0, v27) + 20
        end
    elseif v20 < 0 then
        if v24 <= 0 then
            v24 = p15 + 20
        end
    elseif v20 > 0 then
        if v24 < v19.X then
            v24 = p15 + 20
        else
            v24 = p15 - v22
        end
    else
        v24 = p15
    end
    if v18.y_clamped then
        if v21 < 0 then
            local v28 = v19.Y - v23
            v25 = math.clamp(v25, 0, v28)
        else
            local v29 = v19.Y - v23
            v25 = math.clamp(p16, 0, v29) + 0
        end
    elseif v21 < 0 then
        if v25 <= 0 then
            v25 = p16 + 0
        end
    elseif v21 > 0 then
        if v25 < v19.Y then
            v25 = p16 + 0
        else
            v25 = p16 - v23
        end
    else
        v25 = p16
    end
    v17.Position = UDim2.new(0, v24, 0, v25)
end
function v10._set_mouse_leave_target(p_u_30, p_u_31, p_u_32)
    p_u_30.maid:DoCleaning()
    local function v33()
        p_u_30.mouse_leave_frame.Size = UDim2.new(0, p_u_31.AbsoluteSize.X + 26, 0, p_u_31.AbsoluteSize.Y + 26)
        p_u_30.mouse_leave_frame.Position = UDim2.new(0, p_u_31.AbsolutePosition.X - 13, 0, p_u_31.AbsolutePosition.Y - 13 + v_u_8:GetGuiInset().Y)
    end
    p_u_30.maid:GiveTask(p_u_31:GetPropertyChangedSignal("AbsolutePosition"):Connect(v33))
    p_u_30.maid:GiveTask(p_u_31:GetPropertyChangedSignal("AbsoluteSize"):Connect(v33))
    v33()
    local v_u_34 = p_u_30.mouse_leave_frame
    p_u_30.maid:GiveTask(v_u_34.MouseLeave:Connect(function()
        local v35 = v_u_34
        local v36 = v_u_9:GetMouseLocation() - v_u_8:GetGuiInset() - v35.AbsolutePosition
        local v37
        if v36.X >= 0 and (v36.Y > 0 and v36.X <= v35.AbsoluteSize.X) then
            v37 = v36.Y <= v35.AbsoluteSize.Y
        else
            v37 = false
        end
        if not v37 then
            p_u_30.maid:DoCleaning()
            p_u_32()
        end
    end))
end
function v10.start(p_u_38, p39)
    local v40 = {
        ["valid_platforms"] = {
            ["desktop"] = true,
            ["console"] = true,
            ["tablet"] = true,
            ["phone"] = true
        },
        ["position"] = {
            ["x_clamped"] = false,
            ["y_clamped"] = false,
            ["x_flip"] = false,
            ["y_flip"] = false
        }
    }
    p_u_38.options = v40
    p_u_38.tooltip = p39
    p_u_38.can_hover = true
    p_u_38.is_hovering = false
    p_u_38.previous_position = Vector2.new(0, 0)
    p_u_38.maid = v_u_3.new()
    p_u_38.mouse_leave_frame = Instance.new("Frame")
    p_u_38.mouse_leave_frame.Name = "MouseLeaveFrame"
    p_u_38.mouse_leave_frame.BackgroundTransparency = 1
    p_u_38.mouse_leave_frame.Parent = p_u_38.instance
    local function v42(p41)
        if p41 then
            if p_u_38.render_stepped then
                p_u_38.render_stepped:Disconnect()
                p_u_38.render_stepped = nil
            end
            if p_u_38.refreshed then
                p_u_38.refreshed:Disconnect()
                p_u_38.refreshed = nil
                return
            end
        elseif v_u_4.get_platform() == v_u_4.platform.desktop then
            p_u_38.render_stepped = v_u_7.RenderStepped:Connect(function()
                if not v_u_4.is_using_gamepad() then
                    if p_u_38.is_hovering then
                        p_u_38:position_at_mouse()
                    end
                end
            end)
            p_u_38.refreshed = p_u_38.tooltip:get_refresh_signal():Connect(function()
                if not v_u_4.is_using_gamepad() then
                    p_u_38:_position_at(p_u_38.previous_position.X, p_u_38.previous_position.Y)
                end
            end)
        end
    end
    v_u_4.get_gamepad_changed():Connect(v42)
    v42(v_u_4.is_using_gamepad())
end
function v10.set_options(p43, p44)
    local v45 = v_u_13(p44)
    assert(v45, "Invalid tooltip hover options passed.")
    p43.options = p44
end
function v10.set_can_hover(p46, p47)
    p46.can_hover = p47
    if not p47 then
        p46.maid:DoCleaning()
        p46.is_hovering = false
    end
end
function v10.position_at_mouse(p48)
    local v49 = v_u_9:GetMouseLocation()
    if not p48.instance.IgnoreGuiInset then
        local v50 = v_u_8:GetGuiInset()
        v49 = v49 - Vector2.new(0, v50.Y)
    end
    p48.previous_position = v49
    p48:_position_at(v49.X, v49.Y)
end
function v10.set_hover_callbacks(p_u_51, p_u_52)
    local v_u_53 = v_u_3.new()
    local function v54()
        v_u_53:DoCleaning()
    end
    if not p_u_51.options.valid_platforms[v_u_4.get_platform()] then
        return v54
    end
    local v61 = {
        ["desktop"] = function()
            v_u_53:GiveTask(p_u_52.frame.SelectionGained:Connect(function()
                if p_u_51.can_hover then
                    p_u_51.is_hovering = true
                    p_u_52.on_enter()
                end
            end))
            v_u_53:GiveTask(p_u_52.frame.SelectionLost:Connect(function()
                if p_u_51.can_hover then
                    p_u_51.is_hovering = false
                    p_u_52.on_exit()
                end
            end))
            v_u_53:GiveTask(p_u_52.frame.MouseEnter:Connect(function()
                if p_u_51.can_hover then
                    p_u_51.is_hovering = true
                    p_u_51:_set_mouse_leave_target(p_u_52.frame, function()
                        p_u_51.is_hovering = false
                        p_u_52.on_exit()
                    end)
                    p_u_52.on_enter()
                end
            end))
        end,
        ["console"] = "desktop",
        ["phone"] = function()
            local v_u_55 = 0
            local function v57()
                if p_u_51.can_hover then
                    v_u_55 = v_u_55 + 1
                    local v56 = v_u_55
                    v_u_6.delay(0.25):await()
                    if v56 == v_u_55 and p_u_51.can_hover then
                        p_u_51.is_hovering = true
                        p_u_52.on_enter()
                    end
                end
            end
            if p_u_52.frame:FindFirstAncestorOfClass("SurfaceGui") or not p_u_52.frame:IsA("GuiButton") then
                v_u_53:GiveTask(p_u_52.frame.InputBegan:Connect(function(p58)
                    if (p58.UserInputType == Enum.UserInputType.Touch or p58.UserInputType == Enum.UserInputType.MouseButton1) and p_u_51.can_hover then
                        v_u_55 = v_u_55 + 1
                        local v59 = v_u_55
                        v_u_6.delay(0.25):await()
                        if v59 == v_u_55 and p_u_51.can_hover then
                            p_u_51.is_hovering = true
                            p_u_52.on_enter()
                        end
                    end
                end))
            else
                v_u_53:GiveTask(p_u_52.frame.MouseButton1Down:Connect(v57))
            end
            v_u_53:GiveTask(v_u_9.InputEnded:Connect(function(p60)
                if p60.UserInputType == Enum.UserInputType.Touch then
                    v_u_55 = v_u_55 + 1
                    if p_u_51.can_hover and p_u_51.is_hovering then
                        p_u_51.is_hovering = false
                        p_u_52.on_exit()
                    end
                end
            end))
        end,
        ["tablet"] = "phone"
    }
    v_u_4.run(v61)
    return v54
end
return v10