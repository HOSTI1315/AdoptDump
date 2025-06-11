--// ReplicatedStorage.SharedPackages._Index.jsdotlua_number@1.2.7.number.isSafeInteger (ModuleScript)

local v_u_1 = require(script.Parent:WaitForChild("isInteger"))
local v_u_2 = require(script.Parent:WaitForChild("MAX_SAFE_INTEGER"))
return function(p3)
    local v4 = v_u_1(p3)
    if v4 then
        v4 = math.abs(p3) <= v_u_2
    end
    return v4
end