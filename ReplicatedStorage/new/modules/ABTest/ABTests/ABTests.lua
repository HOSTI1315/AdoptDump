--// ReplicatedStorage.new.modules.ABTest.ABTests (ModuleScript)

local v_u_1 = require(script.Parent)
local v_u_2 = {}
for _, v3 in script:GetChildren() do
    if v3:IsA("ModuleScript") then
        local v4 = require(v3)
        v_u_2[v4.key] = v4
    end
end
function v_u_2.get_group_static(p5, p6)
    return (v_u_2[p5] or v_u_1.new({
        ["key"] = p5,
        ["default_values"] = {},
        ["groups"] = {}
    })):get_group(p6)
end
return v_u_2