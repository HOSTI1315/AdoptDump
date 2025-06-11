--// ReplicatedStorage.SharedPackages._Index.jsdotlua_string@1.2.7.string.startsWith (ModuleScript)

return function(p1, p2, p3)
    if string.len(p2) == 0 then
        return true
    else
        local v4 = (p3 == nil or p3 < 1) and 1 or p3
        if string.len(p1) < v4 then
            return false
        else
            return p1:find(p2, v4, true) == v4
        end
    end
end