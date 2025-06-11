--// ReplicatedStorage.ClientModules.Game.MinigameHelpers.MinigameScalerClient (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v_u_1("MinigameClient")
local v3 = v_u_1("Class")
local v_u_4 = v_u_1("package:Sift")
local v5 = v_u_1("package:t")
local v6 = v5.strictInterface
local v7 = {
    ["minigame_class"] = v5.interface({
        ["new"] = v5.callback,
        ["_try_join"] = v5.callback,
        ["get_players"] = v5.callback,
        ["is_player_participating"] = v5.callback,
        ["join_zone_interior_render"] = v5.callback,
        ["join_zone_interior_cleanup"] = v5.callback,
        ["post_exit_minigame"] = v5.callback
    }),
    ["minigame_options"] = v5.map(v5.string, v5.any)
}
local v_u_8 = v6(v7)
local v9 = {}
local v_u_10 = v3("ScalingMinigameClient", v2)
function v_u_10.join_minigame_msg(p_u_11, p12, p_u_13)
    local v14 = p_u_11.minigame_options.minigame_id
    local v_u_15 = p_u_11.minigame_class
    p_u_11.instanced_minigame = v_u_15.new(v_u_4.Dictionary.join(p_u_11.minigame_options, {
        ["minigame_destination_id"] = p12,
        ["minigame_id"] = p_u_13,
        ["static_minigame_id"] = v14
    }))
    local v_u_16 = v_u_1("MinigameClientManager")
    function p_u_11.instanced_minigame.join_zone_interior_render(_) end
    function p_u_11.instanced_minigame.join_zone_interior_cleanup(_) end
    function p_u_11.instanced_minigame.enter_game_msg(p17, ...)
        p_u_11.is_participating = true
        v_u_15.enter_game_msg(p17, ...)
    end
    function p_u_11.instanced_minigame.leave_game_msg(p18, ...)
        p_u_11.is_participating = false
        v_u_15.leave_game_msg(p18, ...)
    end
    function p_u_11.instanced_minigame.post_exit_minigame(p19, ...)
        v_u_15.post_exit_minigame(p19, ...)
        v_u_16.remove(p_u_13)
        p_u_11.instanced_minigame = nil
    end
    v_u_16.add(p_u_11.instanced_minigame)
    p_u_11.instanced_minigame.is_queued = true
    p_u_11.instanced_minigame:_try_join(p_u_11.instanced_minigame.default_join_options)
end
function v_u_10.get_players(p20, p21)
    if p20.instanced_minigame then
        return p20.instanced_minigame:get_players(p21)
    else
        return false
    end
end
function v_u_10.is_player_participating(p22, p23)
    if p22.instanced_minigame then
        return p22.instanced_minigame:is_player_participating(p23)
    else
        return false
    end
end
function v_u_10.join_zone_interior_render(p_u_24, p25, p26)
    p_u_24.minigame_class.join_zone_interior_render(p_u_24, p25, p26)
    if p_u_24.lobby_options then
        p_u_24.join_zone_maid:GiveTask(p_u_24.join_zone_helper.enter_signal:Connect(function()
            p_u_24:_enter_join_zone()
        end))
        p_u_24.join_zone_maid:GiveTask(p_u_24.join_zone_helper.exit_signal:Connect(function()
            p_u_24:_leave_join_zone()
        end))
    end
end
function v_u_10.join_zone_interior_cleanup(p27, p28, p29)
    p27.minigame_class.join_zone_interior_cleanup(p27, p28, p29)
end
function v_u_10._enter_join_zone(p30)
    local v31 = p30.lobby_options
    assert(v31, "This minigame does not support lobbies.")
    p30:message_server("join_zone", true)
end
function v_u_10._leave_join_zone(p32)
    local v33 = p32.lobby_options
    assert(v33, "This minigame does not support lobbies.")
    p32:message_server("join_zone", false)
end
function v9.new(p34)
    local v35 = v_u_8
    assert(v35(p34))
    local v36 = p34.minigame_class
    local v37 = p34.minigame_options
    local v38 = v37.minigame_destination_id ~= v37.join_zone_destination_id
    assert(v38, "MinigameScaler does not support minigames that share the same Interior as their join zone.")
    local v39 = v_u_10.new({
        ["minigame_id"] = v37.minigame_id,
        ["minigame_name"] = v37.minigame_name,
        ["minigame_destination_id"] = v37.minigame_destination_id,
        ["join_zone_destination_id"] = v37.join_zone_destination_id,
        ["get_join_zone_model"] = v37.get_join_zone_model
    })
    if v39.minigame_state:exists("lobby_options") then
        v39.lobby_options = v39.minigame_state:get_as_json("lobby_options")
        if v39.join_zone_helper then
            v39.join_zone_helper.enter_message = ("You can now be invited to join %s by anyone."):format(v37.minigame_name)
            v39.join_zone_helper.exit_message = ("You can still be invited to join %s by friends."):format(v37.minigame_name)
        end
    end
    v39.minigame_class = v36
    v39.minigame_options = v37
    v39.instanced_minigame = nil
    return v39
end
return v9