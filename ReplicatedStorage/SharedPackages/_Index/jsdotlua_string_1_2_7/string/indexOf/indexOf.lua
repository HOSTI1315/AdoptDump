--// ReplicatedStorage.SharedPackages._Index.jsdotlua_string@1.2.7.string.indexOf (ModuleScript)

local v_u_1 = "([" .. ("$%^()-[].?"):gsub("(.)", "%%%1") .. "])"
return function(p2, p3, p4)
    local v5 = #p2
    local v6 = p4 == nil and 1 or (p4 < 1 and 1 or p4)
    if #p3 == 0 then
        if v5 < v6 then
            return v5
        else
            return v6
        end
    else
        if v5 < v6 then
            return -1
        end
        local v7 = p3:gsub(v_u_1, "%%%1")
        local v8 = #v7
        for v9 = v6, v5 do
            local v10 = v9 + v8 - 1
            if string.sub(p2, v9, v10) == v7 then
                return v9
            end
        end
        return -1
    end
end