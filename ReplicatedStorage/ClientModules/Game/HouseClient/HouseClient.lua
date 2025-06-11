--// ReplicatedStorage.ClientModules.Game.HouseClient (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("RouterClient")
local v_u_3 = v_u_1("ClientData")
local v_u_4 = v_u_1("HouseDB")
local v_u_5 = v_u_1("ClientStore")
local v_u_6 = v_u_1("ColorThemeManager")
local v7 = v_u_1("Signal")
local v_u_8 = v_u_1("SettingsHelper")
local v_u_9 = v_u_1("LiveOpsTime")
local v_u_10 = v_u_1("new:TutorialHelper")
local v_u_11 = game:GetService("Players")
local v_u_12 = {}
local v_u_13 = nil
v_u_12.housing_coop_changed = v7.new()
v_u_12.house_interior_changed = v7.new()
function v_u_12.is_edit_mode_active()
    return v_u_5.store:getState().house_editor_state == "Edit"
end
function v_u_12.get_current_house_owner()
    local v14 = v_u_3.get("house_interior")
    if v14 then
        v14 = v14.player
    end
    return v14
end
function v_u_12.is_current_house_listed_for_trade()
    local v15 = v_u_3.get("house_interior")
    if v15 then
        v15 = v15.listed_for_trade
    end
    return v15
end
function v_u_12.can_coop_build_current_house()
    local v16 = v_u_3.get("house_interior")
    local v17
    if v16 then
        v17 = v16.player
    else
        v17 = v16
    end
    if v17 and (v16 and v16.allows_coop_building) then
        if v17 == v_u_11.LocalPlayer then
            return true
        end
        local v18 = v_u_3.get_server(v17, "housing_coop")
        if not v18.locked and table.find(v18.players, v_u_11.LocalPlayer.UserId) then
            return true
        end
    end
    return false
end
function v_u_12.can_edit_current_house()
    local v19 = v_u_3.get("house_interior")
    local v20
    if v19 then
        v20 = v19.player
    else
        v20 = v19
    end
    if v20 and v19 then
        return v20 == v_u_11.LocalPlayer and true or v_u_12.can_coop_build_current_house()
    else
        return false
    end
end
function v_u_12.get_current_house_coop()
    local v21 = v_u_3.get("house_interior")
    if v21 then
        v21 = v21.player
    end
    if v21 then
        v21 = v_u_3.get_server(v21, "housing_coop")
    end
    return v21
end
function v_u_12.is_door_locked()
    return v_u_3.get("door_locked") or false
end
function v_u_12.lock_door()
    local v22 = not v_u_3.get("door_locked")
    v_u_2.get("HousingAPI/SetDoorLocked"):InvokeServer(v22)
    wait(0.5)
end
local function v_u_34()
    local v23 = v_u_3.get("house_manager")
    local v24 = nil
    for _, v25 in pairs(v23) do
        if v25.active then
            v24 = v25
        end
    end
    local v26 = v_u_4[v24.building_type]
    if v26.no_parties or v26.cost and v26.cost < v_u_4.pizzaplace.cost then
        local v27 = v_u_1("UIManager")
        v27.apps.DialogApp:dialog({
            ["text"] = "Your house is too small to host a party!",
            ["button"] = "Next"
        })
        if v_u_1("UIManager").apps.DialogApp:dialog({
            ["text"] = "You need a Pizza Place or bigger",
            ["left"] = "Close",
            ["right"] = "Upgrade"
        }) == "Upgrade" then
            v27.set_app_visibility("HousePurchaseApp", true)
        end
        return false
    end
    local v28 = v_u_3.get("last_hosted_party_time") or 0
    local v29 = v_u_9.now() - v_u_13 - v28
    if v29 >= 600 then
        return true
    end
    v_u_1("UIManager").apps.DialogApp:dialog({
        ["text"] = "You can only send invitations every 10 minutes",
        ["button"] = "Next"
    })
    local v30 = v_u_1("UIManager").apps.DialogApp
    local v31 = {}
    local v32 = string.format
    local v33 = (600 - v29) / 60
    v31.text = v32("Wait %d minute(s) before trying again", (math.ceil(v33)))
    v31.button = "Okay"
    v30:dialog(v31)
    return false
end
function v_u_12.throw_party(p35)
    if v_u_34() then
        local v36 = v_u_1("UIManager")
        local v37 = v36.apps.PartyInvitationApp:build(p35)
        if v37 == nil then
            return
        elseif v_u_2.get("HousingAPI/ThrowParty"):InvokeServer(v37) then
            v36.apps.DialogApp:dialog({
                ["text"] = "Your invitation was sent to " .. #game.Players:GetPlayers() - 1 .. " people",
                ["button"] = "Next"
            })
            v36.apps.DialogApp:dialog({
                ["text"] = "Wait at your house and greet your guests as they arrive!",
                ["button"] = "Okay"
            })
        else
            v36.apps.DialogApp:dialog({
                ["text"] = "Something went wrong. Please report this issue to the creators",
                ["button"] = "Okay"
            })
        end
    else
        return
    end
