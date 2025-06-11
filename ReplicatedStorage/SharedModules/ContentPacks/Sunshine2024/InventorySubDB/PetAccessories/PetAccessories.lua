--// ReplicatedStorage.SharedModules.ContentPacks.Sunshine2024.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["sunshine_2024_laurel_wreath"] = {
        ["name"] = "Laurel Wreath",
        ["image"] = "rbxassetid://18516122121",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Sunshine2024LaurelWreath"
    },
    ["sunshine_2024_bronze_medal"] = {
        ["name"] = "Bronze Medal",
        ["image"] = "rbxassetid://18516166440",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["model_handle"] = "Sunshine2024BronzeMedal"
    },
    ["sunshine_2024_silver_medal"] = {
        ["name"] = "Silver Medal",
        ["image"] = "rbxassetid://18516167859",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["model_handle"] = "Sunshine2024SilverMedal"
    },
    ["sunshine_2024_gold_medal"] = {
        ["name"] = "Gold Medal",
        ["image"] = "rbxassetid://18516168781",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["model_handle"] = "Sunshine2024GoldMedal"
    },
    ["sunshine_2024_sports_shirt"] = {
        ["name"] = "Sports Shirt",
        ["image"] = "rbxassetid://18517488761",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Sunshine2024SportsShirt"
    },
    ["sunshine_2024_sports_hat"] = {
        ["name"] = "Sports Hat",
        ["image"] = "rbxassetid://18517484633",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Sunshine2024SportsHat"
    },
    ["sunshine_2024_sports_shoes"] = {
        ["name"] = "Sports Shoes",
        ["image"] = "rbxassetid://18517489935",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "Sunshine2024SportsShoes"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)