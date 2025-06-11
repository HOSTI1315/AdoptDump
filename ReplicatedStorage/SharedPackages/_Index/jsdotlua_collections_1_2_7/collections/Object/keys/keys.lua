--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Object.keys (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("Set"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local v_u_2 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"))
return function(p3)
    if p3 == nil then
        error("cannot extract keys from a nil value")
    end
    local v4 = typeof(p3)
    local v5 = nil
    if v4 ~= "table" then
        if v4 == "string" then
            local v6 = p3:len()
            v5 = table.create(v6)
            for v7 = 1, v6 do
                v5[v7] = tostring(v7)
            end
        end
        return v5
    end
    local v8 = {}
    if v_u_2(p3, v_u_1) then
        return v8
    end
    for v9 in pairs(p3) do
        table.insert(v8, v9)
    end
    return v8
end