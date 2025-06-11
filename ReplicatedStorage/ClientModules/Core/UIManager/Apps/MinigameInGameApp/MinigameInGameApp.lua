--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MinigameInGameApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ColorThemeManager")
local v_u_3 = v1("TweenPromise")
local v4 = v1("TweenHelper")
local v_u_5 = v1("PlatformM")
local v_u_6 = v1("Signal")
local v7 = v1("Class")
local v_u_8 = v1("package:Promise")
local v_u_9 = v1("package:t")
local v_u_10 = game:GetService("TweenService")
local v11 = v_u_9.strictInterface
local v12 = {
    ["title"] = v_u_9.string,
    ["exit_title"] = v_u_9.optional(v_u_9.string),
    ["exit_callback"] = v_u_9.optional(v_u_9.callback),
    ["left"] = v_u_9.optional(v_u_9.strictInterface({
        ["title"] = v_u_9.string,
        ["value"] = v_u_9.union(v_u_9.string, v_u_9.number),
        ["title_x_alignment"] = v_u_9.optional(v_u_9.enum(Enum.TextXAlignment)),
        ["value_x_alignment"] = v_u_9.optional(v_u_9.enum(Enum.TextXAlignment)),
        ["is_value_animated"] = v_u_9.optional(v_u_9.boolean)
    })),
    ["right"] = v_u_9.optional(v_u_9.strictInterface({
        ["title"] = v_u_9.string,
        ["value"] = v_u_9.union(v_u_9.string, v_u_9.number),
        ["title_x_alignment"] = v_u_9.optional(v_u_9.enum(Enum.TextXAlignment)),
        ["value_x_alignment"] = v_u_9.optional(v_u_9.enum(Enum.TextXAlignment)),
        ["is_value_animated"] = v_u_9.optional(v_u_9.boolean)
    })),
    ["below"] = v_u_9.optional(v_u_9.strictInterface({
        ["value"] = v_u_9.union(v_u_9.string, v_u_9.number)
    })),
    ["color_override"] = v_u_9.optional(v_u_9.Color3)
}
local v_u_13 = v11(v12)
local v_u_14 = v4.tween_info({
    ["time"] = 0.75,
    ["easing_style"] = Enum.EasingStyle.Quad,
    ["easing_direction"] = Enum.EasingDirection.Out
})
local v_u_15 = v7("DisplayController")
function v_u_15.__init(p16, p17)
    p16.app = p17
    p16.instance = p17.instance
    p16.ticket = p17.display_ticket
    p16.left_value = nil
    p16.left_value_animate_promise = nil
    p16.left_value_is_animated = false
    p16.right_value = nil
    p16.right_value_animate_promise = nil
    p16.right_value_is_animated = false
end
function v_u_15.is_active(p18)
    return p18.ticket == p18.app.display_ticket
