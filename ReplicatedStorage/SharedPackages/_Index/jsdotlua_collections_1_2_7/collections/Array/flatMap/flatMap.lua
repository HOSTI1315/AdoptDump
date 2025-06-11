--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.flatMap (ModuleScript)

local v_u_1 = _G.__DEV__
local v_u_2 = require(script.Parent:WaitForChild("flat"))
local v_u_3 = require(script.Parent:WaitForChild("map"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p4, p5, p6)
    if v_u_1 then
        if typeof(p4) ~= "table" then
            error(string.format("Array.flatMap called on %s", (typeof(p4))))
        end
        if typeof(p5) ~= "function" then
            error("callback is not a function")
        end
    end
    return v_u_2(v_u_3(p4, p5, p6))
end