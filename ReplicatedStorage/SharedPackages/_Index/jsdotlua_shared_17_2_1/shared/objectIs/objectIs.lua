--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.objectIs (ModuleScript)

return function(p1, p2)
    local v3
    if p1 == p2 and (p1 ~= 0 or 1 / p1 == 1 / p2) then
        v3 = true
    elseif p1 == p1 then
        v3 = false
    else
        v3 = p2 ~= p2
    end
    return v3
end