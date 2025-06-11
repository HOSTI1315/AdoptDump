--// ReplicatedStorage.SharedModules.ContentPacks.FTUE2022.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["ftue_2022_starter_bike"] = {
        ["name"] = "Starter Bike",
        ["image"] = "rbxassetid://9406027381",
        ["rarity"] = "uncommon",
        ["colorable"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)