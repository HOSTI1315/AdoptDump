--// ReplicatedStorage.SharedPackages._Index.csqrl_sift@0.0.9.sift.Array.findLast (ModuleScript)

return function(p1, p2, p3)
    local v4 = #p1
    if type(p3) == "number" then
        if p3 < 1 then
            p3 = v4 + p3
        end
    else
        p3 = v4
    end
    for v5 = p3, 1, -1 do
        if p1[v5] == p2 then
            return v5
        end
    end
end