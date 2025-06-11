--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.forEach (ModuleScript)

local v_u_1 = _G.__DEV__
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p2, p3, p4)
    if v_u_1 then
        if typeof(p2) ~= "table" then
            error(string.format("Array.forEach called on %s", (typeof(p2))))
        end
        if typeof(p3) ~= "function" then
            error("callback is not a function")
        end
    end
    local v5 = #p2
    local v6 = 1
    while v6 <= v5 do
        local v7 = p2[v6]
        if p4 == nil then
            p3(v7, v6, p2)
        else
            p3(p4, v7, v6, p2)
        end
        v5 = #p2 < v5 and #p2 or v5
        v6 = v6 + 1
    end
end