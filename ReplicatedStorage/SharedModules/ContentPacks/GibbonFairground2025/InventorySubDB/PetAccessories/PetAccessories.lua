--// ReplicatedStorage.SharedModules.ContentPacks.GibbonFairground2025.InventorySubDB.PetAccessories (ModuleScript)

local v1 = {
    ["gibbon_2025_police_cap"] = {
        ["name"] = "Police Cap",
        ["model_handle"] = "Gibbon2025PoliceCap",
        ["image"] = "rbxassetid://140458280761310",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats"
    },
    ["gibbon_2025_firefighter_boots"] = {
        ["name"] = "Firefighter Boots",
        ["model_handle"] = "Gibbon2025FirefighterBoots",
        ["image"] = "rbxassetid://123956378018716",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "shoes",
        ["equip_type"] = "shoes"
    },
    ["gibbon_2025_villainous_eyebrows"] = {
        ["name"] = "Villainous Eyebrows",
        ["model_handle"] = "Gibbon2025VillainousEyebrows",
        ["image"] = "rbxassetid://89144006988810",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses"
    },
    ["gibbon_2025_super_hero_hair"] = {
        ["name"] = "Super Hero Hair",
        ["model_handle"] = "Gibbon2025SuperHeroHair",
        ["image"] = "rbxassetid://105377032647120",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats"
    },
    ["gibbon_2025_influencer_hair"] = {
        ["name"] = "Influencer Hair",
        ["model_handle"] = "Gibbon2025InfluencerHair",
        ["image"] = "rbxassetid://122551600232161",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats"
    },
    ["gibbon_2025_mobile_phone"] = {
        ["name"] = "Mobile Phone",
        ["model_handle"] = "Gibbon2025MobilePhone",
        ["image"] = "rbxassetid://104912126414876",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "back"
    },
    ["gibbon_2025_fancy_top_hat"] = {
        ["name"] = "Fancy Top Hat",
        ["model_handle"] = "Gibbon2025FancyTopHat",
        ["image"] = "rbxassetid://88459592235823",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "hats"
    },
    ["gibbon_2025_fire_hose_scarf"] = {
        ["name"] = "Fire Hose Scarf",
        ["model_handle"] = "Gibbon2025FireHoseScarf",
        ["image"] = "rbxassetid://120712723110722",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck"
    },
    ["gibbon_2025_whistle_necklace"] = {
        ["name"] = "Whistle Necklace",
        ["model_handle"] = "Gibbon2025WhistleNecklace",
        ["image"] = "rbxassetid://87099164777418",
        ["rarity"] = "rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "neck"
    },
    ["gibbon_2025_hero_mask"] = {
        ["name"] = "Hero Mask",
        ["model_handle"] = "Gibbon2025HeroMask",
        ["image"] = "rbxassetid://80340798557308",
        ["rarity"] = "legendary",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "glasses"
    },
    ["gibbon_2025_folded_paper_wings"] = {
        ["name"] = "Folded Paper Wings",
        ["image"] = "rbxassetid://109637371085587",
        ["rarity"] = "ultra_rare",
        ["is_in_hatshop_rotation"] = false,
        ["sort_group"] = "General",
        ["accessory_type"] = "wings",
        ["equip_type"] = "wings",
        ["model_handle"] = "Gibbon2025FoldedPaperWings",
        ["flap_animation"] = "SkyUX2023WingsFlapMedium",
        ["flying_scale"] = 1.2
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pet_accessories(v1)