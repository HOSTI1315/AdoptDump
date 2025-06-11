--// ReplicatedStorage.SharedPackages._Index.reselim_flipper@2.0.0.flipper.Instant (ModuleScript)

local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2)
    local v3 = v_u_1
    return setmetatable({
        ["_targetValue"] = p2
    }, v3)
end
function v_u_1.step(p4)
    return {
        ["complete"] = true,
        ["value"] = p4._targetValue
    }
end
return v_u_1