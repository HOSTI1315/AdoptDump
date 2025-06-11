--// ReplicatedStorage.SharedModules.ContentPacks.Fall2022.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["fall_2022_badge"] = {
        ["name"] = "Fall Badge",
        ["image"] = "rbxassetid://9973757545",
        ["rarity"] = "common",
        ["cost"] = 100,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["liveops_map_type_required_for_purchase"] = "Fall",
        ["model_handle"] = "Fall2022Badge"
    },
    ["fall_2022_candy_apple"] = {
        ["name"] = "Candy Apple",
        ["image"] = "rbxassetid://9973756879",
        ["rarity"] = "rare",
        ["cost"] = 500,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["liveops_map_type_required_for_purchase"] = "Fall",
        ["model_handle"] = "Fall2022CandyApple"
    },
    ["fall_2022_donut_glasses"] = {
        ["name"] = "Fall Donut Glasses",
        ["image"] = "rbxassetid://9973757740",
        ["rarity"] = "rare",
        ["cost"] = 450,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["liveops_map_type_required_for_purchase"] = "Fall",
        ["model_handle"] = "Fall2022DonutGlasses"
    },
    ["fall_2022_pumpkin_knit_hat"] = {
        ["name"] = "Knitted Pumpkin Hat",
        ["image"] = "rbxassetid://9973768169",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1850,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["liveops_map_type_required_for_purchase"] = "Fall",
        ["model_handle"] = "Fall2022PumpkinKnitHat"
    },
    ["fall_2022_rake_wings"] = {
        ["name"] = "Rake Wings",
        ["image"] = "rbxassetid://9973768513",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1300,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["liveops_map_type_required_for_purchase"] = "Fall",
        ["model_handle"] = "Fall2022RakeWings"
    },
    ["fall_2022_striped_fall_scarf"] = {
        ["name"] = "Stripey Fall Scarf",
        ["image"] = "rbxassetid://9973757903",
        ["rarity"] = "rare",
        ["cost"] = 500,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["liveops_map_type_required_for_purchase"] = "Fall",
        ["model_handle"] = "Fall2022StripedFallScarf"
    },
    ["fall_2022_wreath_necklace"] = {
        ["name"] = "Fall Wreath Necklace",
        ["image"] = "rbxassetid://9973758051",
        ["rarity"] = "uncommon",
        ["cost"] = 180,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["liveops_map_type_required_for_purchase"] = "Fall",
        ["model_handle"] = "Fall2022WreathNecklace"
    },
    ["fall_2022_yarn_ball_earrings"] = {
        ["name"] = "Yarn Ball Earrings",
        ["image"] = "rbxassetid://9973798188",
        ["rarity"] = "uncommon",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["liveops_map_type_required_for_purchase"] = "Fall",
        ["model_handle"] = "Fall2022YarnBallEarrings"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)