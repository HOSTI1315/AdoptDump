--// ReplicatedStorage.ClientServices.Interactions.VehicleInteractions (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("CaregiverAssistHelper")
local v_u_3 = v_u_1("ClientData")
local v_u_4 = v_u_1("CharWrapperClient")
local v_u_5 = v_u_1("FamilyHelper")
local v_u_6 = v_u_1("InteractionsEngine")
local v_u_7 = v_u_1("PolicyHelper")
local v_u_8 = v_u_1("RouterClient")
local v_u_9 = v_u_1("SeatUtil")
local v_u_10 = v_u_1("TaxiClient")
local v_u_11 = v_u_1("UIManager")
local v_u_12 = v_u_1("package:Sift")
local v_u_13 = game:GetService("Players")
local v_u_14 = game:GetService("RunService"):IsStudio() and false
local v15 = {}
local v_u_16 = game:GetService("CollectionService")
local v_u_17 = nil
local v_u_18 = 0
local function v_u_24()
    local v19 = v_u_3.get("vehicle")
    if not (v19 and v19:FindFirstChild("VehicleSeat")) then
        return false
    end
    if tick() - v_u_18 < 0.1 then
        return v_u_17
    end
    local v20 = {
        ["exclude_player"] = not v_u_14,
        ["caregiver_assist"] = true
    }
    local v21 = v_u_2.get_choices(v20)
    local v_u_22 = v19.VehicleSeat:GetRootPart()
    v_u_17 = #v_u_12.List.filter(v21, function(p23)
        return p23.character:FindFirstChild("HumanoidRootPart"):GetRootPart() ~= v_u_22
    end) > 0
    v_u_18 = tick()
    return v_u_17
end
local function v_u_44(p_u_25)
    if not v_u_16:HasTag(p_u_25, "NoInteractionSeat") then
        local function v_u_29(p_u_26)
            return function()
                local v27 = p_u_26
                local v28 = v_u_1("PetEntityManager").get_pet_entity(v27)
                if not v28 and true or not v28.modifier_values_from_performances.dont_allow_sit_states then
                    v_u_8.get("VehicleAPI/SitInVehicle"):InvokeServer(p_u_26, p_u_25)
                else
                    v_u_11.apps.HintApp:hint({
                        ["text"] = "Your pet can\'t sit here right now!",
                        ["yields"] = false
                    })
                end
            end
        end
        local v30 = p_u_25:GetAttribute("TeamWhitelist")
        local v_u_31
        if v30 then
            v_u_31 = string.split(v30, ",")
        else
            v_u_31 = nil
        end
        return { (v_u_6:register({
                ["text"] = p_u_25:IsA("VehicleSeat") and "Control" or "Sit",
                ["part"] = p_u_25,
                ["on_selected"] = function()
                    local v32 = v_u_3.get("vehicle")
                    if v32 then
                        v32 = p_u_25:IsDescendantOf(v32)
                    end
                    local v33
                    if v32 then
                        if p_u_25:IsA("VehicleSeat") then
                            local v_u_34 = v_u_13.LocalPlayer.Character
                            return function()
                                local v35 = v_u_34
                                local v36 = v_u_1("PetEntityManager").get_pet_entity(v35)
                                if not v36 and true or not v36.modifier_values_from_performances.dont_allow_sit_states then
                                    v_u_8.get("VehicleAPI/SitInVehicle"):InvokeServer(v_u_34, p_u_25)
                                else
                                    v_u_11.apps.HintApp:hint({
                                        ["text"] = "Your pet can\'t sit here right now!",
                                        ["yields"] = false
                                    })
                                end
                            end
                        end
                        local v37 = {
                            ["exclude_player"] = not v_u_14,
                            ["caregiver_assist"] = true,
                            ["get_on_selected_callback"] = v_u_29,
                            ["get_passive_on_selected_callback"] = v_u_29,
                            ["team_whitelist"] = v_u_31
                        }
                        v33 = v_u_2.get_choices(v37)
                    else
                        if p_u_25:IsA("VehicleSeat") then
                            return nil
                        end
                        local v38 = {
                            ["exclude_player"] = false,
                            ["caregiver_assist"] = true,
                            ["get_on_selected_callback"] = v_u_29,
                            ["get_passive_on_selected_callback"] = v_u_29,
                            ["team_whitelist"] = v_u_31
                        }
                        v33 = v_u_2.get_choices(v38)
                    end
                    local v_u_39 = p_u_25:GetRootPart()
                    v_u_12.List.filter(v33, function(p40)
                        return p40.character:FindFirstChild("HumanoidRootPart"):GetRootPart() ~= v_u_39
                    end)
                    if #v33 == 1 then
                        return v33[1].on_selected
                    else
                        return v33
                    end
                end,
                ["is_visible"] = function()
                    if p_u_25:IsDescendantOf(workspace) then
                        local v41 = game.Players.LocalPlayer.Character
                        if v41 then
                            v41 = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                        end
                        if v41 then
                            local v42 = v_u_3.get("vehicle")
                            local v43
                            if v42 then
                                v43 = p_u_25:IsDescendantOf(v42)
                            else
                                v43 = v42
                            end
                            if v_u_9.get_occupant(p_u_25) then
                                return false
                            elseif v41.Sit then
                                return false
                            elseif v43 then
                                return p_u_25:IsA("VehicleSeat") and true or (v42.Name == "HouseCar" and true or v_u_24())
                            else
                                return not p_u_25:IsA("VehicleSeat")
                            end
                        else
                            return false
                        end
                    else
                        return false
                    end
                end
            })) }
    end
