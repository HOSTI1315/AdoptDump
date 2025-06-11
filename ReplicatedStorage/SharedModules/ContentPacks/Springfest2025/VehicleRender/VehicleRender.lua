--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.VehicleRender (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v7 = {
    ["spring_2025_powerbike"] = {
        ["server"] = function(_, p2, _, p3)
            local v_u_4 = p2:WaitForChild("VehicleSeat")
            local v_u_5 = p2:FindFirstChild("Visual"):FindFirstChild("Body"):FindFirstChild("BackLight"):FindFirstChild("LightTrail")
            p3:GiveTask(v_u_1.Heartbeat:Connect(function(_)
                local v6 = v_u_4.AssemblyLinearVelocity
                v_u_5.Enabled = -v_u_4.CFrame:VectorToObjectSpace(v6).Z > 0
            end))
        end
    }
}
return v7