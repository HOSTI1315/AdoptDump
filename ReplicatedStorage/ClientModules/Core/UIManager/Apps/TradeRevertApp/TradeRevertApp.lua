--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.TradeRevertApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("RouterClient")
local v_u_3 = v1("XboxSupport")
local v_u_4 = v1("PlatformM")
local v_u_5 = game:GetService("GuiService")
local v_u_6 = game:GetService("RunService")
local v_u_7 = game:GetService("LocalizationService"):GetTranslatorForPlayer(game.Players.LocalPlayer)
local v_u_8 = nil
local v9 = v1("Class")
local v_u_10 = v1("Utilities/formatDate")
local v_u_11 = {}
local v12 = {
    ["compact"] = {
        ["CellPadding"] = UDim2.new(0, 2, 0, 2),
        ["CellSize"] = UDim2.new(0, 23, 0, 23)
    },
    ["loose"] = {
        ["CellPadding"] = UDim2.new(0, 2, 0, 2),
        ["CellSize"] = UDim2.new(0, 23, 0, 23)
    }
}
v_u_11.SlotsGridLayout = v12
local v13 = {
    ["compact"] = {
        ["PaddingTop"] = UDim.new(0, 4),
        ["PaddingBottom"] = UDim.new(0, 4),
        ["PaddingLeft"] = UDim.new(0, 4),
        ["PaddingRight"] = UDim.new(0, 4)
    },
    ["loose"] = {
        ["PaddingTop"] = UDim.new(0, 4),
        ["PaddingBottom"] = UDim.new(0, 4),
        ["PaddingLeft"] = UDim.new(0, 4),
        ["PaddingRight"] = UDim.new(0, 4)
    }
}
v_u_11.SlotsPadding = v13
v_u_11.TagScale = {
    ["compact"] = 0.1,
    ["loose"] = 0.1
}
local v14 = v9("TradeRevertApp", v1("UIBaseApp"))
function v14._clear_scrolling_frame(p15, p16)
    for _, v17 in ipairs(p15.frames or {}) do
        v17:Destroy()
    end
    p15.frames = {}
    p15.wrapped_buttons = {}
    if not p16 then
        p15.max_num_frames_scrollable = nil
        p15.scrolling_frame.CanvasPosition = Vector2.new()
        p15.scrolling_frame.CanvasSize = UDim2.new()
    end
end
function v14._recall_cmdr_request_command(_)
    if not v_u_8 then
        return
    end
    local v18 = v_u_8.Dispatcher:GetHistory()
    local v19 = nil
    for v20 = #v18, 1, -1 do
        local v21 = v18[v20]
        local v22, v23, v24 = unpack(v21:split(" "))
        if v22 == "reverttrade" and (v23 and v24 == nil) then
            v19 = v23
            break
        end
    end
    if v19 then
        v_u_8.Dispatcher:Run("reverttrade", v19)
    end
end
function v14._send_revert_request(p25, p26)
    p25.trade_being_reverted = true
    if p26 == nil then
        v_u_2.get("TradeAPI/SendCmdrRevertTradeId"):InvokeServer(p25.current_ticket, nil)
        p25.UIManager.set_app_visibility(p25.ClassName, false)
        p25.trade_being_reverted = false
    else
        local v27 = false
        if p25.UIManager.apps.DialogApp:dialog({
            ["text"] = ("This trade will be reverted.\nAre you sure?"):format(p26.trade_id),
            ["left"] = "No",
            ["right"] = "Yes"
        }) == "Yes" then
            local v28 = v_u_2.get("TradeAPI/SendCmdrRevertTradeId"):InvokeServer(p25.current_ticket, p26.trade_id)
            p25.current_ticket_completed = v28
            if v28 then
                p25.UIManager.set_app_visibility(p25.ClassName, false)
                p25.UIManager.apps.DialogApp:dialog({
                    ["text"] = "The trade was successfully reverted!",
                    ["button"] = "Okay"
                })
                v27 = true
            end
        end
        p25.trade_being_reverted = false
        if v27 then
            p25:_recall_cmdr_request_command()
        end
    end
end
function v14._get_chat_history(_, p29)
    return v_u_2.get("AdminAPI/RequestTradeChatHistory"):InvokeServer(p29)
