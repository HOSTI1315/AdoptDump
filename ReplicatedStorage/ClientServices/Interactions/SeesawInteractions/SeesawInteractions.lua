--// ReplicatedStorage.ClientServices.Interactions.SeesawInteractions (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("CaregiverAssistHelper")
local v_u_3 = v1("InteractionsEngine")
local v_u_4 = v1("PetPerformanceName")
local v_u_5 = v1("StateManagerClient")
local v_u_6 = v1("CharWrapperClient")
local v_u_7 = v1("PetEntityManager")
local v_u_8 = v1("PetEntityHelper")
local v_u_9 = v1("new:StreamingHelper")
local v_u_10 = v1("RouterClient")
local v_u_11 = v1("SimpleEvents")
local v_u_12 = v1("Maid")
local v_u_13 = game:GetService("CollectionService")
local v_u_14 = v1("Debug").create_debug_log("Networked", false)
local v15 = {}
local v_u_16 = {}
local function v_u_36(p_u_17)
    while not p_u_17:IsDescendantOf(workspace) do
        p_u_17.AncestryChanged:Wait()
        if not p_u_17:IsDescendantOf(game) then
            return
        end
    end
    local v18 = v_u_12.new()
    v_u_16[p_u_17] = v18
    local v19 = p_u_17:WaitForChild("Seats")
    local v20 = p_u_17:WaitForChild("SawRoot")
    for _, v21 in ipairs({ "Seat1", "Seat2" }) do
        local v_u_22 = v19:WaitForChild(v21, true)
        local v_u_23 = v20:WaitForChild(v21 .. "Force", true)
        v18:GiveTask(v_u_22:GetPropertyChangedSignal("ThrottleFloat"):Connect(function()
            local v24 = v_u_23
            local v25 = 3200 * v_u_22.ThrottleFloat
            v24.Force = Vector3.new(0, v25, 0)
        end))
        local function v_u_31(p_u_26)
            return function()
                local v27 = v_u_5.get(p_u_26)
                if v_u_6.is_non_player(p_u_26) then
                    if v27.player == game.Players.LocalPlayer then
                        v_u_10.get("ParkAPI/SeesawExitStates"):InvokeServer(p_u_17, p_u_26)
                        local v28 = v_u_7.get_pet_entity(p_u_26)
                        local v29 = v_u_8.stage_performance
                        local v30 = {
                            ["name"] = v_u_4.Seesaw,
                            ["options"] = {
                                ["seesaw"] = p_u_17
                            }
                        }
                        v29(v28, v30)
                    else
                        v_u_14("Sending RequestSeesawEnterPerformanceForOtherClient(", p_u_17, p_u_26, ")")
                        v_u_10.get("ParkAPI/RequestSeesawEnterPerformanceForOtherClient"):FireServer(p_u_17, p_u_26)
                    end
                else
                    v_u_10.get("ParkAPI/SeesawEnterSeat"):InvokeServer(p_u_17, p_u_26, v_u_22)
                    return
                end
            end
        end
        v18[v_u_22] = v_u_3:register({
            ["part"] = v_u_22,
            ["on_selected"] = function()
                local v32 = {
                    ["caregiver_assist"] = true,
                    ["get_on_selected_callback"] = v_u_31,
                    ["get_passive_on_selected_callback"] = v_u_31
                }
                local v33, _ = v_u_2.get_choices(v32)
                if #v33 == 1 and v33[1].text == "You" then
                    v33 = v33[1].on_selected or v33
                end
                return v33
            end,
            ["is_visible"] = function()
                local v34 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart", true)
                if v34 then
                    if not v34:GetRootPart():IsDescendantOf(p_u_17) then
                        local v35 = p_u_17
                        if v35 then
                            v35 = p_u_17:FindFirstChild(v_u_22.Name, true)
                        end
                        if v35 then
                            v35 = v35:FindFirstChild("SeatWeld")
                        end
                        if not v35 then
                            return true
                        end
                    end
                else
                    return
                end
            end,
            ["use_text"] = "Sit"
        })
    end
end
local function v_u_39(p37)
    local v38 = v_u_16[p37]
    if v38 then
        v_u_16[p37] = nil
        v38:DoCleaning()
    end
end
function v15.init()
    v_u_11.foreach_tagged_including_new("Seesaw", v_u_36)
    v_u_13:GetInstanceRemovedSignal("Seesaw"):Connect(v_u_39)
    v_u_10.get("ParkAPI/SeesawEnterPerformanceForOtherClient").OnClientEvent:Connect(function(p40, p41)
        local v42, v43 = v_u_9.await_many(5, p40, p41)
        if v42 and v43 then
            v_u_14("Received SeesawEnterPerformanceForOtherClient(", v42, v43, ")")
            local v44 = v_u_7.get_pet_entity(v43)
            local v45 = v_u_8.stage_performance
            local v46 = {
                ["name"] = v_u_4.Seesaw,
                ["options"] = {
                    ["seesaw"] = v42
                }
            }
            v45(v44, v46)
        end
    end)
end
return v15