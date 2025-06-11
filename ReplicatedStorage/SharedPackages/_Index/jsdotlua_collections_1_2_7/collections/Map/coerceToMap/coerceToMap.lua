--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Map.coerceToMap (ModuleScript)

local v_u_1 = require(script.Parent:WaitForChild("Map"))
local v_u_2 = require(script.Parent.Parent:WaitForChild("Object"))
local v_u_3 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p4)
    return v_u_3(p4, v_u_1) and p4 and p4 or v_u_1.new(v_u_2.entries(p4))
end