end
local function v_u_70(p_u_45)
    local v46 = {}
    local v_u_47 = p_u_45:WaitForChild("IceCreamTruckHorn")
    local v48 = v_u_6
    local v52 = {
        ["text"] = "Play Music",
        ["part"] = v_u_47,
        ["on_selected"] = function()
            if v_u_3.get("vehicle") then
                if not v_u_8.get("VehicleAPI/StartIceCreamTruckHorn"):InvokeServer() then
                end
            else
                return
            end
        end,
        ["is_visible"] = function()
            local v49 = game.Players.LocalPlayer.Character
            if v49 then
                v49 = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
            end
            if v49 then
                local v50 = v_u_3.get("vehicle")
                if v50 and v_u_47:IsDescendantOf(v50) then
                    local v51 = v49.SeatPart
                    if v51 and (v51:IsA("VehicleSeat") and v51:IsDescendantOf(v50)) then
                        return v_u_47:IsDescendantOf(workspace) and true or false
                    else
                        return false
                    end
                else
                    return false
                end
            else
                return false
            end
        end
    }
    table.insert(v46, v48:register(v52))
    local v_u_53 = p_u_45:WaitForChild("VehicleOwner").Value
    local v_u_54 = v_u_53 == game.Players.LocalPlayer
    for _, v_u_55 in ipairs(p_u_45:GetChildren()) do
        if v_u_55.Name == "IceCreamTruckBuy" then
            local v56 = v_u_6
            local v69 = {
                ["text"] = function()
                    if p_u_45:FindFirstChild("Price") then
                        return v_u_54 and "Set Price" or "Buy Ice Cream ($" .. p_u_45.Price.Value .. ")"
                    end
                end,
                ["part"] = v_u_55,
                ["on_selected"] = function()
                    if v_u_54 then
                        local v57, v58 = v_u_7.is_trading_prohibited(game.Players.LocalPlayer)
                        if v57 then
                            v_u_11.apps.DialogApp:dialog({
                                ["text"] = v58,
                                ["button"] = "Okay"
                            })
                            return
                        end
                        local v59, v60 = v_u_11.apps.DialogApp:free_response_dialog({
                            ["text"] = "Enter price of ice cream (limit is $20)",
                            ["left"] = "Cancel",
                            ["right"] = "Set"
                        })
                        local v61 = tonumber(v60)
                        if v59 == "Set" and v61 ~= nil then
                            local v_u_62 = math.floor(v61)
                            local v_u_63 = v_u_8.get("VehicleAPI/SetIceCreamConePrice"):InvokeServer(v_u_62)
                            spawn(function()
                                if v_u_63 then
                                    v_u_11.apps.HintApp:hint({
                                        ["text"] = "Price was set to $" .. v_u_62 .. "!"
                                    })
                                else
                                    v_u_11.apps.HintApp:hint({
                                        ["text"] = "You can\'t set the price to that"
                                    })
                                end
                            end)
                        end
                    else
                        local v64 = p_u_45.Price.Value
                        if v64 ~= 0 then
                            local v65, v66 = v_u_7.is_trading_prohibited(game.Players.LocalPlayer)
                            if v65 then
                                v_u_11.apps.DialogApp:dialog({
                                    ["text"] = v66,
                                    ["button"] = "Okay"
                                })
                                return
                            end
                        end
                        if v_u_11.apps.DialogApp:dialog({
                            ["text"] = "Buy ice cream from " .. v_u_53.Name .. " for $" .. v64 .. "?",
                            ["right"] = "Buy",
                            ["left"] = "Cancel"
                        }) == "Buy" then
                            v_u_8.get("VehicleAPI/BuyIceCreamCone"):InvokeServer(v_u_53)
                            return
                        end
                    end
                end,
                ["is_visible"] = function()
                    if not v_u_54 then
                        return true
                    end
                    local v67 = game.Players.LocalPlayer.Character
                    if v67 then
                        v67 = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                    end
                    if not v67 then
                        return true
                    end
                    local v68 = v67.SeatPart
                    return not (v68 and (v68:IsA("VehicleSeat") and v68:IsDescendantOf(v_u_55.Parent)))
                end
            }
            table.insert(v46, v56:register(v69))
        end
    end
    p_u_45.NamePart.SurfaceGui.TextLabel.Text = p_u_45.VehicleOwner.Value.Name
    p_u_45:WaitForChild("Price").Changed:Connect(function()
        p_u_45.PricePart.SurfaceGui.TextLabel.Text = "Ice Cream - $" .. p_u_45.Price.Value
    end)
    p_u_45.PricePart.SurfaceGui.TextLabel.Text = "Ice Cream - $" .. p_u_45.Price.Value
    return v46
