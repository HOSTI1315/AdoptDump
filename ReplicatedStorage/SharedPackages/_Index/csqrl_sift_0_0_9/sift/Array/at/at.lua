--// ReplicatedStorage.SharedPackages._Index.csqrl_sift@0.0.9.sift.Array.at (ModuleScript)

return function(p1, p2)
    local v3 = #p1
    if p2 < 1 then
        p2 = p2 + v3
    end
    return p1[p2]
end