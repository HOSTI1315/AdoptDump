--// ReplicatedStorage.SharedPackages._Index.reselim_flipper@2.0.0.flipper.Linear (ModuleScript)

local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2, p3)
    assert(p2, "Missing argument #1: targetValue")
    local v4 = {
        ["_targetValue"] = p2,
        ["_velocity"] = (p3 or {}).velocity or 1
    }
    local v5 = v_u_1
    return setmetatable(v4, v5)
end
function v_u_1.step(p6, p7, p8)
    local v9 = p7.value
    local v10 = p6._velocity
    local v11 = p6._targetValue
    local v12 = p8 * v10
    local v13 = v11 - v9
    local v14 = math.abs(v13) <= v12
    local v15 = v9 + v12 * (v9 < v11 and 1 or -1)
    if v14 then
        v15 = p6._targetValue
        v10 = 0
    end
    return {
        ["complete"] = v14,
        ["value"] = v15,
        ["velocity"] = v10
    }
end
return v_u_1