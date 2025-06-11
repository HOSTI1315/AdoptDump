--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.TradePreviewApp (ModuleScript)

local v_u_1 = game:GetService("Players")
local v2 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v3 = v2("Class")
local v_u_4 = v2("Signal")
local v_u_5 = v2("XboxSupport")
local v_u_6 = v2("FriendsClient")
local v_u_7 = v2("GroupRankHelper")
local v_u_8 = v2("package:Promise")
local v_u_9 = {}
local v_u_10 = {}
local v11 = {
    ["compact"] = {
        ["CellPadding"] = UDim2.new(0, 5, 0, 5),
        ["CellSize"] = UDim2.new(0, 50, 0, 50)
    },
    ["loose"] = {
        ["CellPadding"] = UDim2.new(0, 6, 0, 6),
        ["CellSize"] = UDim2.new(0, 76, 0, 76)
    }
}
v_u_10.SlotsGridLayout = v11
local v12 = {
    ["compact"] = {
        ["PaddingTop"] = UDim.new(0, 5),
        ["PaddingBottom"] = UDim.new(0, 5),
        ["PaddingLeft"] = UDim.new(0, 5),
        ["PaddingRight"] = UDim.new(0, 5)
    },
    ["loose"] = {
        ["PaddingTop"] = UDim.new(0, 6),
        ["PaddingBottom"] = UDim.new(0, 6),
        ["PaddingLeft"] = UDim.new(0, 6),
        ["PaddingRight"] = UDim.new(0, 6)
    }
}
v_u_10.SlotsPadding = v12
v_u_10.TagScale = {
    ["compact"] = 0.6578947368421053,
    ["loose"] = 1
}
local v13 = v3("TradePreviewApp", v2("UIBaseApp"))
function v13.show(p14)
    p14.instance.Frame.Visible = true
end
function v13.hide(p15)
    p15.instance.Frame.Visible = false
    if p15.finish_preview then
        p15.finish_preview()
    end
