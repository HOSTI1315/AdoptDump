--// ReplicatedStorage.ClientModules.Game.PetPathfinding (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("Raycast")
local v_u_4 = v1("TableUtil")
local v_u_5 = v1("Utilities")
local v_u_6 = v1("Debug").create_log()
local v_u_7 = game:GetService("PathfindingService")
local v_u_8 = {
    Vector3.new(3.5, 0, 0),
    Vector3.new(-3.5, 0, 0),
    Vector3.new(0, 0, 3.5),
    Vector3.new(0, 0, -3.5)
}
local v9 = v2("PetPathfinding")
function v9.__init(p10, p11)
    p10.char = p11
    p10.hrp = p11:WaitForChild("HumanoidRootPart")
    p10.humanoid = p11:WaitForChild("Humanoid")
    p10.target_type = "none"
    p10.is_following_path = false
    p10.current_path = nil
    p10.current_waypoint = Vector3.new()
    p10.last_time_pathing_as_expected = (1 / 0)
    p10.last_dist_to_waypoint = (1 / 0)
    function p10.finish_condition()
        return false
    end
end
function v9.cancel(p12)
    p12.is_following_path = false
    p12.target_type = "none"
end
function v9.pathfind_to_owner(p_u_13)
    local v_u_14 = game.Players.LocalPlayer.Character
    local v_u_15
    if v_u_14 then
        v_u_15 = v_u_14:FindFirstChild("HumanoidRootPart")
    else
        v_u_15 = v_u_14
    end
    if v_u_15 then
        p_u_13:pathfind_to_target(v_u_15, false, function()
            if (p_u_13.hrp.Position - v_u_15.Position).magnitude < 7 and not p_u_13:get_is_obstructed_from_target(v_u_15, { v_u_14 }) then
                return true
            end
        end)
        p_u_13.target_type = "owner"
    end
end
local v_u_16 = 0
function v9.pathfind_to_target(p_u_17, p_u_18, p_u_19, p20)
    v_u_16 = v_u_16 + 1
    local v_u_21 = v_u_16
    v_u_6("recomputing path...", v_u_21)
    local v_u_22
    if typeof(p_u_18) == "Vector3" then
        v_u_22 = p_u_18
    else
        v_u_22 = p_u_18.Position
    end
    p_u_17.is_following_path = true
    p_u_17.target_type = "point"
    p_u_17.target_pos = v_u_22
    p_u_17.last_time_pathing_as_expected = tick()
    p_u_17.finish_condition = p20 or function()
        return false
    end
    p_u_17.humanoid:MoveTo(v_u_22)
    p_u_17.current_path = v_u_7:CreatePath({
        ["AgentRadius"] = 2,
        ["AgentHeight"] = 3,
        ["AgentCanJump"] = true
    })
    coroutine.wrap(function()
        p_u_17.current_path:ComputeAsync(p_u_17.hrp.CFrame * Vector3.new(0, 0, 1), v_u_22)
        v_u_6("computed path \226\156\168", v_u_21)
        if p_u_17.is_following_path then
            if p_u_17.current_path.Status == Enum.PathStatus.Success then
                p_u_17:walk_through_waypoints(p_u_18, p_u_17.current_path:GetWaypoints(), p_u_19)
            else
                v_u_6("Path failed, teleporting")
                p_u_17:emergency_teleport()
            end
        else
            return
        end
    end)()
