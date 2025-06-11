--// ReplicatedStorage.SharedModules.ContentPacks.Moon2025.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["moon_2025_lunar_new_year_headdress"] = {
        ["name"] = "Lunar New Year Headdress",
        ["image"] = "rbxassetid://110088410957127",
        ["rarity"] = "rare",
        ["cost"] = 5,
        ["currency_id"] = "stars_2025",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Moon2025LunarNewYearHeaddress"
    },
    ["moon_2025_alien_eyes_hat"] = {
        ["name"] = "Alien Eyes Hat",
        ["image"] = "rbxassetid://125498741942440",
        ["rarity"] = "uncommon",
        ["cost"] = 750,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Moon2025AlienEyesHat"
    },
    ["moon_2025_crater_flag_hat"] = {
        ["name"] = "Crater Flag Hat",
        ["image"] = "rbxassetid://74177528220932",
        ["rarity"] = "rare",
        ["cost"] = 1200,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Moon2025CraterFlagHat"
    },
    ["moon_2025_moon_boots"] = {
        ["name"] = "Moon Boots",
        ["image"] = "rbxassetid://116429258250266",
        ["rarity"] = "common",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "Moon2025MoonBoots"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)