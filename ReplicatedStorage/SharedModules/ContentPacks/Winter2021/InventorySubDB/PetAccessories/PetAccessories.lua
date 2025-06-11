--// ReplicatedStorage.SharedModules.ContentPacks.Winter2021.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["winter_2021_blue_eggnog_hat"] = {
        ["name"] = "Eggnog Hat",
        ["image"] = "rbxassetid://7975080290",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Winter2021EggnogHat"
    },
    ["winter_2021_golden_walrus_crown"] = {
        ["name"] = "Golden Walrus Crown",
        ["image"] = "rbxassetid://8102738212",
        ["rarity"] = "legendary",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Winter2021GoldenWalrusCrown"
    },
    ["winter_2021_red_candy_cane"] = {
        ["name"] = "Candy Cane",
        ["image"] = "rbxassetid://7975080057",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Winter2021CandyCane"
    },
    ["winter_2021_red_christmas_stocking_shoes"] = {
        ["name"] = "Festive Stocking Shoes",
        ["image"] = "rbxassetid://7975097902",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "Winter2021ChristmasStockingShoes"
    },
    ["winter_2021_red_mistletoe_hat"] = {
        ["name"] = "Festive Top Hat",
        ["image"] = "rbxassetid://7975097483",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Winter2021MistletoeTopHat"
    },
    ["winter_2021_red_scarf"] = {
        ["name"] = "Festive Scarf",
        ["image"] = "rbxassetid://7975080494",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "Winter2021Scarf"
    },
    ["winter_2021_summer_walrus_sunhat"] = {
        ["name"] = "Summer Walrus Sunhat",
        ["image"] = "rbxassetid://8102738543",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Winter2021SummerWalrusSunhat"
    },
    ["winter_2021_yellow_star_pin"] = {
        ["name"] = "Festive Star Pin",
        ["image"] = "rbxassetid://7975097622",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "Winter2021StarPin"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)