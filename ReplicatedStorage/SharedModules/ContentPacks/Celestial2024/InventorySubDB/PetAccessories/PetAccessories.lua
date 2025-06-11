--// ReplicatedStorage.SharedModules.ContentPacks.Celestial2024.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["celestial_2024_galaxy_boots"] = {
        ["name"] = "Galaxy Boots",
        ["image"] = "rbxassetid://18853376000",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "Celestial2024GalaxyBoots"
    },
    ["celestial_2024_galaxy_helmet"] = {
        ["name"] = "Galaxy Helmet",
        ["image"] = "rbxassetid://18957808681",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Celestial2024GalaxyHelmet"
    },
    ["celestial_2024_galaxy_collar"] = {
        ["name"] = "Galaxy Collar",
        ["image"] = "rbxassetid://18960346462",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "Celestial2024GalaxyCollar"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)