--// ReplicatedStorage.SharedModules.ContentPacks.Winter2024.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["winter_2024_ice_shoes"] = {
        ["name"] = "Ice Shoes",
        ["image"] = "rbxassetid://98132604324130",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "Winter2024IceShoes"
    },
    ["winter_2024_snowy_tree_hat"] = {
        ["name"] = "Snowy Tree Hat",
        ["image"] = "rbxassetid://80849438234053",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Winter2024SnowyTreeHat"
    },
    ["winter_2024_gold_fairy_crown"] = {
        ["name"] = "Gold Fairy Crown",
        ["image"] = "rbxassetid://76472134448449",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Winter2024GoldFairyCrown"
    },
    ["winter_2024_adopt_lanyard"] = {
        ["name"] = "A.D.O.P.T. Lanyard",
        ["image"] = "rbxassetid://87907680060117",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "Winter2024ADOPTLanyard",
        ["cost"] = 600,
        ["currency_id"] = "gingerbread_2024"
    },
    ["winter_2024_gingerbread_beard"] = {
        ["name"] = "Gingerbread Beard",
        ["image"] = "rbxassetid://79622463320905",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Winter2024GingerbreadBeard",
        ["cost"] = 1450,
        ["currency_id"] = "gingerbread_2024"
    },
    ["winter_2024_ice_halo"] = {
        ["name"] = "Ice Halo",
        ["image"] = "rbxassetid://138514860405566",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Winter2024IceHalo",
        ["cost"] = 3100,
        ["currency_id"] = "gingerbread_2024"
    },
    ["winter_2024_shooting_star_wings"] = {
        ["name"] = "Shooting Star Wings",
        ["image"] = "rbxassetid://81881309188617",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "SkyUX2023WingsFlapMedium",
        ["flying_scale"] = 1.3,
        ["model_handle"] = "Winter2024ShootingStarWings"
    },
    ["winter_2024_jinglebell_earrings"] = {
        ["name"] = "Jingle Bell Earrings",
        ["image"] = "rbxassetid://116687595826525",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["equip_type"] = "earrings",
        ["model_handle"] = "Winter2024JingleBellEarrings"
    },
    ["winter_2024_2025_crown"] = {
        ["name"] = "2025 Crown",
        ["image"] = "rbxassetid://89703487678613",
        ["rarity"] = "common",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats",
        ["model_handle"] = "Winter20242025Crown",
        ["cost"] = 2025,
        ["currency_id"] = "gingerbread_2024"
    },
    ["winter_2024_elf_shoes"] = {
        ["name"] = "Elf Shoes",
        ["image"] = "rbxassetid://98377333055149",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes",
        ["model_handle"] = "Winter2024ElfShoes",
        ["cost"] = 3200,
        ["currency_id"] = "gingerbread_2024"
    },
    ["winter_2024_tree_skirt"] = {
        ["name"] = "Tree Skirt",
        ["image"] = "rbxassetid://110813141779849",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back",
        ["model_handle"] = "Winter2024TreeSkirt",
        ["cost"] = 5000,
        ["currency_id"] = "gingerbread_2024"
    },
    ["winter_2024_santas_bow"] = {
        ["name"] = "Santa\'s Bow",
        ["image"] = "rbxassetid://93961663521350",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "collar",
        ["model_handle"] = "Winter2024SantasBow",
        ["cost"] = 4750,
        ["currency_id"] = "gingerbread_2024"
    },
    ["winter_2024_snowman_nose"] = {
        ["name"] = "Snowman Nose",
        ["image"] = "rbxassetid://73924250920889",
        ["rarity"] = "uncommon",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses",
        ["model_handle"] = "Winter2024SnowmanNose",
        ["cost"] = 1250,
        ["currency_id"] = "gingerbread_2024"
    },
    ["winter_2024_winter_bow_wings"] = {
        ["name"] = "Winter Bow Wings",
        ["image"] = "rbxassetid://128715974718053",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["flap_animation"] = "SkyUX2023WingsFlapLarge",
        ["flying_scale"] = 1.5,
        ["model_handle"] = "Winter2024WinterBowWings",
        ["cost"] = 46000,
        ["currency_id"] = "gingerbread_2024"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)