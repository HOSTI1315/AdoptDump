--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.InventorySubDB.Pets (ModuleScript)

local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.ClientDB.Inventory.EntryHelper)
require(v1.SharedPackages.Sift)
local v3 = v2.pets
local v4 = {}
local v5 = {
    ["name"] = "Sakura Spirit",
    ["model"] = "Spring2025SakuraSpirit",
    ["image"] = "rbxassetid://135649428081307",
    ["rarity"] = "legendary",
    ["already_has_flying_wings"] = true,
    ["anims"] = {
        ["sleep"] = "Spring2025SakuraSpiritSleep",
        ["running"] = "Spring2025SakuraSpiritRun",
        ["idle"] = "Spring2025SakuraSpiritIdle",
        ["eating"] = "Spring2025SakuraSpiritEat",
        ["sit"] = "Spring2025SakuraSpiritSit",
        ["flying"] = "Spring2025SakuraSpiritRun",
        ["hold"] = "Spring2025SakuraSpiritBeingHeldSingle",
        ["double_hold"] = "Spring2025SakuraSpiritBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Spring2025SakuraSpiritSit" },
        { "Joyful", "Spring2025SakuraSpiritJoyful" },
        { "Beg", "Spring2025SakuraSpiritBeg" },
        { "Jump", "Spring2025SakuraSpiritJump" },
        { "Trick 1", "Spring2025SakuraSpiritTrick1" },
        { "Trick 2", "Spring2025SakuraSpiritTrick2" }
    },
    ["neon_parts"] = {
        ["Head4_Geo"] = Color3.fromRGB(197, 136, 52),
        ["Head7_Geo"] = Color3.fromRGB(142, 185, 186),
        ["Head2_Geo"] = Color3.fromRGB(142, 185, 186),
        ["Head5_Geo"] = Color3.fromRGB(189, 97, 51),
        ["Head6_Geo"] = Color3.fromRGB(107, 50, 70),
        ["Head3_Geo"] = Color3.fromRGB(141, 66, 92),
        ["BackRightFoot3_Geo"] = Color3.fromRGB(110, 113, 117),
        ["FrontLeftFoot4_Geo"] = Color3.fromRGB(110, 113, 117),
        ["Torso5_Geo"] = Color3.fromRGB(142, 185, 186),
        ["FrontLeftFoot1_Geo"] = Color3.fromRGB(124, 118, 129),
        ["BackLeftFoot1_Geo"] = Color3.fromRGB(124, 118, 129),
        ["FrontRightFoot3_Geo"] = Color3.fromRGB(110, 113, 117),
        ["FrontRightFoot1_Geo"] = Color3.fromRGB(124, 118, 129),
        ["BackRightFoot1_Geo"] = Color3.fromRGB(124, 118, 129),
        ["BackLeftFoot4_Geo"] = Color3.fromRGB(110, 113, 117),
        ["Torso2_Geo"] = Color3.fromRGB(189, 97, 51),
        ["Torso3_Geo"] = Color3.fromRGB(142, 185, 186)
    },
    ["origin_entry"] = {
        ["origin"] = "Spring",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["eyes"] = { "Eyes_Geo" },
    ["interaction_part_name"] = "InteractionPart",
    ["stabilizer_part_override"] = "Head",
    ["maximum_run_anim_speed"] = 0.85,
    ["minimum_fly_anim_speed"] = 0.85,
    ["maximum_fly_anim_speed"] = 0.85,
    ["generate_npc_furniture_on_runtime"] = true,
    ["max_ride_scale"] = 1.2,
    ["mounted_animation_scale_limit"] = 1
}
v4.spring_2025_sakura_spirit = v5
local v6 = {
    ["name"] = "Kage Crow",
    ["model"] = "Spring2025KageCrow",
    ["image"] = "rbxassetid://129021417712364",
    ["rarity"] = "ultra_rare",
    ["already_has_flying_wings"] = true,
    ["anims"] = {
        ["sleep"] = "Spring2025KageCrowSleep",
        ["running"] = "Spring2025KageCrowRun",
        ["idle"] = "Spring2025KageCrowIdle",
        ["eating"] = "Spring2025KageCrowEat",
        ["sit"] = "Spring2025KageCrowSit",
        ["flying"] = "Spring2025KageCrowRun",
        ["hold"] = "Spring2025KageCrowBeingHeldSingle",
        ["double_hold"] = "Spring2025KageCrowBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Spring2025KageCrowSit" },
        { "Joyful", "Spring2025KageCrowJoyful" },
        { "Beg", "Spring2025KageCrowBeg" },
        { "Jump", "Spring2025KageCrowJump" },
        { "Trick 1", "Spring2025KageCrowTrick1" },
        { "Trick 2", "Spring2025KageCrowTrick2" }
    },
    ["neon_parts"] = {
        ["LeftWing2_Geo"] = Color3.fromRGB(137, 70, 173),
        ["RightFoot_Geo"] = Color3.fromRGB(204, 103, 255),
        ["RightWing2_Geo"] = Color3.fromRGB(137, 70, 173),
        ["LeftWing_Geo"] = Color3.fromRGB(204, 103, 255),
        ["Tail_Geo"] = Color3.fromRGB(204, 103, 255),
        ["Hair2_Geo"] = Color3.fromRGB(137, 70, 173),
        ["FrontRightFoot2_Geo"] = Color3.fromRGB(137, 70, 173),
        ["RightWing_Geo"] = Color3.fromRGB(204, 103, 255),
        ["FrontLeftFoot2_Geo"] = Color3.fromRGB(137, 70, 173),
        ["LeftFoot_Geo"] = Color3.fromRGB(204, 103, 255),
        ["Tail2_Geo"] = Color3.fromRGB(137, 70, 173),
        ["Hair_Geo"] = Color3.fromRGB(204, 103, 255),
        ["Torso2_Geo"] = Color3.fromRGB(204, 103, 255),
        ["Torso4_Geo"] = Color3.fromRGB(204, 103, 255)
    },
    ["cost"] = 75000,
    ["currency_id"] = "cherry_blossoms_2025",
    ["origin_entry"] = {
        ["origin"] = "Spring",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v4.spring_2025_kage_crow = v6
local v7 = {
    ["name"] = "Bakeneko",
    ["model"] = "Spring2025Bakeneko",
    ["image"] = "rbxassetid://110856597065248",
    ["rarity"] = "common",
    ["anims"] = {
        ["sleep"] = "Spring2025BakenekoSleep",
        ["running"] = "Spring2025BakenekoRun",
        ["idle"] = "Spring2025BakenekoIdle",
        ["eating"] = "Spring2025BakenekoEat",
        ["sit"] = "Spring2025BakenekoSit",
        ["flying"] = "Spring2025BakenekoRun",
        ["hold"] = "Spring2025BakenekoBeingHeldSingle",
        ["double_hold"] = "Spring2025BakenekoBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Spring2025BakenekoSit" },
        { "Joyful", "Spring2025BakenekoJoyful" },
        { "Beg", "Spring2025BakenekoBeg" },
        { "Jump", "Spring2025BakenekoJump" },
        { "Trick 1", "Spring2025BakenekoTrick1" },
        { "Trick 2", "Spring2025BakenekoTrick2" }
    },
    ["neon_parts"] = {
        ["Symbol_Geo"] = Color3.fromRGB(64, 73, 86),
        ["Torso6_Geo"] = Color3.fromRGB(134, 129, 115),
        ["Torso3_Geo"] = Color3.fromRGB(191, 155, 132),
        ["Head6_Geo"] = Color3.fromRGB(191, 155, 132),
        ["Head4_Geo"] = Color3.fromRGB(165, 18, 18),
        ["Head7_Geo"] = Color3.fromRGB(134, 129, 115),
        ["Head9_Geo"] = Color3.fromRGB(102, 11, 11),
        ["Tail3_Geo"] = Color3.fromRGB(134, 129, 115),
        ["BackRightFoot_Geo"] = Color3.fromRGB(191, 155, 132),
        ["FrontRightFoot_Geo"] = Color3.fromRGB(191, 155, 132),
        ["BackRightFoot2_Geo"] = Color3.fromRGB(181, 146, 125),
        ["BackLeftFoot2_Geo"] = Color3.fromRGB(181, 146, 125),
        ["FrontLeftFoot_Geo"] = Color3.fromRGB(191, 155, 132),
        ["Tail_Geo"] = Color3.fromRGB(191, 155, 132),
        ["FrontLeftFoot2_Geo"] = Color3.fromRGB(181, 146, 125),
        ["FrontRightFoot2_Geo"] = Color3.fromRGB(181, 146, 125),
        ["BackLeftFoot_Geo"] = Color3.fromRGB(191, 155, 132)
    },
    ["minimum_run_anim_speed"] = 0.85,
    ["maximum_run_anim_speed"] = 0.85,
    ["cost"] = 3650,
    ["currency_id"] = "cherry_blossoms_2025",
    ["origin_entry"] = {
        ["origin"] = "Spring",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v4.spring_2025_bakeneko = v7
local v8 = {
    ["name"] = "Mirai Moth",
    ["model"] = "Spring2025MiraiMoth",
    ["image"] = "rbxassetid://88389663444803",
    ["rarity"] = "ultra_rare",
    ["already_has_flying_wings"] = true,
    ["anims"] = {
        ["sleep"] = "Spring2025MiraiMothSleep",
        ["running"] = "Spring2025MiraiMothRun",
        ["idle"] = "Spring2025MiraiMothIdle",
        ["eating"] = "Spring2025MiraiMothEat",
        ["sit"] = "Spring2025MiraiMothSit",
        ["flying"] = "Spring2025MiraiMothRun",
        ["hold"] = "Spring2025MiraiMothBeingHeldSingle",
        ["double_hold"] = "Spring2025MiraiMothBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Spring2025MiraiMothSit" },
        { "Joyful", "Spring2025MiraiMothJoyful" },
        { "Beg", "Spring2025MiraiMothBeg" },
        { "Jump", "Spring2025MiraiMothJump" },
        { "Trick 1", "Spring2025MiraiMothTrick1" },
        { "Trick 2", "Spring2025MiraiMothTrick2" }
    },
    ["neon_parts"] = {
        ["RightAntenna2_Geo"] = Color3.fromRGB(255, 143, 14),
        ["LeftAntenna2_Geo"] = Color3.fromRGB(255, 143, 14),
        ["LeftWing4_Geo"] = Color3.fromRGB(255, 143, 14),
        ["LeftWing2_Geo"] = Color3.fromRGB(190, 135, 7),
        ["RightWing4_Geo"] = Color3.fromRGB(255, 143, 14),
        ["RightWing2_Geo"] = Color3.fromRGB(190, 135, 7),
        ["Head4_Geo"] = Color3.fromRGB(255, 143, 14)
    },
    ["cost"] = 62000,
    ["currency_id"] = "cherry_blossoms_2025",
    ["maximum_run_anim_speed"] = 0.85,
    ["minimum_fly_anim_speed"] = 0.85,
    ["maximum_fly_anim_speed"] = 0.85,
    ["origin_entry"] = {
        ["origin"] = "Spring",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v4.spring_2025_mirai_moth = v8
local v9 = {
    ["name"] = "Kappakid",
    ["model"] = "Spring2025Kappakid",
    ["image"] = "rbxassetid://100909868233186",
    ["rarity"] = "rare",
    ["anims"] = {
        ["sleep"] = "Spring2025KappakidSleep",
        ["running"] = "Spring2025KappakidRun",
        ["idle"] = "Spring2025KappakidIdle",
        ["eating"] = "Spring2025KappakidEat",
        ["sit"] = "Spring2025KappakidSit",
        ["flying"] = "Spring2025KappakidRun",
        ["hold"] = "Spring2025KappakidBeingHeldSingle",
        ["double_hold"] = "Spring2025KappakidBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Spring2025KappakidSit" },
        { "Joyful", "Spring2025KappakidJoyful" },
        { "Beg", "Spring2025KappakidBeg" },
        { "Jump", "Spring2025KappakidJump" },
        { "Trick 1", "Spring2025KappakidTrick1" },
        { "Trick 2", "Spring2025KappakidTrick2" }
    },
    ["neon_parts"] = {
        ["Head5_Geo"] = Color3.fromRGB(185, 92, 30),
        ["Head6_Geo"] = Color3.fromRGB(191, 95, 31),
        ["Torso2_Geo"] = Color3.fromRGB(185, 92, 30),
        ["Torso6_Geo"] = Color3.fromRGB(191, 95, 31),
        ["Head10_Geo"] = Color3.fromRGB(191, 95, 31)
    },
    ["origin_entry"] = {
        ["origin"] = "Spring",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["cost"] = 43000,
    ["currency_id"] = "cherry_blossoms_2025",
    ["generate_npc_furniture_on_runtime"] = true
}
v4.spring_2025_kappakid = v9
local v10 = {
    ["name"] = "Super Saru",
    ["model"] = "Spring2025SuperSaru",
    ["image"] = "rbxassetid://84310117840681",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["sleep"] = "Spring2025SuperSaruSleep",
        ["running"] = "Spring2025SuperSaruRun",
        ["idle"] = "Spring2025SuperSaruIdle",
        ["eating"] = "Spring2025SuperSaruEat",
        ["sit"] = "Spring2025SuperSaruSit",
        ["flying"] = "Spring2025SuperSaruRun",
        ["hold"] = "Spring2025SuperSaruBeingHeldSingle",
        ["double_hold"] = "Spring2025SuperSaruBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Spring2025SuperSaruSit" },
        { "Joyful", "Spring2025SuperSaruJoyful" },
        { "Beg", "Spring2025SuperSaruBeg" },
        { "Jump", "Spring2025SuperSaruJump" },
        { "Trick 1", "Spring2025SuperSaruTrick1" },
        { "Trick 2", "Spring2025SuperSaruTrick2" }
    },
    ["neon_parts"] = {
        ["Hair_Geo"] = Color3.fromRGB(88, 127, 189),
        ["Hair2_Geo"] = Color3.fromRGB(85, 122, 182),
        ["RightArm3_Geo"] = Color3.fromRGB(88, 127, 189),
        ["LeftArm3_Geo"] = Color3.fromRGB(88, 127, 189),
        ["LeftFoot_Geo"] = Color3.fromRGB(88, 127, 189),
        ["RightFoot_Geo"] = Color3.fromRGB(88, 127, 189)
    },
    ["origin_entry"] = {
        ["origin"] = "Spring",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["cost"] = 135000,
    ["currency_id"] = "cherry_blossoms_2025",
    ["generate_npc_furniture_on_runtime"] = true
}
v4.spring_2025_super_saru = v10
local v11 = {
    ["name"] = "Scorching Kaijunior",
    ["model"] = "Spring2025ScorchingKaijunior",
    ["image"] = "rbxassetid://106457467498193",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["sleep"] = "Spring2025KaijuniorSleep",
        ["running"] = "Spring2025KaijuniorRun",
        ["idle"] = "Spring2025KaijuniorIdle",
        ["eating"] = "Spring2025KaijuniorEat",
        ["sit"] = "Spring2025KaijuniorSit",
        ["flying"] = "Spring2025KaijuniorRun",
        ["hold"] = "Spring2025KaijuniorBeingHeldSingle",
        ["double_hold"] = "Spring2025KaijuniorBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Spring2025KaijuniorSit" },
        { "Joyful", "Spring2025KaijuniorJoyful" },
        { "Beg", "Spring2025KaijuniorBeg" },
        { "Jump", "Spring2025KaijuniorJump" },
        { "Trick 1", "Spring2025KaijuniorTrick1" },
        { "Trick 2", "Spring2025ScorchingKaijuniorTrick2" }
    },
    ["neon_parts"] = {
        ["ScorchingTorso_Geo"] = Color3.fromRGB(255, 186, 101),
        ["ScorchingTorso3_Geo"] = Color3.fromRGB(165, 127, 102),
        ["ScorchingHead_Geo"] = Color3.fromRGB(188, 188, 188),
        ["RightHand2_Geo"] = Color3.fromRGB(186, 144, 115),
        ["Eyes_Geo"] = Color3.fromRGB(213, 144, 139),
        ["ScorchingTorso2_Geo"] = Color3.fromRGB(186, 144, 115),
        ["LeftHand2_Geo"] = Color3.fromRGB(186, 144, 115),
        ["Head3_Geo"] = Color3.fromRGB(186, 144, 115),
        ["Head4_Geo"] = Color3.fromRGB(255, 186, 101),
        ["ScorchingSpine_Geo"] = Color3.fromRGB(188, 188, 188),
        ["LeftHand4_Geo"] = Color3.fromRGB(165, 127, 102),
        ["LeftFoot3_Geo"] = Color3.fromRGB(165, 127, 102),
        ["RightHand4_Geo"] = Color3.fromRGB(165, 127, 102),
        ["LeftFoot2_Geo"] = Color3.fromRGB(186, 144, 115),
        ["RightFoot3_Geo"] = Color3.fromRGB(165, 127, 102),
        ["RightFoot2_Geo"] = Color3.fromRGB(186, 144, 115)
    },
    ["origin_entry"] = {
        ["origin"] = "Spring",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true
}
v4.spring_2025_scorching_kaijunior = v11
local v12 = {
    ["name"] = "Primal Kaijunior",
    ["model"] = "Spring2025SpikedKaijunior",
    ["image"] = "rbxassetid://107787284008278",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["sleep"] = "Spring2025KaijuniorSleep",
        ["running"] = "Spring2025KaijuniorRun",
        ["idle"] = "Spring2025KaijuniorIdle",
        ["eating"] = "Spring2025KaijuniorEat",
        ["sit"] = "Spring2025KaijuniorSit",
        ["flying"] = "Spring2025KaijuniorRun",
        ["hold"] = "Spring2025KaijuniorBeingHeldSingle",
        ["double_hold"] = "Spring2025KaijuniorBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Spring2025KaijuniorSit" },
        { "Joyful", "Spring2025KaijuniorJoyful" },
        { "Beg", "Spring2025KaijuniorBeg" },
        { "Jump", "Spring2025KaijuniorJump" },
        { "Trick 1", "Spring2025KaijuniorTrick1" },
        { "Trick 2", "Spring2025SpikedKaijuniorTrick2" }
    },
    ["neon_parts"] = {
        ["SpikedTorso2_Geo"] = Color3.fromRGB(114, 98, 163),
        ["RightFoot2_Geo"] = Color3.fromRGB(142, 129, 194),
        ["Head4_Geo"] = Color3.fromRGB(142, 129, 194),
        ["SpikedHead_Geo"] = Color3.fromRGB(142, 129, 194),
        ["LeftHand4_Geo"] = Color3.fromRGB(114, 98, 163),
        ["LeftFoot2_Geo"] = Color3.fromRGB(142, 129, 194),
        ["SpikedTorso_Geo"] = Color3.fromRGB(142, 129, 194),
        ["SpikedSpine_Geo"] = Color3.fromRGB(142, 129, 194),
        ["RightFoot3_Geo"] = Color3.fromRGB(114, 98, 163),
        ["LeftHand2_Geo"] = Color3.fromRGB(142, 129, 194),
        ["Head5_Geo"] = Color3.fromRGB(114, 98, 163),
        ["SpikedSpine2_Geo"] = Color3.fromRGB(114, 98, 163),
        ["SpikedHead2_Geo"] = Color3.fromRGB(114, 98, 163),
        ["RightHand4_Geo"] = Color3.fromRGB(114, 98, 163),
        ["RightHand2_Geo"] = Color3.fromRGB(142, 129, 194),
        ["LeftFoot3_Geo"] = Color3.fromRGB(114, 98, 163),
        ["Head2_Geo"] = Color3.fromRGB(142, 129, 194)
    },
    ["origin_entry"] = {
        ["origin"] = "Spring",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true
}
v4.spring_2025_spiked_kaijunior = v12
local v13 = {
    ["name"] = "Kaijunior",
    ["model"] = "Spring2025SpottedKaijunior",
    ["image"] = "rbxassetid://92389214029179",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["sleep"] = "Spring2025KaijuniorSleep",
        ["running"] = "Spring2025KaijuniorRun",
        ["idle"] = "Spring2025KaijuniorIdle",
        ["eating"] = "Spring2025KaijuniorEat",
        ["sit"] = "Spring2025KaijuniorSit",
        ["flying"] = "Spring2025KaijuniorRun",
        ["hold"] = "Spring2025KaijuniorBeingHeldSingle",
        ["double_hold"] = "Spring2025KaijuniorBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Spring2025KaijuniorSit" },
        { "Joyful", "Spring2025KaijuniorJoyful" },
        { "Beg", "Spring2025KaijuniorBeg" },
        { "Jump", "Spring2025KaijuniorJump" },
        { "Trick 1", "Spring2025KaijuniorTrick1" },
        { "Trick 2", "Spring2025SpottedKaijuniorTrick2" }
    },
    ["neon_parts"] = {
        ["LeftFoot3_Geo"] = Color3.fromRGB(112, 123, 186),
        ["RightFoot2_Geo"] = Color3.fromRGB(152, 189, 167),
        ["SpottedHead_Geo"] = Color3.fromRGB(152, 189, 167),
        ["Head4_Geo"] = Color3.fromRGB(152, 189, 167),
        ["LeftHand4_Geo"] = Color3.fromRGB(112, 123, 186),
        ["LeftFoot2_Geo"] = Color3.fromRGB(152, 189, 167),
        ["RightFoot3_Geo"] = Color3.fromRGB(112, 123, 186),
        ["SpottedSpine2_Geo"] = Color3.fromRGB(112, 123, 186),
        ["LeftHand2_Geo"] = Color3.fromRGB(152, 189, 167),
        ["Head3_Geo"] = Color3.fromRGB(112, 123, 186),
        ["Head5_Geo"] = Color3.fromRGB(112, 123, 186),
        ["SpottedTorso2_Geo"] = Color3.fromRGB(112, 123, 186),
        ["SpottedTorso_Geo"] = Color3.fromRGB(152, 189, 167),
        ["SpottedSpine_Geo"] = Color3.fromRGB(152, 189, 167),
        ["RightHand4_Geo"] = Color3.fromRGB(112, 123, 186),
        ["RightHand2_Geo"] = Color3.fromRGB(152, 189, 167),
        ["Head2_Geo"] = Color3.fromRGB(152, 189, 167),
        ["SpottedHead2_Geo"] = Color3.fromRGB(112, 123, 186)
    },
    ["origin_entry"] = {
        ["origin"] = "Spring",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true
}
v4.spring_2025_spotted_kaijunior = v13
local v14 = {
    ["name"] = "Toxic Kaijunior",
    ["model"] = "Spring2025ToxicKaijunior",
    ["image"] = "rbxassetid://111642509798043",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["sleep"] = "Spring2025KaijuniorSleep",
        ["running"] = "Spring2025KaijuniorRun",
        ["idle"] = "Spring2025KaijuniorIdle",
        ["eating"] = "Spring2025KaijuniorEat",
        ["sit"] = "Spring2025KaijuniorSit",
        ["flying"] = "Spring2025KaijuniorRun",
        ["hold"] = "Spring2025KaijuniorBeingHeldSingle",
        ["double_hold"] = "Spring2025KaijuniorBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Spring2025KaijuniorSit" },
        { "Joyful", "Spring2025KaijuniorJoyful" },
        { "Beg", "Spring2025KaijuniorBeg" },
        { "Jump", "Spring2025KaijuniorJump" },
        { "Trick 1", "Spring2025KaijuniorTrick1" },
        { "Trick 2", "Spring2025ToxicKaijuniorTrick2" }
    },
    ["neon_parts"] = {
        ["ToxicTorso4_Geo"] = Color3.fromRGB(99, 171, 137),
        ["ToxicSpine_Geo"] = Color3.fromRGB(109, 193, 116),
        ["RightHand2_Geo"] = Color3.fromRGB(158, 190, 133),
        ["Eyes_Geo"] = Color3.fromRGB(97, 188, 0),
        ["ToxicSpine2_Geo"] = Color3.fromRGB(99, 171, 137),
        ["LeftHand2_Geo"] = Color3.fromRGB(158, 190, 133),
        ["Head3_Geo"] = Color3.fromRGB(158, 190, 133),
        ["Head5_Geo"] = Color3.fromRGB(52, 63, 35),
        ["ToxicHead2_Geo"] = Color3.fromRGB(99, 171, 137),
        ["Head2_Geo"] = Color3.fromRGB(52, 63, 35),
        ["ToxicTorso_Geo"] = Color3.fromRGB(158, 190, 133),
        ["RightFoot2_Geo"] = Color3.fromRGB(158, 190, 133),
        ["LeftFoot2_Geo"] = Color3.fromRGB(158, 190, 133),
        ["ToxicTorso3_Geo"] = Color3.fromRGB(109, 193, 116),
        ["ToxicHead_Geo"] = Color3.fromRGB(109, 193, 116),
        ["ToxicTorso2_Geo"] = Color3.new(125, 121, 95),
        ["LeftHand4_Geo"] = Color3.new(125, 121, 95),
        ["RightHand4_Geo"] = Color3.new(125, 121, 95),
        ["RightFoot3_Geo"] = Color3.new(125, 121, 95),
        ["LeftFoot3_Geo"] = Color3.new(125, 121, 95)
    },
    ["origin_entry"] = {
        ["origin"] = "Spring",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true
}
v4.spring_2025_toxic_kaijunior = v14
local v15 = {
    ["name"] = "Mecha R4BBIT",
    ["model"] = "Spring2025Mechapips",
    ["image"] = "rbxassetid://87668315398037",
    ["rarity"] = "rare",
    ["anims"] = {
        ["sleep"] = "Spring2025MechapipsSleep",
        ["running"] = "Spring2025MechapipsRun",
        ["idle"] = "Spring2025MechapipsIdle",
        ["eating"] = "Spring2025MechapipsEat",
        ["sit"] = "Spring2025MechapipsSit",
        ["flying"] = "Spring2025MechapipsRun",
        ["hold"] = "Spring2025MechapipsBeingHeldSingle",
        ["double_hold"] = "Spring2025MechapipsBeingHeldDouble",
        ["minigame"] = "Spring2025MechapipsTitan"
    },
    ["tricks"] = {
        { "Sit", "Spring2025MechapipsSit" },
        { "Joyful", "Spring2025MechapipsJoyful" },
        { "Beg", "Spring2025MechapipsBeg" },
        { "Jump", "Spring2025MechapipsJump" },
        { "Trick 1", "Spring2025MechapipsTrick1" },
        { "Trick 2", "Spring2025MechapipsTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes_Geo"] = Color3.fromRGB(186, 179, 160),
        ["Head12_Geo"] = Color3.fromRGB(126, 188, 169),
        ["Head4_Geo"] = Color3.fromRGB(94, 185, 171),
        ["Head7_Geo"] = Color3.fromRGB(48, 114, 156),
        ["Head8_Geo"] = Color3.fromRGB(67, 185, 165),
        ["Head9_Geo"] = Color3.fromRGB(67, 185, 165),
        ["LeftArm2_Geo"] = Color3.fromRGB(94, 185, 171),
        ["LeftArm3_Geo"] = Color3.fromRGB(48, 114, 156),
        ["LeftBrow1_Geo"] = Color3.fromRGB(48, 114, 156),
        ["LeftBrow_Geo"] = Color3.fromRGB(94, 185, 171),
        ["LeftEar2_Geo"] = Color3.fromRGB(48, 114, 156),
        ["LeftEar4_Geo"] = Color3.fromRGB(94, 185, 171),
        ["LeftFoot3_Geo"] = Color3.fromRGB(48, 114, 156),
        ["LeftFoot4_Geo"] = Color3.fromRGB(94, 185, 171),
        ["RightArm2_Geo"] = Color3.fromRGB(94, 185, 171),
        ["RightArm3_Geo"] = Color3.fromRGB(48, 114, 156),
        ["RightBrow2_Geo"] = Color3.fromRGB(48, 114, 156),
        ["RightBrow_Geo"] = Color3.fromRGB(94, 185, 171),
        ["RightEar2_Geo"] = Color3.fromRGB(48, 114, 156),
        ["RightEar5_Geo"] = Color3.fromRGB(94, 185, 171),
        ["RightFoot1_Geo"] = Color3.fromRGB(94, 185, 171),
        ["RightFoot3_Geo"] = Color3.fromRGB(48, 114, 156),
        ["Torso4_Geo"] = Color3.fromRGB(94, 185, 171),
        ["Torso5_Geo"] = Color3.fromRGB(48, 114, 156),
        ["Torso8_Geo"] = Color3.fromRGB(152, 182, 193)
    },
    ["cost"] = 37000,
    ["currency_id"] = "cherry_blossoms_2025",
    ["already_has_flying_wings"] = true,
    ["origin_entry"] = {
        ["origin"] = "Spring",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["hide_from_collectors_sign"] = true
}
v4.spring_2025_mechapips = v15
local v16 = {
    ["name"] = "Cabbit",
    ["model"] = "Spring2025Cabbit",
    ["image"] = "rbxassetid://100705885132301",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["sleep"] = "Spring2025CabbitSleep",
        ["running"] = "Spring2025CabbitRun",
        ["idle"] = "Spring2025CabbitIdle",
        ["eating"] = "Spring2025CabbitEat",
        ["sit"] = "Spring2025CabbitSit",
        ["flying"] = "Spring2025CabbitFly",
        ["hold"] = "Spring2025CabbitBeingHeldSingle",
        ["double_hold"] = "Spring2025CabbitBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Spring2025CabbitSit" },
        { "Joyful", "Spring2025CabbitJoyful" },
        { "Beg", "Spring2025CabbitBeg" },
        { "Jump", "Spring2025CabbitJump" },
        { "Trick 1", "Spring2025CabbitTrick1" },
        { "Trick 2", "Spring2025CabbitTrick2" }
    },
    ["neon_parts"] = {
        ["RightEar5_Geo"] = Color3.fromRGB(234, 125, 88),
        ["Head6_Geo"] = Color3.fromRGB(222, 107, 67),
        ["LeftEar2_Geo"] = Color3.fromRGB(222, 107, 67),
        ["Torso2_Geo"] = Color3.fromRGB(234, 125, 88),
        ["Tail_Geo"] = Color3.fromRGB(234, 125, 88),
        ["LeftEar5_Geo"] = Color3.fromRGB(234, 125, 88),
        ["Head2_Geo"] = Color3.fromRGB(234, 125, 88),
        ["RightEar2_Geo"] = Color3.fromRGB(222, 107, 67),
        ["Torso3_Geo"] = Color3.fromRGB(222, 107, 67),
        ["Tail2_Geo"] = Color3.fromRGB(234, 125, 88)
    }
}
local v17 = {
    ["origin"] = "Spring",
    ["origin_items"] = {},
    ["year"] = 2025,
    ["viewport_override"] = {
        ["distance"] = 5,
        ["offset"] = CFrame.new(0, -0.5, 0)
    }
}
v16.origin_entry = v17
v16.already_has_flying_wings = true
v16.generate_npc_furniture_on_runtime = true
v4.spring_2025_cabbit = v16
return v3(v4)