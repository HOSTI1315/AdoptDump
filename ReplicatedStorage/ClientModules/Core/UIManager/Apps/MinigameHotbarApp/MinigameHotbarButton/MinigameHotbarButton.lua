--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MinigameHotbarApp.MinigameHotbarButton (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("Class")
local v_u_3 = v1("Maid")
local v_u_4 = v1("PlatformM")
local v5 = v1("TweenHelper")
local v_u_6 = v1("TweenPromise")
local v7 = v1("UIBaseElement")
local v_u_8 = v1("package:Promise4")
local v9 = v1("package:t")
local v_u_10 = game:GetService("ContextActionService")
local v_u_11 = game:GetService("UserInputService")
local v_u_12 = game:GetService("RunService")
local v_u_13 = v5.tween_info({
    ["time"] = 0.12
})
local v_u_14 = v9.strictInterface({
    ["layout_order"] = v9.intersection(v9.numberPositive, v9.integer),
    ["visible"] = v9.boolean,
    ["image"] = v9.string,
    ["image_size"] = v9.optional(v9.UDim2),
    ["inner_color"] = v9.Color3,
    ["gamepad_hotkey"] = v9.union(v9.literal(Enum.KeyCode.ButtonX), v9.literal(Enum.KeyCode.ButtonY)),
    ["pc_hotkey"] = v9.enum(Enum.KeyCode),
    ["world_tap_enabled"] = v9.boolean,
    ["get_can_use"] = v9.callback,
    ["get_use_promise"] = v9.callback,
    ["get_cooldown"] = v9.callback,
    ["get_stack_count"] = v9.optional(v9.callback),
    ["get_is_cooldown_paused"] = v9.optional(v9.callback)
})
local v15, v_u_16 = v2("MinigameHotbarButton", v7)
function v15.__init(p17, ...)
    v_u_16.__init(p17, ...)
    p17.hovering = false
    p17.using = false
    p17.destroyed = false
    p17.cooldown_percent = 0
    p17.cleanup = v_u_3.new()
    p17.use_maid = v_u_3.new()
end
function v15._update_size(p18)
    local v19
    if p18.using then
        v19 = p18.ui_base_scale + p18.ui_base_scale * 0.14
    elseif p18.hovering and p18.cooldown_percent == 0 then
        v19 = p18.ui_base_scale + p18.ui_base_scale * 0.11
    else
        v19 = p18.ui_base_scale
    end
    local v_u_20 = v_u_6.new(p18.instance.UIScale, v_u_13, {
        ["Scale"] = v19
    })
    p18.cleanup:GiveTask(function()
        v_u_20:cancel()
    end)
end
function v15._update_cooldown(p21, p22)
    p21.cooldown_percent = p22
    local v23 = 1 - p22
    if v23 == 1 then
        p21.button.CooldownOverlay.UIGradient.Transparency = NumberSequence.new(1)
        return
    elseif v23 == 0 then
        p21.button.CooldownOverlay.UIGradient.Transparency = NumberSequence.new(0)
    else
        local v24 = p21.button.CooldownOverlay.UIGradient
        local v25 = NumberSequence.new
        local v26 = {}
        local v27 = NumberSequenceKeypoint.new(0, 1, 0)
        local v28 = NumberSequenceKeypoint.new(v23, 1, 0)
        local v29 = NumberSequenceKeypoint.new
        local v30 = v23 + 0.001
        __set_list(v26, 1, {v27, v28, v29(math.min(v30, 1), 0, 0), NumberSequenceKeypoint.new(1, 0, 0)})
        v24.Transparency = v25(v26)
    end
end
function v15._start_cooldown(p31)
    p31:_update_cooldown(1)
end
function v15._is_cooldown_paused(p32)
    if p32.get_is_cooldown_paused then
        return p32.get_is_cooldown_paused()
    else
        return false
    end
end
function v15._update_stack_count(p33)
    if p33.get_stack_count then
        local v34 = p33.get_stack_count()
        p33.button.StackCount.Visible = true
        p33.button.StackCount.TextLabel.Text = "x" .. v34
        return v34
    end
end
function v15._can_use(p35)
    local v36 = p35.get_can_use() and not p35.using
    if v36 then
        v36 = p35.cooldown_percent == 0
    end
    return v36
end
function v15.reset_cooldown(p37)
    p37:_update_cooldown(0)
end
function v15.cancel_use(p38)
    p38.use_maid:DoCleaning()
    p38:reset_cooldown()
    p38:_update_stack_count()
end
function v15.update_console_button_prompt(p39, p40)
    local v41 = p39.button.XboxButtonY
    local v42
    if p40 then
        v42 = p39.gamepad_hotkey == Enum.KeyCode.ButtonY
    else
        v42 = p40
    end
    v41.Visible = v42
    local v43 = p39.button.XboxButtonX
    if p40 then
        p40 = p39.gamepad_hotkey == Enum.KeyCode.ButtonX
    end
    v43.Visible = p40
end
function v15.set_enabled(p44, p45)
    p44.button.Interactable = p45
    p44.button.Active = p45
end
function v15.use(p_u_46)
    if p_u_46:_can_use() then
        p_u_46.using = true
        p_u_46:_start_cooldown()
        p_u_46:_update_size()
        local v_u_53 = p_u_46.get_use_promise():finally(function(p47)
            if p_u_46.destroyed then
                return
            else
                p_u_46.using = false
                p_u_46:_update_size()
                local v48 = p_u_46:_update_stack_count()
                if p47 == v_u_8.Status.Cancelled then
                    p_u_46:reset_cooldown()
                elseif not v48 or v48 > 0 then
                    local v_u_49 = 1
                    local v_u_52 = v_u_8.fromEvent(v_u_12.Heartbeat, function(p50)
                        if p_u_46.cooldown_percent == 0 then
                            return true
                        end
                        if p_u_46:_is_cooldown_paused() then
                            return false
                        end
                        local v51 = v_u_49 - p50 / p_u_46.get_cooldown()
                        v_u_49 = math.max(v51, 0)
                        p_u_46:_update_cooldown(v_u_49)
                        return v_u_49 == 0
                    end):finally(function()
                        if not p_u_46.destroyed then
                            p_u_46:_update_size()
                        end
                    end)
                    p_u_46.use_maid:GiveTask(function()
                        v_u_52:cancel()
                    end)
                end
            end
        end)
        p_u_46.use_maid:GiveTask(function()
            v_u_53:cancel()
        end)
    end
end
function v15.start(p_u_54, p55, p56, p57)
    local v58 = v_u_14
    assert(v58(p57))
    local v59 = p57 or {}
    p_u_54.name = p55
    p_u_54.instance.Name = p_u_54.name
    p_u_54.instance.LayoutOrder = v59.layout_order
    p_u_54.instance.Visible = v59.visible
    p_u_54.instance.Parent = p56
    p_u_54.button = p_u_54.instance.Button
    p_u_54.button.ActionIcon.Image = v59.image
    p_u_54.button.ActionIcon.Size = v59.image_size or UDim2.fromOffset(60, 60)
    p_u_54.button.InnerColor.ImageColor3 = v59.inner_color
    p_u_54.button.StackCount.Visible = false
    p_u_54.ui_scale = p_u_54.instance.UIScale
    p_u_54.ui_scale.Scale = v_u_4.get_platform() == "phone" and 0.72 or 1
    p_u_54.ui_base_scale = p_u_54.ui_scale.Scale
    p_u_54.gamepad_hotkey = v59.gamepad_hotkey
    p_u_54.pc_hotkey = v59.pc_hotkey
    p_u_54.world_tap_enabled = v59.world_tap_enabled
    p_u_54.get_can_use = v59.get_can_use
    p_u_54.get_use_promise = v59.get_use_promise
    p_u_54.get_cooldown = v59.get_cooldown
    p_u_54.get_stack_count = v59.get_stack_count
    p_u_54.get_is_cooldown_paused = v59.get_is_cooldown_paused
    p_u_54:reset_cooldown()
    p_u_54:_update_stack_count()
    p_u_54.button.MouseEnter:connect(function()
        p_u_54.hovering = true
        p_u_54:_update_size()
    end)
    p_u_54.button.MouseLeave:connect(function()
        p_u_54.hovering = false
        p_u_54:_update_size()
    end)
    p_u_54.button.MouseButton1Down:connect(function()
        p_u_54:use()
    end)
    local v_u_60 = p_u_54.name .. "GamePad"
    v_u_10:BindAction(v_u_60, function(_, p61)
        if p61 == Enum.UserInputState.Begin then
            p_u_54:use()
        end
    end, false, p_u_54.gamepad_hotkey)
    local v_u_62 = p_u_54.name .. "PC"
    v_u_10:BindAction(v_u_62, function(_, p63)
        if p63 == Enum.UserInputState.Begin then
            p_u_54:use()
        end
    end, false, p_u_54.pc_hotkey)
    local v_u_64 = p_u_54.name .. "Mouse"
    if p_u_54.world_tap_enabled then
        v_u_10:BindAction(v_u_64, function(_, p65)
            if p65 == Enum.UserInputState.Begin then
                p_u_54:use()
            end
        end, false, Enum.UserInputType.MouseButton1)
        p_u_54.cleanup:GiveTask(v_u_11.TouchTapInWorld:Connect(function(_, p66)
            if not p66 then
                p_u_54:use()
            end
        end))
    end
    p_u_54.cleanup:GiveTask(function()
        v_u_10:UnbindAction(v_u_60)
        v_u_10:UnbindAction(v_u_62)
        if p_u_54.world_tap_enabled then
            v_u_10:UnbindAction(v_u_64)
        end
    end)
end
function v15.destroy(p67)
    p67.destroyed = true
    p67.cleanup:DoCleaning()
    p67.use_maid:DoCleaning()
    p67.instance:Destroy()
end
return v15