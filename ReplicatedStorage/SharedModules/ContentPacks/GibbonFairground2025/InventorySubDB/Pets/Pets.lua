--// ReplicatedStorage.SharedModules.ContentPacks.GibbonFairground2025.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Gibbon",
    ["image"] = "rbxassetid://84105347355723",
    ["model"] = "Gibbon2025Gibbon",
    ["rarity"] = "rare",
    ["cost"] = 300,
    ["origin_entry"] = {
        ["origin"] = "Gibbon Fairground",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["anims"] = {
        ["double_hold"] = "Gibbon2025GibbonBeingHeldDouble",
        ["eating"] = "Gibbon2025GibbonEat",
        ["hold"] = "Gibbon2025GibbonBeingHeldSingle",
        ["idle"] = "Gibbon2025GibbonIdle",
        ["running"] = "Gibbon2025GibbonRun",
        ["sit"] = "Gibbon2025GibbonSit",
        ["sleep"] = "Gibbon2025GibbonSleep"
    },
    ["tricks"] = {
        { "Sit", "Gibbon2025GibbonSit" },
        { "Joyful", "Gibbon2025GibbonJoyful" },
        { "Beg", "Gibbon2025GibbonBeg" },
        { "Jump", "Gibbon2025GibbonJump" },
        { "Trick 1", "Gibbon2025GibbonTrick1" },
        { "Trick 2", "Gibbon2025GibbonTrick2" }
    },
    ["neon_parts"] = {
        ["FrontLeftFoot_Geo"] = Color3.fromRGB(186, 109, 90),
        ["FrontRightFoot_Geo"] = Color3.fromRGB(186, 109, 90),
        ["Torso2_Geo"] = Color3.fromRGB(186, 109, 90),
        ["RightArm2_Geo"] = Color3.fromRGB(186, 109, 90),
        ["LeftArm2_Geo"] = Color3.fromRGB(186, 109, 90)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.gibbon_2025_gibbon = v3
local v4 = {
    ["name"] = "Firefighter Gibbon",
    ["image"] = "rbxassetid://105232492496005",
    ["model"] = "Gibbon2025FirefighterGibbon",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Gibbon Fairground",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["anims"] = {
        ["double_hold"] = "Gibbon2025GibbonBeingHeldDouble",
        ["eating"] = "Gibbon2025GibbonEat",
        ["hold"] = "Gibbon2025GibbonBeingHeldSingle",
        ["idle"] = "Gibbon2025GibbonIdle",
        ["running"] = "Gibbon2025GibbonRun",
        ["sit"] = "Gibbon2025GibbonSit",
        ["sleep"] = "Gibbon2025GibbonSleep"
    },
    ["tricks"] = {
        { "Sit", "Gibbon2025GibbonSit" },
        { "Joyful", "Gibbon2025GibbonJoyful" },
        { "Beg", "Gibbon2025GibbonBeg" },
        { "Jump", "Gibbon2025GibbonJump" },
        { "Trick 1", "Gibbon2025FirefighterGibbonTrick1" },
        { "Trick 2", "Gibbon2025GibbonTrick2" }
    },
    ["neon_parts"] = {
        ["FirefighterLeftArm3_Geo"] = Color3.fromRGB(15, 188, 136),
        ["FirefighterRightArm3_Geo"] = Color3.fromRGB(15, 188, 136),
        ["FirefighterJacket2_Geo"] = Color3.fromRGB(15, 188, 136)
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["pre_equipped_removable_accessories"] = { "gibbon_2025_firefighter_boots" }
}
v2.gibbon_2025_firefighter_gibbon = v4
local v5 = {
    ["name"] = "Villain Gibbon",
    ["image"] = "rbxassetid://108312620331321",
    ["model"] = "Gibbon2025VillainGibbon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Gibbon Fairground",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["anims"] = {
        ["double_hold"] = "Gibbon2025GibbonBeingHeldDouble",
        ["eating"] = "Gibbon2025GibbonEat",
        ["hold"] = "Gibbon2025GibbonBeingHeldSingle",
        ["idle"] = "Gibbon2025VillainGibbonIdle",
        ["running"] = "Gibbon2025VillainGibbonRun",
        ["sit"] = "Gibbon2025GibbonSit",
        ["sleep"] = "Gibbon2025GibbonCapeSleep"
    },
    ["tricks"] = {
        { "Sit", "Gibbon2025GibbonSit" },
        { "Joyful", "Gibbon2025GibbonJoyful" },
        { "Beg", "Gibbon2025GibbonBeg" },
        { "Jump", "Gibbon2025GibbonJump" },
        { "Trick 1", "Gibbon2025VillainGibbonTrick1" },
        { "Trick 2", "Gibbon2025GibbonTrick2" }
    },
    ["neon_parts"] = {
        ["EvilCollar3_Geo"] = Color3.fromRGB(93, 52, 214),
        ["EvilCape_Geo"] = Color3.fromRGB(93, 52, 214),
        ["EvilCollar2_Geo"] = Color3.fromRGB(169, 193, 14),
        ["EvilCape2_Geo"] = Color3.fromRGB(93, 52, 214),
        ["EvilCollar_Geo"] = Color3.fromRGB(93, 52, 214),
        ["FrontLeftFoot_Geo"] = Color3.fromRGB(93, 52, 214),
        ["FrontRightFoot_Geo"] = Color3.fromRGB(93, 52, 214),
        ["RightArm2_Geo"] = Color3.fromRGB(93, 52, 214),
        ["LeftArm2_Geo"] = Color3.fromRGB(93, 52, 214),
        ["EvilStache_Geo"] = Color3.fromRGB(93, 52, 214)
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["pre_equipped_removable_accessories"] = { "gibbon_2025_villainous_eyebrows" }
}
v2.gibbon_2025_villain_gibbon = v5
local v6 = {
    ["name"] = "Officer Gibbon",
    ["image"] = "rbxassetid://74373220330198",
    ["model"] = "Gibbon2025OfficerGibbon",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Gibbon Fairground",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["anims"] = {
        ["double_hold"] = "Gibbon2025GibbonBeingHeldDouble",
        ["eating"] = "Gibbon2025GibbonEat",
        ["hold"] = "Gibbon2025GibbonBeingHeldSingle",
        ["idle"] = "Gibbon2025OfficerGibbonIdle",
        ["running"] = "Gibbon2025OfficerGibbonRun",
        ["sit"] = "Gibbon2025GibbonSit",
        ["sleep"] = "Gibbon2025GibbonSleep"
    },
    ["tricks"] = {
        { "Sit", "Gibbon2025GibbonSit" },
        { "Joyful", "Gibbon2025GibbonJoyful" },
        { "Beg", "Gibbon2025GibbonBeg" },
        { "Jump", "Gibbon2025GibbonJump" },
        { "Trick 1", "Gibbon2025OfficerGibbonTrick1" },
        { "Trick 2", "Gibbon2025GibbonTrick2" }
    },
    ["neon_parts"] = {
        ["PoliceLeftArm3_Geo"] = Color3.fromRGB(14, 127, 188),
        ["PoliceShirt2_Geo"] = Color3.fromRGB(36, 85, 190),
        ["PoliceShirt4_Geo"] = Color3.fromRGB(14, 127, 188),
        ["PoliceShirt_Geo"] = Color3.fromRGB(36, 85, 190),
        ["PoliceRightArm3_Geo"] = Color3.fromRGB(14, 127, 188),
        ["RightArm2_Geo"] = Color3.fromRGB(14, 127, 188),
        ["LeftArm2_Geo"] = Color3.fromRGB(14, 127, 188),
        ["FrontLeftFoot_Geo"] = Color3.fromRGB(36, 85, 190),
        ["FrontRightFoot_Geo"] = Color3.fromRGB(36, 85, 190)
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["pre_equipped_removable_accessories"] = { "gibbon_2025_police_cap" }
}
v2.gibbon_2025_officer_gibbon = v6
local v7 = {
    ["name"] = "Hero Gibbon",
    ["image"] = "rbxassetid://123647431892215",
    ["model"] = "Gibbon2025HeroGibbon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Gibbon Fairground",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["anims"] = {
        ["double_hold"] = "Gibbon2025GibbonBeingHeldDouble",
        ["eating"] = "Gibbon2025GibbonEat",
        ["hold"] = "Gibbon2025GibbonBeingHeldSingle",
        ["idle"] = "Gibbon2025HeroGibbonIdle",
        ["running"] = "Gibbon2025HeroGibbonRun",
        ["sit"] = "Gibbon2025GibbonSit",
        ["sleep"] = "Gibbon2025GibbonCapeSleep"
    },
    ["tricks"] = {
        { "Sit", "Gibbon2025GibbonSit" },
        { "Joyful", "Gibbon2025GibbonJoyful" },
        { "Beg", "Gibbon2025GibbonBeg" },
        { "Jump", "Gibbon2025HeroGibbonJump" },
        { "Trick 1", "Gibbon2025HeroGibbonTrick1" },
        { "Trick 2", "Gibbon2025HeroGibbonTrick2" }
    },
    ["neon_parts"] = {
        ["HeroTorso2_Geo"] = Color3.fromRGB(209, 122, 0),
        ["HeroLeftShoulder_Geo"] = Color3.fromRGB(209, 122, 0),
        ["Torso3_Geo"] = Color3.fromRGB(209, 122, 0),
        ["HeroRightShoulder_Geo"] = Color3.fromRGB(209, 122, 0),
        ["FrontLeftFoot_Geo"] = Color3.fromRGB(209, 122, 0),
        ["FrontRightFoot_Geo"] = Color3.fromRGB(209, 122, 0),
        ["RightArm2_Geo"] = Color3.fromRGB(209, 122, 0),
        ["LeftArm2_Geo"] = Color3.fromRGB(209, 122, 0)
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["pre_equipped_removable_accessories"] = { "gibbon_2025_super_hero_hair" },
    ["already_has_flying_wings"] = true,
    ["eye_transparency"] = 1
}
v2.gibbon_2025_hero_gibbon = v7
local v8 = {
    ["name"] = "Influencer Gibbon",
    ["image"] = "rbxassetid://118278167134251",
    ["model"] = "Gibbon2025InfluencerGibbon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Gibbon Fairground",
        ["origin_items"] = { "gibbon_2025_standard_box", "gibbon_2025_premium_box" },
        ["year"] = 2025
    },
    ["anims"] = {
        ["double_hold"] = "Gibbon2025GibbonBeingHeldDouble",
        ["eating"] = "Gibbon2025GibbonEat",
        ["hold"] = "Gibbon2025GibbonBeingHeldSingle",
        ["idle"] = "Gibbon2025InfluencerGibbonIdle",
        ["running"] = "Gibbon2025InfluencerGibbonRun",
        ["sit"] = "Gibbon2025InfluencerGibbonSit",
        ["sleep"] = "Gibbon2025InfluencerGibbonSleep"
    },
    ["tricks"] = {
        { "Sit", "Gibbon2025InfluencerGibbonSit" },
        { "Joyful", "Gibbon2025GibbonJoyful" },
        { "Beg", "Gibbon2025GibbonBeg" },
        { "Jump", "Gibbon2025GibbonJump" },
        { "Trick 1", "Gibbon2025InfluencerGibbonTrick1" },
        { "Trick 2", "Gibbon2025GibbonTrick1" }
    },
    ["neon_parts"] = {
        ["InfluencerDress_Geo"] = Color3.fromRGB(142, 102, 190),
        ["InfluencerPhone2_Geo"] = Color3.fromRGB(98, 129, 186),
        ["InfluencerDress2_Geo"] = Color3.fromRGB(142, 102, 190),
        ["RightArm2_Geo"] = Color3.fromRGB(142, 102, 190),
        ["LeftArm2_Geo"] = Color3.fromRGB(142, 102, 190)
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["pre_equipped_removable_accessories"] = { "gibbon_2025_influencer_hair", "gibbon_2025_mobile_phone" },
    ["baked_in_accessory_parts"] = {
        ["gibbon_2025_influencer_hair"] = {
            "InfluencerBack_Geo",
            "InfluencerHair_Geo",
            "InfluencerL_Geo",
            "InfluencerR_Geo",
            "InfluencerSunglasses2_Geo",
            "InfluencerSunglasses_Geo"
        }
    }
}
v2.gibbon_2025_influencer_gibbon = v8
local v9 = {
    ["name"] = "Ringmaster Gibbon",
    ["image"] = "rbxassetid://114806716799554",
    ["model"] = "Gibbon2025RingmasterGibbon",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Gibbon Fairground",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["anims"] = {
        ["double_hold"] = "Gibbon2025GibbonBeingHeldDouble",
        ["eating"] = "Gibbon2025GibbonEat",
        ["hold"] = "Gibbon2025GibbonBeingHeldSingle",
        ["idle"] = "Gibbon2025RingmasterGibbonIdle",
        ["running"] = "Gibbon2025RingmasterGibbonRun",
        ["sit"] = "Gibbon2025GibbonSit",
        ["sleep"] = "Gibbon2025RingmasterGibbonSleep"
    },
    ["tricks"] = {
        { "Sit", "Gibbon2025GibbonSit" },
        { "Joyful", "Gibbon2025GibbonJoyful" },
        { "Beg", "Gibbon2025GibbonBeg" },
        { "Jump", "Gibbon2025GibbonJump" },
        { "Trick 1", "Gibbon2025RingmasterGibbonTrick1" },
        { "Trick 2", "Gibbon2025GibbonTrick2" }
    },
    ["neon_parts"] = {
        ["RingMasterJacket2_Geo"] = Color3.fromRGB(191, 173, 100),
        ["RingMasterLeftArm4_Geo"] = Color3.fromRGB(191, 173, 100),
        ["RingMasterRightArm4_Geo"] = Color3.fromRGB(191, 173, 100),
        ["RingMasterJacket3_Geo"] = Color3.fromRGB(191, 173, 100),
        ["Crystal_Geo"] = Color3.fromRGB(109, 186, 181)
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["pre_equipped_removable_accessories"] = { "gibbon_2025_fancy_top_hat" }
}
v2.gibbon_2025_ringmaster_gibbon = v9
return v1(v2)