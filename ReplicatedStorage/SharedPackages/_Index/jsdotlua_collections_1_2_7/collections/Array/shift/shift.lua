--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.shift (ModuleScript)

local v_u_1 = _G.__DEV__
local v_u_2 = require(script.Parent:WaitForChild("isArray"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p3)
    if v_u_1 and not v_u_2(p3) then
        error(string.format("Array.shift called on non-array %s", (typeof(p3))))
    end
    if #p3 > 0 then
        return table.remove(p3, 1)
    else
        return nil
    end
end