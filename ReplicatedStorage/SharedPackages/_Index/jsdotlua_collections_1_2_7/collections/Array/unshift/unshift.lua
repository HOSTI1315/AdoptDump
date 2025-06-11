--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.unshift (ModuleScript)

local v_u_1 = _G.__DEV__
local v_u_2 = require(script.Parent:WaitForChild("isArray"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p3, ...)
    if v_u_1 and not v_u_2(p3) then
        error(string.format("Array.unshift called on non-array %s", (typeof(p3))))
    end
    local v4 = select("#", ...)
    if v4 > 0 then
        for v5 = v4, 1, -1 do
            local v6 = select(v5, ...)
            table.insert(p3, 1, v6)
        end
    end
    return #p3
end