--// ReplicatedStorage.ClientDB.ItemDB (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("FurnitureDB")
local v3 = v1("HouseDB")
local v4 = v1("InventoryDB")
return v1("package:Sift").Dictionary.join(v4, {
    ["houses"] = v3,
    ["furniture"] = v2
})