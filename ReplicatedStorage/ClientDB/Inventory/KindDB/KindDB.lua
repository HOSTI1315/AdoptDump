--// ReplicatedStorage.ClientDB.Inventory.KindDB (ModuleScript)

local v1 = {}
for _, v2 in require(game.ReplicatedStorage.Fsys).load("InventoryDB") do
    for v3, v4 in v2 do
        v1[v3] = v4
    end
end
return v1