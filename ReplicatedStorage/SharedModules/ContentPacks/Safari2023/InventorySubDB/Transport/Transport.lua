--// ReplicatedStorage.SharedModules.ContentPacks.Safari2023.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["safari_2023_cheetah_mount"] = {
        ["name"] = "Giant Cheetah Mount",
        ["image"] = "rbxassetid://13741294258",
        ["rarity"] = "legendary"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)