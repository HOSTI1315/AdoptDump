--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FocusPetApp.FocusPetAppGamepadSupport (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Maid")
local v_u_4 = v1("PlatformM")
local v5 = v1("TweenHelper")
local v_u_6 = v1("TweenPromise")
local v_u_7 = v1("XboxSupport")
local v_u_8 = v1("package:Sift")
local v_u_9 = v5.tween_info({
    ["time"] = 1.5,
    ["easing_style"] = Enum.EasingStyle.Linear,
    ["repeat_count"] = -1,
    ["reverses"] = true,
    ["delay_time"] = 0.5
})
local v_u_10 = game:GetService("ContextActionService")
local v11 = v2("FocusPetAppGamepadSupport", v1("UIBaseElement"))
function v11.start(p12)
    p12.maid = v_u_3.new()
    p12.tween_thumbstick = nil
    p12.instance.Visible = false
    p12.thumbstick_position = Vector2.zero
    p12.thumbstick = p12.instance.XboxButton
    p12.indicator = p12.instance.Indicator
end
function v11.update_display(p_u_13)
    local v14 = p_u_13.UIManager.apps.FocusPetApp
    if v_u_4.is_using_gamepad() and (p_u_13.watch and (p_u_13.watch:is_active() and not v14.is_ui_hidden)) then
        p_u_13.instance.Visible = true
        if p_u_13.tween_thumbstick then
            p_u_13.tween_thumbstick:cancel()
            p_u_13.tween_thumbstick = nil
        end
        p_u_13.tween_thumbstick = v_u_6.callback(120, -120, v_u_9, function(p15)
            local v16 = math.rad(p15)
            local v17 = (math.sin(v16) + 1) * 0.5
            local v18 = (math.cos(v16) + 1) * 0.5
            p_u_13.thumbstick.Thumbstick.AnchorPoint = Vector2.new(v17, v18)
        end)
        p_u_13.maid.tween_thumbstick = p_u_13.tween_thumbstick
    else
        p_u_13.instance.Visible = false
    end
end
function v11.capture_focus(p_u_19)
    local v_u_20 = p_u_19.UIManager.apps.FocusPetApp
    p_u_19.thumbstick.Visible = true
    p_u_19.indicator.Visible = false
    p_u_19.watch = v_u_7.proxy_watch({
        ["selection_parent"] = v_u_20.ailments.instance,
        ["activated"] = function()
            p_u_19:update_display()
        end,
        ["deactivated"] = function()
            p_u_19:update_display()
        end
    })
    p_u_19:update_display()
    p_u_19.maid:GiveTask(v_u_4.get_gamepad_changed():Connect(function()
        p_u_19:update_display()
    end))
    v_u_10:BindAction("focus_backpack_open", function(_, p21)
        if p21 == Enum.UserInputState.Begin then
            v_u_20.backpack:toggle_backpack()
        end
    end, false, Enum.KeyCode.ButtonY)
    v_u_10:BindAction("exit_focus_app", function(_, p22)
        if p22 == Enum.UserInputState.Begin then
            v_u_20:release_focus()
        end
    end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.E)
    v_u_10:BindActionAtPriority("select_ailment_radial", function(_, _, p23)
        local v24 = p23.Position
        local v25 = v24.X
        local v26 = v24.Y
        local v27 = math.atan2(v25, v26)
        local v_u_28 = math.deg(v27)
        local v29 = v24.Magnitude
        p_u_19.thumbstick_position = Vector2.new(v24.X, -v24.Y)
        if v29 < 0.7 or v_u_20.ailments.hidden then
            p_u_19.indicator.Visible = false
            p_u_19.watch:select_object(nil)
            return Enum.ContextActionResult.Sink
        end
        p_u_19.thumbstick.Visible = false
        p_u_19.indicator.Rotation = v_u_28
        p_u_19.indicator.Visible = true
        local v_u_30 = v_u_20.ailments.ailments
        local v39 = v_u_30[v_u_8.List.reduce(v_u_30, function(p31, p32, p33)
            local v34 = v_u_30[p31].instance.Parent.Rotation
            local v35 = p32.instance.Parent.Rotation
            local v36 = v34 - v_u_28
            local v37 = math.abs(v36)
            local v38 = v35 - v_u_28
            if math.abs(v38) < v37 then
                return p33
            else
                return p31
            end
        end, 1)]
        if v39.instance.Selectable then
            p_u_19.watch:select_object(v39.instance)
        else
            p_u_19.watch:select_object(nil)
        end
        return Enum.ContextActionResult.Sink
    end, false, Enum.ContextActionPriority.High.Value * 100, Enum.KeyCode.Thumbstick1)
    p_u_19.watch:activate()
    p_u_19.maid:GiveTask(function()
        v_u_10:UnbindAction("focus_backpack_open")
        v_u_10:UnbindAction("exit_focus_app")
        v_u_10:UnbindAction("select_ailment_radial")
        p_u_19.watch:deactivate()
        p_u_19.watch = nil
    end)
end
function v11.release_focus(p40)
    p40.instance.Visible = false
    p40.maid:DoCleaning()
end
return v11