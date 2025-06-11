--// ReplicatedStorage.SharedModules.ContentPacks.Wings2022.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["wings_2022_clam_wings"] = {
        ["name"] = "Clam Wings",
        ["image"] = "rbxassetid://10795415532",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "ClamWingFlap",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "Wings2022ClamWings"
    },
    ["wings_2022_davinci_wings"] = {
        ["name"] = "Da Wingci Wings",
        ["image"] = "rbxassetid://10795415668",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "DaVinciWingFlap",
        ["model_handle"] = "Wings2022DaVinciWings"
    },
    ["wings_2022_demon_wings"] = {
        ["name"] = "Demon Wings",
        ["image"] = "rbxassetid://10795415811",
        ["rarity"] = "legendary",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "DemonWingFlap",
        ["model_handle"] = "Wings2022DemonWings"
    },
    ["wings_2022_dragonfly_fairy_wings"] = {
        ["name"] = "Dragonfly Fairy Wings",
        ["image"] = "rbxassetid://10795415949",
        ["rarity"] = "legendary",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "DragonflyWingFlap",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "Wings2022DragonflyWings"
    },
    ["wings_2022_eagle_wings"] = {
        ["name"] = "Eagle Wings",
        ["image"] = "rbxassetid://10795416059",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "EagleWingFlap",
        ["model_handle"] = "Wings2022EagleWings"
    },
    ["wings_2022_fantasy_wings"] = {
        ["name"] = "Fantastical Wings",
        ["image"] = "rbxassetid://10795416151",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "FantasyWingFlap",
        ["model_handle"] = "Wings2022FantasyWings"
    },
    ["wings_2022_invisible_wings"] = {
        ["name"] = "Invisible Wings",
        ["image"] = "rbxassetid://10837941441",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["model_handle"] = "Wings2022InvisibleWings"
    },
    ["wings_2022_magic_girl_wings"] = {
        ["name"] = "Magic Girl Wings",
        ["image"] = "rbxassetid://10795448851",
        ["rarity"] = "legendary",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "MagicGirlWingFlap",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "Wings2022MagicGirlWings"
    },
    ["wings_2022_magpie_wings"] = {
        ["name"] = "Magpie Wings",
        ["image"] = "rbxassetid://10795448954",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "MagpieWingFlap",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "Wings2022MagpieWings"
    },
    ["wings_2022_nature_wings"] = {
        ["name"] = "Natural Wings",
        ["image"] = "rbxassetid://10795449073",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "NatureWingFlap",
        ["model_handle"] = "Wings2022NatureWings"
    },
    ["wings_2022_pterodactyl_wings"] = {
        ["name"] = "Pterodactyl Wings",
        ["image"] = "rbxassetid://10795449212",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "PterodactylWingFlap",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "Wings2022PterodactylWings"
    },
    ["wings_2022_rainbow_cloud"] = {
        ["name"] = "Rainbow Cloud Wings",
        ["image"] = "rbxassetid://10795449345",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = true,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "RainbowCloudWingFlap",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "Wings2022RainbowCloudWings"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)