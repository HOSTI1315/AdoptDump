--// ReplicatedStorage.SharedModules.ContentPacks.Summerfest2023.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["summerfest_2023_beach_umbrella"] = {
        ["name"] = "Beach Umbrella",
        ["image"] = "rbxassetid://13607688619",
        ["rarity"] = "uncommon",
        ["cost"] = 500,
        ["currency_id"] = "beachballs_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Summerfest2023BeachUmbrella"
    },
    ["summerfest_2023_diving_fins"] = {
        ["name"] = "Diving Fins",
        ["image"] = "rbxassetid://13607682140",
        ["rarity"] = "rare",
        ["cost"] = 1500,
        ["currency_id"] = "beachballs_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "Summerfest2023DivingFins"
    },
    ["summerfest_2023_drinks_cooler"] = {
        ["name"] = "Drinks Cooler",
        ["image"] = "rbxassetid://13607685475",
        ["rarity"] = "common",
        ["cost"] = 600,
        ["currency_id"] = "beachballs_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Summerfest2023DrinksCooler"
    },
    ["summerfest_2023_duck_floatie"] = {
        ["name"] = "Duck Floatie",
        ["image"] = "rbxassetid://13607683152",
        ["rarity"] = "ultra_rare",
        ["cost"] = 3750,
        ["currency_id"] = "beachballs_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Summerfest2023DuckFloatie"
    },
    ["summerfest_2023_flowery_sunhat"] = {
        ["name"] = "Flowery Sunhat",
        ["image"] = "rbxassetid://13607684376",
        ["rarity"] = "uncommon",
        ["cost"] = 850,
        ["currency_id"] = "beachballs_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Summerfest2023FlowerySunhat"
    },
    ["summerfest_2023_lei"] = {
        ["name"] = "Lei",
        ["image"] = "rbxassetid://13607686785",
        ["rarity"] = "common",
        ["cost"] = 400,
        ["currency_id"] = "beachballs_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "Summerfest2023Lei"
    },
    ["summerfest_2023_shark_swim"] = {
        ["name"] = "Shark Swimcap",
        ["image"] = "rbxassetid://13607690103",
        ["rarity"] = "ultra_rare",
        ["cost"] = 4000,
        ["currency_id"] = "beachballs_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Summerfest2023SharkSwim"
    },
    ["summerfest_2023_star_sunglasses"] = {
        ["name"] = "Star Sunglasses",
        ["image"] = "rbxassetid://13607691503",
        ["rarity"] = "common",
        ["cost"] = 450,
        ["currency_id"] = "beachballs_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Summerfest2023StarSunglasses"
    },
    ["summerfest_2023_summer_straw_hat"] = {
        ["name"] = "Summer Straw Hat",
        ["image"] = "rbxassetid://13607693143",
        ["rarity"] = "rare",
        ["cost"] = 2000,
        ["currency_id"] = "beachballs_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Summerfest2023SummerStrawHat"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)