end
function v9.walk_through_waypoints(p_u_23, p_u_24, p_u_25, p26)
    local v_u_27
    if typeof(p_u_24) == "Vector3" then
        v_u_27 = p_u_24
    else
        v_u_27 = p_u_24.Position
    end
    local v_u_28 = p_u_23.current_path
    local v_u_29
    if p26 then
        local v30 = p_u_23.hrp.Position
        local v31 = (1 / 0)
        v_u_29 = 1
        for v32, v33 in ipairs(p_u_25) do
            local v34 = (v30 - v33.Position).magnitude
            if (v30 - v33.Position).magnitude >= v31 then
                break
            end
            v_u_29 = v32
            v31 = v34
        end
    else
        v_u_29 = 0
    end
    if game:GetService("RunService"):IsStudio() then
        v_u_5.clear_marks()
        for _, v35 in pairs(p_u_25) do
            v_u_5.mark(v35.Position)
        end
    end
    local v_u_36 = nil
    local function v_u_45()
        local v37 = p_u_24
        local v38
        if typeof(v37) == "Vector3" then
            v38 = true
        else
            local v39 = p_u_24.Position - v_u_27
            local v40 = v39.X
            local v41 = v39.Z
            v38 = Vector3.new(v40, 0, v41).magnitude < 20
        end
        if v_u_28 == p_u_23.current_path and (v_u_29 < #p_u_25 and (p_u_23.is_following_path and v38)) then
            v_u_29 = v_u_29 + 1
            debug.profilebegin("checkCullWaypoint")
            local v42 = p_u_25[v_u_29]
            local v43 = p_u_25[v_u_29 + 1]
            local v44
            if v43 and (v42.Action == Enum.PathWaypointAction.Walk and v43.Action == Enum.PathWaypointAction.Walk) then
                v44 = (v42.Position - v43.Position).magnitude < 0.25
            else
                v44 = false
            end
            debug.profileend()
            if v44 then
                v_u_45()
                return
            end
            p_u_23.current_waypoint = v42.Position
            p_u_23.humanoid:MoveTo(v42.Position)
            if v42.Action == Enum.PathWaypointAction.Jump then
                p_u_23.humanoid.Jump = true
                return
            end
        else
            if v_u_28 == p_u_23.current_path then
                p_u_23.is_following_path = false
            end
            v_u_36:Disconnect()
        end
    end
    p_u_23.humanoid.WalkSpeed = 24
    p_u_23.current_path.Blocked:Connect(function()
        if v_u_28 == p_u_23.current_path then
            v_u_6("PATH WAS BLOCKED! recompute......")
            p_u_23:pathfind_to_target(p_u_24)
        end
    end)
    v_u_36 = p_u_23.humanoid.MoveToFinished:Connect(v_u_45)
    v_u_45()
end
function v9.is_safe_to_teleport(p46, p47)
    local v48 = Ray.new(p47, Vector3.new(0, -5, 0))
    return v_u_3.FindPartOnRay(v48, { p46.char, game.Players.LocalPlayer.Character }, nil, {
        ["ignore_transparent"] = false
    }) ~= nil
end
function v9.emergency_teleport(p49)
    local v50 = game.Players.LocalPlayer.Character
    if v50 then
        v50 = v50:FindFirstChild("HumanoidRootPart")
    end
    local v51
    if p49.target_type == "point" and p49.target_pos then
        v51 = CFrame.new(p49.target_pos)
    else
        v51 = v50.CFrame
    end
    p49.is_following_path = false
    if not p49.hrp.Anchored then
        for _, v52 in ipairs(v_u_8) do
            local v53 = v51 * v52
            if p49:is_safe_to_teleport(v53) then
                p49.hrp.CFrame = CFrame.new(v53)
                return
            end
        end
        p49.hrp.CFrame = v51 * CFrame.new(0, 5, 0)
    end
end
function v9.get_status(p54)
    if not p54.is_following_path or p54.finish_condition() == true then
        return false
    end
    if not p54:check_is_pathfinding_stuck() then
        return true
    end
    p54:emergency_teleport()
    return false
end
function v9.check_is_pathfinding_stuck(p55)
    local v56 = p55.hrp.Position
    if p55.last_position then
        local v57 = p55.last_position - v56
        local v58 = v57.X
        local v59 = v57.Z
        if Vector3.new(v58, 0, v59).magnitude >= 1 then
            p55.last_position = v56
            p55.last_time_pathing_as_expected = tick()
            ::l4::
            return tick() - p55.last_time_pathing_as_expected > 0.5
        end
    end
    if not p55.last_position then
        p55.last_position = v56
    end
    goto l4
end
function v9.get_is_obstructed_from_target(p60, p61, p62, p63)
    local v64 = v_u_4.append_elements_to_table({ p60.char }, p62 or {})
    local v65 = p60.hrp.Position
    local v66 = Ray.new(v65, p61.Position - v65)
    local v67, v68 = v_u_3.FindPartOnRay(v66, v64, nil, {
        ["ignore_transparent"] = false
    })
    if v67 and (p63 and (p61.position - v68).magnitude <= p63) then
        return false
    else
        return v67 ~= nil
    end
end
return v9