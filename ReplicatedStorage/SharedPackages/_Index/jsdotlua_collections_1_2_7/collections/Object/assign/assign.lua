--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Object.assign (ModuleScript)

local v_u_1 = require(script.Parent:WaitForChild("None"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p2, p3, p4, p5, ...)
    if p3 ~= nil and typeof(p3) == "table" then
        for v6, v7 in pairs(p3) do
            if v7 == v_u_1 then
                p2[v6] = nil
            else
                p2[v6] = v7
            end
        end
    end
    if p4 ~= nil and typeof(p4) == "table" then
        for v8, v9 in pairs(p4) do
            if v9 == v_u_1 then
                p2[v8] = nil
            else
                p2[v8] = v9
            end
        end
    end
    if p5 ~= nil and typeof(p5) == "table" then
        for v10, v11 in pairs(p5) do
            if v11 == v_u_1 then
                p2[v10] = nil
            else
                p2[v10] = v11
            end
        end
    end
    for v12 = 1, select("#", ...) do
        local v13 = select(v12, ...)
        if v13 ~= nil and typeof(v13) == "table" then
            for v14, v15 in pairs(v13) do
                if v15 == v_u_1 then
                    p2[v14] = nil
                else
                    p2[v14] = v15
                end
            end
        end
    end
    return p2
end