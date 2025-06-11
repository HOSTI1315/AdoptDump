--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.TradeHistoryApp (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("RouterClient")
local v_u_3 = v1("XboxSupport")
local v_u_4 = v1("PlatformM")
local v_u_5 = v1("Signal")
local v_u_6 = v1("package:Sift")
local v_u_7 = v1("package:Promise")
local v_u_8 = game:GetService("GuiService")
local v9 = game:GetService("LocalizationService")
local v_u_10 = game:GetService("RunService")
local v_u_11 = v9:GetTranslatorForPlayer(game.Players.LocalPlayer)
local v12 = v1("Class")
local v_u_13 = v1("Utilities/formatDate")
local v_u_14 = {}
local v15 = {
    ["compact"] = {
        ["CellPadding"] = UDim2.new(0, 2, 0, 2),
        ["CellSize"] = UDim2.new(0, 23, 0, 23)
    },
    ["loose"] = {
        ["CellPadding"] = UDim2.new(0, 2, 0, 2),
        ["CellSize"] = UDim2.new(0, 23, 0, 23)
    }
}
v_u_14.SlotsGridLayout = v15
local v16 = {
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
v_u_14.SlotsPadding = v16
v_u_14.TagScale = {
    ["compact"] = 0.1,
    ["loose"] = 0.1
}
local v17 = v12("TradeHistoryApp", v1("UIBaseApp"))
function v17._clear_scrolling_frame(p18, p19)
    for _, v20 in ipairs(p18.frames or {}) do
        v20:Destroy()
    end
    p18.frames = {}
    p18.wrapped_buttons = {}
    if not p19 then
        p18.max_num_frames_scrollable = nil
        p18.cached_trade_history = nil
        p18.scrolling_frame.CanvasPosition = Vector2.new()
        p18.scrolling_frame.CanvasSize = UDim2.new()
    end
end
function v17.report_scam(p21, p22)
    assert(p22)
    if p21.scam_being_reported then
        return
    else
        p21.scam_being_reported = true
        local v23 = p22.sender_user_id == game.Players.LocalPlayer.UserId and p22.recipient_name or p22.sender_name
        assert(v23)
        p21.UIManager.set_app_visibility(p21.ClassName, false)
        local v24, v25, v26 = p21.UIManager.apps.DialogApp:dialog({
            ["dialog_type"] = "ReportScamDialog",
            ["suspect_name"] = v23,
            ["placeholder_text"] = "What happened? (Optional)",
            ["max_length"] = 500,
            ["use_utf8_length"] = true,
            ["left"] = "Cancel",
            ["right"] = "Report"
        })
        p21.UIManager.set_app_visibility(p21.ClassName, true)
        if v24 == "Cancel" then
            p21.scam_being_reported = false
        else
            for _, v27 in ipairs(p21.wrapped_buttons) do
                v27:set_state("unpressable")
            end
            p21.UIManager.apps.HintApp:hint({
                ["text"] = "Submitting scam report...",
                ["length"] = 4,
                ["yields"] = false
            })
            local v28 = os.clock()
            local v29 = v_u_2.get("TradeAPI/ReportScam"):InvokeServer(p22.trade_id, v25, v26)
            local v30 = os.clock() - v28
            if v30 < 4 then
                wait(4 - v30)
            end
            if v29 then
                p21.UIManager.apps.DialogApp:dialog({
                    ["text"] = "Thanks for your report!",
                    ["button"] = "Close",
                    ["yields"] = false
                })
            else
                p21.UIManager.apps.DialogApp:dialog({
                    ["text"] = "Report submission failed. Please reach out to Adopt Me Support for help",
                    ["button"] = "Okay",
                    ["yields"] = false
                })
            end
            if p21.instance.Frame.Visible then
                p21:_refresh()
            else
                p21:_clear_scrolling_frame()
            end
            p21.scam_being_reported = false
        end
    end
end
function v17._create_trade_frame(p_u_31, p_u_32)
    local v_u_33 = p_u_31:is_picking()
    local v34 = p_u_32.sender_user_id == game.Players.LocalPlayer.UserId
    local v_u_35 = v34 and p_u_32.recipient_name or p_u_32.sender_name
    local v_u_36 = v34 and p_u_32.sender_items or p_u_32.recipient_items
    local v_u_37 = v34 and p_u_32.recipient_items or p_u_32.sender_items
    local v_u_38 = v34 and p_u_32.recipient_user_id or p_u_32.sender_user_id
    local v39 = p_u_31.template_frame:Clone()
    local v40 = DateTime.fromUnixTimestamp(p_u_32.timestamp)
    local v41 = v40:FormatLocalTime("ll", v_u_11.LocaleId)
    local v42 = v40:FormatLocalTime("LT", v_u_11.LocaleId)
    v39.InformationHolder.Frame.DateText.Text = v41
    v39.InformationHolder.Frame.TimeText.Text = v42
    v39.InformationHolder.Frame.UsernameText.Text = v_u_35
    local v43 = {
        ["num_condensed_slots"] = 9,
        ["num_slots"] = 9,
        ["should_tween_mobile_layout"] = false,
        ["mobile_layout_properties"] = v_u_14,
        ["can_add_and_remove_items"] = false,
        ["do_not_display_tags"] = true,
        ["app"] = p_u_31,
        ["optional_xbox_tablet_parent_override"] = p_u_31.instance.Frame,
        ["scrollbar_thickness"] = 3
    }
    p_u_31.UIManager.wrap(v39.MyOffer, "OfferPane"):start(v43):set_items(v_u_36)
    p_u_31.UIManager.wrap(v39.PartnerOffer, "OfferPane"):start(v43):set_items(v_u_37)
    local v44 = p_u_31.UIManager.wrap(v39.InformationHolder.Frame.View, "DepthButton")
    v44:start({
        ["mouse_button1_click"] = function()
            p_u_31.previewing_trade = true
            p_u_31.UIManager.set_app_visibility(p_u_31.ClassName, false)
            p_u_31.UIManager.apps.TradePreviewApp:preview_trade(v_u_36, v_u_37, nil, v_u_35, v_u_38, p_u_32, v_u_33 and {
                ["text"] = "Add",
                ["state"] = "normal",
                ["callback"] = function()
                    p_u_31.previewing_trade = false
                    p_u_31.UIManager.set_app_visibility("TradePreviewApp", false)
                    local v45 = {
                        ["trade_record"] = p_u_32
                    }
                    p_u_31.trade_picked:Fire(v45)
                end
            } or nil)
            if p_u_31.previewing_trade then
                p_u_31.UIManager.set_app_visibility(p_u_31.ClassName, true)
                p_u_31.previewing_trade = false
            end
        end
    })
    local v46 = p_u_31.wrapped_buttons
    table.insert(v46, v44)
    local v47 = p_u_31.UIManager.wrap(v39.InformationHolder.Frame.Report, "DepthButton")
    v47:start({
        ["mouse_button1_click"] = function()
            if p_u_32.reverted then
                p_u_31:show_support_reverted_message(p_u_32)
                return
            elseif v_u_33 then
                local v48 = {
                    ["trade_record"] = p_u_32
                }
                p_u_31.trade_picked:Fire(v48)
            else
                p_u_31:report_scam(p_u_32)
            end
        end,
        ["state"] = v_u_33 and "normal" or (p_u_32.reported and "unpressable" or "selected")
    })
    local v49 = p_u_32.reverted and "Reverted" or (v_u_33 and "Add" or (p_u_32.reported and "Reported" or "Report"))
    v47.instance.Face.TextLabel.Text = v49
    local v50 = p_u_31.wrapped_buttons
    table.insert(v50, v47)
    return v39
end
function v17.show_support_reverted_message(p51, p52)
    p51.UIManager.apps.DialogApp:dialog({
        ["text"] = string.format("This trade was reverted by Adopt Me Support on %s", v_u_13(p52.reverted.timestamp, "datetime")),
        ["button"] = "Okay"
    })
end
function v17._disconnect_progressive_loading(p53)
    if p53.progressive_load_renderstepped then
        p53.progressive_load_renderstepped:Disconnect()
        p53.progressive_load_renderstepped = nil
    end
end
function v17._do_progressive_loading(p_u_54)
    p_u_54:_disconnect_progressive_loading()
    p_u_54.progressive_load_renderstepped = v_u_10.RenderStepped:Connect(function()
        if #p_u_54.frames == 0 then
            return
        elseif os.clock() - p_u_54.last_refresh_timestamp >= 0.3 then
            local v55 = p_u_54.scrolling_frame.AbsolutePosition.Y
            local v56 = p_u_54.scrolling_frame.AbsolutePosition.Y + p_u_54.scrolling_frame.AbsoluteSize.Y
            local v57 = p_u_54.frames[p_u_54.min_frame_index_to_render]
            local v58 = p_u_54.frames[p_u_54.max_frame_index_to_render]
            if v57 then
                v57 = v57.AbsolutePosition.Y
            end
            if v58 then
                v58 = v58.AbsolutePosition.Y + v58.AbsoluteSize.Y
            end
            local v59 = false
            local v60
            if v57 and v55 <= v57 then
                v60 = p_u_54.frames[p_u_54.min_frame_index_to_render - 1] and true or v59
            else
                v60 = v58 and (v58 <= v56 and p_u_54.frames[p_u_54.max_frame_index_to_render + 1]) and true or v59
            end
            if v60 then
                p_u_54:_refresh(true)
            end
        end
    end)
end
function v17._get_trade_history(p61, p62)
    if p62 and p61.cached_trade_history then
        return p61.cached_trade_history
    end
    local v63 = v_u_2.get("TradeAPI/GetTradeHistory"):InvokeServer()
    if not p61.instance.Frame.Visible then
        return nil
    end
    p61.cached_trade_history = v63
    return v63
end
function v17._set_scrolling_frame_canvas_size(p64, p65)
    local v66 = #p65
    local v67 = p64.max_frame_index_to_render + 1
    local v68 = math.min(v66, v67)
    local v69 = p64.max_num_frames_scrollable or 0
    p64.max_num_frames_scrollable = math.max(v68, v69)
    p64.scrolling_frame.CanvasSize = UDim2.new(1, 0, 0, p64.frame_height * p64.max_num_frames_scrollable)
end
function v17._refresh(p70, p71)
    if #p70.frames == 0 then
        p70.load_status.Visible = true
        p70.load_status.Text = "Loading..."
    end
    p70.last_refresh_timestamp = os.clock()
    local v72 = p70:_get_trade_history(p71)
    if v72 then
        if p70.picking_filter then
            v72 = v_u_6.List.filter(v72, p70.picking_filter)
        end
        local v73 = v_u_3.attempt_preserve_selection_on_recreation()
        p70:_clear_scrolling_frame(true)
        local v74 = (p70.scrolling_frame.CanvasPosition.Y + p70.scrolling_frame.AbsoluteSize.Y / 2) / p70.frame_height
        local v75 = v74 - p70.num_frames_to_load_per_progressive_load / 2
        p70.min_frame_index_to_render = math.floor(v75)
        local v76 = v74 + p70.num_frames_to_load_per_progressive_load / 2
        p70.max_frame_index_to_render = math.ceil(v76)
        for v77 = 1, #v72 do
            local v78 = v72[#v72 - v77 + 1]
            if v78 then
                local v79
                if p70.min_frame_index_to_render <= v77 and v77 <= p70.max_frame_index_to_render then
                    v79 = p70:_create_trade_frame(v78)
                else
                    v79 = p70.template_loading_frame:Clone()
                end
                v79.LayoutOrder = v77
                v79.Visible = true
                v79.Name = "Record" .. v78.trade_id
                v79.Parent = p70.scrolling_frame.Content
                if v_u_4.is_using_gamepad() and not p70.has_focused_gamepad then
                    p70.has_focused_gamepad = true
                    p70.watch:select_object(v79.InformationHolder.Frame.View)
                end
                local v80 = p70.frames
                table.insert(v80, v79)
            end
        end
        if #v72 > 0 then
            p70.load_status.Visible = false
        else
            p70.load_status.Visible = true
            p70.load_status.Text = "No recent trades found."
        end
        p70:_set_scrolling_frame_canvas_size(v72)
        v73()
        if v_u_4.is_using_gamepad() and (#v72 > 0 and v_u_8.SelectedObject == p70.scrolling_frame) then
            p70.watch:select_object(p70.frames[1].InformationHolder.Frame.View)
        end
    end
end
function v17.is_picking(p81)
    return p81.picking_promise:getStatus() == v_u_7.Status.Started
end
function v17.pick_trade(p_u_82, p83)
    if p_u_82:is_picking() then
        p_u_82.picking_promise:cancel()
    end
    p_u_82.picking_filter = p83
    p_u_82.picking_promise = v_u_7.fromEvent(p_u_82.trade_picked)
    p_u_82.picking_promise:finally(function()
        p_u_82.picking_filter = nil
        p_u_82.UIManager.set_app_visibility(p_u_82.ClassName, false)
    end)
    if p_u_82.UIManager.is_visible(p_u_82.ClassName) then
        p_u_82:_refresh()
    else
        p_u_82.UIManager.set_app_visibility(p_u_82.ClassName, true)
    end
    local v84, v85 = p_u_82.picking_promise:await()
    return v84 and v85 and v85 or nil
end
function v17.show(p_u_86)
    p_u_86.has_focused_gamepad = false
    p_u_86.instance.Frame.Visible = true
    coroutine.wrap(function()
        if not (p_u_86.scam_being_reported or p_u_86.previewing_trade) then
            p_u_86:_refresh()
        end
    end)()
    p_u_86:_do_progressive_loading()
end
function v17.hide(p87)
    if not p87.previewing_trade then
        p87.picking_promise:cancel()
    end
    p87.instance.Frame.Visible = false
    if not (p87.previewing_trade or p87.scam_being_reported) then
        p87:_clear_scrolling_frame()
    end
    p87:_disconnect_progressive_loading()
end
local function v_u_98(p88, p89)
    assert(p88 and p89)
    local v90 = p88.AbsoluteSize.Y
    local v91 = p89.AbsolutePosition.Y - p88.AbsolutePosition.Y + p88.CanvasPosition.Y
    local v92 = v91 + p89.AbsoluteSize.Y
    local v93 = p88.CanvasPosition.Y
    local v94 = v92 - v90
    local v95 = math.clamp(v93, v94, v91)
    local v96 = v91 - v90
    local v97 = math.clamp(v95, v96, v91)
    p88.CanvasPosition = Vector2.new(0, v97)
end
function v17._add_xbox_scroll_functionality(p_u_99)
    v_u_8:GetPropertyChangedSignal("SelectedObject"):Connect(function()
        if not v_u_4.is_using_gamepad() then
            return
        end
        local v100 = v_u_8.SelectedObject
        if not v100 then
            return
        end
        if not v100:IsDescendantOf(p_u_99.instance) then
            return
        end
        local v101 = nil
        for _, v102 in ipairs(p_u_99.frames) do
            if v100:IsDescendantOf(v102) then
                v101 = v102
                break
            end
        end
        if v101 then
            v_u_98(p_u_99.scrolling_frame, v101)
        end
    end)
end
function v17.start(p_u_103)
    p_u_103.picking_promise = v_u_7.resolve()
    p_u_103.trade_picked = v_u_5.new()
    p_u_103.body = p_u_103.instance.Frame.Body
    p_u_103.header = p_u_103.instance.Frame.Header
    p_u_103.scrolling_frame = p_u_103.body.ScrollComplex.ScrollingFrame
    p_u_103.template_frame = p_u_103.scrolling_frame.Content.TemplateFrame
    p_u_103.template_loading_frame = p_u_103.scrolling_frame.Content.TemplateLoadingFrame
    p_u_103.load_status = p_u_103.scrolling_frame.LoadStatus
    p_u_103.template_frame.Parent = nil
    p_u_103.template_loading_frame.Parent = nil
    p_u_103.load_status.Visible = true
    p_u_103.load_status.Text = "Loading..."
    p_u_103.scrolling_frame.CanvasSize = UDim2.new()
    p_u_103.frames = {}
    p_u_103.wrapped_buttons = {}
    p_u_103.frame_height = p_u_103.template_frame.AbsoluteSize.Y + 8
    p_u_103.UIManager.wrap(p_u_103.header.ExitButton, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_103.UIManager.set_app_visibility(p_u_103.ClassName, false)
        end
    })
    if p_u_103.instance.AbsoluteSize.Y > 680 then
        p_u_103.instance.Frame.Size = UDim2.new(0, 487, 0, 380)
        p_u_103.num_frames_to_load_per_progressive_load = 20
    else
        p_u_103.num_frames_to_load_per_progressive_load = 10
    end
    p_u_103.watch = v_u_3.quick_watch({
        ["selection_parent"] = p_u_103.instance.Frame,
        ["default_selection"] = function()
            if #p_u_103.frames == 0 then
                return p_u_103.header.ExitButton
            else
                return p_u_103.frames[1].InformationHolder.Frame.View
            end
        end,
        ["app_name"] = p_u_103.ClassName,
        ["exit_buttons"] = { p_u_103.header.ExitButton }
    })
    p_u_103:_add_xbox_scroll_functionality()
end
return v17