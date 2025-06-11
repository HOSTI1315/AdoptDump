--// ReplicatedStorage.SharedModules.SharedDB.VehicleDB.VehicleRender.CommonVehicleRender (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
v_u_1("EquippedPets")
require(game.ReplicatedStorage.new.modules.Explorer)
local v_u_2 = game:GetService("Players")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("CollectionService")
local v30 = {
    ["boat_spray"] = {
        ["client"] = function(p5, p6, p7, p8)
            if v_u_2.LocalPlayer ~= p5 then
                local v_u_9 = v_u_1("BoatVehicle").animator.new(p6, p7)
                p8:GiveTask(v_u_3.PostSimulation:Connect(function(p10)
                    v_u_9:update(p10)
                end))
                p8:GiveTask(function()
                    v_u_9:destroy()
                end)
            end
        end
    },
    ["mount_animate"] = {
        ["client"] = function(p11, p12, p13, p14)
            if v_u_2.LocalPlayer ~= p11 then
                local v_u_15 = v_u_1("MountVehicle").animator.new(p12, p13)
                p14:GiveTask(v_u_3.PostSimulation:Connect(function(p16)
                    v_u_15:update(p16)
                end))
                p14:GiveTask(function()
                    v_u_15:destroy()
                end)
            end
        end
    },
    ["rgb_animate"] = {
        ["client"] = function(_, p_u_17, _, p18)
            local v_u_19 = nil
            local function v25()
                if v_u_19 then
                    v_u_19:Disconnect()
                    v_u_19 = nil
                end
                local v_u_20 = {}
                for _, v21 in p_u_17:GetDescendants() do
                    if v21:IsA("BasePart") and v21.Name == "AnimateRGB" then
                        table.insert(v_u_20, v21)
                    end
                end
                v_u_19 = v_u_3.PostSimulation:Connect(function()
                    local v22 = os.clock() / 5 % 1
                    local v23 = Color3.fromHSV(v22, 1, 1)
                    for _, v24 in v_u_20 do
                        v24.Color = v23
                    end
                end)
            end
            v25()
            p18:GiveTask(p_u_17.DescendantAdded:Connect(v25))
            p18:GiveTask(p_u_17.DescendantRemoving:Connect(v25))
            p18:GiveTask(function()
                if v_u_19 then
                    v_u_19:Disconnect()
                    v_u_19 = nil
                end
            end)
        end
    },
    ["taxi"] = {
        ["server"] = function(p26, p27, _, _)
            v_u_1("TaxiServer").on_taxi_spawned(p26, p27)
            local v28 = p27:FindFirstChild("PassengerSeats")
            if v28 then
                for _, v29 in v28:GetChildren() do
                    v_u_4:AddTag(v29, "NoInteractionSeat")
                end
            end
        end
    }
}
return v30