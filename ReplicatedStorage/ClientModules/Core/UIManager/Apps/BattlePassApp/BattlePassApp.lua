--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.BattlePassApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AltCurrencyData")
local v_u_3 = v1("AltCurrencyDB")
local v_u_4 = v1("BattlePassDB")
local v_u_5 = v1("RouterClient")
local v_u_6 = v1("LiveOpsTime")
local v_u_7 = v1("InventoryDB")
local v_u_8 = v1("SoundPlayer")
local v_u_9 = v1("XboxSupport")
local v_u_10 = v1("ClientData")
local v11 = v1("Class")
local v_u_12 = v1("package:Promise")
local v_u_13 = game:GetService("TweenService")
local v14 = v11("BattlePassApp", v1("UIBaseApp"))
local v_u_15 = {
    ["entry_name"] = nil,
    ["entry"] = nil,
    ["xp"] = 0,
    ["rewards_claimed"] = 0
}
local v_u_16 = Color3.fromRGB(68, 69, 71)
local v_u_17 = Color3.fromRGB(74, 198, 85)
function v14.view(p18, p19)
    if not p18.UIManager.is_visible("BattlePassApp") then
        local v20 = v_u_4[p19]
        if v20 then
            v_u_15.entry_name = p19
            v_u_15.entry = v20
        end
        p18.UIManager.set_app_visibility(p18.ClassName, true)
        p18:_update_from_server(true)
        p18:_scroll_to_index(v_u_15.rewards_claimed)
    end
end
function v14.try_to_reset_pass(p_u_21, p_u_22)
    local v23 = v_u_4[p_u_22]
    if v23 then
        v_u_15.entry_name = p_u_22
        v_u_15.entry = v23
    end
    p_u_21:_update_from_server(false):andThen(function()
        local v24 = v_u_4[v_u_15.entry_name]
        local v25 = v24.reset_options
        if p_u_21:_can_reset_pass() and p_u_21.UIManager.apps.DialogApp:dialog({
            ["text"] = (v25.reset_prompt or "Pay %d %s to restart the %s?"):format(v25.cost.amount, v25.cost.kind or "Bucks", v24.display_name),
            ["left"] = "No",
            ["right"] = "Yes"
        }) == "Yes" then
            local v26, v27 = p_u_21:_attempt_to_restart_pass()
            if v26 then
                p_u_21:view(p_u_22)
                return
            end
            if v27 == "not enough money" then
                if v25.cost.kind == v_u_2.name and v_u_2.purchasable then
                    p_u_21.UIManager.set_app_visibility("AltCurrencyPurchaseApp", true)
                    return
                end
                p_u_21.UIManager.set_app_visibility("BucksPurchaseApp", true)
            end
        end
    end)
end
function v14.close(p28)
    p28.UIManager.set_app_visibility(p28.ClassName, false)
end
function v14._update_from_server(p_u_29, p_u_30)
    if v_u_15.entry_name then
        if not p_u_30 or p_u_29.UIManager.is_visible("BattlePassApp") then
            return v_u_12.try(function()
                local v31 = v_u_15.rewards_claimed
                local v32 = v_u_10.get("battle_pass_manager")
                local v33 = v32 and v32[v_u_15.entry_name] or {}
                v_u_15.xp = v33.xp or 0
                v_u_15.rewards_claimed = v33.rewards_claimed or 0
                if p_u_30 then
                    p_u_29:_render()
                    p_u_29:try_to_reset_pass()
                    if v_u_15.rewards_claimed ~= v31 then
                        p_u_29:_scroll_to_index(v_u_15.rewards_claimed, true)
                    end
                end
            end)
        end
    end
end
function v14._scroll_to_index(p34, p35, p36)
    local v37 = p34.entry_template:Clone()
    v37.Parent = p34.scrolling_frame
    local v38 = v37.AbsoluteSize.X * p35
    v37:Destroy()
    if p36 then
        if p34.last_scroll_index then
            p34.scrolling_frame.CanvasPosition = Vector2.new(v37.AbsoluteSize.X * p34.last_scroll_index, 0)
        end
        local v39 = TweenInfo.new(0.32, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)
        v_u_13:Create(p34.scrolling_frame, v39, {
            ["CanvasPosition"] = Vector2.new(v38, 0)
        }):Play()
    else
        p34.scrolling_frame.CanvasPosition = Vector2.new(v38, 0)
    end
    p34.last_scroll_index = p35
