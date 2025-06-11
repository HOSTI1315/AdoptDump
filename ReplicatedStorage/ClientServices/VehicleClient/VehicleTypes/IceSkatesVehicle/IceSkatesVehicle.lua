--// ReplicatedStorage.ClientServices.VehicleClient.VehicleTypes.IceSkatesVehicle (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("OccupantAnimator")
local v3 = v1("Class")
local v_u_4 = game:GetService("Debris")
local v_u_5 = game:GetService("Players")
local v6 = game:GetService("ReplicatedStorage")
local v_u_7 = {
    "SkatingLoop",
    "SkatingJump",
    "SkatingGlide",
    "SkatingStumble",
    "SkatingStop1",
    "SkatingStop2",
    "SkatingStop3",
    "SkatingLand1",
    "SkatingLand2",
    "SkatingLand3",
    "SkatingLand4"
}
local v_u_8 = Random.new()
local v_u_9 = v6.Resources.IceSkating
local v_u_10 = v1("BaseSkatesVehicle")
local v11 = v3("IceSkatesVehicle", v_u_10)
function v11.__init(p12, p13, p14, p15)
    local v16 = v_u_10.__init
    local v17 = {
        ["slope_limit"] = 0.7853981633974483,
        ["can_tilt"] = false,
        ["is_ice_skates"] = true,
        ["jump"] = {
            ["enabled"] = true,
            ["height"] = 12.5,
            ["debounce"] = 0.1
        },
        ["stumble"] = {
            ["debounce"] = 1,
            ["slide_duration"] = 2.2
        }
    }
    local v18 = {
        ["idle_slowdown_1"] = {
            ["frequency"] = 4,
            ["damping_ratio"] = 2
        },
        ["idle_slowdown_2"] = {
            ["frequency"] = 0.3,
            ["damping_ratio"] = 2
        },
        ["touch_idle_slowdown_1"] = {
            ["frequency"] = 4,
            ["damping_ratio"] = 2
        },
        ["touch_idle_slowdown_2"] = {
            ["frequency"] = 4,
            ["damping_ratio"] = 8
        },
        ["touch_idle_slowdown_3"] = {
            ["frequency"] = 16,
            ["damping_ratio"] = 8
        },
        ["brake"] = {
            ["frequency"] = 1.5,
            ["damping_ratio"] = 8
        },
        ["moving"] = {
            ["frequency"] = 0.8,
            ["damping_ratio"] = 2
        }
    }
    v17.throttle = v18
    v16(p12, p13, p14, p15, v17)
    p12.sounds = {}
    p12.current_sound = nil
    for _, v19 in v_u_7 do
        local v20 = v_u_9.Sounds:FindFirstChild(v19)
        if not v20 then
            warn((("Could not find the ice skating sound %*, using a silent sound instead."):format(v19)))
            v20 = Instance.new("Sound")
            v20.SoundId = 0
            v20.Name = v19
        end
        p12.sounds[v20.Name] = v20:Clone()
        p12.sounds[v20.Name].Parent = p12.vehicle_seat
    end
    p12.trail_state = {
        ["left_foot_in_contact"] = false,
        ["right_foot_in_contact"] = false,
        ["models"] = {}
    }
end
function v11._play_sound(p21, p22, p23)
    if p21.current_sound then
        if p21.current_sound.Name:match(p22) then
            return
        end
        if p21.current_sound.Looped then
            p21.current_sound:Stop()
        end
    end
    p21.current_sound = p21.sounds[p22 .. (p23 or "")]
    p21.current_sound:Play()
end
function v11._update_sounds(p24, _)
    local v25 = p24.current_sound
    local v26 = p24:_get_calculated_throttle()
    local v27 = math.abs(v26)
    if not p24.jump_state.is_jumping and (v25 and v25.Name == "SkatingJump") then
        p24:_play_sound("SkatingLand", v_u_8:NextInteger(1, 4))
    end
    if p24.jump_state.is_jumping then
        p24:_play_sound("SkatingJump")
        return
    elseif p24.throttle_state == "brake" then
        p24.sounds["SkatingStop" .. 1].Volume = v27 * 0.5
        p24.sounds["SkatingStop" .. 2].Volume = v27 * 0.5
        p24.sounds["SkatingStop" .. 3].Volume = v27 * 0.5
        p24:_play_sound("SkatingStop", v_u_8:NextInteger(1, 3))
        return
    elseif p24.throttle_state == "moving" then
        if not v25 or v25 and v25.Name ~= "SkatingLoop" then
            local v28 = v_u_2.get_tracks(p24).forward
            local v29 = v28.TimePosition / v28.Length
            if v29 < 0.5 or v29 > 0.8 then
                p24.sounds.SkatingLoop.TimePosition = (v29 - 0.5) / 0.3
            elseif v29 > 0.3 then
                p24.sounds.SkatingLoop.TimePosition = (v29 - 0.3) / 0.7
            end
            p24.sounds.SkatingLoop.PlaybackSpeed = 1.5
        end
        p24.sounds.SkatingLoop.Volume = v27 * 0.5
        p24:_play_sound("SkatingLoop")
    elseif p24.throttle_state == "idle" then
        p24.sounds.SkatingGlide.Volume = v27 * 0.5
        p24:_play_sound("SkatingGlide")
    end
