--// ReplicatedStorage.ClientModules.Game.MinigameHelpers.MinigameLobbyClient (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("AltCurrencyData")
local v_u_3 = v_u_1("ClientData")
local v_u_4 = v_u_1("FriendsClient")
local v_u_5 = v_u_1("InventoryDB")
local v_u_6 = v_u_1("RouterClient")
local v_u_7 = v_u_1("CloudValues")
local v8 = v_u_1("Maid")
local v_u_9 = v_u_1("package:Sift")
local v_u_10 = v_u_1("LiveOpsTime")
local v_u_11 = v_u_1("FormatHelper")
local v_u_12 = game:GetService("CollectionService")
local v_u_13 = game:GetService("SocialService")
local v_u_14 = {}
local v_u_15 = {}
local v_u_16 = v8.new()
local v_u_17 = {}
local function v_u_20(p18)
    local v19 = v_u_1("UIManager")
    if v_u_7:getValue("minigames", "lobbies_enabled") then
        return true
    end
    v19.apps.DialogApp:dialog({
        ["text"] = p18.disabled_message or "This minigame is currently disabled for maintenance. It will return shortly.",
        ["button"] = "Okay"
    })
    return false
end
local function v_u_38(p21, p22)
    local v23 = v_u_1("ShopM")
    local v24 = v_u_1("UIManager")
    if p21.free_cycle_interval then
        local v25 = (v_u_3.get("minigame_timestamps") or {})[p22] or 0
        if v_u_10.has_happened(v25 + p21.free_cycle_interval) then
            return true, false
        end
    end
    local v26 = false
    local v27 = false
    local v_u_28 = p21.cost
    if v_u_28.type == "currency" then
        local v29 = v_u_28.kind == "bucks" and "money" or v_u_28.kind
        v26 = v23.can_afford(v29, v_u_28.amount)
    elseif v_u_28.type == "item" then
        local v30 = v_u_3.get("inventory")
        local v32 = v_u_9.Dictionary.filter(v30[v_u_28.category], function(p31)
            return p31.kind == v_u_28.kind
        end)
        v26 = v_u_9.Dictionary.count(v32) >= (v_u_28.amount or 1)
    end
    if not v26 then
        local v33
        if p21.free_play_options and not (p21.free_play_options.free_until_timestamp and v_u_10.has_happened(p21.free_play_options.free_until_timestamp)) then
            local v34 = p21.free_play_options.play_text or "Play Free"
            local v35 = p21.free_play_options.buy_text or "Buy Entry"
            local v36 = v24.apps.DialogApp:dialog({
                ["text"] = p21.free_play_options.dialog,
                ["left"] = v34,
                ["right"] = v35,
                ["exit_button"] = true
            })
            v27 = v36 == v34
            if v36 == v35 then
                v33 = true
            else
                v33 = false
            end
        else
            v33 = true
        end
        if v33 then
            if v_u_28.type == "currency" then
                v23.try_prompt_not_enough_money(v_u_28.kind == "bucks" and "money" or v_u_28.kind, v_u_28.amount)
                return v26, v27
            end
            if v_u_28.type == "item" then
                if v_u_28.product_id then
                    v24.apps.DialogApp:dialog({
                        ["product_id"] = v_u_28.product_id,
                        ["dialog_type"] = "RobuxProductDialog"
                    })
                    return v26, v27
                end
                local v37 = v_u_5[v_u_28.category][v_u_28.kind]
                v24.apps.DialogApp:dialog({
                    ["dialog_type"] = "ScrollingDialog",
                    ["labels"] = {
                        {
                            ["text"] = "You do not have the requested items.",
                            ["size"] = 48,
                            ["padding"] = 20
                        },
                        {
                            ["text"] = ("%s x%i"):format(v37.name, v_u_28.amount or 1),
                            ["size"] = 34
                        }
                    },
                    ["button"] = "Okay"
                })
            end
        end
    end
    return v26, v27
end
function get_queue_tag(p39)
    return "in_queue_" .. p39
end
function v_u_17.get_queue_player_added_signal(p40)
    return v_u_12:GetInstanceAddedSignal(get_queue_tag(p40))
end
function v_u_17.get_queue_player_removed_signal(p41)
    return v_u_12:GetInstanceRemovedSignal(get_queue_tag(p41))
end
function v_u_17.is_player_queued(p42, p43)
    return p42:HasTag(get_queue_tag(p43))
end
function v_u_17.get_lobby_cost(p44)
    local v45 = v_u_1("MinigameClientManager")
    assert(p44, "Must provide a minigame id.")
    local v46 = v45.get(p44)
    assert(v46, "Minigame does not exist.")
    local v47 = v46.minigame_state:exists("lobby_options")
    assert(v47, "Minigame does not support Lobbies.")
    local v48 = v46.minigame_state:get_as_json("lobby_options")
    local v49 = ""
    local v50 = v48.cost
    if v50.type == "currency" then
        v49 = (v50.kind == "bucks" and "$%i" or v_u_2.interaction_format):format(v50.amount)
    elseif v50.type == "item" then
        v49 = ("%s x%i"):format(v_u_5[v50.category][v50.kind].name, v50.amount or 1)
    end
    if v48.free_cycle_interval then
        local v51 = v_u_3.get("minigame_timestamps")[p44]
        if v_u_10.has_happened(v51 + v48.free_cycle_interval) then
            v50.amount = 0
            v49 = "FREE ENTRY"
        else
            local v52 = v_u_10.get_time_until(v51 + v48.free_cycle_interval)
            local v53 = v_u_11.get_time_breakdown(v52)
            v49 = ("%* (FREE ENTRY IN %*)"):format(v49, (("%02d:%02d"):format(v53.minutes, v53.seconds)))
        end
    end
    v50.string = v49
    return v50
