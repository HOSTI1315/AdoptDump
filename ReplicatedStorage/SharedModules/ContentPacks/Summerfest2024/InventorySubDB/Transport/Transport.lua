--// ReplicatedStorage.SharedModules.ContentPacks.Summerfest2024.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["summerfest_2024_classic_american_car"] = {
        ["name"] = "Classic American Car",
        ["image"] = "rbxassetid://17650184529",
        ["rarity"] = "ultra_rare",
        ["cost"] = 70000,
        ["currency_id"] = "tickets_2024"
    },
    ["summerfest_2024_summer_spectacle"] = {
        ["name"] = "Summer Spectacle",
        ["image"] = "rbxassetid://18118934379",
        ["rarity"] = "legendary",
        ["cost"] = 95000,
        ["currency_id"] = "tickets_2024"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)