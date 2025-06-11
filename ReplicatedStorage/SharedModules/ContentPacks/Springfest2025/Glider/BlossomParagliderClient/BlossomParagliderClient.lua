--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.Glider.BlossomParagliderClient (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("Class")("BlossomParagliderClient")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = v1("RouterClient")
local v_u_5 = v1("TweenPromise")
local v_u_6 = v1("package:Promise4")
local v_u_7 = v1("SoundPlayer")
local v_u_8 = v1("PlatformM")
local v_u_9 = v1("package:Sift")
local v_u_10 = v1("LerpGoal")
local v_u_11 = v1("Signal")
local v_u_12 = v1("Maid")
local v_u_13 = {
    ["paraglider_flight_idle_1"] = 83087751441233
}
function v2.__init(p_u_14, p15)
    local v16 = game.Players.LocalPlayer
    local v17 = v16.Character
    local v18 = v17:FindFirstChildOfClass("Humanoid")
    local v19 = v16:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")
    local v20 = p15 or {}
    p_u_14.is_toy = v20.is_toy
    p_u_14.rely_on_humanoid_states = v20.rely_on_humanoid_states
    p_u_14.whitelist_cancollide_objects = v20.whitelist_non_cancollide_objects
    p_u_14.exclude_skid_forces = v20.exclude_skid_forces
    p_u_14.exclude_takeoff_checks = v20.exclude_takeoff_checks
    p_u_14.overlap_filter = v_u_9.Array.concat(v20.overlap_filter or {}, game:GetService("CollectionService"):GetTagged("disable_paraglider_collisions"))
    p_u_14.collision_filter = v_u_9.Array.concat(v20.collision_filer or {}, game:GetService("CollectionService"):GetTagged("enable_paraglider_collisions"))
    p_u_14.glider_blocker_folder = v20.glider_blocker_folder
    p_u_14.is_destroyed = false
    p_u_14.is_flying = false
    p_u_14.keep_current_state = false
    p_u_14.state_changed = v_u_11.new()
    p_u_14.jump_request = v_u_11.new()
    p_u_14.flight_started = v_u_11.new()
    p_u_14.flight_ended = v_u_11.new()
    p_u_14.force_cleanup = v_u_11.new()
    p_u_14.ground_lost = v_u_11.new()
    p_u_14.ground_gained = v_u_11.new()
    p_u_14.takeoff_speed_reached = v_u_11.new()
    p_u_14.paraglider_state = p_u_14.is_toy and "Idle" or "Force_Stop"
    p_u_14.last_state = nil
    p_u_14.flight_intervals = {
        ["takeoff"] = 0.1,
        ["on_ground"] = 0.1
    }
    p_u_14.overlap_params = OverlapParams.new()
    if p_u_14.overlap_filter then
        p_u_14.overlap_params.FilterType = Enum.RaycastFilterType.Include
        p_u_14.overlap_params:AddToFilter(p_u_14.overlap_filter)
    end
    p_u_14.paraglider_model_id = v20.paraglider_model_id or "Spring2025DefaultParaglider"
    p_u_14.flight_cleanup = v_u_12.new()
    p_u_14.paraglider_cleanup = v_u_12.new()
    p_u_14.takeoff_cleanup = v_u_12.new()
    p_u_14.player_module = require(v19)
    p_u_14.control_module = p_u_14.player_module:GetControls()
    local v21 = v20 or {}
    p_u_14.fall_speed = 30
    p_u_14.fov_base = workspace.CurrentCamera.FieldOfView
    p_u_14.fov_boost = 12.5
    p_u_14.air_resistance_booster = 0
    p_u_14.fov_spring = v_u_10.new(2, p_u_14.fov_base)
    p_u_14.gravity_multiplier = v21.paraglider_gravity_multiplier or 0.9925
    p_u_14.takeoff_speed = 5
    p_u_14.speed_base = v21.speed_base or 66.67
    p_u_14.speed_boost = 30
    p_u_14.speed_spring = v_u_10.new(2, p_u_14.speed_base)
    p_u_14.skid_multiplier = 1
    p_u_14.velocity = Vector3.new(0, 0, 0)
    p_u_14.updraft_speed = 72.8
    p_u_14.updraft_duration = 1
    local v22 = RaycastParams.new()
    v22.FilterType = Enum.RaycastFilterType.Exclude
    v22:AddToFilter({ v17 })
    p_u_14.exclude_player_params = v22
    if not p_u_14.is_toy then
        p_u_14:setup_ground_part()
    end
    local v_u_23 = false
    p_u_14.paraglider_cleanup:GiveTask(v_u_3.JumpRequest:Connect(function()
        if v_u_23 then
            return
        elseif not p_u_14.keep_current_state then
            v_u_23 = true
            p_u_14.jump_request:Fire(true)
            v_u_6.any({ v_u_6.delay(0.2), v_u_6.fromEvent(p_u_14.force_cleanup) }):finally(function()
                p_u_14.jump_request:Fire(false)
                v_u_23 = false
            end)
        end
    end))
    p_u_14.animations = {}
    p_u_14.tracks = {}
    for v24, v25 in v_u_13 do
        local v26 = Instance.new("Animation")
        v26.AnimationId = "rbxassetid://" .. v25
        p_u_14.animations[v24] = v26
        p_u_14.tracks[v24] = v18.Animator:LoadAnimation(v26)
    end
    if p_u_14.rely_on_humanoid_states then
        v18.StateChanged:Connect(function(_, p27)
            p_u_14:update_from_humanoid_state(p27)
        end)
    end
    local v28 = game.Players.LocalPlayer.Character
    if v28 then
        v28 = v28:FindFirstChild("HumanoidRootPart")
    end
    local v29 = Instance.new("Attachment")
    v29.Parent = v28
    local v30 = Instance.new("AlignOrientation")
    v30.Visible = true
    v30.MaxTorque = (1 / 0)
    v30.Responsiveness = 20
    v30.Attachment0 = v29
    v30.Mode = Enum.OrientationAlignmentMode.OneAttachment
    v30.Parent = v28
    v30.Enabled = false
    local v31 = Instance.new("VectorForce")
    v31.Name = "MoveForce"
    v31.Attachment0 = v29
    v31.Parent = v28
    v31.RelativeTo = Enum.ActuatorRelativeTo.World
    v31.Force = Vector3.new(0, 0, 0)
    v31.ApplyAtCenterOfMass = true
    v31.Enabled = false
    local v32 = Instance.new("VectorForce")
    v32.Name = "GravityForce"
    v32.Attachment0 = v29
    v32.Parent = v28
    v32.RelativeTo = Enum.ActuatorRelativeTo.World
    v32.Force = Vector3.new(0, 0, 0)
    v32.ApplyAtCenterOfMass = true
    v32.Enabled = false
    p_u_14.align_orientation = v30
    p_u_14.opposite_gravity_force = v32
    p_u_14.move_force = v31
    p_u_14.paraglider_cleanup:GiveTask(v30)
    p_u_14.paraglider_cleanup:GiveTask(v32)
    p_u_14.paraglider_cleanup:GiveTask(v31)
    p_u_14.paraglider_cleanup:GiveTask(v29)
end
function v2.set_glider_model(p33, p34)
    p33.paraglider_model_id = p34
end
function v2.setup_ground_part(p_u_35)
    local v_u_36 = game.Players.LocalPlayer.Character
    local v37 = v_u_36:FindFirstChild("Humanoid")
    local v38 = v_u_36:FindFirstChild("HumanoidRootPart")
    local _, v39 = v_u_36:GetBoundingBox()
    local v40 = p_u_35.is_toy and v39 * 1.2
    if not v40 then
        local v41 = v37.HipHeight + 6
        v40 = Vector3.new(1.5, v41, 1.5)
    end
    local v42 = Enum.PartType.Block
    local v43 = Instance.new("Part")
    v43.Size = v40
    v43.CanCollide = false
    v43.Shape = v42
    v43.Parent = v_u_36
    v43.Transparency = 1
    v43.Massless = true
    local v44 = Instance.new("Weld")
    v44.Parent = v38
    v44.Part0 = v38
    v44.Part1 = v43
    v44.C0 = p_u_35.is_toy and CFrame.new(0, 0, 0) or CFrame.new(0, -v37.HipHeight - v43.Size.Y / 2 - 2, 0)
    local function v_u_49(p45)
        if not p_u_35.is_toy then
            for _, v46 in p_u_35.overlap_filter do
                for _, v47 in v46:GetDescendants() do
                    if v47 == p45 and v47.CanCollide then
                        return true
                    end
                end
            end
            return false
        end
        local v48 = p45.CanCollide
        if v48 then
            v48 = p45.Transparency < 1
        end
        return v48
    end
    local v50 = p_u_35.is_toy and p_u_35.flight_cleanup or p_u_35.paraglider_cleanup
    v50:GiveTask(v43.Touched:Connect(function(p51)
        if p51:IsDescendantOf(v_u_36) then
            return
        elseif v_u_49(p51) then
            if not p_u_35.keep_current_state then
                if p_u_35.is_toy then
                    p_u_35:update_from_humanoid_state(Enum.HumanoidStateType.Landed)
                    return
                end
                p_u_35:handle_idle_state()
            end
        end
    end))
    v50:GiveTask(v43)
    v50:GiveTask(v44)
    v50:GiveTask(function()
        p_u_35.ground_check_part = nil
    end)
    p_u_35.ground_check_part = v43
end
function v2.get_ground(p52)
    if p52.paraglider_state == "Idle" and p52.ground_check_part then
        return #workspace:GetPartsInPart(p52.ground_check_part, p52.overlap_params) > 0
    else
        return false
    end
end
function v2.is_player_in_glider_blocker(p53)
    if not p53.glider_blocker_folder then
        return false
    end
    local v54 = game.Players.LocalPlayer.Character
    if v54 then
        v54 = v54:FindFirstChild("HumanoidRootPart")
    end
    if not v54 then
        return false
    end
    local v55 = OverlapParams.new()
    v55.FilterType = Enum.RaycastFilterType.Include
    v55.FilterDescendantsInstances = p53.glider_blocker_folder:GetChildren()
    v55.MaxParts = 1
    return #workspace:GetPartsInPart(v54, v55) > 0
end
function v2.toggle_forces(p56, p57)
    p56.align_orientation.Enabled = p57
    p56.opposite_gravity_force.Enabled = p57
    p56.move_force.Enabled = p57
end
function v2.start_flight(p_u_58)
    if not p_u_58.is_destroyed then
        local v59 = p_u_58.paraglider_state == "Takeoff"
        p_u_58.paraglider_state = "Active"
        if p_u_58.stop_flight_fov_effect_promise then
            p_u_58.stop_flight_fov_effect_promise:cancel()
        end
        local v60 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        p_u_58.flight_started:Fire()
        p_u_58:toggle_forces(true)
        p_u_58.updraft_multiplier = 0
        p_u_58.starting_velocity = v60.AssemblyLinearVelocity
        p_u_58.flight_elapsed_time = 0
        p_u_58.last_direction = v60.CFrame.LookVector
        p_u_58.flight_tilt = CFrame.new()
        p_u_58:toggle_humanoid_state(true)
        p_u_58:enable_paraglider()
        if p_u_58.starting_velocity.Y < 0 then
            v60:ApplyImpulse(-(p_u_58.starting_velocity * Vector3.new(0, 1, 0)) * v60.AssemblyMass)
        end
        if not p_u_58.is_toy then
            for _, v61 in game:GetService("CollectionService"):GetTagged("disable_paraglider_collisions") do
                v61.CanCollide = false
            end
            for _, v62 in game:GetService("CollectionService"):GetTagged("enable_paraglider_collisions") do
                v62.CanCollide = true
            end
        end
        if v59 then
            p_u_58.speed_spring:set_position(0)
        end
        v_u_6.defer(function()
            p_u_58.skid_multiplier = 1
        end)
        p_u_58.flight_cleanup:GiveTask(function()
            local v_u_63 = 0
            local v_u_64 = false
            if p_u_58.exclude_skid_forces then
                p_u_58:toggle_forces(false)
            else
                v_u_6.any({ v_u_6.new(function(p65, _, p66)
                        while not p66() and (v_u_63 < 1.5 and p_u_58.paraglider_state == "Force_Stop") do
                            local v67 = game:GetService("RunService").RenderStepped:Wait()
                            if v_u_64 then
                                break
                            end
                            local v68 = p_u_58
                            local v69 = v_u_63 / 1.5
                            v68.skid_multiplier = 1 + -1 * math.clamp(v69, 0, 1)
                            p_u_58:update_forces(v67, true)
                            v_u_63 = v_u_63 + v67
                        end
                        p65()
                    end), v_u_6.fromEvent(p_u_58.force_cleanup), v_u_6.new(function(p70, _, _)
                        if p_u_58.exclude_skid_forces then
                            p70()
                        end
                    end) }):finally(function()
                    v_u_64 = true
                    p_u_58.skid_multiplier = 1
                end)
            end
        end)
        p_u_58.flight_cleanup:GiveTask(function()
            v_u_6.defer(function()
                p_u_58:toggle_humanoid_state(false)
                p_u_58.tracks.paraglider_flight_idle_1:Stop()
            end)
        end)
        p_u_58.flight_cleanup:GiveTask(p_u_58.jump_request:Connect(function(p71)
            if p71 then
                p_u_58:stop_flight(true)
            end
        end))
        p_u_58.is_flying = true
    end
end
function v2.toggle_humanoid_state(p72, p73)
    local v74 = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    v74.PlatformStand = p73 or false
    v74:ChangeState(p73 and Enum.HumanoidStateType.Physics or Enum.HumanoidStateType.Freefall)
    p72.tracks.paraglider_flight_idle_1:Play()
end
function v2.enable_paraglider(p_u_75)
    if p_u_75.paraglider_download_promise then
        p_u_75.paraglider_download_promise:cancel()
    end
    p_u_75.paraglider_download_promise = v_u_6.try(function()
        return v_u_4.get("ToolAPI/CreateParagliderObject"):InvokeServer(p_u_75.paraglider_model_id, p_u_75.is_toy)
    end):andThen(function(p_u_76)
        local v_u_77 = game.Players.LocalPlayer
        return v_u_6.retryWithDelay(function()
            for _, v78 in v_u_77.Character:GetChildren() do
                if v78:GetAttribute("ParagliderIdentifier") == p_u_76 then
                    p_u_75.paraglider_object = v78
                    local v79 = v_u_8.get_platform()
                    if v79 == "phone" or v79 == "tablet" then
                        for _, v80 in p_u_75.paraglider_object:GetDescendants() do
                            if v80:IsA("BasePart") then
                                local v81 = v80.Transparency
                                v80.Transparency = math.max(v81, 0.4)
                            end
                        end
                    end
                    return v_u_6.resolve()
                end
            end
            return v_u_6.reject()
        end, 20, 0.25)
    end):andThen(function()
        p_u_75.paraglider_trails = {}
        for _, v82 in p_u_75.paraglider_object.PrimaryPart.WindTrail:GetChildren() do
            p_u_75.paraglider_trails[v82] = {
                ["Transparency"] = v_u_10.new(3, 1),
                ["Lifetime"] = v_u_10.new(3, 1)
            }
        end
        if p_u_75.is_toy then
            p_u_75:setup_ground_part()
        end
        v_u_7.FX:play("GliderOpen")
        p_u_75.rustle_loop = v_u_7.FX:loop("GliderRustleLoop", p_u_75.paraglider_object.PrimaryPart)
    end):catch(warn)
    p_u_75.flight_cleanup:GiveTask(function()
        p_u_75.paraglider_trails = {}
        p_u_75.paraglider_object = nil
        if p_u_75.rustle_loop then
            p_u_75.rustle_loop:Stop()
        end
        v_u_7.FX:play("GliderClose")
        v_u_4.get("ToolAPI/CleanupParagliderObject"):FireServer()
    end)
end
function v2.stop_flight(p_u_83, p84)
    p_u_83.is_forced = p84
    p_u_83.is_flying = false
    p_u_83.paraglider_state = p84 and "Force_Stop" or "Falling"
    p_u_83.flight_cleanup:DoCleaning()
    if p_u_83.end_flight_fov_effect then
        p_u_83.end_flight_fov_effect:cancel()
    end
    p_u_83.end_flight_fov_effect = v_u_6.delay(1):andThen(function()
        return v_u_6.new(function(p85, _, p86)
            repeat
                local v87 = game:GetService("RunService").RenderStepped:Wait()
                p_u_83.fov_spring:set_goal(p_u_83.fov_base)
                workspace.CurrentCamera.FieldOfView = p_u_83.fov_spring:update(v87)
            until p86() or workspace.CurrentCamera.FieldOfView <= p_u_83.fov_base + 0.1 and workspace.CurrentCamera.FieldOfView > p_u_83.fov_base - 0.1
            p85()
        end)
    end):andThen(function()
        workspace.CurrentCamera.FieldOfView = p_u_83.fov_base
    end)
    local function v90(p88)
        return v_u_6.fromEvent(p88, function(p89)
            if p_u_83:is_player_in_glider_blocker() then
                return false
            else
                return type(p89) == "boolean" and p89 and p89 or p89 == "Idle"
            end
        end)
    end
    local v91 = {}
    local v92 = p_u_83.state_changed
    __set_list(v91, 1, {v_u_6.fromEvent(v92, function(p93)
    if p_u_83:is_player_in_glider_blocker() then
        return false
    else
        return type(p93) == "boolean" and p93 and p93 or p93 == "Idle"
    end
end), v90(p_u_83.jump_request)})
    local v_u_94 = v_u_6.any(v91):andThen(function()
        if p_u_83.paraglider_state == "Force_Stop" then
            p_u_83:start_flight()
        else
            p_u_83:toggle_forces(false)
        end
    end)
    p_u_83.flight_cleanup:GiveTask(function()
        if v_u_94 then
            v_u_94:cancel()
        end
    end)
end
function v2.freeze_state(p95)
    p95.keep_current_state = true
end
function v2.thaw_state(p96)
    p96.keep_current_state = false
end
function v2.do_force_cleanup(p97)
    p97.force_cleanup:Fire()
end
function v2.update_state(p98)
    local v99 = game.Players.LocalPlayer.Character
    if v99:FindFirstChild("HumanoidRootPart") and v99:FindFirstChild("Humanoid") then
        local v100 = p98:get_ground()
        if p98.last_ground_check ~= v100 then
            p98.time_since_update = tick()
            p98.last_ground_check = v100
        end
        if not p98.keep_current_state then
            if p98.paraglider_state == "Force_Stop" and v100 then
                p98:exit_force_stop_state()
            elseif p98.paraglider_state == "Idle" or not v100 then
                if not p98.exclude_takeoff_checks and (p98.paraglider_state == "Idle" and not (v100 or p98.is_forced)) then
                    p98:begin_takeoff_state()
                end
            else
                p98:handle_idle_state()
            end
            if p98.paraglider_state == "Takeoff" then
                p98:check_takeoff_state()
            end
            p98:fire_state_changed_event()
        end
    else
        return
    end
end
function v2.update_from_humanoid_state(p101, p102)
    if p102 == Enum.HumanoidStateType.Landed then
        if p101.paraglider_state == "Force_Stop" then
            p101:exit_force_stop_state()
            return
        end
        p101:handle_idle_state()
    end
end
function v2.exit_force_stop_state(p103)
    p103.is_forced = false
    p103.paraglider_state = "Idle"
    p103:toggle_forces(false)
end
function v2.handle_idle_state(p104)
    if p104.is_flying then
        p104:stop_flight()
    end
    p104.is_forced = false
    p104.paraglider_state = "Idle"
    if not p104.is_toy then
        local v105 = game:GetService("CollectionService"):GetTagged("disable_paraglider_collisions")
        local v106 = OverlapParams.new()
        v106.FilterType = Enum.RaycastFilterType.Include
        v106:AddToFilter(v105)
        if p104.hrp then
            local v107 = workspace:GetPartsInPart(p104.hrp, v106)
            if #v107 > 0 then
                for _, v108 in v107 do
                    local v109 = v108.Position + v108.Size / 2 * Vector3.new(0, 1, 0) - p104.hrp.Position
                    local v110 = p104.character
                    local v111 = v109.Y + p104.hrp.Size.Y / 2
                    v110:TranslateBy((Vector3.new(0, v111, 0)))
                end
            end
        end
        for _, v112 in game:GetService("CollectionService"):GetTagged("disable_paraglider_collisions") do
            v112.CanCollide = true
        end
        for _, v113 in game:GetService("CollectionService"):GetTagged("enable_paraglider_collisions") do
            v113.CanCollide = false
        end
    end
end
function v2.begin_takeoff_state(p114)
    p114.paraglider_state = "Takeoff"
end
function v2.check_takeoff_state(p115)
    if not p115:is_player_in_glider_blocker() and tick() - (p115.time_since_update or tick()) > p115.flight_intervals.takeoff then
        p115:start_flight()
    end
end
function v2.get_direction(p116)
    return p116.last_direction
end
function v2.updraft_push(p_u_117, p118, p119)
    if p_u_117.is_destroyed then
        return v_u_6.resolve()
    end
    if p_u_117.is_anchored then
        return v_u_6.resolve()
    end
    if p_u_117.paraglider_state ~= "Active" then
        p_u_117:freeze_state()
        p_u_117:start_flight()
    end
    v_u_7.FX:play("AirBoost")
    if p_u_117.updraft_tween_promise then
        p_u_117.updraft_tween_promise:cancel()
    end
    p_u_117.updraft_multiplier = p119 or 1
    p_u_117.speed_spring:set_position(-10)
    p_u_117.updraft_tween_promise = v_u_6.all({ v_u_5.callback(p_u_117.updraft_multiplier, 0, TweenInfo.new(p118 or p_u_117.updraft_duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), function(p120)
            p_u_117.updraft_multiplier = p120
        end), v_u_6.delay(0.5):finally(function()
            p_u_117:thaw_state()
        end) }):finally(function()
        p_u_117.updraft_multiplier = 0
    end)
    return p_u_117.updraft_tween_promise
end
function v2.fire_state_changed_event(p121)
    if p121.last_state ~= p121.paraglider_state then
        p121.last_state = p121.paraglider_state
        p121.state_changed:Fire(p121.paraglider_state)
    end
end
function v2.update_forces(p_u_122, p_u_123, p124)
    if p_u_122.paraglider_state == "Active" or p124 then
        p_u_122.flight_elapsed_time = p_u_122.flight_elapsed_time + p_u_123
        local v125 = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if v125 then
            local v126 = v125.AssemblyMass
            local v127 = workspace.CurrentCamera
            local v128 = -v127.CFrame.LookVector * Vector3.new(1, 0, 1)
            local v129 = v127.CFrame.RightVector
            local v130 = p_u_122.control_module:GetMoveVector()
            local v131 = v128 * v130.Z + v129 * v130.X
            local v132 = v125.AssemblyLinearVelocity
            local v133 = v132.Unit
            local v134 = v132 * Vector3.new(1, 0, 1)
            local v135 = v131:Dot(v133)
            local v136 = 1
            local v137 = p_u_122.last_direction * Vector3.new(1, 0, 1) or v125.CFrame.LookVector * Vector3.new(1, 0, 1)
            if v131.Magnitude > 0 then
                v137 = v137:lerp(v131.Unit, 0.05)
            end
            local v138 = p_u_122.updraft_multiplier
            local v139 = p_u_122.air_resistance_booster
            local v140 = Vector3.new(0, 1, 0) * p_u_122.updraft_speed * v126 * p_u_122.air_resistance_booster
            local v141 = Vector3.new(0, 1, 0) * p_u_122.updraft_speed * v126 * v138
            p_u_122.speed_spring:set_goal(p_u_122.speed_base + p_u_122.speed_boost * (1 - v135))
            p_u_122.fov_spring:set_goal(p_u_122.fov_base + p_u_122.fov_boost * v135)
            local v142 = p_u_122.speed_spring:get_position()
            local v_u_143 = p_u_122.speed_spring:update(p_u_123)
            local v144 = p_u_122.fov_spring:update(p_u_123)
            local v145 = -0.4 * v135
            local v146 = Vector3.new(0, v145, 0)
            if v142 < p_u_122.takeoff_speed and p_u_122.takeoff_speed <= v_u_143 then
                p_u_122.takeoff_speed_reached:Fire()
            end
            workspace.CurrentCamera.FieldOfView = v144
            local v147 = v134.Magnitude
            if p_u_122.flight_elapsed_time > 3 and v147 < p_u_122.fall_speed then
                v136 = 1 + -0.07499999999999996 * (1 - v147 / p_u_122.fall_speed)
            end
            if v133.Y > 0 then
                v125.AssemblyLinearVelocity = v132 * Vector3.new(1, 0, 1)
            end
            local v148 = v_u_143 * v137
            local v149 = v132 - v132:Dot(Vector3.new(0, 1, 0)) * Vector3.new(0, 1, 0)
            local v150 = v148 - (v149:Dot(v149) < 1 and Vector3.new(0, 0, 0) or v149)
            local v151 = v150.Magnitude
            local v152 = v137 * v126 * v_u_143 / (p_u_123 * 60)
            local v153 = v_u_143 * v126 * v151 / (p_u_123 * 60)
            local v154 = math.min(10000, v153) * 0.2
            if v154 > 0 then
                v152 = v150 / v151 * v154 or v152
            end
            local v155 = Vector3.new(0, 1, 0) * workspace.Gravity * v126 * p_u_122.gravity_multiplier * v136
            local v156 = v125.CFrame.LookVector:Cross(v137)
            v125:ApplyImpulse((v155 * p_u_123 + v141 + v140) * (p_u_122.skid_multiplier == 1 and 1 or 0))
            p_u_122.move_force.Force = v152 * p_u_122.skid_multiplier
            p_u_122.align_orientation.CFrame = CFrame.lookAt(Vector3.new(), v137 + v146) * CFrame.Angles(0.5235987755982988 * (v138 + v139 + (p_u_122.tilt_y_offset or 0)), 0, v156.Y * 1.0471975511965976)
            p_u_122.velocity = v132.Unit
            if p_u_122.paraglider_object and p_u_122.paraglider_object.PrimaryPart then
                local v_u_157 = v156.Y
                local v_u_158 = -0.2 * (v_u_143 * p_u_123)
                local function v179(p159)
                    local v160 = p159:GetAttribute("is_right")
                    local v161 = p159.A
                    local v162 = p159.B
                    local v163 = v_u_157 * 1.2
                    local v164 = math.abs(v163) + 0.5
                    local v165 = -v164 / 2
                    v161.Position = Vector3.new(v165, 0, 0)
                    local v166 = v164 / 2
                    v162.Position = Vector3.new(v166, 0, 0)
                    local v167 = p_u_122.paraglider_trails[p159]
                    local v168 = v_u_143 * p_u_123
                    local v169 = v_u_157
                    local v170 = math.abs(v169)
                    local v171 = v168 * math.clamp(v170, 0.1, 1)
                    v167.Lifetime:set_goal(v171)
                    local v172 = v167.Lifetime:update(p_u_123)
                    local v173 = v_u_157
                    local v174 = v_u_158 + 0.2 + (1 - math.abs(v173))
                    local v175 = math.clamp(v174, 0, 1)
                    if not v160 or (v_u_157 <= 0.2 or not v175) then
                        v175 = (v160 or (v_u_157 >= -0.2 or not v175)) and 0.85 or v175
                    end
                    local v176 = v167.Transparency
                    v176:set_goal(v175)
                    local v177 = v176:update(p_u_123)
                    local v178 = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1, 0),
                        NumberSequenceKeypoint.new(0.210461, v177, 0.3),
                        NumberSequenceKeypoint.new(0.511831, v177, 0.2),
                        NumberSequenceKeypoint.new(1, 1, 0)
                    })
                    p159.Trail.Transparency = v178
                    p159.Trail.Lifetime = v172
                end
                for _, v180 in p_u_122.paraglider_object.PrimaryPart.WindTrail:GetChildren() do
                    v179(v180)
                end
            end
            p_u_122.last_direction = v137
        end
    end
end
function v2.get_velocity(p181)
    return p181.velocity
end
function v2.update(p182, p183, p184)
    if not (p184 or p182.is_toy) then
        p182:update_state()
    end
    p182:update_forces(p183, p184)
end
function v2.destroy(p185)
    p185.is_destroyed = true
    p185.flight_cleanup:DoCleaning()
    p185.paraglider_cleanup:DoCleaning()
    p185.takeoff_cleanup:DoCleaning()
    if p185.updraft_tween_promise then
        p185.updraft_tween_promise:cancel()
    end
    if p185.paraglider_download_promise then
        p185.paraglider_download_promise:cancel()
    end
    v_u_4.get("ToolAPI/CleanupParagliderObject"):FireServer()
end
return v2