--// ReplicatedStorage.SharedPackages._Index.jsdotlua_string@1.2.7.string.findOr (ModuleScript)

local v_u_1 = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"
return function(p2, p3, p4)
    local v5 = utf8.offset(p2, p4 or 1)
    local v6 = {}
    for _, v7 in p3 do
        local v8 = v7:gsub(v_u_1, "%%%1")
        local v9, v10 = string.find(p2, v8, v5)
        if v9 then
            local v11 = v9 - 1
            local v12 = string.sub(p2, 1, v11)
            local v13, v14 = utf8.len(v12)
            if v13 == nil then
                error(("string `%s` has an invalid byte at position %s"):format(v12, (tostring(v14))))
            end
            local v15 = {
                ["index"] = v13 + 1,
                ["match"] = string.sub(p2, v9, v10)
            }
            table.insert(v6, v15)
        end
    end
    if #v6 == 0 then
        return nil
    end
    local v16 = nil
    for _, v17 in v6 do
        if v16 == nil then
            v16 = v17
        end
        if v17.index < v16.index then
            v16 = v17
        end
    end
    return v16
end