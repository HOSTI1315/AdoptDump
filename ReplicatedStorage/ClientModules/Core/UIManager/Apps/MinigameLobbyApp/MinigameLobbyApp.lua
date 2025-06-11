--// ReplicatedStorage.ClientModules.Core.UIManager.Apps.MinigameLobbyApp (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("MinigameLobbyClient")
local v_u_3 = v_u_1("ClientData")
local v_u_4 = v_u_1("FriendsClient")
local v_u_5 = v_u_1("Maid")
local v_u_6 = v_u_1("SingleActionBuffer")
local v_u_7 = v_u_1("XboxSupport")
local v8 = v_u_1("Class")
local v_u_9 = v_u_1("package:Promise")
local v_u_10 = v_u_1("package:Sift")
local v_u_11 = v_u_1("RouterClient")
local v_u_12 = v_u_1("AltCurrencyDB")
local v_u_13 = v_u_1("AltCurrencyData")
local v_u_14 = v_u_1("PlatformM")
local v_u_15 = game:GetService("Players")
local v_u_16 = game:GetService("SocialService")
local v_u_17 = game.Players.LocalPlayer
local v_u_18 = Random.new()
local v19 = v8("MinigameLobbyApp", v_u_1("UIBaseApp"))
function v19._on_invite_accepted(p20, p21)
    if p20.invite_update_promises[p21] then
        p20.invite_update_promises[p21]:cancel()
    end
    p20.lobby_invite_count = p20.lobby_invite_count - 1
    p20.pending_invites[p21] = nil
    p20:_refresh_invite()
    p20.UIManager.apps.HintApp:hint({
        ["yields"] = false,
        ["text"] = p21.Name .. " joined your lobby!",
        ["length"] = 4,
        ["overridable"] = true
    })
end
function v19._on_invite_declined(p_u_22, p_u_23, p24, p25)
    if p25 then
        if p_u_22.invite_update_promises[p_u_23] then
            p_u_22.invite_update_promises[p_u_23]:cancel()
        end
        p_u_22.invite_update_promises[p_u_23] = v_u_9.delay(p25):andThen(function()
            p_u_22.pending_invites[p_u_23] = nil
            p_u_22:_refresh_invite()
        end)
    else
        p_u_22.pending_invites[p_u_23] = nil
    end
    p_u_22.lobby_invite_count = p_u_22.lobby_invite_count - 1
    p_u_22:_refresh_invite()
    local v26
    if p24 == "declined" then
        v26 = ("%s declined your invite"):format(p_u_23.Name)
    elseif p24 == "rate_limit" then
        v26 = ("Try again in %d second(s)"):format(p25)
    else
        v26 = ("%s can\'t accept your invite right now."):format(p_u_23.Name)
    end
    if v26 then
        p_u_22.UIManager.apps.HintApp:hint({
            ["yields"] = false,
            ["text"] = v26,
            ["length"] = 4,
            ["overridable"] = true
        })
    end
end
function v19._render_lobby_entry(p_u_27, p_u_28, p29)
    p29.AvatarPic.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=48&h=48"):format(p_u_28.UserId)
    p29.Parent = p_u_27.lobby_content
    if p_u_27.host_player == v_u_17 and p_u_28 ~= v_u_17 then
        p29.Button.Face.TextLabel.Text = "Remove"
        local v30 = {
            ["mouse_button1_click"] = function()
                if tick() < p_u_27.button_debounce then
                    return
                elseif p_u_27.UIManager.apps.DialogApp:dialog({
                    ["text"] = ("Are you sure you want to remove %s?"):format(p_u_28.Name),
                    ["left"] = "No",
                    ["right"] = "Yes"
                }) == "Yes" then
                    v_u_2.kick_player(p_u_28)
                end
            end
        }
        p_u_27.UIManager.wrap(p29.Button, "DepthButton"):start(v30)
    else
        p29.Button.Visible = false
    end
end
function v19._update_no_invites_message(p31)
    local v32 = p31.invite_scroll:FindFirstChild("Entry")
    p31.invite_scroll.NoPlayersDisplay.Visible = not v32