end
function v_u_15.promise_animate_value(p_u_19, p_u_20, p21)
    local v22 = p_u_20.Text
    local v_u_23 = tonumber(v22)
    local v_u_24 = tonumber(p21)
    if v_u_23 ~= nil and (v_u_24 ~= nil and (math.floor(v_u_23) == v_u_23 and math.floor(v_u_24) == v_u_24)) then
        local v_u_25 = os.clock()
        return v_u_8.new(function(p26, _, p27)
            while task.wait() do
                if p27() then
                    return
                end
                if not p_u_19:is_active() then
                    p26()
                    return
                end
                local v28 = (os.clock() - v_u_25) / 1
                if v28 > 1 then
                    p_u_20.Text = v_u_24
                    p26()
                    return
                end
                local v29 = v_u_10:GetValue(v28, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                local v30 = v_u_23
                local v31 = v30 + (v_u_24 - v30) * v29
                p_u_20.Text = math.ceil(v31)
            end
        end)
    end
    warn("Cannot animate unless both initial and new values are integers.")
    p_u_20.Text = v_u_24
    return v_u_8.resolve()
end
function v_u_15.promise_inactive(p_u_32)
    if p_u_32:is_active() then
        return v_u_8.fromEvent(p_u_32.app.display_ticket_changed, function()
            return not p_u_32:is_active()
        end)
    else
        return v_u_8.resolve()
    end
end
function v_u_15.set_below_visible(p33, p34)
    if p33:is_active() then
        p33.instance.Body.Below.Visible = p34
    end
end
function v_u_15.set_below_value(p35, p36)
    if p35:is_active() then
        p35.below_value = p36
        p35.instance.Body.Below.Container.ValueLabel.Text = p35.below_value
    end
end
function v_u_15.set_left_visible(p37, p38)
    if p37:is_active() then
        p37.instance.Body.Left.Visible = p38
    end
end
function v_u_15.set_left_title(p39, p40)
    if p39:is_active() then
        p39.instance.Body.Left.Container.TitleLabel.Text = p40
    end
end
function v_u_15.set_left_value(p41, p42)
    if p41:is_active() then
        local v43 = p41.left_value_is_animated
        if v43 then
            v43 = p41.left_value ~= nil
        end
        p41.left_value = p42
        if v43 then
            if p41.left_value_animate_promise then
                p41.left_value_animate_promise:cancel()
            end
            p41:promise_animate_value(p41.instance.Body.Left.Container.ValueLabel, p41.left_value)
        else
            p41.instance.Body.Left.Container.ValueLabel.Text = p41.left_value
        end
    else
        return
    end
end
function v_u_15.set_left_value_is_animated(p44, p45)
    if p44:is_active() then
        p44.left_value_is_animated = p45
    end
end
function v_u_15.set_left_title_x_alignment(p46, p47)
    if p46:is_active() then
        p46.instance.Body.Left.Container.TitleLabel.TextXAlignment = p47
    end
end
function v_u_15.set_left_value_x_alignment(p48, p49)
    if p48:is_active() then
        p48.instance.Body.Left.Container.ValueLabel.TextXAlignment = p49
    end
end
function v_u_15.set_right_visible(p50, p51)
    if p50:is_active() then
        p50.instance.Body.Right.Visible = p51
    end
end
function v_u_15.set_right_title(p52, p53)
    if p52:is_active() then
        p52.instance.Body.Right.Container.TitleLabel.Text = p53
    end
end
function v_u_15.set_right_value(p54, p55)
    if p54:is_active() then
        local v56 = p54.right_value_is_animated
        if v56 then
            v56 = p54.right_value ~= nil
        end
        p54.right_value = p55
        if v56 then
            if p54.right_value_animate_promise then
                p54.right_value_animate_promise:cancel()
            end
            p54:promise_animate_value(p54.instance.Body.Right.Container.ValueLabel, p54.right_value)
        else
            p54.instance.Body.Right.Container.ValueLabel.Text = p54.right_value
        end
    else
        return
    end
end
function v_u_15.set_right_value_is_animated(p57, p58)
    if p57:is_active() then
        p57.right_value_is_animated = p58
    end
end
function v_u_15.set_right_title_x_alignment(p59, p60)
    if p59:is_active() then
        p59.instance.Body.Right.Container.TitleLabel.TextXAlignment = p60
    end
end
function v_u_15.set_right_value_x_alignment(p61, p62)
    if p61:is_active() then
        p61.instance.Body.Right.Container.ValueLabel.TextXAlignment = p62
    end
end
function v_u_15.set_title(p63, p64)
    if p63:is_active() then
        p63.instance.Body.Middle.Container.TitleLabel.Text = p64
    end
end
function v_u_15.set_body_visible(p65, p66)
    if p65:is_active() then
        p65.instance.Body.Visible = p66
    end
end
function v_u_15.set_exit_title(p67, p68)
    if p67:is_active() then
        p67.instance.ExitButton.Face.TextLabel.Text = p68
    end
end
function v_u_15.set_exit_callback(p_u_69, p_u_70)
    if p_u_69:is_active() then
        if p_u_70 then
            p_u_69.instance.ExitButton.Visible = true
            p_u_69.app:_set_exit_callback(function()
                if p_u_69:is_active() then
                    if v_u_9.callback(p_u_70) then
                        p_u_70()
                    end
                end
            end)
        else
            p_u_69.instance.ExitButton.Visible = false
        end
    else
        return
    end
end
local v71 = v7("MinigameInGameApp", v1("UIBaseApp"))
function v71._set_exit_callback(p72, p73)
    p72.exit_button_callback = p73
end
function v71._setup_exit_button(p74)
    local v_u_75 = v_u_6.new()
    local v_u_76 = p74.instance.ExitButton
    v_u_5.run({
        ["desktop"] = function()
            v_u_76.AnchorPoint = Vector2.new(0, 1)
            v_u_76.Position = UDim2.new(0, 10, 1, -10)
            v_u_76.Size = UDim2.new(0, 180, 0, 55)
        end,
        ["phone"] = function()
            v_u_76.AnchorPoint = Vector2.new(1, 0)
            v_u_76.Position = UDim2.new(1, -10, 0, 10)
        end,
        ["tablet"] = "phone",
        ["console"] = "desktop"
    })
    v_u_5.run({
        ["tablet"] = function()
            v_u_76.Size = UDim2.new(0, 180, 0, 55)
        end
    })
    p74.UIManager.wrap(v_u_76.XboxButton, "GamepadIcon"):start({
        ["key"] = Enum.KeyCode.DPadRight
    })
    p74.UIManager.wrap(v_u_76, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            v_u_75:Fire()
        end
    }):set_state("cancel")
    return v_u_75
