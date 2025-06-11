--// ReplicatedStorage.SharedModules.ContentPacks.Rain2023.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["rain_2023_galleon"] = {
        ["name"] = "Galleon",
        ["image"] = "rbxassetid://10967874847",
        ["rarity"] = "ultra_rare",
        ["cost"] = 3000,
        ["liveops_map_type_required_for_purchase"] = "Rain"
    },
    ["rain_2023_old_sail_boat"] = {
        ["name"] = "Old Sailboat",
        ["image"] = "rbxassetid://10967808228",
        ["rarity"] = "rare",
        ["cost"] = 1500,
        ["liveops_map_type_required_for_purchase"] = "Rain"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)