--// ReplicatedStorage.SharedModules.Curves.CompositeBezierCurve (ModuleScript)

local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2, p3)
    local v4 = v_u_1
    local v5 = setmetatable({}, v4)
    v5.curves = p2
    v5.speed = (p3 or {}).speed or 1
    v5.total_length = 0
    v5.lengths = {}
    v5.cumulative_lengths = {}
    for v6, v7 in p2 do
        v5.lengths[v6] = v7:get_length()
        v5.total_length = v5.total_length + v5.lengths[v6]
        v5.cumulative_lengths[v6] = v5.total_length
    end
    return v5
end
function v_u_1.get_value(p8, p9)
    local v10 = p8.total_length * p9
    for v11, v12 in p8.cumulative_lengths do
        if v10 < v12 then
            if p8.cumulative_lengths[v11 - 1] then
                v10 = v10 - p8.cumulative_lengths[v11 - 1] or v10
            end
            return p8.curves[v11]:get_value(v10 / p8.lengths[v11])
        end
    end
end
function v_u_1.get_length(p13)
    return p13.total_length
end
return v_u_1