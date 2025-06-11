--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.Ailment (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("new:AilmentRewardsHelper")
local v3 = v1("Class")
local v_u_4 = v1("Maid")
local v_u_5 = v1("PlatformM")
local v6 = v1("TweenHelper")
local v_u_7 = v1("TweenPromise")
local v_u_8 = game:GetService("RunService")
local v_u_9 = Color3.new()
local v_u_10 = Color3.new(1, 1, 1)
local v_u_11 = v6.tween_info({
    ["time"] = 0.12
})
local v12 = v3("Ailment", v1("UIBaseElement"))
function v12._update_size(p13)
    if p13.ui_scale then
        v_u_7.new(p13.ui_scale, v_u_11, {
            ["Scale"] = p13.hovering and 1.1 or 1
        })
    end
end
function v12.update_ailment(p_u_14, p_u_15)
    if p_u_14.maid.update_preference_image then
        p_u_14.maid.update_preference_image:Disconnect()
        p_u_14.maid.update_preference_image = nil
    end
    if p_u_14.maid.update_rate_flash then
        p_u_14.maid.update_rate_flash:Disconnect()
        p_u_14.maid.update_rate_flash = nil
    end
    p_u_14.tags_maid:DoCleaning()
    if p_u_15 then
        p_u_14.background.Visible = true
        p_u_14.empty.Visible = false
        local v16 = p_u_15.category.colors
        local v17
        if typeof(v16) == "function" then
            v17 = p_u_15.category.colors()
        else
            v17 = p_u_15.category.colors
        end
        p_u_14.gradient.Color = v17
        if p_u_14.icon.AbsoluteSize.Y > 100 then
            p_u_14.icon.Image = p_u_15.description.large_image
        else
            p_u_14.icon.Image = p_u_15.description.image
        end
        local v_u_18 = v17.Keypoints[1].Value:Lerp(v_u_10, 0.5)
        local v_u_19 = v17.Keypoints[2].Value:Lerp(v_u_9, 0.33)
        local v20 = p_u_14.hide_progress and 0 or p_u_15:get_progress()
        p_u_14.progress_bar:set_progress(v20)
        p_u_14.percentage.TextColor3 = v17.Keypoints[2].Value
        p_u_14:_update_percentage(p_u_15)
        if p_u_15.rate > 0 and not p_u_14.hide_progress then
            local v21 = (1 - v20) / p_u_15.rate
            p_u_14.progress_bar:tween_progress(1, v21)
            p_u_14.maid.update_rate_flash = v_u_8.Heartbeat:Connect(function()
                local v22 = tick() * 6
                local v23 = math.sin(v22) * 0.5 + 0.5
                local v24 = math.clamp(v23, 0, 1)
                p_u_14.progress_bar:set_color(v_u_18:Lerp(v_u_19, v24))
                p_u_14:_update_percentage(p_u_15)
            end)
        else
            p_u_14.progress_bar:set_color(v_u_19)
        end
        local v25 = p_u_15.components.preference
        if v25 then
            if p_u_14.preference_always_visible then
                p_u_14.preference.Color.BackgroundColor3 = v17.Keypoints[1].Value
                p_u_14.UIManager.wrap(p_u_14.preference.Icon, "ItemDataImage"):start({
                    ["use_instance"] = true,
                    ["item_data"] = {
                        ["category"] = v25.item_category,
                        ["kind"] = v25.item_kind
                    }
                })
                p_u_14.preference.Visible = true
            else
                p_u_14.UIManager.wrap(p_u_14.preference, "ItemDataImage"):start({
                    ["use_instance"] = true,
                    ["item_data"] = {
                        ["category"] = v25.item_category,
                        ["kind"] = v25.item_kind
                    }
                })
                p_u_14.maid.update_preference_image = v_u_8.Heartbeat:Connect(function()
                    local v26 = tick()
                    local v27 = math.sin(v26)
                    local v28 = math.clamp(v27, 0, 1)
                    p_u_14.icon.ImageTransparency = v28
                    p_u_14.preference.ImageTransparency = 1 - v28
                    if p_u_14.show_percentage then
                        local v29 = p_u_14.percentage
                        local v30 = p_u_15:get_progress()
                        v29.Text = ("%%%*"):format((math.floor(v30)))
                    end
                end)
            end
        elseif p_u_14.preference_always_visible then
            p_u_14.preference.Visible = false
        else
            p_u_14.icon.ImageTransparency = 0
            p_u_14.preference.ImageTransparency = 1
        end
        p_u_14.count.Color.BackgroundColor3 = v17.Keypoints[2].Value
        if p_u_14.interactable then
            p_u_14.instance.Selectable = true
            p_u_14.instance.Active = true
        end
        if p_u_14.show_tags then
            v_u_2.render_ailment_tags(p_u_15, p_u_14.instance, p_u_14.tags_maid)
        end
    else
        p_u_14.progress_bar:set_progress(0)
        p_u_14.background.Visible = false
        p_u_14.empty.Visible = p_u_14.show_empty_outline
        if p_u_14.hovering then
            p_u_14.hovering = false
            p_u_14:_update_size()
        end
        if p_u_14.interactable then
            p_u_14.instance.Selectable = false
            p_u_14.instance.Active = false
        end
    end
    p_u_14.ailment = p_u_15
end
function v12.update_count(p31, p32)
    if p32 and p32 > 1 then
        p31.count.Text.Text = p32
        p31.count.Visible = true
    else
        p31.count.Visible = false
    end
end
function v12._update_percentage(p33, p34)
    if p33.show_percentage then
        local v35 = p34:get_progress()
        p33.percentage.Visible = v35 > 0
        local v36 = p33.percentage
        local v37 = p34:get_progress() * 100
        v36.Text = ("%*%%"):format((math.floor(v37)))
    else
        p33.percentage.Visible = false
    end
end
function v12._create_background(p38)
    local v39 = Instance.new("Frame")
    v39.Size = UDim2.fromScale(1, 1)
    v39.Position = UDim2.fromScale(0.5, 0.5)
    v39.AnchorPoint = Vector2.one * 0.5
    v39.BackgroundColor3 = Color3.new(1, 1, 1)
    local v40 = Instance.new("UICorner")
    v40.CornerRadius = UDim.new(1, 0)
    v40.Parent = v39
    local v41 = Instance.new("Frame")
    v41.Size = UDim2.fromScale(0.89, 0.89)
    v41.Position = UDim2.fromScale(0.5, 0.5)
    v41.AnchorPoint = Vector2.one * 0.5
    v41.BackgroundColor3 = Color3.new(1, 1, 1)
    v41.Name = "Color"
    v41.ZIndex = 0
    v41.Parent = v39
    local v42 = Instance.new("UICorner")
    v42.CornerRadius = UDim.new(1, 0)
    v42.Parent = v41
    local v43 = Instance.new("UIGradient")
    v43.Rotation = 90
    v43.Parent = v41
    p38.gradient = v43
    v39.Name = "Background"
    v39.Parent = p38.instance
    p38.background = v39
end
function v12._create_empty(p44)
    local v45 = Instance.new("ImageLabel")
    v45.Image = "rbxassetid://18951287510"
    v45.Size = UDim2.fromScale(1, 1)
    v45.Position = UDim2.fromScale(0.5, 0.5)
    v45.AnchorPoint = Vector2.one * 0.5
    v45.BackgroundTransparency = 1
    v45.Name = "Empty"
    v45.Parent = p44.instance
    p44.empty = v45
end
function v12._create_icon(p46)
    local v47 = Instance.new("ImageLabel")
    v47.Size = UDim2.fromScale(1, 1)
    v47.AnchorPoint = Vector2.one * 0.5
    v47.Position = UDim2.fromScale(0.5, 0.5)
    v47.BackgroundTransparency = 1
    v47.Name = "Icon"
    v47.ZIndex = 3
    v47.Parent = p46.background
    p46.icon = v47
end
function v12._create_percentage(p_u_48)
    local v49 = Instance.new("TextLabel")
    v49.Size = UDim2.new()
    v49.AnchorPoint = Vector2.new(0.5, 0)
    v49.Position = UDim2.fromScale(0.5, 1)
    v49.BackgroundTransparency = 1
    v49.TextSize = 42
    v49.Font = Enum.Font.FredokaOne
    local v50 = Instance.new("UIStroke")
    v50.Thickness = 5
    v50.Color = Color3.new(1, 1, 1)
    v50.Parent = v49
    local v_u_51 = Instance.new("UIScale")
    v_u_51.Parent = v49
    v_u_51.Scale = p_u_48.background.AbsoluteSize.X / 135
    p_u_48.maid.scale_factor_changed = p_u_48.background:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        v_u_51.Scale = p_u_48.background.AbsoluteSize.X / 135
    end)
    v49.Name = "Percentage"
    v49.ZIndex = 5
    v49.Parent = p_u_48.background
    p_u_48.percentage = v49
