--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.HatShopUGCDisplayApp.UGCRewardPage (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("Class")
local v_u_3 = v_u_1("DeveloperProductDB")
local v_u_4 = v_u_1("UGCPurchaseManagerClient")
local v_u_5 = v_u_1("RouterClient")
local v_u_6 = v_u_1("ClientData")
local v_u_7 = v_u_1("ClientToolManager")
local v_u_8 = v_u_1("TweenPromise")
local v_u_9 = v_u_1("package:Promise")
local v_u_10 = v_u_1("new:ToggleableSignal")
local v_u_11 = utf8.char(57346)
local v12 = v2("UGCRewardPage", v_u_1("UIBaseElement"))
local v_u_13 = game:GetService("RunService")
function v12._start_hint(p14)
    local v15 = p14.instance.Hint
    local v_u_16 = v15:FindFirstChild("HintSpinner", true)
    local v17 = v15:FindFirstChild("HintSpinnerFrame", true)
    v_u_10.newConnect(v_u_13.Heartbeat, function()
        v_u_16.Rotation = os.clock() * 180 % 360
    end):WithProperty(v17, "Visible")
end
function v12._update_claim_button(p18, p19)
    if p19 == "Claimable" or p19 == "Purchase" then
        p18.claim_button:set_state("selected")
        p18.claim_button:set_enabled(true)
        p18.claim_button:set_button_pressed("up")
    elseif p19 == "Claiming" then
        p18.claim_button:set_state("selected")
        p18.claim_button:set_enabled(false)
        p18.claim_button:set_button_pressed("down")
    elseif p19 == "Unclaimable" then
        p18.claim_button:set_state("unpressable")
        p18.claim_button:set_enabled(false)
    else
        error(("Invalid claim button state: %s"):format((tostring(p19))))
    end
    if p19 == "Purchase" then
        local v20 = v_u_3.backup_ugc_pet_purchase
        p18.claim_button.instance.Face.Text.Text = ("%*%*"):format(v_u_11, v20.cost)
    else
        p18.claim_button.instance.Face.Text.Text = "Claim!"
    end
end
function v12._update_reward_frame(p21, p22)
    local v23 = p21.instance.Reward
    local v24 = v23.VisualContent
    v24.RewardImage.Position = UDim2.fromScale(0.5, 0.5)
    if p22 == "Claimable" or (p22 == "Claiming" or p22 == "Purchase") then
        v24.BackgroundCircle.ImageColor3 = Color3.fromRGB(238, 119, 38)
        v24.RewardImage.ImageTransparency = 0
        v24.RewardPinstripe.Visible = true
    elseif p22 == "Unclaimable" then
        v24.BackgroundCircle.ImageColor3 = Color3.fromRGB(178, 181, 186)
        v24.RewardImage.ImageTransparency = 0.25
        v24.RewardPinstripe.Visible = false
    else
        error(("Invalid reward frame state: %s"):format((tostring(p22))))
    end
    if p22 == "Purchase" then
        v23.Position = UDim2.new(0.5, 0, 0, p21.original_reward_position.Height.Offset)
        v23.AnchorPoint = Vector2.new(0.5, 0)
    else
        v23.Position = p21.original_reward_position
        v23.AnchorPoint = p21.original_reward_anchor
    end
end
function v12._start_reward_animation_frame(p_u_25)
    local v26 = p_u_25.instance.BigReward
    local v_u_27 = v26.RewardPinstripe
    local v_u_28 = v26.RewardPinstripe2
    local v_u_30 = v_u_10.newConnect(v_u_13.Heartbeat, function()
        if v_u_27.Visible or v_u_28.Visible then
            local v29 = os.clock()
            v_u_27.Rotation = v29 * 10 % 360
            v_u_28.Rotation = 7.25 + v29 * -10 % 360
        end
    end)
    local function v33()
        local v31 = v_u_30
        local v32 = p_u_25.instance.Visible
        if v32 then
            v32 = v_u_27.Visible or v_u_28.Visible
        end
        v31:SetEnabled(v32)
    end
    local v34 = p_u_25.instance.Visible
    if v34 then
        v34 = v_u_27.Visible or v_u_28.Visible
    end
    v_u_30:SetEnabled(v34)
    p_u_25.instance:GetPropertyChangedSignal("Visible"):Connect(v33)
    v_u_27:GetPropertyChangedSignal("Visible"):Connect(v33)
    v_u_28:GetPropertyChangedSignal("Visible"):Connect(v33)
    p_u_25:_hide_reward_animation()
end
function v12._play_reward_animation(p35)
    local v36 = p35.instance.BigReward
    local v_u_37 = v36.GiftImage
    local v_u_38 = v36.RewardImage
    local v_u_39 = v36.RewardPinstripe
    local v_u_40 = v36.RewardPinstripe2
    local v_u_41 = v36.Confetti
    v_u_37.Visible = true
    v_u_37.Position = UDim2.new(0.5, 0, 0.5, -400)
    v_u_37.UIScale.Scale = 1
    v_u_38.Visible = false
    v_u_39.Visible = false
    v_u_40.Visible = false
    v_u_41.Visible = false
    return v_u_9.try(function()
        v_u_8.new(v_u_37, TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
            ["Position"] = UDim2.new(0.5, 0, 0.5, 0)
        }):expect()
        task.wait(0.6)
        v_u_8.new(v_u_37.UIScale, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            ["Scale"] = 1.5
        }):expect()
        v_u_37.Visible = false
        v_u_41.Visible = true
        v_u_38.Visible = true
        v_u_41.UIScale.Scale = 0
        v_u_38.UIScale.Scale = 0.6
        v_u_9.all({ v_u_8.new(v_u_38.UIScale, TweenInfo.new(0.13, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                ["Scale"] = 1
            }), v_u_8.new(v_u_41.UIScale, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0.13), {
                ["Scale"] = 1
            }) }):expect()
        task.wait(1)
        v_u_39.Visible = true
        v_u_40.Visible = true
        v_u_39.ImageTransparency = 1
        v_u_40.ImageTransparency = 1
        v_u_9.all({ v_u_8.new(v_u_39, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {
                ["ImageTransparency"] = 0
            }), v_u_8.new(v_u_40, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {
                ["ImageTransparency"] = 0
            }) }):expect()
    end):catch(warn)
