--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.every (ModuleScript)

local v_u_1 = _G.__DEV__
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p2, p3, p4)
    if v_u_1 then
        if typeof(p2) ~= "table" then
            error(string.format("Array.every called on %s", (typeof(p2))))
        end
        if typeof(p3) ~= "function" then
            error("callback is not a function")
        end
    end
    local v5 = #p2
    local v6 = 1
    while v6 <= v5 do
        local v7 = p2[v6]
        if v7 ~= nil then
            local v8
            if p4 == nil then
                v8 = p3(v7, v6, p2)
            else
                v8 = p3(p4, v7, v6, p2)
            end
            if not v8 then
                return false
            end
        end
        v6 = v6 + 1
    end
    return true
end