end
function v12._create_progress_bar(p_u_52)
    p_u_52.progress_bar = p_u_52.UIManager.wrap(p_u_52.background.Color, "CircularProgressBar")
    p_u_52.progress_bar:start()
    p_u_52.progress_bar:set_progress(0)
    p_u_52.progress_bar:set_padding(1)
    p_u_52.progress_bar:set_color(Color3.new())
    p_u_52.progress_bar:set_transparency(0)
    p_u_52.maid.progress_bar = p_u_52.progress_bar
    if p_u_52.interactable then
        p_u_52.progress_bar:set_parent_size(p_u_52.background.Color.AbsoluteSize)
        p_u_52.maid.size_changed = p_u_52.background.Color:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
            if not p_u_52.ui_scale or p_u_52.ui_scale.Scale == 1 then
                local v53 = p_u_52.background.Color.AbsoluteSize
                p_u_52.progress_bar:set_parent_size(v53)
            end
        end)
    end
end
function v12._create_separate_preference(p54)
    local v55 = Instance.new("Frame")
    v55.Size = UDim2.fromScale(0.5, 0.5)
    v55.Position = UDim2.fromScale(0.8, 0.8)
    v55.AnchorPoint = Vector2.one * 0.5
    v55.BackgroundColor3 = Color3.new(1, 1, 1)
    local v56 = Instance.new("UICorner")
    v56.CornerRadius = UDim.new(1, 0)
    v56.Parent = v55
    local v57 = Instance.new("Frame")
    v57.Size = UDim2.fromScale(0.89, 0.89)
    v57.Position = UDim2.fromScale(0.5, 0.5)
    v57.AnchorPoint = Vector2.one * 0.5
    v57.Name = "Color"
    v57.Parent = v55
    local v58 = Instance.new("UICorner")
    v58.CornerRadius = UDim.new(1, 0)
    v58.Parent = v57
    local v59 = Instance.new("ImageLabel")
    v59.Size = UDim2.fromScale(0.8, 0.8)
    v59.AnchorPoint = Vector2.one * 0.5
    v59.Position = UDim2.fromScale(0.5, 0.5)
    v59.BackgroundTransparency = 1
    v59.Name = "Icon"
    v59.Parent = v55
    v55.Name = "Preference"
    v55.ZIndex = 4
    v55.Parent = p54.background
    p54.preference = v55
