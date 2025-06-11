--// ReplicatedStorage.SharedPackages._Index.reselim_roact-flipper@2.0.0.roact-flipper.useGoal (ModuleScript)

local v_u_1 = require(script.Parent.useMotor)
local v_u_2 = require(script.Parent.getBinding)
local function v_u_7(p3)
    if p3.step then
        return p3._targetValue
    end
    local v4 = {}
    for v5, v6 in pairs(p3) do
        v4[v5] = v_u_7(v6)
    end
    return v4
end
return function(p8, p9)
    local v10 = v_u_1(p8, (v_u_7(p9)))
    v10:setGoal(p9)
    return v_u_2(v10), v10
end