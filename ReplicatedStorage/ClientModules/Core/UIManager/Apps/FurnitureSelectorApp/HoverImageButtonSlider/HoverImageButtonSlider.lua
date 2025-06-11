--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FurnitureSelectorApp.HoverImageButtonSlider (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ControlsDisabler")
local v_u_3 = v1("TweenPromise")
local v_u_4 = v1("PlatformM")
local v_u_5 = v1("Signal")
local v6 = v1("Class")
local v7 = v1("package:t")
local v_u_8 = v1("package:Sift")
local v_u_9 = game:GetService("UserInputService")
local v10 = v6("HoverImageButtonSlider")
local v_u_11 = v7.strictInterface({
    ["snap_pixels"] = v7.every(v7.integer, v7.numberPositive),
    ["tween_return"] = v7.optional(v7.boolean),
    ["axis"] = v7.literal("X", "Y")
})
local v_u_12 = {
    ["snap_pixels"] = 12,
    ["tween_return"] = true
}
function v10.__init(p_u_13, p14, p15)
    p_u_13.options = v_u_8.Dictionary.merge(v_u_12, p15)
    local v16 = v_u_11
    local v17 = p_u_13.options
    assert(v16(v17))
    p_u_13.finalized = v_u_5.new()
    p_u_13.changed = v_u_5.new()
    p_u_13.hover_image_button = p14
    p_u_13.container = p14:get_container()
    p_u_13.hover_image_button.MouseButton1Down:Connect(function()
        if v_u_4.is_using_gamepad() then
            p_u_13:_on_console()
        else
            p_u_13:_on_desktop()
        end
    end)
    return p_u_13
end
function v10._on_console(p_u_18)
    local v_u_19 = true
    local v_u_20 = 0
    task.spawn(function()
        v_u_2.disable_controls("HoverImageButtonSlider")
        local v_u_21 = 0
        local v_u_22 = p_u_18.options.axis
        local v23 = p_u_18.container.Position
        local v27 = v_u_9.InputChanged:Connect(function(p24, _)
            if p24.UserInputType == Enum.UserInputType.Gamepad1 and p24.KeyCode == Enum.KeyCode.Thumbstick1 then
                local v25 = p24.Position[p_u_18.options.axis]
                if math.abs(v25) >= 0.2 then
                    local v26 = p24.Position[v_u_22]
                    v_u_21 = math.sign(v26)
                    if v_u_22 == "Y" then
                        v_u_21 = -v_u_21
                        return
                    end
                else
                    v_u_21 = 0
                end
            end
        end)
        local v28 = v_u_21
        while v_u_19 do
            p_u_18.container.Position = v23 + UDim2.fromOffset(p_u_18.options.axis == "X" and (v28 * 60 or 0) or 0, p_u_18.options.axis == "Y" and (v28 * 60 or 0) or 0)
            v_u_20 = v_u_20 + v28
            p_u_18.changed:Fire(v_u_20, v28)
            task.wait(0.25)
        end
        p_u_18.container.Position = v23
        v27:Disconnect()
        v_u_2.enable_controls("HoverImageButtonSlider")
    end)
    p_u_18.hover_image_button.MouseButton1Up:Wait()
    p_u_18.finalized:Fire(v_u_20)
    v_u_19 = false
end
function v10._on_desktop(p_u_29)
    local v_u_30 = p_u_29.options.axis
    local v_u_31 = p_u_29.container.Position
    local v_u_32 = nil
    local v_u_33 = nil
    local v_u_34 = 0
    local v40 = v_u_9.InputChanged:Connect(function(p35, _)
        if p35.UserInputType == Enum.UserInputType.Touch or p35.UserInputType == Enum.UserInputType.MouseMovement then
            if not v_u_32 then
                v_u_32 = p35.Position[v_u_30]
            end
            local v36 = v_u_33 or 0
            local v37 = (p35.Position[v_u_30] - v_u_32) / p_u_29.options.snap_pixels
            v_u_33 = math.round(v37)
            local v38 = v_u_33 * p_u_29.options.snap_pixels
            local v39 = v_u_33 - v36
            v_u_34 = v_u_34 + v39
            p_u_29.container.Position = v_u_31 + UDim2.fromOffset(v_u_30 == "X" and v38 and v38 or 0, v_u_30 == "Y" and v38 and v38 or 0)
            p_u_29.changed:Fire(v_u_34, v39)
        end
    end)
    p_u_29.hover_image_button.MouseButton1Up:Wait()
    p_u_29.finalized:Fire(v_u_34)
    v40:Disconnect()
    if p_u_29.options.tween_return then
        v_u_3.new(p_u_29.container, TweenInfo.new(0.3), {
            ["Position"] = v_u_31
        })
    else
        p_u_29.container.Position = v_u_31
    end
end
function v10.get_changed_signal(p41)
    return p41.changed
end
function v10.get_finalized_signal(p42)
    return p42.finalized
end
return v10