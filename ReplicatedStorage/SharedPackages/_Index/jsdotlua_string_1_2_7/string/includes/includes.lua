--// ReplicatedStorage.SharedPackages._Index.jsdotlua_string@1.2.7.string.includes (ModuleScript)

local v_u_1 = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"
return function(p2, p3, p4)
    local v5, v6 = utf8.len(p2)
    local v7 = v5 ~= nil
    local v8 = tostring(v6)
    assert(v7, ("string `%s` has an invalid byte at position %s"):format(p2, v8))
    if v5 == 0 then
        return false
    end
    if #p3 == 0 then
        return true
    end
    local v9
    if p4 == nil then
        v9 = 1
    else
        v9 = tonumber(p4) or 1
        if v5 < v9 then
            return false
        end
    end
    local v10 = v9 < 1 and 1 or v9
    local v11 = utf8.offset(p2, v10)
    local v12 = p3:gsub(v_u_1, "%%%1")
    local v13, _ = string.find(p2, v12, v11)
    return v13 ~= nil
end