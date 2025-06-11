--// ReplicatedStorage.SharedModules.ContentPacks.SkyUX2023.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["sky_ux_2023_balloon_wings"] = {
        ["name"] = "Balloon Wings",
        ["image"] = "rbxassetid://13186016586",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "SkyUX2023WingsFlapSmall",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "SkyUX2023BalloonWings"
    },
    ["sky_ux_2023_clockwork_wings"] = {
        ["name"] = "Clockwork Wings",
        ["image"] = "rbxassetid://13186020239",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "SkyUX2023WingsClockworkFlap",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "SkyUX2023ClockworkWings"
    },
    ["sky_ux_2023_cloud_wings"] = {
        ["name"] = "Cloud Wings",
        ["image"] = "rbxassetid://13186019905",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "SkyUX2023WingsFlapLarge",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "SkyUX2023CloudWings"
    },
    ["sky_ux_2023_ember_wings"] = {
        ["name"] = "Ember Wings",
        ["image"] = "rbxassetid://13186020524",
        ["rarity"] = "legendary",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "SkyUX2023WingsFlapMedium",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "SkyUX2023EmberWings"
    },
    ["sky_ux_2023_fairy_wings"] = {
        ["name"] = "Fairy Wings",
        ["image"] = "rbxassetid://13186019243",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "SkyUX2023WingsFlapMedium",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "SkyUX2023FairyWings"
    },
    ["sky_ux_2023_flower_wings"] = {
        ["name"] = "Flower Wings",
        ["image"] = "rbxassetid://13186021247",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "SkyUX2023WingsFlapSmallRigid",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "SkyUX2023FlowerWings"
    },
    ["sky_ux_2023_flying_fish_wings"] = {
        ["name"] = "Flying Fish Wings",
        ["image"] = "rbxassetid://13186017453",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "SkyUX2023WingsFlapSmall",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "SkyUX2023FlyingFishWings"
    },
    ["sky_ux_2023_gull_wings"] = {
        ["name"] = "Gull Wings",
        ["image"] = "rbxassetid://13186015860",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "SkyUX2023WingsFlapMedium",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "SkyUX2023GullWings"
    },
    ["sky_ux_2023_macaw_wings"] = {
        ["name"] = "Macaw Wings",
        ["image"] = "rbxassetid://13186018437",
        ["rarity"] = "legendary",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "SkyUX2023WingsFlapMedium",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "SkyUX2023MacawWings"
    },
    ["sky_ux_2023_owl_wings"] = {
        ["name"] = "Owl Wings",
        ["image"] = "rbxassetid://13186018113",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "SkyUX2023WingsFlapSmallRigid",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "SkyUX2023OwlWings"
    },
    ["sky_ux_2023_paper_wings"] = {
        ["name"] = "Paper Wings",
        ["image"] = "rbxassetid://13186014878",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "SkyUX2023WingsFlapLarge",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "SkyUX2023PaperWings"
    },
    ["sky_ux_2023_watery_wings"] = {
        ["name"] = "Watery Wings",
        ["image"] = "rbxassetid://13186021554",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "SkyUX2023WingsFlapLarge",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "SkyUX2023WateryWings"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)