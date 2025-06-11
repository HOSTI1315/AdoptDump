--// ReplicatedStorage.ClientModules.Game.MinigameHelpers.MinigameSpectateHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("UIManager")
local v_u_4 = v1("Maid")
local v_u_5 = v1("InteractionsEngine")
local v_u_6 = v1("package:Sift")
local v7 = v1("package:t")
local v_u_8 = game:GetService("Players")
local v9 = v2("MinigameSpectateHelper")
local v10 = v7.strictInterface
local v11 = {
    ["is_participating"] = v7.callback,
    ["minigame_state"] = v7.interface({
        ["get_as_table"] = v7.callback,
        ["get_property_changed_signal"] = v7.callback
    }),
    ["on_spectate"] = v7.optional(v7.callback),
    ["on_spectate_player"] = v7.optional(v7.callback),
    ["filter_players"] = v7.optional(v7.callback)
}
local v_u_12 = v10(v11)
local v_u_13 = {
    ["is_game_active"] = v7.boolean,
    ["players_loading"] = v7.boolean,
    ["player_user_ids"] = v7.string
}
function v9.__init(p14, p15)
    local v16 = v_u_12
    assert(v16(p15))
    for v17, v18 in v_u_13 do
        local v19 = p15.minigame_state
        assert(v18(v19:get(v17)))
    end
    p14.is_participating = p15.is_participating
    p14.minigame_state = p15.minigame_state
    p14.on_spectate = p15.on_spectate
    p14.on_spectate_player = p15.on_spectate_player
    p14.filter_players = p15.filter_players
    p14.spectating = false
    p14.active_players = {}
    p14.maid = v_u_4.new()
    p14.per_player_maid = v_u_4.new()
end
function v9._update(p20)
    local v21 = p20.minigame_state:get_as_table("player_user_ids")
    local v23 = v_u_6.List.map(v21, function(p22)
        return v_u_8:GetPlayerByUserId((tonumber(p22)))
    end)
    if p20.filter_players then
        v23 = p20.filter_players(v23)
    end
    for _, v24 in p20.active_players do
        if not (v24 and (v24.Parent and v_u_6.List.includes(v23, v24))) then
            v_u_3.apps.PlayerSpectateApp:unwatch(v24)
        end
    end
    for _, v25 in v23 do
        v_u_3.apps.PlayerSpectateApp:watch(v25)
    end
    p20.active_players = v23
    return #p20.active_players > 0
end
function v9.register_interaction(p_u_26, p27)
    return v_u_5:register({
        ["text"] = "Spectate",
        ["part"] = p27,
        ["on_selected"] = function()
            p_u_26:start()
        end,
        ["is_visible"] = function()
            local v28 = not p_u_26.is_participating() and p_u_26.minigame_state:get("is_game_active")
            if v28 then
                v28 = not p_u_26.minigame_state:get("players_loading")
            end
            return v28
        end
    })
end
function v9.start(p_u_29)
    if p_u_29.spectating or p_u_29.is_participating() then
        return
    else
        p_u_29.spectating = true
        p_u_29.per_player_maid:DoCleaning()
        p_u_29.maid:DoCleaning()
        if p_u_29:_update() then
            if p_u_29.on_spectate_player then
                p_u_29.maid:GiveTask(v_u_3.apps.PlayerSpectateApp:get_spectate_changed_signal():Connect(function(p30)
                    p_u_29.per_player_maid:DoCleaning()
                    if p30 then
                        p_u_29.on_spectate_player(p30, p_u_29.per_player_maid)
                    end
                end))
            end
            p_u_29.maid:GiveTask(v_u_3.apps.PlayerSpectateApp:get_app_visibility_changed_signal():Connect(function(p31)
                if not p31 then
                    p_u_29:stop()
                end
            end))
            p_u_29.maid:GiveTask(p_u_29.minigame_state:get_property_changed_signal("is_game_active"):Connect(function(p32)
                if not p32 then
                    p_u_29:stop()
                end
            end))
            p_u_29.maid:GiveTask(p_u_29.minigame_state:get_property_changed_signal("player_user_ids"):Connect(function()
                if not p_u_29:_update() then
                    p_u_29:stop()
                end
            end))
            if p_u_29.on_spectate then
                p_u_29.on_spectate(p_u_29.maid)
            end
            v_u_3.set_app_visibility("PlayerSpectateApp", true)
        else
            p_u_29:stop()
        end
    end
end
function v9.stop(p33)
    if p33.spectating then
        p33.spectating = false
        v_u_3.set_app_visibility("PlayerSpectateApp", false)
        p33.active_players = {}
        p33.per_player_maid:DoCleaning()
        p33.maid:DoCleaning()
    end
end
return v9