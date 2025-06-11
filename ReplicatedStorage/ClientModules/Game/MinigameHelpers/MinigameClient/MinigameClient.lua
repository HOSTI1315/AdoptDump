--// ReplicatedStorage.ClientModules.Game.MinigameHelpers.MinigameClient (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("MinigameStateReplicator")
local v_u_3 = v1("MinigameJoinZone")
local v_u_4 = v1("MinigameJoinZoneHelper")
local v_u_5 = v1("MinigameAboveCharStack")
local v_u_6 = v1("RouterClient")
local v_u_7 = v1("UIManager")
local v_u_8 = v1("InteriorsM")
local v_u_9 = v1("Maid")
local v_u_10 = v1("Signal")
local v_u_11 = v1("MinigameForcedState")
local v_u_12 = v1("MinigameLobbyClient")
local v_u_13 = v1("LiveOpsTime")
local v_u_14 = v1("FormatHelper")
local v_u_15 = v1("AltCurrencyData")
local v_u_16 = v1("CollisionsClient")
local v_u_17 = v1("InventoryDB")
local v_u_18 = v1("SoundDB")
local v_u_19 = v1("Music")
local v_u_20 = v1("SoundPlayer")
local v_u_21 = v1("ClientData")
local v_u_22 = v1("package:Promise")
local v_u_23 = v1("package:Sift")
local v24 = v1("package:t")
local v25 = {
    ["minigame_id"] = v24.string,
    ["minigame_name"] = v24.string,
    ["minigame_destination_id"] = v24.string,
    ["join_zone_destination_id"] = v24.optional(v24.string),
    ["get_join_zone_model"] = v24.optional(v24.callback),
    ["invite_message_id"] = v24.optional(v24.string),
    ["ingame_music_id"] = v24.optional(v24.string),
    ["intro_sound_id"] = v24.optional(v24.string),
    ["disable_player_collisions"] = v24.optional(v24.boolean),
    ["minigame_restriction_overrides"] = v24.optional(v24.table),
    ["forced_team"] = v24.optional(v24.literal("Babies", "Parents")),
    ["above_char_stack_component_ids"] = v24.optional(v24.array(v24.string)),
    ["static_minigame_id"] = v24.optional(v24.string),
    ["on_rewards_close_callback"] = v24.optional(v24.callback)
}
local v_u_26 = v24.strictInterface(v25)
local v27 = v1("Class")("MinigameClient")
v27.VALIDATION_INTERFACE = table.freeze(v25)
function v27.pre_enter_minigame(_, _) end
function v27.enter_minigame(p28, _)
    v_u_8.enter(p28.minigame_destination_id, "MainDoor", {
        ["skip_set_player_collisions"] = true
    })
end
function v27.post_enter_minigame(_, _) end
function v27.game_started(_, _) end
function v27.pre_exit_minigame(_, _) end
function v27.exit_minigame(p29, _)
    if p29.join_zone_destination_id then
        local v30 = workspace.StaticMap.TeleportLocations:FindFirstChild(p29.static_minigame_id)
        v_u_8.enter(p29.join_zone_destination_id, "MainDoor", {
            ["spawn_cframe"] = v30.CFrame
        })
    end
end
function v27.post_exit_minigame(_, _) end
function v27.ingame_app_start_state(_)
    local v31 = {
        ["left"] = {
            ["title"] = "TIME LEFT",
            ["value"] = "",
            ["title_x_alignment"] = Enum.TextXAlignment.Center
        }
    }
    return v31
end
function v27.reconcile_above_char_component(_, _, _, _) end
function v27.refresh_above_char_stack(p32, p33)
    if p32.minigame_above_char_stack then
        if p33 then
            p32.minigame_above_char_stack:refresh(p33)
            return
        end
        for _, v34 in p32:get_players() do
            p32.minigame_above_char_stack:refresh(v34)
        end
    end
