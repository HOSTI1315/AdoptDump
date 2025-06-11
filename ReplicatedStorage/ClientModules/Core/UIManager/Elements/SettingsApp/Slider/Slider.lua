--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.SettingsApp.Slider (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Signal")
local v_u_4 = v1("XboxSupport")
local v5 = v1("package:t")
local v_u_6 = v1("package:Sift")
local v_u_7 = v1("package:Promise")
local v_u_8 = game:GetService("RunService")
local v_u_9 = game:GetService("GuiService")
local v_u_10 = game:GetService("UserInputService")
local v_u_11 = {
    [Enum.UserInputType.MouseButton1] = true,
    [Enum.UserInputType.Touch] = true
}
local v12 = v2("Slider", v1("UIBaseElement"))
local v_u_13 = v5.strictInterface({
    ["min"] = v5.number,
    ["max"] = v5.number,
    ["interval"] = v5.optional(v5.numberPositive),
    ["show_as_percentage"] = v5.boolean,
    ["default"] = v5.number,
    ["formatter"] = v5.optional(v5.callback)
})
function v12._set_percent(p14, p15)
    local v16 = p14.line.AbsoluteSize.X
    local v17 = p15 * v16
    p14.percentage = math.clamp(v17, 0, v16) / v16
    if p14.interval > 0 then
        local v18 = p14.interval / (p14.options.max - p14.options.min)
        local v19 = p14.percentage / v18 + 0.5
        p14.percentage = math.floor(v19) * v18
    end
    p14.handle.Position = UDim2.new(p14.percentage, 0, 0.5, 0)
    if p14.options.formatter then
        p14.value_label.Text = p14.options.formatter(p14:get()) or p14:get()
    elseif p14.options.show_as_percentage then
        local v20 = p14.value_label
        local v21 = p14.percentage * 100
        v20.Text = math.floor(v21) .. "%"
    else
        p14.value_label.Text = p14:get()
    end
    p14.changed:Fire(p14:get())
end
function v12.console_activated(p_u_22)
    local v_u_23 = v_u_9.SelectedObject
    p_u_22.handle.Selectable = true
    local v_u_24 = v_u_4.get_watch_from_parent(p_u_22.instance)
    local v_u_25 = v_u_4.narrow_selection_parent(p_u_22.handle)
    v_u_24:select_object(p_u_22.handle)
    v_u_24:disable_button_actions()
    local v_u_26 = 0
    local v_u_27 = -1
    local v_u_33 = v_u_10.InputChanged:Connect(function(p28, p29)
        if p29 and p28.KeyCode == Enum.KeyCode.Thumbstick1 then
            local v30 = p28.Position.X
            local v31
            if math.abs(v30) > 0.35 then
                local v32 = p28.Position.X
                v31 = math.sign(v32) or 0
            else
                v31 = 0
            end
            v_u_26 = v31
        end
    end)
    local v34 = p_u_22.interval
    local v35 = (p_u_22.options.max - p_u_22.options.min) / 100
    local v_u_36 = math.max(v34, v35)
    local v_u_39 = v_u_8.Stepped:Connect(function(_, p37)
        local v38 = tick()
        if p_u_22.interval == 0 then
            p_u_22:set(p_u_22:get() + v_u_26 * 5 * p37 * 60)
        elseif v38 - v_u_27 > 0.1 then
            v_u_27 = v38
            p_u_22:set(p_u_22:get() + v_u_36 * v_u_26)
        end
    end)
    v_u_7.race({ v_u_7.fromEvent(v_u_10.InputBegan, function(p40)
            return p40.KeyCode == Enum.KeyCode.ButtonA and true or p40.KeyCode == Enum.KeyCode.ButtonB
        end), v_u_7.fromEvent(v_u_9:GetPropertyChangedSignal("SelectedObject"), function()
            local v41 = v_u_9.SelectedObject
            if v41 then
                v41 = not v_u_9.SelectedObject:IsDescendantOf(p_u_22.instance)
            end
            return v41 and true or false
        end) }):andThen(function()
        v_u_25()
        v_u_24:enable_button_actions()
        p_u_22.handle.Selectable = false
        v_u_24:select_object(v_u_23)
        v_u_33:Disconnect()
        v_u_39:Disconnect()
    end)
end
function v12.get(p42)
    return p42.options.min + p42.percentage * (p42.options.max - p42.options.min)
end
function v12.set(p43, p44)
    p43:_set_percent((p44 - p43.options.min) / (p43.options.max - p43.options.min))
end
function v12.start(p_u_45, p46)
    local v47 = v_u_13(p46)
    assert(v47, "Options failed to validate.")
    p_u_45.options = v_u_6.Dictionary.copy(p46)
    local v48 = p46.max - p46.min
    local v49
    if p46.interval then
        local v50 = p46.interval
        v49 = math.clamp(v50, 0, v48)
    else
        v49 = 0
    end
    p_u_45.interval = v49
    p_u_45.changed = v_u_3.new()
    p_u_45.value_label = p_u_45.instance.ValueLabel
    p_u_45.line = p_u_45.instance.Line
    p_u_45.handle = p_u_45.line.Handle
    p_u_45.percentage = 0
    p_u_45:set(p_u_45.options.default)
    local v_u_51 = p_u_45.UIManager.wrap(p_u_45.handle, "UIDragger"):start()
    p_u_45.dragger = v_u_51
    v_u_51.drag_changed:Connect(function(_, p52)
        local v53 = p_u_45.line.AbsoluteSize.X
        p_u_45:_set_percent((p52.Position.X - p_u_45.line.AbsolutePosition.X) / v53)
    end)
    p_u_45.line.InputBegan:Connect(function(p54)
        if v_u_11[p54.UserInputType] then
            local v55 = p_u_45.line.AbsoluteSize.X
            p_u_45:_set_percent((p54.Position.X - p_u_45.line.AbsolutePosition.X) / v55)
            v_u_51:force_start_drag(p54)
        end
    end)
    return p_u_45
end
return v12