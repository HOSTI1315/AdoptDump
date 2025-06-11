--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.filter (ModuleScript)

local v_u_1 = _G.__DEV__
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p2, p3, p4)
    if v_u_1 then
        if typeof(p2) ~= "table" then
            error(string.format("Array.filter called on %s", (typeof(p2))))
        end
        if typeof(p3) ~= "function" then
            error("callback is not a function")
        end
    end
    local v5 = #p2
    local v6 = {}
    local v7 = 1
    if p4 == nil then
        for v8 = 1, v5 do
            local v9 = p2[v8]
            if v9 ~= nil and p3(v9, v8, p2) then
                v6[v7] = v9
                v7 = v7 + 1
            end
        end
        return v6
    else
        for v10 = 1, v5 do
            local v11 = p2[v10]
            if v11 ~= nil and p3(p4, v11, v10, p2) then
                v6[v7] = v11
                v7 = v7 + 1
            end
        end
        return v6
    end
end