end
function v27.update_timer(p35)
    if p35.ingame_app_controller then
        local v36 = v_u_13.get_time_until
        local v37 = p35.end_time
        local v38 = math.max(0, v36(v37))
        local v39 = v_u_14.get_time_breakdown(v38)
        local v40 = ("%02d:%02d"):format(v39.minutes, v39.seconds)
        p35.ingame_app_controller:set_left_value(v40)
    end
end
function v27.minigame_interior_interactions(_, _, _) end
function v27.minigame_interior_render(_, _, _) end
function v27.minigame_interior_cleanup(_, _, _) end
function v27.message_server(p41, p42, ...)
    v_u_6.get("MinigameAPI/MessageServer"):FireServer(p41.minigame_id, p42, ...)
end
function v27.message_received(p43, p44, ...)
    p43[p44 .. "_msg"](p43, ...)
end
function v27.join_accepted_msg(p45, p46, _)
    p45.join_id = p46
end
function v27.enter_game_msg(p_u_47, p_u_48)
    if not p_u_47.is_participating then
        p_u_47.is_participating = true
        p_u_47.is_queued = false
        p_u_47.intermission_end_time = p_u_48.intermission_end_time
        p_u_47.end_time = p_u_48.end_time
        p_u_47:_enter_minigame_sequence(p_u_48)
        p_u_47:_update_timer_promise()
        p_u_47:cancel_on_game_end(v_u_13.delay_until(p_u_47.intermission_end_time):andThen(function()
            if p_u_47.is_participating then
                p_u_47.game_start_signal:Fire()
                p_u_47:game_started(p_u_48)
                if p_u_47.ingame_music_id then
                    v_u_19.reset_time_position(p_u_47.ingame_music_id)
                    v_u_19.play(100, v_u_18[p_u_47.ingame_music_id])
                    v_u_19.stop(101, v_u_18.Silence)
                end
            end
        end))
    end
end
function v27.leave_game_msg(p49, p50, _)
    if p49.is_participating then
        p49.is_participating = false
        p49:_exit_minigame_sequence(p50)
    end
end
function v27.deferred_rewards_msg(p51, p52)
    p51:_show_rewards(p52.title, p52.rewards, p52.results)
end
function v27.cancel_on_game_start(p53, p54)
    return v_u_22.race({ p54, v_u_22.fromEvent(p53.game_start_signal), v_u_22.fromEvent(p53.game_end_signal) })
end
function v27.cancel_on_game_end(p55, p56)
    return v_u_22.race({ p56, v_u_22.fromEvent(p55.game_end_signal) })
end
function v27.join_zone_interior_render(p_u_57, p58, _)
    local v59 = p_u_57.join_zone_destination_id
    if v59 then
        v59 = p_u_57.get_join_zone_model
    end
    assert(v59, "Minigame has no join zone.")
    local v_u_60 = p_u_57.get_join_zone_model(p58)
    local v63 = {
        ["on_enter"] = function(_)
            v_u_16.disable_player_on_collision("minigame_join_zone_" .. p_u_57.minigame_id)
            if not (p_u_57.is_participating or p_u_57.is_queued) then
                p_u_57.is_queued = true
                p_u_57.join_zone_helper:on_enter()
            end
        end,
        ["on_exit"] = function(_)
            v_u_16.enable_player_on_collision("minigame_join_zone_" .. p_u_57.minigame_id)
            if not p_u_57.is_participating and p_u_57.is_queued then
                p_u_57.is_queued = false
                p_u_57.join_zone_helper:on_exit()
            end
        end,
        ["on_update"] = function(p61, _)
            local v62 = not p_u_57.is_participating
            if v62 then
                v62 = not p_u_57.lobby_options
            end
            p61:set_visible(v62)
            p_u_57.join_zone_helper:update({
                ["is_in_queue"] = p_u_57.is_queued
            })
            v_u_60.Billboard.BillboardGui.TimerLabel.Text = p_u_57.join_zone_helper:get_billboard_text()
            p61:set_color(p_u_57.join_zone_helper:get_color())
        end
    }
    local v_u_64 = v_u_3.new(v_u_60, v63)
    p_u_57.join_zone_maid:GiveTask(v_u_64)
    p_u_57.join_zone_maid:GiveTask(p_u_57.minigame_state:get_property_changed_signal("players_loading"):Connect(function(p65)
        if p65 and (p_u_57.is_queued and not p_u_57.is_participating) then
            p_u_57:_try_join(p_u_57.default_join_options)
        end
    end))
    p_u_57.join_zone_maid:GiveTask(p_u_57.minigame_state:get_property_changed_signal("is_game_active"):Connect(function(p66)
        if not p66 then
            v_u_64:reset_join_status()
        end
    end))
    p_u_57.join_zone_maid:GiveTask(function()
        v_u_16.enable_player_on_collision("minigame_join_zone_" .. p_u_57.minigame_id)
        if p_u_57.is_queued then
            p_u_57.is_queued = false
            if p_u_57.is_participating then
                p_u_57.join_zone_helper.exit_signal:Fire()
                return
            end
            p_u_57.join_zone_helper:on_exit()
        end
    end)
