--// ReplicatedStorage.ClientServices.VehicleClient.VehicleTypes.MountVehicle.MountVehicleAnimator (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AnimationManager")
local v_u_3 = v1("Spring")
local v4 = v1("Class")
local v_u_5 = v1("package:Promise")
local v_u_6 = require(game.ReplicatedStorage.new.modules.RaycastHelper)
local v_u_7 = game:GetService("Players")
local v_u_8 = Random.new()
local v9 = v4("MountVehicleAnimator")
function v9.__init(p10, p11, p12)
    p10.vehicle_model = p11
    p10.vehicle_db_entry = p12
    p10.vehicle_seat = p11:WaitForChild("VehicleSeat")
    p10.humanoid = p11:FindFirstChild("Humanoid")
    p10.root_part = p11:FindFirstChild("HumanoidRootPart")
    p10.swim_force = p10.root_part.SwimForce
    p10.tracks = p10:_load_animation_tracks()
    p10.idle_tracks = p10:_load_idle_animation_tracks()
    p10.tilt_spring = v_u_3.new(0.75, 1.5, 0)
    p10.tilt_attachment = p10.vehicle_model.HumanoidRootPart.Attachment
    p10.tilt_starting_position = CFrame.new(p10.tilt_attachment.CFrame.Position)
    p10.idle_promise = nil
    p10.next_idle_time = nil
end
function v9._get_water_level(p13)
    local v14 = v_u_6.cast_ray({
        ["origin"] = p13.root_part.CFrame.Position + Vector3.new(0, 10, 0),
        ["direction"] = Vector3.new(-0, -50, -0),
        ["instances"] = { workspace.Terrain },
        ["ignore_water"] = false,
        ["filter_type"] = Enum.RaycastFilterType.Include,
        ["collision_group"] = "terrain"
    })
    if v14 and v14.Material == Enum.Material.Water then
        return v14.Position.Y + p13.vehicle_db_entry.swim_y_offset
    else
        return nil
    end
end
function v9._get_ground_angle(p15)
    local v16 = p15.root_part.CFrame.LookVector * (p15.root_part.Size.Z * 0.5)
    local v17 = v_u_6.cast_ray({
        ["origin"] = p15.root_part.CFrame.Position + v16,
        ["direction"] = Vector3.new(-0, -50, -0),
        ["filter_type"] = Enum.RaycastFilterType.Exclude,
        ["respect_can_collide"] = true,
        ["instances"] = { p15.vehicle_model, v_u_7.LocalPlayer.Character }
    })
    local v18 = v_u_6.cast_ray({
        ["origin"] = p15.root_part.CFrame.Position - v16,
        ["direction"] = Vector3.new(-0, -50, -0),
        ["filter_type"] = Enum.RaycastFilterType.Exclude,
        ["respect_can_collide"] = true,
        ["instances"] = { p15.vehicle_model, v_u_7.LocalPlayer.Character }
    })
    if v17 and v18 then
        local v19 = v18.Position - v17.Position
        if v19:Dot(v19) > 0 then
            local v20 = v19.Unit:Dot(Vector3.new(0, 1, 0))
            local v21 = math.acos(v20) - 1.5707963267948966
            local v22 = -p15.vehicle_db_entry.max_lean
            local v23 = p15.vehicle_db_entry.max_lean
            return math.clamp(v21, v22, v23)
        end
    end
    return 0
end
function v9._is_moving(p24)
    return p24.root_part.AssemblyLinearVelocity.Magnitude > 0.5
end
function v9._is_grounded(p25)
    local v26 = p25.vehicle_model.VehicleSeat
    if p25.humanoid:GetState() == Enum.HumanoidStateType.Freefall then
        if v26.Occupant and not v26.Occupant:IsDescendantOf(v_u_7.LocalPlayer.Character) then
            local v27 = p25.humanoid.HipHeight + p25.root_part.Size.Y * 0.5
            local v28 = v_u_6.cast_ray({
                ["origin"] = p25.root_part.Position,
                ["direction"] = Vector3.new(-0, -50, -0),
                ["filter_type"] = Enum.RaycastFilterType.Exclude,
                ["respect_can_collide"] = true,
                ["instances"] = { p25.vehicle_model, v_u_7.LocalPlayer.Character }
            })
            if v28 then
                return (p25.root_part.CFrame.Position - v28.Position).Y < v27 + 1
            else
                return false
            end
        else
            return false
        end
    else
        return true
    end
