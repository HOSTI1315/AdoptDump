--// ReplicatedStorage.SharedModules.ContentPacks.Winter2021.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Walrus Box",
    ["image"] = "rbxassetid://8080663444",
    ["rarity"] = "legendary",
    ["cost"] = 15000,
    ["currency_id"] = "gingerbread_2021",
    ["anims"] = {
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "WalrusBox",
    ["tool"] = "WalrusBoxTool"
}
v2.winter_2021_walrus_box = v3
return v1(v2)