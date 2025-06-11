--// ReplicatedStorage.ClientDB.Housing.FurnitureUseDB.Fragments.ImplicitFurnitureUseDB (ModuleScript)

local v1 = {}
for v2, v3 in require(game.ReplicatedStorage:WaitForChild("Fsys")).load("FurnitureDB") do
    if v3.behavior then
        v1[v2] = v3.behavior
        v3.behavior = nil
    end
end
return v1