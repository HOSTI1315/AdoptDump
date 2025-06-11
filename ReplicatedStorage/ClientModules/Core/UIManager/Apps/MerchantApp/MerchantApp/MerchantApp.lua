--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MerchantApp.MerchantApp (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("XboxSupport")
local v_u_3 = v1("package:Promise")
local v4 = v1("Class")("MerchantApp", (v1("UIBaseApp")))
function v4.show(p5)
    p5.instance.Enabled = true
end
function v4.hide(p6)
    p6.instance.Enabled = false
    p6.watch.selected_object = nil
end
function v4.display(p_u_7, p8)
    p_u_7.did_trade = false
    p_u_7.requirements:set_callbacks(p8.pick_item, p8.remove_item)
    p_u_7.requirements:set_requirements(p8.requirements)
    p_u_7.rewards:set_rewards(p8.rewards)
    p_u_7:update_item_list({})
    p_u_7:update_meets_requirements(false)
    p_u_7.UIManager.set_app_visibility(p_u_7.ClassName, true)
    return v_u_3.fromEvent(p_u_7.UIManager.app_visibilities_changed, function(p9, p10)
        local v11
        if p9 == p_u_7.ClassName then
            v11 = not p10
        else
            v11 = false
        end
        return v11
    end):andThen(function()
        return p_u_7.did_trade
    end)
end
function v4.update_meets_requirements(p12, p13)
    p12.trade_button:set_state(p13 and "normal" or "disabled")
end
function v4.update_item_list(p14, p15)
    p14.requirements:set_item_list(p15)
end
function v4._on_cancel(p16)
    p16.UIManager.set_app_visibility(p16.ClassName, false)
end
function v4._on_trade(p17)
    p17.did_trade = true
    p17.UIManager.set_app_visibility(p17.ClassName, false)
end
function v4.start(p_u_18)
    p_u_18.content = p_u_18.instance.Frame.Content
    p_u_18.requirements = p_u_18.UIManager.wrap(p_u_18.content.Requirements, "MerchantRequirements"):start()
    p_u_18.rewards = p_u_18.UIManager.wrap(p_u_18.content.Rewards, "MerchantRewards"):start()
    p_u_18.tooltip = p_u_18.UIManager.wrap(p_u_18.instance, "ItemTooltip"):start(p_u_18, p_u_18.instance.Frame)
    p_u_18.tooltip:set_mouse_leave_frame(p_u_18.instance.Frame)
    p_u_18.trade_button = p_u_18.UIManager.wrap(p_u_18.content:FindFirstChild("Trade", true), "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_18:_on_trade()
        end
    })
    p_u_18.cancel_button = p_u_18.UIManager.wrap(p_u_18.content:FindFirstChild("Cancel", true), "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_18:_on_cancel()
        end
    })
    p_u_18.exit_button = p_u_18.UIManager.wrap(p_u_18.content:FindFirstChild("Exit", true), "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_18:_on_cancel()
        end
    })
    p_u_18.watch = v_u_2.quick_watch({
        ["selection_parent"] = p_u_18.instance.Frame,
        ["open_close_instance"] = p_u_18.instance,
        ["default_selection"] = function()
            if p_u_18.requirements.last_selected_unique then
                return p_u_18.instance:FindFirstChild(p_u_18.requirements.last_selected_unique, true)
            else
                return p_u_18.instance:FindFirstChild("r_1", true)
            end
        end,
        ["app_name"] = p_u_18.ClassName,
        ["exit_buttons"] = { p_u_18.exit_button.instance }
    })
end
return v4