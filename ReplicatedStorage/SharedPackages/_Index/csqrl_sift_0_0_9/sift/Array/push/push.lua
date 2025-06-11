--// ReplicatedStorage.SharedPackages._Index.csqrl_sift@0.0.9.sift.Array.push (ModuleScript)

return function(p1, ...)
    local v2 = {}
    for _, v3 in ipairs(p1) do
        table.insert(v2, v3)
    end
    for _, v4 in ipairs({ ... }) do
        table.insert(v2, v4)
    end
    return v2
end