end
local function v_u_39(p38)
    if p38 and p38.Parent == game.Players then
        return true
    end
    v_u_1("UIManager").apps.DialogApp:dialog({
        ["text"] = "The party was cancelled because the host left the server",
        ["button"] = "Okay"
    })
    return false
end
function v_u_12.init()
    coroutine.wrap(function()
        v_u_13 = os.time() - v_u_2.get("EventAPI/GetServerTime"):InvokeServer()
    end)()
    v_u_3.register_callback("housing_coop", function(p40, p41, p42)
        v_u_12.housing_coop_changed:Fire(p40, p41, p42)
    end)
    v_u_3.register_callback("house_interior", function(p43, p44, p45)
        v_u_12.house_interior_changed:Fire(p43, p44, p45)
    end)
    v_u_2.get("HousingAPI/PlayerInvitedToParty").OnClientEvent:connect(function(p46)
        if v_u_1("MinigameForcedState").can_receive_invites() then
            local v47 = v_u_1("UIManager")
            if v_u_10.is_completed() then
                local v48 = p46.host_player
                local v49 = tick()
                local v50 = v_u_8.get_setting_client({
                    ["setting_id"] = "party_requests"
                })
                if v50 then
                    if v50 == "No One" then
                        return
                    end
                    if v50 == "Friends" and not v48:IsFriendsWith(game.Players.LocalPlayer.UserId) then
                        return
                    end
                end
                if v48 == nil or v48.Parent == nil then
                    return
                elseif v47.apps.DialogApp:dialog({
                    ["text"] = string.format("%s sent you an invitation to their party \240\159\142\137!", v48.Name),
                    ["left"] = "Close",
                    ["right"] = "View"
                }) ~= "Close" then
                    if v47.apps.PartyInvitationApp:show_invitation(p46) then
                        if not v_u_39(v48) then
                            return
                        end
                        if tick() - v49 > 300 then
                            v47.apps.DialogApp:dialog({
                                ["text"] = "This invitation expired a few minutes ago",
                                ["button"] = "Okay"
                            })
                            return
                        end
                        local v51, v52 = v47.apps.GuideArrowApp:navigate({
                            ["destination_id"] = "housing",
                            ["destination_house_owner"] = v48
                        })
                        if v52 == "HOUSE_OWNER_LEFT" then
                            v_u_39(v48)
                            return
                        end
                        if not v51 then
                            return
                        end
                        v47.apps.HintApp:hint({
                            ["text"] = "You\'ve arrived!",
                            ["overridable"] = true,
                            ["length"] = 2.5,
                            ["yields"] = false
                        })
                        wait(1)
                        local v53 = v_u_1("InteriorsM")
                        local v54 = false
                        while true do
                            local v55 = v53.get_current_location() or {}
                            if v55.destination_id ~= "housing" or v55.house_owner ~= v48 then
                                break
                            end
                            if not v54 then
                                local v56 = v48 and v48.Parent and (v48.Character and v48.Character:IsDescendantOf(workspace))
                                if v56 then
                                    v56 = v48.Character:FindFirstChild("Head")
                                end
                                local v57 = game.Players.LocalPlayer.Character
                                if v57 then
                                    v57 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                end
                                if v56 and (v57 and (v56.Position - v57.Position).magnitude < 13) then
                                    local v58 = v56.Position.Y - v57.Position.Y
                                    if math.abs(v58) < 7 then
                                        v47.apps.SpeechBubbleApp:create(v56, "Welcome " .. game.Players.LocalPlayer.Name .. " to my party!", {
                                            ["TextColor3"] = v_u_6.lookup("saturated")
                                        })
                                        v54 = true
                                    end
                                end
                            end
                            wait(0.2)
                        end
                        local v59 = v47.apps.DialogApp:dialog({
                            ["text"] = "How was " .. v48.Name .. "\'s party?",
                            ["left"] = "\226\152\185\239\184\143",
                            ["center"] = "\240\159\153\130",
                            ["right"] = "\240\159\152\129"
                        })
                        local v60 = nil
                        if v59 == "\226\152\185\239\184\143" then
                            v60 = "bad"
                        elseif v59 == "\240\159\153\130" then
                            v60 = "good"
                        elseif v59 == "\240\159\152\129" then
                            v60 = "great"
                        else
                            error("Invalid response")
                        end
                        v_u_2.get("HousingAPI/RateParty"):FireServer(v48, v60)
                    end
                end
            else
                return
            end
        else
            return
        end
    end)
    v_u_2.get("HousingAPI/AnimatedFurnitureExit").OnClientEvent:Connect(function(p61)
        local v62 = game.Players.LocalPlayer.Character
        local v63
        if v62 then
            v63 = v62:FindFirstChild("HumanoidRootPart")
        else
            v63 = v62
        end
        if v62 then
            v63.CFrame = p61
        end
    end)
end
return v_u_12