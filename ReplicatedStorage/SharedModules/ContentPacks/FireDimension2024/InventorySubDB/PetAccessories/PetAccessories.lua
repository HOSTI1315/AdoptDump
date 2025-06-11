--// ReplicatedStorage.SharedModules.ContentPacks.FireDimension2024.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["fire_dimension_2024_fire_helmet"] = {
        ["name"] = "Fire Helmet",
        ["model_handle"] = "FireDimension2024FireHelmet",
        ["image"] = "rbxassetid://16273267398",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats"
    },
    ["fire_dimension_2024_flame_cape"] = {
        ["name"] = "Flame Cape",
        ["model_handle"] = "FireDimension2024FlameCape",
        ["image"] = "rbxassetid://16273269940",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back"
    },
    ["fire_dimension_2024_fire_extinguisher_backpack"] = {
        ["name"] = "Fire Extinguisher Backpack",
        ["model_handle"] = "FireDimension2024FireExtinguisherBackpack",
        ["image"] = "rbxassetid://16273267804",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back"
    },
    ["fire_dimension_2024_heat_vent_hat"] = {
        ["name"] = "Heater Hat",
        ["model_handle"] = "FireDimension2024HeatVentHat",
        ["image"] = "rbxassetid://16273266998",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats"
    },
    ["fire_dimension_2024_volcanic_boots"] = {
        ["name"] = "Volcanic Boots",
        ["model_handle"] = "FireDimension2024VolcanicBoots",
        ["image"] = "rbxassetid://16273266561",
        ["rarity"] = "rare",
        ["equip_type"] = "shoes",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)