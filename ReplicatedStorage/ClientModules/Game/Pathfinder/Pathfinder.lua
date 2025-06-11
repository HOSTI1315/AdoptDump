--// ReplicatedStorage.ClientModules.Game.Pathfinder (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v3 = v1("ServerType")
local v_u_4 = v1("package:Promise")
local v_u_5 = v1("Maid")
local v_u_6 = v1("Debug").create_log()
local v_u_7 = game:GetService("PathfindingService")
local v_u_8 = {
    ["FailStartNotEmpty"] = true,
    ["FailFinishNotEmpty"] = true,
    ["NoPath"] = true
}
v3.use_production_behavior()
local v9 = false
local v10 = false
local v_u_11 = false
local v_u_12 = v9 and function(...)
    warn("[Pathfinder] [DBG]", ...)
end or function() end
local v_u_13 = not v10 and function() end or v_u_12
local function v_u_21(p14, p15, p16)
    local v17 = p16 and Vector3.new(1, 0, 0) or Vector3.new(0, 0, 1)
    local v18 = Color3.new(v17.x, v17.y, v17.z)
    local v19 = Instance.new("Part")
    Instance.new("Attachment", v19).Name = "PreAttachment"
    Instance.new("Attachment", v19).Name = "PostAttachment"
    v19.TopSurface = Enum.SurfaceType.Smooth
    v19.BottomSurface = Enum.SurfaceType.Smooth
    if p15 == "Walk" or p15 == "Teleport" then
        v19.Shape = Enum.PartType.Ball
        v19.Size = Vector3.new(1, 1, 1)
        v19.CFrame = CFrame.new(p14)
    elseif p15 == "Jump" then
        v19.Size = Vector3.new(0.5, 4, 0.5)
        v19.CFrame = CFrame.new(p14 + Vector3.new(0, 2, 0))
        v17 = v17:Lerp(Vector3.new(1, 1, 1), 0.5)
        v19.PreAttachment.Position = Vector3.new(0, 2, 0)
        v19.PostAttachment.Position = Vector3.new(0, -2, 0)
    end
    v19.Color = Color3.new(v17.x, v17.y, v17.z)
    v19.Anchored = true
    v19.CanCollide = false
    v19.CanTouch = false
    v19.CanQuery = false
    v19.Name = "DBG Pathfinder"
    local v20 = Instance.new("Beam")
    v20.Transparency = NumberSequence.new(0)
    v20.FaceCamera = true
    v20.Width0 = 0.5
    v20.Width1 = 0.5
    v20.Color = ColorSequence.new(v18)
    v20.Attachment1 = v19.PreAttachment
    v20.Parent = v19
    return v19
end
local v22 = v2("Pathfinder")
function v22.set_debug_visualizations_enabled(p23)
    v_u_11 = p23
end
function v22.__init(p24, p25)
    v_u_12("Creating Pathfinder")
    assert(p25, "Expected options")
    local v26 = p25.get_target_position
    assert(v26, "Expected get_target_position")
    local v27 = p25.get_agent_position
    assert(v27, "Expected get_agent_position")
    p24.options = p25
    p24._debug_created_at = debug.traceback(nil, 2)
    p24._current_path_data = nil
    p24._compute_next_path_promise = nil
    p24._next_path_data = nil
    p24._cached_agent_position = nil
    p24._cached_target_position = nil
    p24._path_failed = false
    p24._path_failed_reason = nil
    v_u_12("Computing initial path...")
    p24:_compute_next_path()
end
function v22._draw_debug_points(p28)
    if not p28._debug_agent_part then
        p28._debug_agent_part = v_u_21(p28:_get_agent_position(), "Walk")
        p28._debug_agent_part.Name = "DBG Pathfinder Agent"
        p28._debug_agent_part.Color = Color3.new(0, 1, 1)
        local v29 = Instance.new("Highlight")
        v29.Name = "Outline"
        v29.FillColor = Color3.new(0, 1, 1)
        v29.OutlineColor = Color3.new(0, 1, 1)
        v29.FillTransparency = 0
        v29.Parent = p28._debug_agent_part
        p28._debug_agent_part.Parent = workspace
    end
    if not p28._debug_target_part then
        p28._debug_target_part = p28._debug_agent_part:Clone()
        p28._debug_target_part.Name = "DBG Pathfinder Target"
        p28._debug_target_part.Color = Color3.new(0, 1, 0)
        p28._debug_target_part.Outline.FillColor = Color3.new(0, 1, 0)
        p28._debug_target_part.Outline.OutlineColor = Color3.new(0, 1, 0)
        p28._debug_target_part.Parent = workspace
    end
    local v30 = p28:_get_agent_position()
    local v31 = p28:_get_target_position()
    if typeof(v30) == "Vector3" then
        p28._debug_agent_part.CFrame = CFrame.new(v30)
    else
        warn("Expected get_agent_position to return a Vector3. Instead returned: " .. typeof(v30))
    end
    if typeof(v31) == "Vector3" then
        p28._debug_target_part.CFrame = CFrame.new(v31)
    else
        warn("Expected get_target_position to return a Vector3. Instead returned: " .. typeof(v31))
    end
