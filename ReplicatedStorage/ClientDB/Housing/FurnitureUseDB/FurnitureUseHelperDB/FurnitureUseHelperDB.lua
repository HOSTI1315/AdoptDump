--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.FurnitureUseHelperDB (ModuleScript)

local function v_u_4(p_u_1, p_u_2)
    local v3 = typeof(p_u_1)
    if v3 == "table" then
        p_u_1.use_function_name = p_u_2
        return p_u_1
    end
    if v3 == "function" then
        return function(...)
            return v_u_4(p_u_1(...), p_u_2)
        end
    end
    error(("No implementation for use_helper_entry_name found for %s in %s"):format(v3, p_u_2))
    return p_u_1
end
local v5 = {}
for _, v6 in script.Parent.Helpers:GetChildren() do
    for v7, v8 in require(v6) do
        local v9 = not v5[v7]
        assert(v9, ("Duplicate entry found for %s"):format(v7))
        v5[v7] = v_u_4(v8, v7)
    end
end
return v5