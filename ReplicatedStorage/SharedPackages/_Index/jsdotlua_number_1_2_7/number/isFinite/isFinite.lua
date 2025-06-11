--// ReplicatedStorage.SharedPackages._Index.jsdotlua_number@1.2.7.number.isFinite (ModuleScript)

return function(p1)
    local v2
    if typeof(p1) == "number" and (p1 == p1 and p1 ~= (1 / 0)) then
        v2 = p1 ~= (-1 / 0)
    else
        v2 = false
    end
    return v2
end