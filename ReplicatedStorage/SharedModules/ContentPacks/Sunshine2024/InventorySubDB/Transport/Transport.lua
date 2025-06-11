--// ReplicatedStorage.SharedModules.ContentPacks.Sunshine2024.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["sunshine_2024_sunshine_chariot"] = {
        ["name"] = "Sunshine Chariot",
        ["image"] = "rbxassetid://18517865005",
        ["rarity"] = "ultra_rare",
        ["colorable"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)