end
function v12._play_claiming_animation(p_u_42)
    local v43 = {}
    for v44 = 1, 5 do
        local v_u_45 = p_u_42.stamp_frames[v44].Content
        v_u_45.ClaimedCircle.Visible = false
        v_u_45.UnclaimedCircle.Visible = true
        local v46 = v_u_9.delay(v44 * 0.2):andThen(function()
            v_u_45.ClaimedCircle.Visible = true
            v_u_45.UnclaimedCircle.Visible = false
            v_u_8.new(v_u_45, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true), {
                ["Position"] = UDim2.new(0, 0, 0, 10)
            })
        end)
        table.insert(v43, v46)
    end
    return v_u_9.all(v43):andThen(function()
        local v47 = p_u_42.instance.Reward.VisualContent.RewardImage
        task.wait(0.2)
        p_u_42:_update_reward_frame("Claiming")
        return v_u_8.new(v47, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            ["Position"] = UDim2.new(0.5, 0, 0.5, -50),
            ["ImageTransparency"] = 1
        })
    end):catch(warn)
end
function v12._hide_reward_animation(p48)
    local v49 = p48.instance.BigReward
    local v50 = v49.GiftImage
    local v51 = v49.RewardImage
    local v52 = v49.RewardPinstripe
    local v53 = v49.RewardPinstripe2
    local v54 = v49.Confetti
    v50.Visible = false
    v51.Visible = false
    v52.Visible = false
    v53.Visible = false
    v54.Visible = false
end
function v12._run_claim_reward(p_u_55)
    p_u_55:_update_input_blocker(true, true)
    local v_u_56 = v_u_4.get_unclaimed_with_count_limit(5)
    p_u_55:_update_stamps(v_u_56)
    p_u_55:_update_hint({
        ["text"] = "Claiming reward...",
        ["spinner_visible"] = true
    })
    p_u_55:_update_claim_button("Claiming")
    p_u_55.busy_processing_claim = true
    p_u_55:_play_claiming_animation():andThen(function()
        return v_u_9.try(function()
            return v_u_5.get("UGCAPI/ClaimCollectorReward"):InvokeServer(v_u_56)
        end)
    end):andThen(function(p_u_57)
        p_u_55:_update_input_blocker(true)
        p_u_55:_update_hint({
            ["text"] = "Reward claimed! Thanks for shopping!",
            ["spinner_visible"] = false
        })
        p_u_55:_play_reward_animation():expect()
        v_u_9.try(function()
            local v_u_58 = v_u_1("PetEntityManager")
            local v_u_59 = v_u_1("PetEntityHelper")
            local v_u_60 = v_u_1("PetReactionName")
            local v61 = v_u_6.get("inventory").pets[p_u_57]
            v_u_7.equip(v61)
            v_u_9.try(function()
                return v_u_58.wait_for_local_owned_pet_entities()
            end):timeout(2):andThen(function(p62)
                for _, v63 in p62 do
                    if v63.base.char_wrapper.pet_unique == p_u_57 then
                        v_u_59.stage_reaction(v63, {
                            ["name"] = v_u_60.GreetOnJoinReaction
                        })
                        return
                    end
                end
            end)
        end):catch(warn)
        task.wait(6)
    end):catch(function()
        p_u_55:_update_hint({
            ["text"] = "Something went wrong while claiming the reward. Please try again later.",
            ["spinner_visible"] = false
        })
    end):finally(function()
        p_u_55:_update_input_blocker(false)
        p_u_55:_refresh_stamp_and_reward_frame()
        p_u_55:_hide_reward_animation()
    end):catch(warn):expect()
    p_u_55.busy_processing_claim = false
