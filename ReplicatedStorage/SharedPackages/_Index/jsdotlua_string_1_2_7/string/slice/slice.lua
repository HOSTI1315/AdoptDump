--// ReplicatedStorage.SharedPackages._Index.jsdotlua_string@1.2.7.string.slice (ModuleScript)

return function(p1, p2, p3)
    local v4, v5 = utf8.len(p1)
    local v6 = v4 ~= nil
    local v7 = tostring(v5)
    assert(v6, ("string `%s` has an invalid byte at position %s"):format(p1, v7))
    local v8 = tonumber(p2)
    local v9 = typeof(v8) == "number"
    assert(v9, "startIndexStr should be a number")
    local v10 = v8 + v4 < 0 and 1 or v8
    if v4 < v10 then
        return ""
    end
    local v11 = v4 + 1
    local v12 = p3 ~= nil and (tonumber(p3) or (0 / 0)) or v11
    local v13 = typeof(v12) == "number"
    assert(v13, "lastIndexStr should convert to number")
    if v4 < v12 then
        v12 = v4 + 1
    end
    local v14 = utf8.offset(p1, v10)
    local v15 = utf8.offset(p1, v12) - 1
    return string.sub(p1, v14, v15)
end