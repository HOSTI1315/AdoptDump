--// ReplicatedStorage.SharedModules.ContentPacks.IceDimension2025.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Snowy Mammoth",
    ["model"] = "IceDimension2025SnowyMammoth",
    ["origin_entry"] = {
        ["origin"] = "Ice Dimension",
        ["origin_items"] = { "ice_dimension_2025_ice_soup_bait" },
        ["year"] = 2025
    },
    ["image"] = "rbxassetid://82833859118891",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["sleep"] = "IceDimension2025SnowyMammothSleep",
        ["running"] = "IceDimension2025SnowyMammothRun",
        ["idle"] = "IceDimension2025SnowyMammothIdle",
        ["eating"] = "IceDimension2025SnowyMammothEat",
        ["sit"] = "IceDimension2025SnowyMammothSit",
        ["flying"] = "IceDimension2025SnowyMammothRun",
        ["hold"] = "IceDimension2025SnowyMammothBeingHeldSingle",
        ["double_hold"] = "IceDimension2025SnowyMammothBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "IceDimension2025SnowyMammothSit" },
        { "Joyful", "IceDimension2025SnowyMammothJoyful" },
        { "Beg", "IceDimension2025SnowyMammothBeg" },
        { "Jump", "IceDimension2025SnowyMammothJump" },
        { "Trick 1", "IceDimension2025SnowyMammothTrick1" },
        { "Trick 2", "IceDimension2025SnowyMammothTrick2" }
    },
    ["neon_parts"] = {
        ["FrontLeftFoot"] = Color3.fromRGB(121, 176, 185),
        ["BackLeftFoot"] = Color3.fromRGB(121, 176, 185),
        ["FrontRightFoot"] = Color3.fromRGB(121, 176, 185),
        ["LeftEar2"] = Color3.fromRGB(11, 115, 194),
        ["Tusks"] = Color3.fromRGB(11, 115, 194),
        ["RightEar2"] = Color3.fromRGB(11, 115, 194),
        ["Torso3"] = Color3.fromRGB(11, 115, 194),
        ["BackRightFoot"] = Color3.fromRGB(121, 176, 185),
        ["Tusks3"] = Color3.fromRGB(163, 162, 165)
    }
}
v2.ice_dimension_2025_snowy_mammoth = v3
local v4 = {
    ["name"] = "Icy Porcupine",
    ["model"] = "IceDimension2025IcyPorcupine",
    ["origin_entry"] = {
        ["origin"] = "Ice Dimension",
        ["origin_items"] = { "ice_dimension_2025_ice_soup_bait" },
        ["year"] = 2025
    },
    ["image"] = "rbxassetid://104845330408668",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["sleep"] = "IceDimension2025IcyPorcupineSleep",
        ["running"] = "IceDimension2025IcyPorcupineRun",
        ["idle"] = "IceDimension2025IcyPorcupineIdle",
        ["eating"] = "IceDimension2025IcyPorcupineEat",
        ["sit"] = "IceDimension2025IcyPorcupineSit",
        ["flying"] = "IceDimension2025IcyPorcupineRun",
        ["hold"] = "IceDimension2025IcyPorcupineBeingHeldSingle",
        ["double_hold"] = "IceDimension2025IcyPorcupineBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "IceDimension2025IcyPorcupineSit" },
        { "Joyful", "IceDimension2025IcyPorcupineJoyful" },
        { "Beg", "IceDimension2025IcyPorcupineBeg" },
        { "Jump", "IceDimension2025IcyPorcupineJump" },
        { "Trick 1", "IceDimension2025IcyPorcupineTrick1" },
        { "Trick 2", "IceDimension2025IcyPorcupineTrick2" }
    },
    ["neon_parts"] = {
        ["Nose"] = Color3.fromRGB(48, 94, 205),
        ["LeftBackFoot"] = Color3.fromRGB(48, 94, 205),
        ["LeftFrontFoot"] = Color3.fromRGB(48, 94, 205),
        ["RightFrontFoot"] = Color3.fromRGB(48, 94, 205),
        ["RightBackFoot"] = Color3.fromRGB(48, 94, 205),
        ["Spikes2"] = Color3.fromRGB(109, 134, 213)
    }
}
v2.ice_dimension_2025_icy_porcupine = v4
local v5 = {
    ["name"] = "Frozen Penguin",
    ["model"] = "IceDimension2025ChillyPenguin",
    ["origin_entry"] = {
        ["origin"] = "Ice Dimension",
        ["origin_items"] = { "ice_dimension_2025_ice_soup_bait" },
        ["year"] = 2025
    },
    ["image"] = "rbxassetid://119664699815373",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["sleep"] = "IceDimension2025ChillyPenguinSleep",
        ["running"] = "IceDimension2025ChillyPenguinRun",
        ["idle"] = "IceDimension2025ChillyPenguinIdle",
        ["eating"] = "IceDimension2025ChillyPenguinEat",
        ["sit"] = "IceDimension2025ChillyPenguinSit",
        ["flying"] = "IceDimension2025ChillyPenguinRun",
        ["hold"] = "IceDimension2025ChillyPenguinBeingHeldSingle",
        ["double_hold"] = "IceDimension2025ChillyPenguinBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "IceDimension2025ChillyPenguinSit" },
        { "Joyful", "IceDimension2025ChillyPenguinJoyful" },
        { "Beg", "IceDimension2025ChillyPenguinBeg" },
        { "Jump", "IceDimension2025ChillyPenguinJump" },
        { "Trick 1", "IceDimension2025ChillyPenguinTrick1" },
        { "Trick 2", "IceDimension2025ChillyPenguinTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(119, 153, 184),
        ["TorsoIce"] = Color3.fromRGB(87, 103, 186),
        ["IceShards2"] = Color3.fromRGB(66, 78, 189),
        ["BeakIce"] = Color3.fromRGB(103, 144, 184),
        ["Torso2"] = Color3.fromRGB(87, 103, 186),
        ["WingShards"] = Color3.fromRGB(139, 165, 184),
        ["WingShards2"] = Color3.fromRGB(66, 78, 189),
        ["LeftFoot"] = Color3.fromRGB(119, 153, 184),
        ["RightFoot"] = Color3.fromRGB(119, 153, 184),
        ["IceShards"] = Color3.fromRGB(139, 165, 184)
    }
}
v2.ice_dimension_2025_chilly_penguin = v5
local v6 = {
    ["name"] = "Subzero Scorpion",
    ["model"] = "IceDimension2025SubzeroScorpion",
    ["origin_entry"] = {
        ["origin"] = "Ice Dimension",
        ["origin_items"] = { "ice_dimension_2025_subzero_popsicle_bait" },
        ["year"] = 2025
    },
    ["image"] = "rbxassetid://120631772928905",
    ["rarity"] = "rare",
    ["anims"] = {
        ["sleep"] = "IceDimension2025SubzeroScorpionSleep",
        ["running"] = "IceDimension2025SubzeroScorpionRun",
        ["idle"] = "IceDimension2025SubzeroScorpionIdle",
        ["eating"] = "IceDimension2025SubzeroScorpionEat",
        ["sit"] = "IceDimension2025SubzeroScorpionSit",
        ["flying"] = "IceDimension2025SubzeroScorpionRun",
        ["hold"] = "IceDimension2025SubzeroScorpionBeingHeldSingle",
        ["double_hold"] = "IceDimension2025SubzeroScorpionBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "IceDimension2025SubzeroScorpionSit" },
        { "Joyful", "IceDimension2025SubzeroScorpionJoyful" },
        { "Beg", "IceDimension2025SubzeroScorpionBeg" },
        { "Jump", "IceDimension2025SubzeroScorpionJump" },
        { "Trick 1", "IceDimension2025SubzeroScorpionTrick1" },
        { "Trick 2", "IceDimension2025SubzeroScorpionTrick2" }
    },
    ["neon_parts"] = {
        ["RightClaw1"] = Color3.fromRGB(94, 182, 223),
        ["LeftClaw1"] = Color3.fromRGB(94, 182, 223),
        ["Torso2"] = Color3.fromRGB(30, 108, 163),
        ["Tail3"] = Color3.fromRGB(94, 182, 223),
        ["Pinsers"] = Color3.fromRGB(94, 182, 223),
        ["Tail2"] = Color3.fromRGB(83, 161, 197),
        ["Tail"] = Color3.fromRGB(49, 119, 166)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.ice_dimension_2025_subzero_scorpion = v6
local v7 = {
    ["name"] = "Shiver Wolf",
    ["model"] = "IceDimension2025ShiverWolf",
    ["origin_entry"] = {
        ["origin"] = "Ice Dimension",
        ["origin_items"] = { "ice_dimension_2025_shiver_cone_bait" },
        ["year"] = 2025
    },
    ["image"] = "rbxassetid://118691035196137",
    ["rarity"] = "rare",
    ["anims"] = {
        ["sleep"] = "IceDimension2025ShiverWolfSleep",
        ["running"] = "IceDimension2025ShiverWolfRun",
        ["idle"] = "IceDimension2025ShiverWolfIdle",
        ["eating"] = "IceDimension2025ShiverWolfEat",
        ["sit"] = "IceDimension2025ShiverWolfSit",
        ["flying"] = "IceDimension2025ShiverWolfRun",
        ["hold"] = "IceDimension2025ShiverWolfBeingHeldSingle",
        ["double_hold"] = "IceDimension2025ShiverWolfBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "IceDimension2025ShiverWolfSit" },
        { "Joyful", "IceDimension2025ShiverWolfJoyful" },
        { "Beg", "IceDimension2025ShiverWolfBeg" },
        { "Jump", "IceDimension2025ShiverWolfJump" },
        { "Trick 1", "IceDimension2025ShiverWolfTrick1" },
        { "Trick 2", "IceDimension2025ShiverWolfTrick2" }
    },
    ["neon_parts"] = {
        ["FrontRightFoot"] = Color3.fromRGB(84, 107, 188),
        ["FrontRightFoot2"] = Color3.fromRGB(146, 203, 192),
        ["Head1"] = Color3.fromRGB(146, 203, 192),
        ["Head3"] = Color3.fromRGB(84, 107, 188),
        ["Head6"] = Color3.fromRGB(84, 107, 188),
        ["Head"] = Color3.fromRGB(120, 185, 255),
        ["Head10"] = Color3.fromRGB(120, 185, 255),
        ["Tail2"] = Color3.fromRGB(84, 107, 188),
        ["BackLeftFoot"] = Color3.fromRGB(84, 107, 188),
        ["BackLeftFoot2"] = Color3.fromRGB(146, 203, 192),
        ["BackRightFoot"] = Color3.fromRGB(84, 107, 188),
        ["BackRightFoot2"] = Color3.fromRGB(146, 203, 192),
        ["Torso4"] = Color3.fromRGB(84, 107, 188),
        ["Torso6"] = Color3.fromRGB(120, 185, 255),
        ["Torso5"] = Color3.fromRGB(120, 185, 255),
        ["LeftEar2"] = Color3.fromRGB(84, 107, 188),
        ["LeftEar3"] = Color3.fromRGB(120, 185, 255),
        ["RightEar2"] = Color3.fromRGB(84, 107, 188),
        ["RightEar3"] = Color3.fromRGB(146, 203, 192),
        ["FrontLeftFoot"] = Color3.fromRGB(84, 107, 188),
        ["FrontLeftFoot2"] = Color3.fromRGB(146, 203, 192),
        ["Tail3"] = Color3.fromRGB(84, 107, 188)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.ice_dimension_2025_shiver_wolf = v7
local v8 = {
    ["name"] = "Frostbite Bear",
    ["model"] = "IceDimension2025FrostbiteBear",
    ["origin_entry"] = {
        ["origin"] = "Ice Dimension",
        ["origin_items"] = { "ice_dimension_2025_ice_soup_bait", "ice_dimension_2025_shiver_cone_bait", "ice_dimension_2025_subzero_popsicle_bait" },
        ["year"] = 2025
    },
    ["image"] = "rbxassetid://70953296065239",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["sleep"] = "IceDimension2025FrostbiteBearSleep",
        ["running"] = "IceDimension2025FrostbiteBearRun",
        ["idle"] = "IceDimension2025FrostbiteBearIdle",
        ["eating"] = "IceDimension2025FrostbiteBearEat",
        ["sit"] = "IceDimension2025FrostbiteBearSit",
        ["flying"] = "IceDimension2025FrostbiteBearRun",
        ["hold"] = "IceDimension2025FrostbiteBearBeingHeldSingle",
        ["double_hold"] = "IceDimension2025FrostbiteBearBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "IceDimension2025FrostbiteBearSit" },
        { "Joyful", "IceDimension2025FrostbiteBearJoyful" },
        { "Beg", "IceDimension2025FrostbiteBearBeg" },
        { "Jump", "IceDimension2025FrostbiteBearJump" },
        { "Trick 1", "IceDimension2025FrostbiteBearTrick1" },
        { "Trick 2", "IceDimension2025FrostbiteBearTrick2" }
    }
}
local v9 = {
    ["Torso3"] = {
        ["Color"] = Color3.fromRGB(48, 183, 255),
        ["Transparency"] = 0
    },
    ["Torso"] = {
        ["Transparency"] = 1
    },
    ["Eyes"] = Color3.fromRGB(26, 69, 189),
    ["Torso5"] = {
        ["Transparency"] = 1
    },
    ["Torso6"] = {
        ["Color"] = Color3.fromRGB(48, 183, 255),
        ["Transparency"] = 0
    },
    ["Head3"] = {
        ["Color"] = Color3.fromRGB(48, 183, 255),
        ["Transparency"] = 0
    }
}
v8.neon_parts = v9
v2.ice_dimension_2025_frostbite_bear = v8
local v10 = {
    ["name"] = "Tri-horned Treehopper",
    ["model"] = "IceDimension2025TrihornedTreehopper",
    ["image"] = "rbxassetid://123288277753363",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "UGC Refresh",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["maximum_fly_anim_speed"] = 0.6,
    ["minimum_fly_anim_speed"] = 0.6,
    ["maximum_mounted_anim_speed"] = 0.6,
    ["minimum_mounted_anim_speed"] = 0.6,
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes_Geo" },
    ["anims"] = {
        ["sleep"] = "IceDimension2025TrihornedTreehopperSleep",
        ["running"] = "IceDimension2025TrihornedTreehopperRun",
        ["idle"] = "IceDimension2025TrihornedTreehopperIdle",
        ["eating"] = "IceDimension2025TrihornedTreehopperEat",
        ["sit"] = "IceDimension2025TrihornedTreehopperSit",
        ["flying"] = "IceDimension2025TrihornedTreehopperRun",
        ["hold"] = "IceDimension2025TrihornedTreehopperBeingHeldSingle",
        ["double_hold"] = "IceDimension2025TrihornedTreehopperBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "IceDimension2025TrihornedTreehopperSit" },
        { "Joyful", "IceDimension2025TrihornedTreehopperJoyful" },
        { "Beg", "IceDimension2025TrihornedTreehopperBeg" },
        { "Jump", "IceDimension2025TrihornedTreehopperJump" },
        { "Trick 1", "IceDimension2025TrihornedTreehopperTrick1" },
        { "Trick 2", "IceDimension2025TrihornedTreehopperTrick2" }
    },
    ["neon_parts"] = {
        ["RightWing_Geo"] = Color3.fromRGB(190, 140, 99),
        ["LeftWing_Geo"] = Color3.fromRGB(190, 140, 99),
        ["Butt_Geo"] = Color3.fromRGB(190, 140, 99),
        ["Torso2_Geo"] = Color3.fromRGB(190, 140, 99),
        ["Head2_Geo"] = Color3.fromRGB(190, 140, 99),
        ["Head3_Geo"] = Color3.fromRGB(190, 140, 99)
    }
}
v2.ice_dimension_2025_trihorned_treehopper = v10
return v1(v2)