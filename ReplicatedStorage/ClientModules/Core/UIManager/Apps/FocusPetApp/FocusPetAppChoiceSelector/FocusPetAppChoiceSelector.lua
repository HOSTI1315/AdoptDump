--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FocusPetApp.FocusPetAppChoiceSelector (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("CloudValues")
local v_u_4 = v1("Maid")
local v_u_5 = v1("Signal")
local v_u_6 = v1("SoundPlayer")
local v7 = v1("TweenHelper")
local v_u_8 = v1("TweenPromise")
local v_u_9 = v1("XboxSupport")
local v_u_10 = v1("package:Promise")
local v_u_11 = v7.tween_info({
    ["time"] = 0.5,
    ["easing_style"] = Enum.EasingStyle.Back,
    ["easing_direction"] = Enum.EasingDirection.Out
})
local v_u_12 = v7.tween_info({
    ["time"] = 0.2
})
local v13 = v2("FocusPetAppChoiceSelector", v1("UIBaseElement"))
function v13.select_choice(p_u_14, p15)
    p_u_14.maid:DoCleaning()
    v_u_6.Interface:play("Backpack/OpenTooltip")
    local v16 = nil
    for v17, v18 in p15 do
        local v19
        if v18.is_primary then
            v19 = p_u_14:_render_primary_choice(v17, v18)
        else
            v19 = p_u_14:_render_choice(v17, v18)
        end
        v19.instance.Parent = p_u_14.main
        v16 = v16 or v19.instance
        p_u_14.maid:GiveTask(v19)
        p_u_14.maid:GiveTask(v19.instance)
    end
    p_u_14.visible = true
    p_u_14:_update_visibility()
    local v_u_20 = v_u_9.quick_watch({
        ["app_name"] = p_u_14.ClassName,
        ["selection_parent"] = p_u_14.main,
        ["default_selection"] = v16,
        ["open_override"] = function()
            return false
        end,
        ["close_override"] = function()
            p_u_14.selected_signal:Fire(nil)
            return false
        end
    })
    v_u_20:activate()
    p_u_14.maid:GiveTask(function()
        v_u_20:deactivate()
    end)
    local v21 = v_u_10.fromEvent(p_u_14.selected_signal)
    v21:finally(function()
        v_u_6.Interface:play("Backpack/CloseTooltip")
        v_u_20:deactivate()
    end)
    return v21
end
function v13.stop_selecting_choice(p22)
    p22.visible = false
    p22:_update_visibility()
end
function v13._update_visibility(p_u_23)
    p_u_23.display_maid:DoCleaning()
    if p_u_23.visible then
        p_u_23.main.GroupTransparency = 1
        p_u_23.main.Position = UDim2.new(0.5, 0, 0.5, 20)
        p_u_23.instance.Visible = true
        p_u_23.display_maid.tween = v_u_8.new(p_u_23.main, v_u_11, {
            ["GroupTransparency"] = 0,
            ["Position"] = UDim2.fromScale(0.5, 0.5)
        })
        p_u_23.display_maid.click_out = p_u_23.UIManager.apps.FocusPetApp:register_click_out_action(function()
            p_u_23.selected_signal:Fire(nil)
        end)
    else
        p_u_23.display_maid.tween = v_u_8.new(p_u_23.main, v_u_12, {
            ["GroupTransparency"] = 1,
            ["Position"] = UDim2.new(0.5, 0, 0.5, 20)
        }):andThen(function()
            p_u_23.instance.Visible = false
            p_u_23.maid:DoCleaning()
        end)
    end
end
function v13._render_primary_choice(p24, p25, p26)
    local v27 = p24.primary_choice_template:Clone()
    v27.LayoutOrder = p25
    v27.Content.ChoiceText.Text = p26.text
    v27.Content.Preference.Image = p26.image
    local v28 = v_u_3:getValue("ailments", "preferenceMultipliers").bucks
    v27.Content.BonusText.Text = ("%*X BONUS!"):format(v28)
    local v29 = p24.UIManager.wrap(v27, "FocusPetAppChoice")
    v29:start({
        ["index"] = p25,
        ["choice"] = p26,
        ["selected_signal"] = p24.selected_signal
    })
    return v29
end
function v13._render_choice(p30, p31, p32)
    local v33 = p30.choice_template:Clone()
    v33.LayoutOrder = p31
    v33.ChoiceText.Text = p32.text
    local v34 = p30.UIManager.wrap(v33, "FocusPetAppChoice")
    v34:start({
        ["index"] = p31,
        ["choice"] = p32,
        ["selected_signal"] = p30.selected_signal
    })
    return v34
end
function v13.start(p35)
    p35.visible = false
    p35.instance.Visible = false
    p35.tween = nil
    p35.main = p35.instance.Choices
    local v36, v37 = p35.UIManager.apps.FocusPetApp:get_choice_templates()
    p35.choice_template = v36
    p35.primary_choice_template = v37
    p35.maid = v_u_4.new()
    p35.display_maid = v_u_4.new()
    p35.selected_signal = v_u_5.new()
end
return v13