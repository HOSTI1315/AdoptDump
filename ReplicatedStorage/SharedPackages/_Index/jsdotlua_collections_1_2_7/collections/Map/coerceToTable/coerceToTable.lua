--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Map.coerceToTable (ModuleScript)

local v_u_1 = require(script.Parent:WaitForChild("Map"))
local v_u_2 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"))
local v_u_3 = require(script.Parent.Parent:WaitForChild("Array"):WaitForChild("reduce"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p4)
    if v_u_2(p4, v_u_1) then
        return v_u_3(p4:entries(), function(p5, p6)
            p5[p6[1]] = p6[2]
            return p5
        end, {})
    else
        return p4
    end
end