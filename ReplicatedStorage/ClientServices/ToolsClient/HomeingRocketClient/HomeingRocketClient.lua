--// ReplicatedStorage.ClientServices.ToolsClient.HomeingRocketClient (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("RouterClient")
local v_u_3 = v1("UIManager")
local v_u_4 = game:GetService("RunService")
local v_u_5 = v1("SoundPlayer")
local v_u_6 = v1("GameplayFX")
local v_u_7 = v1("new:StreamingHelper")
local v_u_8 = require(game.ReplicatedStorage.new.modules.RaycastHelper)
return {
    ["init"] = function()
        v_u_2.get("PlaceableToolAPI/HomeingRocketLaunched").OnClientEvent:Connect(function(p9)
            local v10 = v_u_7.await(p9, 5)
            if v10 then
                v_u_5.FX:play("HomeingRocketIgnition")
                v_u_3.apps.TransitionsApp:transition({
                    ["length"] = 0.25,
                    ["start_transparency"] = 1,
                    ["end_transparency"] = 0,
                    ["color"] = Color3.new(1, 1, 1)
                })
                local v_u_11 = workspace.CurrentCamera
                v_u_11.CameraType = Enum.CameraType.Scriptable
                local v12 = v10:FindFirstChild("CameraPart").CFrame
                local v_u_13 = v10:FindFirstChild("Rocket").PrimaryPart
                v_u_11.CFrame = CFrame.lookAt(v12.Position, v_u_13:GetPivot().Position + Vector3.new(0, -5, 0))
                local v14 = v_u_13:GetPivot().Position - v_u_11.CFrame.Position
                local v15 = {}
                for _, v16 in game.Players:GetPlayers() do
                    local v17 = v16.Character
                    table.insert(v15, v17)
                end
                local v18 = v14.magnitude / 2
                local v19 = true
                local v20 = 0
                while v19 and v20 < v18 do
                    if v_u_8.cast_ray({
                        ["origin"] = v_u_11.CFrame.Position,
                        ["direction"] = v14,
                        ["respect_can_collide"] = true,
                        ["filter_type"] = Enum.RaycastFilterType.Exclude,
                        ["instances"] = { v10, v15 }
                    }) then
                        v_u_11.CFrame = v_u_11.CFrame * CFrame.new(0, 0, -1)
                        v20 = v20 + 1
                    else
                        v19 = false
                    end
                end
                v_u_3.apps.TransitionsApp:transition({
                    ["length"] = 0.25,
                    ["start_transparency"] = 0,
                    ["end_transparency"] = 1,
                    ["color"] = Color3.new(1, 1, 1)
                })
                local v21 = v_u_4.Heartbeat:Connect(function()
                    if v_u_13 then
                        v_u_11.CFrame = CFrame.lookAt(v_u_11.CFrame.Position, v_u_13:GetPivot().Position + Vector3.new(0, -5, 0))
                    end
                end)
                task.wait(3)
                v_u_5.FX:play("HomeingRocketLaunch")
                task.wait(3)
                local v22 = game.ReplicatedStorage.Resources.Jokes2024HomeingRocketSparkle:GetChildren()
                local v23 = CFrame.lookAt(v12.Position, v_u_13:GetPivot().Position) * CFrame.new(0, 0, -10)
                for _, v24 in v22 do
                    v_u_6.emit_particle(v24, v23.Position, 1)
                end
                task.wait(0.5)
                v21:Disconnect()
                task.wait(1)
                v_u_11.CameraType = Enum.CameraType.Custom
            end
        end)
    end
}