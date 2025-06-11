--// ReplicatedStorage.SharedPackages._Index.csqrl_sift@0.0.9.sift.Dictionary.removeValue (ModuleScript)

return function(p1, p2)
    local v3 = {}
    for v4, v5 in pairs(p1) do
        if v5 ~= p2 then
            v3[v4] = v5
        end
    end
    return v3
end