end
local function v_u_72(p71)
    return v_u_10.setup_interactions(p71)
end
local function v_u_79(p_u_73)
    local v_u_74 = p_u_73:WaitForChild("BackDoor"):WaitForChild("Door")
    p_u_73:WaitForChild("BackDoor"):WaitForChild("BackHinges")
    local v75 = {}
    local v76 = v_u_6
    local v78 = {
        ["text"] = function()
            return v_u_74.Transparency == 1 and "Close" or "Open"
        end,
        ["part"] = p_u_73:WaitForChild("BackDoor"):WaitForChild("Handle"),
        ["on_selected"] = function()
            local v77 = v_u_74.Transparency == 1
            v_u_8.get("VehicleAPI/TruckDoorSetIsOpen"):InvokeServer(p_u_73, not v77)
        end
    }
    table.insert(v75, v76:register(v78))
    return v75
end
local function v_u_98(p_u_80)
    local function v_u_87(p_u_81)
        return function()
            local v82 = p_u_81
            local v83 = v_u_1("PetEntityManager").get_pet_entity(v82)
            if not v83 and true or not v83.modifier_values_from_performances.dont_allow_sit_states then
                local v84 = p_u_80:FindFirstAncestorWhichIsA("Tool")
                local v85 = v_u_4.get(v84.Parent)
                local v86
                if v85 then
                    v86 = v85.player
                else
                    v86 = nil
                end
                v_u_8.get("AdoptAPI/UseStroller"):InvokeServer(v86, p_u_81, p_u_80)
            else
                v_u_11.apps.HintApp:hint({
                    ["text"] = "Your pet can\'t sit here right now!",
                    ["yields"] = false
                })
            end
        end
    end
    return { (v_u_6:register({
            ["text"] = "Sit",
            ["part"] = p_u_80,
            ["on_selected"] = function()
                local v88 = p_u_80:FindFirstAncestorWhichIsA("Tool")
                local v89 = v_u_4.get(v88.Parent)
                local v90
                if v89 then
                    v90 = v89.player
                else
                    v90 = nil
                end
                local v91 = v_u_2.get_choices({
                    ["caregiver_assist"] = true,
                    ["exclude_player"] = v90 == game.Players.LocalPlayer,
                    ["get_on_selected_callback"] = v_u_87,
                    ["get_passive_on_selected_callback"] = v_u_87,
                    ["team_whitelist"] = { "Pets", "Babies", "Dolls" }
                })
                if next(v91) then
                    if #v91 == 1 then
                        return v91[1].on_selected
                    else
                        return v91
                    end
                else
                    v_u_11.apps.HintApp:hint({
                        ["text"] = "Only Babies and Pets can use this.",
                        ["overridable"] = true,
                        ["yields"] = false
                    })
                    return nil
                end
            end,
            ["is_visible"] = function()
                if p_u_80:IsDescendantOf(workspace) then
                    local v92 = game.Players.LocalPlayer.Character
                    if v92 then
                        v92 = v92:FindFirstChild("Humanoid")
                    end
                    if v92 then
                        local v93 = p_u_80
                        local v94 = p_u_80:FindFirstChild("SitPos") or v93
                        if v_u_9.get_occupant(v94) then
                            return false
                        else
                            local v95 = p_u_80:FindFirstAncestorWhichIsA("Tool")
                            local v96 = v_u_4.get(v95.Parent)
                            local v97
                            if v96 then
                                v97 = v96.player
                            else
                                v97 = nil
                            end
                            if v97 then
                                return v_u_5.is_my_friend_or_family(v97)
                            else
                                return false
                            end
                        end
                    else
                        return false
                    end
                else
                    return false
                end
            end
        })) }