end
function v14._create_trade_frame(p_u_30, p_u_31)
    local v32 = p_u_31.sender_user_id == game.Players.LocalPlayer.UserId
    local v_u_33 = v32 and p_u_31.recipient_name or p_u_31.sender_name
    local v_u_34 = v32 and p_u_31.recipient_user_id or p_u_31.sender_user_id
    local v_u_35 = v32 and p_u_31.sender_items or p_u_31.recipient_items
    local v_u_36 = v32 and p_u_31.recipient_items or p_u_31.sender_items
    local v37 = p_u_30.template_frame:Clone()
    local v38 = DateTime.fromUnixTimestamp(p_u_31.timestamp)
    local v39 = v38:FormatLocalTime("ll", v_u_7.LocaleId)
    local v40 = v38:FormatLocalTime("LT", v_u_7.LocaleId)
    v37.InformationHolder.Frame.DateText.Text = v39
    v37.InformationHolder.Frame.TimeText.Text = v40
    v37.InformationHolder.Frame.UsernameText.Text = v_u_33
    local v41 = {
        ["num_condensed_slots"] = 9,
        ["num_slots"] = 9,
        ["should_tween_mobile_layout"] = false,
        ["mobile_layout_properties"] = v_u_11,
        ["can_add_and_remove_items"] = false,
        ["do_not_display_tags"] = true,
        ["app"] = p_u_30,
        ["optional_xbox_tablet_parent_override"] = p_u_30.instance.Frame
    }
    p_u_30.UIManager.wrap(v37.MyOffer, "OfferPane"):start(v41):set_items(v_u_35)
    p_u_30.UIManager.wrap(v37.PartnerOffer, "OfferPane"):start(v41):set_items(v_u_36)
    local function v_u_42()
        if p_u_31.reverted then
            p_u_30:_show_support_reverted_message(p_u_31)
        elseif not (p_u_30.trade_being_reverted or p_u_30.current_ticket_completed) then
            p_u_30.UIManager.set_app_visibility("TradePreviewApp", false)
            p_u_30:_send_revert_request(p_u_31)
        end
    end
    local v43 = p_u_30.UIManager.wrap(v37.InformationHolder.Frame.View, "DepthButton")
    v43:start({
        ["mouse_button1_click"] = function()
            p_u_30.previewing_trade = true
            p_u_30.UIManager.set_app_visibility(p_u_30.ClassName, false)
            p_u_30.UIManager.apps.TradePreviewApp:preview_revert(v_u_35, v_u_36, v_u_33, v_u_34, p_u_31, v_u_42, function()
                return p_u_30:_get_chat_history(p_u_31.trade_id)
            end)
            p_u_30.UIManager.set_app_visibility(p_u_30.ClassName, true)
            p_u_30.previewing_trade = false
        end
    })
    local v44 = p_u_30.wrapped_buttons
    table.insert(v44, v43)
    local v45 = p_u_30.UIManager.wrap(v37.InformationHolder.Frame.TradeId, "DepthButton")
    v45:start({
        ["mouse_button1_click"] = function()
            p_u_30.UIManager.apps.DialogApp:paragraph_dialog({
                ["existing_text"] = p_u_31.trade_id,
                ["button"] = "Okay"
            })
        end
    })
    local v46 = p_u_30.wrapped_buttons
    table.insert(v46, v45)
    local v47 = p_u_30.UIManager.wrap(v37.InformationHolder.Frame.Report, "DepthButton")
    v47:start({
        ["mouse_button1_click"] = function()
            if p_u_31.reverted then
                p_u_30:_show_support_reverted_message(p_u_31)
            elseif not (p_u_30.trade_being_reverted or p_u_30.current_ticket_completed) then
                p_u_30.UIManager.set_app_visibility("TradePreviewApp", false)
                p_u_30:_send_revert_request(p_u_31)
            end
        end,
        ["state"] = p_u_31.reverted and "inactive" or "selected"
    })
    local v48 = p_u_31.reverted and "Reverted" or "Revert"
    v47.instance.Face.TextLabel.Text = v48
    local v49 = p_u_30.wrapped_buttons
    table.insert(v49, v47)
    return v37
