--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FreeGiftApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("SharedConstants")
local v_u_5 = v1("new:TutorialHelper")
local v_u_6 = v1("Debug").create_log()
local v7 = v2("FreeGiftApp", v1("UIBaseApp"))
function v7.show(p8)
    p8.instance.Enabled = true
end
function v7.hide(p9)
    p9.instance.Enabled = false
end
function v7.refresh(p10, p11)
    local v12 = p10.UIManager.is_closed({ "MainMenuApp" })
    if not p11[p10.ClassName] then
        v12 = false
    end
    if p10.UIManager.apps.HouseEditorWrapperApp.editor_open and p10.UIManager.apps.HouseEditorWrapperApp.drawer_open then
        v12 = false
    end
    p10:set_visibility(v12)
end
function v7.start(p_u_13)
    p_u_13.instance.ImageButton.MouseEnter:connect(function()
        game:GetService("TweenService"):Create(p_u_13.instance.ImageButton.UIScale, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            ["Scale"] = 1.2
        }):Play()
    end)
    p_u_13.instance.ImageButton.MouseLeave:connect(function()
        game:GetService("TweenService"):Create(p_u_13.instance.ImageButton.UIScale, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
            ["Scale"] = 1
        }):Play()
    end)
    p_u_13.instance.ImageButton.MouseButton1Down:connect(function()
        p_u_13.UIManager.set_app_visibility(p_u_13.ClassName, false)
        local v14 = v_u_4.daily_gift_config.messages
        for _, v15 in pairs(v14) do
            p_u_13.UIManager.apps.DialogApp:dialog(v15)
        end
        p_u_13.UIManager.apps.GuideArrowApp:navigate("MainMap", function()
            return workspace:WaitForChild("Events"):WaitForChild("Gifts"):WaitForChild("FreeGift").Position
        end, nil, true)
    end)
    spawn(function()
        local v16 = v_u_3.get("EventAPI/CheckDailyGiftAvailable"):InvokeServer()
        v_u_6("Daily gift availability", v16)
        if not v16 then
            local v17 = workspace:WaitForChild("Events"):WaitForChild("Gifts"):WaitForChild("FreeGift")
            v17.CanCollide = false
            v17.Transparency = 1
        end
        if not v_u_5.is_completed() then
            repeat
                task.wait(1)
            until v_u_5.is_completed()
            task.wait(25)
        end
        if v16 then
            p_u_13.UIManager.set_app_visibility(p_u_13.ClassName, true)
        else
            p_u_13.UIManager.set_app_visibility(p_u_13.ClassName, false)
        end
    end)
end
return v7