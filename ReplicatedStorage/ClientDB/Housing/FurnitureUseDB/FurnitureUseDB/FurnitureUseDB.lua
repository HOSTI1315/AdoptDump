--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.FurnitureUseDB (ModuleScript)

local v1 = {}
for _, v2 in script.Parent.Fragments:GetChildren() do
    for v3, v4 in require(v2) do
        local v5 = v1[v3] == nil
        local v6 = "Attempting to define FurnitureUseDB entry of kind " .. tostring(v3) .. " multiple times."
        assert(v5, v6)
        v4.kind = v3
        v1[v3] = v4
    end
end
return v1