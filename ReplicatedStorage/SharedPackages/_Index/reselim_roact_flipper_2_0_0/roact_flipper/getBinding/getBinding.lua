--// ReplicatedStorage.SharedPackages._Index.reselim_roact-flipper@2.0.0.roact-flipper.getBinding (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Roact)
local v_u_2 = require(script.Parent.Parent.Flipper)
local v_u_3 = require(script.Parent.AssignedBinding)
return function(p4)
    assert(p4, "Missing argument #1: motor")
    if not v_u_2.isMotor(p4) then
        error("Provided value is not a motor!", 2)
    end
    if p4[v_u_3] then
        return p4[v_u_3]
    end
    local v5, v6 = v_u_1.createBinding(p4:getValue())
    p4:onStep(v6)
    p4[v_u_3] = v5
    return v5
end