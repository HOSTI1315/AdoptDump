--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.concat (ModuleScript)

local v_u_1 = _G.__DEV__
local v_u_2 = require(script.Parent:WaitForChild("isArray"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p3, ...)
    local v4 = 0
    local v5, v6
    if v_u_2(p3) then
        v5 = table.clone(p3)
        v6 = #p3
    else
        v6 = v4 + 1
        v5 = {
            [v6] = p3
        }
    end
    for v7 = 1, select("#", ...) do
        local v8 = select(v7, ...)
        local v9 = typeof(v8)
        if v8 ~= nil then
            if v9 == "table" then
                if v_u_1 and not v_u_2(v8) then
                    error("Array.concat(...) only works with array-like tables but it received an object-like table.\nYou can avoid this error by wrapping the object-like table into an array. Example: `concat({1, 2}, {a = true})` should be `concat({1, 2}, { {a = true} }`")
                end
                for v10 = 1, #v8 do
                    v6 = v6 + 1
                    v5[v6] = v8[v10]
                end
            else
                v6 = v6 + 1
                v5[v6] = v8
            end
        end
    end
    return v5
end