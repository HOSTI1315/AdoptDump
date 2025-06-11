--// ReplicatedStorage.SharedModules.ContentPacks.Sunshine2024.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Sunshine Token",
    ["image"] = "rbxassetid://18639829085",
    ["rarity"] = "uncommon",
    ["donatable"] = true,
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "Sunshine2024SunshineLobbyEntryToken",
    ["tool"] = "ChewToyTool"
}
v2.sunshine_2024_sunshine_token = v3
local v4 = {
    ["name"] = "Bouquet Chew Toy",
    ["image"] = "rbxassetid://18517757896",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Sunshine2024BouquetChewToy",
    ["tool"] = "ChewToyTool"
}
v2.sunshine_2024_bouquet_chew_toy = v4
local v5 = {
    ["name"] = "Tennis Racket Toy",
    ["image"] = "rbxassetid://18517756403",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["hold"] = "BaseballBatHold",
        ["use"] = "BaseballBatSwing"
    },
    ["model_handle"] = "Sunshine2024TennisRacketToy",
    ["tool"] = "GenericTool"
}
v2.sunshine_2024_tennis_racket_toy = v5
return v1(v2)