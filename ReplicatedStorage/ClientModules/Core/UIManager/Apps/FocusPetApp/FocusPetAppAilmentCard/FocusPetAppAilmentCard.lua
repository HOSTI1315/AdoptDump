--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.FocusPetApp.FocusPetAppAilmentCard (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("new:AilmentsDB")
local v_u_3 = v1("BucksAgingMultiplierHelper")
local v4 = v1("Class")
local v_u_5 = v1("new:ClientAilment")
local v_u_6 = v1("Maid")
local v_u_7 = v1("PlatformM")
local v_u_8 = v1("new:PreferenceHelper")
local v9 = v1("Signal")
local v10 = v1("TweenHelper")
local v_u_11 = v1("TweenPromise")
local v12 = v1("package:t")
local v_u_13 = v12.strictInterface({
    ["index"] = v12.optional(v12.number),
    ["ailment"] = v12.optional(v12.any),
    ["ailment_kind"] = v12.optional(v12.string),
    ["serialized_components"] = v12.optional(v12.map(v12.string, v12.map(v12.string, v12.any))),
    ["selected_signal"] = v12.optional(v9.is),
    ["action_text"] = v12.string,
    ["interactable"] = v12.optional(v12.boolean)
})
local v_u_14 = v10.tween_info({
    ["time"] = 0.12
})
local v15 = v4("FocusPetAppAilmentCard", v1("UIBaseElement"))
function v15._update_size(p16)
    v_u_11.new(p16.ui_scale, v_u_14, {
        ["Scale"] = p16.hovering and 1.1 or 1
    })
end
function v15.hover(p17)
    if not p17.hovering then
        p17.hovering = true
        p17:_update_size()
    end
end
function v15.stop_hovering(p18)
    if p18.hovering then
        p18.hovering = false
        p18:_update_size()
    end
end
function v15.start(p_u_19, p20)
    local v21 = v_u_13
    assert(v21(p20))
    local v_u_22 = p_u_19.instance.Container
    p_u_19.maid = v_u_6.new()
    p_u_19.hovering = false
    p_u_19.ui_scale = v_u_22.UIScale
    local v_u_23 = p20.index or nil
    local v24 = p20.ailment_kind
    local v25 = p20.serialized_components
    local v_u_26 = p20.selected_signal
    local v27 = p20.interactable
    local v_u_28 = p20.action_text
    local v_u_29 = p20.ailment or v_u_5.new(game.Players.LocalPlayer, {
        ["components"] = v25[v24] or {},
        ["created_timestamp"] = 0,
        ["kind"] = v24,
        ["progress"] = 0,
        ["rate"] = 0,
        ["rate_timestamp"] = -1,
        ["sort_order"] = 0
    })
    local v30 = v_u_2[v_u_29.kind]
    local v31 = v_u_29.description
    local v32 = v_u_8.get_entry_from_preference(v_u_29)
    local v33 = v_u_29.category
    local v34 = v_u_29.rate > 0
    local v35 = v33.colors
    local v36
    if typeof(v35) == "function" then
        v36 = v33.colors()
    else
        v36 = v33.colors
    end
    local v37 = v36.Keypoints[1].Value
    local v38 = v36.Keypoints[2].Value
    local v39 = v_u_22.Content.Text
    v39.AilmentName.Text = v31.name .. "!"
    v39.Frame.Description.Text = v31.display_text or ""
    local v40 = p_u_19.UIManager.wrap(v_u_22.Content.AilmentContainer.Ailment, "Ailment")
    v40:start({
        ["hide_progress"] = true,
        ["interactable"] = false,
        ["preference_always_visible"] = true
    })
    v40:update_ailment(v_u_29)
    p_u_19.maid:GiveTask(v40)
    for _, v41 in v_u_22.Edges:GetChildren() do
        v41.ImageColor3 = v38
        v41:FindFirstChildWhichIsA("ImageLabel").ImageColor3 = v37
    end
    for _, v42 in v39:GetDescendants() do
        if v42:IsA("TextLabel") then
            v42.TextColor3 = v38
        end
    end
    if v30.hide_reward then
        v_u_22.Content.Rewards.Visible = false
    else
        v_u_22.Content.Rewards.Visible = true
        v_u_22.Content.Rewards.BackgroundColor3 = v38
        local v43 = p_u_19.UIManager.apps.FocusPetApp.char_wrapper
        local v44 = v_u_3.apply_bucks_multiplier_for_pet(game.Players.LocalPlayer, v43, v30.reward)
        local v45 = v_u_3.apply_aging_multiplier_for_pet(game.Players.LocalPlayer, v43, 1)
        v_u_22.Content.Rewards.BucksAmount.Text = v30.reward <= 0 and "???" or v44
        v_u_22.Content.Rewards.XPAmount.Text = ("+%* XP"):format(v45)
    end
    if v32 then
        v39.Frame.Bonus.Text = ("<b>BONUS:</b> \"%s please!\""):format(v32.name)
    else
        v39.Frame.Bonus.Visible = false
    end
    v_u_22.Content.ClickAction.TextColor3 = v38
    if v34 or v30.hide_reward then
        v_u_22.Content.ClickAction.Text = "In Progress"
    else
        v_u_7.run({
            ["phone"] = function()
                v_u_22.Content.ClickAction.Text = ("Tap to %s"):format(v_u_28)
            end,
            ["tablet"] = "phone",
            ["default"] = function()
                v_u_22.Content.ClickAction.Text = ("Click to %s"):format(v_u_28)
            end
        })
    end
    p_u_19.instance.Selectable = v27
    if v27 then
        p_u_19.maid:GiveTask(p_u_19.instance.MouseEnter:connect(function()
            p_u_19:hover()
        end))
        p_u_19.maid:GiveTask(p_u_19.instance.MouseLeave:connect(function()
            p_u_19:stop_hovering()
        end))
        p_u_19.maid:GiveTask(p_u_19.instance.SelectionGained:connect(function()
            p_u_19:hover()
        end))
        p_u_19.maid:GiveTask(p_u_19.instance.SelectionLost:connect(function()
            p_u_19:stop_hovering()
        end))
        p_u_19.maid:GiveTask(p_u_19.instance[v_u_7.mouse_down_or_click()]:connect(function()
            v_u_26:Fire(v_u_29, v_u_23)
        end))
    end
end
function v15.destroy(p46)
    p46.maid:DoCleaning()
end
return v15