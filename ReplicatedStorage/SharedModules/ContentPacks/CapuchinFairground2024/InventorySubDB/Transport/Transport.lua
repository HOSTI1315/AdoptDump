--// ReplicatedStorage.SharedModules.ContentPacks.CapuchinFairground2024.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["capuchin_2024_circus_ball_skates"] = {
        ["name"] = "Circus Ball Skates",
        ["image"] = "rbxassetid://16810536247",
        ["rarity"] = "uncommon",
        ["is_roller_skates"] = true
    },
    ["capuchin_2024_hot_air_balloon"] = {
        ["name"] = "Hot Air Balloon",
        ["image"] = "rbxassetid://16819910052",
        ["rarity"] = "ultra_rare"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)