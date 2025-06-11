--// ReplicatedStorage.SharedModules.Diff (ModuleScript)

local v1 = {}
local v_u_2 = {}
function v1.new(p3, p4)
    local v5 = {
        ["__index"] = v_u_2
    }
    local v6 = setmetatable({}, v5)
    v6.data = {}
    v6.get_hash = p3
    v6.mutable = p4
    return v6
end
function v_u_2.update(p7, p8)
    local v9 = {}
    if not p7.mutable and p7.data == p8 then
        return v9
    end
    for _, v10 in pairs({ p7.data, p8 }) do
        for v11, _ in pairs(v10) do
            if p7.get_hash(v11, p7.data[v11]) ~= p7.get_hash(v11, p8[v11]) then
                table.insert(v9, v11)
            end
        end
    end
    return v9
end
return v1