end
function v14._show_support_reverted_message(p50, p51)
    p50.UIManager.apps.DialogApp:dialog({
        ["text"] = string.format("This trade was reverted by Adopt Me Support on %s", v_u_10(p51.reverted.timestamp, "datetime")),
        ["button"] = "Okay"
    })
end
function v14._disconnect_progressive_loading(p52)
    if p52.progressive_load_renderstepped then
        p52.progressive_load_renderstepped:Disconnect()
        p52.progressive_load_renderstepped = nil
    end
end
function v14._do_progressive_loading(p_u_53)
    p_u_53:_disconnect_progressive_loading()
    p_u_53.progressive_load_renderstepped = v_u_6.RenderStepped:Connect(function()
        if #p_u_53.frames == 0 then
            return
        elseif os.clock() - p_u_53.last_refresh_timestamp >= 0.3 then
            local v54 = p_u_53.scrolling_frame.AbsolutePosition.Y
            local v55 = p_u_53.scrolling_frame.AbsolutePosition.Y + p_u_53.scrolling_frame.AbsoluteSize.Y
            local v56 = p_u_53.frames[p_u_53.min_frame_index_to_render]
            local v57 = p_u_53.frames[p_u_53.max_frame_index_to_render]
            if v56 then
                v56 = v56.AbsolutePosition.Y
            end
            if v57 then
                v57 = v57.AbsolutePosition.Y + v57.AbsoluteSize.Y
            end
            local v58 = false
            local v59
            if v56 and v54 <= v56 then
                v59 = p_u_53.frames[p_u_53.min_frame_index_to_render - 1] and true or v58
            else
                v59 = v57 and (v57 <= v55 and p_u_53.frames[p_u_53.max_frame_index_to_render + 1]) and true or v58
            end
            if v59 then
                p_u_53:_refresh(true)
            end
        end
    end)
end
function v14._set_scrolling_frame_canvas_size(p60, p61)
    local v62 = #p61
    local v63 = p60.max_frame_index_to_render + 1
    local v64 = math.min(v62, v63)
    local v65 = p60.max_num_frames_scrollable or 0
    p60.max_num_frames_scrollable = math.max(v64, v65)
    p60.scrolling_frame.CanvasSize = UDim2.new(1, 0, 0, p60.frame_height * p60.max_num_frames_scrollable)