end
function v19._render_invite_entry(p_u_33, p_u_34, p_u_35)
    local function v_u_41()
        if p_u_33.invite_update_promises[p_u_34] then
            p_u_33.invite_update_promises[p_u_34]:cancel()
        end
        local v36 = p_u_33
        v36.lobby_invite_count = v36.lobby_invite_count + 1
        p_u_33.pending_invites[p_u_34] = true
        p_u_33:_refresh_invite()
        p_u_33.UIManager.apps.HintApp:hint({
            ["yields"] = false,
            ["text"] = "Sent invitation!",
            ["length"] = 1,
            ["overridable"] = true
        })
        v_u_9.try(function()
            return v_u_2.invite_player(p_u_34)
        end):andThen(function(p37, p38, p39)
            if p37 then
                p_u_33:_on_invite_accepted(p_u_34)
            else
                p_u_33:_on_invite_declined(p_u_34, p38, p39)
            end
        end):catch(function()
            local v40 = p_u_33
            v40.lobby_invite_count = v40.lobby_invite_count - 1
            p_u_33.pending_invites[p_u_34] = nil
            p_u_33:_refresh_invite()
        end)
    end
    local v_u_42 = p_u_33.UIManager.wrap(p_u_35.Button, "DepthButton")
    v_u_42:start({
        ["mouse_button1_click"] = v_u_41
    })
    v_u_42:set_state("disabled")
    p_u_33.UIManager.wrap(p_u_35, "CustomButton"):start({
        ["mouse_button1_click"] = function()
            if v_u_42:get_state() == "normal" then
                v_u_41()
            end
        end
    })
    local v_u_43 = nil
    local v_u_50 = v_u_4.promise_get_is_friends_with(p_u_34.UserId):andThen(function(p44)
        local v45 = v_u_2.is_player_queued(p_u_34, p_u_33.minigame_id)
        if p44 then
            p_u_35.Player.TextColor3 = Color3.fromRGB(74, 198, 85)
            p_u_35.LayoutOrder = p_u_35.LayoutOrder - 100
            return true, p44
        else
            if not p_u_33.layout_cache[p_u_34] then
                p_u_33.layout_cache[p_u_34] = v_u_18:NextInteger(1, 10000)
            end
            p_u_35.LayoutOrder = p_u_33.layout_cache[p_u_34]
            return v45, p44
        end
    end):andThen(function(p46, p47)
        if v_u_3.get_server(p_u_34, "minigame_lobby") then
            p_u_35.Player.Text = p_u_35.Player.Text .. " (In Lobby)"
            local v48 = p_u_35
            v48.LayoutOrder = v48.LayoutOrder + v_u_15.MaxPlayers
            v_u_42:set_state("disabled")
            p_u_35.Parent = p_u_33.invite_scroll
        elseif p46 then
            p_u_35.Parent = p_u_33.invite_scroll
            if not p_u_33.pending_invites[p_u_34] then
                v_u_42:set_state("normal")
                if not p47 then
                    v_u_43 = v_u_9.fromEvent(v_u_2.get_queue_player_removed_signal(p_u_33.minigame_id), function(p49)
                        return p49 == p_u_34
                    end):andThen(function()
                        v_u_42:set_state("disabled")
                    end)
                    return
                end
            end
        else
            p_u_35:Destroy()
            p_u_33:_update_no_invites_message()
        end
    end)
    p_u_33.refresh_maid:GiveTask(function()
        v_u_50:cancel()
        if v_u_43 then
            v_u_43:cancel()
        end
    end)
end
function v19._render_entry(p51, p52, p53)
    local v54 = p51.tab == "invite" and p51.nearby_player_template:Clone() or p51.player_template:Clone()
    v54.Name = "Entry"
    v54.Player.Text = p53.Name
    v54.LayoutOrder = p52
    p51.refresh_maid:GiveTask(v54)
    if p51.tab == "lobby" then
        p51:_render_lobby_entry(p53, v54)
    else
        p51:_render_invite_entry(p53, v54)
    end
end
function v19._render_empty_slot(p_u_55, p56, p57)
    local v58 = p_u_55.lobby_content
    local v59 = p_u_55.available_slot_template:clone()
    v59.Name = "EmptySlot"
    v59.LayoutOrder = p56
    v59.Label.Text = p57 and "Invite Sent" or ("Slot Available (%i/%i)"):format(p56, p_u_55.max_players)
    v59.Parent = v58
    p_u_55.refresh_maid:GiveTask(v59)
    if p_u_55.host_player == v_u_17 then
        p_u_55.UIManager.wrap(v59.Button, "IconButton"):start({
            ["hover_offset"] = UDim2.new(0, 2, 0, -2),
            ["mouse_button1_click"] = function()
                p_u_55:set_tab("invite")
            end
        })
    else
        v59.Button.Visible = false
    end
