--// ReplicatedStorage.SharedModules.ContentPacks.CapuchinFairground2024.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["capuchin_2024_preppy_sweater"] = {
        ["name"] = "Preppy Sweater",
        ["image"] = "rbxassetid://16820636168",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Capuchin2024PreppySweater"
    },
    ["capuchin_2024_princess_booties"] = {
        ["name"] = "Princess Booties",
        ["image"] = "rbxassetid://16820633728",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "Capuchin2024PrincessBooties"
    },
    ["capuchin_2024_inmate_cap"] = {
        ["name"] = "Inmate Cap",
        ["image"] = "rbxassetid://16820644505",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Capuchin2024InmateCap"
    },
    ["capuchin_2024_ship_wheel_necklace"] = {
        ["name"] = "Ship Wheel Necklace",
        ["image"] = "rbxassetid://16820628719",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "Capuchin2024ShipWheelNecklace"
    },
    ["capuchin_2024_royal_capuchin_cape"] = {
        ["name"] = "Royal Capuchin Cape",
        ["image"] = "rbxassetid://16820641234",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Capuchin2024RoyalCapuchinCape"
    },
    ["capuchin_2024_royal_capuchin_saber_pin"] = {
        ["name"] = "Royal Capuchin Saber Pin",
        ["image"] = "rbxassetid://16820631440",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "Capuchin2024RoyalCapuchinSaberPin"
    },
    ["capuchin_2024_royal_capuchin_crown"] = {
        ["name"] = "Royal Capuchin Crown",
        ["image"] = "rbxassetid://16820638445",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Capuchin2024RoyalCapuchinCrown"
    },
    ["capuchin_2024_cool_sunglasses"] = {
        ["name"] = "Cool Sunglasses",
        ["image"] = "rbxassetid://16899351394",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Capuchin2024CoolSunglasses"
    },
    ["capuchin_2024_tutu"] = {
        ["name"] = "Tutu",
        ["image"] = "rbxassetid://16899348909",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Capuchin2024Tutu"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)