end
function v14._refresh(p66)
    if #p66.frames == 0 then
        p66.load_status.Visible = true
        p66.load_status.Text = "Loading..."
    end
    p66.last_refresh_timestamp = os.clock()
    local v67 = p66.current_trade_history
    if v67 then
        local v68 = v_u_3.attempt_preserve_selection_on_recreation()
        p66:_clear_scrolling_frame(true)
        local v69 = (p66.scrolling_frame.CanvasPosition.Y + p66.scrolling_frame.AbsoluteSize.Y / 2) / p66.frame_height
        local v70 = v69 - p66.num_frames_to_load_per_progressive_load / 2
        p66.min_frame_index_to_render = math.floor(v70)
        local v71 = v69 + p66.num_frames_to_load_per_progressive_load / 2
        p66.max_frame_index_to_render = math.ceil(v71)
        for v72 = 1, #v67 do
            local v73 = v67[#v67 - v72 + 1]
            local v74
            if p66.min_frame_index_to_render <= v72 and v72 <= p66.max_frame_index_to_render then
                v74 = p66:_create_trade_frame(v73)
            else
                v74 = p66.template_loading_frame:Clone()
            end
            v74.LayoutOrder = v72
            v74.Visible = true
            v74.Name = "Record" .. v73.trade_id
            v74.Parent = p66.scrolling_frame.Content
            local v75 = p66.frames
            table.insert(v75, v74)
        end
        if #v67 > 0 then
            p66.load_status.Visible = false
        else
            p66.load_status.Visible = true
            p66.load_status.Text = "No recent trades found."
        end
        p66:_set_scrolling_frame_canvas_size(v67)
        v68()
        if v_u_4.is_using_gamepad() and (#v67 > 0 and v_u_5.SelectedObject == p66.scrolling_frame) then
            p66.watch:select_object(p66.frames[1].InformationHolder.Frame.View)
        end
    end
end
function v14.show(p_u_76)
    p_u_76.instance.Frame.Visible = true
    coroutine.wrap(function()
        if not (p_u_76.trade_being_reverted or p_u_76.previewing_trade) then
            p_u_76:_refresh()
        end
    end)()
    p_u_76:_do_progressive_loading()
end
function v14.hide(p77)
    p77.instance.Frame.Visible = false
    if not (p77.previewing_trade or p77.trade_being_reverted) then
        p77:_clear_scrolling_frame()
    end
    p77:_disconnect_progressive_loading()
end
local function v_u_88(p78, p79)
    assert(p78 and p79)
    local v80 = p78.AbsoluteSize.Y
    local v81 = p79.AbsolutePosition.Y - p78.AbsolutePosition.Y + p78.CanvasPosition.Y
    local v82 = v81 + p79.AbsoluteSize.Y
    local v83 = p78.CanvasPosition.Y
    local v84 = v82 - v80
    local v85 = math.clamp(v83, v84, v81)
    local v86 = v81 - v80
    local v87 = math.clamp(v85, v86, v81)
    p78.CanvasPosition = Vector2.new(0, v87)
end
function v14._add_xbox_scroll_functionality(p_u_89)
    v_u_5:GetPropertyChangedSignal("SelectedObject"):Connect(function()
        if not v_u_4.is_using_gamepad() then
            return
        end
        local v90 = v_u_5.SelectedObject
        if not v90 then
            return
        end
        if not v90:IsDescendantOf(p_u_89.instance) then
            return
        end
        local v91 = nil
        for _, v92 in ipairs(p_u_89.frames) do
            if v90:IsDescendantOf(v92) then
                v91 = v92
                break
            end
        end
        if v91 then
            v_u_88(p_u_89.scrolling_frame, v91)
        end
    end)
end
function v14.start(p_u_93)
    p_u_93.body = p_u_93.instance.Frame.Body
    p_u_93.header = p_u_93.instance.Frame.Header
    p_u_93.scrolling_frame = p_u_93.body.ScrollComplex.ScrollingFrame
    p_u_93.template_frame = p_u_93.scrolling_frame.Content.TemplateFrame
    p_u_93.template_loading_frame = p_u_93.scrolling_frame.Content.TemplateLoadingFrame
    p_u_93.load_status = p_u_93.scrolling_frame.LoadStatus
    p_u_93.template_frame.Parent = nil
    p_u_93.template_loading_frame.Parent = nil
    p_u_93.load_status.Visible = true
    p_u_93.load_status.Text = "Loading..."
    p_u_93.scrolling_frame.CanvasSize = UDim2.new()
    p_u_93.frames = {}
    p_u_93.wrapped_buttons = {}
    p_u_93.frame_height = p_u_93.template_frame.AbsoluteSize.Y + 8
    p_u_93.UIManager.wrap(p_u_93.header.ExitButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_93:_send_revert_request(nil)
        end
    })
    if p_u_93.instance.AbsoluteSize.Y > 680 then
        p_u_93.instance.Frame.Size = UDim2.new(0, 487, 0, 380)
        p_u_93.num_frames_to_load_per_progressive_load = 20
    else
        p_u_93.num_frames_to_load_per_progressive_load = 10
    end
    p_u_93.watch = v_u_3.quick_watch({
        ["selection_parent"] = p_u_93.instance.Frame,
        ["default_selection"] = p_u_93.scrolling_frame,
        ["app_name"] = p_u_93.ClassName
    })
    p_u_93:_add_xbox_scroll_functionality()
    p_u_93.current_ticket = -1
    p_u_93.current_trade_history = nil
    p_u_93.current_ticket_completed = false
    v_u_2.get("TradeAPI/RequestCmdrRevertTradeId").OnClientEvent:Connect(function(p94, p95)
        p_u_93.current_ticket = p94
        p_u_93.current_trade_history = p95
        p_u_93.current_ticket_completed = false
        p_u_93.UIManager.set_app_visibility(p_u_93.ClassName, true)
    end)
    task.spawn(function()
        v_u_8 = require(game.ReplicatedStorage:WaitForChild("CmdrClient"))
    end)
end
return v14