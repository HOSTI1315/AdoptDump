--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.reduce (ModuleScript)

local v_u_1 = _G.__DEV__
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p2, p3, p4)
    if v_u_1 then
        if typeof(p2) ~= "table" then
            error(string.format("Array.reduce called on %s", (typeof(p2))))
        end
        if typeof(p3) ~= "function" then
            error("callback is not a function")
        end
    end
    local v5 = #p2
    local v6
    if p4 == nil then
        v6 = 2
        if v5 == 0 then
            error("reduce of empty array with no initial value")
        end
        p4 = p2[1]
    else
        v6 = 1
    end
    for v7 = v6, v5 do
        p4 = p3(p4, p2[v7], v7, p2)
    end
    return p4
end