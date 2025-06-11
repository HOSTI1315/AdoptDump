--// ReplicatedStorage.SharedPackages._Index.csqrl_sift@0.0.9.sift.Array.copyDeep (ModuleScript)

local function v_u_5(p1)
    local v2 = table.clone(p1)
    for v3, v4 in p1 do
        if type(v4) == "table" then
            v2[v3] = v_u_5(v4)
        end
    end
    return v2
end
return v_u_5