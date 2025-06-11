--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.assign (ModuleScript)

local v_u_1 = require(script.Parent.None)
return function(p2, ...)
    for v3 = 1, select("#", ...) do
        local v4 = select(v3, ...)
        if v4 ~= nil then
            for v5, v6 in pairs(v4) do
                if v6 == v_u_1 then
                    p2[v5] = nil
                else
                    p2[v5] = v6
                end
            end
        end
    end
    return p2
end