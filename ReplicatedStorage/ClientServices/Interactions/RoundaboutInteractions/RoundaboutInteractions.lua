--// ReplicatedStorage.ClientServices.Interactions.RoundaboutInteractions (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("InteractionsEngine")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("SimpleEvents")
local v_u_5 = v1("ClientData")
local v_u_6 = v1("UIManager")
local v_u_7 = v1("CaregiverAssistHelper")
local v_u_8 = v1("Maid")
local v_u_9 = game:GetService("CollectionService")
local v10 = {}
local v_u_11 = {}
local function v_u_29(p_u_12)
    while not p_u_12:IsDescendantOf(workspace) do
        p_u_12.AncestryChanged:Wait()
        if not p_u_12:IsDescendantOf(game) then
            return
        end
    end
    local v_u_13 = v_u_8.new()
    v_u_11[p_u_12] = v_u_13
    local v14 = p_u_12:WaitForChild("SpinInteraction")
    local v_u_15 = v14:WaitForChild("SpinUseBlockWeld")
    v_u_4.foreach_child_including_new(p_u_12, function(p16)
        if p16.Name == "SeatsSpinModel" then
            local v17 = p16:WaitForChild("Seats")
            v_u_4.foreach_child_including_new(v17, function(p_u_18)
                v_u_13:GiveTask(p_u_18.ChildAdded:Connect(function(p19)
                    local v20 = game.Players.LocalPlayer.Character
                    if p19.Name == "SeatWeld" and (v20 and (p19.Part1 and p19.Part1:IsDescendantOf(game.Players.LocalPlayer.Character))) then
                        v_u_15.Part0 = p_u_18
                        if not (v_u_5.get("boolean_flags") or {}).showed_roundabout_tutorial then
                            v_u_6.apps.DialogApp:dialog({
                                ["text"] = "Press the button to spin. Press it over and over to spin fast. Add some friends to spin even faster!",
                                ["button"] = "Okay"
                            })
                            v_u_3.get("SettingsAPI/SetBooleanFlag"):FireServer("showed_roundabout_tutorial", true)
                        end
                    end
                end))
                local function v_u_22(p_u_21)
                    return function()
                        v_u_3.get("ParkAPI/RoundaboutSit"):InvokeServer(p_u_12, p_u_21, p_u_18.Name)
                    end
                end
                v_u_13[p_u_18] = v_u_2:register({
                    ["part"] = p_u_18,
                    ["on_selected"] = function()
                        local v23 = {
                            ["caregiver_assist"] = true,
                            ["get_on_selected_callback"] = v_u_22,
                            ["get_passive_on_selected_callback"] = v_u_22
                        }
                        local v24, _ = v_u_7.get_choices(v23)
                        if #v24 == 1 and v24[1].text == "You" then
                            v24 = v24[1].on_selected or v24
                        end
                        return v24
                    end,
                    ["is_visible"] = function()
                        local v25 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart", true)
                        if v25 then
                            if not v25:GetRootPart():IsDescendantOf(p_u_12) then
                                local v26 = p_u_12
                                if v26 then
                                    v26 = p_u_12:FindFirstChild(p_u_18.Name, true)
                                end
                                if v26 then
                                    v26 = v26:FindFirstChild("SeatWeld")
                                end
                                if not v26 then
                                    return true
                                end
                            end
                        else
                            return
                        end
                    end,
                    ["use_text"] = "Sit"
                })
            end)
        end
    end)
    local v_u_27 = 0
    v_u_13.Spin = v_u_2:register({
        ["part"] = v14,
        ["on_selected"] = function()
            if tick() >= (v_u_27 or 0) then
                v_u_27 = tick() + 1
                v_u_3.get("ParkAPI/RoundaboutSpin"):FireServer(p_u_12)
            end
        end,
        ["is_visible"] = function()
            local v28 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart", true)
            if v28 then
                if v28:GetRootPart():IsDescendantOf(p_u_12) then
                    return true
                end
            end
        end,
        ["use_text"] = "Spin"
    })
end
local function v_u_32(p30)
    local v31 = v_u_11[p30]
    if v31 then
        v_u_11[p30] = nil
        v31:DoCleaning()
    end
end
function v10.init()
    v_u_4.foreach_tagged_including_new("Roundabout", v_u_29)
    v_u_9:GetInstanceRemovedSignal("Roundabout"):connect(v_u_32)
end
return v10