end
function v19._render_entries(p60, p61)
    local v62 = p61()
    table.sort(v62, function(p63, p64)
        return p63.Name:lower() < p64.Name:lower()
    end)
    local v65 = 0
    for v66, v67 in v62 do
        p60:_render_entry(v66, v67)
        v65 = v65 + 1
    end
    for v68 = v65 + 1, p60.max_players do
        p60:_render_empty_slot(v68, p60.lobby_invite_count >= v68 - v65)
    end
end
function v19._set_scrolling_frame_canvas_size(p69)
    p69.invite_scroll.CanvasSize = UDim2.new(1, 0, 0, p69.invite_scroll.UIListLayout.AbsoluteContentSize.Y)
    local v70 = p69.invite_scroll.AbsoluteCanvasSize.Y < p69.invite_scroll.AbsoluteWindowSize.Y and (p69.invite_scroll.ScrollBarThickness * 1.5 or 0) or 0
    p69.invite_scroll.UIPadding.PaddingRight = UDim.new(v70, 0)
end
function v19._refresh_lobby(p_u_71)
    if p_u_71.tab == "lobby" then
        if p_u_71.minigame_id then
            if not p_u_71.is_refreshing_party then
                p_u_71.is_refreshing_party = true
                p_u_71.layout_cache = {}
                p_u_71.refresh_maid:DoCleaning()
                p_u_71.invite_refresh_buffer:clear()
                p_u_71.button_debounce = tick() + 0.5
                p_u_71:_render_entries(function()
                    return p_u_71.party
                end)
                local v72 = v_u_1("MinigameClientManager").get(p_u_71.minigame_id)
                if p_u_71.host_player == v_u_17 then
                    p_u_71.waiting_for_start.Visible = false
                    p_u_71.start_button_container.Visible = true
                    p_u_71.start_button.instance.Face.TextLabel.Text = ("Play %s"):format(v72.minigame_name)
                    local v_u_73 = p_u_71.start_button.instance.Face.CostFrame
                    local function v_u_75()
                        local v74 = v_u_2.get_lobby_cost(p_u_71.minigame_id)
                        if v74.amount == 0 then
                            v_u_73.CostLabel.Text = "FREE"
                            v_u_73.CurrencyIcon.Visible = false
                            return
                        elseif v74.type == "currency" then
                            v_u_73.CostLabel.Text = v74.amount
                            v_u_73.CurrencyIcon.Visible = true
                            if v74.kind == "bucks" then
                                v_u_73.CurrencyIcon.Image = "rbxassetid://6991531565"
                            else
                                v_u_73.CurrencyIcon.Image = v_u_12[v_u_13.currency_type].sprout_images.B
                            end
                        else
                            v_u_73.CostLabel.Text = v74.string
                            v_u_73.CurrencyIcon.Visible = false
                            return
                        end
                    end
                    v_u_75()
                    p_u_71.lobby_cost_string_promise:cancel()
                    p_u_71.lobby_cost_string_promise = v_u_9.new(function(_, _, p76)
                        while not p76() do
                            v_u_75()
                            task.wait(1)
                        end
                    end)
                else
                    p_u_71.start_button_container.Visible = false
                    p_u_71.waiting_for_start.TextLabel.Text = ("Waiting for %* to start"):format(p_u_71.host_player.Name)
                    p_u_71.waiting_for_start.Visible = true
                end
                p_u_71.is_refreshing_party = false
            end
        else
            return
        end
    else
        return
    end