end
function v22._draw_debug_path(p32, p33)
    if v_u_11 then
        if p33.debug_parts_folder then
            local v_u_34 = p33.debug_parts_folder
            task.delay(5, function()
                v_u_34:Destroy()
            end)
        end
        p33.debug_parts_folder = Instance.new("Folder")
        local v35 = nil
        for v36, v37 in ipairs(p33.waypoints) do
            local v38 = v_u_21(v37.position, v37.action, p32._current_path_data == p33)
            v38.Name = "DBG Pathfinder " .. v36
            v38.Parent = p33.debug_parts_folder
            if v35 then
                v38.Beam.Attachment0 = v35.PostAttachment
            end
            v35 = v38
        end
        p33.debug_parts_folder.Parent = workspace
    end
end
function v22._get_agent_position(p39)
    local v40 = p39.options.get_agent_position()
    local v41 = "options.get_agent_position failed to return a position. Created at:\n" .. p39._debug_created_at
    return assert(v40, v41)
end
function v22._get_target_position(p42)
    return p42.options.get_target_position()
end
function v22._truncate_current_path(p43, p44)
    if p43._current_path_data then
        if p44 <= p43._current_path_data.index then
            warn("[Pathfinder] TRIED TO TRUNCATE CURRENT INDEX! (", p43._current_path_data.index, "->", p44)
            p43._current_path_data.index = p44 - 1
        end
        local v45 = p43._current_path_data.waypoints
        for v46 = #v45, p44, -1 do
            v45[v46] = nil
        end
        p43:_draw_debug_path(p43._current_path_data)
    end
end
function v22._truncate_current_path_from_distance(p47, p48, p49)
    if not p47._current_path_data then
        return
    end
    local v50 = p47._current_path_data
    local v51 = p47:_get_agent_position()
    local v52 = p47._current_path_data.waypoints
    local v53 = p49 or #v52 + 1
    if p48 <= 0 then
        v52[v50.index].position = v51
        v53 = v50.index + 1
    else
        local v54 = 0
        for v55 = v50.index, v53 - 1 do
            local v56 = (v51 - v52[v55].position).Magnitude
            if p48 <= v54 + v56 then
                local v57 = (p48 - v54) / v56
                v52[v55].position = v51:Lerp(v52[v55].position, v57)
                v53 = v55 + 1
                break
            end
            v54 = v54 + v56
            v51 = v52[v55].position
        end
    end
    p47:_truncate_current_path(v53)
end
function v22._on_current_path_blocked(p58, p59)
    local v60 = p58._current_path_data
    local v61 = nil
    for v62, v63 in ipairs(v60) do
        if p59 <= v63._raw_index then
            v61 = v62
            break
        end
    end
    if v61 == nil then
        return
    elseif v61 < v60.index then
        return
    elseif p58:has_next_waypoint() then
        if v61 == v60.index then
            p58:_truncate_current_path_from_distance(0, v61)
        else
            p58:_truncate_current_path_from_distance(p58.options.truncate_keep_distance or 5, v61)
        end
        v_u_12("Computing next path because on_current_path_blocked...")
        p58:_compute_next_path(true)
    end
end
function v22._clear_next_path_data(p64)
    if p64._next_path_data then
        p64._next_path_data.maid:DoCleaning()
    end
    p64._next_path_data = nil
end
function v22._set_next_path_data(p_u_65, p_u_66)
    p_u_66.maid = v_u_5.new()
    p_u_66.maid:GiveTask(p_u_66.path.Blocked:Connect(function(p67)
        if p_u_65._current_path_data == p_u_66 then
            p_u_65:_on_current_path_blocked(p67)
        else
            p_u_65:_clear_next_path_data()
            v_u_12("Computing next path because next_path blocked...")
            p_u_65:_compute_next_path()
        end
    end))
    if v_u_11 then
        p_u_65:_draw_debug_path(p_u_66)
    end
    p_u_66.maid:GiveTask(function()
        if p_u_66.debug_parts_folder then
            p_u_66.debug_parts_folder:Destroy()
        end
    end)
    if p_u_65._next_path_data then
        p_u_65._next_path_data.maid:DoCleaning()
    end
    p_u_65._next_path_data = p_u_66
