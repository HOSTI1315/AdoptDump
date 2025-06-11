--// ReplicatedStorage.ClientModules.Core.UIManager.Elements.EmojiGrid (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
v1("PlatformM")
local v_u_3 = v1("TweenPromise")
local v_u_4 = v1("package:Promise")
local v5 = v2("EmojiGrid", v1("UIBaseElement"))
local function v_u_14(p_u_6, p7, p8)
    p_u_6.ClipsDescendants = false
    local v_u_9 = p_u_6.ImageLabel
    local v_u_10 = v_u_9.Size
    local v_u_11 = v_u_9.AnchorPoint
    local v_u_12 = v_u_9.Position
    v_u_9.AnchorPoint = Vector2.new(0.5, 0.5)
    v_u_9.Position = UDim2.fromScale(0.5, 0.5)
    local v13 = TweenInfo.new(p8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true)
    return v_u_3.new(v_u_9, v13, {
        ["Size"] = UDim2.fromScale(p7, p7)
    }):finally(function()
        p_u_6.ClipsDescendants = true
        v_u_9.Size = v_u_10
        v_u_9.AnchorPoint = v_u_11
        v_u_9.Position = v_u_12
    end)
end
function v5._is_index_on_cooldown(p15, p16)
    local v17
    if p15.emoji_usage[p16] == nil then
        v17 = false
    else
        v17 = p15.emoji_usage[p16].delay:getStatus() ~= v_u_4.Status.Resolved
    end
    return v17