end
function v_u_17.get_lobby_dropdown(p54)
    local v55 = v_u_1("MinigameClientManager")
    assert(p54, "Must provide a minigame id.")
    local v56 = v55.get(p54)
    assert(v56, "Minigame does not exist.")
    local v57 = v56.minigame_state:exists("lobby_options")
    assert(v57, "Minigame does not support Lobbies.")
    local v58 = v56.minigame_state:get_as_json("lobby_options")
    if v58 and v58.dropdown then
        return v58.dropdown
    else
        return nil
    end
end
function v_u_17.get_lobby_toggle(p59)
    local v60 = v_u_1("MinigameClientManager")
    assert(p59, "Must provide a minigame id.")
    local v61 = v60.get(p59)
    assert(v61, "Minigame does not exist.")
    local v62 = v61.minigame_state:exists("lobby_options")
    assert(v62, "Minigame does not support Lobbies.")
    local v63 = v61.minigame_state:get_as_json("lobby_options")
    if v63 then
        return v63.toggle
    else
        return nil
    end
end
function v_u_17.try_create_lobby(p64)
    local v65 = v_u_1("MinigameClientManager")
    assert(p64, "Must provide a minigame id.")
    local v66 = v65.get(p64)
    assert(v66, "Minigame does not exist.")
    local v67 = v66.minigame_state:exists("lobby_options")
    assert(v67, "Minigame does not support Lobbies.")
    local v68 = v66.minigame_state:get_as_json("lobby_options")
    if v_u_20(v68) then
        local v69, v70 = v_u_38(v68, p64)
        if v69 or v70 then
            return v_u_6.get("MinigameAPI/LobbyCreate"):InvokeServer(p64)
        else
            return false
        end
    else
        return false
    end
end
function v_u_17.try_get_offline_invite_details()
    return v_u_6.get("MinigameAPI/GetOfflineInviteLobbyDetails"):InvokeServer()
end
function v_u_17.try_join_lobby()
    return v_u_6.get("MinigameAPI/LobbyJoin"):InvokeServer()
end
function v_u_17.try_invite_friends(p71)
    local v72 = v_u_1("LaunchDataHelper")
    local v73 = v_u_1("MinigameClientManager").get(p71)
    local v74 = v_u_6.get("MinigameAPI/LobbyGetId"):InvokeServer()
    if v74 then
        local v75 = game.Players.LocalPlayer
        local v76 = Instance.new("ExperienceInviteOptions")
        v76.PromptMessage = ("Invite your friends to join %s!"):format(v73.minigame_name)
        v76.LaunchData = v72.set_minigame_lobby(v75, v74)
        if v73.minigame_options and v73.minigame_options.invite_message_id then
            v76.InviteMessageId = v73.minigame_options.invite_message_id
        end
        v_u_13:PromptGameInvite(v75, v76)
    end
end
function v_u_17.start_game(p77, p78)
    if v_u_20((v_u_1("MinigameClientManager").get(p77).minigame_state:get_as_json("lobby_options"))) then
        v_u_6.get("MinigameAPI/LobbyStart"):FireServer(p78)
    end
end
function v_u_17.invite_player(p79)
    return v_u_6.get("MinigameAPI/LobbyInvite"):InvokeServer(p79)
end
function v_u_17.kick_player(p80)
    v_u_6.get("MinigameAPI/LobbyKick"):FireServer(p80)
end
function v_u_17.leave_lobby()
    v_u_6.get("MinigameAPI/LobbyLeave"):FireServer()
end
function v_u_17.add_pending_invite(p81)
    local v82, v_u_83 = v_u_1("UIManager").apps.DialogApp:queue_with_override(p81)
    v_u_16:GiveTask(function()
        v_u_83(nil)
    end)
    return v82:expect()
end
function v_u_17.cancel_pending_invites()
    v_u_16:DoCleaning()
end
local function v_u_89(p84, p85)
    if not v_u_1("MinigameForcedState").can_receive_invites() then
        return false, "minigame", nil
    end
    if v_u_14[p84] and tick() - v_u_14[p84] < 0 then
        local v86 = v_u_14[p84] - tick()
        return false, "rate_limit", math.ceil(v86)
    end
    if v_u_3.get("minigame_lobby") then
        return false, "in_lobby", nil
    end
    if not (game.Players.LocalPlayer:HasTag(("in_queue_%s"):format(p85)) or v_u_4.promise_get_is_friends_with(p84.UserId):expect()) then
        return false, "not_in_queue", nil
    end
    local v87 = v_u_17.add_pending_invite({
        ["text"] = ("You\'ve been invited to %s\'s lobby!"):format(p84.Name),
        ["left"] = "Decline",
        ["right"] = "Accept",
        ["image_size"] = UDim2.new(0, 125, 0, 125),
        ["image"] = "https://www.roblox.com/headshot-thumbnail/image?width=150&height=150&format=png&userid=" .. p84.UserId
    })
    if v87 == "Accept" then
        v_u_15[p84] = 0
        return true, nil, nil
    end
    if v87 ~= "Decline" then
        return false, "cancelled"
    end
    v_u_15[p84] = v_u_15[p84] and (v_u_15[p84] + 1 or 1) or 1
    v_u_14[p84] = tick() + 20 * v_u_15[p84]
    local v88 = v_u_14[p84] - tick()
    return false, "declined", math.ceil(v88)
end
function v_u_17.init()
    v_u_6.get_event("MinigameAPI/AcceptDeclineInvite").OnClientInvoke = v_u_89
end
return v_u_17