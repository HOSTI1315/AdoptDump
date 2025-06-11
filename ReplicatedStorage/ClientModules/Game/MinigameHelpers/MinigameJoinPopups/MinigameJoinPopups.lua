--// ReplicatedStorage.ClientModules.Game.MinigameHelpers.MinigameJoinPopups (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v_u_1("LiveOpsTime")
local v_u_3 = v_u_1("MinigameForcedState")
local v_u_4 = v_u_1("ClientData")
local v_u_5 = v_u_1("InteriorsM")
local v6 = v_u_1("Signal")
local v_u_7 = v_u_1("package:Sift")
local v8 = v_u_1("package:t")
local v_u_9 = {
    ["prompt"] = "%s is starting soon! Teleport there now?",
    ["prompt_window"] = 45
}
local v_u_10 = {}
local v_u_11 = v8.strictInterface({
    ["prompt"] = v8.string,
    ["prompt_window"] = v8.integer,
    ["prompt_callback"] = v8.optional(v8.callback),
    ["immediate_prompt"] = v8.optional(v8.boolean),
    ["can_prompt_now_callback"] = v8.optional(v8.callback)
})
local v_u_12 = v_u_1("package:Promise")
local v_u_13 = {}
local v_u_14 = v_u_12.resolve()
local v_u_15 = v6.new()
local function v_u_23(p_u_16, p17)
    local v18 = v_u_1("UIManager")
    local v19 = p17.prompt_callback and p17.prompt_callback() or p17.prompt
    local v20, v_u_21 = v18.apps.DialogApp:queue_with_override({
        ["text"] = v19:format(p_u_16.minigame_name),
        ["left"] = "No",
        ["right"] = "Yes"
    })
    v_u_14:cancel()
    v_u_14 = v20:andThen(function(p22)
        if p22 == "Yes" then
            v_u_5.enter_smooth(p_u_16.join_zone_destination_id, "MainDoor", {
                ["spawn_cframe"] = workspace.StaticMap.TeleportLocations:FindFirstChild(p_u_16.minigame_id).CFrame
            })
        end
    end):finally(function()
        v_u_21("No")
    end)
end
function v_u_13.init()
    v_u_12.fromEvent(v_u_15):andThen(function()
        for _, v_u_24 in v_u_1("MinigameClientManager").get_all() do
            v_u_12.try(function()
                while true do
                    local v_u_25 = v_u_7.Dictionary.merge(v_u_9, v_u_10[v_u_24.minigame_id] or {})
                    local v26 = v_u_11
                    assert(v26(v_u_25))
                    local v27 = v_u_2.now()
                    local v28 = v_u_5.get_current_location()
                    if v28 then
                        v28 = v28.destination_id
                    end
                    local v_u_29 = (v_u_4.get(v_u_24.cycle_timestamp_key) or {}).timestamp
                    if v_u_29 and v28 then
                        local v30 = v_u_29 - v27
                        if v_u_25.immediate_prompt then
                            v_u_2.delay_until(v_u_29):andThen(function()
                                if v_u_3.can_receive_invites() then
                                    if not v_u_25.can_prompt_now_callback or v_u_25.can_prompt_now_callback() then
                                        v_u_23(v_u_24, v_u_25)
                                    end
                                else
                                    return
                                end
                            end):await()
                        elseif v30 <= v_u_25.prompt_window and v30 >= 5 then
                            local v_u_31 = false
                            v_u_2.delay_until(v_u_29 - v_u_25.prompt_window):andThen(function()
                                if v_u_3.can_receive_invites() then
                                    if not v_u_25.can_prompt_now_callback or v_u_25.can_prompt_now_callback() then
                                        v_u_23(v_u_24, v_u_25)
                                        v_u_31 = true
                                        return v_u_2.delay_until(v_u_29)
                                    end
                                end
                            end):andThen(function()
                                if v_u_31 then
                                    v_u_14:cancel()
                                end
                            end):await()
                        end
                    end
                    task.wait(1)
                end
            end)
        end
    end)
end
function v_u_13.start_showing_popups()
    v_u_15:Fire()
    v_u_13.try_show_invited_lobby_popup()
end
function v_u_13.try_show_invited_lobby_popup()
    local v32 = v_u_1("UIManager")
    local v33 = v_u_1("RouterClient")
    local v34 = v_u_1("MinigameLobbyClient")
    local v35 = v34.try_get_offline_invite_details()
    if v35 then
        local v36 = v35.host_player
        if v32.apps.DialogApp:dialog({
            ["text"] = ("You\'ve been invited to %s\'s lobby!"):format(v36.Name),
            ["left"] = "Decline",
            ["right"] = "Accept",
            ["image_size"] = UDim2.new(0, 125, 0, 125),
            ["image"] = "https://www.roblox.com/headshot-thumbnail/image?width=150&height=150&format=png&userid=" .. v36.UserId
        }) == "Accept" then
            local v37, v38 = v34.try_join_lobby()
            if v37 then
                v33.get("LocationAPI/TeleToPlayer"):InvokeServer(v35.host_player)
            else
                local v39 = nil
                if v38 == "no_longer_exists" then
                    v39 = ("%s\'s lobby no longer exists."):format(v36.Name)
                elseif v38 == "lobby_full" then
                    v39 = ("%s\'s lobby is full."):format(v36.Name)
                end
                if v39 then
                    v32.apps.DialogApp:dialog({
                        ["text"] = v39,
                        ["button"] = "Okay"
                    })
                end
            end
        else
            return
        end
    else
        return
    end
end
return v_u_13