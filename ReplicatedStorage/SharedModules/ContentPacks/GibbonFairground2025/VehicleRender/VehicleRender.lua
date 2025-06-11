--// ReplicatedStorage.SharedModules.ContentPacks.GibbonFairground2025.VehicleRender (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v13 = {
    ["gibbon_2025_teacup_vehicle"] = {
        ["client"] = function(_, p2, _, p3)
            local v_u_4 = p2:WaitForChild("VehicleSeat")
            local v_u_5 = p2:WaitForChild("SeatTarget")
            local v_u_6 = v_u_4:WaitForChild("SpinJoint")
            local v_u_7 = 0
            p3:GiveTask(v_u_1.Stepped:Connect(function(_, p8)
                local v9 = v_u_4
                if v9 then
                    v9 = v_u_4:FindFirstChild("SeatWeld")
                end
                local v10 = v9 and v9.Part1
                if v10 then
                    v10 = v9.Part1.Parent
                end
                if v10 then
                    v_u_7 = v_u_7 + p8 * 1.8849555921538759
                    v_u_7 = v_u_7 % 6.283185307179586
                    v_u_6.Transform = CFrame.Angles(0, v_u_7, 0)
                    local v11 = v10:FindFirstChild("LowerTorso")
                    if v11 then
                        v11 = v11:FindFirstChild("Root")
                    end
                    if v11 and v11.Part0 then
                        local v12 = v_u_5.CFrame * v9.C0 * v11.C0 * v11.Transform * v11.C1:Inverse()
                        v11.Transform = (v11.Part0.CFrame * v11.C0):ToObjectSpace(v12 * v11.C1)
                    end
                end
            end))
        end
    }
}
return v13