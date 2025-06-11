--// ReplicatedStorage.SharedModules.ContentPacks.Paint2023.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["paint_2023_paint_roller_truck"] = {
        ["name"] = "Paint Roller Truck",
        ["image"] = "rbxassetid://13125268054",
        ["rarity"] = "legendary",
        ["cost"] = 5000,
        ["colorable"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)