--// ReplicatedStorage.SharedModules.ContentPacks.Rain2023.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["rain_2023_captains_jacket"] = {
        ["name"] = "Captain\'s Jacket",
        ["image"] = "rbxassetid://10961518047",
        ["rarity"] = "uncommon",
        ["cost"] = 450,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["liveops_map_type_required_for_purchase"] = "Rain",
        ["model_handle"] = "Rain2023CaptainsJacket"
    },
    ["rain_2023_fishers_headdress"] = {
        ["name"] = "Fishers\' Headdress",
        ["image"] = "rbxassetid://10961517711",
        ["rarity"] = "rare",
        ["cost"] = 600,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["liveops_map_type_required_for_purchase"] = "Rain",
        ["model_handle"] = "Rain2023FishersHeaddress"
    },
    ["rain_2023_glowing_skull_key"] = {
        ["name"] = "Glowing Skull Key",
        ["image"] = "rbxassetid://10961522750",
        ["rarity"] = "common",
        ["cost"] = 300,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck",
        ["liveops_map_type_required_for_purchase"] = "Rain",
        ["model_handle"] = "Rain2023GlowingSkullKey"
    },
    ["rain_2023_parrot_hood"] = {
        ["name"] = "Parrot Hood",
        ["image"] = "rbxassetid://10967697975",
        ["rarity"] = "uncommon",
        ["cost"] = 500,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["liveops_map_type_required_for_purchase"] = "Rain",
        ["model_handle"] = "Rain2023ParrotHood"
    },
    ["rain_2023_rain_badge"] = {
        ["name"] = "Rain Badge",
        ["image"] = "rbxassetid://10961522289",
        ["rarity"] = "common",
        ["cost"] = 100,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "chest",
        ["liveops_map_type_required_for_purchase"] = "Rain",
        ["model_handle"] = "Rain2023RainBadge"
    },
    ["rain_2023_rain_leaf_wings"] = {
        ["name"] = "Rain Leaf Wings",
        ["image"] = "rbxassetid://10961517432",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1300,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["liveops_map_type_required_for_purchase"] = "Rain",
        ["model_handle"] = "Rain2023RainLeafWings"
    },
    ["rain_2023_rainy_cloud_earrings"] = {
        ["name"] = "Rainy Clouds Earrings",
        ["image"] = "rbxassetid://10961518544",
        ["rarity"] = "common",
        ["cost"] = 150,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["liveops_map_type_required_for_purchase"] = "Rain",
        ["model_handle"] = "Rain2023RainyCloudEarrings"
    },
    ["rain_2023_spyglass_glasses"] = {
        ["name"] = "Spyglass Glasses",
        ["image"] = "rbxassetid://10961523825",
        ["rarity"] = "uncommon",
        ["cost"] = 300,
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["liveops_map_type_required_for_purchase"] = "Rain",
        ["model_handle"] = "Rain2023SpyglassGlasses"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)