--// ReplicatedStorage.SharedModules.ContentPacks.Winter2023.RefreshmentStands (ModuleScript)

local v1 = {
    ["winter_2023_hot_cocoa_stand"] = {
        ["default_price"] = 10,
        ["max_price"] = 20,
        ["model_name"] = "Winter2023HotCocoaStand",
        ["refreshment_name"] = "Hot Cocoa",
        ["refreshment_item"] = require(game.ReplicatedStorage.Fsys).load("InventoryDB").food.winter_2023_hot_cocoa
    }
}
return v1