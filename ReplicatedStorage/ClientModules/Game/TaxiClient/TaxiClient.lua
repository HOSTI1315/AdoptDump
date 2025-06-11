--// ReplicatedStorage.ClientModules.Game.TaxiClient (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InteractionsEngine")
local v_u_3 = v1("ClientData")
local v_u_4 = v1("UIManager")
local v_u_5 = v1("RouterClient")
local v_u_6 = v1("SharedConstants")
local v_u_7 = v1("PolicyHelper")
local v_u_8 = v1("LiveOpsMapSwap")
local v_u_9 = v1("TaxiDestinationDB")
local v_u_10 = v1("new:NavigationHelper")
local v_u_11 = v1("Maid")
local v_u_12 = v1("ControlsDisabler")
local v_u_13 = v1("CharWrapperClient")
local v_u_14 = v1("package:Sift")
local v_u_15 = v1("package:t")
local v_u_16 = game:GetService("Players")
local v17 = game:GetService("ReplicatedStorage")
local v_u_18 = game:GetService("RunService")
local v19 = {}
local v_u_20 = nil
local v_u_21 = v17.Resources.Taxi.TaxiCircle:Clone()
local v_u_22 = nil
local function v_u_34(p_u_23)
    local v24 = p_u_23:WaitForChild("DriverInteractionPart", 5)
    if not v24 then
        return {}
    end
    local v_u_31 = {
        {
            ["text"] = "Set Price",
            ["on_selected"] = function()
                local v25, v26 = v_u_7.is_trading_prohibited(game.Players.LocalPlayer)
                if v25 then
                    v_u_4.apps.DialogApp:dialog({
                        ["text"] = v26,
                        ["button"] = "Okay"
                    })
                    return
                elseif p_u_23:GetAttribute("SelectingPlayersList") ~= "" then
                    v_u_4.apps.HintApp:hint({
                        ["text"] = "Cannot change the fare right now. A passenger is selecting a destination.",
                        ["length"] = 8,
                        ["yields"] = false,
                        ["overridable"] = true
                    })
                else
                    local v27, v28 = v_u_4.apps.DialogApp:free_response_dialog({
                        ["text"] = ("Enter price of the fare (limit is %d Bucks)"):format(v_u_6.taxi.fare_price_max),
                        ["left"] = "Cancel",
                        ["right"] = "Set"
                    })
                    if v27 == "Set" then
                        local v29 = tonumber(v28)
                        if not (v_u_15.integer(v29) and v_u_15.numberConstrained(v_u_6.taxi.fare_price_min, v_u_6.taxi.fare_price_max)(v29)) then
                            v_u_4.apps.HintApp:hint({
                                ["text"] = "You can\'t set the price to that",
                                ["length"] = 5,
                                ["yields"] = false,
                                ["overridable"] = true
                            })
                            return
                        end
                        v_u_5.get("VehicleAPI/SetTaxiFarePrice"):FireServer(v29)
                    end
                end
            end
        },
        {
            ["text"] = "View Earnings",
            ["on_selected"] = function()
                local v30 = v_u_3.get("taxi_manager").lifetime_earnings
                v_u_4.apps.HintApp:hint({
                    ["text"] = ("Lifetime earnings as a driver so far: %d Bucks."):format(v30),
                    ["length"] = 8,
                    ["yields"] = false,
                    ["overridable"] = true
                })
            end
        }
    }
    return { v_u_2:register({
            ["part"] = v24,
            ["text"] = "Options",
            ["on_selected"] = function()
                return v_u_31
            end,
            ["is_visible"] = function()
                local v32 = v_u_16.LocalPlayer.Character
                if v32 then
                    v32 = v_u_16.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
                end
                if not v32 then
                    return false
                end
                local v33 = v32.SeatPart
                return not (v33 and (v33:IsA("VehicleSeat") and v33:IsDescendantOf(p_u_23)))
            end
        }) }
