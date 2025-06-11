--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.assertDeepEqual (ModuleScript)

local function v_u_12(p1, p2)
    if typeof(p1) == typeof(p2) then
        if typeof(p1) == "table" then
            local v3 = {}
            for v4, v5 in pairs(p1) do
                v3[v4] = true
                local v6, v7 = v_u_12(v5, p2[v4])
                if not v6 and v7 then
                    return false, v7:gsub("{1}", ("{1}[%s]"):format((tostring(v4)))):gsub("{2}", ("{2}[%s]"):format((tostring(v4))))
                end
            end
            for v8, v9 in pairs(p2) do
                if not v3[v8] then
                    local v10, v11 = v_u_12(v9, p1[v8])
                    if not v10 and v11 then
                        return false, v11:gsub("{1}", ("{1}[%s]"):format((tostring(v8)))):gsub("{2}", ("{2}[%s]"):format((tostring(v8))))
                    end
                end
            end
            return true, nil
        elseif p1 == p2 then
            return true, nil
        else
            return false, "{1} ~= {2}"
        end
    else
        return false, ("{1} is of type %s, but {2} is of type %s"):format(typeof(p1), (typeof(p2)))
    end
end
return function(p13, p14)
    local v15, v16 = v_u_12(p13, p14)
    if not v15 and v16 then
        local v17 = ("Values were not deep-equal.\n%s"):format((v16:gsub("{1}", "first"):gsub("{2}", "second")))
        error(v17, 2)
    end
end