--// ReplicatedStorage.SharedModules.ContentPacks.Taxi2022.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["taxi_2022_black_cab"] = {
        ["name"] = "Black Cab",
        ["image"] = "rbxassetid://8727492188",
        ["rarity"] = "legendary",
        ["is_taxi"] = true
    },
    ["taxi_2022_yellow_taxi_cab"] = {
        ["name"] = "Yellow Taxi Cab",
        ["image"] = "rbxassetid://8727477150",
        ["rarity"] = "legendary",
        ["is_taxi"] = true
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)