--// ReplicatedStorage.new.modules.Utilities.dumpCloudValues (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.SharedPackages.inspect)
local v_u_3 = require(script.Parent.Parent.LegacyLoad)("CloudValues")
return function(p4, p5)
    if p5 == nil then
        return v_u_2(v_u_3.values, {
            ["depth"] = p4
        })
    end
    local v6 = string.split(p5, ".")
    local v7 = v_u_3.values
    for v8, v9 in v6 do
        local v10 = v7[v9]
        if v10 == nil then
            return ("Error reading path: index %* (\"%*\") could not be used to index the table. Last valid pointer:\n%*"):format(v8, v9, (v_u_2(v7, {
                ["depth"] = 1
            })))
        end
        v7 = v10
    end
    return v_u_2(v7, {
        ["depth"] = p4
    })
end