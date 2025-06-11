--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.join (ModuleScript)

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local v_u_1 = require(script.Parent:WaitForChild("map"))
return function(p2, p3)
    if #p2 == 0 then
        return ""
    end
    local v5 = v_u_1(p2, function(p4)
        return tostring(p4)
    end)
    return table.concat(v5, p3 or ",")
end