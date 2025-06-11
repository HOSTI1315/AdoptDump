--// ReplicatedStorage.ClientServices.Interactions.CharInteractions.PlayerCharInteractions (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("ClientData")
local v_u_3 = v_u_1("RouterClient")
local v_u_4 = v_u_1("InventoryDB")
local v_u_5 = v_u_1("EmotesDB")
local v_u_6 = v_u_1("MsgBank")
local v_u_7 = v_u_1("UIManager")
local v_u_8 = v_u_1("CharWrapperClient")
local v_u_9 = v_u_1("InteriorsM")
local v_u_10 = v_u_1("FamilyHelper")
local v_u_11 = v_u_1("RoleplayRolesClient")
local v_u_12 = v_u_1("TradeExcluder")
local v_u_13 = v_u_1("PickupHelper")
local v_u_14 = v_u_1("MuteHandler")
local v_u_15 = v_u_1("StateManagerClient")
local v16 = {}
local v_u_17 = {}
local function v_u_20(p_u_18)
    v_u_17[p_u_18.Name] = true
    task.spawn(function()
        local v19 = v_u_3.get("FamilyAPI/InvitePlayer"):InvokeServer(p_u_18)
        v_u_17[p_u_18.Name] = nil
        if v19 == "Accept" then
            v_u_7.apps.HintApp:hint({
                ["text"] = p_u_18.Name .. " joined your family!",
                ["length"] = 4
            })
            return
        elseif v19 == "Please Wait" then
            v_u_7.apps.HintApp:hint({
                ["text"] = "Please wait a bit before inviting " .. p_u_18.Name .. " again",
                ["length"] = 7
            })
        else
            v_u_7.apps.HintApp:hint({
                ["text"] = p_u_18.Name .. " declined your invite",
                ["length"] = 2.5
            })
        end
    end)
    v_u_7.apps.HintApp:hint({
        ["text"] = "Sent invitation!",
        ["yields"] = false,
        ["length"] = 1
    })
end
local function v_u_28(p21, p22, p_u_23)
    local v24 = v_u_2.get_server(p22, "team")
    local v25 = v_u_2.get_server(game.Players.LocalPlayer, "team")
    if v25 == "Parents" and v24 == "Babies" then
        local v26 = {
            ["text"] = "Pick Up",
            ["on_selected"] = function()
                v_u_13.pickup(p_u_23)
            end
        }
        table.insert(p21, v26)
    elseif v25 == "Babies" and v24 == "Parents" then
        local v27 = {
            ["text"] = "Ride",
            ["on_selected"] = function()
                v_u_13.ride(p_u_23)
            end
        }
        table.insert(p21, v27)
    end
end
local function v_u_34(p29, p30, p31, p32)
    if v_u_7.apps.DialogApp:dialog({
        ["text"] = string.format("Are you sure you want to give %s your %s?", p29.Name, p30.name),
        ["left"] = "No",
        ["right"] = "Yes"
    }) == "No" then
        return
    elseif p31.properties.sealed_colors and v_u_7.apps.DialogApp:dialog({
        ["text"] = "Pet Hair Coloring will be cleared. Continue?",
        ["left"] = "No",
        ["right"] = "Yes"
    }) == "No" then
        return
    else
        local v33 = v_u_8.get(game.Players.LocalPlayer.Character)
        if p32 == v33.location then
            if v_u_8.is_in_same_location(v33, v_u_8.get(p29.Character)) then
                v_u_3.get("TradeAPI/GiveItem"):InvokeServer(p29, p31.unique)
            end
        end
    end
end
local function v_u_40(p35)
    local v36 = {}
    for v_u_37, v38 in pairs(v_u_5.emotes) do
        if v38.category == p35 then
            local v39 = {
                ["text"] = v38.name,
                ["on_selected"] = function()
                    v_u_3.get("EmotesAPI/PlayEmote"):FireServer(v_u_37)
                end
            }
            table.insert(v36, v39)
        end
    end
    return v36
end
local function v_u_43(p41)
    if v_u_2.get("roleplay_role") and not v_u_2.get_server(p41, "roleplay_role") then
        local v42 = v_u_11.get_roleplay_role_entry_from_player(game.Players.LocalPlayer)
        if v42 and v42.can_interact_with_strangers then
            return (v_u_9.get_current_location() or {}).destination_id == v42.building_entry.destination_id
        else
            return false
        end
    else
        return false
    end
end
function v16.should_be_visible(p44)
    if v_u_7.is_visible("TradeApp") then
        return false
    else
        local v45 = (v_u_2.get("equip_manager") or {}).roleplay
        local v46
        if v45 == nil then
            v46 = false
        else
            v46 = v45.id == "detective_handcuffs"
        end
        if v46 then
            return false
        else
            local v47 = v_u_2.get("state_manager")
            if v47 then
                return (not v_u_15.char_is_connected_to_me(v47, p44) or v_u_15.has_state(v47, "ParentPutBabyOnStroller")) and true or false
            else
                return false
            end
        end
    end
end
function v16.build_interaction_text_callback(p_u_48, _)
    return function()
        return p_u_48.Name
    end
