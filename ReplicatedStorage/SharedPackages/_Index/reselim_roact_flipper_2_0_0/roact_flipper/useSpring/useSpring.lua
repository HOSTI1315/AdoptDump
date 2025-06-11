--// ReplicatedStorage.SharedPackages._Index.reselim_roact-flipper@2.0.0.roact-flipper.useSpring (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Flipper)
local v_u_2 = require(script.Parent.useGoal)
return function(p3, p4, p5)
    return v_u_2(p3, v_u_1.Spring.new(p4, p5))
end