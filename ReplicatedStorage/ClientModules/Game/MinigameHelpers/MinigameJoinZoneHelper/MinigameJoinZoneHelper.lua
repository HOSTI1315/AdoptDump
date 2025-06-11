--// ReplicatedStorage.ClientModules.Game.MinigameHelpers.MinigameJoinZoneHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("ClientData")
local v_u_4 = v1("LiveOpsTime")
local v_u_5 = v1("Signal")
local v_u_6 = v1("SoundPlayer")
local v_u_7 = v1("UIManager")
local v8 = v1("package:t")
local v_u_9 = v1("FormatHelper")
local v_u_10 = game:GetService("LocalizationService"):GetTranslatorForPlayer(game.Players.LocalPlayer)
local v11 = v8.strictInterface
local v12 = {
    ["minigame_name"] = v8.string,
    ["cycle_timestamp_key"] = v8.string,
    ["minigame_state"] = v8.interface({
        ["get"] = v8.callback
    })
}
local v_u_13 = v11(v12)
local v_u_14 = {
    ["is_game_active"] = v8.boolean,
    ["players_loading"] = v8.boolean,
    ["zone_override_text"] = v8.string,
    ["zone_override_timestamp"] = v8.number
}
local v_u_15 = v8.strictInterface({
    ["is_in_queue"] = v8.boolean,
    ["override_text"] = v8.optional(v8.string),
    ["override_timestamp"] = v8.optional(v8.number)
})
local v16 = v2("MinigameJoinZoneHelper")
function v16.__init(p17, p18)
    local v19 = v_u_13
    assert(v19(p18))
    for v20, v21 in v_u_14 do
        local v22 = p18.minigame_state
        assert(v21(v22:get(v20)))
    end
    p17.name = p18.minigame_name
    p17.cycle_timestamp_key = p18.cycle_timestamp_key
    p17.minigame_state = p18.minigame_state
    p17.is_game_active = false
    p17.players_loading = false
    p17.is_in_queue = false
    p17.override_text = nil
    p17.override_timestamp = nil
    p17.enter_message = ("You are in the queue for the %s Minigame."):format(p17.name)
    p17.exit_message = ("You have left the queue for the %s Minigame."):format(p17.name)
    p17.enter_signal = v_u_5.new()
    p17.exit_signal = v_u_5.new()
end
function v16.update(p23, p24)
    local v25 = v_u_15
    assert(v25(p24))
    p23.is_game_active = p23.minigame_state:get("is_game_active") or false
    p23.players_loading = p23.minigame_state:get("players_loading") or false
    p23.is_in_queue = p24.is_in_queue or false
    if p23.minigame_state:get("zone_override_text") == "" then
        if p24.override_text and p24.override_text ~= "" then
            p23.override_text = p24.override_text
        else
            p23.override_text = nil
        end
    else
        p23.override_text = p23.minigame_state:get("zone_override_text")
    end
    if p23.minigame_state:get("zone_override_timestamp") == -1 then
        if p24.override_timestamp and p24.override_timestamp ~= -1 then
            p23.override_timestamp = p24.override_timestamp
        else
            p23.override_timestamp = nil
        end
    else
        p23.override_timestamp = p23.minigame_state:get("zone_override_timestamp")
        return
    end
end
function v16.on_enter(p26)
    v_u_6.FX:play("MinigameQueueEnter")
    v_u_7.apps.HintApp:hint({
        ["text"] = p26.enter_message,
        ["length"] = 3,
        ["overridable"] = true,
        ["yields"] = false
    })
    p26.enter_signal:Fire()
end
function v16.on_exit(p27)
    v_u_6.FX:play("MinigameQueueLeave")
    v_u_7.apps.HintApp:hint({
        ["text"] = p27.exit_message,
        ["length"] = 3,
        ["overridable"] = true,
        ["yields"] = false
    })
    p27.exit_signal:Fire()
end
function v16.get_next_time(p28)
    local v29 = v_u_3.get(p28.cycle_timestamp_key)
    return v29 and (v29.timestamp or -1) or nil
end
function v16.get_billboard_text(p30)
    local v31 = v_u_4.now()
    if p30.override_text then
        return p30.override_text
    end
    local v32 = p30:get_next_time()
    if not v32 then
        return v_u_10:Translate(workspace, "GAME IS RETURNING SOON")
    end
    local v33
    if p30.override_timestamp then
        local v34 = p30.override_timestamp - v31
        v33 = math.max(0, v34)
    else
        local v35 = v32 - v31
        v33 = math.max(0, v35)
    end
    local v36 = p30.is_game_active and (p30.players_loading and "GAME IS STARTING SOON:\n%s" or "GAME IN PROGRESS:\n%s") or "NEXT GAME IN:\n%s"
    local v37 = v_u_9.get_time_breakdown(v33)
    return v_u_10:Translate(workspace, v36:format(("%02d:%02d"):format(v37.minutes, v37.seconds)))
end
function v16.get_color(p38)
    if p38.override_text then
        return Color3.new(1, 0, 0)
    elseif p38.is_game_active then
        if p38.players_loading then
            return Color3.new(0, 0, 1)
        else
            return Color3.new(1, 0, 1)
        end
    elseif p38.is_in_queue then
        return Color3.new(0, 1, 0)
    else
        return Color3.new(1, 0, 0)
    end
end
return v16