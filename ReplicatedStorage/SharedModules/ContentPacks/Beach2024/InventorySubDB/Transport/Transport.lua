--// ReplicatedStorage.SharedModules.ContentPacks.Beach2024.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["beach_2024_airboat"] = {
        ["name"] = "Airboat",
        ["image"] = "rbxassetid://16371879458",
        ["rarity"] = "common",
        ["cost"] = 2500,
        ["colorable"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)