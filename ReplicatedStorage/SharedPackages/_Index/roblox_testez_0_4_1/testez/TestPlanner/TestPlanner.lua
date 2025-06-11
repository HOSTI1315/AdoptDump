--// ReplicatedStorage.SharedPackages._Index.roblox_testez@0.4.1.testez.TestPlanner (ModuleScript)

local v_u_1 = require(script.Parent.TestPlan)
return {
    ["createPlan"] = function(p2, p3, p4)
        local v5 = v_u_1.new(p3, p4)
        table.sort(p2, function(p6, p7)
            return p6.pathStringForSorting < p7.pathStringForSorting
        end)
        for _, v8 in ipairs(p2) do
            v5:addRoot(v8.path, v8.method)
        end
        return v5
    end
}