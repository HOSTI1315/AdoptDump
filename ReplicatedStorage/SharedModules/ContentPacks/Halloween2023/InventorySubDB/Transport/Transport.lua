--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2023.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["halloween_2023_charons_boat"] = {
        ["name"] = "Charon\'s Boat",
        ["image"] = "rbxassetid://14884463158",
        ["rarity"] = "ultra_rare",
        ["colorable"] = true,
        ["cost"] = 68000,
        ["currency_id"] = "candy_2023"
    },
    ["halloween_2023_haunted_wagon"] = {
        ["name"] = "Haunted Wagon",
        ["image"] = "rbxassetid://15093138856",
        ["rarity"] = "uncommon",
        ["colorable"] = true,
        ["cost"] = 12000,
        ["currency_id"] = "candy_2023"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)