end
function v22._promote_next_path_to_current(p68, p69)
    if p68._next_path_data then
        v_u_12("Promoting next_path_data to current_path_data")
        if p68._current_path_data then
            p68._current_path_data.maid:DoCleaning()
        end
        p68._current_path_data = p68._next_path_data
        p68._next_path_data = nil
        if not p69 and (p68._compute_next_path_promise and p68._compute_next_path_promise:getStatus() == "Started") then
            v_u_12("Recomputing path because running compute is outdated...")
            p68:_compute_next_path(true)
        end
        p68:_draw_debug_path(p68._current_path_data)
    end
end
function v22._compute_next_path(p_u_70, p71)
    v_u_12("Computing next path...")
    if p_u_70._compute_next_path_promise and p_u_70._compute_next_path_promise:getStatus() == "Started" then
        if not p71 then
            v_u_12("  Not computing because compute_next_path already running")
            return
        end
        v_u_12("  Cancelling existing compute_next_path")
        p_u_70._compute_next_path_promise:cancel()
    end
    if p_u_70._current_path_data then
        p_u_70._current_path_data.needs_next_path = true
    end
    local v_u_72 = p_u_70.options.max_attempts or 5
    local v_u_73 = p_u_70.options.recompute_debounce or 1
    local v_u_74 = nil
    if p_u_70._current_path_data then
        local v75 = p_u_70._current_path_data.waypoints
        v_u_74 = v75[#v75].position
        v_u_12("  Using end waypoint of current path")
    else
        v_u_12("  Using pet\'s position")
    end
    p_u_70._compute_next_path_promise = v_u_4.async(function(p76, p77, p78)
        for _ = 1, v_u_72 do
            local v79, v80 = p_u_70:_compute_raw_path(v_u_74):await()
            if p78() then
                return
            end
            if v79 then
                return p76(v80)
            end
            v_u_6("Failed to compute path because:", v80)
            if v_u_73 > 0 then
                wait(v_u_73)
                if p78() then
                    return
                end
            end
        end
        p77("Hit max_attempts")
    end):andThen(function(p81)
        v_u_12("compute_next_path found a path!")
        p_u_70:_set_next_path_data(p81)
        if p_u_70._current_path_data and not p_u_70._current_path_data.has_next_waypoint then
            p_u_70:_promote_next_path_to_current(true)
        elseif not p_u_70._current_path_data then
            p_u_70:_promote_next_path_to_current(true)
        end
    end):catch(function(p82)
        v_u_12("compute_next_path failed! because:", p82)
        p_u_70:_set_path_failed(p82)
    end)
end
function v22._compute_raw_path(p_u_83, p_u_84)
    v_u_12("Computing raw path...")
    local v85 = p_u_83.options
    local v_u_86 = v_u_7:CreatePath({
        ["AgentRadius"] = v85.agent_radius,
        ["AgentHeight"] = v85.agent_height,
        ["AgentCanJump"] = v85.agent_can_jump,
        ["Costs"] = v85.costs
    })
    return v_u_4.async(function(p87, p88, _)
        local v89 = p_u_83:_get_target_position()
        local v90 = p_u_84 or p_u_83:_get_agent_position()
        if v89 == nil then
            return p88("Missing target position")
        end
        if (v90 - v89).Magnitude > 2000 then
            return p88("Path shortest distance is too high!")
        end
        v_u_86:ComputeAsync(v90, v89)
        v_u_12("Computed! Status:", v_u_86.Status.Name)
        if v_u_8[v_u_86.Status.Name] then
            return p88(v_u_86.Status.Name)
        end
        local v91 = {}
        table.insert(v91, {
            ["position"] = v90,
            ["action"] = "Walk"
        })
        local v92 = v_u_86:GetWaypoints()
        for v93, v94 in ipairs(v92) do
            local v95 = v92[v93 - 1]
            local v96 = v92[v93 + 1]
            local v97 = nil
            if v95 and (v96 and (v96.Action.Name ~= "Jump" and v94.Action.Name ~= "Jump")) then
                local v98 = v94.Position - v95.Position
                local v99 = v98.X
                local v100 = v98.Z
                local v101 = Vector3.new(v99, 0, v100).Unit
                local v102 = v96.Position - v94.Position
                local v103 = v102.X
                local v104 = v102.Z
                local v105 = v101:Dot(Vector3.new(v103, 0, v104).Unit)
                local v106 = math.clamp(v105, -1, 1)
                local v107 = math.acos(v106)
                local v108 = math.deg(v107)
                v97 = (v108 ~= v108 or v108 < (p_u_83.options.segment_angle_difference_cull_threshold or 5)) and true or v97
            end
            if not v97 then
                local v109 = {
                    ["position"] = v94.Position,
                    ["action"] = v94.Action.Name,
                    ["_raw_index"] = v93
                }
                table.insert(v91, v109)
            end
        end
        if #v91 < 2 then
            v_u_12("Got a path with too few waypoints. Discarding...")
            p88("Too few waypoints")
        end
        p87({
            ["path"] = v_u_86,
            ["waypoints"] = v91,
            ["index"] = 2,
            ["needs_next_path"] = false,
            ["has_next_waypoint"] = true
        })
    end)
end
function v22._recompute_path_if_agent_lost(p110)
    if p110.options.recompute_lost_distance_threshold then
        if p110:has_next_waypoint() then
            local v111 = p110._current_path_data
            if v111 then
                local v112 = v111.waypoints[v111.index - 1]
                local v113 = v111.waypoints[v111.index]
                local v114 = p110:_get_agent_position()
                local v115 = v112.position
                local v116 = v113.position - v115
                local v117 = (v114 - v115):Dot(v116) / v116:Dot(v116)
                local v118 = v114 - (v115 + math.clamp(v117, 0, 1) * v116)
                local v119 = v118.Y
                local v120 = math.min(v119, 0)
                local v121 = v118.X
                local v122 = v118.Z
                if Vector3.new(v121, v120, v122).Magnitude > p110.options.recompute_lost_distance_threshold then
                    v111.waypoints[v111.index].position = v114
                    local v123 = #v111.waypoints
                    p110:_truncate_current_path(v111.index + 1)
                    v_u_12("Recomputing path because agent is lost...", v111.index, #v111.waypoints, v123)
                    p110:_compute_next_path(false)
                end
            end
        else
            return
        end
    else
        return
    end
end
function v22._recompute_path_if_final_waypoint_outdated(p124)
    if p124.options.recompute_target_distance_threshold then
        if p124:has_next_waypoint() then
            local v125 = p124._next_path_data or p124._current_path_data
            if v125 then
                local v126 = p124:_get_target_position()
                local v127 = v125.waypoints[#v125.waypoints].position
                if v126 == nil or (v126 - v127).Magnitude >= p124.options.recompute_target_distance_threshold then
                    if p124._current_path_data then
                        p124:_truncate_current_path_from_distance(p124.options.truncate_keep_distance or 5)
                    end
                    v_u_12("Recomputing path because final_waypoint outdated...")
                    p124:_compute_next_path(false)
                end
            end
        else
            return
        end
    else
        return
    end
end
function v22.update_path(p128)
    if v_u_11 then
        p128:_draw_debug_points()
    end
    p128:_recompute_path_if_agent_lost()
    p128:_recompute_path_if_final_waypoint_outdated()
end
function v22._set_path_failed(p129, p130)
    v_u_12("Failed:", p130)
    p129._path_failed = true
    p129._path_failed_reason = p130
end
function v22.next(p131)
    v_u_12("next...")
    if p131._path_failed then
        v_u_12("  path_failed -> has_next: false")
        return false
    end
    if not p131._current_path_data then
        v_u_12("  no current_path_data -> has_next: true")
        return true
    end
    local v132 = p131._current_path_data
    p131:_recompute_path_if_final_waypoint_outdated()
    if v132.index ~= #v132.waypoints then
        v132.index = v132.index + 1
        v_u_12("  not complete -> has_next: true")
        return true
    end
    v132.has_next_waypoint = false
    if not v132.needs_next_path then
        v_u_12("  completed -> has_next: false")
        return false
    end
    if p131._next_path_data then
        p131:_promote_next_path_to_current()
    else
        v_u_12("Computing next path because needs_next_path...")
        p131:_compute_next_path(false)
    end
    v_u_12("  needs_next_path -> has_next: true")
    return true
end
function v22.is_failed(p133)
    return p133._path_failed
end
function v22.get_failure_reason(p134)
    return p134._path_failed_reason
end
function v22.is_current_waypoint_ready(p135)
    if p135:is_failed() then
        return false
    elseif p135._current_path_data then
        return (p135._current_path_data.has_next_waypoint or not p135._current_path_data.needs_next_path) and true or false
    else
        return false
    end
end
function v22.get_current_waypoint(p136)
    if p136:is_current_waypoint_ready() then
        return p136._current_path_data.waypoints[p136._current_path_data.index]
    else
        return error("Pathfinder failed. You should call :is_current_waypoint_ready() first to handle this case.")
    end
end
function v22.get_previous_waypoint(p137)
    if p137._current_path_data then
        return p137._current_path_data.waypoints[p137._current_path_data.index - 1]
    end
end
function v22.has_next_waypoint(p138)
    if p138:is_failed() then
        return false
    else
        return not p138._current_path_data and true or (p138._current_path_data.needs_next_path and true or p138._current_path_data.has_next_waypoint)
    end
end
function v22.is_possibly_final_waypoint(p139)
    if p139._path_failed then
        return error("Pathfinder failed. You should call :is_failed() first to handle this case.")
    elseif p139._current_path_data then
        if p139._current_path_data.needs_next_path then
            return false
        else
            return p139._current_path_data.index == #p139._current_path_data.waypoints
        end
    else
        return false
    end
end
function v22.get_current_waypoint_promise(p_u_140)
    return v_u_4.new(function(p141, p142)
        while not (p_u_140:is_current_waypoint_ready() or p_u_140:is_failed()) do
            game:GetService("RunService").Heartbeat:Wait()
        end
        if p_u_140:is_failed() then
            p142(p_u_140._path_failed_reason)
        else
            p141(p_u_140:get_current_waypoint())
        end
    end)
end
function v22.is_current_waypoint_reached(p143)
    v_u_13("is_current_waypoint_reached...")
    if not p143:is_current_waypoint_ready() then
        v_u_13("  current waypoint not ready -> false")
        return false
    end
    if not p143:has_next_waypoint() then
        v_u_13("  path finished -> true")
        return true
    end
    local v144 = p143.options.get_agent_position()
    local v145 = p143.options.waypoint_reached_distance_threshold or 1
    local v146 = p143._current_path_data
    local v147 = v146.waypoints[v146.index]
    local v148 = v146.waypoints[v146.index - 1]
    local v149 = v147.position
    local v150 = v148.position
    if (v149 - v150).Magnitude < math.min(0.5, v145) then
        v_u_13("  waypoints near -> true")
        return true
    end
    local v151 = v149 - v150
    local v152 = v151.X
    local v153 = v151.Z
    local v154 = Vector3.new(v152, 0, v153)
    local v155 = v144 - v149
    local v156 = v155.X
    local v157 = v155.Z
    local v158 = Vector3.new(v156, 0, v157)
    local v159 = v154.Unit:Dot(v158.Unit)
    local v160 = v146.waypoints[v146.index + 1]
    if v160 and v160.action == "Jump" then
        if v159 > 0 then
            v_u_13("  dot -> true")
            return true
        end
    elseif v158.Magnitude < v145 then
        v_u_13("  magnitude < threshold (", v145, ") -> true")
        return true
    end
    v_u_13("  far away (dot:", v159, "magnitude:", v158.Magnitude, ") -> false")
    return false
end
function v22.destroy(p161)
    v_u_12(":destroy() from\n", debug.traceback())
    if p161._current_path_data then
        p161:_truncate_current_path(p161._current_path_data.index + 1)
        p161._current_path_data.has_next_waypoint = false
        p161._current_path_data.needs_next_path = false
        p161._current_path_data.maid:DoCleaning()
    end
    if p161._compute_next_path_promise then
        p161._compute_next_path_promise:cancel()
    end
    if p161._next_path_data then
        p161._next_path_data.maid:DoCleaning()
        p161._next_path_data = nil
    end
    if not p161:is_failed() then
        p161:_set_path_failed("Destroyed")
    end
    if v_u_11 then
        if p161._debug_agent_part then
            local v_u_162 = p161._debug_agent_part
            task.delay(5, function()
                v_u_162:Destroy()
            end)
        end
        if p161._debug_target_part then
            local v_u_163 = p161._debug_target_part
            task.delay(5, function()
                v_u_163:Destroy()
            end)
        end
    end
end
return v22