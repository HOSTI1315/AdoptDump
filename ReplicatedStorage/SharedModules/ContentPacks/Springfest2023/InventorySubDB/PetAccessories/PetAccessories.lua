--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2023.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["springfest_2023_buttercup_collar"] = {
        ["name"] = "Buttercup Collar",
        ["image"] = "rbxassetid://12917528265",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["currency_id"] = "eggs_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "Springfest2023ButtercupCollar"
    },
    ["springfest_2023_cherry_blossom_earring"] = {
        ["name"] = "Cherry Blossom Earring",
        ["image"] = "rbxassetid://12719584864",
        ["rarity"] = "uncommon",
        ["cost"] = 1680,
        ["currency_id"] = "eggs_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "Springfest2023CherryBlossomEarring"
    },
    ["springfest_2023_dandelion_hat"] = {
        ["name"] = "Dandelion Hat",
        ["image"] = "rbxassetid://12917526516",
        ["rarity"] = "rare",
        ["cost"] = 700,
        ["currency_id"] = "eggs_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Springfest2023DandelionHat"
    },
    ["springfest_2023_flower_beret"] = {
        ["name"] = "Flower Beret",
        ["image"] = "rbxassetid://12719583710",
        ["rarity"] = "ultra_rare",
        ["cost"] = 5000,
        ["currency_id"] = "eggs_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Springfest2023FlowerBeret"
    },
    ["springfest_2023_flower_bunny_ears"] = {
        ["name"] = "Flower Bunny Ears",
        ["image"] = "rbxassetid://12719584021",
        ["rarity"] = "common",
        ["cost"] = 800,
        ["currency_id"] = "eggs_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Springfest2023FlowerBunnyEars"
    },
    ["springfest_2023_flower_monocle"] = {
        ["name"] = "Flower Monocle",
        ["image"] = "rbxassetid://12719586487",
        ["rarity"] = "legendary",
        ["cost"] = 15000,
        ["currency_id"] = "eggs_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Springfest2023FlowerMonocle"
    },
    ["springfest_2023_flower_wreath_pin"] = {
        ["name"] = "Flower Wreath Pin",
        ["image"] = "rbxassetid://12719587562",
        ["rarity"] = "rare",
        ["cost"] = 3000,
        ["currency_id"] = "eggs_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["model_handle"] = "Springfest2023FlowerWreathPin"
    },
    ["springfest_2023_heart_lock_necklace"] = {
        ["name"] = "Heart Lock Necklace",
        ["image"] = "rbxassetid://12719586963",
        ["rarity"] = "common",
        ["cost"] = 1000,
        ["currency_id"] = "eggs_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "Springfest2023HeartLockNecklace"
    },
    ["springfest_2023_strawberry_clip"] = {
        ["name"] = "Strawberry Clip",
        ["image"] = "rbxassetid://12719582077",
        ["rarity"] = "uncommon",
        ["cost"] = 2000,
        ["currency_id"] = "eggs_2023",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Springfest2023StrawberryClip"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)