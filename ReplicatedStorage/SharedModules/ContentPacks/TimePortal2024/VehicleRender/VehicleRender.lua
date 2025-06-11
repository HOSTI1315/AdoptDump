--// ReplicatedStorage.SharedModules.ContentPacks.TimePortal2024.VehicleRender (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v20 = {
    ["time_portal_2024_clock"] = {
        ["client"] = function(_, p2, _, p3)
            local v_u_4 = p2:WaitForChild("VehicleSeat")
            local v_u_5 = p2:WaitForChild("VisualWheels"):WaitForChild("BackWheelComplex"):WaitForChild("TargetSeat")
            local v6 = p2:WaitForChild("NoWeld")
            local v_u_7 = v6:WaitForChild("Hour"):WaitForChild("HandMotor")
            local v_u_8 = v6:WaitForChild("Minute"):WaitForChild("HandMotor")
            p3:GiveTask(v_u_1.Stepped:Connect(function()
                local v9 = v_u_4
                if v9 then
                    v9 = v_u_4:FindFirstChild("SeatWeld")
                end
                local v10 = v9 and (v9.Part1 and v9.Part1.Parent)
                if v10 then
                    v10 = v9.Part1.Parent:FindFirstChild("LowerTorso")
                end
                if v10 then
                    v10 = v10:FindFirstChild("Root")
                end
                if v10 and v10.Part0 then
                    local v11 = v_u_5.CFrame * v9.C0 * v10.C0 * v10.Transform * v10.C1:Inverse()
                    v10.Transform = (v10.Part0.CFrame * v10.C0):Inverse() * v11 * v10.C1
                end
                local v12 = DateTime.now():ToLocalTime()
                local v13 = v12.Hour * 3600 + v12.Minute * 60 + v12.Second + v12.Millisecond / 1000
                local v14 = v13 / 3600
                local v15 = math.floor(v14)
                local v16 = v13 - v15 * 3600
                local v17 = v16 / 60
                local v18 = math.floor(v17)
                local v19 = v16 - v18 * 60
                v_u_7.C0 = CFrame.fromEulerAnglesXYZ(0, 0, (v15 + v16 / 3600) * 0.5235987755982988)
                v_u_8.C0 = CFrame.fromEulerAnglesXYZ(0, 0, (v18 + v19 / 60) * 0.10471975511965978)
            end))
        end
    }
}
return v20