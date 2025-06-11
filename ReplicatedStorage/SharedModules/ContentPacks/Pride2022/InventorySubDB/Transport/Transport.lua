--// ReplicatedStorage.SharedModules.ContentPacks.Pride2022.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["pride_2022_rainbow_trail_magic_carpet"] = {
        ["name"] = "Rainbow Trail Magic Carpet",
        ["image"] = "rbxassetid://9837424665",
        ["rarity"] = "uncommon",
        ["cost"] = 250
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)