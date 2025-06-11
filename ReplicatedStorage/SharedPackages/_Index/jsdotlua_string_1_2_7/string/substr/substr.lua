--// ReplicatedStorage.SharedPackages._Index.jsdotlua_string@1.2.7.string.substr (ModuleScript)

return function(p1, p2, p3)
    if p3 and p3 <= 0 then
        return ""
    end
    local v4
    if p3 then
        v4 = p2 + p3 - 1 or nil
    else
        v4 = nil
    end
    return string.sub(p1, p2, v4)
end