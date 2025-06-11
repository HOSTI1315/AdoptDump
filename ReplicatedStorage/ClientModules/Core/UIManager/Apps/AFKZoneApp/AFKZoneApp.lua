--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.AFKZoneApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("ColorThemeManager")
local v_u_3 = v1("FormatHelper")
local v4 = v1("Class")
local v_u_5 = v1("Maid")
local v_u_6 = v1("TweenPromise")
local v7 = v1("TweenHelper")
local v_u_8 = v1("package:Promise")
local v_u_9 = game:GetService("RunService")
local v10 = v4("AFKZoneApp", v1("UIBaseApp"))
local v_u_11 = v7.tween_info({
    ["time"] = 0.5,
    ["easing_style"] = Enum.EasingStyle.Quad,
    ["easing_direction"] = Enum.EasingDirection.InOut,
    ["repeat_count"] = -1,
    ["reverses"] = true,
    ["delay_time"] = 0
})
function v10._add_tick(p12, p13, p14, p15, p16)
    local v_u_17 = p12.tick_templates[p14]:Clone()
    v_u_17.Name = p14
    v_u_17.Position = UDim2.fromScale(p16, 0.5)
    v_u_17.ImageColor3 = v_u_2.lookup("background")
    v_u_17:SetAttribute("CompletedPercent", p16)
    v_u_17:SetAttribute("IsVisuallyCompleted", false)
    v_u_17:SetAttribute("Index", p13)
    v_u_17.Parent = p12.tick_container
    local v_u_19 = v_u_6.callback_heartbeat(0, 1, p15, v_u_11, function(p18)
        v_u_17.Rotation = (1 - p18) * -5 + p18 * 5
    end)
    p12.tick_maid:GiveTask(function()
        v_u_19:cancel()
        v_u_17:Destroy()
    end)
    return v_u_17
end
function v10._set_progress_percent(p20, p21)
    p20.progress_light.Background.Size = UDim2.fromScale(1 / p21, 1)
    p20.progress_light.Size = UDim2.fromScale(p21, 1)
    p20.progress_dark.Background.Size = UDim2.fromScale(1 / (1 - p21), 1)
    p20.progress_dark.Size = UDim2.fromScale(1 - p21, 1)
    for _, v22 in p20.tick_container:GetChildren() do
        local v23 = v22:GetAttribute("CompletedPercent")
        if v23 and (v23 <= p21 and not v22:GetAttribute("IsVisuallyCompleted")) then
            v22:SetAttribute("IsVisuallyCompleted", true)
            v22.ImageColor3 = Color3.fromRGB(255, 224, 105)
            if p20.tick_passed_callback then
                p20.tick_passed_callback(v22:GetAttribute("Index"))
            end
        end
    end
end
function v10.set_timer_text(p24, p25)
    p24.timer_label.Text = p25
end
function v10.promise_countdown(p_u_26, p_u_27, p_u_28, p29, _)
    p_u_26.UIManager.set_app_visibility(p_u_26.ClassName, true)
    p_u_26.tick_maid:DoCleaning()
    for v30, v31 in p29 do
        local v32 = (v31.timestamp - p_u_27) / p_u_28
        local v33 = math.clamp(v32, 0, 1)
        local v34 = v30 - 1
        local v35 = #p29 - 1
        local v36 = v34 / math.max(1, v35)
        p_u_26:_add_tick(v30, v31.template_type, v36, v33)
    end
    p_u_26.countdown_promise:cancel()
    p_u_26.countdown_promise = v_u_8.fromEvent(v_u_9.PostSimulation, function()
        local v37 = workspace:GetServerTimeNow() - p_u_27
        local v38 = v37 / p_u_28
        local v39 = math.clamp(v38, 0, 1)
        p_u_26:_set_progress_percent(v39)
        local v40 = v_u_3.get_time_breakdown
        local v41 = p_u_28 - v37
        local v42 = v40((math.max(0, v41)))
        p_u_26.timer_label.Text = ("Teleporting in: %02d:%02d"):format(v42.minutes, v42.seconds)
        return v39 >= 1
    end)
    return p_u_26.countdown_promise
end
function v10.show(p43)
    p43.instance.Enabled = true
end
function v10.hide(p44)
    p44.instance.Enabled = false
end
function v10.start(p45)
    p45.countdown_promise = v_u_8.resolve()
    p45.tick_maid = v_u_5.new()
    p45.tick_passed_callback = nil
    p45.tick_container = p45.instance.ProgressBar.Progress.Ticks
    p45.tick_templates = {
        ["ailment"] = p45.tick_container.AilmentTemplate,
        ["exit"] = p45.tick_container.ExitTemplate
    }
    for _, v46 in p45.tick_templates do
        v46.Parent = nil
    end
    p45.timer_label = p45.instance.ProgressBar.Timer
    p45.progress_light = p45.instance.ProgressBar.Progress.Light
    p45.progress_dark = p45.instance.ProgressBar.Progress.Dark
    p45.timer_label.Text = ""
end
return v10