end
local function v_u_44(p_u_35)
    if p_u_35:IsDescendantOf(workspace) and (not p_u_35:GetAttribute("IsTaxiOccupiedByPassenger") and (not p_u_35:FindFirstChild("VehicleSeat") or p_u_35.VehicleSeat:FindFirstChild("SeatWeld"))) then
        local v36 = v_u_11.new()
        v36:GiveTask(p_u_35:GetAttributeChangedSignal("IsOccupiedByPassenger"):Connect(function()
            v_u_4.apps.TaxiDestinationApp:cancel_destination_selection()
        end))
        v36:GiveTask(p_u_35.AncestryChanged:Connect(function()
            if not p_u_35:IsDescendantOf(workspace) then
                v_u_4.apps.TaxiDestinationApp:cancel_destination_selection()
            end
        end))
        local v_u_37 = p_u_35.VehicleSeat.SeatWeld
        v36:GiveTask(p_u_35.VehicleSeat.DescendantRemoving:Connect(function(p38)
            if p38 == v_u_37 then
                v_u_4.apps.TaxiDestinationApp:cancel_destination_selection()
            end
        end))
        v_u_4.apps.TaxiDestinationApp:set_fare_price(p_u_35:GetAttribute("FarePrice"))
        v36:GiveTask(p_u_35:GetAttributeChangedSignal("FarePrice"):Connect(function()
            v_u_4.apps.TaxiDestinationApp:set_fare_price(p_u_35:GetAttribute("FarePrice"))
        end))
        v36:GiveTask(v_u_18.Heartbeat:Connect(function()
            local v39 = v_u_13.get(v_u_16.LocalPlayer.Character)
            local v40
            if v39 then
                local v41 = v39.location.destination_id
                v40 = v41 == "MainMap" or v41 == "Neighborhood"
            else
                v40 = false
            end
            if not v40 then
                v_u_4.apps.TaxiDestinationApp:cancel_destination_selection()
            end
        end))
        local v42, v43 = v_u_4.apps.TaxiDestinationApp:select_destination(p_u_35)
        v36:Destroy()
        if v42 and v43 then
            v_u_5.get("VehicleAPI/RequestRide"):FireServer(v42, v43)
        else
            v_u_4.apps.HintApp:hint({
                ["text"] = "Destination selection cancelled.",
                ["length"] = 5,
                ["yields"] = false,
                ["overridable"] = true
            })
            v_u_5.get("VehicleAPI/CancelRequestRide"):FireServer()
        end
    else
        return
    end
end
local function v_u_55(p_u_45)
    local v46 = p_u_45:WaitForChild("PassengerInteractionPart", 5)
    return v46 and { v_u_2:register({
            ["part"] = v46,
            ["text"] = "Request Ride",
            ["on_selected"] = function()
                local v47 = p_u_45:GetAttribute("FarePrice")
                if v47 then
                    if v_u_3.get("money") < v47 then
                        v_u_4.apps.HintApp:hint({
                            ["text"] = ("You can\'t afford the fare for this vehicle! Fare is: %d Bucks."):format(v47),
                            ["length"] = 5,
                            ["yields"] = false,
                            ["overridable"] = true
                        })
                        return
                    else
                        local v48 = v_u_3.get("taxi_manager").last_ride_finished_time
                        local v49 = workspace:GetServerTimeNow() - v48
                        if v49 < v_u_6.taxi.ride_start_timeout then
                            local v50 = v_u_6.taxi.ride_start_timeout - v49
                            local v51 = math.ceil(v50)
                            v_u_4.apps.HintApp:hint({
                                ["text"] = ("You must wait %d seconds before you can hail another vehicle."):format(v51),
                                ["length"] = 5,
                                ["yields"] = false,
                                ["overridable"] = true
                            })
                        elseif v_u_5.get("VehicleAPI/StartRequestRide"):InvokeServer(p_u_45) then
                            v_u_44(p_u_45)
                        end
                    end
                else
                    return
                end
            end,
            ["is_visible"] = function()
                if not v_u_20 and (not p_u_45:GetAttribute("IsTaxiOccupiedByPassenger") and (not p_u_45:FindFirstChild("VehicleSeat") or p_u_45.VehicleSeat:FindFirstChild("SeatWeld"))) then
                    local v52 = v_u_13.get(v_u_16.LocalPlayer.Character)
                    local v53
                    if v52 then
                        local v54 = v52.location.destination_id
                        v53 = v54 == "MainMap" or v54 == "Neighborhood"
                    else
                        v53 = false
                    end
                    if v53 then
                        return true
                    end
                end
                return false
            end
        }) } or {}
end
function v19.setup_interactions(p56)
    local v57 = p56:WaitForChild("VehicleOwner", 5)
    if not v57 then
        return {}
    end
    if v57.Value ~= v_u_16.LocalPlayer then
        return v_u_55(p56)
    end
    local v58 = v_u_34(p56)
    if v_u_6.taxi.debug_allow_driver_to_be_own_passenger then
        local v59 = v_u_55(p56)
        v58 = v_u_14.List.concat(v58, v59)
    end
    return v58
