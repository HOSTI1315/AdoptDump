--// ReplicatedStorage.SharedModules.ContentPacks.MegaCars2024.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["mega_cars_2024_cupids_buggy"] = {
        ["name"] = "Cupid\'s Coupe",
        ["image"] = "rbxassetid://15918509894",
        ["rarity"] = "legendary"
    },
    ["mega_cars_2024_regal_roller"] = {
        ["name"] = "Regal Roller",
        ["image"] = "rbxassetid://15918510426",
        ["rarity"] = "legendary",
        ["colorable"] = true
    },
    ["mega_cars_2024_street_racer"] = {
        ["name"] = "Street Drifter",
        ["image"] = "rbxassetid://15918510859",
        ["rarity"] = "legendary",
        ["colorable"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)