--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MinigameRewardsApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AltCurrencyData")
v1("AltCurrencyDB")
local v_u_3 = v1("SoundPlayer")
local v_u_4 = v1("TweenPromise")
local v_u_5 = v1("BattlePassDB")
local v_u_6 = v1("TweenHelper")
local v_u_7 = v1("XboxSupport")
local v_u_8 = v1("PlatformM")
local v_u_9 = v1("Signal")
local v10 = v1("Class")
local v11 = v1("package:t")
local v_u_12 = v1("package:Promise")
local v_u_13 = game:GetService("RunService")
local v_u_14 = v_u_8.get_platform()
local v15 = v11.strictInterface
local v16 = {
    ["title"] = v11.optional(v11.string),
    ["button"] = v11.optional(v11.string),
    ["reward"] = v11.strictInterface({
        ["title"] = v11.string,
        ["image"] = v11.optional(v11.string),
        ["image_size"] = v11.optional(v11.UDim2),
        ["battle_pass_kind"] = v11.optional(v11.string),
        ["use_currency_image"] = v11.optional(v11.boolean)
    }),
    ["results"] = v11.optional(v11.array(v11.strictInterface({
        ["title"] = v11.string,
        ["value"] = v11.number,
        ["value_string"] = v11.optional(v11.string),
        ["value_format_string"] = v11.optional(v11.string),
        ["image"] = v11.optional(v11.string),
        ["use_currency_image"] = v11.optional(v11.boolean)
    }))),
    ["on_close"] = v11.optional(v11.callback)
}
local v_u_17 = v15(v16)
local v18 = v10("MinigameRewardsApp", v1("UIBaseApp"))
function v18._promise_pinstripe_spin(p_u_19)
    return v_u_12.new(function(_, _, p20)
        local v_u_21 = p_u_19.instance.Body.RadialPinstripe
        local v_u_26 = v_u_13.Heartbeat:Connect(function(p22)
            local v23 = v_u_21
            local v24 = v_u_21.Rotation
            local v25 = p22 * 60
            v23.Rotation = v24 + math.min(1, v25) * 0.5
        end)
        p20(function()
            v_u_26:Disconnect()
        end)
    end)
end
function v18._promise_confetti_animation(p27)
    local v28 = v_u_6.tween_info({
        ["time"] = 0.3,
        ["easing_style"] = Enum.EasingStyle.Back,
        ["easing_direction"] = Enum.EasingDirection.Out
    })
    local v29 = {}
    for _, v_u_30 in ipairs(p27.instance.Body.Confetti:GetChildren()) do
        local v_u_31 = v_u_30.Position
        v_u_30.Position = UDim2.new(0, 0, 0, 0)
        v_u_30.ImageTransparency = 1
        local v32 = v_u_4.new(v_u_30, v28, {
            ["Position"] = v_u_31,
            ["ImageTransparency"] = 0
        })
        table.insert(v29, v32:finally(function()
            v_u_30.Position = v_u_31
            v_u_30.ImageTransparency = 0
        end))
    end
    return v_u_12.all(v29)
