--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MainMenuApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("RouterClient")
local v3 = v_u_1("Class")("MainMenuApp", v_u_1("UIBaseApp"))
function v3.show_reward_notifications(p4, p5)
    if not p4.showing_rewards then
        if p5 then
            p4.shown_intro_manual_rewards = true
        elseif not p4.shown_intro_manual_rewards then
            return
        end
        p4.showing_rewards = true
        if p4.reward_notifications then
            while p4.reward_notifications[1] do
                local v6 = table.remove(p4.reward_notifications, 1)
                if not v6.intro_only or p5 then
                    p4.UIManager.apps.DialogApp:dialog(v6)
                end
            end
        end
        p4.showing_rewards = false
    end
end
function v3.show(p7)
    p7.instance.Enabled = true
    p7.UIManager.apps.TransitionsApp:set_blur(p7.ClassName, 10, 0)
end
function v3.hide(p8)
    p8.instance.Enabled = false
    p8.UIManager.apps.TransitionsApp:clear_blur(p8.ClassName)
end
function v3.send_reward_notification(p_u_9, p10, p11, p12)
    if p_u_9.reward_notifications == nil then
        p_u_9.reward_notifications = {}
    end
    local v13 = p_u_9.reward_notifications
    table.insert(v13, {
        ["text"] = p10,
        ["button"] = p11,
        ["intro_only"] = p12
    })
    task.spawn(function()
        p_u_9:show_reward_notifications(false)
    end)
end
function v3.start(p_u_14)
    v_u_1("PracticeDogHider")
    v_u_2.get_event("MsgAPI/RewardNotificationSent").OnClientEvent:Connect(function(p15, p16, p17)
        p_u_14:send_reward_notification(p15, p16 or "Okay", p17)
    end)
end
return v3