end
function v12._run_backup_purchase_reward(p64)
    p64.busy_processing_claim = true
    p64.UIManager.apps.DialogApp:dialog({
        ["product_id"] = "backup_ugc_pet_purchase",
        ["dialog_type"] = "RobuxProductDialog"
    })
    p64.busy_processing_claim = false
end
function v12._start_buttons(p_u_65)
    local v66 = {
        ["mouse_button1_click"] = function()
            if v_u_4.claimed_all_items_already() then
                p_u_65:_run_backup_purchase_reward()
            else
                p_u_65:_run_claim_reward()
            end
        end
    }
    p_u_65.claim_button = p_u_65.UIManager.wrap(p_u_65.instance.Reward.ClaimButton, "DepthButton"):start(v66)
    p_u_65:_update_claim_button("Unclaimable")
end
function v12._update_hint(p67, p68)
    local v69 = p67.instance.Hint
    local v70 = v69:FindFirstChild("HintText", true)
    local v71 = v69:FindFirstChild("HintSpinnerFrame", true)
    v70.Text = p68.text
    v71.Visible = p68.spinner_visible
end
function v12._update_input_blocker(p72, p73, p74)
    if p74 == nil then
        p74 = false
    end
    p72.instance.InputBlocker.Visible = p73
    p72.instance.InputBlocker.BackgroundTransparency = p74 and 1 or 0.15
end
function v12._update_stamps(p75, p76, p77)
    if p77 then
        p75.instance.Stamps.Visible = false
    else
        p75.instance.Stamps.Visible = true
        for v78 = 1, 5 do
            local v79 = p76[v78]
            local v80 = p75.stamp_frames[v78].Content
            if v79 then
                v80.AssetImage.Visible = true
                v80.AssetImage.Image = ("rbxthumb://type=Asset&id=%d&w=150&h=150"):format(v79)
            else
                v80.AssetImage.Visible = false
            end
            v80.ClaimedCircle.Visible = false
            v80.UnclaimedCircle.Visible = true
            if v79 then
                v80.UnclaimedCircle.ImageTransparency = 0
            else
                v80.UnclaimedCircle.ImageTransparency = 0.5
            end
        end
    end
end
function v12._refresh_stamp_and_reward_frame(p81)
    local v82 = v_u_4.get_unclaimed_with_count_limit(5)
    local v83 = #v82 == 5 and "Claimable" or (v_u_4.claimed_all_items_already() and "Purchase" or "Unclaimable")
    p81:_update_stamps(v82, v83 == "Purchase")
    p81:_update_claim_button(v83)
    p81:_update_reward_frame(v83)
    return v83
end
function v12._show_hint_for_state(p84, p85)
    if p85 == "Claimable" then
        p84:_update_hint({
            ["text"] = "You have all 5 stamps! Claim your reward now!",
            ["spinner_visible"] = false
        })
        return
    elseif p85 == "Purchase" then
        p84:_update_hint({
            ["text"] = "You have every stamp! You can still buy the reward.",
            ["spinner_visible"] = false
        })
    elseif p85 == "Unclaimable" then
        p84:_update_hint({
            ["text"] = "You don\'t have enough stamps! Buy an accessory and check again later.",
            ["spinner_visible"] = false
        })
    end
end
function v12.start(p_u_86, p87)
    local v88 = p87.refreshed_from_button_signal
    local v89 = p_u_86.instance
    p_u_86.original_reward_anchor = v89.Reward.AnchorPoint
    p_u_86.original_reward_position = v89.Reward.Position
    p_u_86.stamp_frames = {
        v89.Stamps.Stamp1,
        v89.Stamps.Stamp2,
        v89.Stamps.Stamp3,
        v89.Stamps.Stamp4,
        v89.Stamps.Stamp5
    }
    p_u_86.busy_processing_claim = false
    p_u_86:_start_buttons()
    p_u_86:_start_hint()
    p_u_86:_start_reward_animation_frame()
    p_u_86:_update_input_blocker(false)
    v_u_4.get_changed_signal():Connect(function()
        if not p_u_86.busy_processing_claim then
            p_u_86:_show_hint_for_state((p_u_86:_refresh_stamp_and_reward_frame()))
        end
    end)
    v88:Connect(function()
        p_u_86:_show_hint_for_state((p_u_86:_refresh_stamp_and_reward_frame()))
    end)
    p_u_86:reset()
    return p_u_86
end
function v12.show(p90)
    p90.instance.Visible = true
end
function v12.hide(p91)
    p91.instance.Visible = false
end
function v12.reset(p92)
    p92:_show_hint_for_state((p92:_refresh_stamp_and_reward_frame()))
end
return v12