end
function v12._create_count(p60)
    local v61 = Instance.new("Frame")
    v61.Size = UDim2.fromScale(0.4, 0.4)
    v61.Position = UDim2.fromScale(0.85, 0.85)
    v61.AnchorPoint = Vector2.one * 0.5
    v61.BackgroundColor3 = Color3.new(1, 1, 1)
    local v62 = Instance.new("UICorner")
    v62.CornerRadius = UDim.new(1, 0)
    v62.Parent = v61
    local v63 = Instance.new("Frame")
    v63.Size = UDim2.fromScale(0.8, 0.8)
    v63.Position = UDim2.fromScale(0.5, 0.5)
    v63.AnchorPoint = Vector2.one * 0.5
    v63.Name = "Color"
    v63.Parent = v61
    local v64 = Instance.new("UICorner")
    v64.CornerRadius = UDim.new(1, 0)
    v64.Parent = v63
    local v65 = Instance.new("TextLabel")
    v65.Size = UDim2.fromScale(0.8, 0.8)
    v65.AnchorPoint = Vector2.one * 0.5
    v65.Position = UDim2.fromScale(0.5, 0.5)
    v65.BackgroundTransparency = 1
    v65.Name = "Text"
    v65.TextSize = 24
    v65.Font = Enum.Font.FredokaOne
    v65.TextColor3 = Color3.new(1, 1, 1)
    v65.TextStrokeTransparency = 1
    v65.Parent = v61
    v61.Name = "Count"
    v61.ZIndex = 5
    v61.Visible = false
    v61.Parent = p60.background
    p60.count = v61
