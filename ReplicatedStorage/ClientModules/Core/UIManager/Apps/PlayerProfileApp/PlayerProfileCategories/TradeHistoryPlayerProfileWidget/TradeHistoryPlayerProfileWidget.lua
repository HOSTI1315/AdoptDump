--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.PlayerProfileApp.PlayerProfileCategories.TradeHistoryPlayerProfileWidget (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("PlatformM")
local v_u_4 = v1("RouterClient")
local v_u_5 = v1("SharedConstants")
local v_u_6 = v1("PlayerProfileHelper")
local v_u_7 = game:GetService("GuiService")
local v_u_8 = v1("package:Sift")
local v9 = v2("TradeHistoryPlayerProfileWidget", v1("BasePlayerProfileWidget"))
local v_u_10 = game.Players.LocalPlayer
local v_u_11 = v_u_5.player_profiles.max_trades_per_widget
local v_u_12 = {
    ["DESKTOP"] = {
        ["W"] = "rbxassetid://18208117076",
        ["F"] = "rbxassetid://18208117211",
        ["L"] = "rbxassetid://18208120213"
    },
    ["MOBILE"] = {
        ["W"] = "rbxassetid://17589861010",
        ["F"] = "rbxassetid://17589861067",
        ["L"] = "rbxassetid://17589861153"
    }
}
function v9._add_trade(p_u_13, p14)
    local v17 = p_u_13.UIManager.apps.TradeHistoryApp:pick_trade(function(p15)
        for _, v16 in p_u_13.trades do
            if v16.trade_id == p15.trade_id then
                return false
            end
        end
        return true
    end)
    if v17 then
        v17 = v17.trade_record
    end
    if v17 then
        local v18 = v_u_6.trim_trade_record(v17, v_u_10)
        local v19 = p_u_13.trades
        table.insert(v19, p14, v18)
        p_u_13:_render_trade(p14)
    end
end
function v9._remove_trade(p20, p21)
    if p20.trades[p21] ~= nil then
        table.remove(p20.trades, p21)
        p20:_render_trade(p21)
    end
end
function v9._render_trade(p22, p23)
    local v24 = v_u_7.SelectedObject
    local v25
    if p22.editing then
        v25 = #p22.trades + 1
    else
        v25 = #p22.trades
    end
    local v26 = v_u_11
    local v27 = math.clamp(v25, 1, v26)
    local v28
    if v27 < p23 then
        v28 = v27
    else
        v28 = p23 < 1 and 1 or p23
    end
    p22.trade_index = v28
    p22.previous_trade_button.instance.Visible = v28 > 1
    p22.next_trade_button.instance.Visible = v28 < v27
    local v29 = p22.trades[v28]
    if v29 then
        local v30 = v29.sender_items or {}
        local v31 = v29.recipient_items or {}
        if v29.recipient_name == p22.player_profile.username then
            local v32 = v31
            v31 = v30
            v30 = v32
        end
        p22.my_offer_pane:set_items(v30)
        p22.partner_offer_pane:set_items(v31)
        local v33 = p22.my_offer_pane.instance.Slots
        local v34 = v33.SlotsGridLayout.AbsoluteCellCount.Y
        local v35 = 23
        if v34 > 3 then
            v35 = v35 - 1
            p22.my_offer_pane.instance.Slots.CanvasSize = UDim2.fromOffset(0, (v35 + 1) * v34)
        else
            p22.my_offer_pane.instance.Slots.CanvasSize = UDim2.fromOffset(0, 0)
        end
        p22.my_offer_pane.props.fixed_property_size = v35 / 4
        p22.my_offer_pane:_refresh()
        v33.SlotsGridLayout.CellSize = UDim2.fromOffset(v35, v35)
        p22.trade_frame.TradeIcon.Position = p22.trade_icon_position
        if v33.AbsoluteCanvasSize.Y > v33.AbsoluteWindowSize.Y then
            local v36 = p22.trade_frame.TradeIcon
            v36.Position = v36.Position + UDim2.fromOffset(-2, 0)
        end
        local v37 = p22.partner_offer_pane.instance.Slots
        local v38 = v37.SlotsGridLayout.AbsoluteCellCount.Y
        local v39 = 23
        if v38 > 3 then
            v39 = v39 - 1
            v37.CanvasSize = UDim2.fromOffset(0, (v39 + 1) * v38)
        else
            v37.CanvasSize = UDim2.fromOffset(0, 0)
        end
        p22.partner_offer_pane.props.fixed_property_size = v39 / 4
        p22.partner_offer_pane:_refresh()
        v37.SlotsGridLayout.CellSize = UDim2.fromOffset(v39, v39)
        p22.trade_frame.TradeIcon.Position = p22.trade_icon_position
        if v37.AbsoluteCanvasSize.Y > v37.AbsoluteWindowSize.Y then
            local v40 = p22.trade_frame.TradeIcon
            v40.Position = v40.Position + UDim2.fromOffset(-2, 0)
        end
        local v41 = p22:_can_vote(v28)
        local v42 = v29.voters
        if v42 then
            local v43 = v29.voters
            local v44 = v_u_10.UserId
            v42 = v43[tostring(v44)]
        end
        local v45 = not v41 or v42 ~= nil
        p22.vote_ui.TitleLabel.Text = v45 and "VOTES" or "VOTE"
        local v46 = v29.votes or {}
        for v47, v48 in p22.vote_buttons do
            v47.VoteLabel.Text = v46[v47.Name] or "0"
            v47.VoteLabel.Visible = v45
            v48.instance.Selectable = v41
            local v49
            if v42 == nil then
                v49 = false
            else
                v49 = v47.name ~= v42
            end
            v48.instance.Face.ImageTransparency = v49 and 0.4 or 0
            v48.instance.Shadow.ImageTransparency = v49 and 0.8 or 0.55
            if v41 then
                v48:enable()
            else
                v48:disable()
            end
        end
    end
    local v50 = v29 ~= nil
    local v51 = p22.add_trade_button.instance
    local v52 = p22.editing
    if v52 then
        v52 = not v50
    end
    v51.Visible = v52
    p22.remove_trade_button.instance.Visible = p22.editing and v50
    p22.trade_frame.Visible = v50
    p22.view_trade_button.instance.Visible = v50
    p22.vote_ui.Visible = v50
    p22.vote_ui.Position = UDim2.new(1, p22.next_trade_button.instance.Visible and -30 or -15, 0.5, 0)
    if v24 and not (v24.Visible and v24.Selectable) then
        local v53 = p22.player_profile_app
        local v54
        if v29 then
            v54 = p22.view_trade_button.instance
        else
            v54 = p22.add_trade_button.instance
        end
        v53:set_gamepad_selection(v54)
    end
end
function v9._can_vote(p55, p56)
    local v57 = p55.player_profile.player
    if v57 == nil then
        return false
    end
    if v57 == v_u_10 then
        return false
    end
    local v58 = p55.trades[p56]
    if not v58 then
        return false
    end
    if v58.can_vote ~= nil then
        return v58.can_vote
    end
    local v59 = v58 and (v58.voters or {}) or {}
    if v_u_8.Dictionary.count(v59) < v_u_5.player_profiles.max_trade_votes then
        return true
    end
    v58.can_vote = false
    return false
end
function v9._cast_vote(p60, p61, p62)
    if p60:_can_vote(p61) then
        local v63 = p60.trades[p61]
        if v63 then
            v_u_4.get("PlayerProfileAPI/CastTradeVote"):FireServer(p60.player_profile.player, p60.page, p60.slot, p61, v63.trade_id, p62)
            v63.votes = v63.votes or {}
            v63.voters = v63.voters or {}
            local v64 = v63.voters
            local v65 = v_u_10.UserId
            local v66 = v64[tostring(v65)]
            v63.votes[p62] = (v63.votes[p62] or 0) + 1
            local v67 = v63.voters
            local v68 = v_u_10.UserId
            v67[tostring(v68)] = p62
            if v66 and v63.votes[v66] then
                v63.votes[v66] = v63.votes[v66] - 1
            end
            p60:render()
        end
    else
        return
    end
end
function v9.select(p69)
    if p69.view_trade_button.instance.Visible then
        return p69.view_trade_button.instance
    elseif p69:_can_vote(p69.trade_index) then
        return p69.vote_ui:FindFirstChild("W").EmojiButton
    else
        return nil
    end
end
function v9.render(p70)
    p70:_render_trade(p70.trade_index)
end
function v9.get_save_data(p71)
    return {
        ["trades"] = p71.trades,
        ["title"] = p71.title:to_save()
    }
end
function v9.get_temp_data(p72)
    return {
        ["index"] = p72.trade_index,
        ["temp_trades"] = p72.trades
    }
end
function v9.start(p_u_73, p74, p75)
    local v76 = p75 or {}
    local v77 = p74 or {}
    p_u_73.trade_index = v76.index or 1
    p_u_73.trades = v_u_8.List.slice(v76.temp_trades or (v77.trades or {}), 1, v_u_11)
    p_u_73.trade_frame = p_u_73.instance.Body.Trade
    p_u_73.vote_ui = p_u_73.instance.Body.Vote
    p_u_73.trade_icon_position = p_u_73.trade_frame.TradeIcon.Position
    p_u_73.title = p_u_73.UIManager.wrap(p_u_73.instance.Title, "WidgetText"):start(p_u_73, {
        ["default_text"] = "Trade History",
        ["editable"] = true
    })
    p_u_73.title:set(v77.title)
    local v78
    if v_u_3.get_platform() == "phone" or v_u_3.get_platform() == "tablet" then
        v78 = v_u_12.MOBILE
        p_u_73.trade_frame.TradeIcon.Image = "rbxassetid://5560368350"
    else
        v78 = v_u_12.DESKTOP
        p_u_73.trade_frame.TradeIcon.Image = "rbxassetid://2925181065"
    end
    p_u_73.vote_buttons = {}
    for _, v_u_79 in p_u_73.vote_ui:GetChildren() do
        if v_u_79:IsA("Frame") then
            p_u_73.vote_buttons[v_u_79] = p_u_73.UIManager.wrap(v_u_79.EmojiButton, "IconButton"):start({
                ["mouse_button1_click"] = function()
                    p_u_73:_cast_vote(p_u_73.trade_index, v_u_79.Name)
                end
            })
            v_u_79.EmojiButton.Face.Image = v78[v_u_79.Name] or v_u_79.EmojiButton.Face.Image
        end
    end
    p_u_73.previous_trade_button = p_u_73.UIManager.wrap(p_u_73.instance.Body.Left, "IconButton"):start({
        ["mouse_button1_click"] = function()
            p_u_73:_render_trade(p_u_73.trade_index - 1)
        end
    })
    p_u_73.next_trade_button = p_u_73.UIManager.wrap(p_u_73.instance.Body.Right, "IconButton"):start({
        ["mouse_button1_click"] = function()
            p_u_73:_render_trade(p_u_73.trade_index + 1)
        end
    })
    p_u_73.add_trade_button = p_u_73.UIManager.wrap(p_u_73.instance.Body.AddButton, "IconButton"):start({
        ["mouse_button1_click"] = function()
            p_u_73:_add_trade(p_u_73.trade_index)
        end
    })
    p_u_73.remove_trade_button = p_u_73.UIManager.wrap(p_u_73.instance.Body.RemoveButton, "IconButton"):start({
        ["mouse_button1_click"] = function()
            p_u_73:_remove_trade(p_u_73.trade_index)
        end
    })
    local v80 = {
        ["num_condensed_slots"] = 9,
        ["num_slots"] = 9,
        ["can_add_and_remove_items"] = false,
        ["optional_xbox_tablet_parent_override"] = p_u_73.player_profile_app.tooltip.tooltip:get_container().Parent,
        ["app"] = p_u_73.player_profile_app,
        ["scrollbar_thickness"] = 3
    }
    p_u_73.my_offer_pane = p_u_73.UIManager.wrap(p_u_73.trade_frame.MyOffer, "OfferPane"):start(v80)
    p_u_73.my_offer_pane:set_accepted(false)
    p_u_73.my_offer_pane.tooltip.tooltip:get_container().ZIndex = 15
    p_u_73.partner_offer_pane = p_u_73.UIManager.wrap(p_u_73.trade_frame.PartnerOffer, "OfferPane"):start(v80)
    p_u_73.partner_offer_pane:set_accepted(false)
    p_u_73.partner_offer_pane.tooltip.tooltip:get_container().ZIndex = 15
    p_u_73.view_trade_button = p_u_73.UIManager.wrap(p_u_73.instance.Body.ViewTradeButton, "CustomButton"):start({
        ["mouse_button1_click"] = function()
            local v81 = p_u_73.trades[p_u_73.trade_index]
            if v81 then
                local v82 = v81.sender_items or {}
                local v83 = v81.recipient_items or {}
                if v81.recipient_name == p_u_73.player_profile.username then
                    local v84 = v83
                    v83 = v82
                    v82 = v84
                end
                p_u_73.UIManager.apps.TradePreviewApp:preview_trade(v82, v83, p_u_73.player_profile.username)
            end
        end
    })
end
return v9