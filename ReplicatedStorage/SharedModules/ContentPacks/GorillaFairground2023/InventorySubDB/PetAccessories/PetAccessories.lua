--// ReplicatedStorage.SharedModules.ContentPacks.GorillaFairground2023.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["gorilla_fair_2023_astronaut_accessory"] = {
        ["name"] = "Jetpack",
        ["image"] = "rbxassetid://12556240403",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "GorillaFair2023AstronautJetpack"
    },
    ["gorilla_fair_2023_chef_accessory"] = {
        ["name"] = "Chef Hat",
        ["image"] = "rbxassetid://12556240861",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GorillaFair2023RedChefHat"
    },
    ["gorilla_fair_2023_emperor_accessory"] = {
        ["name"] = "Gold Crown",
        ["image"] = "rbxassetid://12556240567",
        ["rarity"] = "legendary",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GorillaFair2023EmperorCrown"
    },
    ["gorilla_fair_2023_karate_accessory"] = {
        ["name"] = "Headband",
        ["image"] = "rbxassetid://12556240740",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GorillaFair2023KarateHeadband"
    },
    ["gorilla_fair_2023_tuxedo_tie"] = {
        ["name"] = "Bow Tie",
        ["image"] = "rbxassetid://12554079636",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GorillaFair2023TuxedoTie"
    },
    ["gorilla_fair_2023_tuxedo_top_hat"] = {
        ["name"] = "Top Hat",
        ["image"] = "rbxassetid://12554079743",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "GorillaFair2023TuxedoTopHat"
    },
    ["gorilla_fair_2023_tuxedo_walking_stick"] = {
        ["name"] = "Walking Cane",
        ["image"] = "rbxassetid://12554079863",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "GorillaFair2023TuxedoWalkingStick"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)