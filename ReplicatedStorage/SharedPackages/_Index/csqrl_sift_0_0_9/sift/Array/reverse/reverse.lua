--// ReplicatedStorage.SharedPackages._Index.csqrl_sift@0.0.9.sift.Array.reverse (ModuleScript)

return function(p1)
    local v2 = {}
    for v3 = #p1, 1, -1 do
        local v4 = p1[v3]
        table.insert(v2, v4)
    end
    return v2
end