--// ReplicatedStorage.SharedModules.ContentPacks.TimePortal2024.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["time_portal_2024_clock"] = {
        ["name"] = "Time Traveler\'s Clock",
        ["image"] = "rbxassetid://16659377086",
        ["rarity"] = "common",
        ["colorable"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)