end
function v19._refresh_invite(p_u_77)
    if p_u_77.tab == "invite" then
        if p_u_77.minigame_id then
            if not p_u_77.is_refreshing_invite then
                p_u_77.is_refreshing_invite = true
                p_u_77.refresh_maid:DoCleaning()
                p_u_77:_refresh_party_preview()
                p_u_77:_render_entries(function()
                    return v_u_10.List.filter(game.Players:GetPlayers(), function(p78)
                        if v_u_10.List.find(p_u_77.party, p78) then
                            return false
                        end
                        for _, v79 in v_u_1("MinigameClientManager").get_all() do
                            if v79:is_player_participating(p78) then
                                return false
                            end
                        end
                        return true
                    end)
                end)
                p_u_77:_update_no_invites_message()
                p_u_77.invite_friends_button:set_state("disabled")
                local v_u_82 = v_u_9.try(function()
                    if p_u_77.can_invite_cache then
                        return p_u_77.can_invite_cache
                    end
                    local v80 = v_u_16:CanSendGameInviteAsync(v_u_17)
                    p_u_77.can_invite_cache = v80
                    return v80
                end):andThen(function(p81)
                    if p81 then
                        p_u_77.invite_friends_button:set_state("normal")
                    end
                end)
                p_u_77.refresh_maid:GiveTask(function()
                    v_u_82:cancel()
                end)
                p_u_77.refresh_maid:GiveTask(v_u_2.get_queue_player_added_signal(p_u_77.minigame_id):Connect(function()
                    p_u_77:_queued_refresh_invites()
                end))
                p_u_77.refresh_maid:GiveTask(v_u_2.get_queue_player_removed_signal(p_u_77.minigame_id):Connect(function()
                    p_u_77:_queued_refresh_invites()
                end))
                p_u_77.is_refreshing_invite = false
            end
        else
            return
        end
    else
        p_u_77:_refresh_current_tab()
        return
    end