end
local function v_u_80(p60, p_u_61)
    local v62 = nil
    if p60 == "MainMap" then
        local v_u_63 = v_u_9[p_u_61].interior_name
        local function v_u_66()
            local v64 = v_u_8.get_full_interior_name(v_u_63)
            local v65 = workspace.Interiors:FindFirstChild(v64)
            if v65 then
                return v65:FindFirstChild("TaxiLocations", true):FindFirstChild(p_u_61).Position
            end
        end
        task.spawn(function()
            v_u_4.apps.GuideArrowApp:navigate(v_u_63, v_u_66, function()
                return false
            end, true, "Taxi")
        end)
        v62 = v_u_66
    elseif p60 == "Friends" then
        local function v_u_75()
            local v67 = v_u_16:GetPlayerByUserId(p_u_61)
            if v67 then
                local v68 = v_u_10.get_house_location_for_player(v67)
                local v69 = v_u_8.get_full_interior_name(v68)
                if workspace.Interiors:FindFirstChild(v69) then
                    local v70 = v_u_10.get_house_exterior_for_player(v67)
                    if v70 then
                        local v71 = v70:GetChildren()[1]:FindFirstChild("Plot")
                        if v71 then
                            local v72 = v71.CFrame
                            local v73 = v71.Size.Y / 2
                            local v74 = -v71.Size.Z / 2 - 6
                            return v72 * Vector3.new(0, v73, v74)
                        end
                    end
                else
                    return
                end
            else
                return
            end
        end
        local v_u_76 = nil
        local v_u_77 = v_u_20
        task.spawn(function()
            while v_u_20 == v_u_77 do
                local v78 = v_u_16:GetPlayerByUserId(p_u_61)
                if not v78 then
                    v_u_4.apps.GuideArrowApp:cancel_navigation("Taxi")
                    return
                end
                local v79 = v_u_10.get_house_location_for_player(v78)
                if v_u_76 ~= v79 then
                    v_u_76 = v79
                    v_u_4.apps.GuideArrowApp:cancel_navigation("Taxi")
                    v_u_4.apps.GuideArrowApp:navigate(v79, v_u_75, function()
                        return false
                    end, true, "Taxi")
                end
                task.wait(1)
            end
            v_u_4.apps.GuideArrowApp:cancel_navigation("Taxi")
        end)
        v62 = v_u_75
    end
    return v62
end
local function v_u_92(p_u_81)
    local v82 = p_u_81.destination_type
    local v83 = p_u_81.destination_key
    v_u_12.disable_controls("Taxi")
    local v_u_84 = false
    local v87 = {
        ["priority"] = 1,
        ["text"] = "Exit Ride",
        ["mouse_button1_click"] = function()
            if not v_u_84 then
                v_u_84 = true
                v_u_4.apps.HintApp:hint({
                    ["text"] = "Exiting Ride...",
                    ["length"] = v_u_6.taxi.passenger_exit_ride_delay,
                    ["yields"] = false,
                    ["overridable"] = true
                })
                task.wait(v_u_6.taxi.passenger_exit_ride_delay)
                if p_u_81 == v_u_20 then
                    local v85 = v_u_16.LocalPlayer.Character
                    local v86
                    if v85 then
                        v86 = v85:FindFirstChildOfClass("Humanoid")
                    else
                        v86 = nil
                    end
                    if v86 then
                        v86.Jump = true
                    end
                end
            end
        end
    }
    v_u_22 = v_u_4.apps.ExtraButtonsApp:register_button(v87)
    v_u_22:show()
    local v_u_88 = v_u_80(v82, v83)
    task.spawn(function()
        while v_u_20 == p_u_81 do
            local v89 = v_u_88()
            if v89 then
                v_u_21.Parent = workspace
                local v90 = v_u_21
                local v91 = v_u_21.Size.X / 2
                v90.Position = v89 + Vector3.new(0, v91, 0)
                if v_u_16.LocalPlayer:DistanceFromCharacter(v89) < v_u_6.taxi.distance_threshold then
                    v_u_5.get("VehicleAPI/CompleteRide"):FireServer()
                    v_u_21.Parent = nil
                    return
                end
            else
                v_u_21.Parent = nil
            end
            task.wait()
        end
        v_u_21.Parent = nil
    end)
end
function v19.init()
    v_u_5.get("VehicleAPI/RideStarted").OnClientEvent:Connect(function(p_u_93)
        local v94 = p_u_93.driver
        local v95 = p_u_93.passenger
        v_u_20 = p_u_93
        if v95 == v_u_16.LocalPlayer then
            v_u_92(p_u_93)
        elseif v94 == v_u_16.LocalPlayer then
            local v_u_96 = v_u_80(p_u_93.destination_type, p_u_93.destination_key)
            task.spawn(function()
                while v_u_20 == p_u_93 do
                    local v97 = v_u_96()
                    if v97 then
                        v_u_21.Parent = workspace
                        local v98 = v_u_21
                        local v99 = v_u_21.Size.X / 2
                        v98.Position = v97 + Vector3.new(0, v99, 0)
                    else
                        v_u_21.Parent = nil
                    end
                    task.wait()
                end
                v_u_21.Parent = nil
            end)
        end
        v_u_4.apps.TaxiTimerApp:start_ride(p_u_93)
    end)
    v_u_5.get("VehicleAPI/RideFinished").OnClientEvent:Connect(function(p100)
        if v_u_20 then
            v_u_4.apps.GuideArrowApp:cancel_navigation("Taxi")
            v_u_4.apps.TaxiTimerApp:stop_ride()
            if v_u_20.driver == v_u_16.LocalPlayer then
                if p100 > 0 then
                    task.spawn(function()
                        v_u_4.apps.SpecialEffectsApp:sprout_currency(v_u_16.LocalPlayer, "small")
                    end)
                end
            elseif v_u_20.passenger == v_u_16.LocalPlayer then
                v_u_12.enable_controls("Taxi")
                v_u_4.apps.ExtraButtonsApp:unregister_button(v_u_22)
            end
            v_u_22 = nil
            v_u_20 = nil
        end
    end)
end
return v19