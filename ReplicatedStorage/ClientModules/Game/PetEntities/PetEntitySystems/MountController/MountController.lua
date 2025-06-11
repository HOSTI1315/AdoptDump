--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.MountController (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("StateManagerClient")
v1("PlatformM")
local v_u_3 = v1("UIManager")
local v_u_4 = v1("Raycast")
local v_u_5 = v1("AdoptMeEnums/PetEntities/MountType")
local v_u_6 = game:GetService("Players")
game:GetService("ReplicatedStorage")
local v_u_7 = nil
local v8 = {}
local v_u_9 = 0
local v_u_10 = nil
local function v_u_15(p11, p12)
    if tick() - v_u_9 < 0.2 then
        return v_u_10
    end
    local v13 = Ray.new(p11.base.root.Position, Vector3.new(0, -7, 0))
    local v14 = v_u_4.FindPartOnRay(v13, { p11.base.char, p12 }, nil)
    v_u_9 = tick()
    v_u_10 = v14 ~= nil
    return v_u_10
end
local function v17(p16)
    p16.base.humanoid:Move((Vector3.new()))
    p16.mount_state.mount_maid:DoCleaning()
    p16.mount_state.movement_speed = 0
    v_u_7 = nil
end
function v8.set_speed_override(p18)
    if type(p18) == "number" then
        v_u_7 = p18
    else
        v_u_7 = nil
    end
end
function v8.get_fly_speed()
    return v_u_7 or 27
end
function v8.step(p_u_19, p20)
    if p_u_19.client_has_control and not p_u_19.is_npc_pet then
        local v_u_21 = p_u_19.mount_state
        local v_u_22 = p_u_19.base
        local v23 = v_u_6.LocalPlayer.Character
        local v_u_24
        if v23 then
            v_u_24 = v23:FindFirstChild("Humanoid")
        else
            v_u_24 = v23
        end
        local v25
        if v23 then
            v25 = v23:FindFirstChild("HumanoidRootPart")
        else
            v25 = v23
        end
        if v_u_24 and v25 then
            local v26 = v_u_2.get(p_u_19.base.char)
            if v26 then
                local v27 = v_u_2.has_state(v26, "PetBeingRidden")
                local v28 = v_u_2.has_state(v26, "PetBeingFlown")
                local v29 = v27 and v_u_5.Riding or (v28 and v_u_5.Flying or v_u_5.NotMounted)
                local v30 = v29 ~= v_u_21.current_mount_type
                if v30 then
                    p_u_19.base.humanoid:Move((Vector3.new()))
                    p_u_19.mount_state.mount_maid:DoCleaning()
                    p_u_19.mount_state.movement_speed = 0
                    v_u_7 = nil
                end
                v_u_21.is_mounted = v29 ~= v_u_5.NotMounted
                if v29 == v_u_5.NotMounted then
                    v_u_21.current_mount_type = v_u_5.NotMounted
                else
                    if v30 then
                        v_u_21.finalize_vertical_offset_timestamp = tick() + 0.2
                        if v29 == v_u_5.Riding then
                            v_u_24:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
                            v_u_21.mount_maid:GiveTask(game:GetService("UserInputService").JumpRequest:Connect(function()
                                v_u_22.humanoid.Jump = true
                                p_u_19.sounds.play_sound("Jump")
                            end))
                            local v31 = v_u_6.LocalPlayer.PlayerGui:FindFirstChild("TouchGui")
                            if v31 then
                                v31 = v31:FindFirstChild("TouchControlFrame")
                            end
                            if v31 then
                                v31 = v31:FindFirstChild("JumpButton")
                            end
                            if v31 then
                                v31.Visible = true
                            end
                        elseif v29 == v_u_5.Flying then
                            v_u_24:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
                            local v32 = Instance.new("BodyVelocity")
                            v32.Name = "FlyingBodyVelocity"
                            v32.MaxForce = Vector3.new(10000000000, 10000000000, 10000000000)
                            v32.Parent = v_u_22.root
                            v_u_21.flying_bodyvelocity = v32
                            local v33 = Instance.new("BodyGyro")
                            v33.Name = "FlyingRotator"
                            v33.MaxTorque = Vector3.new(10000000000, 10000000000, 10000000000)
                            v33.D = 500
                            v33.P = 6000
                            v33.Parent = v_u_22.root
                            v_u_21.flying_bodygyro = v33
                            v_u_21.mount_maid:GiveTask(v32)
                            v_u_21.mount_maid:GiveTask(v33)
                            v_u_22.humanoid.PlatformStand = true
                            v_u_22.root.CFrame = v_u_22.root.CFrame + Vector3.new(0, 2, 0)
                            v_u_21.flying_bodygyro_cf = workspace.CurrentCamera.CFrame
                            v_u_21.mount_maid:GiveTask(function()
                                v_u_22.humanoid.PlatformStand = false
                            end)
                        end
                        v_u_21.mount_maid:GiveTask(function()
                            v_u_24:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                            v_u_21.camera_offset = nil
                            v_u_24.CameraOffset = Vector3.new(0, 0, 0)
                        end)
                    end
                    v_u_21.current_mount_type = v29
                    local _ = v_u_21.movement_speed
                    local v34 = nil
                    if v29 == v_u_5.Riding then
                        v34 = v_u_7 or 22
                        p_u_19.base.humanoid:Move(v_u_24.MoveDirection)
                        p_u_19.base.humanoid.WalkSpeed = v34
                    elseif v29 == v_u_5.Flying then
                        v34 = v_u_7 or 27
                        local v35 = workspace.CurrentCamera.CFrame
                        local v36 = v35.lookVector
                        local v37 = v35.lookVector.Y
                        local v38 = v36 - Vector3.new(0, v37, 0)
                        local v39 = CFrame.new(v35.p, v35.p + v38):VectorToObjectSpace(v_u_24.MoveDirection)
                        local v40 = (v35 * CFrame.Angles(0.3490658503988659, 0, 0)):VectorToWorldSpace(v39)
                        v_u_21.flying_move_spring:set_goal(v40)
                        v_u_21.flying_move_spring:update(p20)
                        v_u_21.flying_tilt_spring:set_goal(v39)
                        v_u_21.flying_tilt_spring:update(p20)
                        v_u_21.flying_bodyvelocity.Velocity = v_u_21.flying_move_spring:get_position() * v34
                        if v40.Magnitude > 0 or v_u_15(p_u_19, v23) then
                            v_u_21.flying_bodygyro_cf = v35
                        end
                        if not v_u_3.is_visible("AvatarEditorApp") then
                            local v41 = v_u_21.flying_tilt_spring:get_position()
                            local v42 = p_u_19.base.entry.mounted_fly_forward_tilt_compensation or 0
                            v_u_21.flying_bodygyro.CFrame = v_u_21.flying_bodygyro_cf * CFrame.Angles(v41.Z * 0.3 - math.rad(v42), 0, -v41.X * 0.4)
                        end
                    end
                    if v_u_24.MoveDirection.Magnitude > 0.1 then
                        if v29 == v_u_5.Flying or v29 == v_u_5.Riding then
                            v_u_21.movement_speed = v34
                            return
                        end
                    else
                        v_u_21.movement_speed = 0
                    end
                end
            else
                return
            end
        else
            return
        end
    else
        if p_u_19.mount_state.is_mounted then
            p_u_19.base.humanoid:Move((Vector3.new()))
            p_u_19.mount_state.mount_maid:DoCleaning()
            p_u_19.mount_state.movement_speed = 0
            v_u_7 = nil
        end
        return
    end
end
v8.cleanup = v17
return v8