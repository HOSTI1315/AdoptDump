--// ReplicatedStorage.SharedModules.ContentPacks.Moon2025.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Moon Egg",
    ["image"] = "rbxassetid://112630556645658",
    ["model"] = "Moon2025Egg",
    ["rarity"] = "legendary",
    ["cost"] = 750,
    ["origin_entry"] = {
        ["origin"] = "Moon",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "Moon2025EggIdle",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "Moon2025EggIdle",
        ["running"] = "Moon2025EggRun",
        ["sit"] = "Moon2025EggSleep",
        ["sleep"] = "Moon2025EggSleep"
    },
    ["ailments_to_hatch"] = 5
}
v2.moon_2025_egg = v3
local v4 = {
    ["name"] = "Royal Moon Egg",
    ["image"] = "rbxassetid://129762233626342",
    ["model"] = "Moon2025RoyalEgg",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Moon",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "Moon2025EggIdle",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "Moon2025EggIdle",
        ["running"] = "Moon2025EggRun",
        ["sit"] = "Moon2025EggSleep",
        ["sleep"] = "Moon2025EggSleep"
    },
    ["ailments_to_hatch"] = 5
}
v2.moon_2025_royal_egg = v4
local v5 = {
    ["name"] = "Starmite",
    ["model"] = "Moon2025Starmite",
    ["image"] = "rbxassetid://92652981666929",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Moon",
        ["origin_items"] = { "moon_2025_egg" },
        ["year"] = 2025
    },
    ["anims"] = {
        ["sleep"] = "Moon2025StarmiteSleep",
        ["running"] = "Moon2025StarmiteRun",
        ["idle"] = "Moon2025StarmiteIdle",
        ["eating"] = "Moon2025StarmiteEat",
        ["sit"] = "Moon2025StarmiteSit",
        ["flying"] = "Moon2025StarmiteRun",
        ["hold"] = "Moon2025StarmiteBeingHeldSingle",
        ["double_hold"] = "Moon2025StarmiteBeingHeldDouble",
        ["focus_view"] = "Moon2025StarmiteFocusView"
    },
    ["tricks"] = {
        { "Sit", "Moon2025StarmiteSit" },
        { "Joyful", "Moon2025StarmiteJoyful" },
        { "Beg", "Moon2025StarmiteBeg" },
        { "Jump", "Moon2025StarmiteJump" },
        { "Trick 1", "Moon2025StarmiteTrick1" },
        { "Trick 2", "Moon2025StarmiteTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(186, 112, 55),
        ["Torso2"] = Color3.fromRGB(186, 112, 55),
        ["Tail"] = Color3.fromRGB(186, 112, 55)
    }
}
v2.moon_2025_starmite = v5
local v6 = {
    ["name"] = "Puptune",
    ["model"] = "Moon2025Puptune",
    ["image"] = "rbxassetid://99868640713300",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Moon",
        ["origin_items"] = { "moon_2025_egg" },
        ["year"] = 2025
    },
    ["anims"] = {
        ["sleep"] = "Moon2025PuptuneSleep",
        ["running"] = "Moon2025PuptuneRun",
        ["idle"] = "Moon2025PuptuneIdle",
        ["eating"] = "Moon2025PuptuneEat",
        ["sit"] = "Moon2025PuptuneSit",
        ["flying"] = "Moon2025PuptuneRun",
        ["hold"] = "Moon2025PuptuneBeingHeldSingle",
        ["double_hold"] = "Moon2025PuptuneBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Moon2025PuptuneSit" },
        { "Joyful", "Moon2025PuptuneJoyful" },
        { "Beg", "Moon2025PuptuneBeg" },
        { "Jump", "Moon2025PuptuneJump" },
        { "Trick 1", "Moon2025PuptuneTrick1" },
        { "Trick 2", "Moon2025PuptuneTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(90, 174, 189),
        ["LeftBackFoot"] = Color3.fromRGB(90, 174, 189),
        ["RightBackFoot"] = Color3.fromRGB(90, 174, 189),
        ["RightFrontFoot"] = Color3.fromRGB(90, 174, 189),
        ["LeftFrontFoot"] = Color3.fromRGB(90, 174, 189),
        ["Tongue"] = Color3.fromRGB(90, 174, 189),
        ["LeftEar"] = Color3.fromRGB(90, 174, 189),
        ["RightEar"] = Color3.fromRGB(90, 174, 189),
        ["Tail"] = Color3.fromRGB(90, 174, 189),
        ["Head3"] = Color3.fromRGB(90, 174, 189),
        ["Head4"] = Color3.fromRGB(90, 174, 189),
        ["Tail2"] = Color3.fromRGB(90, 174, 189),
        ["Tail3"] = Color3.fromRGB(90, 174, 189),
        ["Tail4"] = Color3.fromRGB(90, 174, 189),
        ["Tail5"] = Color3.fromRGB(90, 174, 189),
        ["Tongue2"] = Color3.fromRGB(90, 174, 189)
    }
}
v2.moon_2025_puptune = v6
local v7 = {
    ["name"] = "Zeopod",
    ["model"] = "Moon2025Zeopod",
    ["image"] = "rbxassetid://83890934284839",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Moon",
        ["origin_items"] = { "moon_2025_egg" },
        ["year"] = 2025
    },
    ["anims"] = {
        ["sleep"] = "Moon2025ZeopodSleep",
        ["running"] = "Moon2025ZeopodRun",
        ["idle"] = "Moon2025ZeopodIdle",
        ["eating"] = "Moon2025ZeopodEat",
        ["sit"] = "Moon2025ZeopodSit",
        ["flying"] = "Moon2025ZeopodRun",
        ["hold"] = "Moon2025ZeopodBeingHeldSingle",
        ["double_hold"] = "Moon2025ZeopodBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Moon2025ZeopodSit" },
        { "Joyful", "Moon2025ZeopodJoyful" },
        { "Beg", "Moon2025ZeopodBeg" },
        { "Jump", "Moon2025ZeopodJump" },
        { "Trick 1", "Moon2025ZeopodTrick1" },
        { "Trick 2", "Moon2025ZeopodTrick2" }
    },
    ["neon_parts"] = {
        ["Torso2"] = Color3.fromRGB(107, 184, 71),
        ["Tail3"] = Color3.fromRGB(107, 184, 71),
        ["Head3"] = Color3.fromRGB(107, 184, 71),
        ["Head2"] = Color3.fromRGB(107, 184, 71),
        ["Tail2"] = Color3.fromRGB(107, 184, 71)
    }
}
v2.moon_2025_zeopod = v7
local v8 = {
    ["name"] = "Snorgle",
    ["model"] = "Moon2025Snorgle",
    ["image"] = "rbxassetid://99104623628550",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Moon",
        ["origin_items"] = { "moon_2025_egg" },
        ["year"] = 2025
    },
    ["anims"] = {
        ["sleep"] = "Moon2025SnorgleSleep",
        ["running"] = "Moon2025SnorgleRun",
        ["idle"] = "Moon2025SnorgleIdle",
        ["eating"] = "Moon2025SnorgleEat",
        ["sit"] = "Moon2025SnorgleSit",
        ["flying"] = "Moon2025SnorgleRun",
        ["hold"] = "Moon2025SnorgleBeingHeldSingle",
        ["double_hold"] = "Moon2025SnorgleBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Moon2025SnorgleSit" },
        { "Joyful", "Moon2025SnorgleJoyful" },
        { "Beg", "Moon2025SnorgleBeg" },
        { "Jump", "Moon2025SnorgleJump" },
        { "Trick 1", "Moon2025SnorgleTrick1" },
        { "Trick 2", "Moon2025SnorgleTrick2" }
    },
    ["neon_parts"] = {
        ["Torso2"] = Color3.fromRGB(193, 98, 100),
        ["LeftArm2"] = Color3.fromRGB(193, 98, 100),
        ["LeftEar2"] = Color3.fromRGB(193, 98, 100),
        ["RightArm2"] = Color3.fromRGB(193, 98, 100),
        ["Head5"] = Color3.fromRGB(193, 98, 100),
        ["RightEar2"] = Color3.fromRGB(193, 98, 100),
        ["Tail2"] = Color3.fromRGB(193, 98, 100),
        ["Head2"] = Color3.fromRGB(193, 98, 100),
        ["LeftAntenna"] = Color3.fromRGB(193, 98, 100),
        ["LeftAntenna2"] = Color3.fromRGB(193, 98, 100),
        ["LeftAntenna3"] = Color3.fromRGB(193, 98, 100),
        ["LeftEar3"] = Color3.fromRGB(193, 98, 100),
        ["RightAntenna"] = Color3.fromRGB(193, 98, 100),
        ["RightAntenna2"] = Color3.fromRGB(193, 98, 100),
        ["RightAntenna3"] = Color3.fromRGB(193, 98, 100),
        ["RightEar3"] = Color3.fromRGB(193, 98, 100),
        ["Tail4"] = Color3.fromRGB(193, 98, 100),
        ["Head4"] = Color3.fromRGB(193, 98, 100)
    }
}
v2.moon_2025_snorgle = v8
local v9 = {
    ["name"] = "Hopbop",
    ["model"] = "Moon2025Hopbop",
    ["image"] = "rbxassetid://102746202827395",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Moon",
        ["origin_items"] = { "moon_2025_egg" },
        ["year"] = 2025
    },
    ["anims"] = {
        ["sleep"] = "Moon2025HopbopSleep",
        ["running"] = "Moon2025HopbopRun",
        ["idle"] = "Moon2025HopbopIdle",
        ["eating"] = "Moon2025HopbopEat",
        ["sit"] = "Moon2025HopbopSit",
        ["flying"] = "Moon2025HopbopRun",
        ["hold"] = "Moon2025HopbopBeingHeldSingle",
        ["double_hold"] = "Moon2025HopbopBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Moon2025HopbopSit" },
        { "Joyful", "Moon2025HopbopJoyful" },
        { "Beg", "Moon2025HopbopBeg" },
        { "Jump", "Moon2025HopbopJump" },
        { "Trick 1", "Moon2025HopbopTrick1" },
        { "Trick 2", "Moon2025HopbopTrick2" }
    },
    ["neon_parts"] = {
        ["Torso3"] = Color3.fromRGB(214, 117, 93),
        ["Head3"] = Color3.fromRGB(214, 117, 93)
    }
}
v2.moon_2025_hopbop = v9
local v10 = {
    ["name"] = "Dimension Drifter",
    ["model"] = "Moon2025DimensionDrifter",
    ["image"] = "rbxassetid://128454622445076",
    ["rarity"] = "legendary",
    ["already_has_flying_wings"] = true,
    ["origin_entry"] = {
        ["origin"] = "Moon",
        ["origin_items"] = { "moon_2025_egg" },
        ["year"] = 2025
    },
    ["anims"] = {
        ["sleep"] = "Moon2025DimensionDrifterSleep",
        ["running"] = "Moon2025DimensionDrifterRun",
        ["idle"] = "Moon2025DimensionDrifterIdle",
        ["eating"] = "Moon2025DimensionDrifterEat",
        ["sit"] = "Moon2025DimensionDrifterSit",
        ["flying"] = "Moon2025DimensionDrifterRun",
        ["hold"] = "Moon2025DimensionDrifterBeingHeldSingle",
        ["double_hold"] = "Moon2025DimensionDrifterBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Moon2025DimensionDrifterSit" },
        { "Joyful", "Moon2025DimensionDrifterJoyful" },
        { "Beg", "Moon2025DimensionDrifterBeg" },
        { "Jump", "Moon2025DimensionDrifterJump" },
        { "Trick 1", "Moon2025DimensionDrifterTrick1" },
        { "Trick 2", "Moon2025DimensionDrifterTrick2" }
    },
    ["neon_parts"] = {
        ["CenterTentacle2"] = Color3.fromRGB(40, 207, 216),
        ["FrontRightTentacle2"] = Color3.fromRGB(40, 207, 216),
        ["BackRightTentacle2"] = Color3.fromRGB(40, 207, 216),
        ["BackLeftTentacle2"] = Color3.fromRGB(40, 207, 216),
        ["FrontLeftTentacle2"] = Color3.fromRGB(40, 207, 216),
        ["Head2"] = Color3.fromRGB(64, 144, 230)
    }
}
v2.moon_2025_dimension_drifter = v10
local v11 = {
    ["name"] = "Moonpine",
    ["model"] = "Moon2025Moonpine",
    ["image"] = "rbxassetid://98687388677942",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Moon",
        ["origin_items"] = { "moon_2025_egg" },
        ["year"] = 2025
    },
    ["anims"] = {
        ["sleep"] = "Moon2025MoonpineSleep",
        ["running"] = "Moon2025MoonpineRun",
        ["idle"] = "Moon2025MoonpineIdle",
        ["eating"] = "Moon2025MoonpineEat",
        ["sit"] = "Moon2025MoonpineSit",
        ["flying"] = "Moon2025MoonpineRun",
        ["hold"] = "Moon2025MoonpineBeingHeldSingle",
        ["double_hold"] = "Moon2025MoonpineBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Moon2025MoonpineSit" },
        { "Joyful", "Moon2025MoonpineJoyful" },
        { "Beg", "Moon2025MoonpineBeg" },
        { "Jump", "Moon2025MoonpineJump" },
        { "Trick 1", "Moon2025MoonpineTrick1" },
        { "Trick 2", "Moon2025MoonpineTrick2" }
    },
    ["neon_parts"] = {
        ["LeftBackFoot"] = Color3.fromRGB(232, 72, 24),
        ["LeftFrontFoot"] = Color3.fromRGB(232, 72, 24),
        ["RightBackFoot"] = Color3.fromRGB(232, 72, 24),
        ["RightFrontFoot"] = Color3.fromRGB(232, 72, 24),
        ["Spikes2"] = Color3.fromRGB(255, 119, 0)
    }
}
v2.moon_2025_moonpine = v11
local v12 = {
    ["name"] = "Sunglider",
    ["model"] = "Moon2025Sunglider",
    ["image"] = "rbxassetid://103653773461193",
    ["rarity"] = "legendary",
    ["already_has_flying_wings"] = true,
    ["origin_entry"] = {
        ["origin"] = "Moon",
        ["origin_items"] = { "moon_2025_egg" },
        ["year"] = 2025
    },
    ["anims"] = {
        ["sleep"] = "Moon2025SungliderSleep",
        ["running"] = "Moon2025SungliderRun",
        ["idle"] = "Moon2025SungliderIdle",
        ["eating"] = "Moon2025SungliderEat",
        ["sit"] = "Moon2025SungliderSit",
        ["flying"] = "Moon2025SungliderRun",
        ["hold"] = "Moon2025SungliderBeingHeldSingle",
        ["double_hold"] = "Moon2025SungliderBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Moon2025SungliderSit" },
        { "Joyful", "Moon2025SungliderJoyful" },
        { "Beg", "Moon2025SungliderBeg" },
        { "Jump", "Moon2025SungliderJump" },
        { "Trick 1", "Moon2025SungliderTrick1" },
        { "Trick 2", "Moon2025SungliderTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(203, 109, 2),
        ["Torso2"] = Color3.fromRGB(203, 109, 2),
        ["RightFrontFoot"] = Color3.fromRGB(203, 109, 2),
        ["LeftFrontFoot"] = Color3.fromRGB(203, 109, 2),
        ["LeftBackFoot"] = Color3.fromRGB(203, 109, 2),
        ["RightBackFoot"] = Color3.fromRGB(203, 109, 2),
        ["Torso3"] = Color3.fromRGB(203, 109, 2),
        ["LeftWing2"] = Color3.fromRGB(203, 109, 2),
        ["RightWing2"] = Color3.fromRGB(203, 109, 2),
        ["RightEar2"] = Color3.fromRGB(203, 109, 2),
        ["LeftEar2"] = Color3.fromRGB(203, 109, 2)
    }
}
v2.moon_2025_sunglider = v12
local v13 = {
    ["name"] = "Glormy Dolphin",
    ["origin_entry"] = {
        ["origin"] = "Moon",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["model"] = "Moon2025GlormyDolphin",
    ["image"] = "rbxassetid://96735424372947",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["sleep"] = "Moon2025GlormyDolphinSleep",
        ["running"] = "Moon2025GlormyDolphinRun",
        ["idle"] = "Moon2025GlormyDolphinIdle",
        ["eating"] = "Moon2025GlormyDolphinEat",
        ["sit"] = "Moon2025GlormyDolphinSit",
        ["flying"] = "Moon2025GlormyDolphinRun",
        ["hold"] = "Moon2025GlormyDolphinBeingHeldSingle",
        ["double_hold"] = "Moon2025GlormyDolphinBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Moon2025GlormyDolphinSit" },
        { "Joyful", "Moon2025GlormyDolphinJoyful" },
        { "Beg", "Moon2025GlormyDolphinBeg" },
        { "Jump", "Moon2025GlormyDolphinJump" },
        { "Trick 1", "Moon2025GlormyDolphinTrick1" },
        { "Trick 2", "Moon2025GlormyDolphinTrick2" }
    }
}
local v14 = {
    ["Torso2_Geo"] = {
        ["Transparency"] = 0.8,
        ["Color"] = Color3.fromRGB(255, 255, 255)
    },
    ["Eyes_Geo"] = Color3.fromRGB(84, 136, 195),
    ["Stars_Geo"] = Color3.fromRGB(195, 191, 150),
    ["Head_Geo"] = Color3.fromRGB(148, 221, 222),
    ["Head2_Geo"] = {
        ["Transparency"] = 0.2,
        ["Color"] = Color3.fromRGB(129, 105, 139)
    },
    ["Torso_Geo"] = Color3.fromRGB(255, 255, 255)
}
v13.neon_parts = v14
v13.already_has_flying_wings = true
v13.generate_npc_furniture_on_runtime = true
v2.moon_2025_glormy_dolphin = v13
return v1(v2)