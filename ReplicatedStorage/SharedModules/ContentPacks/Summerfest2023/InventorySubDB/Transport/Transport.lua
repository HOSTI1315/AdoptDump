--// ReplicatedStorage.SharedModules.ContentPacks.Summerfest2023.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["summerfest_2023_beach_buggy"] = {
        ["name"] = "Beach Buggy",
        ["image"] = "rbxassetid://13607580379",
        ["rarity"] = "ultra_rare",
        ["cost"] = 50000,
        ["currency_id"] = "beachballs_2023",
        ["colorable"] = true
    },
    ["summerfest_2023_beachgoer"] = {
        ["name"] = "Beachgoer",
        ["image"] = "rbxassetid://13683681091",
        ["rarity"] = "rare",
        ["cost"] = 45000,
        ["currency_id"] = "beachballs_2023",
        ["colorable"] = true
    },
    ["summerfest_2023_crabby_cruiser"] = {
        ["name"] = "Crabby Cruiser",
        ["image"] = "rbxassetid://13683679951",
        ["rarity"] = "legendary",
        ["cost"] = 100000,
        ["currency_id"] = "beachballs_2023",
        ["colorable"] = true
    },
    ["summerfest_2023_jetski"] = {
        ["name"] = "Water Scooter",
        ["image"] = "rbxassetid://13607580828",
        ["rarity"] = "uncommon",
        ["cost"] = 15000,
        ["currency_id"] = "beachballs_2023",
        ["colorable"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)