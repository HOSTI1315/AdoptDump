--// ReplicatedStorage.SharedPackages._Index.reselim_roact-flipper@2.0.0.roact-flipper.useMotor (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Flipper)
local function v_u_4(p2)
    local v3 = type(p2)
    if v3 == "number" then
        return v_u_1.SingleMotor.new(p2)
    end
    if v3 == "table" then
        return v_u_1.GroupMotor.new(p2)
    end
    error(("Invalid type for initialValue. Expected \"number\" or \"table\", got \"%s\""):format(v3))
end
return function(p5, p6)
    return p5.useValue(v_u_4(p6)).value
end