end
function v19._refresh_party_preview(p83)
    p83.party_preview_icons = p83.party_preview_icons or {}
    for _, v84 in p83.party_preview_icons do
        v84:Destroy()
    end
    p83.party_preview_icons = {}
    for v85 = 1, p83.max_players do
        local v86 = p83.party[v85]
        local v87 = p83.party_preview_icon_template:Clone()
        if v86 then
            v87.Image = ("rbxthumb://type=AvatarHeadShot&id=%*&w=48&h=48"):format(v86.UserId)
        else
            v87.Image = ""
            v87.BackgroundColor3 = Color3.fromRGB(96, 96, 96)
        end
        v87.Parent = p83.party_preview
        local v88 = p83.party_preview_icons
        table.insert(v88, v87)
    end
    p83.party_preview.TextLabel.Text = ("%*/%*"):format(#p83.party, p83.max_players)
end
function v19._queued_refresh_invites(p_u_89)
    p_u_89.invite_refresh_buffer:run(function()
        v_u_9.allSettled({ v_u_9.delay(5), v_u_9.try(function()
                p_u_89:_refresh_invite()
            end) }):await()
    end)
end
function v19._refresh_current_tab(p90)
    local v91 = p90.tab
    if v91 then
        v91 = p90.tab_initializations[p90.tab]
    end
    local v92 = "Could not refresh tab of kind: " .. p90.tab
    assert(v91, v92)
    if not v_u_14.is_using_gamepad() then
        local v93 = p90.tab == "lobby"
        p90.exit_back_button.instance.Face.Icon.Image = v93 and "rbxassetid://2577460528" or "rbxassetid://16089815426"
        p90.exit_back_button.instance.Face.Icon.Size = v93 and UDim2.fromOffset(17, 17) or UDim2.fromOffset(30, 16)
        p90.exit_back_button:set_state(v93 and "cancel" or "selected")
    end
    p90.tab_initializations[p90.tab]()
end
function v19._try_exit(p94)
    if p94.tab ~= "lobby" then
        p94:set_tab("lobby")
        return false
    end
    if p94.UIManager.apps.DialogApp:dialog({
        ["text"] = "Are you sure you want to leave this lobby?",
        ["left"] = "No",
        ["right"] = "Yes"
    }) ~= "Yes" then
        return false
    end
    v_u_2.leave_lobby()
    return true
end
function v19.set_tab(p95, p96)
    local v97 = p95.tab_initializations[p96]
    local v98 = "Invalid tab kind: " .. p96
    assert(v97, v98)
    p95.tab = p96
    p95:_refresh_current_tab()
end
function v19.refresh(p99, p100)
    local v101 = p99.UIManager.is_closed({ "MinigameInGameApp" })
    if not p100[p99.ClassName] then
        v101 = false
    end
    p99:set_visibility(v101)
end
function v19.show(p_u_102)
    p_u_102:set_tab("lobby")
    p_u_102.instance.Frame.Visible = true
    v_u_1("CoreUIInsetHelper").run_once_if_intersecting(p_u_102.exit_button, function(p103)
        p_u_102.exit_button.Position = p_u_102.exit_button.Position + UDim2.fromOffset(-p103 - 4, 0)
    end)
end
function v19.hide(p104)
    p104.layout_cache = {}
    p104.instance.Frame.Visible = false
end
function v19.start(p_u_105)
    p_u_105.tab = "lobby"
    p_u_105.party = {}
    p_u_105.pending_invites = {}
    p_u_105.lobby_invite_count = 0
    p_u_105.invite_update_promises = {}
    p_u_105.layout_cache = {}
    p_u_105.can_invite_cache = nil
    p_u_105.button_debounce = 0
    p_u_105.refresh_maid = v_u_5.new()
    p_u_105.invite_refresh_buffer = v_u_6.new()
    p_u_105.lobby_cost_string_promise = v_u_9.resolve()
    p_u_105.host_player = nil
    p_u_105.max_players = nil
    p_u_105.minigame_id = nil
    p_u_105.body = p_u_105.instance.Frame.Body
    p_u_105.header = p_u_105.instance.Frame.Header
    p_u_105.party_preview = p_u_105.header.PartyPreview
    p_u_105.party_preview_icon_template = p_u_105.party_preview.AvatarPic
    p_u_105.party_preview_icon_template.Parent = nil
    p_u_105.lobby_content = p_u_105.body.LobbyContent
    p_u_105.start_button_container = p_u_105.lobby_content.StartGame
    p_u_105.exit_button = p_u_105.header.ExitButton
    p_u_105.player_template = p_u_105.lobby_content.PlayerTemplate
    p_u_105.player_template.Parent = nil
    p_u_105.available_slot_template = p_u_105.lobby_content.AvailableSlot
    p_u_105.available_slot_template.Parent = nil
    p_u_105.waiting_for_start = p_u_105.lobby_content.WaitingForStart
    p_u_105.waiting_for_start.Visible = false
    p_u_105.start_button = p_u_105.UIManager.wrap(p_u_105.start_button_container.Button, "DepthButton")
    local v109 = {
        ["mouse_button1_click"] = function()
            if tick() >= p_u_105.button_debounce then
                local v106 = {}
                if p_u_105.start_dropdown then
                    local v107, v108 = p_u_105.start_dropdown:get_selected_choice()
                    v106.dropdown = {
                        ["index"] = v107,
                        ["choice"] = v108
                    }
                end
                if p_u_105.toggle_checkbox then
                    v106.toggle = p_u_105.toggle_checkbox:get()
                end
                v_u_2.start_game(p_u_105.minigame_id, {
                    ["startup_settings"] = v106
                })
            end
        end
    }
    p_u_105.start_button:start(v109)
    p_u_105.dropdown_template = p_u_105.start_button_container.Dropdown
    p_u_105.dropdown_template.Parent = nil
    p_u_105.invite_content = p_u_105.body.InviteContent
    p_u_105.invite_scroll = p_u_105.invite_content.ScrollingFrame
    p_u_105.nearby_player_template = p_u_105.invite_scroll.NearbyPlayerTemplate
    p_u_105.nearby_player_template.Parent = nil
    p_u_105.invite_friends_button = p_u_105.UIManager.wrap(p_u_105.invite_scroll.InviteFriendsButton, "DepthButton")
    local v110 = {
        ["mouse_button1_click"] = function()
            v_u_2.try_invite_friends(p_u_105.minigame_id)
        end
    }
    p_u_105.invite_friends_button:start(v110)
    p_u_105.invite_scroll.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        p_u_105:_set_scrolling_frame_canvas_size()
    end)
    p_u_105.exit_back_button = p_u_105.UIManager.wrap(p_u_105.exit_button, "DepthButton"):start({
        ["mouse_button1_click"] = function()
            p_u_105:_try_exit()
        end
    })
    p_u_105.tab_initializations = {
        ["lobby"] = function()
            p_u_105.header.Title.Text = "LOBBY"
            p_u_105.header.Icon.Image = "rbxassetid://89878409653104"
            p_u_105.lobby_content.Visible = true
            p_u_105.invite_content.Visible = false
            p_u_105.party_preview.Visible = false
            p_u_105.header.Checkbox.Visible = p_u_105.toggle_checkbox ~= nil
            p_u_105:_refresh_lobby()
            p_u_105.watch:select_object_in(p_u_105.lobby_content)
        end,
        ["invite"] = function()
            p_u_105.header.Title.Text = "INVITE"
            p_u_105.header.Icon.Image = "rbxassetid://128723731721529"
            p_u_105.lobby_content.Visible = false
            p_u_105.invite_content.Visible = true
            p_u_105.party_preview.Visible = true
            p_u_105.header.Checkbox.Visible = false
            p_u_105.invite_refresh_buffer:clear()
            p_u_105.invite_refresh_buffer:run(function()
                v_u_9.delay(5):await()
            end)
            p_u_105:_refresh_invite()
            p_u_105.watch:select_object_in(p_u_105.invite_content)
        end
    }
    v_u_3.register_callback("minigame_lobby", function(p111, p112)
        if p111 == v_u_17 then
            if p_u_105.start_dropdown then
                p_u_105.start_dropdown:destroy()
                p_u_105.start_dropdown = nil
            end
            if p_u_105.toggle_checkbox then
                p_u_105.toggle_checkbox:destroy()
                p_u_105.toggle_checkbox = nil
            end
            if p112 then
                v_u_2.cancel_pending_invites()
                p_u_105.party = p112.players
                p_u_105.host_player = p112.host_player
                p_u_105.max_players = p112.max_players
                p_u_105.minigame_id = p112.minigame_id
                local v113 = v_u_2.get_lobby_dropdown(p_u_105.minigame_id)
                if v113 then
                    local v114 = p_u_105.dropdown_template:Clone()
                    v114.Parent = p_u_105.start_button_container
                    p_u_105.start_dropdown = p_u_105.UIManager.wrap(v114, "Dropdown"):start({
                        ["choose_text"] = v113.choose_text,
                        ["choices"] = v113.choices,
                        ["default"] = v113.default,
                        ["should_localize_choices"] = v113.should_localize_choices
                    })
                    p_u_105.start_button_container.Button.Size = UDim2.new(1, -157, 1, 0)
                else
                    p_u_105.start_button_container.Button.Size = UDim2.new(1, -10, 1, 0)
                end
                local v115 = v_u_2.get_lobby_toggle(p_u_105.minigame_id)
                if v115 then
                    p_u_105.toggle_checkbox = p_u_105.UIManager.wrap(p_u_105.header.Checkbox, "Checkbox"):start({
                        ["default"] = false,
                        ["text"] = v115
                    })
                    p_u_105.header.Checkbox.Visible = true
                else
                    p_u_105.header.Checkbox.Visible = false
                end
                if not p_u_105.UIManager.is_visible(p_u_105.ClassName) then
                    p_u_105.UIManager.set_app_visibility(p_u_105.ClassName, true)
                end
                if p_u_105.tab == "invite" and #p_u_105.party == p_u_105.max_players then
                    p_u_105:set_tab("lobby")
                else
                    p_u_105:_refresh_current_tab()
                end
                v_u_9.try(function()
                    v_u_11.get("VehicleAPI/DespawnVehicle"):InvokeServer()
                end)
            else
                p_u_105.UIManager.set_app_visibility(p_u_105.ClassName, false)
                p_u_105.party = {}
                p_u_105.host_player = nil
                p_u_105.minigame_id = nil
                p_u_105.max_players = nil
                p_u_105.lobby_invite_count = 0
                p_u_105.lobby_cost_string_promise:cancel()
            end
        else
            if not p112 then
                p_u_105:_queued_refresh_invites()
            end
            return
        end
    end)
    p_u_105.watch = v_u_7.quick_watch({
        ["selection_parent"] = p_u_105.instance.Frame,
        ["default_selection"] = function()
            local v116
            if p_u_105.tab == "invite" then
                local v117 = nil
                for _, v118 in p_u_105.invite_scroll:GetChildren() do
                    if v118.Name == "Entry" and (not v117 or v117.LayoutOrder >= v118.LayoutOrder) then
                        v117 = v118
                    end
                end
                if v117 then
                    v116 = v117.Button
                else
                    v116 = p_u_105.invite_friends_button.instance
                end
            else
                local v119 = nil
                for _, v120 in p_u_105.lobby_content:GetChildren() do
                    if v120.Name == "EmptySlot" and (not v119 or v119.LayoutOrder >= v120.LayoutOrder) then
                        v119 = v120
                    end
                end
                if v119 then
                    v116 = v119.Button
                else
                    v116 = p_u_105.start_button.instance
                end
            end
            if v116.Visible then
                return v116
            else
                return p_u_105.exit_button
            end
        end,
        ["app_name"] = p_u_105.ClassName,
        ["exit_buttons"] = { p_u_105.exit_button },
        ["close_override"] = function()
            p_u_105:_try_exit()
        end
    })
    p_u_105:set_tab("lobby")
end
return v19