end
function v71.display(p77, p78)
    local v79 = v_u_13
    assert(v79(p78))
    p77.display_ticket = p77.display_ticket + 1
    p77.display_ticket_changed:Fire()
    local v80 = p78.title
    local v81 = v_u_15.new(p77)
    v81:set_title(v80)
    v81:set_exit_callback(p78.exit_callback)
    v81:set_exit_title(p78.exit_title or "Exit Minigame")
    v81:set_body_visible(true)
    v81:set_left_visible(p78.left ~= nil)
    if p78.left then
        v81:set_left_title(p78.left.title)
        v81:set_left_value(p78.left.value)
        v81:set_left_title_x_alignment(p78.left.title_x_alignment or Enum.TextXAlignment.Left)
        v81:set_left_value_x_alignment(p78.left.value_x_alignment or Enum.TextXAlignment.Center)
        v81:set_left_value_is_animated(p78.left.is_value_animated or false)
    end
    v81:set_right_visible(p78.right ~= nil)
    if p78.right then
        v81:set_right_title(p78.right.title)
        v81:set_right_value(p78.right.value)
        v81:set_right_title_x_alignment(p78.right.title_x_alignment or Enum.TextXAlignment.Right)
        v81:set_right_value_x_alignment(p78.right.value_x_alignment or Enum.TextXAlignment.Center)
        v81:set_right_value_is_animated(p78.right.is_value_animated or false)
    end
    v81:set_below_visible(p78.below ~= nil)
    if p78.below then
        v81:set_below_value(p78.below.value)
    end
    local v82 = p78.color_override or v_u_2.lookup("saturated")
    local v83 = p78.color_override ~= nil and true or nil
    p77.instance.Body.Left.Container.ImageColor3 = v82
    p77.instance.Body.Left.Container.TitleLabel.TextColor3 = v82
    p77.instance.Body.Right.Container.ImageColor3 = v82
    p77.instance.Body.Right.Container.TitleLabel.TextColor3 = v82
    p77.instance.Body.Middle.Container.TitleLabel.TextColor3 = v82
    p77.instance.Body.Below.Container.ValueLabel.TextColor3 = v82
    p77.instance.Body.Left.Container:SetAttribute("skip_color_theme", v83)
    p77.instance.Body.Left.Container.TitleLabel:SetAttribute("skip_color_theme", v83)
    p77.instance.Body.Right.Container:SetAttribute("skip_color_theme", v83)
    p77.instance.Body.Right.Container.TitleLabel:SetAttribute("skip_color_theme", v83)
    p77.instance.Body.Middle.Container.TitleLabel:SetAttribute("skip_color_theme", v83)
    p77.instance.Body.Below.Container.ValueLabel:SetAttribute("skip_color_theme", v83)
    p77.UIManager.set_app_visibility(p77.ClassName, true)
    p77.current_controller = v81
    return v81
end
function v71.show(p_u_84)
    p_u_84.show_hide_tween:cancel()
    p_u_84.show_hide_tween = v_u_3.new(p_u_84.instance.Body, v_u_14, {
        ["Position"] = UDim2.new(0.5, 0, 0, 0)
    })
    p_u_84.instance.Enabled = true
    game:GetService("ContextActionService"):BindAction("ExitMinigame", function(_, p85)
        if p85 == Enum.UserInputState.Begin then
            if p_u_84.instance.ExitButton.Visible ~= false and p_u_84.instance.Enabled ~= false then
                p_u_84.exit_button_activated:Fire()
            end
        else
            return
        end
    end, false, Enum.KeyCode.DPadRight)
end
function v71.hide(p_u_86)
    p_u_86.show_hide_tween:cancel()
    p_u_86.show_hide_tween = v_u_3.new(p_u_86.instance.Body, v_u_14, {
        ["Position"] = UDim2.new(0.5, 0, -0.5, 0)
    }):andThen(function()
        p_u_86.instance.Enabled = false
    end)
    game:GetService("ContextActionService"):UnbindAction("ExitMinigame")
end
function v71.start(p_u_87)
    p_u_87.instance.Body.Visible = true
    p_u_87.display_ticket = 0
    p_u_87.display_ticket_changed = v_u_6.new()
    p_u_87.current_controller = nil
    function p_u_87.exit_button_callback() end
    p_u_87.show_hide_tween = v_u_8.resolve()
    p_u_87.exit_button_activated = p_u_87:_setup_exit_button()
    p_u_87.exit_button_activated:Connect(function()
        p_u_87.exit_button_callback()
    end)
end
return v71