--// ReplicatedStorage.SharedPackages._Index.jsdotlua_string@1.2.7.string.lastIndexOf (ModuleScript)

return function(p1, p2, p3)
    local v4 = string.len(p1)
    local v5 = p3 and p3 < 1 and 1 or (p3 or v4)
    if p3 then
        if v4 >= p3 then
            v4 = v5
        end
    else
        v4 = v5
    end
    if p2 == "" then
        return v4
    end
    local v6 = nil
    local v7 = 0
    while true do
        local v8
        v8, v7 = string.find(p1, p2, v7 + 1, true)
        if v8 == nil or v4 < v8 then
            break
        end
        v6 = v8
    end
    return v6 == nil and -1 or v6
end