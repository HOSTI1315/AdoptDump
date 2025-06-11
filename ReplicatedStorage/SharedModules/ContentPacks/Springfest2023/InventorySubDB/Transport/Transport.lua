--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2023.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["springfest_2023_daisymobile"] = {
        ["name"] = "Daisymobile",
        ["image"] = "rbxassetid://12719600101",
        ["rarity"] = "ultra_rare",
        ["colorable"] = true,
        ["cost"] = 30000,
        ["currency_id"] = "eggs_2023"
    },
    ["springfest_2023_flower_truck"] = {
        ["name"] = "Flower Truck",
        ["image"] = "rbxassetid://12792507038",
        ["rarity"] = "legendary",
        ["cost"] = 120000,
        ["currency_id"] = "eggs_2023"
    },
    ["springfest_2023_lavender_teapot_carriage"] = {
        ["name"] = "Lavender Teapot Carriage",
        ["image"] = "rbxassetid://12996592162",
        ["rarity"] = "legendary"
    },
    ["springfest_2023_rabbit_helicopter"] = {
        ["name"] = "Rabbit Helicopter",
        ["image"] = "rbxassetid://12917527253",
        ["rarity"] = "rare"
    },
    ["springfest_2023_rose_petal_carriage"] = {
        ["name"] = "Rose Petal Carriage",
        ["image"] = "rbxassetid://12996592079",
        ["rarity"] = "legendary"
    },
    ["springfest_2023_royal_crown_carriage"] = {
        ["name"] = "Royal Crown Carriage",
        ["image"] = "rbxassetid://12996592010",
        ["rarity"] = "legendary"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)