end
function v18._promise_cloud_burst_animation(p33, p34)
    local v35 = p33.instance.Body.Clouds:GetChildren()
    local v_u_36 = Instance.new("Frame")
    v_u_36.Name = "TempClouds"
    v_u_36.BackgroundTransparency = 1
    v_u_36.Size = UDim2.new(1, 0, 1, 0)
    v_u_36.ZIndex = -1
    v_u_36.Parent = p33.instance.Body
    local v37 = Random.new()
    local v38 = v37:NextInteger(15, 20)
    local v39 = v_u_6.tween_info({
        ["time"] = 2,
        ["easing_style"] = Enum.EasingStyle.Quint,
        ["easing_direction"] = Enum.EasingDirection.Out
    })
    local v40 = {}
    for _ = 1, v38 do
        local v_u_41 = v35[v37:NextInteger(1, #v35)]:Clone()
        v_u_41.ImageTransparency = 0
        v_u_41.Position = p34
        v_u_41.Visible = true
        v_u_41.Parent = v_u_36
        local v42 = v37:NextNumber(0, 360)
        local v43 = math.rad(v42)
        local v44 = p34 + UDim2.fromOffset(math.cos(v43) * 250, math.sin(v43) * 250)
        local v45 = v_u_4.new(v_u_41, v39, {
            ["Position"] = v44,
            ["Rotation"] = v37:NextInteger(1, 360),
            ["Size"] = UDim2.fromOffset(1, 1)
        }):finally(function()
            v_u_41:Destroy()
        end)
        table.insert(v40, v45)
    end
    local v_u_46 = v_u_12.all(v40)
    v_u_12.try(function()
        v_u_46:await()
        v_u_36:Destroy()
    end)
    return v_u_46
end
function v18.close_display(p47)
    p47.close_display_function()
end
function v18.display(p_u_48, p49)
    local v50 = v_u_17
    assert(v50(p49))
    local v51 = p49.reward
    p_u_48.display_ticket = p_u_48.display_ticket + 1
    local v_u_52 = p_u_48.display_ticket
    p_u_48.instance.Body.Header.TitleLabel.Text = p49.title or "GAME OVER!"
    p_u_48.instance.Body.Button.Face.TextLabel.Text = p49.button or "NICE!"
    p_u_48.instance.Body.Reward.TitleLabel.Text = v51.title
    local v53 = v_u_14 == v_u_8.platform.phone
    local v54 = nil
    if v51.image then
        v54 = v51.image
    elseif v51.use_currency_image then
        if v53 then
            v54 = v_u_2.minigame_rewards_image.phone
        else
            v54 = v_u_2.minigame_rewards_image.desktop
        end
    elseif v51.battle_pass_kind then
        local v55 = v_u_5[v51.battle_pass_kind]
        if v53 then
            v54 = v55.minigame_reward_image.phone
        else
            v54 = v55.minigame_reward_image.desktop
        end
    end
    p_u_48.instance.Body.Reward.ImageLabel.Image = v54
    p_u_48.instance.Body.Reward.ImageLabel.Size = v51.image_size or p_u_48.original_reward_image_size
    p_u_48.instance.Body.Results.ScrollingFrame:ClearAllChildren()
    if p49.results and #p49.results > 0 then
        p_u_48.instance.Body.Results.Visible = true
        local v56 = p_u_48.result_template.Position
        for v57, v58 in p49.results do
            local v59 = p_u_48.result_template:Clone()
            v59.Name = "Result" .. v57
            v59.TitleLabel.Text = v58.title
            local v60
            if v58.value_format_string then
                v60 = v58.value_format_string:format(v58.value)
            elseif v58.value_string then
                v60 = v58.value_string
            else
                v60 = v58.value
            end
            v59.ValueLabel.Text = v60
            if v58.image or (v58.use_currency_image or v58.battle_pass_kind) then
                local v61 = nil
                if v58.image then
                    v61 = v58.image
                elseif v58.use_currency_image then
                    if v53 then
                        v61 = v_u_2.minigame_rewards_image.phone
                    else
                        v61 = v_u_2.minigame_rewards_image.desktop
                    end
                elseif v58.battle_pass_kind then
                    local v62 = v_u_5[v58.battle_pass_kind]
                    if v53 then
                        v61 = v62.minigame_reward_image.phone
                    else
                        v61 = v62.minigame_reward_image.desktop
                    end
                end
                v59.ImageLabel.Visible = true
                v59.ImageLabel.Image = v61
                v59.TitleLabel.Position = v59.TitleLabel.Position + UDim2.fromScale(0.1, 0)
                v59.TitleLabel.Size = v59.TitleLabel.Size - UDim2.fromScale(0.3, 0)
            end
            local v63, v64
            if v53 then
                v63 = v57 % 2 == 0 and 12 or 0
                v64 = 54 * (v57 - 1)
            else
                v63 = v57 % 2 == 0 and 25 or 5
                v64 = 110 * (v57 - 1)
            end
            v59.Position = v56 + UDim2.fromOffset(v63, v64)
            v59.Parent = p_u_48.instance.Body.Results.ScrollingFrame
        end
        local v65 = (#p49.results - 1) * (v53 and 54 or 110) + p_u_48.result_template.AbsoluteSize.Y
        p_u_48.instance.Body.Results.ScrollingFrame.Size = UDim2.fromOffset((v53 and 12 or 25) + p_u_48.result_template.AbsoluteSize.X + p_u_48.instance.Body.Results.ScrollingFrame.ScrollBarThickness, 2 * (v53 and 54 or 110) + p_u_48.result_template.AbsoluteSize.Y)
        if #p49.results > 3 then
            p_u_48.instance.Body.Results.ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, v65)
            p_u_48.instance.Body.Results.ScrollingFrame.ScrollingEnabled = true
            p_u_48.instance.Body.Results.ScrollbarBacking.Visible = true
        else
            p_u_48.instance.Body.Results.ScrollingFrame.CanvasSize = UDim2.new()
            p_u_48.instance.Body.Results.ScrollingFrame.ScrollingEnabled = false
            p_u_48.instance.Body.Results.ScrollbarBacking.Visible = false
        end
        p_u_48.instance.Body.RadialPinstripe.Position = v53 and UDim2.new(0.5, -85, 0.5, 10) or UDim2.new(0.5, -170, 0.5, 20)
        p_u_48.instance.Body.Reward.Position = v53 and UDim2.new(0.5, -85, 0.5, 10) or UDim2.new(0.5, -170, 0.5, 20)
    else
        p_u_48.instance.Body.Results.Visible = false
        p_u_48.instance.Body.Button.Position = p_u_48.original_button_position
        p_u_48.instance.Body.Position = p_u_48.original_body_position
        p_u_48.instance.Body.RadialPinstripe.Position = v53 and UDim2.new(0.5, 0, 0.5, 10) or UDim2.new(0.5, 0, 0.5, 20)
        p_u_48.instance.Body.Reward.Position = v53 and UDim2.new(0.5, 0, 0.5, 10) or UDim2.new(0.5, 0, 0.5, 20)
    end
    p_u_48.UIManager.set_app_visibility(p_u_48.ClassName, true)
    local function v66()
        if v_u_52 == p_u_48.display_ticket and p_u_48.UIManager.is_visible(p_u_48.ClassName) then
            p_u_48.close_request:Fire()
        end
    end
    p_u_48.close_display_function = v66
    p_u_48.on_close_callback = p49.on_close
    return v66
end
function v18.show(p_u_67)
    v_u_3.FX:play("PopShort")
    p_u_67.pinstripe_promise = p_u_67:_promise_pinstripe_spin()
    p_u_67.confetti_promise = p_u_67:_promise_confetti_animation()
    p_u_67.cloud_burst_promise = v_u_12.delay(0.1):andThen(function()
        v_u_3.FX:play("GoldSparklePrize")
        local v68 = p_u_67.instance.Body.Reward.AbsolutePosition + p_u_67.instance.Body.Reward.AbsoluteSize / 2
        return p_u_67:_promise_cloud_burst_animation(UDim2.fromOffset(v68.X, v68.Y))
    end)
    p_u_67.instance.Body.Visible = true
end
function v18.hide(p69)
    p69.pinstripe_promise:cancel()
    p69.confetti_promise:cancel()
    p69.cloud_burst_promise:cancel()
    p69.instance.Body.Visible = false
end
function v18.start(p_u_70)
    p_u_70.display_ticket = 0
    function p_u_70.close_display_function() end
    p_u_70.on_close_callback = nil
    p_u_70.result_template = p_u_70.instance.Body.Results.ResultTemplate
    p_u_70.result_template.Parent = nil
    p_u_70.original_button_position = p_u_70.instance.Body.Button.Position
    p_u_70.original_body_position = p_u_70.instance.Body.Position
    p_u_70.original_reward_image_size = p_u_70.instance.Body.Reward.ImageLabel.Size
    p_u_70.pinstripe_promise = v_u_12.resolve()
    p_u_70.confetti_promise = v_u_12.resolve()
    p_u_70.cloud_burst_promise = v_u_12.resolve()
    p_u_70.close_request = v_u_9.new()
    p_u_70.close_request:Connect(function()
        p_u_70.UIManager.set_app_visibility(p_u_70.ClassName, false)
        if p_u_70.on_close_callback then
            p_u_70.on_close_callback()
        end
    end)
    local v71 = {
        ["mouse_button1_click"] = function()
            v_u_3.FX:play("Pop")
            p_u_70.close_request:Fire()
        end
    }
    p_u_70.button = p_u_70.UIManager.wrap(p_u_70.instance.Body.Button, "DepthButton"):start(v71)
    v_u_7.quick_watch({
        ["selection_parent"] = p_u_70.instance.Body,
        ["default_selection"] = p_u_70.instance.Body.Button,
        ["app_name"] = p_u_70.ClassName
    })
end
return v18