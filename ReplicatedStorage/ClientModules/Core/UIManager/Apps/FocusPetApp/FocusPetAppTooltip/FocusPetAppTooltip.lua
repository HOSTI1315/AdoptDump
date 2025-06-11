--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FocusPetApp.FocusPetAppTooltip (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("new:ActionHelper")
local v_u_3 = v1("new:AilmentsClient")
local v4 = v1("Class")
local v_u_5 = v1("Maid")
local v_u_6 = v1("PlatformM")
local v_u_7 = v1("Signal")
local v_u_8 = v1("SingleActionBuffer")
local v_u_9 = v1("SoundPlayer")
local v10 = v1("TweenHelper")
local v_u_11 = v1("TweenPromise")
local v_u_12 = v1("package:Sift")
local v_u_13 = v10.tween_info({
    ["time"] = 0.5,
    ["easing_style"] = Enum.EasingStyle.Back,
    ["easing_direction"] = Enum.EasingDirection.Out
})
local v_u_14 = v10.tween_info({
    ["time"] = 0.2
})
local v15 = v4("FocusPetAppTooltip", v1("UIBaseElement"))
function v15.update(p_u_16, p_u_17)
    local v18 = p_u_17 ~= nil
    if p_u_16.visible ~= v18 then
        p_u_16.visible = v18
        p_u_16:_update_visibility()
    end
    if p_u_17 then
        p_u_16:_render_ailment_card(p_u_17).instance.Parent = p_u_16.instance
        p_u_16.display_maid:GiveTask(v_u_3.get_changed_signal():Connect(function()
            local v19 = p_u_16.UIManager.apps.FocusPetApp.char_wrapper
            local v20 = v_u_3.get_ailments_for_pet(v19)
            if (v20[p_u_17.kind] or v_u_12.List.find(v_u_12.Dictionary.keys(v20), p_u_17.kind)) == nil then
                p_u_16:update(nil)
            end
        end))
    end
end
function v15._update_visibility(p_u_21)
    p_u_21.display_maid:DoCleaning()
    if p_u_21.visible then
        p_u_21.instance.GroupTransparency = 1
        p_u_21.instance.Position = UDim2.new(0.5, 0, 0.5, 20)
        p_u_21.instance.Visible = true
        p_u_21.display_maid.tween = v_u_11.new(p_u_21.instance, v_u_13, {
            ["GroupTransparency"] = 0,
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        })
        local v22 = {
            ["phone"] = function()
                p_u_21.display_maid.click_out = p_u_21.UIManager.apps.FocusPetApp:register_click_out_action(function()
                    v_u_9.Interface:play("Backpack/CloseTooltip")
                    p_u_21:update(nil)
                end)
            end,
            ["tablet"] = "phone"
        }
        v_u_6.run(v22)
    else
        p_u_21.display_maid.tween = v_u_11.new(p_u_21.instance, v_u_14, {
            ["GroupTransparency"] = 1,
            ["Position"] = UDim2.new(0.5, 0, 0.5, 20)
        }):andThen(function()
            p_u_21.instance.Visible = false
            p_u_21.instance:ClearAllChildren()
        end)
    end
end
function v15._render_ailment_card(p23, p24)
    local v25 = p23.template:Clone()
    local v26 = p23.UIManager.wrap(v25, "FocusPetAppAilmentCard")
    local v27 = {
        ["ailment"] = p24,
        ["selected_signal"] = p23.selected_signal,
        ["action_text"] = "start",
        ["interactable"] = v_u_6.run({
            ["phone"] = function()
                return true
            end,
            ["default"] = function()
                return false
            end,
            ["tablet"] = "phone"
        })
    }
    v26:start(v27)
    return v26
end
function v15.do_ailment_action(p28, p29)
    if p29.rate > 0 then
        p28.UIManager.apps.HintApp:hint({
            ["text"] = "This need is already in progress!",
            ["length"] = 2,
            ["yields"] = false,
            ["overridable"] = true
        })
    else
        p28:update(nil)
        p29:do_action(p28.UIManager.apps.FocusPetApp.char_wrapper)
    end
end
function v15.capture_focus(p_u_30)
    p_u_30:update(nil)
    p_u_30.buffer:run(function()
        task.wait(0.5)
    end)
    local v31 = p_u_30.UIManager.apps.FocusPetApp.ailments
    local v_u_32 = v31:get_ailment_hovered_signal()
    local v_u_33 = v31:get_ailment_selected_signal()
    local v38 = {
        ["phone"] = function()
            p_u_30.maid:GiveTask(v_u_33:Connect(function(p34)
                if not v_u_2.has_exclusive_tag("dialog") then
                    v_u_9.Interface:play("Backpack/OpenTooltip")
                    p_u_30:update(p34)
                end
            end))
            p_u_30.maid:GiveTask(p_u_30.selected_signal:Connect(function(p35)
                if p_u_30.UIManager.apps.FocusPetApp:check_can_interact_with_pet() then
                    v_u_9.Interface:play("Backpack/CloseTooltip")
                    p_u_30:do_ailment_action(p35)
                else
                    p_u_30:update(nil)
                end
            end))
        end,
        ["default"] = function()
            p_u_30.maid:GiveTask(v_u_32:Connect(function(p_u_36)
                p_u_30.buffer:run(function()
                    if not v_u_2.has_exclusive_tag("dialog") then
                        p_u_30:update(p_u_36)
                    end
                end)
            end))
            p_u_30.maid:GiveTask(v_u_33:Connect(function(p37)
                if p_u_30.UIManager.apps.FocusPetApp:check_can_interact_with_pet() then
                    v_u_9.Interface:play("Tooltip/TooltipButtonClick")
                    p_u_30:do_ailment_action(p37)
                end
            end))
        end,
        ["tablet"] = "phone"
    }
    v_u_6.run(v38)
end
function v15.release_focus(p39)
    if p39.tween then
        p39.tween:cancel()
    end
    p39.buffer:clear()
    p39.instance.Visible = false
    p39.instance:ClearAllChildren()
    p39.maid:DoCleaning()
end
function v15.start(p40)
    p40.selected_signal = v_u_7.new()
    p40.maid = v_u_5.new()
    p40.display_maid = v_u_5.new()
    p40.tween = nil
    p40.buffer = v_u_8.new()
    p40.template = p40.UIManager.apps.FocusPetApp:get_ailment_card_template()
end
return v15