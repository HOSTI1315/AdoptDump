--// ReplicatedStorage.SharedModules.ContentPacks.Pride2022.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["pride_2022_butterfly_clip"] = {
        ["name"] = "Butterfly Clip",
        ["image"] = "rbxassetid://9407161281",
        ["rarity"] = "uncommon",
        ["cost"] = 50,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Pride2022ButterflyClip"
    },
    ["pride_2022_gender_queer_pride_pin"] = {
        ["name"] = "Gender Queer Pride Pin",
        ["image"] = "rbxassetid://9412825196",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "Pride2022GenderQueerPridePin"
    },
    ["pride_2022_intersex_pride_pin"] = {
        ["name"] = "Intersex Pride Pin",
        ["image"] = "rbxassetid://9412828270",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "Pride2022IntersexPridePin"
    },
    ["pride_2022_omnisex_pride_pin"] = {
        ["name"] = "Omnisex Pride Pin",
        ["image"] = "rbxassetid://9412827129",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "Pride2022OmnisexPridePin"
    },
    ["pride_2022_pride_earrings"] = {
        ["name"] = "Pride Earrings",
        ["image"] = "rbxassetid://9407161943",
        ["rarity"] = "uncommon",
        ["cost"] = 50,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "Pride2022PrideEarrings"
    },
    ["pride_2022_pride_glasses"] = {
        ["name"] = "Pride Glasses",
        ["image"] = "rbxassetid://9407190723",
        ["rarity"] = "uncommon",
        ["cost"] = 50,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Pride2022PrideGlasses"
    },
    ["pride_2022_pride_headphones"] = {
        ["name"] = "Pride Headphones",
        ["image"] = "rbxassetid://9407162246",
        ["rarity"] = "uncommon",
        ["cost"] = 50,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Pride2022PrideHeadphones"
    },
    ["pride_2022_pride_wings"] = {
        ["name"] = "Pride Wings",
        ["image"] = "rbxassetid://9407161675",
        ["rarity"] = "uncommon",
        ["cost"] = 50,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Pride2022PrideWings"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)