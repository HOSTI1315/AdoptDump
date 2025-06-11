--// ReplicatedStorage.SharedPackages._Index.csqrl_sift@0.0.9.sift.Dictionary.every (ModuleScript)

return function(p1, p2)
    for v3, v4 in pairs(p1) do
        if not p2(v4, v3, p1) then
            return false
        end
    end
    return true
end