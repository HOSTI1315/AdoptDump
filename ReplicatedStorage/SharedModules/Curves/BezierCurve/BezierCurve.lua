--// ReplicatedStorage.SharedModules.Curves.BezierCurve (ModuleScript)

local v_u_1 = require(script.Parent.CompositeBezierCurve)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2._get_value(p3, p4, p5, p6)
    local v7 = p6 or 1
    if #p3.control_anchors == 2 or p5 == 1 then
        return p3.control_anchors[v7]:Lerp(p3.control_anchors[v7 + 1], p4)
    end
    local v8 = (p5 or p3.order) - 1
    return p3:_get_value(p4, v8, v7):Lerp(p3:_get_value(p4, v8, v7 + 1), p4)
end
function v_u_2._get_fixed_speed_value(p9, p10)
    local v11 = p9.curve_length * p10
    local v12 = nil
    for _, v13 in p9.segments do
        if v11 < v13.cumulative_length then
            break
        end
        v12 = v13
    end
    local v14 = (v11 - v12.cumulative_length) / v12.length
    return v12.cf0:Lerp(v12.cf1, v14)
end
function v_u_2._parameterize_curve(p15)
    if p15.show_debug_points then
        p15.debug_parts:ClearAllChildren()
    end
    local v16 = {}
    local v17 = 0
    local v18 = {}
    for v19 = 0, p15.num_points do
        local v20 = v16[v19] or p15:_get_value(v19 / p15.num_points)
        local v21 = p15:_get_value(v19 / p15.num_points)
        v16[v19 + 1] = v21
        if p15.show_debug_points then
            local v22 = Instance.new("Part")
            v22.CFrame = v21
            v22.Size = Vector3.new(0.2, 0.2, 0.2)
            v22.Anchored = true
            v22.CanCollide = false
            v22.Name = "PART" .. v19
            v22.BrickColor = BrickColor.Black()
            v22.Parent = p15.debug_parts
        end
        local v23 = (v20.Position - v21.Position).Magnitude
        local v24 = {
            ["cumulative_length"] = v17,
            ["cf0"] = CFrame.lookAt(v20.Position, v21.Position, v20.UpVector),
            ["cf1"] = CFrame.lookAt(v21.Position, v21.Position + (v21.Position - v20.Position), v21.UpVector),
            ["length"] = v23
        }
        table.insert(v18, v24)
        v17 = v17 + v23
    end
    p15.curve_length = v17
    p15.segments = v18
end
function v_u_2.new(p25, p26)
    local v27
    if typeof(p25) == "table" then
        v27 = #p25 > 1
    else
        v27 = false
    end
    assert(v27, "Invalid cframe list")
    local v28 = v_u_2
    local v29 = setmetatable({}, v28)
    v29.control_anchors = p25
    v29.order = #v29.control_anchors - 1
    local v30 = p26 or {}
    v29.speed = v30.speed or 1
    v29.constant_speed = v30.constant_speed
    v29.num_points = v30.num_points or 20
    v29.show_debug_points = v30.show_debug_points
    if v29.show_debug_points then
        v29.debug_parts = Instance.new("Folder")
        v29.debug_parts.Name = "_DEBUG_" .. tick()
        v29.debug_parts.Parent = workspace
    end
    v29:_parameterize_curve()
    return v29
end
function v_u_2.join_curves(p31, p32)
    return v_u_1.new(p31, p32)
end
function v_u_2.from_folder(p33, p34)
    local v35 = #p33:GetChildren()
    local v36 = p34.offset or CFrame.identity
    local v37 = {}
    for v38 = 1, v35 do
        local v39 = p33:FindFirstChild((tostring(v38)))
        local v40
        if p34.loop then
            v40 = v38 % v35 or v38
        else
            v40 = v38
        end
        local v41 = v40 + 1
        local v42 = p33:FindFirstChild((tostring(v41)))
        if not (v39 and v42) then
            break
        end
        local v43
        if p34.smooth then
            v43 = v39.Size.X * 0.25
        else
            v43 = p34.control_point_distance or 20
        end
        local v44 = v39:GetPivot() * v36
        local v45 = v42:GetPivot() * v36
        local v46 = {
            v44,
            v44 + v44.LookVector * v43,
            v45 + v45.LookVector * -v43,
            v45
        }
        v37[v38] = v_u_2.new(v46, p34)
    end
    return v_u_2.join_curves(v37, p34)
end
function v_u_2.get_value(p47, p48)
    if not p47.constant_speed then
        return p47:_get_value(p48)
    end
    if p47._parameterization_queued then
        p47:_parameterize_curve()
    end
    return p47:_get_fixed_speed_value(p48)
end
function v_u_2.get_length(p49)
    return p49.curve_length
end
function v_u_2.destroy(p50)
    if p50.debug_parts then
        p50.debug_parts:Destroy()
    end
end
return v_u_2