end
function v13._preview(p_u_16, p17, p18, p19, p20, p_u_21, p_u_22, p23)
    if p_u_16.is_previewing then
        p_u_16.finish_preview()
    end
    p_u_16.is_previewing = true
    local v_u_24 = p_u_16.UIManager.apps.TradeApp:get_negotiation_frame():Clone()
    local v25 = v_u_24.Body
    v25.Accept.Visible = true
    v25.Decline.Visible = true
    v25.TradeIcon.Visible = true
    v25.LockIcon.Visible = false
    local v26 = v_u_24.Header
    v26.YouFrame.ProfileIcon.Visible = false
    v26.PartnerFrame.ProfileIcon.Visible = false
    if v_u_24:FindFirstChild("SpectateFrame") then
        v_u_24.SpectateFrame:Destroy()
    end
    v_u_24.Visible = true
    v_u_24.AnchorPoint = Vector2.new(0.5, 0.5)
    v_u_24.Position = UDim2.new(0.5, 0, 0.5, 0)
    v_u_24.Parent = p_u_16.instance.Frame
    p_u_16.item_display_frame = v_u_24
    v_u_24.Body.Decline.Face.TextLabel.Text = "Close"
    v_u_24.Header.PartnerFrame.NameLabel.Text = p20 or "Them"
    v_u_24.Header.YouFrame.NameLabel.Text = p19 or game.Players.LocalPlayer.Name
    v_u_24.Header.PartnerFrame.Icon.Image = ""
    v_u_24.Header.YouFrame.Icon.Image = ""
    local v_u_27
    if p_u_21 == nil then
        v_u_27 = v_u_8.resolve()
    else
        v_u_27 = v_u_8.all({ p_u_16.UIManager.apps.TradeApp:promise_get_verified_status(game.Players.LocalPlayer):andThen(function(p28)
                v_u_24.Header.YouFrame.Icon.Image = v_u_7.get_icon_from_tag(p28) or ""
            end):catch(warn), v_u_8.try(function()
                local v29 = v_u_1:GetPlayerByUserId(p_u_21)
                if v29 then
                    return p_u_16.UIManager.apps.TradeApp:promise_get_verified_status(v29)
                end
                local v30 = p_u_21
                local v31 = tostring(v30)
                local v32 = v_u_9[v31]
                if not v32 then
                    v32 = v_u_7.get_rank_from_user_id(p_u_21)
                    v_u_9[v31] = v32
                end
                if v32 then
                    v32 = v_u_7.get_tag_from_rank(v32)
                end
                if not v32 then
                    if v_u_6.promise_get_is_friends_with(p_u_21):expect() then
                        return "friend"
                    end
                    v32 = nil
                end
                return v32
            end):andThen(function(p33)
                v_u_24.Header.PartnerFrame.Icon.Image = v_u_7.get_icon_from_tag(p33) or ""
            end):catch(warn) })
    end
    local v34 = {
        ["num_condensed_slots"] = 4,
        ["num_slots"] = 9,
        ["should_tween_mobile_layout"] = false,
        ["mobile_layout_properties"] = v_u_10,
        ["can_add_and_remove_items"] = false,
        ["app"] = p_u_16,
        ["optional_xbox_tablet_parent_override"] = v_u_24
    }
    local v35 = p_u_16.UIManager.wrap(v_u_24.Body.MyOffer, "OfferPane"):start(v34)
    v35:set_accepted(false)
    v35:set_items(p17)
    local v36 = p_u_16.UIManager.wrap(v_u_24.Body.PartnerOffer, "OfferPane"):start(v34)
    v36:set_accepted(false)
    v36:set_items(p18)
    local v_u_37 = v_u_8.resolve()
    if p_u_22 then
        local v_u_38 = v_u_24.ChatFrame.ChatLog.ScrollComplex.ScrollingFrame.Content
        v_u_24.ChatFrame.InputFrame:Destroy()
        v_u_24.ChatFrame.ChatLog.Size = UDim2.new(1, -30, 1, -68)
        local v_u_39 = nil
        local v_u_40 = false
        local function v_u_48()
            for _, v41 in v_u_38:GetChildren() do
                if v41:IsA("TextLabel") then
                    v41:Destroy()
                end
            end
            return v_u_8.new(function(p42, _, p43)
                local v44 = v_u_39
                if not v_u_40 then
                    v44 = p_u_22()
                    v_u_39 = v44
                    v_u_40 = true
                end
                if not p43() then
                    if v44 then
                        for _, v45 in v44 do
                            local v46 = p_u_16.UIManager.apps.TradeApp:get_chat_message_template():Clone()
                            v46.Text = ("<b>%s:</b> %s"):format(v45.username, v45.message)
                            v46.Parent = v_u_38
                            v46.Size = UDim2.new(1, 0, 0, v46.TextBounds.Y)
                        end
                    else
                        local v47 = p_u_16.UIManager.apps.TradeApp:get_chat_message_template():Clone()
                        v47.Text = ("<b><font color=\"rgb(255,0,0)\">%s</font></b>"):format("Error: Unable to load chat logs for this trade.")
                        v47.Parent = v_u_38
                        v47.Size = UDim2.new(1, 0, 0, v47.TextBounds.Y)
                    end
                    v_u_38.Parent.CanvasSize = UDim2.new(0, 0, 0, v_u_38.UIListLayout.AbsoluteContentSize.Y + 32)
                    p42()
                end
            end)
        end
        p_u_16.UIManager.wrap(v_u_24.ChatFrame.Header.ExitButton, "DepthButton"):start({
            ["mouse_button1_click"] = function()
                v_u_24.ChatFrame.Visible = false
            end
        })
        v_u_24.Body.ChatToggle.Activated:Connect(function()
            v_u_24.ChatFrame.Visible = true
            v_u_37:cancel()
            v_u_37 = v_u_48()
        end)
    else
        v_u_24.ChatFrame:Destroy()
        v_u_24.Body.ChatToggle:Destroy()
    end
    p_u_16.UIManager.set_app_visibility(p_u_16.ClassName, true)
    local v_u_49 = v_u_4.new()
    function p_u_16.finish_preview()
        p_u_16.is_previewing = false
        p_u_16.finish_preview = nil
        p_u_16.item_display_frame = nil
        v_u_24:Destroy()
        v_u_37:cancel()
        v_u_27:cancel()
        v_u_49:fire()
        v_u_49:destroy()
    end
    p_u_16.UIManager.wrap(v_u_24.Body.Decline, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_16.UIManager.set_app_visibility(p_u_16.ClassName, false)
        end
    })
    if p23 then
        v_u_24.Body.Accept.Face.TextLabel.Text = p23.text
        p_u_16.UIManager.wrap(v_u_24.Body.Accept, "DepthButton"):start({
            ["mouse_button1_click"] = p23.callback,
            ["state"] = p23.state
        })
    else
        v_u_24.Body.Accept.Visible = false
        v_u_24.Body.Decline.AnchorPoint = Vector2.new(0.5, 1)
        v_u_24.Body.Decline.Position = UDim2.fromScale(0.5, 1)
    end
    v_u_49:wait()
    return true
end
function v13.preview_trade(p_u_50, p51, p52, p53, p54, p55, p_u_56, p57)
    return p_u_50:_preview(p51, p52, p53, p54, p55, nil, not p57 and p_u_56 and {
        ["text"] = p_u_56.reverted and "Reverted" or (p_u_56.reported and "Reported" or "Report"),
        ["state"] = p_u_56 and p_u_56.reported and "unpressable" or "selected",
        ["callback"] = function()
            if p_u_56.reverted then
                p_u_50.UIManager.apps.TradeHistoryApp:show_support_reverted_message(p_u_56)
            else
                p_u_50.UIManager.set_app_visibility(p_u_50.ClassName, false)
                p_u_50.UIManager.apps.TradeHistoryApp:report_scam(p_u_56)
            end
        end
    } or p57)
end
function v13.preview_revert(p58, p59, p60, p61, p62, p63, p64, p65)
    return p58:_preview(p59, p60, nil, p61, p62, p65, {
        ["text"] = p63.reverted and "Reverted" or "Revert",
        ["state"] = p63.reverted and "inactive" or "selected",
        ["callback"] = p64
    })
end
function v13.start(p_u_66)
    p_u_66.is_previewing = false
    v_u_5.quick_watch({
        ["selection_parent"] = p_u_66.instance.Frame,
        ["default_selection"] = function()
            if p_u_66.item_display_frame then
                return p_u_66.item_display_frame.Body.Decline
            else
                return p_u_66.instance.Frame
            end
        end,
        ["app_name"] = p_u_66.ClassName
    })
end
return v13