end
function v5._set_on_cooldown(p_u_18, p_u_19, p_u_20)
    local v21 = p_u_18.emoji_usage[p_u_20].count + 1
    p_u_18.emoji_usage[p_u_20].count = v21
    local v_u_22 = p_u_18.cooldown_progression[v21] or p_u_18.cooldown_progression[#p_u_18.cooldown_progression]
    local v_u_23 = p_u_19.Frame
    local v_u_24 = p_u_19.CooldownFrame
    p_u_18.emoji_usage[p_u_20].pop_finish:cancel()
    p_u_18.emoji_usage[p_u_20].delay = v_u_14(v_u_23, 1.2, 0.09):andThen(function()
        v_u_23.Size = UDim2.fromScale(1, 0)
        v_u_24.Size = UDim2.fromScale(1, 1)
        v_u_23.ImageLabel.ImageTransparency = 0.2
        return v_u_4.all({ v_u_3.new(v_u_23, TweenInfo.new(v_u_22, Enum.EasingStyle.Linear), {
                ["Size"] = UDim2.fromScale(1, 1)
            }), v_u_3.new(v_u_24, TweenInfo.new(v_u_22, Enum.EasingStyle.Linear), {
                ["Size"] = UDim2.fromScale(1, 0)
            }) })
    end):andThen(function()
        v_u_23.ImageLabel.ImageTransparency = 0
        if v_u_22 > 0.4 then
            p_u_18.emoji_usage[p_u_20].pop_finish = v_u_14(v_u_23, 1.1, 0.08)
        end
    end)
    p_u_18.emoji_usage[p_u_20].delay:finally(function()
        v_u_24.Size = UDim2.fromScale(1, 0)
        v_u_23.Size = UDim2.fromScale(1, 1)
        v_u_23.ImageLabel.ImageTransparency = 0
        p_u_18.wrapped_buttons[p_u_19]:render()
    end)
    return true
end
function v5._initialize_buttons(p_u_25)
    local v26 = p_u_25.instance:FindFirstChildWhichIsA("UIGridLayout")
    if not v26 then
        v26 = Instance.new("UIGridLayout")
        v26.CellSize = UDim2.fromOffset(46, 46)
        v26.Parent = p_u_25.instance
    end
    for v_u_27, v28 in p_u_25.icons do
        local v_u_29 = Instance.new("ImageButton")
        v_u_29.LayoutOrder = v_u_27
        v_u_29.BackgroundTransparency = 1
        v_u_29.Name = "EmojiButton" .. v_u_27
        v_u_29.Parent = p_u_25.instance
        local v30 = p_u_25.buttons
        table.insert(v30, v_u_29)
        local v31 = Instance.new("Frame")
        v31.BackgroundTransparency = 1
        v31.Size = UDim2.fromScale(1, 1)
        v31.AnchorPoint = Vector2.new(0.5, 1)
        v31.Position = UDim2.fromScale(0.5, 1)
        v31.ClipsDescendants = true
        v31.Parent = v_u_29
        local v32 = Instance.new("ImageLabel")
        v32.BackgroundTransparency = 1
        v32.Image = v28
        v32.Size = v26.CellSize
        v32.AnchorPoint = v31.AnchorPoint
        v32.Position = v31.Position
        local v33 = v31:Clone()
        v33.Name = "CooldownFrame"
        v33.AnchorPoint = Vector2.new(0.5, 0)
        v33.Position = UDim2.fromScale(0.5, 0)
        v33.Size = UDim2.fromScale(1, 0)
        v33.Parent = v_u_29
        local v34 = v32:Clone()
        v34.AnchorPoint = v33.AnchorPoint
        v34.Position = v33.Position
        v34.ImageTransparency = 0.75
        v34.Parent = v33
        v32.Parent = v31
        p_u_25.wrapped_buttons[v_u_29] = p_u_25.UIManager.wrap(v_u_29, "CustomButton"):start({
            ["hover_render"] = function()
                if not p_u_25:_is_index_on_cooldown(v_u_27) then
                    p_u_25.on_hover(v_u_29, v_u_27)
                end
            end,
            ["up_render"] = function()
                p_u_25.on_hover_end(v_u_29, v_u_27)
            end,
            ["mouse_button1_down"] = function()
                if not p_u_25:_is_index_on_cooldown(v_u_27) then
                    p_u_25:_set_on_cooldown(v_u_29, v_u_27)
                    if p_u_25.mouse_button1_down(v_u_29, v_u_27) ~= false then
                        p_u_25.on_hover_end(v_u_29, v_u_27)
                    end
                end
            end
        })
    end
    p_u_25:reset_cooldowns()
    for v_u_35, v_u_36 in p_u_25.buttons do
        local v37 = v_u_35 == #p_u_25.buttons and 1 or v_u_35 + 1
        local v38
        if v_u_35 == 1 then
            v38 = #p_u_25.buttons
        else
            v38 = v_u_35 - 1
        end
        v_u_36.NextSelectionRight = v_u_35 == #p_u_25.buttons and p_u_25.next_selections.right or p_u_25.buttons[v37]
        v_u_36.NextSelectionLeft = v_u_35 == 1 and p_u_25.next_selections.left or p_u_25.buttons[v38]
        v_u_36.NextSelectionUp = p_u_25.next_selections.up
        v_u_36.NextSelectionDown = p_u_25.next_selections.down
        v_u_36.SelectionGained:connect(function()
            p_u_25.on_hover(v_u_36, v_u_35)
        end)
    end
end
function v5.reset_cooldowns(p39)
    p39.emoji_usage = p39.emoji_usage or {}
    for v40 = 1, #p39.buttons do
        local v41 = p39.emoji_usage[v40]
        if v41 then
            v41.delay:cancel()
        end
        p39.emoji_usage[v40] = {
            ["delay"] = v_u_4.resolve(),
            ["pop_finish"] = v_u_4.resolve(),
            ["count"] = 0
        }
    end
end
function v5.get_emoji_buttons(p42)
    return p42.buttons
end
function v5.destroy(p43)
    p43.maid:DoCleaning()
end
function v5.start(p44, p45)
    p44.icons = p45.icons
    p44.next_selections = p45.next_selections or {}
    p44.cooldown_progression = p45.cooldown_progression or { 0.4 }
    p44.emoji_usage = {}
    p44.on_hover = p45.on_hover or function() end
    p44.on_hover_end = p45.on_hover_end or function() end
    p44.mouse_button1_down = p45.mouse_button1_down or function() end
    p44.buttons = {}
    p44.wrapped_buttons = {}
    p44:_initialize_buttons()
    return p44
end
return v5