end
function v27.join_zone_interior_cleanup(p67, _, _)
    local v68 = p67.join_zone_destination_id
    if v68 then
        v68 = p67.get_join_zone_model
    end
    assert(v68, "Minigame has no join zone.")
    p67.join_zone_maid:DoCleaning()
end
function v27.get_players(p69)
    local v70 = p69.minigame_state:get_as_table("player_user_ids")
    return v_u_23.List.map(v70, function(p71)
        return game.Players:GetPlayerByUserId(p71)
    end)
end
function v27.is_player_participating(p72, p73)
    local v74 = p72:get_players()
    return v_u_23.List.find(v74, p73) ~= nil
end
function v27.on_attempt_exit(p75, _)
    if not p75.is_participating or p75.instanced_minigame then
        return false
    end
    if v_u_7.apps.DialogApp:dialog({
        ["text"] = "You will not earn any rewards if you exit the game!",
        ["left"] = "Cancel",
        ["right"] = "Exit Game",
        ["accept_delay"] = 2
    }) == "Exit Game" then
        p75:_try_leave(p75.default_leave_options)
    end
    return true
end
function v27.init(_) end
function v27._enter_minigame_sequence(p_u_76, p77)
    p_u_76:pre_enter_minigame(p77)
    v_u_12.cancel_pending_invites()
    if p_u_76.ingame_music_id then
        v_u_19.play(101, v_u_18.Silence)
    end
    if p_u_76.intro_sound_id then
        v_u_20.FX:play(p_u_76.intro_sound_id)
    end
    v_u_7.apps.TransitionsApp:transition({
        ["length"] = 0.5,
        ["start_transparency"] = 1,
        ["end_transparency"] = 0,
        ["yields"] = true
    })
    v_u_11.enable(v_u_23.Dictionary.merge(v_u_11.RESTRICT_ALL, p_u_76.minigame_restriction_overrides))
    p_u_76.leave_maid:GiveTask(function()
        v_u_11.disable()
        v_u_11.restore_equipped({ "pets" })
    end)
    p_u_76.restore_character_buffs = v_u_11.disable_character_buffs()
    if p_u_76.forced_team then
        local v78 = v_u_21.get("team")
        if v78 ~= p_u_76.forced_team then
            p_u_76.old_team = v78
            v_u_6.get("TeamAPI/ChooseTeam"):InvokeServer(p_u_76.forced_team, {
                ["dont_respawn"] = true
            })
        end
    end
    if p_u_76.disable_player_collisions then
        v_u_16.disable_player_on_collision(p_u_76.minigame_id)
        p_u_76.leave_maid:GiveTask(function()
            v_u_16.enable_player_on_collision(p_u_76.minigame_id)
        end)
    end
    p_u_76:enter_minigame(p77)
    p_u_76.ingame_app_controller = v_u_7.apps.MinigameInGameApp:display(v_u_23.Dictionary.merge({
        ["title"] = p_u_76.minigame_name:upper(),
        ["exit_callback"] = function()
            p_u_76:on_attempt_exit()
        end
    }, p_u_76:ingame_app_start_state(p77)))
    p_u_76.leave_maid:GiveTask(function()
        v_u_7.set_app_visibility("MinigameInGameApp", false)
        p_u_76.ingame_app_controller = nil
    end)
    if p_u_76.above_char_stack_component_ids then
        p_u_76.minigame_above_char_stack = v_u_5.new({
            ["component_ids"] = p_u_76.above_char_stack_component_ids,
            ["reconcile"] = function(...)
                p_u_76:reconcile_above_char_component(...)
            end
        })
        p_u_76.leave_maid:GiveTask(p_u_76.minigame_state:get_property_changed_signal("player_user_ids"):Connect(function()
            p_u_76.minigame_above_char_stack:_force_refresh_all()
        end))
        p_u_76.leave_maid:GiveTask(function()
            p_u_76.minigame_above_char_stack:destroy()
            p_u_76.minigame_above_char_stack = nil
        end)
    end
    p_u_76:post_enter_minigame(p77)
    v_u_7.apps.TransitionsApp:transition({
        ["length"] = 0.5,
        ["start_transparency"] = 0,
        ["end_transparency"] = 1,
        ["yields"] = false
    })
