--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.shallowEqual (ModuleScript)

local v_u_1 = require(script.Parent:WaitForChild("objectIs"))
return function(p2, p3)
    if v_u_1(p2, p3) then
        return true
    end
    if typeof(p2) ~= "table" or (p2 == nil or (typeof(p3) ~= "table" or p3 == nil)) then
        return false
    end
    for v4, v5 in p2 do
        if not v_u_1(p3[v4], v5) then
            return false
        end
    end
    for v6, v7 in p3 do
        if not v_u_1(p2[v6], v7) then
            return false
        end
    end
    return true
end