end
local function v_u_104(p_u_99)
    local function v_u_100()
        return function()
            v_u_8.get("AdoptAPI/SitOnFloat"):InvokeServer(p_u_99)
        end
    end
    return { (v_u_6:register({
            ["text"] = "Sit",
            ["part"] = p_u_99,
            ["on_selected"] = function()
                local v101 = {
                    ["caregiver_assist"] = false,
                    ["get_on_selected_callback"] = v_u_100,
                    ["get_passive_on_selected_callback"] = v_u_100
                }
                local v102 = v_u_2.get_choices(v101)
                if #v102 == 1 then
                    return v102[1].on_selected
                else
                    return v102
                end
            end,
            ["is_visible"] = function()
                if p_u_99:IsDescendantOf(workspace) then
                    local v103 = game.Players.LocalPlayer.Character
                    if v103 then
                        v103 = v103:FindFirstChild("Humanoid")
                    end
                    if v103 then
                        if v103.Sit then
                            return false
                        else
                            return not v_u_9.get_occupant(p_u_99)
                        end
                    else
                        return false
                    end
                else
                    return false
                end
            end
        })) }
end
local function v_u_112(p105, p_u_106)
    local v_u_107 = {}
    v_u_16:GetInstanceAddedSignal(p105):connect(function(p108)
        v_u_107[p108] = p_u_106(p108)
    end)
    for _, v109 in ipairs(v_u_16:GetTagged(p105)) do
        v_u_107[v109] = p_u_106(v109)
    end
    v_u_16:GetInstanceRemovedSignal(p105):connect(function(p110)
        if v_u_107[p110] then
            for _, v111 in ipairs(v_u_107[p110]) do
                v111:destroy()
            end
            v_u_107[p110] = nil
        end
    end)
end
function v15.init()
    v_u_112("TransportSeat", v_u_44)
    v_u_112("IceCreamTruck", v_u_70)
    v_u_112("Taxi", v_u_72)
    v_u_112("MovingTruck", v_u_79)
    v_u_112("StrollerSeat", v_u_98)
    v_u_112("FloatSeat", v_u_104)
end
return v15