end
function v12._create_combined_preference(p66)
    local v67 = p66.icon:Clone()
    v67.ZIndex = p66.icon.ZIndex + 1
    v67.Size = UDim2.fromScale(0.8, 0.8)
    v67.Position = UDim2.fromScale(0.5, 0.5)
    v67.AnchorPoint = Vector2.one * 0.5
    v67.Parent = p66.icon.Parent
    p66.preference = v67
end
function v12.hover(p68)
    if not p68.hovering and p68.ailment then
        p68.hovering = true
        p68:_update_size()
        if p68.on_hover then
            p68.on_hover(p68.ailment)
        end
    end
end
function v12.stop_hovering(p69)
    if p69.hovering then
        p69.hovering = false
        p69:_update_size()
        if p69.on_stop_hovering then
            p69.on_stop_hovering()
        end
    end
end
function v12.select(p70)
    if p70.ailment then
        if p70.on_select then
            p70.on_select(p70.ailment)
        end
    end
end
function v12.start(p_u_71, p72)
    local v73 = p72 or {}
    p_u_71.ailment = nil
    p_u_71.maid = v_u_4.new()
    p_u_71.tags_maid = v_u_4.new()
    p_u_71.interactable = v73.interactable
    p_u_71.hide_progress = v73.hide_progress
    p_u_71.show_percentage = v73.show_percentage
    p_u_71.show_empty_outline = not v73.hide_empty_outline
    p_u_71.show_tags = v73.show_tags
    p_u_71.hovering = false
    p_u_71.on_hover = v73.on_hover
    p_u_71.on_stop_hovering = v73.on_stop_hovering
    p_u_71.on_select = v73.on_select
    p_u_71:_create_background()
    p_u_71:_create_empty()
    p_u_71:_create_icon()
    p_u_71:_create_progress_bar()
    p_u_71:_create_percentage()
    p_u_71:_create_count()
    if v73.preference_always_visible then
        p_u_71:_create_separate_preference()
    else
        p_u_71:_create_combined_preference()
    end
    p_u_71.preference_always_visible = v73.preference_always_visible
    if p_u_71.interactable and p_u_71.instance:IsA("ImageButton") then
        if v73.resize_on_hover then
            p_u_71.ui_scale = Instance.new("UIScale")
            p_u_71.ui_scale.Parent = p_u_71.instance
            p_u_71.maid.mouse_enter = p_u_71.instance.MouseEnter:connect(function()
                p_u_71:hover()
            end)
            p_u_71.maid.mouse_leave = p_u_71.instance.MouseLeave:connect(function()
                p_u_71:stop_hovering()
            end)
            p_u_71.maid.selection_gained = p_u_71.instance.SelectionGained:connect(function()
                p_u_71:hover()
            end)
            p_u_71.maid.selection_lost = p_u_71.instance.SelectionLost:connect(function()
                p_u_71:stop_hovering()
            end)
        end
        p_u_71.maid.click = p_u_71.instance[v_u_5.mouse_down_or_click()]:connect(function()
            p_u_71:select()
        end)
    end
end
function v12.destroy(p74)
    p74.maid:DoCleaning()
    p74.tags_maid:DoCleaning()
end
return v12