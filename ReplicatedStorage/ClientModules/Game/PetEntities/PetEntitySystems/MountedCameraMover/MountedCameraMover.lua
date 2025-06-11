--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.MountedCameraMover (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("AdoptMeEnums/PetEntities/MountType")
local v_u_2 = game:GetService("Players")
return {
    ["optimization_run_only_for"] = "owned",
    ["step"] = function(p3)
        if p3.client_has_control and not p3.is_npc_pet then
            local v4 = p3.base
            local v5 = p3.mount_state
            local v6 = v_u_2.LocalPlayer.Character
            local v7
            if v6 then
                v7 = v6:FindFirstChild("Humanoid")
            else
                v7 = v6
            end
            local v8
            if v6 then
                v8 = v6:FindFirstChild("HumanoidRootPart")
            else
                v8 = v6
            end
            if v6 then
                v6 = v6:FindFirstChild("Head")
            end
            if v8 and (v6 and (v5.is_mounted and workspace.CurrentCamera.CameraType == Enum.CameraType.Custom)) then
                if p3.mount_state.current_mount_type == v_u_1.Flying and p3.base.entry.fly_camera_offset then
                    v5.camera_offset = v4.root.CFrame:VectorToWorldSpace(p3.base.entry.fly_camera_offset.Position)
                elseif tick() < v5.finalize_vertical_offset_timestamp or not v5.camera_offset then
                    local v9 = v6.Position - p3.base.root.Position
                    v5.camera_offset = Vector3.new(0, 1, 0) * p3.base.root.CFrame.UpVector:Dot(v9)
                end
                local v10 = v8.Size.Y / 2 - (Vector3.new(2, 2, 1)).Y / 2
                local v11 = Vector3.new(0, 1.5, 0) + Vector3.new(0, v10, 0)
                local v12 = v8.CFrame:VectorToObjectSpace(v5.camera_offset)
                local v13 = v8.CFrame:ToObjectSpace(v4.root.CFrame)
                v7.CameraOffset = -v11 + v13.Position + v12
            end
        end
    end
}