--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FocusPetApp.FocusPetAppAilmentSelector (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Maid")
local v_u_4 = v1("Signal")
local v_u_5 = v1("SoundPlayer")
local v6 = v1("TweenHelper")
local v_u_7 = v1("TweenPromise")
local v_u_8 = v1("XboxSupport")
local v_u_9 = v1("package:Promise")
local v_u_10 = v6.tween_info({
    ["time"] = 0.5,
    ["easing_style"] = Enum.EasingStyle.Back,
    ["easing_direction"] = Enum.EasingDirection.Out
})
local v_u_11 = v6.tween_info({
    ["time"] = 0.2
})
local v12 = v2("FocusPetAppAilmentSelector", v1("UIBaseElement"))
function v12.select_ailment(p_u_13, p14, p15)
    p_u_13.maid:DoCleaning()
    v_u_5.Interface:play("Backpack/OpenTooltip")
    local v16 = nil
    for v17, v18 in p14 do
        local v19 = p_u_13:_render_ailment_card(v17, v18, p15)
        v19.instance.Parent = p_u_13.main
        p_u_13.maid:GiveTask(v19)
        p_u_13.maid:GiveTask(v19.instance)
        v16 = v16 or v19
    end
    p_u_13.visible = true
    p_u_13:_update_visibility()
    local v_u_20 = v_u_8.quick_watch({
        ["app_name"] = p_u_13.ClassName,
        ["selection_parent"] = p_u_13.main,
        ["default_selection"] = v16.instance,
        ["open_override"] = function()
            return false
        end,
        ["close_override"] = function()
            p_u_13.selected_signal:Fire(nil)
            return false
        end
    })
    v_u_20:activate()
    p_u_13.maid:GiveTask(function()
        v_u_20:deactivate()
    end)
    local v21 = v_u_9.fromEvent(p_u_13.selected_signal)
    v21:finally(function()
        v_u_5.Interface:play("Backpack/CloseTooltip")
        v_u_20:deactivate()
    end)
    return v21
end
function v12.stop_selecting_ailment(p22)
    p22.visible = false
    p22:_update_visibility()
end
function v12._update_visibility(p_u_23)
    p_u_23.display_maid:DoCleaning()
    if p_u_23.visible then
        p_u_23.main.GroupTransparency = 1
        p_u_23.main.Position = UDim2.new(0.5, 0, 0.5, 20)
        p_u_23.instance.Visible = true
        p_u_23.display_maid.tween = v_u_7.new(p_u_23.main, v_u_10, {
            ["GroupTransparency"] = 0,
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        })
        p_u_23.display_maid.click_out = p_u_23.UIManager.apps.FocusPetApp:register_click_out_action(function()
            p_u_23.selected_signal:Fire(nil)
        end)
    else
        p_u_23.display_maid.tween = v_u_7.new(p_u_23.main, v_u_11, {
            ["GroupTransparency"] = 1,
            ["Position"] = UDim2.new(0.5, 0, 0.5, 20)
        }):andThen(function()
            p_u_23.instance.Visible = false
            p_u_23.maid:DoCleaning()
        end)
    end
end
function v12._render_ailment_card(p24, p25, p26, p27)
    local v28 = p24.template:Clone()
    local v29 = p24.UIManager.wrap(v28, "FocusPetAppAilmentCard")
    v29:start({
        ["index"] = p25,
        ["ailment_kind"] = p26,
        ["serialized_components"] = p27,
        ["selected_signal"] = p24.selected_signal,
        ["action_text"] = "select",
        ["interactable"] = true
    })
    return v29
end
function v12.start(p30)
    p30.visible = false
    p30.instance.Visible = false
    p30.tween = nil
    p30.main = p30.instance.Choices
    p30.template = p30.UIManager.apps.FocusPetApp:get_ailment_card_template()
    p30.maid = v_u_3.new()
    p30.display_maid = v_u_3.new()
    p30.selected_signal = v_u_4.new()
end
return v12