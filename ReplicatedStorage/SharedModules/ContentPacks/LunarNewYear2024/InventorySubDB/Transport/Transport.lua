--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2024.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["lunar_2024_dragonster"] = {
        ["name"] = "Dragonster",
        ["image"] = "rbxassetid://16191104536",
        ["rarity"] = "legendary"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)