end
function v14._attempt_to_claim_reward(_, p40)
    if v_u_5.get("BattlePassAPI/ClaimReward"):InvokeServer(v_u_15.entry_name, p40) then
        v_u_8.Interface:play("TaskBoard/Reward")
    end
end
function v14._can_reset_pass(p41)
    local v42 = v_u_4[v_u_15.entry_name]
    local v43 = v42.reset_options
    if not v43 or (v43.can_reset == false or (not v43.cost or v_u_15.rewards_claimed ~= #v42.track)) then
        return false
    end
    if not (v43.can_reset_until_timestamp and v_u_6.has_happened(v43.can_reset_until_timestamp)) then
        return true
    end
    p41.UIManager.apps.DialogApp:dialog({
        ["text"] = (v42.event_end_reset_prompt or "The %s is ending soon, so it can no longer be restarted."):format(v42.display_name),
        ["button"] = "Okay"
    })
    return false
end
function v14._attempt_to_restart_pass(_)
    return v_u_5.get("BattlePassAPI/AttemptBattlePassReset"):InvokeServer(v_u_15.entry_name)
end
function v14._render(p_u_44)
    if not p_u_44.body.Visible then
        return
    end
    for _, v45 in p_u_44.scrolling_frame:GetChildren() do
        if v45:IsA("Frame") then
            v45:Destroy()
        end
    end
    p_u_44.claim_button = nil
    local v46 = v_u_15.entry.track
    local v47 = v_u_15.xp
    local v48 = false
    local v49 = nil
    local v50 = 0
    for v51 = 1, #v46 + 1 do
        local v_u_52 = v51 - 1
        local v53
        if v51 <= #v46 then
            v53 = v46[v51]
        else
            v53 = false
        end
        local v54
        if v51 > 1 then
            v54 = v46[v_u_52]
        else
            v54 = false
        end
        local v55 = p_u_44.entry_template:Clone()
        v55.Name = v51
        v55.LayoutOrder = v51
        v55.Parent = p_u_44.scrolling_frame
        local v56 = v55.Reward
        if v54 then
            local v57 = v56.IconFrame.Icon
            local v58 = v56.Quantity
            local v59 = v58.TextLabel
            local v60 = v54.reward
            if v60 then
                local v61 = v60.category
                local v62 = v60.kind
                if v61 == "currency" then
                    if v62 == "bucks" or v62 == "money" then
                        v57.Image = "rbxassetid://6991531565"
                    else
                        v57.Image = v_u_3[v62].sprout_images.B
                    end
                    v59.Text = "x" .. v60.amount
                else
                    v57.Image = v_u_7[v61][v62].image
                    if v60.amount > 1 then
                        v59.Text = "x" .. v60.amount
                    else
                        v58:Destroy()
                    end
                end
                if v_u_52 <= v_u_15.rewards_claimed then
                    v58:Destroy()
                    v56.Background.ImageColor3 = v_u_17
                    v56.Overlay.Visible = true
                    v56.Check.Visible = true
                end
            else
                v56:Destroy()
            end
        else
            v56:Destroy()
        end
        local v63 = v55.ButtonFrame.ClaimButton
        local v_u_64 = false
        if v54 and not p_u_44.claim_button then
            if v54.xp_needed <= v47 and v_u_52 > v_u_15.rewards_claimed then
                p_u_44.claim_button = v63
                local v65 = {
                    ["mouse_button1_click"] = function()
                        if not v_u_64 then
                            v_u_64 = true
                            p_u_44:_attempt_to_claim_reward(v_u_52)
                            v_u_12.delay(1):andThen(function()
                                v_u_64 = false
                            end)
                        end
                    end
                }
                p_u_44.UIManager.wrap(v63, "DepthButton"):start(v65)
                p_u_44.watch:select_object(v63)
            else
                v63:Destroy()
            end
        else
            v63:Destroy()
        end
        local v66 = v55.Bar
        local v67 = v66.BarLeft
        local v68 = v66.BarRight
        local v69 = v66.Icon.RewardNumber
        local v70 = v66.Icon.RewardIcon
        if v_u_52 > 0 then
            v69.Visible = true
            v69.Text = v_u_52
            v69.TextColor3 = v_u_52 <= v_u_15.rewards_claimed and v_u_17 or v_u_16
            v70:Destroy()
        else
            v69:Destroy()
        end
        if not v54 then
            v67.Background.ImageTransparency = 1
            v67.Fill.ImageLabel.ImageTransparency = 1
        end
        if not v53 then
            v68.Background.ImageTransparency = 1
            v68.Fill.ImageLabel.ImageTransparency = 1
        end
        if not v48 then
            if v49 then
                v67.Fill.ImageLabel.Size = UDim2.new(v49, 0, 1, 0)
                if v49 >= 1 then
                    goto l55
                end
                v48 = true
            else
                ::l55::
                if v53 then
                    if v53 then
                        v53 = v53.xp_needed
                    end
                    local v71
                    if v53 <= v47 then
                        v71 = 1
                        v49 = 1
                    else
                        local v72 = v53 - v47
                        local v73 = 1 - v72 / (v53 - v50)
                        local v74 = math.min(v73, 0.5)
                        local v75 = v73 - 0.5
                        if v73 <= 0.5 then
                            v71 = v74 * 2
                            v48 = true
                            v49 = 0
                        else
                            v49 = v75 * 2
                            v71 = 1
                        end
                        p_u_44.body.Header.NextLevelFrame.TextLabel.Text = ("%s XP to next Level"):format(v72)
                    end
                    if v71 then
                        v68.Fill.ImageLabel.Size = UDim2.new(v71, 0, 1, 0)
                    end
                    v50 = v53
                end
            end
        end
    end
    local v76 = v_u_15.entry.hint_text
    local v77 = p_u_44.body.Frame.HintFrame
    if v76 then
        v76 = not p_u_44.claim_button
    end
    v77.Visible = v76
    p_u_44.header.Title.Title.Text = v_u_15.entry.display_name
    p_u_44.header.Title.Icon.Image = v_u_15.entry.icon_image
    p_u_44.header.NextLevelFrame.Visible = v_u_15.xp < v46[#v46].xp_needed
end
function v14.show(p78)
    p78.body.Visible = true
    v_u_8.Interface:play("TaskBoard/Open")
end
function v14.hide(p79)
    p79.body.Visible = false
    if p79.is_initial_hide then
        p79.is_initial_hide = false
    else
        v_u_8.Interface:play("TaskBoard/Close")
    end
end
function v14.refresh(p80, p81)
    local v82 = p80.UIManager.is_closed({
        "MainMenuApp",
        "MannequinPurchaseApp",
        "JackboxRewardApp",
        "StickerRewardsApp",
        "TradePreviewApp",
        "TradeHistoryApp",
        "MinigameRewardsApp",
        "MinigameNewsPaperApp"
    })
    if not p81[p80.ClassName] then
        v82 = false
    end
    if p80.UIManager.apps.HouseEditorWrapperApp.editor_open and p80.UIManager.apps.HouseEditorWrapperApp.drawer_open then
        v82 = false
    end
    p80:set_visibility(v82)
end
function v14.start(p_u_83)
    p_u_83.body = p_u_83.instance.Body
    p_u_83.inner_body = p_u_83.body.InnerBody
    p_u_83.header = p_u_83.body.Header
    p_u_83.scrolling_frame = p_u_83.inner_body.ScrollingFrame
    p_u_83.entry_template = p_u_83.scrolling_frame.LevelTemplate
    p_u_83.entry_template.Parent = nil
    p_u_83.claim_button = nil
    p_u_83.last_scroll_index = nil
    p_u_83.is_initial_hide = true
    p_u_83.exit_button = p_u_83.UIManager.wrap(p_u_83.header.ExitFrame.ExitButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_83:close()
        end
    })
    v_u_10.register_server_on_change_hook("battle_pass_manager", nil, function(_, _, _)
        p_u_83:_update_from_server(true)
    end)
    p_u_83.watch = v_u_9.quick_watch({
        ["selection_parent"] = p_u_83.body,
        ["default_selection"] = function()
            if p_u_83.claim_button then
                return p_u_83.claim_button
            else
                return p_u_83.scrolling_frame
            end
        end,
        ["app_name"] = p_u_83.ClassName,
        ["exit_buttons"] = { p_u_83.header.ExitFrame.ExitButton }
    })
end
return v14