--// ReplicatedStorage.SharedModules.ContentPacks.Fossil2024.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["fossil_2024_dinocar"] = {
        ["name"] = "Prehistoric Car",
        ["image"] = "rbxassetid://17093757914",
        ["rarity"] = "legendary"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)