end
function v16.build_on_selected_callback(p_u_49, p_u_50)
    return function()
        local v51 = {}
        if p_u_50 == game.Players.LocalPlayer.Character then
            local v52 = {
                ["text"] = "Profile",
                ["on_selected"] = function()
                    v_u_7.apps.PlayerProfileApp:open_player_profile_for_me()
                end
            }
            table.insert(v51, v52)
            for v_u_53, v54 in pairs(v_u_5.categories) do
                local v55 = {
                    ["text"] = v54,
                    ["on_selected"] = function()
                        return v_u_40(v_u_53)
                    end
                }
                table.insert(v51, v55)
            end
            return v51
        end
        local v56 = v_u_2.get_server(game.Players.LocalPlayer, "family_list")
        local v57 = v_u_2.get_server(p_u_49, "family_list")
        local v58 = v_u_10.is_my_family(p_u_49)
        local v59 = v58 or (v_u_43(p_u_49) or v_u_10.is_my_family_because_friend(p_u_49))
        local v_u_60 = v_u_8.get(game.Players.LocalPlayer.Character).location
        local v61 = {
            ["text"] = "Profile",
            ["on_selected"] = function()
                v_u_7.apps.PlayerProfileApp:open_player_profile_for_user_id(p_u_49.UserId)
            end
        }
        table.insert(v51, v61)
        if v59 then
            v_u_28(v51, p_u_49, p_u_50)
        end
        if v56 and not (v58 or v_u_17[p_u_49.Name]) then
            local v62 = {
                ["text"] = "Invite to family",
                ["on_selected"] = function()
                    v_u_20(p_u_49)
                end
            }
            table.insert(v51, v62)
        end
        if v57 and not v58 then
            local v64 = {
                ["text"] = "Join family (" .. #v57 .. ")",
                ["on_selected"] = function()
                    local v63 = p_u_49
                    v_u_3.get("MsgAPI/CreateMsg"):InvokeServer("ask_for_family_invite", math.random(1, #v_u_6.ask_for_family_invite), v63)
                end
            }
            table.insert(v51, v64)
        end
        local v65 = v_u_2.get_server(p_u_49, "in_active_trade")
        if v65 then
            local v66 = {
                ["text"] = "Spectate Trade",
                ["on_selected"] = function()
                    v_u_3.get("TradeAPI/SpectateTrade"):FireServer(true, p_u_49)
                end
            }
            table.insert(v51, v66)
        end
        if not v65 then
            local v67 = {
                ["text"] = "Trade",
                ["on_selected"] = function()
                    if not v_u_7.apps.TradeApp:check_and_warn_if_trading_restricted() then
                        v_u_7.apps.TradeApp:show_scam_warning()
                        v_u_12.include_player(p_u_49)
                        v_u_3.get("TradeAPI/SendTradeRequest"):FireServer(p_u_49)
                    end
                end
            }
            table.insert(v51, v67)
        end
        local v77 = {
            ["text"] = "Give Item...",
            ["on_selected"] = function()
                local v68 = v_u_2.get("equip_manager")
                local v_u_69 = v68.strollers or v68.toys or (v68.food or v68.gifts or (v68.pet_accessories or v68.roleplay))
                local v_u_70
                if v_u_69 and v_u_4[v_u_69.category] then
                    v_u_70 = v_u_4[v_u_69.category][v_u_69.id]
                else
                    v_u_70 = nil
                end
                local v75 = {
                    {
                        ["text"] = "From Backpack",
                        ["on_selected"] = function()
                            local v71 = v_u_1("BackpackLockTracker")
                            local v72 = v_u_7.apps.BackpackApp:pick_item()
                            if v72 then
                                local v73 = v_u_4[v72.category][v72.id]
                                local v74 = v_u_1("ItemHider").is_item_tradeable(v73, v72)
                                if v74 then
                                    v74 = not v71.is_locked(v72)
                                end
                                if not v74 then
                                    v_u_7.apps.DialogApp:dialog({
                                        ["text"] = "This item is not tradeable.",
                                        ["button"] = "Okay"
                                    })
                                    return
                                end
                                if v_u_7.apps.TradeApp:is_last_pet(v72, true) then
                                    return
                                end
                                v_u_34(p_u_49, v73, v72, v_u_60)
                            end
                        end
                    }
                }
                if v_u_70 and (v_u_70.donatable == true or v_u_70.donatable == nil) then
                    local v76 = {
                        ["text"] = "From Hand",
                        ["on_selected"] = function()
                            v_u_34(p_u_49, v_u_70, v_u_69, v_u_60)
                        end
                    }
                    table.insert(v75, v76)
                end
                return v75
            end
        }
        table.insert(v51, v77)
        if v_u_14.is_muting_enabled() then
            local v78 = {
                ["text"] = v_u_14.is_muted(p_u_49) and "Unmute" or "Mute",
                ["on_selected"] = function()
                    if v_u_14.is_muted(p_u_49) then
                        return v_u_14.unmute(p_u_49, "interaction")
                    else
                        return v_u_14.mute(p_u_49, "interaction")
                    end
                end
            }
            table.insert(v51, v78)
        end
        return v51
    end
end
return v16