end
function v27._exit_minigame_sequence(p79, p80)
    v_u_7.apps.TransitionsApp:transition({
        ["length"] = 0.5,
        ["start_transparency"] = 1,
        ["end_transparency"] = 0,
        ["yields"] = true,
        ["color"] = p79.exit_transition_color or Color3.new(1, 1, 1)
    })
    p79:pre_exit_minigame(p80)
    v_u_16.disable_player_on_collision(p79.minigame_id .. "_exit")
    p79.leave_maid:DoCleaning()
    p79.game_end_signal:Fire()
    p79:exit_minigame(p80)
    v_u_16.enable_player_on_collision(p79.minigame_id .. "_exit")
    p79:post_exit_minigame(p80)
    if p79.forced_team and p79.old_team then
        v_u_6.get("TeamAPI/ChooseTeam"):InvokeServer(p79.old_team, {
            ["dont_respawn"] = true
        })
        p79.old_team = nil
    end
    if p79.restore_character_buffs then
        p79.restore_character_buffs()
    end
    if p80.rewards and (p80.results and #p80.rewards > 0) then
        p79:_show_rewards(p80.title, p80.rewards, p80.results, p80.additional_gamestats)
    end
    v_u_7.apps.TransitionsApp:transition({
        ["length"] = 0.5,
        ["start_transparency"] = 0,
        ["end_transparency"] = 1,
        ["yields"] = false,
        ["color"] = p79.exit_transition_color or Color3.new(1, 1, 1)
    })
    if p79.ingame_music_id then
        v_u_19.stop(100, v_u_18[p79.ingame_music_id])
    end
end
function v27._show_rewards(p81, p82, p83, p84, _)
    local v85 = nil
    local v86 = {}
    local v87 = {}
    for _, v88 in p83 do
        if v85 then
            if v88.type == "currency" then
                if v88.category == "bucks" then
                    local v89 = {
                        ["title"] = "BUCKS",
                        ["value"] = v88.amount,
                        ["image"] = "rbxassetid://6991531565"
                    }
                    table.insert(v86, v89)
                else
                    local v90 = {
                        ["title"] = v_u_15.human_readable:upper(),
                        ["value"] = v88.amount,
                        ["use_currency_image"] = true
                    }
                    table.insert(v86, v90)
                end
            elseif v88.type == "item" then
                if v87[v88.kind] then
                    local v91 = v87[v88.kind]
                    v91.value = v91.value + 1
                    v87[v88.kind].value_string = "x" .. v87[v88.kind].value
                else
                    local v92 = v_u_17[v88.category][v88.kind]
                    local v93 = {
                        ["title"] = v92.name:upper(),
                        ["value"] = 1,
                        ["value_string"] = "",
                        ["image"] = v92.large_image or v92.image
                    }
                    v87[v92.kind] = v93
                    table.insert(v86, v93)
                end
            elseif v88.type == "xp" then
                local v94 = {
                    ["title"] = "XP",
                    ["value"] = v88.amount,
                    ["battle_pass_kind"] = v88.kind
                }
                table.insert(v86, v94)
            end
        elseif v88.type == "currency" then
            if v88.category == "bucks" then
                v85 = {
                    ["title"] = ("x%d BUCKS"):format(v88.amount),
                    ["image"] = "rbxassetid://6991531565"
                }
            else
                v85 = {
                    ["title"] = ("x%d %s"):format(v88.amount, v_u_15.human_readable:upper()),
                    ["use_currency_image"] = true
                }
            end
        elseif v88.type == "item" then
            local v95 = v_u_17[v88.category][v88.kind]
            v85 = {
                ["title"] = v95.name:upper(),
                ["image"] = v95.large_image or v95.image
            }
        elseif v88.type == "xp" then
            v85 = {
                ["title"] = ("x%d XP"):format(v88.amount),
                ["battle_pass_kind"] = v88.kind
            }
        end
    end
    v_u_7.apps.MinigameRewardsApp:display({
        ["title"] = p82,
        ["reward"] = v85,
        ["results"] = v_u_23.List.join(v86, p84),
        ["on_close"] = p81.on_rewards_close_callback
    })
end
function v27._update_timer_promise(p_u_96)
    p_u_96:cancel_on_game_end(v_u_22.new(function(_, _, p97)
        while not p97() do
            p_u_96:update_timer()
            task.wait(1)
        end
    end))
end
function v27.should_refresh_above_char_stack(p98, p99)
    local v100 = p98.is_participating
    if v100 then
        v100 = p98:is_player_participating(p99)
    end
    return v100
end
function v27._on_refresh_above_char_stack(p101, p102, p103)
    if p101.minigame_above_char_stack then
        p101.minigame_above_char_stack:_on_refresh(p102, p103)
    end
end
function v27._try_join(p104, p105)
    v_u_6.get("MinigameAPI/AttemptJoin"):FireServer(p104.minigame_id, true, p105)
end
function v27._try_leave(p106, p107)
    v_u_6.get("MinigameAPI/AttemptJoin"):FireServer(p106.minigame_id, false, p107)
end
function v27.__init(p108, p109)
    local v110 = v_u_26
    assert(v110(p109))
    p108.ingame_app_controller = nil
    p108.leave_maid = v_u_9.new()
    p108.game_start_signal = v_u_10.new()
    p108.game_end_signal = v_u_10.new()
    p108.end_time = v_u_13.now()
    p108.is_participating = false
    p108.is_queued = false
    p108.minigame_id = p109.minigame_id
    p108.static_minigame_id = p109.static_minigame_id or p108.minigame_id
    p108.minigame_name = p109.minigame_name
    p108.minigame_destination_id = p109.minigame_destination_id
    p108.join_zone_destination_id = p109.join_zone_destination_id
    p108.get_join_zone_model = p109.get_join_zone_model
    p108.join_zone_maid = v_u_9.new()
    p108.ingame_music_id = p109.ingame_music_id
    p108.intro_sound_id = p109.intro_sound_id
    p108.minigame_restriction_overrides = p109.minigame_restriction_overrides or {}
    p108.disable_player_collisions = p109.disable_player_collisions or false
    p108.forced_team = p109.forced_team or "Parents"
    p108.above_char_stack_component_ids = p109.above_char_stack_component_ids
    p108.on_rewards_close_callback = p109.on_rewards_close_callback
    p108.minigame_state = v_u_2.new(workspace.StaticMap:WaitForChild(p108.minigame_id .. "_minigame_state"))
    p108.cycle_timestamp_key = p108.minigame_id .. "_cycle_timestamp"
    if p108.join_zone_destination_id and p108.get_join_zone_model then
        p108.join_zone_helper = v_u_4.new({
            ["minigame_name"] = p108.minigame_name,
            ["cycle_timestamp_key"] = p108.cycle_timestamp_key,
            ["minigame_state"] = p108.minigame_state
        })
    end
    p108:init()
end
table.freeze(v27)
return v27