--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2021.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["halloween_2021_black_ponycycle"] = {
        ["name"] = "Halloween Black Ponycycle",
        ["image"] = "rbxassetid://7839195952",
        ["rarity"] = "legendary",
        ["cost"] = 3500,
        ["currency_id"] = "candy_2021"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)