end
function v9._load_animation_tracks(p29)
    local v30 = p29.humanoid.Animator
    local v31 = {}
    for v32, v33 in p29.vehicle_db_entry.mount_animations do
        v31[v32] = v30:LoadAnimation((v_u_2.get_track(v33)))
    end
    for _, v34 in v31 do
        v34:Play()
    end
    return v31
end
function v9._load_idle_animation_tracks(p35)
    local v36 = p35.humanoid.Animator
    local v37 = {}
    for _, v38 in p35.vehicle_db_entry.idle_flair_animations do
        local v39 = v_u_2.get_track(v38)
        table.insert(v37, v36:LoadAnimation(v39))
    end
    return v37
end
function v9._use_single_track(p40, p41)
    for _, v42 in p40.tracks do
        v42:AdjustWeight(v42 == p41 and 1 or 0.001)
    end
    if p41 ~= nil and p40.idle_promise then
        p40.idle_promise:cancel()
        p40.idle_promise = nil
    end
end
function v9._play_idle_flair_animation(p_u_43)
    p_u_43.idle_promise = v_u_5.new(function(p44, _, p45)
        p_u_43:_use_single_track(nil)
        local v_u_46 = p_u_43.idle_tracks[v_u_8:NextInteger(1, #p_u_43.idle_tracks)]
        v_u_46:Play()
        p45(function()
            v_u_46:Stop()
        end)
        p44(v_u_46)
    end):andThen(function(p47)
        return v_u_5.fromEvent(p47.Ended)
    end):finally(function()
        p_u_43.next_idle_time = nil
        p_u_43.idle_promise = nil
    end)
end
function v9._step_animations(p48, _, p49)
    local v50 = p48:_is_moving()
    if p49.is_swimming then
        p48.next_idle_time = nil
        p48:_use_single_track(p48.tracks.swim)
        p48.tracks.swim:AdjustSpeed(v50 and 1 or 0.5)
        return
    elseif p48:_is_grounded() then
        if v50 then
            p48.next_idle_time = nil
            p48:_use_single_track(p48.tracks.run)
            return
        elseif p48.vehicle_seat.Occupant or #p48.idle_tracks == 0 then
            p48.next_idle_time = nil
            p48:_use_single_track(p48.tracks.idle)
        elseif not p48.idle_promise then
            if not p48.next_idle_time then
                local v51 = v_u_8:NextNumber() * (p48.vehicle_db_entry.idle_max_wait - p48.vehicle_db_entry.idle_min_wait)
                p48.next_idle_time = tick() + p48.vehicle_db_entry.idle_min_wait + v51
            end
            if tick() > p48.next_idle_time then
                p48:_play_idle_flair_animation()
                return
            end
            p48:_use_single_track(p48.tracks.idle)
        end
    else
        p48.next_idle_time = nil
        p48:_use_single_track(p48.tracks.fall)
        return
    end
end
function v9.get_state(p52)
    local v53 = p52:_get_ground_angle()
    local v54 = p52:_get_water_level()
    local v55
    if v54 then
        v55 = p52.root_part.CFrame.Position.Y <= v54
    else
        v55 = v54
    end
    return {
        ["ground_angle"] = v53,
        ["water_level"] = v54,
        ["is_swimming"] = v55
    }
end
function v9.update(p56, p57, p58)
    local v59 = p58 or p56:get_state()
    p56.tilt_spring:set_goal(v59.ground_angle)
    p56.tilt_spring:update(p57)
    p56.tilt_attachment.CFrame = p56.tilt_starting_position * CFrame.fromAxisAngle(Vector3.new(1, 0, 0), p56.tilt_spring:get_position())
    p56:_step_animations(p57, v59)
end
function v9.destroy(p60)
    for _, v61 in p60.tracks do
        v61:Stop(0)
        v61:Destroy()
    end
    for _, v62 in p60.idle_tracks do
        v62:Stop(0)
        v62:Destroy()
    end
end
return v9