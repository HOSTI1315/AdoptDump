--// ReplicatedStorage.SharedModules.ContentPacks.RoyalPalace2022.InventorySubDB.Toys (ModuleScript)

local v1 = {
    ["royal_palace_2022_tea_party_chair"] = {
        ["name"] = "Tea Party Chair",
        ["image"] = "rbxassetid://10526017359",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1300,
        ["model_handle"] = "RoyalPalace2022TeaPartyChair",
        ["placeable_type"] = "toy_furniture",
        ["tool"] = "PlaceableTool"
    },
    ["royal_palace_2022_tea_party_set"] = {
        ["name"] = "Tea Party Set",
        ["image"] = "rbxassetid://10526019746",
        ["rarity"] = "legendary",
        ["cost"] = 3000,
        ["model_handle"] = "RoyalPalace2022TeaPartySet",
        ["placeable_type"] = "toy_furniture",
        ["tool"] = "PlaceableTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys(v1)