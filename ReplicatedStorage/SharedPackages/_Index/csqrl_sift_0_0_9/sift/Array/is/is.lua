--// ReplicatedStorage.SharedPackages._Index.csqrl_sift@0.0.9.sift.Array.is (ModuleScript)

return function(p1)
    local v2
    if typeof(p1) == "table" and #p1 > 0 then
        v2 = next(p1, #p1) == nil
    else
        v2 = false
    end
    return v2
end