end
function v11._start_trail_for_foot(p30, p31, p32)
    p30:_stop_trail_for_foot(p31)
    local v33 = v_u_9.TrailModel:Clone()
    v33:PivotTo(p32)
    v33.Part.Trail.Lifetime = 10
    v33.Parent = workspace.IceSkatingTrails
    p30.trail_state.models[p31] = v33
end
function v11._stop_trail_for_foot(p34, p35)
    local v36 = p34.trail_state.models[p35]
    if v36 then
        v_u_4:AddItem(v36, 10)
        p34.trail_state.models[p35] = nil
    end
end
function v11._update_trail_for_foot(p37, p38, p39)
    local v40 = p37.trail_state.models[p38]
    if v40 then
        v40:PivotTo(p39)
    end
end
function v11._get_position_for_foot(p41, p42)
    local v43 = v_u_5.LocalPlayer.Character
    if v43 then
        v43 = v43:FindFirstChild(p42)
    end
    if not (v43 and p41.current_raycast) then
        return nil
    end
    local v44 = p41.current_raycast.Position.Y
    local v45 = v43.CFrame * CFrame.new(0, -v43.Size.Y / 2, 0)
    local v46 = v45.X
    local v47 = v45.Z
    return Vector3.new(v46, v44, v47)
end
function v11._is_grounded(p48)
    if p48.current_raycast then
        return p48.current_raycast.Distance <= p48:_get_height_from_ground(false) + 0.05
    else
        return false
    end
end
function v11._update_vfx(p49, _)
    local v50 = v_u_5.LocalPlayer.Character
    if v50 then
        v50 = v50:FindFirstChild("HumanoidRootPart")
    end
    local v51 = p49:_get_position_for_foot("LeftFoot")
    local v52 = p49:_get_position_for_foot("RightFoot")
    local v53 = v_u_2.get_tracks(p49)
    if v50 and (v53 and (v51 and v52)) then
        local v54 = v50.CFrame.Rotation + v51
        local v55 = v50.CFrame.Rotation + v52
        local v56, v57
        if p49.jump_state.is_jumping or not p49:_is_grounded() then
            v56 = false
            v57 = false
        elseif p49.throttle_state == "moving" then
            local v58 = v53.forward
            local v59 = v58.TimePosition / v58.Length
            v56 = v59 < 0.5 and true or v59 > 0.8
            v57 = v59 > 0.3
        elseif p49.throttle_state == "brake" then
            v56 = true
            v57 = true
        else
            local v60 = p49:_get_calculated_throttle()
            if math.clamp(v60, 0, 1) > 0.2 then
                v56 = true
                v57 = false
            else
                v56 = true
                v57 = true
            end
        end
        local v61 = p49.trail_state.left_foot_in_contact
        local v62 = p49.trail_state.right_foot_in_contact
        if v61 and not v56 then
            p49:_stop_trail_for_foot("LeftFoot")
        elseif not v61 and v56 then
            p49:_start_trail_for_foot("LeftFoot", v54)
        end
        if v62 and not v57 then
            p49:_stop_trail_for_foot("RightFoot")
        elseif not v62 and v57 then
            p49:_start_trail_for_foot("RightFoot", v55)
        end
        p49.trail_state.left_foot_in_contact = v56
        p49.trail_state.right_foot_in_contact = v57
        p49:_update_trail_for_foot("LeftFoot", v54)
        p49:_update_trail_for_foot("RightFoot", v55)
    end
end
function v11.get_camera_configuration(p63)
    local v64 = v_u_10.get_camera_configuration(p63)
    return v64 == "default" and "skates_desktop" or v64
end
function v11.make_stumble(p65, p66)
    local v67 = v_u_10.make_stumble(p65, p66)
    if v67 then
        p65:_play_sound("SkatingStumble")
    end
    return v67
end
function v11.update(p68, p69)
    v_u_10.update(p68, p69)
    p68:_update_sounds(p69)
    p68:_update_vfx(p69)
end
return v11