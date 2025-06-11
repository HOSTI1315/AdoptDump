--// ReplicatedStorage.SharedPackages._Index.csqrl_sift@0.0.9.sift.Array.findWhere (ModuleScript)

return function(p1, p2, p3)
    local v4 = #p1
    if type(p3) == "number" then
        if p3 < 1 then
            p3 = v4 + p3
        end
    else
        p3 = 1
    end
    for v5 = p3, #p1 do
        if p2(p1[v5], v5, p1) then
            return v5
        end
    end
end