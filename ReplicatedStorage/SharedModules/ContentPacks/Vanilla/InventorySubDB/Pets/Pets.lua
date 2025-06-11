--// ReplicatedStorage.SharedModules.ContentPacks.Vanilla.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "2021 Uplift Butterfly",
    ["image"] = "rbxassetid://7064993901",
    ["model"] = "2021UpliftButterfly",
    ["rarity"] = "uncommon",
    ["cost"] = 1500,
    ["origin_entry"] = {
        ["origin"] = "Adopt Me\'s B-Day",
        ["origin_items"] = {},
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "ButterflyBeingDoubleHeld",
        ["eating"] = "ButterflyEat",
        ["flying"] = "ButterflyRun",
        ["hold"] = "UpliftButterfly2021BeingHeldFix",
        ["idle"] = "ButterflyIdle",
        ["running"] = "ButterflyRun",
        ["sit"] = "ButterflySit",
        ["sleep"] = "ButterflySleep"
    },
    ["tricks"] = {
        { "Sit", "ButterflySit" },
        { "Joyful", "ButterflyJoyful" },
        { "Beg", "ButterflyBeg" },
        { "Jump", "ButterflyJump" },
        { "Trick 1", "ButterflyTrick1" },
        { "Trick 2", "ButterflyTrick2" }
    },
    ["neon_parts"] = {
        ["LWings2"] = Color3.fromRGB(167, 170, 180),
        ["RWings2"] = Color3.fromRGB(167, 170, 180)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_fly_anim_speed"] = 0.5
}
v2["2021_uplift_butterfly"] = v3
local v4 = {
    ["name"] = "2D Kitty",
    ["image"] = "rbxassetid://6555506303",
    ["model"] = "2DKitty",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["temporary"] = true,
    ["origin_entry"] = {
        ["origin"] = "April Fools",
        ["origin_items"] = {},
        ["year"] = 2021
    },
    ["is_customizable"] = false,
    ["hide_from_collectors_sign"] = true,
    ["anims"] = {
        ["double_hold"] = "FlatKittyBeingDoubleHeld",
        ["eating"] = "FlatKittyEat",
        ["flying"] = "FlatKittyIdle",
        ["hold"] = "FlatKittyBeingHeld",
        ["idle"] = "FlatKittyIdle",
        ["running"] = "FlatKittyRun",
        ["sit"] = "FlatKittySit",
        ["sleep"] = "FlatKittySleep"
    },
    ["tricks"] = {
        { "Sit", "FlatKittySit" },
        { "Joyful", "FlatKittyJoyful" },
        { "Jump", "FlatKittyJump" },
        { "Trick 1", "FlatKittyTrick1" },
        { "Trick 2", "FlatKittyTrick2" }
    },
    ["neon_parts"] = {},
    ["displayed_rarity"] = "event",
    ["has_non_standard_eyes"] = true,
    ["head_rotator_disabled"] = true
}
v2["2d_kitty"] = v4
local v5 = {
    ["name"] = "Albino Bat",
    ["image"] = "rbxassetid://5862774473",
    ["model"] = "AlbinoBat",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = { "bat_box" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "BatBeingDoubleHeld",
        ["eating"] = "BatEat",
        ["flying"] = "BatFly",
        ["hold"] = "BatBeingHeld",
        ["idle"] = "BatIdle",
        ["running"] = "BatRun",
        ["sit"] = "BatSit",
        ["sleep"] = "BatSleep"
    },
    ["tricks"] = {
        { "Sit", "BatSit" },
        { "Joyful", "BatJoyful" },
        { "Beg", "BatBeg" },
        { "Jump", "BatJump" },
        { "Trick 1", "BatTrick1" },
        { "Trick 2", "BatTrick2" }
    },
    ["neon_parts"] = {
        ["Fur"] = Color3.fromRGB(85, 112, 207),
        ["LeftEar3"] = Color3.fromRGB(85, 112, 207),
        ["LeftEar4"] = Color3.fromRGB(85, 112, 207),
        ["Nose"] = Color3.fromRGB(85, 112, 207),
        ["RightEar3"] = Color3.fromRGB(85, 112, 207),
        ["RightEar4"] = Color3.fromRGB(85, 112, 207),
        ["Torso2"] = Color3.fromRGB(107, 128, 185)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_fly_anim_speed"] = 1
}
v2.albino_bat = v5
local v6 = {
    ["name"] = "Albino Monkey",
    ["image"] = "rbxassetid://5067924142",
    ["model"] = "AlbinoMonkey",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Monkey Fairground",
        ["origin_items"] = { "premium_monkey_box" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "MonkeyHold2",
        ["eating"] = "MonkeyEat",
        ["hold"] = "MonkeyHold1",
        ["idle"] = "MonkeyIdle",
        ["running"] = "MonkeyRun",
        ["sit"] = "MonkeySit",
        ["sleep"] = "MonkeySleep"
    },
    ["tricks"] = {
        { "Sit", "MonkeySit" },
        { "Lay down", "MonkeySleep" },
        { "Beg", "MonkeyBeg" },
        { "Joyful", "MonkeyJoyful" },
        { "Trick 1", "MonkeyTrick1" },
        { "Trick 2", "MonkeyTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(194, 194, 194),
        ["LeftEar"] = Color3.fromRGB(194, 194, 194),
        ["LeftLowerArm"] = Color3.fromRGB(194, 194, 194),
        ["LeftUpperArm"] = Color3.fromRGB(194, 194, 194),
        ["RightEar"] = Color3.fromRGB(194, 194, 194),
        ["RightLowerArm"] = Color3.fromRGB(194, 194, 194),
        ["RightUpperArm"] = Color3.fromRGB(194, 194, 194),
        ["Tail1"] = Color3.fromRGB(194, 194, 194),
        ["Tail2"] = Color3.fromRGB(194, 194, 194),
        ["Tail3"] = Color3.fromRGB(194, 194, 194),
        ["Tail4"] = Color3.fromRGB(194, 194, 194),
        ["Tail5"] = Color3.fromRGB(194, 194, 194),
        ["Tail6"] = Color3.fromRGB(194, 194, 194),
        ["Torso"] = Color3.fromRGB(194, 194, 194)
    },
    ["hold_offset"] = CFrame.new(0, 0.8, 0)
}
v2.albino_monkey = v6
local v7 = {
    ["name"] = "Arctic Fox",
    ["image"] = "rbxassetid://4506925854",
    ["model"] = "ArcticFox",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "christmas_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DogIdle",
        ["running"] = "RedPandaRunning",
        ["sit"] = "LlamaSit",
        ["sleep"] = "ReindeerSleep"
    },
    ["tricks"] = {
        { "Sit", "LlamaSit" },
        { "Lay down", "ReindeerSleep" },
        { "Bounce", "DogBounce" },
        { "Dig", "ArcticFoxTrick1" },
        { "Backflip", "DogBackflip" },
        { "Dance", "ArcticFoxDance" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(248, 100, 234),
        ["LeftFoot"] = Color3.fromRGB(248, 100, 234),
        ["LeftHand"] = Color3.fromRGB(248, 100, 234),
        ["Nose"] = Color3.fromRGB(248, 100, 234),
        ["RightEar2"] = Color3.fromRGB(248, 100, 234),
        ["RightFoot"] = Color3.fromRGB(248, 100, 234),
        ["RightHand"] = Color3.fromRGB(248, 100, 234),
        ["Tail"] = Color3.fromRGB(248, 100, 234)
    },
    ["hold_offset"] = CFrame.new(0.2, 0.4, 0)
}
v2.arctic_fox = v7
local v8 = {
    ["name"] = "Arctic Reindeer",
    ["image"] = "rbxassetid://4506837037",
    ["model"] = "ArcticReindeer",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "christmas_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "ReindeerBeingDoubleHeld",
        ["eating"] = "ReindeerEating",
        ["flying"] = "ReindeerFlying",
        ["hold"] = "ReindeerBeingHeld",
        ["idle"] = "ReindeerIdle",
        ["running"] = "ReindeerRunning",
        ["sit"] = "ReindeerSit",
        ["sleep"] = "ReindeerSleep"
    },
    ["tricks"] = {
        { "Sit", "ReindeerSit" },
        { "Lay down", "ReindeerSleep" },
        { "Joy", "ReindeerJoyful" },
        { "Bounce", "ReindeerJump" },
        { "Trick 1", "ReindeerTrick1" },
        { "Trick 2", "ReindeerTrick2" }
    },
    ["neon_parts"] = {
        ["Antler"] = Color3.fromRGB(202, 203, 209),
        ["LeftEar2"] = Color3.fromRGB(202, 203, 209),
        ["LeftFoot"] = Color3.fromRGB(202, 203, 209),
        ["LeftHand"] = Color3.fromRGB(202, 203, 209),
        ["Nose"] = Color3.fromRGB(202, 203, 209),
        ["RightEar2"] = Color3.fromRGB(202, 203, 209),
        ["RightFoot"] = Color3.fromRGB(202, 203, 209),
        ["RightHand"] = Color3.fromRGB(202, 203, 209),
        ["Tail"] = Color3.fromRGB(202, 203, 209)
    },
    ["already_has_flying_wings"] = true,
    ["hold_offset"] = CFrame.new(0, 1, 0),
    ["minimum_fly_anim_speed"] = 1
}
v2.arctic_reindeer = v8
local v9 = {
    ["name"] = "Aussie Egg",
    ["image"] = "rbxassetid://4733386633",
    ["model"] = "AussieEgg",
    ["rarity"] = "legendary",
    ["cost"] = 750,
    ["origin_entry"] = {
        ["origin"] = "Aussie Egg",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "EggIdle2",
        ["running"] = "EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 6
}
v2.aussie_egg = v9
local v10 = {
    ["name"] = "Axolotl",
    ["image"] = "rbxassetid://7215324578",
    ["model"] = "Axolotl",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Pet Shop",
        ["origin_items"] = {},
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "AxolotlBeingDoubleHeld",
        ["eating"] = "AxolotlEat",
        ["flying"] = "AxolotlRunMounted",
        ["hold"] = "AxolotlBeingHeld",
        ["idle"] = "AxolotlIdle",
        ["running"] = "AxolotlRun",
        ["running_mounted"] = "AxolotlRunMounted",
        ["sit"] = "AxolotlSit",
        ["sleep"] = "AxolotlSleep"
    },
    ["tricks"] = {
        { "Sit", "AxolotlSit" },
        { "Joyful", "AxolotlJoyful" },
        { "Beg", "AxolotlBeg" },
        { "Jump", "AxolotlJump" },
        { "Trick 1", "AxolotlTrick1" },
        { "Trick 2", "AxolotlTrick2" }
    },
    ["neon_parts"] = {
        ["Head10"] = Color3.fromRGB(231, 143, 109),
        ["Head11"] = Color3.fromRGB(231, 143, 109),
        ["Head12"] = Color3.fromRGB(231, 143, 109),
        ["Head13"] = Color3.fromRGB(231, 143, 109),
        ["Head14"] = Color3.fromRGB(231, 143, 109),
        ["Head8"] = Color3.fromRGB(231, 143, 109),
        ["Head9"] = Color3.fromRGB(231, 143, 109),
        ["Torso2"] = Color3.fromRGB(231, 143, 109)
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["minimum_fly_anim_speed"] = 0.5
}
v2.axolotl = v10
local v11 = {
    ["name"] = "Bandicoot",
    ["image"] = "rbxassetid://4708551264",
    ["model"] = "Bandicoot",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Aussie Egg",
        ["origin_items"] = { "aussie_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "BandicootBeingDoubleHeld",
        ["eating"] = "BandicootEating",
        ["hold"] = "BandicootBeingHeld",
        ["idle"] = "BandicootIdle",
        ["running"] = "BandicootRunning",
        ["sit"] = "BandicootSit",
        ["sleep"] = "BandicootSleep"
    },
    ["tricks"] = {
        { "Sit", "BandicootSit" },
        { "Lay down", "BandicootSleep" },
        { "Joy", "BandicootJoyful" },
        { "Beg", "BandicootBeg" },
        { "Dance 1", "BandicootTrick1" },
        { "Dance 2", "BandicootTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(255, 102, 204),
        ["LeftFoot"] = Color3.fromRGB(255, 102, 204),
        ["LeftHand"] = Color3.fromRGB(255, 102, 204),
        ["Nose"] = Color3.fromRGB(255, 102, 204),
        ["RightEar2"] = Color3.fromRGB(255, 102, 204),
        ["RightFoot"] = Color3.fromRGB(255, 102, 204),
        ["RightHand"] = Color3.fromRGB(255, 102, 204),
        ["Tail2"] = Color3.fromRGB(255, 102, 204)
    },
    ["hold_double_offset"] = CFrame.new(),
    ["hold_offset"] = CFrame.new(0.3, 1, -0.1)
}
v2.bandicoot = v11
local v12 = {
    ["name"] = "Bat",
    ["image"] = "rbxassetid://5862774392",
    ["model"] = "Bat",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = { "bat_box" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "BatBeingDoubleHeld",
        ["eating"] = "BatEat",
        ["flying"] = "BatFly",
        ["hold"] = "BatBeingHeld",
        ["idle"] = "BatIdle",
        ["running"] = "BatRun",
        ["sit"] = "BatSit",
        ["sleep"] = "BatSleep"
    },
    ["tricks"] = {
        { "Sit", "BatSit" },
        { "Joyful", "BatJoyful" },
        { "Beg", "BatBeg" },
        { "Jump", "BatJump" },
        { "Trick 1", "BatTrick1" },
        { "Trick 2", "BatTrick2" }
    },
    ["neon_parts"] = {
        ["Fur"] = Color3.fromRGB(207, 106, 56),
        ["LeftEar3"] = Color3.fromRGB(207, 106, 56),
        ["LeftEar4"] = Color3.fromRGB(207, 106, 56),
        ["Nose"] = Color3.fromRGB(207, 106, 56),
        ["RightEar3"] = Color3.fromRGB(207, 106, 56),
        ["RightEar4"] = Color3.fromRGB(207, 106, 56),
        ["Torso2"] = Color3.fromRGB(208, 90, 50)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_fly_anim_speed"] = 1
}
v2.bat = v12
local v13 = {
    ["name"] = "Bat Dragon",
    ["image"] = "rbxassetid://4184878149",
    ["model"] = "BatDragon",
    ["rarity"] = "legendary",
    ["currency_id"] = "candy_2019",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "BatDragonEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "BatDragonIdle",
        ["running"] = "BatDragonRunning",
        ["running_low"] = "BatDragonRunningLow",
        ["sit"] = "BatDragonSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "BatDragonSit" },
        { "Lay Down", "DogSleep" },
        { "Joy", "BatDragonJoyful" },
        { "Jump", "BatDragonJump" },
        { "Twirl Around", "BatDragonTrick" },
        { "Triple Flip", "BatDragonTrick2" }
    },
    ["neon_parts"] = {
        ["Horns"] = Color3.fromRGB(195, 98, 73),
        ["LeftWing2"] = Color3.fromRGB(184, 77, 63),
        ["Nose"] = Color3.fromRGB(195, 98, 73),
        ["RightWing2"] = Color3.fromRGB(184, 77, 63),
        ["TailHair"] = Color3.fromRGB(184, 77, 63),
        ["TailSpike1"] = Color3.fromRGB(195, 98, 73),
        ["TailSpike2"] = Color3.fromRGB(203, 104, 33),
        ["TailSpike3"] = Color3.fromRGB(195, 98, 73),
        ["TailSpike4"] = Color3.fromRGB(203, 104, 33)
    },
    ["mega_neon_colors"] = { Color3.fromRGB(211, 42, 104), Color3.fromRGB(95, 88, 232), Color3.fromRGB(85, 255, 187) },
    ["already_has_flying_wings"] = true,
    ["hold_offset"] = CFrame.new(0, 0, 0),
    ["minimum_run_anim_speed"] = 1,
    ["mounted_animation_scale_limit"] = 1
}
v2.bat_dragon = v13
local v14 = {
    ["name"] = "Beaver",
    ["image"] = "rbxassetid://3181727196",
    ["model"] = "Beaver",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Pets Update",
        ["origin_items"] = {
            "cracked_egg",
            "pet_egg",
            "royal_egg",
            "retired_egg"
        },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "RedPandaIdle",
        ["running"] = "RedPandaRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(213, 112, 61),
        ["LeftFoot"] = Color3.fromRGB(213, 112, 61),
        ["LeftHand"] = Color3.fromRGB(213, 112, 61),
        ["Nose"] = Color3.fromRGB(213, 112, 61),
        ["RightEar2"] = Color3.fromRGB(213, 112, 61),
        ["RightFoot"] = Color3.fromRGB(213, 112, 61),
        ["RightHand"] = Color3.fromRGB(213, 112, 61),
        ["Tail"] = Color3.fromRGB(213, 112, 61)
    }
}
v2.beaver = v14
local v15 = {
    ["name"] = "Bee",
    ["image"] = "rbxassetid://4281674713",
    ["model"] = "Bee",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Coffee Shop",
        ["origin_items"] = { "honey" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "BeeBeingDoubleHeld",
        ["eating"] = "BeeEating",
        ["hold"] = "BeeBeingHeld",
        ["idle"] = "BeeIdle",
        ["running"] = "BeeRunning",
        ["running_low"] = "BeeRunningLow",
        ["sit"] = "BeeSit",
        ["sleep"] = "BeeSleep"
    },
    ["tricks"] = {
        { "Sit", "BeeSit" },
        { "Lay Down", "BeeSleep" },
        { "Joy", "BeeJoyful" },
        { "Jump", "BeeJump" },
        { "Sideflip", "BeeTrick1" },
        { "Spin", "BeeTrick2" }
    },
    ["neon_parts"] = {
        ["LeftAntenna"] = Color3.fromRGB(114, 229, 114),
        ["LeftFoot"] = Color3.fromRGB(114, 229, 114),
        ["LeftHand"] = Color3.fromRGB(114, 229, 114),
        ["LeftWing"] = Color3.fromRGB(114, 229, 114),
        ["RightAntenna"] = Color3.fromRGB(114, 229, 114),
        ["RightFoot"] = Color3.fromRGB(114, 229, 114),
        ["RightHand"] = Color3.fromRGB(114, 229, 114),
        ["RightWing"] = Color3.fromRGB(114, 229, 114),
        ["Torso"] = Color3.fromRGB(114, 229, 114)
    },
    ["already_has_flying_wings"] = true,
    ["hold_offset"] = CFrame.new(0, 0.6, 0),
    ["minimum_run_anim_speed"] = 1,
    ["mounted_animation_scale_limit"] = 1,
    ["mounted_fly_forward_tilt_compensation"] = -15
}
v2.bee = v15
local v16 = {
    ["name"] = "Black Panther",
    ["image"] = "rbxassetid://3743730108",
    ["model"] = "Black Panther",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Jungle Egg",
        ["origin_items"] = { "jungle_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "CatIdle",
        ["running"] = "CatRunning",
        ["sit"] = "CatSit",
        ["sleep"] = "CatSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(248, 248, 248),
        ["LeftFoot"] = Color3.fromRGB(248, 248, 248),
        ["LeftHand"] = Color3.fromRGB(248, 248, 248),
        ["Nose"] = Color3.fromRGB(248, 248, 248),
        ["RightEar2"] = Color3.fromRGB(248, 248, 248),
        ["RightFoot"] = Color3.fromRGB(248, 248, 248),
        ["RightHand"] = Color3.fromRGB(248, 248, 248),
        ["Tail"] = Color3.fromRGB(248, 248, 248),
        ["Whiskers"] = Color3.fromRGB(248, 248, 248)
    },
    ["set"] = "jungle"
}
v2.black_panther = v16
local v17 = {
    ["name"] = "Blue Dog",
    ["image"] = "rbxassetid://3261465893",
    ["model"] = "BlueDog",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Easter",
        ["origin_items"] = { "pet_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DogIdle",
        ["running"] = "DogRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar"] = Color3.fromRGB(9, 137, 207),
        ["LeftFoot"] = Color3.fromRGB(9, 137, 207),
        ["LeftHand"] = Color3.fromRGB(9, 137, 207),
        ["Nose"] = Color3.fromRGB(9, 137, 207),
        ["RightEar"] = Color3.fromRGB(9, 137, 207),
        ["RightFoot"] = Color3.fromRGB(9, 137, 207),
        ["RightHand"] = Color3.fromRGB(9, 137, 207),
        ["Tail"] = Color3.fromRGB(0, 123, 255)
    },
    ["mega_neon_colors"] = { Color3.fromRGB(255, 209, 108), Color3.fromRGB(85, 255, 187) }
}
v2.blue_dog = v17
local v18 = {
    ["name"] = "Brown Bear",
    ["image"] = "rbxassetid://3743735223",
    ["model"] = "BrownBear",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Jungle Egg",
        ["origin_items"] = { "jungle_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "BearBeingDoubleHeld",
        ["eating"] = "BearEating",
        ["hold"] = "BearBeingHeld",
        ["idle"] = "BearIdle",
        ["running"] = "BearRunning",
        ["sit"] = "BearSit",
        ["sleep"] = "BearSleep"
    },
    ["tricks"] = {
        { "Sit", "BearSit" },
        { "Lay down", "BearSleep" },
        { "Beg", "BearBeg" },
        { "Bounce", "BearJump" },
        { "Dance 1", "BearTrick2" },
        { "Dance 2", "BearTrick" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(255, 148, 148),
        ["LeftEar2"] = Color3.fromRGB(255, 148, 148),
        ["LeftFoot"] = Color3.fromRGB(255, 148, 148),
        ["RightEar2"] = Color3.fromRGB(255, 148, 148),
        ["RightFoot"] = Color3.fromRGB(255, 148, 148),
        ["Tail"] = Color3.fromRGB(255, 148, 148)
    },
    ["hold_offset"] = CFrame.new(0, 0.6, 0),
    ["set"] = "jungle"
}
v2.brown_bear = v18
local v19 = {
    ["name"] = "Buffalo",
    ["image"] = "rbxassetid://3181727229",
    ["model"] = "Buffalo",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Pets Update",
        ["origin_items"] = { "cracked_egg", "pet_egg", "retired_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "RedPandaIdle",
        ["running"] = "RedPandaRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["Horns"] = Color3.fromRGB(70, 193, 87),
        ["LeftFoot"] = Color3.fromRGB(70, 193, 87),
        ["LeftHand"] = Color3.fromRGB(70, 193, 87),
        ["Nose"] = Color3.fromRGB(70, 193, 87),
        ["RightFoot"] = Color3.fromRGB(70, 193, 87),
        ["RightHand"] = Color3.fromRGB(70, 193, 87),
        ["Tail2"] = Color3.fromRGB(70, 193, 87)
    }
}
v2.buffalo = v19
local v20 = {
    ["name"] = "Bunny",
    ["image"] = "rbxassetid://3181727773",
    ["model"] = "Bunny",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Pets Update",
        ["origin_items"] = {
            "cracked_egg",
            "pet_egg",
            "royal_egg",
            "retired_egg"
        },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DogIdle",
        ["running"] = "DogRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(255, 102, 204),
        ["LeftFoot"] = Color3.fromRGB(255, 102, 204),
        ["LeftHand"] = Color3.fromRGB(255, 102, 204),
        ["Nose"] = Color3.fromRGB(255, 102, 204),
        ["RightEar2"] = Color3.fromRGB(255, 102, 204),
        ["RightFoot"] = Color3.fromRGB(255, 102, 204),
        ["RightHand"] = Color3.fromRGB(255, 102, 204),
        ["Tail"] = Color3.fromRGB(255, 102, 204),
        ["Whiskers"] = Color3.fromRGB(255, 102, 204)
    }
}
v2.bunny = v20
local v21 = {
    ["name"] = "Business Monkey",
    ["image"] = "rbxassetid://5067924307",
    ["model"] = "BusinessMonkey",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Monkey Fairground",
        ["origin_items"] = { "monkey", "3 briefcases" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "MonkeyHold2",
        ["eating"] = "MonkeyEat",
        ["hold"] = "MonkeyHold1",
        ["idle"] = "BusinessMonkeyIdle",
        ["running"] = "MonkeyRun",
        ["sit"] = "MonkeySit",
        ["sleep"] = "MonkeySleep"
    },
    ["tricks"] = {
        { "Sit", "MonkeySit" },
        { "Lay down", "MonkeySleep" },
        { "Beg", "MonkeyBeg" },
        { "Joyful", "BusinessMonkeyJoyful" },
        { "Trick 1", "BusinessMonkeyTrick1" },
        { "Trick 2", "BusinessMonkeyTrick2" }
    },
    ["neon_parts"] = {
        ["LeftLowerArm"] = Color3.fromRGB(255, 102, 204),
        ["LeftUpperArm"] = Color3.fromRGB(255, 102, 204),
        ["RightLowerArm"] = Color3.fromRGB(255, 102, 204),
        ["RightUpperArm"] = Color3.fromRGB(255, 102, 204),
        ["Torso"] = Color3.fromRGB(255, 102, 204)
    },
    ["hold_offset"] = CFrame.new(0, 0.8, 0)
}
v2.business_monkey = v21
local v22 = {
    ["name"] = "Capybara",
    ["image"] = "rbxassetid://3743720235",
    ["model"] = "Capybara",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Jungle Egg",
        ["origin_items"] = { "jungle_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "RedPandaIdle",
        ["running"] = "RedPandaRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(255, 152, 220),
        ["LeftFoot"] = Color3.fromRGB(255, 152, 220),
        ["LeftHand"] = Color3.fromRGB(255, 152, 220),
        ["Nose"] = Color3.fromRGB(255, 152, 220),
        ["RightEar2"] = Color3.fromRGB(255, 152, 220),
        ["RightFoot"] = Color3.fromRGB(255, 152, 220),
        ["RightHand"] = Color3.fromRGB(255, 152, 220)
    },
    ["set"] = "jungle"
}
v2.capybara = v22
local v23 = {
    ["name"] = "Cat",
    ["image"] = "rbxassetid://3200646599",
    ["model"] = "Cat",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Pets Update",
        ["origin_items"] = {
            "cracked_egg",
            "pet_egg",
            "starter_egg",
            "retired_egg"
        },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "CatIdle",
        ["running"] = "CatRunning",
        ["sit"] = "CatSit",
        ["sleep"] = "CatSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(255, 102, 204),
        ["LeftFoot"] = Color3.fromRGB(255, 102, 204),
        ["LeftHand"] = Color3.fromRGB(255, 102, 204),
        ["Nose"] = Color3.fromRGB(255, 102, 204),
        ["RightEar2"] = Color3.fromRGB(255, 102, 204),
        ["RightFoot"] = Color3.fromRGB(255, 102, 204),
        ["RightHand"] = Color3.fromRGB(255, 102, 204),
        ["Whiskers"] = Color3.fromRGB(255, 102, 204)
    }
}
v2.cat = v23
local v24 = {
    ["name"] = "Cerberus",
    ["image"] = "rbxassetid://5862774327",
    ["model"] = "Cerberus",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "CerberusBeingDoubleHeld",
        ["eating"] = "CerberusEat",
        ["hold"] = "CerberusBeingHeld",
        ["idle"] = "CerberusIdle",
        ["running"] = "CerberusRun",
        ["sit"] = "CerberusSit",
        ["sleep"] = "CerberusSleep"
    },
    ["tricks"] = {
        { "Sit", "CerberusSit" },
        { "Joyful", "CerberusJoyful" },
        { "Beg", "CerberusBeg" },
        { "Jump", "CerberusJump" },
        { "Trick 1", "CerberusTrick1" },
        { "Trick 2", "CerberusTrick2" }
    },
    ["neon_parts"] = {
        ["Fur2"] = Color3.fromRGB(103, 85, 194),
        ["LeftEar2"] = Color3.fromRGB(103, 85, 194),
        ["RightEar2"] = Color3.fromRGB(103, 85, 194),
        ["Tail4"] = Color3.fromRGB(103, 85, 194),
        ["Tail5"] = Color3.fromRGB(103, 85, 194),
        ["Tail6"] = Color3.fromRGB(103, 85, 194),
        ["l_LeftEar2"] = Color3.fromRGB(103, 85, 194),
        ["l_RightEar2"] = Color3.fromRGB(103, 85, 194),
        ["r_LeftEar2"] = Color3.fromRGB(103, 85, 194),
        ["r_RightEar2"] = Color3.fromRGB(103, 85, 194)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.cerberus = v24
local v25 = {
    ["name"] = "Chick",
    ["image"] = "rbxassetid://4752655872",
    ["model"] = "Chick",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Easter",
        ["origin_items"] = { "easter_2020_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "ChickBeingDoubleHeld",
        ["eating"] = "ChickEating",
        ["hold"] = "ChickBeingHeld",
        ["idle"] = "ChickIdle",
        ["running"] = "ChickRunning",
        ["sit"] = "ChickSit",
        ["sleep"] = "ChickSleep"
    },
    ["tricks"] = {
        { "Sit", "ChickSit" },
        { "Lay down", "ChickSleep" },
        { "Jump", "ChickJump" },
        { "Joy", "ChickJoyful" },
        { "Dance 1", "ChickTrick" },
        { "Dance 2", "ChickTrick2" }
    },
    ["neon_parts"] = {
        ["LeftFoot"] = Color3.fromRGB(234, 135, 96),
        ["LeftWing"] = Color3.fromRGB(234, 135, 96),
        ["RightFoot"] = Color3.fromRGB(234, 135, 96),
        ["RightWing"] = Color3.fromRGB(234, 135, 96),
        ["Tail"] = Color3.fromRGB(234, 135, 96)
    },
    ["hold_offset"] = CFrame.new(0, 0.7, 0)
}
v2.chick = v25
local v26 = {
    ["name"] = "Chicken",
    ["image"] = "rbxassetid://4440867127",
    ["model"] = "Chicken",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Farm Egg",
        ["origin_items"] = { "farm_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "ChickenBeingDoubleHeld",
        ["eating"] = "ChickenEating",
        ["flying"] = "ChickenJoyful",
        ["hold"] = "ChickenBeingHeld",
        ["idle"] = "ChickenIdle",
        ["running"] = "ChickenRunning",
        ["sit"] = "ChickenSit",
        ["sleep"] = "ChickenSleep"
    },
    ["tricks"] = {
        { "Sit", "ChickenSit" },
        { "Lay down", "ChickenSleep" },
        { "Dig", "ChickenDig" },
        { "Joy", "ChickenJoyful" },
        { "Dance 1", "ChickenTrick1" },
        { "Dance 2", "ChickenTrick2" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(255, 0, 0),
        ["Head2"] = Color3.fromRGB(255, 0, 0),
        ["LeftFoot"] = Color3.fromRGB(255, 0, 0),
        ["RightFoot"] = Color3.fromRGB(255, 0, 0),
        ["Tail"] = Color3.fromRGB(255, 0, 0)
    },
    ["already_has_flying_wings"] = true,
    ["hold_offset"] = CFrame.new(0.2, 0.4, -0.8),
    ["minimum_fly_anim_speed"] = 1
}
v2.chicken = v26
local v27 = {
    ["name"] = "Chocolate Labrador",
    ["image"] = "rbxassetid://3181727398",
    ["model"] = "ChocolateLabrador",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Pets Update",
        ["origin_items"] = {
            "cracked_egg",
            "pet_egg",
            "royal_egg",
            "retired_egg"
        },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DogIdle",
        ["running"] = "DogRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar"] = Color3.fromRGB(204, 142, 105),
        ["LeftFoot"] = Color3.fromRGB(204, 142, 105),
        ["LeftHand"] = Color3.fromRGB(204, 142, 105),
        ["RightEar"] = Color3.fromRGB(204, 142, 105),
        ["RightFoot"] = Color3.fromRGB(204, 142, 105),
        ["RightHand"] = Color3.fromRGB(204, 142, 105)
    }
}
v2.chocolate_labrador = v27
local v28 = {
    ["name"] = "Christmas Egg",
    ["image"] = "rbxassetid://4507163112",
    ["model"] = "ChristmasEgg",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "EggIdle2",
        ["running"] = "EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 6
}
v2.christmas_egg = v28
local v29 = {
    ["name"] = "Clownfish",
    ["image"] = "rbxassetid://6498259006",
    ["model"] = "Clownfish",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Ocean Event",
        ["origin_items"] = { "ocean_egg" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "ClownfishBeingDoubleHeld",
        ["eating"] = "ClownfishEat",
        ["hold"] = "ClownfishBeingHeld",
        ["idle"] = "ClownfishIdle",
        ["running"] = "ClownfishRun",
        ["sit"] = "ClownfishSit",
        ["sleep"] = "ClownfishSleep"
    },
    ["tricks"] = {
        { "Sit", "ClownfishSit" },
        { "Joyful", "ClownfishJoyful" },
        { "Beg", "ClownfishBeg" },
        { "Jump", "ClownfishJump" },
        { "Trick 1", "ClownfishTrick1" },
        { "Trick 2", "ClownfishTrick2" }
    },
    ["neon_parts"] = {
        ["Tail"] = Color3.fromRGB(188, 122, 89),
        ["TopFinMiddle"] = Color3.fromRGB(188, 122, 89),
        ["Torso"] = Color3.fromRGB(188, 122, 89)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_run_anim_speed"] = 0.3
}
v2.clownfish = v29
local v30 = {
    ["name"] = "Cobra",
    ["image"] = "rbxassetid://6963387165",
    ["model"] = "Cobra",
    ["rarity"] = "legendary"
}
local v31 = {
    ["origin"] = "Sky Castle",
    ["origin_items"] = {},
    ["viewport_override"] = {
        ["distance"] = 3,
        ["offset"] = CFrame.new(0, 0, 0.25)
    },
    ["year"] = 2021
}
v30.origin_entry = v31
v30.anims = {
    ["double_hold"] = "CobraBeingDoubleHeld",
    ["eating"] = "CobraEat",
    ["hold"] = "CobraBeingHeld",
    ["idle"] = "CobraIdle",
    ["running"] = "CobraRun",
    ["sit"] = "CobraSit",
    ["sleep"] = "CobraSleep"
}
v30.tricks = {
    { "Sit", "CobraSit" },
    { "Joyful", "CobraJoyful" },
    { "Beg", "CobraBeg" },
    { "Jump", "CobraJump" },
    { "Trick 1", "CobraTrick1" },
    { "Trick 2", "CobraTrick2" }
}
v30.neon_parts = {
    ["Tail"] = Color3.fromRGB(217, 76, 76),
    ["Tongue"] = Color3.fromRGB(217, 76, 76)
}
v30.head_rotator_uses_torso_instead = true
v2.cobra = v30
local v32 = {
    ["name"] = "Cow",
    ["image"] = "rbxassetid://4440866423",
    ["model"] = "Cow",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Farm Egg",
        ["origin_items"] = { "farm_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "CowBeingDoubleHeld",
        ["eating"] = "CowEating",
        ["hold"] = "CowBeingHeld",
        ["idle"] = "CowIdle",
        ["running"] = "CowRunning",
        ["sit"] = "CowSit",
        ["sleep"] = "CowSleep"
    },
    ["tricks"] = {
        { "Sit", "CowSit" },
        { "Lay down", "CowSleep" },
        { "Bounce", "CowJump" },
        { "Roll over", "CowTrick2" },
        { "Dance 1", "CowJoyful" },
        { "Dance 2", "CowTrick1" }
    },
    ["neon_parts"] = {
        ["Belly"] = Color3.fromRGB(255, 102, 204),
        ["HeadSpot"] = Color3.fromRGB(255, 102, 204),
        ["Head2"] = Color3.fromRGB(255, 102, 204),
        ["LeftEar2"] = Color3.fromRGB(255, 102, 204),
        ["LeftFoot"] = Color3.fromRGB(255, 102, 204),
        ["LeftHand"] = Color3.fromRGB(255, 102, 204),
        ["RightEar2"] = Color3.fromRGB(255, 102, 204),
        ["RightFoot"] = Color3.fromRGB(255, 102, 204),
        ["RightHand"] = Color3.fromRGB(255, 102, 204),
        ["Spots"] = Color3.fromRGB(255, 102, 204),
        ["Tail2"] = Color3.fromRGB(255, 102, 204)
    },
    ["hold_offset"] = CFrame.new(0, 0.6, -0.2) * CFrame.Angles(0, -1.5707963267948966, 0)
}
v2.cow = v32
local v33 = {
    ["name"] = "Crab",
    ["image"] = "rbxassetid://6498256485",
    ["model"] = "Crab",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Ocean Event",
        ["origin_items"] = { "ocean_egg" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "CrabBeingDoubleHeld",
        ["eating"] = "CrabEat",
        ["hold"] = "CrabBeingHeld",
        ["idle"] = "CrabIdle",
        ["running"] = "CrabRun",
        ["sit"] = "CrabSit",
        ["sleep"] = "CrabSleep"
    },
    ["tricks"] = {
        { "Sit", "CrabSit" },
        { "Joyful", "CrabJoyful" },
        { "Beg", "CrabBeg" },
        { "Jump", "CrabJump" },
        { "Trick 1", "CrabTrick1" },
        { "Trick 2", "CrabTrick2" }
    },
    ["neon_parts"] = {
        ["LeftClaw2"] = Color3.fromRGB(255, 152, 220),
        ["LeftEyeBase"] = Color3.fromRGB(255, 152, 220),
        ["LowerShell"] = Color3.fromRGB(255, 152, 220),
        ["RightClaw2"] = Color3.fromRGB(255, 152, 220),
        ["RightEyeBase"] = Color3.fromRGB(255, 152, 220)
    },
    ["eyes"] = { "LeftEye", "RightEye" },
    ["head_rotator_doesnt_rotate_while_moving"] = true,
    ["head_rotator_uses_torso_instead"] = true,
    ["minimum_fly_anim_speed"] = 1
}
v2.crab = v33
local v34 = {
    ["name"] = "Cracked Egg",
    ["image"] = "rbxassetid://3199974297",
    ["model"] = "CrackedEgg",
    ["rarity"] = "common",
    ["cost"] = 350,
    ["origin_entry"] = {
        ["origin"] = "Nursery",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "EggIdle2",
        ["running"] = "EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 4,
    ["is_non_event_egg"] = true
}
v2.cracked_egg = v34
local v35 = {
    ["name"] = "Crocodile",
    ["image"] = "rbxassetid://3743711305",
    ["model"] = "Crocodile",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Jungle Egg",
        ["origin_items"] = { "jungle_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "CrocodileBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "CrocodileBeingHeld",
        ["idle"] = "CrocodileIdle",
        ["running"] = "CrocodileRun",
        ["sit"] = "CrocodileSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "CrocodileSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Dance 1", "CrocodileDance1" },
        { "Dance 2", "CrocodileDance2" }
    },
    ["neon_parts"] = {
        ["LeftFoot"] = Color3.fromRGB(0, 255, 0),
        ["LeftHand"] = Color3.fromRGB(0, 255, 0),
        ["RightFoot"] = Color3.fromRGB(0, 255, 0),
        ["RightHand"] = Color3.fromRGB(0, 255, 0),
        ["Tail3"] = Color3.fromRGB(0, 255, 0),
        ["Torso3"] = Color3.fromRGB(0, 255, 0)
    },
    ["hold_offset"] = CFrame.new(0, 0.4, 0),
    ["set"] = "jungle"
}
v2.crocodile = v35
local v36 = {
    ["name"] = "Crow",
    ["image"] = "rbxassetid://4440866299",
    ["model"] = "Crow",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Farm Egg",
        ["origin_items"] = { "farm_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "ParrotBeingDoubleHeld",
        ["eating"] = "ParrotEating",
        ["hold"] = "ParrotBeingHeld",
        ["idle"] = "ParrotIdle",
        ["running"] = "ParrotRunning",
        ["running_low"] = "ParrotRunningLow",
        ["running_mounted"] = "ParrotRunning",
        ["sit"] = "ParrotSit",
        ["sleep"] = "ParrotSleep"
    },
    ["tricks"] = {
        { "Sit", "ParrotSit" },
        { "Lay down", "ParrotSleep" },
        { "Bounce", "ParrotJump" },
        { "Joy", "ParrotJoyful" },
        { "Dance 1", "CrowTrick1" },
        { "Dance 2", "CrowTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(180, 180, 180),
        ["LeftWing"] = Color3.fromRGB(180, 180, 180),
        ["LeftWing2"] = Color3.fromRGB(180, 180, 180),
        ["LeftWing3"] = Color3.fromRGB(180, 180, 180),
        ["Neck"] = Color3.fromRGB(180, 180, 180),
        ["RightWing"] = Color3.fromRGB(180, 180, 180),
        ["RightWing2"] = Color3.fromRGB(180, 180, 180),
        ["RightWing3"] = Color3.fromRGB(180, 180, 180),
        ["Tail"] = Color3.fromRGB(180, 180, 180),
        ["Torso"] = Color3.fromRGB(180, 180, 180)
    },
    ["mega_neon_colors"] = { Color3.fromRGB(181, 31, 129), Color3.fromRGB(255, 89, 89), Color3.fromRGB(213, 115, 61) },
    ["already_has_flying_wings"] = true,
    ["hold_offset"] = CFrame.new(0, 0.7, -0.25),
    ["minimum_run_anim_speed"] = 1,
    ["mounted_animation_scale_limit"] = 1
}
v2.crow = v36
local v37 = {
    ["name"] = "Deinonychus",
    ["image"] = "rbxassetid://5721843001",
    ["model"] = "Deinonychus",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Fossil Isle",
        ["origin_items"] = { "fossil_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "DeinonychusBeingDoubleHeld",
        ["eating"] = "DeinonychusEat",
        ["hold"] = "DeinonychusBeingHeld",
        ["idle"] = "DeinonychusIdle",
        ["running"] = "DeinonychusRun",
        ["sit"] = "DeinonychusSit",
        ["sleep"] = "DeinonychusSleep"
    },
    ["tricks"] = {
        { "Sit", "DeinonychusSit" },
        { "Joyful", "DeinonychusJoyful" },
        { "Beg", "DeinonychusBeg" },
        { "Jump", "DeinonychusJump" },
        { "Trick 1", "DeinonychusTrick1" },
        { "Trick 2", "DeinonychusTrick2" }
    },
    ["neon_parts"] = {
        ["HeadFeathers"] = Color3.fromRGB(193, 48, 51),
        ["LeftFeathers"] = Color3.fromRGB(193, 48, 51),
        ["LeftFootClaws"] = Color3.fromRGB(193, 48, 51),
        ["RightFeathers"] = Color3.fromRGB(193, 48, 51),
        ["RightFootClaws"] = Color3.fromRGB(193, 48, 51),
        ["TailFeathers"] = Color3.fromRGB(193, 48, 51),
        ["TailTop1"] = Color3.fromRGB(193, 48, 51),
        ["TailTop2"] = Color3.fromRGB(193, 48, 51),
        ["TailTop3"] = Color3.fromRGB(193, 48, 51),
        ["TailTop4"] = Color3.fromRGB(193, 48, 51),
        ["TailTop5"] = Color3.fromRGB(193, 48, 51),
        ["TailTop6"] = Color3.fromRGB(193, 48, 51),
        ["Torso2"] = Color3.fromRGB(193, 48, 51)
    }
}
v2.deinonychus = v37
local v38 = {
    ["name"] = "Diamond Dragon",
    ["image"] = "rbxassetid://4797806358",
    ["model"] = "DiamondDragon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Star Rewards",
        ["origin_items"] = { "diamond_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DragonFlyIdle",
        ["idle_low"] = "DragonFlyIdleLow",
        ["running"] = "DragonFly",
        ["running_low"] = "DragonFlyLow",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["Fangs"] = Color3.fromRGB(239, 149, 96),
        ["Horns"] = Color3.fromRGB(239, 149, 96),
        ["LeftWing2"] = Color3.fromRGB(239, 149, 96),
        ["RightWing2"] = Color3.fromRGB(239, 149, 96),
        ["Torso2"] = Color3.fromRGB(239, 149, 96)
    },
    ["mega_neon_colors"] = { Color3.fromRGB(255, 94, 167), Color3.fromRGB(85, 255, 187) },
    ["already_has_flying_wings"] = true,
    ["minimum_run_anim_speed"] = 1,
    ["mounted_animation_scale_limit"] = 1
}
v2.diamond_dragon = v38
local v39 = {
    ["name"] = "Diamond Egg",
    ["image"] = "rbxassetid://4822753124",
    ["model"] = "DiamondEgg",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Star Rewards",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "EggIdle2",
        ["running"] = "EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 3
}
v2.diamond_egg = v39
local v40 = {
    ["name"] = "Diamond Griffin",
    ["image"] = "rbxassetid://4797806482",
    ["model"] = "DiamondGriffin",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Star Rewards",
        ["origin_items"] = { "diamond_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DragonFlyIdle",
        ["idle_low"] = "DragonFlyIdleLow",
        ["running"] = "DragonFly",
        ["running_low"] = "DragonFlyLow",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(239, 149, 96),
        ["Brows"] = Color3.fromRGB(239, 149, 96),
        ["LeftWing1"] = Color3.fromRGB(239, 149, 96),
        ["RightWing1"] = Color3.fromRGB(239, 149, 96),
        ["Tail2"] = Color3.fromRGB(239, 149, 96)
    },
    ["mega_neon_colors"] = { Color3.fromRGB(255, 94, 167), Color3.fromRGB(85, 255, 187) },
    ["already_has_flying_wings"] = true,
    ["minimum_run_anim_speed"] = 1,
    ["mounted_animation_scale_limit"] = 1
}
v2.diamond_griffin = v40
local v41 = {
    ["name"] = "Diamond Ladybug",
    ["image"] = "rbxassetid://6404812861",
    ["model"] = "DiamondLadybug",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Farm Shop",
        ["origin_items"] = { "diamond_lavender" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "LadybugBeingDoubleHeld",
        ["eating"] = "LadybugEat",
        ["flying"] = "LadybugIdle",
        ["hold"] = "LadybugBeingHeld",
        ["idle"] = "LadybugIdle",
        ["running"] = "LadybugRun",
        ["sit"] = "LadybugSit",
        ["sleep"] = "LadybugSleep"
    },
    ["tricks"] = {
        { "Sit", "LadybugSit" },
        { "Joyful", "LadybugJoyful" },
        { "Beg", "LadybugBeg" },
        { "Jump", "LadybugJump" },
        { "Trick 1", "LadybugTrick1" },
        { "Trick 2", "LadybugTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(91, 139, 193),
        ["BackRightFoot"] = Color3.fromRGB(91, 139, 193),
        ["FrontLeftFoot"] = Color3.fromRGB(91, 139, 193),
        ["FrontRightFoot"] = Color3.fromRGB(91, 139, 193),
        ["LeftAntena"] = Color3.fromRGB(91, 139, 193),
        ["LeftSpots"] = Color3.fromRGB(91, 139, 193),
        ["LeftSpots2"] = Color3.fromRGB(91, 139, 193),
        ["LeftWingStem"] = Color3.fromRGB(91, 139, 193),
        ["MiddleLeftFoot"] = Color3.fromRGB(91, 139, 193),
        ["MiddleRightFoot"] = Color3.fromRGB(91, 139, 193),
        ["RightAntena"] = Color3.fromRGB(91, 139, 193),
        ["RightSpots"] = Color3.fromRGB(91, 139, 193),
        ["RightSpots2"] = Color3.fromRGB(91, 139, 193),
        ["RightWingStem"] = Color3.fromRGB(91, 139, 193)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "LeftEye", "RightEye" },
    ["minimum_fly_anim_speed"] = 0.5
}
v2.diamond_ladybug = v41
local v42 = {
    ["name"] = "Diamond Unicorn",
    ["image"] = "rbxassetid://4797806531",
    ["model"] = "DiamondUnicorn",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Star Rewards",
        ["origin_items"] = { "diamond_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "RedPandaIdle",
        ["running"] = "RedPandaRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["Hair1"] = Color3.fromRGB(239, 149, 96),
        ["Hair2"] = Color3.fromRGB(239, 149, 96),
        ["Hair3"] = Color3.fromRGB(239, 149, 96),
        ["Horn"] = Color3.fromRGB(239, 149, 96),
        ["LeftEar2"] = Color3.fromRGB(239, 149, 96),
        ["RightEar2"] = Color3.fromRGB(239, 149, 96),
        ["Tail"] = Color3.fromRGB(239, 149, 96)
    },
    ["mega_neon_colors"] = { Color3.fromRGB(255, 94, 167), Color3.fromRGB(85, 255, 187) }
}
v2.diamond_unicorn = v42
local v43 = {
    ["name"] = "Dilophosaurus",
    ["image"] = "rbxassetid://5721843144",
    ["model"] = "Dilophosaurus",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Fossil Isle",
        ["origin_items"] = { "fossil_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "DilophosaurusBeingDoubleHeld",
        ["eating"] = "DilophosaurusEat",
        ["hold"] = "DilophosaurusBeingHeld",
        ["idle"] = "DilophosaurusIdle",
        ["running"] = "DilophosaurusRun",
        ["sit"] = "DilophosaurusSit",
        ["sleep"] = "DilophosaurusSleep"
    },
    ["tricks"] = {
        { "Sit", "DilophosaurusSit" },
        { "Joyful", "DilophosaurusJoyful" },
        { "Beg", "DilophosaurusBeg" },
        { "Jump", "DilophosaurusJump" },
        { "Trick 1", "DilophosaurusTrick1" },
        { "Trick 2", "DilophosaurusTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(91, 183, 188),
        ["Head4"] = Color3.fromRGB(91, 183, 188),
        ["LeftClaws"] = Color3.fromRGB(91, 183, 188),
        ["LeftFootClaws"] = Color3.fromRGB(91, 183, 188),
        ["LeftInnerFan1"] = Color3.fromRGB(91, 183, 188),
        ["LeftInnerFan2"] = Color3.fromRGB(91, 183, 188),
        ["LeftInnerFan3"] = Color3.fromRGB(91, 183, 188),
        ["RightClaws"] = Color3.fromRGB(91, 183, 188),
        ["RightFootClaws"] = Color3.fromRGB(91, 183, 188),
        ["RightInnerFan1"] = Color3.fromRGB(91, 183, 188),
        ["RightInnerFan2"] = Color3.fromRGB(91, 183, 188),
        ["RightInnerFan3"] = Color3.fromRGB(91, 183, 188),
        ["TailSpine1"] = Color3.fromRGB(91, 183, 188),
        ["TailSpine2"] = Color3.fromRGB(91, 183, 188),
        ["TailSpine3"] = Color3.fromRGB(91, 183, 188),
        ["TailSpine4"] = Color3.fromRGB(91, 183, 188),
        ["TailSpine5"] = Color3.fromRGB(91, 183, 188),
        ["TailSpine6"] = Color3.fromRGB(91, 183, 188),
        ["TailSpine7"] = Color3.fromRGB(91, 183, 188),
        ["Torso4"] = Color3.fromRGB(91, 183, 188)
    }
}
v2.dilophosaurus = v43
local v44 = {
    ["name"] = "Dingo",
    ["image"] = "rbxassetid://4708551244",
    ["model"] = "Dingo",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Aussie Egg",
        ["origin_items"] = { "aussie_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DogIdle",
        ["running"] = "DogRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DingoLayDown"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DingoLayDown" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Dance 1", "DingoTrick1" },
        { "Dance 2", "DingoTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(138, 197, 106),
        ["LeftFoot"] = Color3.fromRGB(138, 197, 106),
        ["LeftHand"] = Color3.fromRGB(138, 197, 106),
        ["Nose"] = Color3.fromRGB(138, 197, 106),
        ["RightEar2"] = Color3.fromRGB(138, 197, 106),
        ["RightFoot"] = Color3.fromRGB(138, 197, 106),
        ["RightHand"] = Color3.fromRGB(138, 197, 106),
        ["Tail"] = Color3.fromRGB(138, 197, 106)
    },
    ["hold_double_offset"] = CFrame.new(),
    ["hold_offset"] = CFrame.new(0, 1, -0.1)
}
v2.dingo = v44
local v45 = {
    ["name"] = "Dodo",
    ["image"] = "rbxassetid://5721843247",
    ["model"] = "Dodo",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Fossil Isle",
        ["origin_items"] = { "fossil_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "DodoBeingDoubleHeld",
        ["eating"] = "DodoEat",
        ["hold"] = "DodoBeingHeld",
        ["idle"] = "DodoIdle",
        ["running"] = "DodoRun",
        ["sit"] = "DodoSit",
        ["sleep"] = "DodoSleep"
    },
    ["tricks"] = {
        { "Sit", "DodoSit" },
        { "Joyful", "DodoJoyful" },
        { "Beg", "DodoBeg" },
        { "Jump", "DodoJump" },
        { "Trick 1", "DodoTrick1" },
        { "Trick 2", "DodoTrick2" }
    },
    ["neon_parts"] = {
        ["Beak2"] = Color3.fromRGB(76, 144, 190),
        ["Feathers1"] = Color3.fromRGB(76, 144, 190),
        ["HeadFeathers"] = Color3.fromRGB(76, 144, 190),
        ["LeftFoot"] = Color3.fromRGB(76, 144, 190),
        ["LeftWing2"] = Color3.fromRGB(76, 144, 190),
        ["RightFoot"] = Color3.fromRGB(76, 144, 190),
        ["RightWing2"] = Color3.fromRGB(76, 144, 190)
    }
}
v2.dodo = v45
local v46 = {
    ["name"] = "Dog",
    ["image"] = "rbxassetid://3181727351",
    ["model"] = "Dog",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Pets Update",
        ["origin_items"] = {
            "cracked_egg",
            "pet_egg",
            "starter_egg",
            "retired_egg"
        },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DogIdle",
        ["running"] = "DogRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar"] = Color3.fromRGB(110, 153, 202),
        ["LeftFoot"] = Color3.fromRGB(110, 153, 202),
        ["LeftHand"] = Color3.fromRGB(110, 153, 202),
        ["RightEar"] = Color3.fromRGB(110, 153, 202),
        ["RightFoot"] = Color3.fromRGB(110, 153, 202),
        ["RightHand"] = Color3.fromRGB(110, 153, 202),
        ["Tail"] = Color3.fromRGB(110, 153, 202)
    }
}
v2.dog = v46
local v47 = {
    ["name"] = "Dolphin",
    ["image"] = "rbxassetid://6498256417",
    ["model"] = "Dolphin",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Ocean Event",
        ["origin_items"] = { "ocean_egg" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "DolphinBeingDoubleHeld",
        ["eating"] = "DolphinEat",
        ["hold"] = "DolphinBeingHeld",
        ["idle"] = "DolphinIdle",
        ["running"] = "DolphinRun",
        ["sit"] = "DolphinSit",
        ["sleep"] = "DolphinSleep"
    },
    ["tricks"] = {
        { "Sit", "DolphinSit" },
        { "Joyful", "DolphinJoyful" },
        { "Beg", "DolphinBeg" },
        { "Jump", "DolphinJump" },
        { "Trick 1", "DolphinTrick1" },
        { "Trick 2", "DolphinTrick2" }
    },
    ["neon_parts"] = {
        ["Torso4"] = Color3.fromRGB(162, 105, 184)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_run_anim_speed"] = 0.3
}
v2.dolphin = v47
local v48 = {
    ["name"] = "Dragon",
    ["image"] = "rbxassetid://3181727433",
    ["model"] = "Dragon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Pets Update",
        ["origin_items"] = {
            "cracked_egg",
            "pet_egg",
            "royal_egg",
            "retired_egg"
        },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DragonFlyIdle",
        ["idle_low"] = "DragonFlyIdleLow",
        ["running"] = "DragonFly",
        ["running_low"] = "DragonFlyLow",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["Fangs"] = Color3.fromRGB(248, 248, 248),
        ["Horns"] = Color3.fromRGB(248, 248, 248),
        ["LeftFoot"] = Color3.fromRGB(248, 248, 248),
        ["LeftHand"] = Color3.fromRGB(248, 248, 248),
        ["LeftWing1"] = Color3.fromRGB(248, 248, 248),
        ["RightFoot"] = Color3.fromRGB(248, 248, 248),
        ["RightHand"] = Color3.fromRGB(248, 248, 248),
        ["RightWing1"] = Color3.fromRGB(248, 248, 248)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_run_anim_speed"] = 1,
    ["mounted_animation_scale_limit"] = 1
}
v2.dragon = v48
local v49 = {
    ["name"] = "Drake",
    ["image"] = "rbxassetid://4440867010",
    ["model"] = "Drake",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Farm Egg",
        ["origin_items"] = { "farm_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DrakeBeingDoubleHeld",
        ["eating"] = "DrakeEating",
        ["flying"] = "DrakeJoyful",
        ["hold"] = "DrakeBeingHeld",
        ["idle"] = "DrakeIdle",
        ["running"] = "DrakeRunning",
        ["sit"] = "DrakeSit",
        ["sleep"] = "DrakeSleep"
    },
    ["tricks"] = {
        { "Sit", "DrakeSit" },
        { "Lay down", "DrakeSleep" },
        { "Bounce", "DrakeJump" },
        { "Joy", "DrakeJoyful" },
        { "Dance 1", "DrakeTrick1" },
        { "Dance 2", "DrakeTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(65, 180, 81),
        ["LeftFoot"] = Color3.fromRGB(65, 180, 81),
        ["RightFoot"] = Color3.fromRGB(65, 180, 81)
    },
    ["already_has_flying_wings"] = true,
    ["hold_offset"] = CFrame.new(0, 0.7, 0),
    ["minimum_fly_anim_speed"] = 1
}
v2.drake = v49
local v50 = {
    ["name"] = "Easter 2020 Egg",
    ["image"] = "rbxassetid://4748889845",
    ["model"] = "ChickEgg",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Easter",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "EggIdle2",
        ["running"] = "EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 4
}
v2.easter_2020_egg = v50
local v51 = {
    ["name"] = "Elephant",
    ["image"] = "rbxassetid://3409443514",
    ["model"] = "Elephant",
    ["rarity"] = "rare"
}
local v52 = {
    ["origin"] = "Safari Egg",
    ["origin_items"] = { "safari_egg" },
    ["viewport_override"] = {
        ["distance"] = 4,
        ["offset"] = CFrame.new(0, 0, -0.5)
    },
    ["year"] = 2019
}
v51.origin_entry = v52
v51.anims = {
    ["double_hold"] = "DogBeingDoubleHeld",
    ["eating"] = "DogEating",
    ["hold"] = "DogBeingHeld",
    ["idle"] = "DogIdle",
    ["running"] = "DogRunning",
    ["sit"] = "DogSit",
    ["sleep"] = "DogSleep"
}
v51.tricks = {
    { "Sit", "DogSit" },
    { "Lay down", "DogSleep" },
    { "Bounce", "DogBounce" },
    { "Roll over", "DogRollover" },
    { "Backflip", "DogBackflip" },
    { "Dance", "DogDance" }
}
v51.neon_parts = {
    ["LeftEar2"] = Color3.fromRGB(255, 148, 148),
    ["LeftFoot"] = Color3.fromRGB(255, 148, 148),
    ["LeftHand"] = Color3.fromRGB(255, 148, 148),
    ["RightEar2"] = Color3.fromRGB(255, 148, 148),
    ["RightFoot"] = Color3.fromRGB(255, 148, 148),
    ["RightHand"] = Color3.fromRGB(255, 148, 148),
    ["Tail2"] = Color3.fromRGB(255, 148, 148),
    ["Tusks"] = Color3.fromRGB(255, 148, 148)
}
v51.set = "safari"
v2.elephant = v51
local v53 = {
    ["name"] = "Hedgehog",
    ["image"] = "rbxassetid://4849941238",
    ["model"] = "Hedgehog",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "HedgehogBeingDoubleHeld",
        ["eating"] = "HedgehogEating",
        ["hold"] = "HedgehogBeingHeld",
        ["idle"] = "HedgehogIdle",
        ["running"] = "HedgehogRunning",
        ["sit"] = "HedgehogSit",
        ["sleep"] = "HedgehogSleep"
    },
    ["tricks"] = {
        { "Sit", "HedgehogSit" },
        { "Lay down", "HedgehogSleep" },
        { "Joy", "HedgehogJoyful" },
        { "Jump", "HedgehogJump" },
        { "Trick 1", "HedgehogTrick1" },
        { "Trick 2", "HedgehogTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(197, 124, 169),
        ["LeftFoot"] = Color3.fromRGB(197, 124, 169),
        ["LeftHand"] = Color3.fromRGB(197, 124, 169),
        ["Nose"] = Color3.fromRGB(197, 124, 169),
        ["RightEar2"] = Color3.fromRGB(197, 124, 169),
        ["RightFoot"] = Color3.fromRGB(197, 124, 169),
        ["RightHand"] = Color3.fromRGB(197, 124, 169)
    },
    ["hold_offset"] = CFrame.new(0, 0.8, 0)
}
v2.elf_hedgehog = v53
local v54 = {
    ["name"] = "Shrew",
    ["image"] = "rbxassetid://4883302468",
    ["model"] = "Shrew",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "ShrewBeingDoubleHeld",
        ["eating"] = "ShrewEating",
        ["hold"] = "ShrewBeingHeld",
        ["idle"] = "ShrewIdle",
        ["running"] = "ShrewRunning",
        ["sit"] = "ShrewSit",
        ["sleep"] = "ShrewSleep"
    },
    ["tricks"] = {
        { "Sit", "ShrewSit" },
        { "Lay down", "ShrewSleep" },
        { "Joy", "ShrewJoyful" },
        { "Jump", "ShrewJump" },
        { "Trick 1", "ShrewTrick1" },
        { "Trick 2", "ShrewTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(197, 124, 169),
        ["LeftEar2"] = Color3.fromRGB(197, 124, 169),
        ["LowerTorso"] = Color3.fromRGB(197, 124, 169),
        ["RightEar2"] = Color3.fromRGB(197, 124, 169),
        ["Tail"] = Color3.fromRGB(197, 124, 169)
    },
    ["hold_offset"] = CFrame.new(0, 1, 0)
}
v2.elf_shrew = v54
local v55 = {
    ["name"] = "Emu",
    ["image"] = "rbxassetid://4708551221",
    ["model"] = "Emu",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Aussie Egg",
        ["origin_items"] = { "aussie_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "FlamingoBeingDoubleHeld",
        ["eating"] = "FlamingoEating",
        ["hold"] = "EmuBeingHeld",
        ["idle"] = "FlamingoIdle",
        ["running"] = "FlamingoRunning",
        ["sit"] = "FlamingoSit2",
        ["sleep"] = "EmuSleep"
    },
    ["tricks"] = {
        { "Sit", "FlamingoSit2" },
        { "Lay down", "EmuSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "FlamingoRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "EmuTrick1" }
    },
    ["neon_parts"] = {
        ["LeftFoot"] = Color3.fromRGB(190, 104, 65),
        ["LeftWing"] = Color3.fromRGB(190, 104, 65),
        ["LowerBeak"] = Color3.fromRGB(190, 104, 65),
        ["RightFoot"] = Color3.fromRGB(190, 104, 65),
        ["RightWing"] = Color3.fromRGB(190, 104, 65),
        ["UpperBeak"] = Color3.fromRGB(190, 104, 65)
    },
    ["hold_double_offset"] = CFrame.new(-0.2, 1, 0),
    ["hold_offset"] = CFrame.new(0.2, 1.2, -0.1)
}
v2.emu = v55
local v56 = {
    ["name"] = "Evil Unicorn",
    ["image"] = "rbxassetid://4184878050",
    ["model"] = "EvilUnicorn",
    ["rarity"] = "legendary",
    ["currency_id"] = "candy_2019",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "RedPandaIdle",
        ["running"] = "RedPandaRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(255, 0, 0),
        ["Hair1"] = Color3.fromRGB(255, 0, 0),
        ["Hair2"] = Color3.fromRGB(255, 0, 0),
        ["Hair3"] = Color3.fromRGB(255, 0, 0),
        ["Horn"] = Color3.fromRGB(255, 0, 0),
        ["LeftEar2"] = Color3.fromRGB(255, 0, 0),
        ["RightEar2"] = Color3.fromRGB(255, 0, 0),
        ["Tail"] = Color3.fromRGB(255, 0, 0)
    },
    ["mega_neon_colors"] = { Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 0, 191), Color3.fromRGB(255, 93, 0) }
}
v2.evil_unicorn = v56
local v57 = {
    ["name"] = "Farm Egg",
    ["image"] = "rbxassetid://4440866155",
    ["model"] = "FarmEgg",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Farm Egg",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "EggIdle2",
        ["running"] = "EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 6
}
v2.farm_egg = v57
local v58 = {
    ["name"] = "Fennec Fox",
    ["image"] = "rbxassetid://3181727637",
    ["model"] = "Fennec",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Pets Update",
        ["origin_items"] = {
            "cracked_egg",
            "pet_egg",
            "royal_egg",
            "retired_egg"
        },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DogIdle",
        ["running"] = "RedPandaRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(159, 243, 233),
        ["LeftFoot"] = Color3.fromRGB(159, 243, 233),
        ["LeftHand"] = Color3.fromRGB(159, 243, 233),
        ["Nose"] = Color3.fromRGB(159, 243, 233),
        ["RightEar2"] = Color3.fromRGB(159, 243, 233),
        ["RightFoot"] = Color3.fromRGB(159, 243, 233),
        ["RightHand"] = Color3.fromRGB(159, 243, 233),
        ["Tail2"] = Color3.fromRGB(159, 243, 233)
    }
}
v2.fennec = v58
local v59 = {
    ["name"] = "Flamingo",
    ["image"] = "rbxassetid://3409443986",
    ["model"] = "Flamingo",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Safari Egg",
        ["origin_items"] = { "safari_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "FlamingoBeingDoubleHeld",
        ["eating"] = "FlamingoEating",
        ["hold"] = "FlamingoBeingHeld",
        ["idle"] = "FlamingoIdle",
        ["running"] = "FlamingoRunning",
        ["sit"] = "FlamingoSit2",
        ["sleep"] = "FlamingoSleep"
    },
    ["tricks"] = {
        { "Sit", "FlamingoSit" },
        { "Lay down", "FlamingoSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "FlamingoRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "FlamingoDance" }
    },
    ["neon_parts"] = {
        ["LeftFoot"] = Color3.fromRGB(213, 101, 73),
        ["LeftWing"] = Color3.fromRGB(213, 101, 73),
        ["LowerBeak"] = Color3.fromRGB(213, 101, 73),
        ["RightFoot"] = Color3.fromRGB(213, 101, 73),
        ["RightWing"] = Color3.fromRGB(213, 101, 73),
        ["UpperBeak"] = Color3.fromRGB(213, 101, 73)
    },
    ["hold_offset"] = CFrame.new(0, 1, 0),
    ["set"] = "safari"
}
v2.flamingo = v59
local v60 = {
    ["name"] = "Fossil Egg",
    ["image"] = "rbxassetid://5721843384",
    ["model"] = "FossilEgg",
    ["rarity"] = "legendary",
    ["cost"] = 750,
    ["origin_entry"] = {
        ["origin"] = "Fossil Isle",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "EggIdle2",
        ["running"] = "EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 6
}
v2.fossil_egg = v60
local v61 = {
    ["name"] = "Frog",
    ["image"] = "rbxassetid://4708551366",
    ["model"] = "Frog",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Aussie Egg",
        ["origin_items"] = { "aussie_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "FrogBeingDoubleHeld",
        ["eating"] = "FrogEating",
        ["hold"] = "FrogBeingHeld",
        ["idle"] = "FrogIdle",
        ["running"] = "FrogRunning",
        ["sit"] = "FrogSit",
        ["sleep"] = "FrogSleep"
    },
    ["tricks"] = {
        { "Sit", "FrogSit" },
        { "Lay down", "FrogSleep" },
        { "Beg", "FrogBeg" },
        { "Joy", "FrogJoyful" },
        { "Trick 1", "FrogTrick1" },
        { "Trick 2", "FrogTrick2" }
    },
    ["neon_parts"] = {
        ["Torso"] = Color3.fromRGB(204, 189, 115)
    },
    ["head_rotator_uses_torso_instead"] = true,
    ["hold_double_offset"] = CFrame.new(0, 0.4, 0),
    ["hold_offset"] = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 1, -0.1)
}
v2.frog = v61
local v62 = {
    ["name"] = "Frost Dragon",
    ["image"] = "rbxassetid://4470748644",
    ["model"] = "FrostDragon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "EdgyDragonBeingDoubleHeld",
        ["eating"] = "EdgyDragonEating",
        ["hold"] = "EdgyDragonBeingHeld",
        ["idle"] = "EdgyDragonIdle",
        ["running"] = "EdgyDragonRunning",
        ["running_low"] = "EdgyDragonRunningLow",
        ["sit"] = "EdgyDragonSit",
        ["sleep"] = "EdgyDragonSleep"
    },
    ["tricks"] = {
        { "Sit", "EdgyDragonSit" },
        { "Lay Down", "EdgyDragonSleep" },
        { "Joy", "EdgyDragonJoyful" },
        { "Jump", "EdgyDragonJump" },
        { "Dive", "EdgyDragonTrick1" },
        { "Frost Breath", "EdgyDragonTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(103, 151, 200),
        ["HeadSpikes"] = Color3.fromRGB(103, 151, 200),
        ["Horns"] = Color3.fromRGB(103, 151, 200),
        ["LeftFoot"] = Color3.fromRGB(103, 151, 200),
        ["LeftHand"] = Color3.fromRGB(103, 151, 200),
        ["LeftWingWeb"] = Color3.fromRGB(103, 151, 200),
        ["LeftWingWeb2"] = Color3.fromRGB(103, 151, 200),
        ["LeftWingWeb3"] = Color3.fromRGB(103, 151, 200),
        ["LowerTeeth"] = Color3.fromRGB(103, 151, 200),
        ["RightFoot"] = Color3.fromRGB(103, 151, 200),
        ["RightHand"] = Color3.fromRGB(103, 151, 200),
        ["RightWingWeb"] = Color3.fromRGB(103, 151, 200),
        ["RightWingWeb2"] = Color3.fromRGB(103, 151, 200),
        ["RightWingWeb3"] = Color3.fromRGB(103, 151, 200),
        ["Tongue"] = Color3.fromRGB(103, 151, 200),
        ["TorsoSpikes"] = Color3.fromRGB(103, 151, 200),
        ["UpperTeeth"] = Color3.fromRGB(103, 151, 200)
    },
    ["already_has_flying_wings"] = true,
    ["hold_offset"] = CFrame.new(0, 0, 0),
    ["minimum_run_anim_speed"] = 1,
    ["mounted_animation_scale_limit"] = 1
}
v2.frost_dragon = v62
local v63 = {
    ["name"] = "Frost Fury",
    ["image"] = "rbxassetid://6060998707",
    ["model"] = "FrostFury",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "FrostFuryBeingDoubleHeld",
        ["eating"] = "FrostFuryEat",
        ["flying"] = "FrostFuryIdleMounted",
        ["hold"] = "FrostFuryBeingHeld",
        ["idle"] = "FrostFuryIdle",
        ["idle_mounted"] = "FrostFuryIdleMounted",
        ["running"] = "FrostFuryRun",
        ["running_mounted"] = "FrostFuryRunMounted",
        ["sit"] = "FrostFurySit",
        ["sleep"] = "FrostFurySleep"
    },
    ["tricks"] = {
        { "Sit", "FrostFurySit" },
        { "Joyful", "FrostFuryJoyful" },
        { "Beg", "FrostFuryBeg" },
        { "Jump", "FrostFuryJump" },
        { "Trick 1", "FrostFuryTrick1" },
        { "Trick 2", "FrostFuryTrick2" }
    },
    ["neon_parts"] = {
        ["IceStache"] = Color3.fromRGB(71, 142, 255),
        ["LeftEyeBrow"] = Color3.fromRGB(71, 142, 255),
        ["LeftHorn"] = Color3.fromRGB(71, 142, 255),
        ["RightEyeBrow"] = Color3.fromRGB(71, 142, 255),
        ["RightHorn"] = Color3.fromRGB(71, 142, 255),
        ["Spine1"] = Color3.fromRGB(71, 142, 255),
        ["Spine2"] = Color3.fromRGB(71, 142, 255),
        ["Spine3"] = Color3.fromRGB(71, 142, 255),
        ["Spine4"] = Color3.fromRGB(71, 142, 255),
        ["Spine5"] = Color3.fromRGB(71, 142, 255),
        ["Tail"] = Color3.fromRGB(71, 142, 255),
        ["Tail2"] = Color3.fromRGB(71, 142, 255),
        ["Tail3"] = Color3.fromRGB(71, 142, 255)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_fly_anim_speed"] = 0.5
}
v2.frost_fury = v63
local v64 = {
    ["name"] = "Ghost Bunny",
    ["image"] = "rbxassetid://5862774043",
    ["model"] = "GhostBunny",
    ["rarity"] = "ultra_rare",
    ["cost"] = 4000,
    ["currency_id"] = "candy_2020",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "GhostBunnyBeingDoubleHeld",
        ["eating"] = "GhostBunnyEat",
        ["flying"] = "GhostBunnyRun",
        ["hold"] = "GhostBunnyBeingHeld",
        ["idle"] = "GhostBunnyIdle",
        ["running"] = "GhostBunnyRun",
        ["sit"] = "GhostBunnySit",
        ["sleep"] = "GhostBunnySleep"
    },
    ["tricks"] = {
        { "Sit", "GhostBunnySit" },
        { "Joyful", "GhostBunnyJoyful" },
        { "Beg", "GhostBunnyBeg" },
        { "Jump", "GhostBunnyJump" },
        { "Trick 1", "GhostBunnyTrick1" },
        { "Trick 2", "GhostBunnyTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar5"] = Color3.fromRGB(102, 94, 199),
        ["LeftEar6"] = Color3.fromRGB(102, 94, 199),
        ["LeftEar7"] = Color3.fromRGB(102, 94, 199),
        ["Nose"] = Color3.fromRGB(102, 94, 199),
        ["RightEar5"] = Color3.fromRGB(102, 94, 199),
        ["RightEar6"] = Color3.fromRGB(102, 94, 199),
        ["RightEar7"] = Color3.fromRGB(102, 94, 199),
        ["Tail"] = Color3.fromRGB(102, 94, 199),
        ["Torso2"] = Color3.fromRGB(102, 94, 199)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_fly_anim_speed"] = 1
}
v2.ghost_bunny = v64
local v65 = {
    ["name"] = "Ginger Cat",
    ["image"] = "rbxassetid://4800190144",
    ["model"] = "GingerCat",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Star Rewards",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "GingerCatBeingDoubleHeld",
        ["eating"] = "GingerCatEating",
        ["hold"] = "GingerCatBeingHeld",
        ["idle"] = "GingerCatIdle",
        ["running"] = "GingerCatRunning",
        ["sit"] = "GingerCatSit",
        ["sleep"] = "GingerCatSleep"
    },
    ["tricks"] = {
        { "Sit", "GingerCatSit" },
        { "Lay down", "GingerCatSleep" },
        { "Joy", "GingerCatJoyful" },
        { "Bounce", "GingerCatJump" },
        { "Trick 1", "GingerCatTrick1" },
        { "Trick 2", "GingerCatTrick2" }
    },
    ["neon_parts"] = {
        ["HeadStripe"] = Color3.fromRGB(218, 134, 122),
        ["HeadStripe2"] = Color3.fromRGB(218, 134, 122),
        ["LeftEar2"] = Color3.fromRGB(218, 134, 122),
        ["LeftFoot"] = Color3.fromRGB(218, 134, 122),
        ["LeftHand"] = Color3.fromRGB(218, 134, 122),
        ["Nose"] = Color3.fromRGB(218, 134, 122),
        ["RightEar2"] = Color3.fromRGB(218, 134, 122),
        ["RightFoot"] = Color3.fromRGB(218, 134, 122),
        ["RightHand"] = Color3.fromRGB(218, 134, 122),
        ["Tail2"] = Color3.fromRGB(218, 134, 122),
        ["TorsoStripes"] = Color3.fromRGB(218, 134, 122),
        ["Whiskers"] = Color3.fromRGB(218, 134, 122)
    },
    ["hold_offset"] = CFrame.new(0, 1, 0),
    ["minimum_fly_anim_speed"] = 1
}
v2.ginger_cat = v65
local v66 = {
    ["name"] = "Giraffe",
    ["image"] = "rbxassetid://3409443710",
    ["model"] = "Giraffe",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Safari Egg",
        ["origin_items"] = { "safari_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DogIdle",
        ["running"] = "DogRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(200, 156, 125),
        ["LeftEar2"] = Color3.fromRGB(200, 156, 125),
        ["LeftFoot"] = Color3.fromRGB(200, 156, 125),
        ["LeftHand"] = Color3.fromRGB(200, 156, 125),
        ["RightEar2"] = Color3.fromRGB(200, 156, 125),
        ["RightFoot"] = Color3.fromRGB(200, 156, 125),
        ["RightHand"] = Color3.fromRGB(200, 156, 125),
        ["Tail2"] = Color3.fromRGB(200, 156, 125),
        ["Torso2"] = Color3.fromRGB(200, 156, 125)
    },
    ["mega_neon_colors"] = {
        Color3.fromRGB(85, 255, 187),
        Color3.fromRGB(75, 18, 232),
        Color3.fromRGB(197, 154, 74),
        Color3.fromRGB(211, 86, 83)
    },
    ["set"] = "safari"
}
v2.giraffe = v66
local v67 = {
    ["name"] = "Glyptodon",
    ["image"] = "rbxassetid://5721843587",
    ["model"] = "Glyptodon",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Fossil Isle",
        ["origin_items"] = { "fossil_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "GlyptodonBeingDoubleHeld",
        ["eating"] = "GlyptodonEat",
        ["hold"] = "GlyptodonBeingHeld",
        ["idle"] = "GlyptodonIdle",
        ["running"] = "GlyptodonRun",
        ["sit"] = "GlyptodonSit",
        ["sleep"] = "GlyptodonSleep"
    },
    ["tricks"] = {
        { "Sit", "GlyptodonSit" },
        { "Joyful", "GlyptodonJoyful" },
        { "Beg", "GlyptodonBeg" },
        { "Jump", "GlyptodonJump" },
        { "Trick 1", "GlyptodonTrick1" },
        { "Trick 2", "GlyptodonTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(95, 145, 225),
        ["LeftEar2"] = Color3.fromRGB(95, 145, 225),
        ["LeftFrontFoot"] = Color3.fromRGB(95, 145, 225),
        ["LeftbackFoot"] = Color3.fromRGB(95, 145, 225),
        ["RightEar2"] = Color3.fromRGB(95, 145, 225),
        ["RightFrontFoot"] = Color3.fromRGB(95, 145, 225),
        ["RightbackFoot"] = Color3.fromRGB(95, 145, 225),
        ["Tail1"] = Color3.fromRGB(95, 145, 225),
        ["Tail2"] = Color3.fromRGB(95, 145, 225),
        ["Tail3"] = Color3.fromRGB(95, 145, 225),
        ["Tongue"] = Color3.fromRGB(95, 145, 225),
        ["Torso3"] = Color3.fromRGB(95, 145, 225),
        ["Torso4"] = Color3.fromRGB(95, 145, 225)
    }
}
v2.glyptodon = v67
local v68 = {
    ["name"] = "Golden Dragon",
    ["image"] = "rbxassetid://4797806780",
    ["model"] = "GoldenDragon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Star Rewards",
        ["origin_items"] = { "golden_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DragonFlyIdle",
        ["idle_low"] = "DragonFlyIdleLow",
        ["running"] = "DragonFly",
        ["running_low"] = "DragonFlyLow",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["Fangs"] = Color3.fromRGB(110, 153, 202),
        ["Horns"] = Color3.fromRGB(110, 153, 202),
        ["LeftWing2"] = Color3.fromRGB(110, 153, 202),
        ["RightWing2"] = Color3.fromRGB(110, 153, 202),
        ["Torso2"] = Color3.fromRGB(110, 153, 202)
    },
    ["mega_neon_colors"] = { Color3.fromRGB(89, 100, 255), Color3.fromRGB(255, 225, 92) },
    ["already_has_flying_wings"] = true,
    ["minimum_run_anim_speed"] = 1,
    ["mounted_animation_scale_limit"] = 1
}
v2.golden_dragon = v68
local v69 = {
    ["name"] = "Golden Egg",
    ["image"] = "rbxassetid://4822753215",
    ["model"] = "GoldenEgg",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Star Rewards",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "EggIdle2",
        ["running"] = "EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 3
}
v2.golden_egg = v69
local v70 = {
    ["name"] = "Golden Griffin",
    ["image"] = "rbxassetid://6836687169",
    ["model"] = "GoldenGriffin",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Star Rewards",
        ["origin_items"] = { "golden_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DragonFlyIdle",
        ["idle_low"] = "DragonFlyIdleLow",
        ["running"] = "DragonFly",
        ["running_low"] = "DragonFlyLow",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(110, 153, 202),
        ["Brows"] = Color3.fromRGB(110, 153, 202),
        ["LeftWing1"] = Color3.fromRGB(110, 153, 202),
        ["RightWing1"] = Color3.fromRGB(110, 153, 202),
        ["Tail2"] = Color3.fromRGB(110, 153, 202)
    },
    ["mega_neon_colors"] = { Color3.fromRGB(89, 100, 255), Color3.fromRGB(255, 225, 92) },
    ["already_has_flying_wings"] = true,
    ["minimum_run_anim_speed"] = 1,
    ["mounted_animation_scale_limit"] = 1
}
v2.golden_griffin = v70
local v71 = {
    ["name"] = "Golden Ladybug",
    ["image"] = "rbxassetid://6404812772",
    ["model"] = "GoldenLadybug",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Farm Shop",
        ["origin_items"] = { "diamond_lavender" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "LadybugBeingDoubleHeld",
        ["eating"] = "LadybugEat",
        ["flying"] = "LadybugIdle",
        ["hold"] = "LadybugBeingHeld",
        ["idle"] = "LadybugIdle",
        ["running"] = "LadybugRun",
        ["sit"] = "LadybugSit",
        ["sleep"] = "LadybugSleep"
    },
    ["tricks"] = {
        { "Sit", "LadybugSit" },
        { "Joyful", "LadybugJoyful" },
        { "Beg", "LadybugBeg" },
        { "Jump", "LadybugJump" },
        { "Trick 1", "LadybugTrick1" },
        { "Trick 2", "LadybugTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(206, 109, 57),
        ["BackRightFoot"] = Color3.fromRGB(206, 109, 57),
        ["FrontLeftFoot"] = Color3.fromRGB(206, 109, 57),
        ["FrontRightFoot"] = Color3.fromRGB(206, 109, 57),
        ["LeftAntena"] = Color3.fromRGB(206, 109, 57),
        ["LeftSpots"] = Color3.fromRGB(206, 109, 57),
        ["LeftSpots2"] = Color3.fromRGB(206, 109, 57),
        ["LeftWingStem"] = Color3.fromRGB(206, 109, 57),
        ["MiddleLeftFoot"] = Color3.fromRGB(206, 109, 57),
        ["MiddleRightFoot"] = Color3.fromRGB(206, 109, 57),
        ["RightAntena"] = Color3.fromRGB(206, 109, 57),
        ["RightSpots"] = Color3.fromRGB(206, 109, 57),
        ["RightSpots2"] = Color3.fromRGB(206, 109, 57),
        ["RightWingStem"] = Color3.fromRGB(206, 109, 57)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "LeftEye", "RightEye" },
    ["minimum_fly_anim_speed"] = 0.5
}
v2.golden_ladybug = v71
local v72 = {
    ["name"] = "Golden Penguin",
    ["image"] = "rbxassetid://3710823011",
    ["model"] = "GoldenPenguin",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Ice Cream Parlor",
        ["origin_items"] = { "golden_goldfish" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "PenguinBeingDoubleHeld",
        ["eating"] = "PenguinEating",
        ["hold"] = "PenguinBeingHeld",
        ["idle"] = "PenguinIdle",
        ["running"] = "PenguinRunning",
        ["running_mounted"] = "PenguinRunning2",
        ["sit"] = "PenguinSit",
        ["sleep"] = "PenguinSleep"
    },
    ["tricks"] = {
        { "Sit", "PenguinSit" },
        { "Lay down", "PenguinSleep" },
        { "Beg", "PenguinBeg" },
        { "Headstand", "PenguinDig" },
        { "Dance 1", "PenguinDance1" },
        { "Dance 2", "PenguinDance2" }
    },
    ["neon_parts"] = {
        ["LeftWing"] = Color3.fromRGB(188, 113, 62),
        ["RightWing"] = Color3.fromRGB(188, 113, 62),
        ["Torso"] = Color3.fromRGB(188, 113, 62)
    },
    ["head_rotator_doesnt_rotate_while_moving"] = true,
    ["head_rotator_uses_torso_instead"] = true,
    ["hold_offset"] = CFrame.new(0, 1.2, 0),
    ["minimum_run_anim_speed"] = 1,
    ["set"] = "polar"
}
v2.golden_penguin = v72
local v73 = {
    ["name"] = "Golden Rat",
    ["image"] = "rbxassetid://4621220431",
    ["model"] = "GoldenRat",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = { "rat_box" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "RatBeingDoubleHeld",
        ["eating"] = "RatEating",
        ["hold"] = "RatBeingHeld",
        ["idle"] = "RatIdle",
        ["running"] = "RatRunning",
        ["sit"] = "RatSit",
        ["sleep"] = "RatSleep"
    },
    ["tricks"] = {
        { "Sit", "RatSit" },
        { "Lay down", "RatSleep" },
        { "Jump", "RatJump" },
        { "Beg", "RatBeg" },
        { "Dance 1", "RatTrick2" },
        { "Dance 2", "RatTrick3" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(234, 135, 96),
        ["LeftFoot"] = Color3.fromRGB(234, 135, 96),
        ["LeftHand"] = Color3.fromRGB(234, 135, 96),
        ["Nose"] = Color3.fromRGB(234, 135, 96),
        ["RightEar2"] = Color3.fromRGB(234, 135, 96),
        ["RightFoot"] = Color3.fromRGB(234, 135, 96),
        ["RightHand"] = Color3.fromRGB(234, 135, 96),
        ["Tail"] = Color3.fromRGB(234, 135, 96)
    },
    ["mega_neon_colors"] = {
        Color3.fromRGB(214, 146, 195),
        Color3.fromRGB(214, 101, 152),
        Color3.fromRGB(214, 74, 125),
        Color3.fromRGB(214, 74, 84)
    },
    ["hold_offset"] = CFrame.new(0, 1, -0.1)
}
v2.golden_rat = v73
local v74 = {
    ["name"] = "Golden Unicorn",
    ["image"] = "rbxassetid://4797806957",
    ["model"] = "GoldenUnicorn",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Star Rewards",
        ["origin_items"] = { "golden_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "RedPandaIdle",
        ["running"] = "RedPandaRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["Hair1"] = Color3.fromRGB(110, 153, 202),
        ["Hair2"] = Color3.fromRGB(110, 153, 202),
        ["Hair3"] = Color3.fromRGB(110, 153, 202),
        ["Horn"] = Color3.fromRGB(110, 153, 202),
        ["LeftEar2"] = Color3.fromRGB(110, 153, 202),
        ["RightEar2"] = Color3.fromRGB(110, 153, 202),
        ["Tail"] = Color3.fromRGB(110, 153, 202)
    },
    ["mega_neon_colors"] = { Color3.fromRGB(89, 100, 255), Color3.fromRGB(255, 225, 92) }
}
v2.golden_unicorn = v74
local v75 = {
    ["name"] = "Goldhorn",
    ["image"] = "rbxassetid://7126722445",
    ["model"] = "Goldhorn",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Mythic Egg",
        ["origin_items"] = { "mythic_egg" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "GoldhornBeingDoubleHeld",
        ["eating"] = "GoldhornEat",
        ["hold"] = "GoldhornBeingHeld",
        ["idle"] = "GoldhornIdle",
        ["running"] = "GoldhornRun",
        ["sit"] = "GoldhornSit",
        ["sleep"] = "GoldhornSleep"
    },
    ["tricks"] = {
        { "Sit", "GoldhornSit" },
        { "Joyful", "GoldhornJoyful" },
        { "Beg", "GoldhornBeg" },
        { "Jump", "GoldhornJump" },
        { "Trick 1", "GoldhornTrick1" },
        { "Trick 2", "GoldhornTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(185, 169, 86),
        ["BackRightFoot"] = Color3.fromRGB(185, 169, 86),
        ["FrontLeftFoot"] = Color3.fromRGB(185, 169, 86),
        ["FrontRightFoot"] = Color3.fromRGB(185, 169, 86),
        ["Horns"] = Color3.fromRGB(185, 169, 86),
        ["Ring1"] = Color3.fromRGB(185, 169, 86),
        ["Torso10"] = Color3.fromRGB(185, 169, 86)
    }
}
v2.goldhorn = v75
local v76 = {
    ["name"] = "Griffin",
    ["image"] = "rbxassetid://3181727727",
    ["model"] = "Griffin",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Pet Shop",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DragonFlyIdle",
        ["idle_low"] = "DragonFlyIdleLow",
        ["running"] = "DragonFly",
        ["running_low"] = "DragonFlyLow",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(204, 142, 105),
        ["LeftFoot"] = Color3.fromRGB(204, 142, 105),
        ["LeftHand"] = Color3.fromRGB(204, 142, 105),
        ["RightFoot"] = Color3.fromRGB(204, 142, 105),
        ["RightHand"] = Color3.fromRGB(204, 142, 105),
        ["Tail2"] = Color3.fromRGB(159, 243, 233)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_run_anim_speed"] = 1,
    ["mounted_animation_scale_limit"] = 1
}
v2.griffin = v76
local v77 = {
    ["name"] = "Ground Sloth",
    ["image"] = "rbxassetid://5721843483",
    ["model"] = "GroundSloth",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Fossil Isle",
        ["origin_items"] = { "fossil_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "GroundSlothBeingDoubleHeld",
        ["eating"] = "GroundSlothEat",
        ["hold"] = "GroundSlothBeingHeld",
        ["idle"] = "GroundSlothIdle",
        ["running"] = "GroundSlothRun",
        ["sit"] = "GroundSlothSit",
        ["sleep"] = "GroundSlothSleep"
    },
    ["tricks"] = {
        { "Sit", "GroundSlothSit" },
        { "Joyful", "GroundSlothJoyful" },
        { "Beg", "GroundSlothBeg" },
        { "Jump", "GroundSlothJump" },
        { "Trick 1", "GroundSlothTrick1" },
        { "Trick 2", "GroundSlothTrick2" }
    },
    ["neon_parts"] = {
        ["LeftClaws"] = Color3.fromRGB(69, 107, 231),
        ["LeftFoot"] = Color3.fromRGB(69, 107, 231),
        ["LeftInnerEar"] = Color3.fromRGB(69, 107, 231),
        ["Nose"] = Color3.fromRGB(69, 107, 231),
        ["RightClaws"] = Color3.fromRGB(69, 107, 231),
        ["RightFoot"] = Color3.fromRGB(69, 107, 231),
        ["RightInnerEar"] = Color3.fromRGB(69, 107, 231),
        ["Tail1"] = Color3.fromRGB(69, 107, 231),
        ["Tail2"] = Color3.fromRGB(69, 107, 231),
        ["Tail3"] = Color3.fromRGB(69, 107, 231),
        ["Torso2"] = Color3.fromRGB(69, 107, 231)
    }
}
v2.ground_sloth = v77
local v78 = {
    ["name"] = "Guardian Lion",
    ["image"] = "rbxassetid://6240249282",
    ["model"] = "GuardianLion",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = {},
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "GuardianLionBeingDoubleHeld",
        ["eating"] = "GuardianLionEat",
        ["hold"] = "GuardianLionBeingHeld",
        ["idle"] = "GuardianLionIdle",
        ["running"] = "GuardianLionRun",
        ["sit"] = "GuardianLionSit",
        ["sleep"] = "GuardianLionSleep"
    },
    ["tricks"] = {
        { "Sit", "GuardianLionSit" },
        { "Joyful", "GuardianLionJoyful" },
        { "Beg", "GuardianLionBeg" },
        { "Jump", "GuardianLionJump" },
        { "Trick 1", "GuardianLionTrick1" },
        { "Trick 2", "GuardianLionTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(193, 182, 53),
        ["BackRightFoot"] = Color3.fromRGB(193, 182, 53),
        ["EyeBrow_R_2"] = Color3.fromRGB(193, 182, 53),
        ["Eyebrow_L_2"] = Color3.fromRGB(193, 182, 53),
        ["FrontLeftFoot"] = Color3.fromRGB(193, 182, 53),
        ["FrontRightFoot"] = Color3.fromRGB(193, 182, 53),
        ["Hip_L_2"] = Color3.fromRGB(193, 182, 53),
        ["Hip_R_2"] = Color3.fromRGB(193, 182, 53),
        ["Main_1_1"] = Color3.fromRGB(193, 182, 53),
        ["Main_2_1"] = Color3.fromRGB(193, 182, 53),
        ["Main_3_1"] = Color3.fromRGB(193, 182, 53),
        ["Shoulder_L_2"] = Color3.fromRGB(193, 182, 53),
        ["Shoulder_R_2"] = Color3.fromRGB(193, 182, 53),
        ["Tail5"] = Color3.fromRGB(193, 182, 53),
        ["TailSpike_1"] = Color3.fromRGB(193, 182, 53),
        ["TailSpike_2"] = Color3.fromRGB(193, 182, 53),
        ["TailSpike_3"] = Color3.fromRGB(193, 182, 53),
        ["TailSpike_4"] = Color3.fromRGB(193, 182, 53),
        ["TorsoFlame_C1"] = Color3.fromRGB(193, 182, 53),
        ["TorsoFlame_C2"] = Color3.fromRGB(193, 182, 53),
        ["TorsoFlame_C3"] = Color3.fromRGB(193, 182, 53),
        ["Whisker_L"] = Color3.fromRGB(193, 182, 53),
        ["Whisker_R"] = Color3.fromRGB(193, 182, 53)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.guardian_lion = v78
local v79 = {
    ["name"] = "Horse",
    ["image"] = "rbxassetid://3181727813",
    ["model"] = "Horse",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Pet Shop",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "RedPandaIdle",
        ["running"] = "RedPandaRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["Hair1"] = Color3.fromRGB(110, 153, 202),
        ["Hair2"] = Color3.fromRGB(110, 153, 202),
        ["Hair3"] = Color3.fromRGB(110, 153, 202),
        ["LeftEar2"] = Color3.fromRGB(110, 153, 202),
        ["LeftFoot"] = Color3.fromRGB(110, 153, 202),
        ["LeftHand"] = Color3.fromRGB(110, 153, 202),
        ["RightEar2"] = Color3.fromRGB(110, 153, 202),
        ["RightFoot"] = Color3.fromRGB(110, 153, 202),
        ["RightHand"] = Color3.fromRGB(110, 153, 202),
        ["Tail"] = Color3.fromRGB(110, 153, 202)
    }
}
v2.horse = v79
local v80 = {
    ["name"] = "Hydra",
    ["image"] = "rbxassetid://7126720389",
    ["model"] = "Hydra",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Mythic Egg",
        ["origin_items"] = { "mythic_egg" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "HydraBeingDoubleHeld",
        ["eating"] = "HydraEat",
        ["hold"] = "HydraBeingHeld",
        ["idle"] = "HydraIdle",
        ["running"] = "HydraRun",
        ["sit"] = "HydraSit",
        ["sleep"] = "HydraSleep"
    },
    ["tricks"] = {
        { "Sit", "HydraSit" },
        { "Joyful", "HydraJoyful" },
        { "Beg", "HydraBeg" },
        { "Jump", "HydraJump" },
        { "Trick 1", "HydraTrick1" },
        { "Trick 2", "HydraTrick2" }
    },
    ["neon_parts"] = {
        ["Tail"] = Color3.fromRGB(110, 153, 202)
    },
    ["eyes"] = { "Eyes3" }
}
v2.hydra = v80
local v81 = {
    ["name"] = "Hyena",
    ["image"] = "rbxassetid://3409444089",
    ["model"] = "Hyena",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Safari Egg",
        ["origin_items"] = { "safari_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DogIdle",
        ["running"] = "DogRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["Hair"] = Color3.fromRGB(204, 142, 105),
        ["LeftEar2"] = Color3.fromRGB(204, 142, 105),
        ["LeftFoot"] = Color3.fromRGB(204, 142, 105),
        ["LeftHand"] = Color3.fromRGB(204, 142, 105),
        ["Nose"] = Color3.fromRGB(204, 142, 105),
        ["RightEar2"] = Color3.fromRGB(204, 142, 105),
        ["RightFoot"] = Color3.fromRGB(204, 142, 105),
        ["RightHand"] = Color3.fromRGB(204, 142, 105),
        ["Spots"] = Color3.fromRGB(204, 142, 105),
        ["Tail"] = Color3.fromRGB(204, 142, 105)
    },
    ["set"] = "safari"
}
v2.hyena = v81
local v82 = {
    ["name"] = "Jungle Egg",
    ["image"] = "rbxassetid://3743740864",
    ["model"] = "JungleEgg",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Jungle Egg",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "EggIdle2",
        ["running"] = "EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 6
}
v2.jungle_egg = v82
local v83 = {
    ["name"] = "Kangaroo",
    ["image"] = "rbxassetid://4708551306",
    ["model"] = "Kangaroo",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Aussie Egg",
        ["origin_items"] = { "aussie_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "KangarooBeingDoubleHeld",
        ["eating"] = "KangarooEating",
        ["hold"] = "KangarooBeingHeld",
        ["idle"] = "KangarooIdle",
        ["running"] = "KangarooRunningOnSpot",
        ["sit"] = "KangarooSit",
        ["sleep"] = "KangarooSleep"
    },
    ["tricks"] = {
        { "Sit", "KangarooSit" },
        { "Lay down", "KangarooSleep" },
        { "Jump", "KangarooJump" },
        { "Beg", "KangarooBeg" },
        { "Trick 1", "KangarooTrick1" },
        { "Trick 2", "KangarooTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(188, 155, 93),
        ["LeftFoot"] = Color3.fromRGB(188, 155, 93),
        ["Nose"] = Color3.fromRGB(188, 155, 93),
        ["RightEar2"] = Color3.fromRGB(188, 155, 93),
        ["RightFoot"] = Color3.fromRGB(188, 155, 93),
        ["Tail"] = Color3.fromRGB(188, 155, 93)
    },
    ["mega_neon_colors"] = {
        Color3.fromRGB(139, 153, 255),
        Color3.fromRGB(232, 146, 214),
        Color3.fromRGB(171, 67, 197),
        Color3.fromRGB(95, 95, 211)
    },
    ["hold_double_offset"] = CFrame.new(0, 0.3, 0),
    ["hold_offset"] = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0, 1, -0.1)
}
v2.kangaroo = v83
local v84 = {
    ["name"] = "Australian Kelpie",
    ["image"] = "rbxassetid://4736656915",
    ["model"] = "AustralianKelpie",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Aussie Egg",
        ["origin_items"] = { "aussie_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DogIdle",
        ["running"] = "RedPandaRunning",
        ["sit"] = "ReindeerSit",
        ["sleep"] = "KelpieSleep"
    },
    ["tricks"] = {
        { "Sit", "ReindeerSit" },
        { "Lay down", "KelpieSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "WolfRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance 2", "KelpieTrick1" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(116, 117, 196),
        ["LeftEar2"] = Color3.fromRGB(116, 117, 196),
        ["LeftFoot"] = Color3.fromRGB(116, 117, 196),
        ["LeftHand"] = Color3.fromRGB(116, 117, 196),
        ["RightEar2"] = Color3.fromRGB(116, 117, 196),
        ["RightFoot"] = Color3.fromRGB(116, 117, 196),
        ["RightHand"] = Color3.fromRGB(116, 117, 196),
        ["Torso"] = Color3.fromRGB(116, 117, 196)
    },
    ["hold_double_offset"] = CFrame.new(),
    ["hold_offset"] = CFrame.new(0, 1, -0.1)
}
v2.kelpie = v84
local v85 = {
    ["name"] = "King Bee",
    ["image"] = "rbxassetid://4281674580",
    ["model"] = "KingBee",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Coffee Shop",
        ["origin_items"] = { "honey" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "BeeBeingDoubleHeld",
        ["eating"] = "BeeEating",
        ["hold"] = "BeeBeingHeld",
        ["idle"] = "BeeIdle",
        ["running"] = "BeeRunning",
        ["running_low"] = "BeeRunningLow",
        ["sit"] = "BeeSit",
        ["sleep"] = "BeeSleep"
    },
    ["tricks"] = {
        { "Sit", "BeeSit" },
        { "Lay Down", "BeeSleep" },
        { "Joy", "BeeJoyful" },
        { "Jump", "BeeJump" },
        { "Sideflip", "BeeTrick1" },
        { "Spin", "BeeTrick2" }
    },
    ["neon_parts"] = {
        ["LeftAntenna"] = Color3.fromRGB(255, 127, 67),
        ["LeftFoot"] = Color3.fromRGB(255, 127, 67),
        ["LeftHand"] = Color3.fromRGB(255, 127, 67),
        ["LeftWing"] = Color3.fromRGB(255, 127, 67),
        ["RightAntenna"] = Color3.fromRGB(255, 127, 67),
        ["RightFoot"] = Color3.fromRGB(255, 127, 67),
        ["RightHand"] = Color3.fromRGB(255, 127, 67),
        ["RightWing"] = Color3.fromRGB(255, 127, 67),
        ["Torso"] = Color3.fromRGB(255, 127, 67)
    },
    ["mega_neon_colors"] = {
        Color3.fromRGB(255, 220, 152),
        Color3.fromRGB(85, 255, 187),
        Color3.fromRGB(95, 88, 232),
        Color3.fromRGB(213, 61, 190),
        Color3.fromRGB(211, 42, 104)
    },
    ["already_has_flying_wings"] = true,
    ["hold_offset"] = CFrame.new(0, 0.6, 0),
    ["minimum_run_anim_speed"] = 1,
    ["mounted_animation_scale_limit"] = 1,
    ["mounted_fly_forward_tilt_compensation"] = -15
}
v2.king_bee = v85
local v86 = {
    ["name"] = "Kirin",
    ["image"] = "rbxassetid://6998403122",
    ["model"] = "Kirin",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Mythic Egg",
        ["origin_items"] = { "mythic_egg" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "KirinBeingDoubleHeld",
        ["eating"] = "KirinEat",
        ["hold"] = "KirinBeingHeld",
        ["idle"] = "KirinIdle",
        ["running"] = "KirinRun",
        ["sit"] = "KirinSit",
        ["sleep"] = "KirinSleep"
    },
    ["tricks"] = {
        { "Sit", "KirinSit" },
        { "Joyful", "KirinJoyful" },
        { "Beg", "KirinBeg" },
        { "Jump", "KirinJump" },
        { "Trick 1", "KirinTrick1" },
        { "Trick 2", "KirinTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(125, 168, 102),
        ["Head3"] = Color3.fromRGB(255, 182, 130),
        ["Mane"] = Color3.fromRGB(125, 168, 102),
        ["Mane2"] = Color3.fromRGB(125, 168, 102),
        ["Mane3"] = Color3.fromRGB(125, 168, 102),
        ["TailTip"] = Color3.fromRGB(255, 182, 130),
        ["Torso3"] = Color3.fromRGB(125, 168, 102)
    }
}
v2.kirin = v86
local v87 = {
    ["name"] = "Kitsune",
    ["image"] = "rbxassetid://5307473113",
    ["model"] = "Kitsune",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Pet Shop",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "KitsuneBeingDoubleHeld",
        ["eating"] = "KitsuneEat",
        ["hold"] = "KitsuneBeingHeld",
        ["idle"] = "KitsuneIdle",
        ["running"] = "KitsuneRun",
        ["running_mounted"] = "KitsuneRunRide",
        ["sit"] = "KitsuneSit",
        ["sleep"] = "KitsuneSleep"
    },
    ["tricks"] = {
        { "Sit", "KitsuneSit" },
        { "Joyful", "KitsuneJoyful" },
        { "Beg", "KitsuneBeg" },
        { "Jump", "KitsuneJump" },
        { "Trick 1", "KitsuneTrick1" },
        { "Trick 2", "KitsuneTrick2" }
    },
    ["neon_parts"] = {
        ["InnerEarL"] = Color3.fromRGB(101, 154, 199),
        ["InnerEarL2"] = Color3.fromRGB(101, 154, 199),
        ["InnerEarR"] = Color3.fromRGB(101, 154, 199),
        ["InnerEarR2"] = Color3.fromRGB(101, 154, 199),
        ["LeftFoot"] = Color3.fromRGB(101, 154, 199),
        ["LeftHand"] = Color3.fromRGB(101, 154, 199),
        ["Marking1"] = Color3.fromRGB(101, 154, 199),
        ["Marking2"] = Color3.fromRGB(101, 154, 199),
        ["Nose"] = Color3.fromRGB(101, 154, 199),
        ["RightFoot"] = Color3.fromRGB(101, 154, 199),
        ["RightHand"] = Color3.fromRGB(101, 154, 199),
        ["Tail1Tip4"] = Color3.fromRGB(87, 148, 189),
        ["Tail2Tip4"] = Color3.fromRGB(90, 128, 199),
        ["Tail3Tip4"] = Color3.fromRGB(90, 128, 199),
        ["Tail4Tip4"] = Color3.fromRGB(119, 175, 212),
        ["Tail5Tip4"] = Color3.fromRGB(119, 175, 212),
        ["Tail6Tip4"] = Color3.fromRGB(101, 154, 199),
        ["Tail7Tip4"] = Color3.fromRGB(101, 154, 199),
        ["Torso2"] = Color3.fromRGB(101, 154, 199)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.kitsune = v87
local v88 = {
    ["name"] = "Koala",
    ["image"] = "rbxassetid://4708551284",
    ["model"] = "Koala",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Aussie Egg",
        ["origin_items"] = { "aussie_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "BearBeingDoubleHeld",
        ["eating"] = "BearEating",
        ["hold"] = "BearBeingHeld",
        ["idle"] = "BearIdle",
        ["running"] = "BearRunning",
        ["sit"] = "BearSit",
        ["sleep"] = "BearSleep"
    },
    ["tricks"] = {
        { "Sit", "BearSit" },
        { "Lay down", "BearSleep" },
        { "Beg", "BearBeg" },
        { "Bounce", "BearJump" },
        { "Dance 1", "KoalaTrick1" },
        { "Dance 2", "BearTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEAr2"] = Color3.fromRGB(128, 187, 219),
        ["LeftFoot"] = Color3.fromRGB(128, 187, 219),
        ["Nose"] = Color3.fromRGB(128, 187, 219),
        ["RightEar2"] = Color3.fromRGB(128, 187, 219),
        ["RightFoot"] = Color3.fromRGB(128, 187, 219),
        ["Tail"] = Color3.fromRGB(128, 187, 219)
    },
    ["hold_double_offset"] = CFrame.new(0, 0.3, 0),
    ["hold_offset"] = CFrame.new(0, 0.6, 0)
}
v2.koala = v88
local v89 = {
    ["name"] = "Ladybug",
    ["image"] = "rbxassetid://6404812664",
    ["model"] = "Ladybug",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Farm Shop",
        ["origin_items"] = { "diamond_lavender" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "LadybugBeingDoubleHeld",
        ["eating"] = "LadybugEat",
        ["flying"] = "LadybugIdle",
        ["hold"] = "LadybugBeingHeld",
        ["idle"] = "LadybugIdle",
        ["running"] = "LadybugRun",
        ["sit"] = "LadybugSit",
        ["sleep"] = "LadybugSleep"
    },
    ["tricks"] = {
        { "Sit", "LadybugSit" },
        { "Joyful", "LadybugJoyful" },
        { "Beg", "LadybugBeg" },
        { "Jump", "LadybugJump" },
        { "Trick 1", "LadybugTrick1" },
        { "Trick 2", "LadybugTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(108, 129, 183),
        ["BackRightFoot"] = Color3.fromRGB(108, 129, 183),
        ["FrontLeftFoot"] = Color3.fromRGB(108, 129, 183),
        ["FrontRightFoot"] = Color3.fromRGB(108, 129, 183),
        ["LeftAntena"] = Color3.fromRGB(108, 129, 183),
        ["LeftSpots"] = Color3.fromRGB(108, 129, 183),
        ["LeftSpots2"] = Color3.fromRGB(108, 129, 183),
        ["LeftWingStem"] = Color3.fromRGB(108, 129, 183),
        ["MiddleLeftFoot"] = Color3.fromRGB(108, 129, 183),
        ["MiddleRightFoot"] = Color3.fromRGB(108, 129, 183),
        ["RightAntena"] = Color3.fromRGB(108, 129, 183),
        ["RightSpots"] = Color3.fromRGB(108, 129, 183),
        ["RightSpots2"] = Color3.fromRGB(108, 129, 183),
        ["RightWingStem"] = Color3.fromRGB(108, 129, 183)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "LeftEye", "RightEye" },
    ["minimum_fly_anim_speed"] = 0.5
}
v2.ladybug = v89
local v90 = {
    ["name"] = "Lamb",
    ["image"] = "rbxassetid://6684832189",
    ["model"] = "Lamb",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Easter",
        ["origin_items"] = {},
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "LambBeingDoubleHeld",
        ["eating"] = "LambEat",
        ["hold"] = "LambBeingHeld",
        ["idle"] = "LambIdle",
        ["running"] = "LambRun",
        ["sit"] = "LambSit",
        ["sleep"] = "LambSleep"
    },
    ["tricks"] = {
        { "Sit", "LambSit" },
        { "Joyful", "LambJoyful" },
        { "Beg", "LambBeg" },
        { "Jump", "LambJump" },
        { "Trick 1", "LambTrick1" },
        { "Trick 2", "LambTrick2" }
    },
    ["neon_parts"] = {
        ["Headpiece"] = Color3.fromRGB(100, 188, 95),
        ["Tail"] = Color3.fromRGB(100, 188, 95),
        ["Tail2"] = Color3.fromRGB(100, 188, 95),
        ["Torso2"] = Color3.fromRGB(100, 188, 95)
    },
    ["minimum_run_anim_speed"] = 0.3
}
v2.lamb = v90
local v91 = {
    ["name"] = "Lavender Dragon",
    ["image"] = "rbxassetid://8704877940",
    ["model"] = "LavenderDragon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "DJ Gamepass",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DragonFlyIdle",
        ["idle_low"] = "DragonFlyIdleLow",
        ["running"] = "DragonFly",
        ["running_low"] = "DragonFlyLow",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["Fangs"] = Color3.fromRGB(171, 95, 186),
        ["Horns"] = Color3.fromRGB(171, 95, 186),
        ["LeftWing2"] = Color3.fromRGB(171, 95, 186),
        ["RightWing2"] = Color3.fromRGB(171, 95, 186),
        ["Torso2"] = Color3.fromRGB(171, 95, 186)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_run_anim_speed"] = 1,
    ["mounted_animation_scale_limit"] = 1
}
v2.lavender_dragon = v91
local v92 = {
    ["name"] = "Lion",
    ["image"] = "rbxassetid://3409443801",
    ["model"] = "Lion",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Safari Egg",
        ["origin_items"] = { "safari_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DogIdle",
        ["running"] = "DogRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(248, 248, 248),
        ["LeftFoot"] = Color3.fromRGB(248, 248, 248),
        ["LeftHand"] = Color3.fromRGB(248, 248, 248),
        ["Nose"] = Color3.fromRGB(248, 248, 248),
        ["RightEar2"] = Color3.fromRGB(248, 248, 248),
        ["RightFoot"] = Color3.fromRGB(248, 248, 248),
        ["RightHand"] = Color3.fromRGB(248, 248, 248),
        ["Tail2"] = Color3.fromRGB(248, 248, 248)
    },
    ["set"] = "safari"
}
v2.lion = v92
local v93 = {
    ["name"] = "Llama",
    ["image"] = "rbxassetid://4440867249",
    ["model"] = "Llama",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Farm Egg",
        ["origin_items"] = { "farm_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "LlamaBeingDoubleHeld",
        ["eating"] = "LlamaEating",
        ["hold"] = "LlamaBeingHeld",
        ["idle"] = "LlamaIdle",
        ["running"] = "LlamaRunning",
        ["sit"] = "LlamaSit",
        ["sleep"] = "LlamaSleep"
    },
    ["tricks"] = {
        { "Sit", "LlamaSit" },
        { "Lay down", "LlamaSleep" },
        { "Bounce", "LlamaJump" },
        { "Joy", "LlamaJoyful" },
        { "Dance 1", "LlamaTrick1" },
        { "Dance 2", "LlamaTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(194, 98, 34),
        ["LeftFoot"] = Color3.fromRGB(194, 98, 34),
        ["LeftHand"] = Color3.fromRGB(194, 98, 34),
        ["Nose"] = Color3.fromRGB(194, 98, 34),
        ["RightEar2"] = Color3.fromRGB(194, 98, 34),
        ["RightFoot"] = Color3.fromRGB(194, 98, 34),
        ["RightHand"] = Color3.fromRGB(194, 98, 34)
    },
    ["hold_offset"] = CFrame.new(0, 0.7, 0)
}
v2.llama = v93
local v94 = {
    ["name"] = "Lunar Ox",
    ["image"] = "rbxassetid://6245080170",
    ["model"] = "LunarOx",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = { "ox_box" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "OxBeingDoubleHeld",
        ["eating"] = "OxEat",
        ["hold"] = "OxBeingHeld",
        ["idle"] = "OxIdle",
        ["running"] = "OxRun",
        ["sit"] = "OxSit",
        ["sleep"] = "OxSleep"
    },
    ["tricks"] = {
        { "Sit", "OxSit" },
        { "Joyful", "OxJoyful" },
        { "Beg", "OxBeg" },
        { "Jump", "OxJump" },
        { "Trick 1", "OxTrick1" },
        { "Trick 2", "OxTrick2" }
    },
    ["neon_parts"] = {
        ["Head4"] = Color3.fromRGB(109, 184, 77),
        ["Horns"] = Color3.fromRGB(109, 184, 77),
        ["LeftEar2"] = Color3.fromRGB(109, 184, 77),
        ["Neck2"] = Color3.fromRGB(109, 184, 77),
        ["NoseRing"] = Color3.fromRGB(109, 184, 77),
        ["NotANeck"] = Color3.fromRGB(109, 184, 77),
        ["RightEar2"] = Color3.fromRGB(109, 184, 77),
        ["Tail5"] = Color3.fromRGB(109, 184, 77)
    }
}
v2.lunar_ox = v94
local v95 = {
    ["name"] = "Lynx",
    ["image"] = "rbxassetid://6060991172",
    ["model"] = "Lynx",
    ["rarity"] = "rare",
    ["cost"] = 4000,
    ["currency_id"] = "gingerbread_2020",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "LynxBeingDoubleHeld",
        ["eating"] = "LynxEat",
        ["hold"] = "LynxBeingHeld",
        ["idle"] = "LynxIdle",
        ["running"] = "LynxRun",
        ["sit"] = "LynxSit",
        ["sleep"] = "LynxSleep"
    },
    ["tricks"] = {
        { "Sit", "LynxSit" },
        { "Joyful", "LynxJoyful" },
        { "Beg", "LynxBeg" },
        { "Jump", "LynxJump" },
        { "Trick 1", "LynxTrick1" },
        { "Trick 2", "LynxTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(85, 152, 188),
        ["Head3"] = Color3.fromRGB(85, 152, 188),
        ["LeftEar3"] = Color3.fromRGB(85, 152, 188),
        ["LeftEar4"] = Color3.fromRGB(85, 152, 188),
        ["LeftEar5"] = Color3.fromRGB(85, 152, 188),
        ["RightEar3"] = Color3.fromRGB(85, 152, 188),
        ["RightEar4"] = Color3.fromRGB(85, 152, 188),
        ["RightEar5"] = Color3.fromRGB(85, 152, 188),
        ["Tail2"] = Color3.fromRGB(85, 152, 188),
        ["Torso3"] = Color3.fromRGB(85, 152, 188),
        ["tuft_04"] = Color3.fromRGB(85, 152, 188),
        ["tuft_06"] = Color3.fromRGB(85, 152, 188)
    }
}
v2.lynx = v95
local v96 = {
    ["name"] = "Meerkat",
    ["image"] = "rbxassetid://3409443617",
    ["model"] = "Meerkat",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Safari Egg",
        ["origin_items"] = { "safari_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "MeerkatBeingDoubleHeld",
        ["eating"] = "MeerkatEating",
        ["hold"] = "MeerkatBeingHeld",
        ["idle"] = "MeerkatIdle",
        ["idle_mounted"] = "MeerkatIdleHorizontal",
        ["running"] = "MeerkatRunning",
        ["sit"] = "MeerkatSit",
        ["sleep"] = "MeerkatSleep"
    },
    ["tricks"] = {
        { "Sit", "MeerkatSit" },
        { "Lay down", "MeerkatSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "MeerkatRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "MeerkatDance2" }
    },
    ["neon_parts"] = {
        ["LeftEar"] = Color3.fromRGB(110, 153, 202),
        ["LeftFoot"] = Color3.fromRGB(110, 153, 202),
        ["LeftHand"] = Color3.fromRGB(110, 153, 202),
        ["Nose2"] = Color3.fromRGB(110, 153, 202),
        ["RightEar2"] = Color3.fromRGB(110, 153, 202),
        ["RightFoot"] = Color3.fromRGB(110, 153, 202),
        ["RightHand"] = Color3.fromRGB(110, 153, 202)
    },
    ["hold_offset"] = CFrame.new(-0.15, 0.3, -0.7) * CFrame.Angles(-1.5707963267948966, 1.5707963267948966, 0),
    ["set"] = "safari"
}
v2.meerkat = v96
local v97 = {
    ["name"] = "Merhorse",
    ["image"] = "rbxassetid://6998402749",
    ["model"] = "Merhorse",
    ["rarity"] = "rare"
}
local v98 = {
    ["origin"] = "Mythic Egg",
    ["origin_items"] = { "mythic_egg" },
    ["viewport_override"] = {
        ["distance"] = 3.5,
        ["offset"] = CFrame.new(0, 1, 0)
    },
    ["year"] = 2021
}
v97.origin_entry = v98
v97.anims = {
    ["double_hold"] = "MerhorseBeingDoubleHeld",
    ["eating"] = "MerhorseEat",
    ["hold"] = "MerhorseBeingHeld",
    ["idle"] = "MerhorseIdle",
    ["running"] = "MerhorseRun",
    ["sit"] = "MerhorseSit",
    ["sleep"] = "MerhorseSleep"
}
v97.tricks = {
    { "Sit", "MerhorseSit" },
    { "Joyful", "MerhorseJoyful" },
    { "Beg", "MerhorseBeg" },
    { "Jump", "MerhorseJump" },
    { "Trick 1", "MerhorseTrick1" },
    { "Trick 2", "MerhorseTrick2" }
}
v97.neon_parts = {
    ["BottomLeftFin"] = Color3.fromRGB(181, 173, 173),
    ["BottomRightFin"] = Color3.fromRGB(181, 173, 173),
    ["Hair"] = Color3.fromRGB(181, 173, 173),
    ["LeftEar2"] = Color3.fromRGB(181, 173, 173),
    ["LeftFootFin"] = Color3.fromRGB(181, 173, 173),
    ["LeftWing"] = Color3.fromRGB(181, 173, 173),
    ["RightEar2"] = Color3.fromRGB(181, 173, 173),
    ["RightFootFin"] = Color3.fromRGB(181, 173, 173),
    ["RightWing"] = Color3.fromRGB(181, 173, 173),
    ["Tail"] = Color3.fromRGB(181, 173, 173),
    ["TopLeftFin"] = Color3.fromRGB(181, 173, 173),
    ["TopRightFin"] = Color3.fromRGB(181, 173, 173),
    ["Torso2"] = Color3.fromRGB(181, 173, 173)
}
v2.merhorse = v97
local v99 = {
    ["name"] = "Metal Ox",
    ["image"] = "rbxassetid://6245080265",
    ["model"] = "MetalOx",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = { "ox_box" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "OxBeingDoubleHeld",
        ["eating"] = "OxEat",
        ["hold"] = "OxBeingHeld",
        ["idle"] = "OxIdle",
        ["running"] = "OxRun",
        ["sit"] = "OxSit",
        ["sleep"] = "OxSleep"
    },
    ["tricks"] = {
        { "Sit", "OxSit" },
        { "Joyful", "OxJoyful" },
        { "Beg", "OxBeg" },
        { "Jump", "OxJump" },
        { "Trick 1", "OxTrick1" },
        { "Trick 2", "OxTrick2" }
    },
    ["neon_parts"] = {
        ["Head4"] = Color3.fromRGB(89, 113, 198),
        ["Horns"] = Color3.fromRGB(89, 113, 198),
        ["LeftEar2"] = Color3.fromRGB(89, 113, 198),
        ["Neck2"] = Color3.fromRGB(89, 113, 198),
        ["NoseRing"] = Color3.fromRGB(89, 113, 198),
        ["NotANeck"] = Color3.fromRGB(89, 113, 198),
        ["RightEar2"] = Color3.fromRGB(89, 113, 198),
        ["Tail5"] = Color3.fromRGB(89, 113, 198)
    }
}
v2.metal_ox = v99
local v100 = {
    ["name"] = "Monkey",
    ["image"] = "rbxassetid://5067924710",
    ["model"] = "Monkey",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Monkey Fairground",
        ["origin_items"] = { "monkey_box", "premium_monkey_box" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "MonkeyHold2",
        ["eating"] = "MonkeyEat",
        ["hold"] = "MonkeyHold1",
        ["idle"] = "MonkeyIdle",
        ["running"] = "MonkeyRun",
        ["sit"] = "MonkeySit",
        ["sleep"] = "MonkeySleep"
    },
    ["tricks"] = {
        { "Sit", "MonkeySit" },
        { "Lay down", "MonkeySleep" },
        { "Beg", "MonkeyBeg" },
        { "Joyful", "MonkeyJoyful" },
        { "Trick 1", "MonkeyTrick1" },
        { "Trick 2", "MonkeyTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(191, 149, 119),
        ["LeftFoot"] = Color3.fromRGB(191, 149, 119),
        ["LeftHand"] = Color3.fromRGB(191, 149, 119),
        ["RightEar2"] = Color3.fromRGB(191, 149, 119),
        ["RightFoot"] = Color3.fromRGB(191, 149, 119),
        ["RightHand"] = Color3.fromRGB(191, 149, 119)
    },
    ["hold_offset"] = CFrame.new(0, 0.8, 0)
}
v2.monkey = v100
local v101 = {
    ["name"] = "Monkey King",
    ["image"] = "rbxassetid://5067924789",
    ["model"] = "MonkeyKing",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Monkey Fairground",
        ["origin_items"] = { "monkey", "3 monkey_staffs" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "MonkeyKingHold2",
        ["eating"] = "MonkeyKingEat",
        ["hold"] = "MonkeyKingHold1",
        ["idle"] = "MonkeyKingIdle",
        ["running"] = "MonkeyKingRun",
        ["sit"] = "MonkeyKingSit",
        ["sleep"] = "MonkeyKingSleep"
    },
    ["tricks"] = {
        { "Sit", "MonkeyKingSit" },
        { "Lay down", "MonkeyKingSleep" },
        { "Beg", "MonkeyKingBeg" },
        { "Joyful", "MonkeyKingJoyful" },
        { "Trick 1", "MonkeyKingTrick1" },
        { "Trick 2", "MonkeyKingTrick2" }
    },
    ["neon_parts"] = {
        ["Belt2"] = Color3.fromRGB(37, 121, 255),
        ["HairPiece1"] = Color3.fromRGB(37, 121, 255),
        ["HairPiece2"] = Color3.fromRGB(37, 121, 255),
        ["HairPieceL"] = Color3.fromRGB(37, 121, 255),
        ["HairPieceR"] = Color3.fromRGB(37, 121, 255),
        ["LeftLowerArmor2"] = Color3.fromRGB(37, 121, 255),
        ["LeftUpperArmor2"] = Color3.fromRGB(37, 121, 255),
        ["Loincloth"] = Color3.fromRGB(37, 121, 255),
        ["RightLowerArmor2"] = Color3.fromRGB(37, 121, 255),
        ["RightUpperArmor2"] = Color3.fromRGB(37, 121, 255),
        ["Staff1"] = Color3.fromRGB(37, 121, 255),
        ["Staff_HI"] = Color3.fromRGB(37, 121, 255),
        ["Staff_Low"] = Color3.fromRGB(37, 121, 255)
    },
    ["hold_offset"] = CFrame.new(0, 0.8, -0.4)
}
v2.monkey_king = v101
local v102 = {
    ["name"] = "Musk Ox",
    ["image"] = "rbxassetid://6060991084",
    ["model"] = "MuskOx",
    ["rarity"] = "rare",
    ["cost"] = 3500,
    ["currency_id"] = "gingerbread_2020",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "MuskOxBeingDoubleHeld",
        ["eating"] = "MuskOxEat",
        ["hold"] = "MuskOxBeingHeld",
        ["idle"] = "MuskOxIdle",
        ["running"] = "MuskOxRun",
        ["sit"] = "MuskOxSit",
        ["sleep"] = "MuskOxSleep"
    },
    ["tricks"] = {
        { "Sit", "MuskOxSit" },
        { "Joyful", "MuskOxJoyful" },
        { "Beg", "MuskOxBeg" },
        { "Jump", "MuskOxJump" },
        { "Trick 1", "MuskOxTrick1" },
        { "Trick 2", "MuskOxTrick2" }
    },
    ["neon_parts"] = {
        ["Horns"] = Color3.fromRGB(185, 100, 60),
        ["LeftEar2"] = Color3.fromRGB(185, 100, 60),
        ["Nose"] = Color3.fromRGB(185, 100, 60),
        ["RightEar2"] = Color3.fromRGB(185, 100, 60),
        ["Torso3"] = Color3.fromRGB(185, 100, 60)
    }
}
v2.musk_ox = v102
local v103 = {
    ["name"] = "Mythic Egg",
    ["image"] = "rbxassetid://7195311687",
    ["model"] = "MythicEgg",
    ["rarity"] = "legendary",
    ["cost"] = 750,
    ["origin_entry"] = {
        ["origin"] = "Mythic Egg",
        ["origin_items"] = {},
        ["year"] = 2021
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "MythicEggIdle",
        ["running"] = "MythicEggRun",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 6
}
v2.mythic_egg = v103
local v104 = {
    ["name"] = "Narwhal",
    ["image"] = "rbxassetid://6498256342",
    ["model"] = "Narwhal",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Ocean Event",
        ["origin_items"] = { "ocean_egg" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "NarwhalBeingDoubleHeld",
        ["eating"] = "NarwhalEat",
        ["hold"] = "NarwhalBeingHeld",
        ["idle"] = "NarwhalIdle",
        ["running"] = "NarwhalRun",
        ["sit"] = "NarwhalSit",
        ["sleep"] = "NarwhalSleep"
    },
    ["tricks"] = {
        { "Sit", "NarwhalSit" },
        { "Joyful", "NarwhalJoyful" },
        { "Beg", "NarwhalBeg" },
        { "Jump", "NarwhalJump" },
        { "Trick 1", "NarwhalTrick1" },
        { "Trick 2", "NarwhalTrick2" }
    },
    ["neon_parts"] = {
        ["FinLUnder"] = Color3.fromRGB(92, 184, 95),
        ["FinRUnder"] = Color3.fromRGB(92, 184, 95),
        ["TailUnder"] = Color3.fromRGB(92, 184, 95),
        ["TorsoUnder"] = Color3.fromRGB(92, 184, 95),
        ["TorsoUnder2"] = Color3.fromRGB(92, 184, 95),
        ["TorsoUnder3"] = Color3.fromRGB(92, 184, 95),
        ["TorsoUnder4"] = Color3.fromRGB(92, 184, 95),
        ["TorsoUpper"] = Color3.fromRGB(92, 184, 95),
        ["TorsoUpper2"] = Color3.fromRGB(92, 184, 95),
        ["TorsoUpper3"] = Color3.fromRGB(92, 184, 95),
        ["TorsoUpper4"] = Color3.fromRGB(92, 184, 95)
    },
    ["already_has_flying_wings"] = true,
    ["head_rotator_uses_torso_instead"] = true,
    ["minimum_run_anim_speed"] = 0.3
}
v2.narwhal = v104
local v105 = {
    ["name"] = "Ninja Monkey",
    ["image"] = "rbxassetid://5067925034",
    ["model"] = "NinjaMonkey",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Monkey Fairground",
        ["origin_items"] = { "monkey", "3 scrolls" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "MonkeyHold2",
        ["eating"] = "MonkeyEat",
        ["hold"] = "MonkeyHold1",
        ["idle"] = "NinjaMonkeyIdle",
        ["running"] = "NinjaMonkeyRun",
        ["sit"] = "NinjaMonkeySit",
        ["sleep"] = "MonkeySleep"
    },
    ["tricks"] = {
        { "Sit", "NinjaMonkeySit" },
        { "Lay down", "MonkeySleep" },
        { "Beg", "MonkeyBeg" },
        { "Joyful", "NinjaMonkeyJoyful" },
        { "Trick 1", "NinjaMonkeyTrick1" },
        { "Trick 2", "NinjaMonkeyJump" }
    },
    ["neon_parts"] = {
        ["Belt"] = Color3.fromRGB(110, 153, 202),
        ["LeftFoot"] = Color3.fromRGB(110, 153, 202),
        ["LeftLowerArm"] = Color3.fromRGB(110, 153, 202),
        ["RightFoot"] = Color3.fromRGB(110, 153, 202),
        ["RightLowerArm"] = Color3.fromRGB(110, 153, 202)
    },
    ["hold_offset"] = CFrame.new(0, 0.8, 0)
}
v2.ninja_monkey = v105
local v106 = {
    ["name"] = "Ocean Egg",
    ["image"] = "rbxassetid://6498256269",
    ["model"] = "OceanEgg",
    ["rarity"] = "legendary",
    ["cost"] = 750,
    ["origin_entry"] = {
        ["origin"] = "Ocean Event",
        ["origin_items"] = {},
        ["year"] = 2021
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "OceanEggIdle",
        ["running"] = "OceanEggRun",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 6
}
v2.ocean_egg = v106
local v107 = {
    ["name"] = "Octopus",
    ["image"] = "rbxassetid://6498256211",
    ["model"] = "Octopus",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Ocean Event",
        ["origin_items"] = { "ocean_egg" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "OctopusBeingDoubleHeld",
        ["eating"] = "OctopusEat",
        ["hold"] = "OctopusBeingHeld",
        ["idle"] = "OctopusIdle",
        ["running"] = "OctopusRun",
        ["sit"] = "OctopusSit",
        ["sleep"] = "OctopusSleep"
    },
    ["tricks"] = {
        { "Sit", "OctopusSit" },
        { "Joyful", "OctopusJoyful" },
        { "Beg", "OctopusBeg" },
        { "Jump", "OctopusJump" },
        { "Trick 1", "OctopusTrick1" },
        { "Trick 2", "OctopusTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(194, 151, 121),
        ["RightEar2"] = Color3.fromRGB(194, 151, 121),
        ["TenELegSucA"] = Color3.fromRGB(234, 184, 146),
        ["TenELegSucB"] = Color3.fromRGB(234, 184, 146),
        ["TenELegSucC"] = Color3.fromRGB(234, 184, 146),
        ["TenNELegSucA"] = Color3.fromRGB(234, 184, 146),
        ["TenNELegSucB"] = Color3.fromRGB(234, 184, 146),
        ["TenNELegSucC"] = Color3.fromRGB(234, 184, 146),
        ["TenNLegSucA"] = Color3.fromRGB(234, 184, 146),
        ["TenNLegSucB"] = Color3.fromRGB(234, 184, 146),
        ["TenNLegSucC"] = Color3.fromRGB(234, 184, 146),
        ["TenNWLegSucA"] = Color3.fromRGB(234, 184, 146),
        ["TenNWLegSucB"] = Color3.fromRGB(234, 184, 146),
        ["TenNWLegSucC"] = Color3.fromRGB(234, 184, 146),
        ["TenSELegSucA"] = Color3.fromRGB(234, 184, 146),
        ["TenSELegSucB"] = Color3.fromRGB(234, 184, 146),
        ["TenSELegSucC"] = Color3.fromRGB(234, 184, 146),
        ["TenSLegSucA"] = Color3.fromRGB(234, 184, 146),
        ["TenSLegSucB"] = Color3.fromRGB(234, 184, 146),
        ["TenSLegSucC"] = Color3.fromRGB(234, 184, 146),
        ["TenSWLegSucA"] = Color3.fromRGB(234, 184, 146),
        ["TenSWLegSucB"] = Color3.fromRGB(234, 184, 146),
        ["TenSWLegSucC"] = Color3.fromRGB(234, 184, 146),
        ["TenWLegSucA"] = Color3.fromRGB(234, 184, 146),
        ["TenWLegSucB"] = Color3.fromRGB(234, 184, 146),
        ["TenWLegSucC"] = Color3.fromRGB(234, 184, 146),
        ["Torso2"] = Color3.fromRGB(194, 151, 121)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "LeftEye", "RightEye" },
    ["minimum_run_anim_speed"] = 0.3
}
v2.octopus = v107
local v108 = {
    ["name"] = "Otter",
    ["image"] = "rbxassetid://3293758505",
    ["model"] = "Otter",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Pets Update",
        ["origin_items"] = { "cracked_egg", "pet_egg", "retired_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "RedPandaIdle",
        ["running"] = "RedPandaRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(248, 217, 109),
        ["LeftFoot"] = Color3.fromRGB(248, 217, 109),
        ["LeftHand"] = Color3.fromRGB(248, 217, 109),
        ["Nose"] = Color3.fromRGB(248, 217, 109),
        ["RightEar"] = Color3.fromRGB(248, 217, 109),
        ["RightFoot"] = Color3.fromRGB(248, 217, 109),
        ["RightHand"] = Color3.fromRGB(248, 217, 109),
        ["Tail"] = Color3.fromRGB(248, 217, 109)
    }
}
v2.otter = v108
local v109 = {
    ["name"] = "Owl",
    ["image"] = "rbxassetid://4440866649",
    ["model"] = "BabyOwl",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Farm Egg",
        ["origin_items"] = { "farm_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "OwlBeingDoubleHeld",
        ["eating"] = "OwlEating",
        ["hold"] = "OwlBeingHeld",
        ["idle"] = "OwlIdle",
        ["running"] = "OwlRunning",
        ["sit"] = "OwlSit",
        ["sleep"] = "OwlSleep"
    },
    ["tricks"] = {
        { "Sit", "OwlSit" },
        { "Lay down", "OwlSleep" },
        { "Bounce", "OwlJump" },
        { "Joy", "OwlJoyful" },
        { "Dance 1", "OwlTrick1" },
        { "Dance 2", "OwlTrick2" }
    },
    ["neon_parts"] = {
        ["LeftWing"] = Color3.fromRGB(215, 95, 86),
        ["RightWing"] = Color3.fromRGB(215, 95, 86),
        ["Torso"] = Color3.fromRGB(215, 95, 86)
    },
    ["mega_neon_colors"] = {
        Color3.fromRGB(255, 62, 75),
        Color3.fromRGB(232, 67, 177),
        Color3.fromRGB(197, 154, 74),
        Color3.fromRGB(211, 132, 139)
    },
    ["already_has_flying_wings"] = true,
    ["head_rotator_uses_torso_instead"] = true,
    ["hold_offset"] = CFrame.new(0, 0.6, 0),
    ["minimum_run_anim_speed"] = 1,
    ["mounted_fly_forward_tilt_compensation"] = -21
}
v2.owl = v109
local v110 = {
    ["name"] = "Ox",
    ["image"] = "rbxassetid://6245080365",
    ["model"] = "Ox",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = { "ox_box" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "OxBeingDoubleHeld",
        ["eating"] = "OxEat",
        ["hold"] = "OxBeingHeld",
        ["idle"] = "OxIdle",
        ["running"] = "OxRun",
        ["sit"] = "OxSit",
        ["sleep"] = "OxSleep"
    },
    ["tricks"] = {
        { "Sit", "OxSit" },
        { "Joyful", "OxJoyful" },
        { "Beg", "OxBeg" },
        { "Jump", "OxJump" },
        { "Trick 1", "OxTrick1" },
        { "Trick 2", "OxTrick2" }
    },
    ["neon_parts"] = {
        ["Head4"] = Color3.fromRGB(193, 98, 79),
        ["Horns"] = Color3.fromRGB(193, 98, 79),
        ["LeftEar2"] = Color3.fromRGB(193, 98, 79),
        ["Neck2"] = Color3.fromRGB(193, 98, 79),
        ["NoseRing"] = Color3.fromRGB(193, 98, 79),
        ["NotANeck"] = Color3.fromRGB(193, 98, 79),
        ["RightEar2"] = Color3.fromRGB(193, 98, 79),
        ["Tail5"] = Color3.fromRGB(193, 98, 79)
    }
}
v2.ox = v110
local v111 = {
    ["name"] = "Panda",
    ["image"] = "rbxassetid://4621220487",
    ["model"] = "Panda",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "BearBeingDoubleHeld",
        ["eating"] = "BearEating",
        ["hold"] = "BearBeingHeld",
        ["idle"] = "BearIdle",
        ["running"] = "BearRunning",
        ["sit"] = "PandaSit",
        ["sleep"] = "PandaSleep"
    },
    ["tricks"] = {
        { "Sit", "PandaSit" },
        { "Lay down", "PandaSleep" },
        { "Dance 1", "PandaTrick" },
        { "Dance 2", "PandaTrick2" },
        { "Dance 3", "PandaTrick3" },
        { "Dance 4", "PandaTrick4" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(184, 179, 173),
        ["LeftEar2"] = Color3.fromRGB(184, 179, 173),
        ["RightEar2"] = Color3.fromRGB(184, 179, 173),
        ["Torso"] = Color3.fromRGB(184, 179, 173)
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["hold_offset"] = CFrame.new(0, 0.6, 0)
}
v2.panda = v111
local v112 = {
    ["name"] = "Parrot",
    ["image"] = "rbxassetid://3743647944",
    ["model"] = "Parrot",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Jungle Egg",
        ["origin_items"] = { "jungle_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "ParrotBeingDoubleHeld",
        ["eating"] = "ParrotEating",
        ["hold"] = "ParrotBeingHeld",
        ["idle"] = "ParrotIdle",
        ["running"] = "ParrotRunning",
        ["running_low"] = "ParrotRunningLow",
        ["running_mounted"] = "ParrotRunning",
        ["sit"] = "ParrotSit",
        ["sleep"] = "ParrotSleep"
    },
    ["tricks"] = {
        { "Sit", "ParrotSit" },
        { "Lay down", "ParrotSleep" },
        { "Beg", "ParrotBeg" },
        { "Headstand", "ParrotDig" },
        { "Dance 1", "ParrotDance1" },
        { "Dance 2", "ParrotDance2" }
    },
    ["neon_parts"] = {
        ["LeftFoot"] = Color3.fromRGB(248, 217, 109),
        ["LeftWing"] = Color3.fromRGB(255, 0, 0),
        ["LeftWing2"] = Color3.fromRGB(248, 217, 109),
        ["LeftWing3"] = Color3.fromRGB(13, 105, 172),
        ["RightFoot"] = Color3.fromRGB(248, 217, 109),
        ["RightWing"] = Color3.fromRGB(255, 0, 0),
        ["RightWing2"] = Color3.fromRGB(248, 217, 109),
        ["RightWing3"] = Color3.fromRGB(13, 105, 172),
        ["Tail"] = Color3.fromRGB(255, 0, 0)
    },
    ["mega_neon_colors"] = { Color3.fromRGB(44, 232, 101), Color3.fromRGB(245, 75, 194), Color3.fromRGB(213, 50, 50) },
    ["already_has_flying_wings"] = true,
    ["hold_offset"] = CFrame.new(0.5, 0.6, -0.25),
    ["minimum_run_anim_speed"] = 1,
    ["mounted_animation_scale_limit"] = 1,
    ["set"] = "jungle"
}
v2.parrot = v112
local v113 = {
    ["name"] = "Peacock",
    ["image"] = "rbxassetid://6531232495",
    ["model"] = "Peacock",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Pet Shop",
        ["origin_items"] = {},
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "PeacockBeingDoubleHeld",
        ["eating"] = "PeacockEat",
        ["flying"] = "PeacockFlying",
        ["hold"] = "PeacockBeingHeld",
        ["idle"] = "PeacockIdle",
        ["running"] = "PeacockRun",
        ["sit"] = "PeacockSit",
        ["sleep"] = "PeacockSleep"
    },
    ["tricks"] = {
        { "Sit", "PeacockSit" },
        { "Joyful", "PeacockJoyful" },
        { "Beg", "PeacockBeg" },
        { "Jump", "PeacockJump" },
        { "Trick 1", "PeacockTrick1" },
        { "Trick 2", "PeacockTrick2" }
    },
    ["neon_parts"] = {
        ["FeatherEight2"] = Color3.fromRGB(188, 121, 54),
        ["FeatherEight4"] = Color3.fromRGB(87, 181, 43),
        ["FeatherFive2"] = Color3.fromRGB(188, 121, 54),
        ["FeatherFive4"] = Color3.fromRGB(87, 181, 43),
        ["FeatherFour2"] = Color3.fromRGB(188, 121, 54),
        ["FeatherFour4"] = Color3.fromRGB(87, 181, 43),
        ["FeatherNine2"] = Color3.fromRGB(188, 121, 54),
        ["FeatherNine4"] = Color3.fromRGB(87, 181, 43),
        ["FeatherOne2"] = Color3.fromRGB(188, 121, 54),
        ["FeatherOne4"] = Color3.fromRGB(87, 181, 43),
        ["FeatherSeven2"] = Color3.fromRGB(188, 121, 54),
        ["FeatherSeven4"] = Color3.fromRGB(87, 181, 43),
        ["FeatherSix2"] = Color3.fromRGB(188, 121, 54),
        ["FeatherSix4"] = Color3.fromRGB(87, 181, 43),
        ["FeatherThree2"] = Color3.fromRGB(188, 121, 54),
        ["FeatherThree4"] = Color3.fromRGB(87, 181, 43),
        ["FeatherTwo2"] = Color3.fromRGB(188, 121, 54),
        ["FeatherTwo4"] = Color3.fromRGB(87, 181, 43),
        ["Head2"] = Color3.fromRGB(87, 181, 43),
        ["leftwing1"] = Color3.fromRGB(87, 181, 43),
        ["rightwing1"] = Color3.fromRGB(87, 181, 43)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true,
    ["head_rotator_name_override"] = "NotAHeadSorryKyle",
    ["minimum_fly_anim_speed"] = 0.5
}
v2.peacock = v113
local v114 = {
    ["name"] = "Penguin",
    ["image"] = "rbxassetid://3710822879",
    ["model"] = "Penguin",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Ice Cream Parlor",
        ["origin_items"] = { "golden_goldfish" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "PenguinBeingDoubleHeld",
        ["eating"] = "PenguinEating",
        ["hold"] = "PenguinBeingHeld",
        ["idle"] = "PenguinIdle",
        ["running"] = "PenguinRunning",
        ["running_mounted"] = "PenguinRunning2",
        ["sit"] = "PenguinSit",
        ["sleep"] = "PenguinSleep"
    },
    ["tricks"] = {
        { "Sit", "PenguinSit" },
        { "Lay down", "PenguinSleep" },
        { "Beg", "PenguinBeg" },
        { "Headstand", "PenguinDig" },
        { "Dance 1", "PenguinDance1" },
        { "Dance 2", "PenguinDance2" }
    },
    ["neon_parts"] = {
        ["LeftFoot"] = Color3.fromRGB(255, 102, 204),
        ["LeftWing"] = Color3.fromRGB(255, 102, 204),
        ["RightFoot"] = Color3.fromRGB(255, 102, 204),
        ["RightWing"] = Color3.fromRGB(255, 102, 204)
    },
    ["head_rotator_doesnt_rotate_while_moving"] = true,
    ["head_rotator_uses_torso_instead"] = true,
    ["hold_offset"] = CFrame.new(0, 1.2, 0),
    ["minimum_run_anim_speed"] = 1,
    ["set"] = "polar"
}
v2.penguin = v114
local v115 = {
    ["name"] = "Blue Egg",
    ["image"] = "rbxassetid://3261465951",
    ["model"] = "BlueEgg",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Easter",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "EggIdle2",
        ["running"] = "EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 3
}
v2.pet_egg = v115
local v116 = {
    ["name"] = "Phoenix",
    ["image"] = "rbxassetid://7126719832",
    ["model"] = "Phoenix",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Mythic Egg",
        ["origin_items"] = { "mythic_egg" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "PhoenixBeingDoubleHeld",
        ["eating"] = "PhoenixEat",
        ["hold"] = "PhoenixBeingHeld",
        ["idle"] = "PhoenixIdle",
        ["running"] = "PhoenixRun",
        ["sit"] = "PhoenixSit",
        ["sleep"] = "PhoenixSleep"
    },
    ["tricks"] = {
        { "Sit", "PhoenixSit" },
        { "Joyful", "PhoenixJoyful" },
        { "Beg", "PhoenixBeg" },
        { "Jump", "PhoenixJump" },
        { "Trick 1", "PhoenixTrick1" },
        { "Trick 2", "PhoenixTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(89, 148, 184),
        ["Head4"] = Color3.fromRGB(89, 148, 184),
        ["LFeather2"] = Color3.fromRGB(51, 88, 130),
        ["LFeather3"] = Color3.fromRGB(51, 88, 130),
        ["LFeather4"] = Color3.fromRGB(55, 96, 140),
        ["LFeather5"] = Color3.fromRGB(51, 88, 130),
        ["LWing1"] = Color3.fromRGB(89, 148, 184),
        ["LWing4"] = Color3.fromRGB(76, 157, 182),
        ["LWing5"] = Color3.fromRGB(66, 99, 130),
        ["RFeather2"] = Color3.fromRGB(51, 88, 130),
        ["RFeather3"] = Color3.fromRGB(51, 88, 130),
        ["RFeather4"] = Color3.fromRGB(55, 96, 140),
        ["RFeather5"] = Color3.fromRGB(51, 88, 130),
        ["RWing1"] = Color3.fromRGB(89, 148, 184),
        ["RWing4"] = Color3.fromRGB(76, 157, 182),
        ["RWing5"] = Color3.fromRGB(66, 99, 130),
        ["Tail"] = Color3.fromRGB(89, 148, 184),
        ["Tail2"] = Color3.fromRGB(66, 99, 130),
        ["Tail3"] = Color3.fromRGB(51, 88, 130),
        ["Torso"] = Color3.fromRGB(99, 139, 182)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_run_anim_speed"] = 0.5
}
v2.phoenix = v116
local v117 = {
    ["name"] = "Pig",
    ["image"] = "rbxassetid://4440866760",
    ["model"] = "Pig",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Farm Egg",
        ["origin_items"] = { "farm_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "PigBeingDoubleHeld",
        ["eating"] = "PigEating",
        ["hold"] = "PigBeingHeld",
        ["idle"] = "PigIdle",
        ["running"] = "PigRunning",
        ["sit"] = "PigSit",
        ["sleep"] = "PigSleep"
    },
    ["tricks"] = {
        { "Sit", "PigSit" },
        { "Lay down", "PigSleep" },
        { "Bounce", "PigJump" },
        { "Joy", "PigJoyful" },
        { "Dance 1", "PigTrick1" },
        { "Dance 2", "PigTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(255, 102, 204),
        ["LeftFoot"] = Color3.fromRGB(255, 102, 204),
        ["LeftHand"] = Color3.fromRGB(255, 102, 204),
        ["Nose"] = Color3.fromRGB(255, 102, 204),
        ["RightEar2"] = Color3.fromRGB(255, 102, 204),
        ["RightFoot"] = Color3.fromRGB(255, 102, 204),
        ["RightHand"] = Color3.fromRGB(255, 102, 204),
        ["Tail"] = Color3.fromRGB(255, 102, 204)
    },
    ["hold_offset"] = CFrame.new(0, 0.6, 0)
}
v2.pig = v117
local v118 = {
    ["name"] = "Pink Cat",
    ["image"] = "rbxassetid://3261465850",
    ["model"] = "PinkCat",
    ["rarity"] = "uncommon"
}
local v119 = {
    ["origin"] = "Pets Update",
    ["origin_items"] = { "pink_egg" },
    ["viewport_override"] = {
        ["distance"] = 3.5,
        ["offset"] = CFrame.new(0, 0, -0.25)
    },
    ["year"] = 2019
}
v118.origin_entry = v119
v118.anims = {
    ["double_hold"] = "DogBeingDoubleHeld",
    ["eating"] = "DogEating",
    ["hold"] = "DogBeingHeld",
    ["idle"] = "CatIdle",
    ["running"] = "CatRunning",
    ["sit"] = "CatSit",
    ["sleep"] = "CatSleep"
}
v118.tricks = {
    { "Sit", "DogSit" },
    { "Lay down", "DogSleep" },
    { "Bounce", "DogBounce" },
    { "Roll over", "DogRollover" },
    { "Backflip", "DogBackflip" },
    { "Dance", "DogDance" }
}
v118.neon_parts = {
    ["LeftEar2"] = Color3.fromRGB(255, 152, 220),
    ["LeftFoot"] = Color3.fromRGB(255, 152, 220),
    ["LeftHand"] = Color3.fromRGB(255, 152, 220),
    ["Nose"] = Color3.fromRGB(255, 152, 220),
    ["RightEar2"] = Color3.fromRGB(255, 152, 220),
    ["RightFoot"] = Color3.fromRGB(255, 152, 220),
    ["RightHand"] = Color3.fromRGB(255, 152, 220),
    ["Tail"] = Color3.fromRGB(255, 124, 214),
    ["Whiskers"] = Color3.fromRGB(255, 152, 220)
}
v118.mega_neon_colors = { Color3.fromRGB(255, 209, 108), Color3.fromRGB(85, 255, 187), Color3.fromRGB(211, 204, 55) }
v2.pink_cat = v118
local v120 = {
    ["name"] = "Pink Egg",
    ["image"] = "rbxassetid://3261465791",
    ["model"] = "PinkEgg",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Pets Update",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "EggIdle2",
        ["running"] = "EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 3
}
v2.pink_egg = v120
local v121 = {
    ["name"] = "Platypus",
    ["image"] = "rbxassetid://3744706727",
    ["model"] = "Platypus",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Jungle Egg",
        ["origin_items"] = { "jungle_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "RedPandaIdle",
        ["running"] = "RedPandaRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftFoot"] = Color3.fromRGB(110, 153, 202),
        ["LeftHand"] = Color3.fromRGB(110, 153, 202),
        ["Nose"] = Color3.fromRGB(110, 153, 202),
        ["RightFoot"] = Color3.fromRGB(110, 153, 202),
        ["RightHand"] = Color3.fromRGB(110, 153, 202),
        ["Tail"] = Color3.fromRGB(110, 153, 202)
    },
    ["set"] = "jungle"
}
v2.platypus = v121
local v122 = {
    ["name"] = "Polar Bear",
    ["image"] = "rbxassetid://4506925595",
    ["model"] = "PolarBear",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "christmas_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "BearBeingDoubleHeld",
        ["eating"] = "BearEating",
        ["hold"] = "BearBeingHeld",
        ["idle"] = "BearIdle",
        ["running"] = "BearRunning",
        ["sit"] = "PolarBearSit",
        ["sleep"] = "PolarBearSleep"
    },
    ["tricks"] = {
        { "Sit", "PolarBearSit" },
        { "Lay down", "PolarBearSleep" },
        { "Bounce", "BearJump" },
        { "Dance 1", "PolarBearTrick" },
        { "Dance 2", "PolarBearTrick2" },
        { "Dance 3", "PolarBearTrick3" }
    },
    ["neon_parts"] = {
        ["LeftArm"] = Color3.fromRGB(102, 146, 248),
        ["LeftEar2"] = Color3.fromRGB(102, 146, 248),
        ["LeftFoot"] = Color3.fromRGB(102, 146, 248),
        ["RightArm"] = Color3.fromRGB(102, 146, 248),
        ["RightEar2"] = Color3.fromRGB(102, 146, 248),
        ["RightFoot"] = Color3.fromRGB(102, 146, 248),
        ["Tail"] = Color3.fromRGB(102, 146, 248)
    },
    ["hold_offset"] = CFrame.new(0, 0.6, 0)
}
v2.polar_bear = v122
local v123 = {
    ["name"] = "Practice Dog",
    ["image"] = "rbxassetid://13342638891",
    ["model"] = "PracticeDog",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["temporary"] = true,
    ["origin_entry"] = {
        ["origin"] = "Tutorial",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["is_customizable"] = false,
    ["hide_from_collectors_sign"] = true,
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DogIdle",
        ["running"] = "DogRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {},
    ["cannot_feed_potions"] = true,
    ["cannot_seal_colors"] = true,
    ["hide_age_bar"] = true,
    ["progression_locked"] = true
}
v2.practice_dog = v123
local v124 = {
    ["name"] = "Pterodactyl",
    ["image"] = "rbxassetid://5721843716",
    ["model"] = "Pterodactyl",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Fossil Isle",
        ["origin_items"] = { "fossil_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "PterodactylBeingDoubleHeld",
        ["eating"] = "PterodactylEat",
        ["hold"] = "PterodactylBeingHeld",
        ["idle"] = "PterodactylIdle",
        ["running"] = "PterodactylRun",
        ["sit"] = "PterodactylSit",
        ["sleep"] = "PterodactylSleep"
    },
    ["tricks"] = {
        { "Sit", "PterodactylSit" },
        { "Joyful", "PterodactylJoyful" },
        { "Beg", "PterodactylBeg" },
        { "Jump", "PterodactylJump" },
        { "Trick 1", "PterodactylTrick1" },
        { "Trick 2", "PterodactylTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(107, 107, 206),
        ["LeftFoot"] = Color3.fromRGB(107, 107, 206),
        ["LeftInnerWing2"] = Color3.fromRGB(107, 107, 206),
        ["LeftMiddleWing2"] = Color3.fromRGB(107, 107, 206),
        ["LeftOuterWing2"] = Color3.fromRGB(107, 107, 206),
        ["RightFoot"] = Color3.fromRGB(107, 107, 206),
        ["RightInnerWing2"] = Color3.fromRGB(107, 107, 206),
        ["RightMiddleWing2"] = Color3.fromRGB(107, 107, 206),
        ["RightOuterWing2"] = Color3.fromRGB(107, 107, 206)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_fly_anim_speed"] = 1
}
v2.pterodactyl = v124
local v125 = {
    ["name"] = "Puma",
    ["image"] = "rbxassetid://3181727071",
    ["model"] = "Puma",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Pets Update",
        ["origin_items"] = {
            "cracked_egg",
            "pet_egg",
            "royal_egg",
            "retired_egg"
        },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "CatIdle",
        ["running"] = "CatRunning",
        ["sit"] = "CatSit",
        ["sleep"] = "CatSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(199, 172, 120),
        ["LeftFoot"] = Color3.fromRGB(199, 172, 120),
        ["LeftHand"] = Color3.fromRGB(199, 172, 120),
        ["Nose"] = Color3.fromRGB(199, 172, 120),
        ["RightEar2"] = Color3.fromRGB(199, 172, 120),
        ["RightFoot"] = Color3.fromRGB(199, 172, 120),
        ["RightHand"] = Color3.fromRGB(199, 172, 120),
        ["Tail"] = Color3.fromRGB(199, 172, 120),
        ["Whiskers"] = Color3.fromRGB(199, 172, 120)
    }
}
v2.puma = v125
local v126 = {
    ["name"] = "Pumpkin",
    ["image"] = "rbxassetid://5862774255",
    ["model"] = "Pumpkin",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["temporary"] = true,
    ["permanently_delete_all_copies_of_this_item_from_the_game"] = true,
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["is_customizable"] = false,
    ["hide_from_collectors_sign"] = true,
    ["anims"] = {
        ["double_hold"] = "PumpkinBeingDoubleHeld",
        ["eating"] = "PumpkinEat",
        ["flying"] = "PumpkinFlying",
        ["hold"] = "PumpkinBeingHeld",
        ["idle"] = "PumpkinIdle",
        ["idle_mounted"] = "PumpkinIdleGround",
        ["running"] = "PumpkinRun",
        ["sit"] = "PumpkinSit",
        ["sleep"] = "PumpkinSleep"
    },
    ["tricks"] = {
        { "Sit", "PumpkinSit" },
        { "Joyful", "PumpkinJoyful" },
        { "Trick 1", "PumpkinTrick1" }
    },
    ["neon_parts"] = {},
    ["already_has_flying_wings"] = true,
    ["displayed_rarity"] = "event",
    ["minimum_fly_anim_speed"] = 1,
    ["mounted_fly_forward_tilt_compensation"] = -10
}
v2.pumpkin = v126
local v127 = {
    ["name"] = "Queen Bee",
    ["image"] = "rbxassetid://4315743450",
    ["model"] = "QueenBee",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Coffee Shop",
        ["origin_items"] = { "honey" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "BeeBeingDoubleHeld",
        ["eating"] = "BeeEating",
        ["hold"] = "BeeBeingHeld",
        ["idle"] = "BeeIdle",
        ["running"] = "BeeRunning",
        ["running_low"] = "BeeRunningLow",
        ["sit"] = "BeeSit",
        ["sleep"] = "BeeSleep"
    },
    ["tricks"] = {
        { "Sit", "BeeSit" },
        { "Lay Down", "BeeSleep" },
        { "Joy", "BeeJoyful" },
        { "Jump", "BeeJump" },
        { "Sideflip", "BeeTrick1" },
        { "Spin", "BeeTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(105, 163, 202),
        ["Torso2"] = Color3.fromRGB(105, 163, 202)
    },
    ["mega_neon_colors"] = {
        Color3.fromRGB(255, 209, 108),
        Color3.fromRGB(85, 255, 187),
        Color3.fromRGB(95, 88, 232),
        Color3.fromRGB(211, 42, 104)
    },
    ["already_has_flying_wings"] = true,
    ["hold_offset"] = CFrame.new(0, 0.6, 0),
    ["minimum_run_anim_speed"] = 1,
    ["mounted_animation_scale_limit"] = 1,
    ["mounted_fly_forward_tilt_compensation"] = -15
}
v2.queen_bee = v127
local v128 = {
    ["name"] = "Rabbit",
    ["image"] = "rbxassetid://3181727278",
    ["model"] = "Rabbit",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Pets Update",
        ["origin_items"] = {
            "cracked_egg",
            "pet_egg",
            "royal_egg",
            "retired_egg"
        },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DogIdle",
        ["running"] = "DogRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(255, 102, 204),
        ["LeftFoot"] = Color3.fromRGB(255, 102, 204),
        ["LeftHand"] = Color3.fromRGB(255, 102, 204),
        ["Nose"] = Color3.fromRGB(255, 102, 204),
        ["RightEar2"] = Color3.fromRGB(255, 102, 204),
        ["RightFoot"] = Color3.fromRGB(255, 102, 204),
        ["RightHand"] = Color3.fromRGB(255, 102, 204),
        ["Tail"] = Color3.fromRGB(255, 102, 204)
    }
}
v2.rabbit = v128
local v129 = {
    ["name"] = "Rat",
    ["image"] = "rbxassetid://4621220568",
    ["model"] = "Rat",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = { "rat_box" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "RatBeingDoubleHeld",
        ["eating"] = "RatEating",
        ["hold"] = "RatBeingHeld",
        ["idle"] = "RatIdle",
        ["running"] = "RatRunning",
        ["sit"] = "RatSit",
        ["sleep"] = "RatSleep"
    },
    ["tricks"] = {
        { "Sit", "RatSit" },
        { "Lay down", "RatSleep" },
        { "Jump", "RatJump" },
        { "Dig", "RatDig" },
        { "Dance 1", "RatTrick1" },
        { "Dance 2", "RatTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(248, 100, 234),
        ["LeftFoot"] = Color3.fromRGB(248, 100, 234),
        ["LeftHand"] = Color3.fromRGB(248, 100, 234),
        ["Nose"] = Color3.fromRGB(248, 100, 234),
        ["RightEar2"] = Color3.fromRGB(248, 100, 234),
        ["RightFoot"] = Color3.fromRGB(248, 100, 234),
        ["RightHand"] = Color3.fromRGB(248, 100, 234),
        ["Tail"] = Color3.fromRGB(248, 100, 234)
    },
    ["hold_offset"] = CFrame.new(0, 1, -0.1)
}
v2.rat = v129
local v130 = {
    ["name"] = "Red Panda",
    ["image"] = "rbxassetid://3181728128",
    ["model"] = "RedPanda",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Pets Update",
        ["origin_items"] = {
            "cracked_egg",
            "pet_egg",
            "royal_egg",
            "retired_egg"
        },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "RedPandaIdle",
        ["running"] = "RedPandaRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(255, 89, 89),
        ["LeftFoot"] = Color3.fromRGB(255, 89, 89),
        ["LeftHand"] = Color3.fromRGB(255, 89, 89),
        ["Nose"] = Color3.fromRGB(255, 89, 89),
        ["RightEar2"] = Color3.fromRGB(255, 89, 89),
        ["RightFoot"] = Color3.fromRGB(255, 89, 89),
        ["RightHand"] = Color3.fromRGB(255, 89, 89),
        ["Tail2"] = Color3.fromRGB(255, 89, 89)
    }
}
v2.red_panda = v130
local v131 = {
    ["name"] = "Red Squirrel",
    ["image"] = "rbxassetid://6776872152",
    ["model"] = "RedSquirrel",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Toy Shop",
        ["origin_items"] = {},
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "RedSquirrelBeingDoubleHeld",
        ["eating"] = "RedSquirrelEat",
        ["hold"] = "RedSquirrelBeingHeld",
        ["idle"] = "RedSquirrelIdle",
        ["running"] = "RedSquirrelRun",
        ["sit"] = "RedSquirrelSit",
        ["sleep"] = "RedSquirrelSleep"
    },
    ["tricks"] = {
        { "Sit", "RedSquirrelSit" },
        { "Joyful", "RedSquirrelJoyful" },
        { "Beg", "RedSquirrelBeg" },
        { "Jump", "RedSquirrelJump" },
        { "Trick 1", "RedSquirrelTrick1" },
        { "Trick 2", "RedSquirrelTrick2" }
    },
    ["neon_parts"] = {
        ["Belly"] = Color3.fromRGB(186, 139, 97),
        ["Head2"] = Color3.fromRGB(186, 139, 97),
        ["Tail2"] = Color3.fromRGB(186, 139, 97)
    },
    ["eyes"] = { "EyesFix" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.red_squirrel = v131
local v132 = {
    ["name"] = "Pet Egg",
    ["image"] = "rbxassetid://3199974219",
    ["model"] = "PetEgg",
    ["rarity"] = "rare",
    ["cost"] = 600,
    ["origin_entry"] = {
        ["origin"] = "Nursery",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "EggIdle2",
        ["running"] = "EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 5,
    ["is_non_event_egg"] = true
}
v2.regular_pet_egg = v132
local v133 = {
    ["name"] = "Reindeer",
    ["image"] = "rbxassetid://4506847061",
    ["model"] = "Reindeer",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "ReindeerBeingDoubleHeld",
        ["eating"] = "ReindeerEating",
        ["flying"] = "ReindeerFlying",
        ["hold"] = "ReindeerBeingHeld",
        ["idle"] = "ReindeerIdle",
        ["running"] = "ReindeerRunning",
        ["sit"] = "ReindeerSit",
        ["sleep"] = "ReindeerSleep"
    },
    ["tricks"] = {
        { "Sit", "ReindeerSit" },
        { "Lay down", "ReindeerSleep" },
        { "Joy", "ReindeerJoyful" },
        { "Bounce", "ReindeerJump" },
        { "Trick 1", "ReindeerTrick1" },
        { "Trick 2", "ReindeerTrick2" }
    },
    ["neon_parts"] = {
        ["Nose"] = Color3.fromRGB(0, 255, 0)
    },
    ["already_has_flying_wings"] = true,
    ["hold_offset"] = CFrame.new(0, 1, 0),
    ["minimum_fly_anim_speed"] = 1
}
v2.reindeer = v133
local v134 = {
    ["name"] = "Rhino",
    ["image"] = "rbxassetid://3743734696",
    ["model"] = "Rhino",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Jungle Egg",
        ["origin_items"] = { "jungle_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "RedPandaIdle",
        ["running"] = "RedPandaRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Dance 1", "RhinoDance1" },
        { "Dance 2", "RhinoDance2" }
    },
    ["neon_parts"] = {
        ["Horn"] = Color3.fromRGB(190, 104, 98),
        ["LeftEar2"] = Color3.fromRGB(190, 104, 98),
        ["LeftFoot"] = Color3.fromRGB(190, 104, 98),
        ["LeftHand"] = Color3.fromRGB(190, 104, 98),
        ["RightEar2"] = Color3.fromRGB(190, 104, 98),
        ["RightFoot"] = Color3.fromRGB(190, 104, 98),
        ["RightHand"] = Color3.fromRGB(190, 104, 98),
        ["Tail2"] = Color3.fromRGB(190, 104, 98)
    },
    ["set"] = "jungle"
}
v2.rhino = v134
local v135 = {
    ["name"] = "Robin",
    ["image"] = "rbxassetid://4506925908",
    ["model"] = "Robin",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "christmas_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "RobinBeingDoubleHeld",
        ["eating"] = "RobinEating",
        ["hold"] = "RobinBeingHeld",
        ["idle"] = "RobinIdle",
        ["running"] = "RobinRunning",
        ["running_low"] = "RobinRunningLow",
        ["sit"] = "RobinSit",
        ["sleep"] = "RobinSleep"
    },
    ["tricks"] = {
        { "Sit", "RobinSit" },
        { "Lay down", "RobinSleep" },
        { "Bounce", "RobinJump" },
        { "Joy", "RobinJoyful" },
        { "Dance 1", "RobinTrick1" },
        { "Dance 2", "RobinTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(234, 135, 96),
        ["LeftFoot"] = Color3.fromRGB(163, 126, 100),
        ["RightFoot"] = Color3.fromRGB(163, 126, 100),
        ["Torso2"] = Color3.fromRGB(234, 135, 96)
    },
    ["already_has_flying_wings"] = true,
    ["hold_offset"] = CFrame.new(0.3, 1.1, 0),
    ["minimum_run_anim_speed"] = 1,
    ["mounted_animation_scale_limit"] = 1,
    ["mounted_fly_forward_tilt_compensation"] = -21
}
v2.robin = v135
local v136 = {
    ["name"] = "Robo Dog",
    ["image"] = "rbxassetid://5973019152",
    ["model"] = "RoboDog",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Pet Shop",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "RoboDogBeingDoubleHeld",
        ["eating"] = "RoboDogEat",
        ["hold"] = "RoboDogBeingHeld",
        ["idle"] = "RoboDogIdle",
        ["running"] = "RoboDogRun",
        ["sit"] = "RoboDogSit",
        ["sleep"] = "RoboDogSleep"
    },
    ["tricks"] = {
        { "Sit", "RoboDogSit" },
        { "Joyful", "RoboDogJoyful" },
        { "Beg", "RoboDogBeg" },
        { "Jump", "RoboDogJump" },
        { "Trick 1", "RoboDogTrick1" },
        { "Trick 2", "RoboDogTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar"] = Color3.fromRGB(4, 175, 236),
        ["ReftEar"] = Color3.fromRGB(4, 175, 236),
        ["Tail_Ball"] = Color3.fromRGB(4, 175, 236),
        ["Torso3"] = Color3.fromRGB(4, 175, 236)
    }
}
v2.robo_dog = v136
local v137 = {
    ["name"] = "Royal Egg",
    ["image"] = "rbxassetid://3199974169",
    ["model"] = "RoyalEgg",
    ["rarity"] = "legendary",
    ["cost"] = 1450,
    ["origin_entry"] = {
        ["origin"] = "Nursery",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "EggIdle2",
        ["running"] = "EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 6,
    ["is_non_event_egg"] = true
}
v2.royal_egg = v137
local v138 = {
    ["name"] = "Sabertooth",
    ["image"] = "rbxassetid://5721843846",
    ["model"] = "Sabertooth",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Fossil Isle",
        ["origin_items"] = { "fossil_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "SabertoothBeingDoubleHeld",
        ["eating"] = "SabertoothEat",
        ["hold"] = "SabertoothBeingHeld",
        ["idle"] = "SabertoothIdle",
        ["running"] = "SabertoothRun",
        ["sit"] = "SabertoothSit",
        ["sleep"] = "SabertoothSleep"
    },
    ["tricks"] = {
        { "Sit", "SabertoothSit" },
        { "Joyful", "SabertoothJoyful" },
        { "Beg", "SabertoothBeg" },
        { "Jump", "SabertoothJump" },
        { "Trick 1", "SabertoothTrick1" },
        { "Trick 2", "SabertoothTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(72, 189, 106),
        ["Head3"] = Color3.fromRGB(72, 189, 106),
        ["LeftBackFoot"] = Color3.fromRGB(72, 189, 106),
        ["LeftEar2"] = Color3.fromRGB(72, 189, 106),
        ["LeftFrontFoot"] = Color3.fromRGB(72, 189, 106),
        ["Nose"] = Color3.fromRGB(72, 189, 106),
        ["RightBackFoot"] = Color3.fromRGB(72, 189, 106),
        ["RightEar2"] = Color3.fromRGB(72, 189, 106),
        ["RightFrontFoot"] = Color3.fromRGB(72, 189, 106),
        ["Tail4"] = Color3.fromRGB(72, 189, 106),
        ["Tail6"] = Color3.fromRGB(72, 189, 106),
        ["Torso3"] = Color3.fromRGB(72, 189, 106)
    }
}
v2.sabertooth = v138
local v139 = {
    ["name"] = "Safari Egg",
    ["image"] = "rbxassetid://3409444171",
    ["model"] = "SafariEgg",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Safari Egg",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "EggIdle2",
        ["running"] = "EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 6
}
v2.safari_egg = v139
local v140 = {
    ["name"] = "Dalmatian",
    ["image"] = "rbxassetid://4849941000",
    ["model"] = "Dalmatian",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DogIdle",
        ["running"] = "DogRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar"] = Color3.fromRGB(105, 202, 112),
        ["LeftFoot"] = Color3.fromRGB(105, 202, 112),
        ["LeftHand"] = Color3.fromRGB(105, 202, 112),
        ["RightEar"] = Color3.fromRGB(105, 202, 112),
        ["RightFoot"] = Color3.fromRGB(105, 202, 112),
        ["RightHand"] = Color3.fromRGB(105, 202, 112),
        ["Tail"] = Color3.fromRGB(105, 202, 112)
    }
}
v2.santa_dog = v140
local v141 = {
    ["name"] = "Sasquatch",
    ["image"] = "rbxassetid://6998403532",
    ["model"] = "Sasquatch",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Mythic Egg",
        ["origin_items"] = { "mythic_egg" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "SasquatchBeingDoubleHeld",
        ["eating"] = "SasquatchEat",
        ["hold"] = "SasquatchBeingHeld",
        ["idle"] = "SasquatchIdle",
        ["running"] = "SasquatchRun",
        ["sit"] = "SasquatchSit",
        ["sleep"] = "SasquatchSleep"
    },
    ["tricks"] = {
        { "Sit", "SasquatchSit" },
        { "Joyful", "SasquatchJoyful" },
        { "Beg", "SasquatchBeg" },
        { "Jump", "SasquatchJump" },
        { "Trick 1", "SasquatchTrick1" },
        { "Trick 2", "SasquatchTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(170, 87, 38),
        ["Head3"] = Color3.fromRGB(170, 87, 38),
        ["LeftArm"] = Color3.fromRGB(170, 87, 38),
        ["RightArm"] = Color3.fromRGB(170, 87, 38)
    }
}
v2.sasquatch = v141
local v142 = {
    ["name"] = "Scoob",
    ["image"] = "rbxassetid://4968254230",
    ["model"] = "Dog",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["temporary"] = true,
    ["permanently_delete_all_copies_of_this_item_from_the_game"] = true,
    ["origin_entry"] = {
        ["origin"] = "Scoob!",
        ["origin_items"] = { "N/A" },
        ["year"] = 2020
    },
    ["is_customizable"] = false,
    ["hide_from_collectors_sign"] = true,
    ["anims"] = {
        ["double_hold"] = "ScoobBeingDoubleHeld",
        ["eating"] = "ScoobEat",
        ["hold"] = "ScoobBeingHeld",
        ["idle"] = "ScoobIdle",
        ["running"] = "ScoobRun",
        ["sit"] = "ScoobSit",
        ["sleep"] = "ScoobSleep"
    },
    ["tricks"] = {
        { "Sit", "ScoobSit" },
        { "Lay down", "ScoobSleep" },
        { "Scared", "ScoobTrick" }
    },
    ["neon_parts"] = {},
    ["hold_double_offset"] = CFrame.new(0, 0.3, 0.3),
    ["hold_offset"] = CFrame.new(0.6, 1, -0.2) * CFrame.Angles(0, 3.141592653589793, 0.3490658503988659)
}
v2.scoob = v142
local v143 = {
    ["name"] = "Seahorse",
    ["image"] = "rbxassetid://6498256132",
    ["model"] = "Seahorse",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Ocean Event",
        ["origin_items"] = { "ocean_egg" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "SeahorseBeingDoubleHeld",
        ["eating"] = "SeahorseEat",
        ["hold"] = "SeahorseBeingHeld",
        ["idle"] = "SeahorseIdle",
        ["running"] = "SeahorseRun",
        ["sit"] = "SeahorseSit",
        ["sleep"] = "SeahorseSleep"
    },
    ["tricks"] = {
        { "Sit", "SeahorseSit" },
        { "Joyful", "SeahorseJoyful" },
        { "Beg", "SeahorseBeg" },
        { "Jump", "SeahorseJump" },
        { "Trick 1", "SeahorseTrick1" },
        { "Trick 2", "SeahorseTrick2" }
    },
    ["neon_parts"] = {
        ["Chest"] = Color3.fromRGB(179, 179, 179),
        ["HeadWing_L"] = Color3.fromRGB(179, 179, 179),
        ["HeadWing_R"] = Color3.fromRGB(179, 179, 179),
        ["Spine"] = Color3.fromRGB(179, 179, 179),
        ["Wing_L"] = Color3.fromRGB(179, 179, 179),
        ["Wing_R"] = Color3.fromRGB(179, 179, 179)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_run_anim_speed"] = 0.3
}
v2.seahorse = v143
local v144 = {
    ["name"] = "Shadow Dragon",
    ["image"] = "rbxassetid://4115248712",
    ["model"] = "ShadowDragon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "EdgyDragonBeingDoubleHeld",
        ["eating"] = "EdgyDragonEating",
        ["hold"] = "EdgyDragonBeingHeld",
        ["idle"] = "EdgyDragonIdle",
        ["running"] = "EdgyDragonRunning",
        ["running_low"] = "EdgyDragonRunningLow",
        ["sit"] = "EdgyDragonSit",
        ["sleep"] = "EdgyDragonSleep"
    },
    ["tricks"] = {
        { "Sit", "EdgyDragonSit" },
        { "Lay Down", "EdgyDragonSleep" },
        { "Joy", "EdgyDragonJoyful" },
        { "Jump", "EdgyDragonJump" },
        { "Dive", "EdgyDragonTrick1" },
        { "Shadow Breath", "EdgyDragonTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(148, 136, 214),
        ["Horns"] = Color3.fromRGB(148, 136, 214),
        ["LeftWingWeb"] = Color3.fromRGB(148, 136, 214),
        ["LeftWingWeb2"] = Color3.fromRGB(148, 136, 214),
        ["LeftWingWeb3"] = Color3.fromRGB(148, 136, 214),
        ["RightWingWeb"] = Color3.fromRGB(148, 136, 214),
        ["RightWingWeb2"] = Color3.fromRGB(148, 136, 214),
        ["RightWingWeb3"] = Color3.fromRGB(148, 136, 214),
        ["TailSpikes"] = Color3.fromRGB(148, 136, 214),
        ["Tongue"] = Color3.fromRGB(148, 136, 214)
    },
    ["already_has_flying_wings"] = true,
    ["hold_offset"] = CFrame.new(0, 0, 0),
    ["minimum_run_anim_speed"] = 1,
    ["mounted_animation_scale_limit"] = 1
}
v2.shadow_dragon = v144
local v145 = {
    ["name"] = "Shark",
    ["image"] = "rbxassetid://6498256069",
    ["model"] = "Shark",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Ocean Event",
        ["origin_items"] = { "ocean_egg" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "SharkBeingDoubleHeld",
        ["eating"] = "SharkEat",
        ["hold"] = "SharkBeingHeld",
        ["idle"] = "SharkIdle",
        ["running"] = "SharkRun",
        ["sit"] = "SharkSit",
        ["sleep"] = "SharkSleep"
    },
    ["tricks"] = {
        { "Sit", "SharkSit" },
        { "Joyful", "SharkJoyful" },
        { "Beg", "SharkBeg" },
        { "Jump", "SharkJump" },
        { "Trick 1", "SharkTrick1" },
        { "Trick 2", "SharkTrick2" }
    },
    ["neon_parts"] = {
        ["Dorsal"] = Color3.fromRGB(4, 181, 175),
        ["Dorsal2"] = Color3.fromRGB(4, 181, 175),
        ["Head2"] = Color3.fromRGB(4, 181, 175),
        ["RearFinL"] = Color3.fromRGB(4, 181, 175),
        ["RearFinR"] = Color3.fromRGB(4, 181, 175),
        ["Tail"] = Color3.fromRGB(4, 181, 175),
        ["Tail2"] = Color3.fromRGB(4, 181, 175),
        ["Tail3"] = Color3.fromRGB(4, 181, 175),
        ["Torso5"] = Color3.fromRGB(4, 181, 175),
        ["Torso6"] = Color3.fromRGB(4, 181, 175),
        ["Torso7"] = Color3.fromRGB(4, 181, 175),
        ["Torso8"] = Color3.fromRGB(4, 181, 175)
    },
    ["already_has_flying_wings"] = true
}
v2.shark = v145
local v146 = {
    ["name"] = "Shiba Inu",
    ["image"] = "rbxassetid://3181728160",
    ["model"] = "ShibaInu",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Pets Update",
        ["origin_items"] = {
            "cracked_egg",
            "pet_egg",
            "royal_egg",
            "retired_egg"
        },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DogIdle",
        ["running"] = "DogRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(213, 115, 61),
        ["LeftFoot"] = Color3.fromRGB(213, 115, 61),
        ["LeftHand"] = Color3.fromRGB(213, 115, 61),
        ["RightEar2"] = Color3.fromRGB(213, 115, 61),
        ["RightFoot"] = Color3.fromRGB(213, 115, 61),
        ["RightHand"] = Color3.fromRGB(213, 115, 61),
        ["Tail"] = Color3.fromRGB(213, 115, 61)
    }
}
v2.shiba = v146
local v147 = {
    ["name"] = "Silly Duck",
    ["image"] = "rbxassetid://4440866911",
    ["model"] = "SillyDuck",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Farm Egg",
        ["origin_items"] = { "farm_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "SillyDuckBeingDoubleHeld",
        ["eating"] = "SillyDuckEating",
        ["hold"] = "SillyDuckBeingHeld",
        ["idle"] = "SillyDuckIdle",
        ["running"] = "SillyDuckRunning",
        ["sit"] = "SillyDuckSit",
        ["sleep"] = "SillyDuckSleep"
    },
    ["tricks"] = {
        { "Sit", "SillyDuckSit" },
        { "Lay down", "SillyDuckSleep" },
        { "Bounce", "SillyDuckJump" },
        { "Joy", "SillyDuckJoyful" },
        { "Dance 1", "SillyDuckTrick1" },
        { "Dance 2", "SillyDuckTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(77, 182, 65)
    },
    ["hold_offset"] = CFrame.new(0, 1.1, 0) * CFrame.Angles(0, 1.5707963267948966, 0)
}
v2.silly_duck = v147
local v148 = {
    ["name"] = "Skele-Rex",
    ["image"] = "rbxassetid://5862774166",
    ["model"] = "SkeleRex",
    ["rarity"] = "legendary",
    ["cost"] = 10000,
    ["currency_id"] = "candy_2020",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "SkeleRexBeingDoubleHeld",
        ["eating"] = "SkeleRexEat",
        ["hold"] = "SkeleRexBeingHeld",
        ["idle"] = "SkeleRexIdle",
        ["running"] = "SkeleRexRun",
        ["sit"] = "SkeleRexSit",
        ["sleep"] = "SkeleRexSleep"
    },
    ["tricks"] = {
        { "Sit", "SkeleRexSit" },
        { "Joyful", "SkeleRexJoyful" },
        { "Beg", "SkeleRexBeg" },
        { "Jump", "SkeleRexJump" },
        { "Trick 1", "SkeleRexTrick1" },
        { "Trick 2", "SkeleRexTrick2" }
    },
    ["neon_parts"] = {
        ["FingerBone2"] = Color3.fromRGB(66, 199, 189),
        ["FingerBone4"] = Color3.fromRGB(66, 199, 189),
        ["FingerBone6"] = Color3.fromRGB(66, 199, 189),
        ["FingerBone8"] = Color3.fromRGB(66, 199, 189),
        ["HeadSpines1"] = Color3.fromRGB(66, 199, 189),
        ["LeftFootClaws"] = Color3.fromRGB(66, 199, 189),
        ["LowerTeeth"] = Color3.fromRGB(66, 199, 189),
        ["RightFootClaws"] = Color3.fromRGB(66, 199, 189),
        ["Spine"] = Color3.fromRGB(66, 199, 189),
        ["Spine1"] = Color3.fromRGB(66, 199, 189),
        ["Spine2"] = Color3.fromRGB(66, 199, 189),
        ["Spine3"] = Color3.fromRGB(66, 199, 189),
        ["Spine4"] = Color3.fromRGB(66, 199, 189),
        ["Spine5"] = Color3.fromRGB(66, 199, 189),
        ["Spine6"] = Color3.fromRGB(66, 199, 189),
        ["Spine7"] = Color3.fromRGB(66, 199, 189),
        ["UpperTeeth"] = Color3.fromRGB(66, 199, 189)
    }
}
v2.skele_rex = v148
local v149 = {
    ["name"] = "Sloth",
    ["image"] = "rbxassetid://3934251801",
    ["model"] = "Sloth",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Pet Shop",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "BearBeingDoubleHeld",
        ["eating"] = "SlothEating",
        ["hold"] = "SlothBeingHeld",
        ["idle"] = "SlothIdle",
        ["running"] = "SlothRunning",
        ["sit"] = "SlothSit",
        ["sleep"] = "SlothSleep"
    },
    ["tricks"] = {
        { "Sit", "SlothSit" },
        { "Lay down", "SlothSleep" },
        { "Joy", "SlothJoyful" },
        { "Bounce", "SlothJump" },
        { "Dance 1", "SlothTrick" },
        { "Dance 2", "SlothTrick2" }
    },
    ["neon_parts"] = {
        ["LeftClaws"] = Color3.fromRGB(204, 142, 105),
        ["LeftFoot"] = Color3.fromRGB(204, 142, 105),
        ["Nose"] = Color3.fromRGB(204, 142, 105),
        ["RightClaws"] = Color3.fromRGB(204, 142, 105),
        ["RightFoot"] = Color3.fromRGB(204, 142, 105)
    },
    ["hold_offset"] = CFrame.new(0, 1, 0)
}
v2.sloth = v149
local v150 = {
    ["name"] = "Snow Cat",
    ["image"] = "rbxassetid://3181728229",
    ["model"] = "SnowCat",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Pets Update",
        ["origin_items"] = {
            "cracked_egg",
            "pet_egg",
            "royal_egg",
            "retired_egg"
        },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "CatIdle",
        ["running"] = "CatRunning",
        ["sit"] = "CatSit",
        ["sleep"] = "CatSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(255, 102, 204),
        ["LeftFoot"] = Color3.fromRGB(255, 102, 204),
        ["LeftHand"] = Color3.fromRGB(255, 102, 204),
        ["Nose"] = Color3.fromRGB(255, 102, 204),
        ["RightEar2"] = Color3.fromRGB(255, 102, 204),
        ["RightFoot"] = Color3.fromRGB(255, 102, 204),
        ["RightHand"] = Color3.fromRGB(255, 102, 204),
        ["Tail"] = Color3.fromRGB(255, 102, 204),
        ["Whiskers"] = Color3.fromRGB(255, 102, 204)
    }
}
v2.snow_cat = v150
local v151 = {
    ["name"] = "Snow Owl",
    ["image"] = "rbxassetid://6060988121",
    ["model"] = "SnowOwl",
    ["rarity"] = "legendary",
    ["cost"] = 10000,
    ["currency_id"] = "gingerbread_2020",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "SnowOwlBeingDoubleHeld",
        ["eating"] = "SnowOwlEat",
        ["hold"] = "SnowOwlBeingHeld",
        ["idle"] = "SnowOwlIdle",
        ["running"] = "SnowOwlRun",
        ["sit"] = "SnowOwlSit",
        ["sleep"] = "SnowOwlSleep"
    },
    ["tricks"] = {
        { "Sit", "SnowOwlSit" },
        { "Joyful", "SnowOwlJoyful" },
        { "Beg", "SnowOwlBeg" },
        { "Jump", "SnowOwlJump" },
        { "Trick 1", "SnowOwlTrick1" },
        { "Trick 2", "SnowOwlTrick2" }
    },
    ["neon_parts"] = {
        ["Brow"] = Color3.fromRGB(85, 165, 175),
        ["Eyestroke"] = Color3.fromRGB(85, 165, 175),
        ["Featherstorso2"] = Color3.fromRGB(85, 165, 175),
        ["Feathertipleft2"] = Color3.fromRGB(85, 165, 175),
        ["Feathertipleft4"] = Color3.fromRGB(85, 165, 175),
        ["Feathertipright2"] = Color3.fromRGB(85, 165, 175),
        ["Feathertipright4"] = Color3.fromRGB(85, 165, 175)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_run_anim_speed"] = 1
}
v2.snow_owl = v151
local v152 = {
    ["name"] = "Snow Puma",
    ["image"] = "rbxassetid://3181727125",
    ["model"] = "SnowPuma",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Pets Update",
        ["origin_items"] = {
            "cracked_egg",
            "pet_egg",
            "royal_egg",
            "retired_egg"
        },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "CatIdle",
        ["running"] = "CatRunning",
        ["sit"] = "CatSit",
        ["sleep"] = "CatSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(255, 102, 204),
        ["LeftFoot"] = Color3.fromRGB(255, 102, 204),
        ["LeftHand"] = Color3.fromRGB(255, 102, 204),
        ["Nose"] = Color3.fromRGB(255, 102, 204),
        ["RightEar2"] = Color3.fromRGB(255, 102, 204),
        ["RightFoot"] = Color3.fromRGB(255, 102, 204),
        ["RightHand"] = Color3.fromRGB(255, 102, 204),
        ["Tail"] = Color3.fromRGB(255, 102, 204),
        ["Whiskers"] = Color3.fromRGB(255, 102, 204)
    }
}
v2.snow_puma = v152
local v153 = {
    ["name"] = "Snowman",
    ["image"] = "rbxassetid://6060988175",
    ["model"] = "Snowman",
    ["rarity"] = "uncommon",
    ["cost"] = 2000,
    ["currency_id"] = "gingerbread_2020",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "SnowmanBeingDoubleHeld",
        ["eating"] = "SnowmanEat",
        ["hold"] = "SnowmanBeingHeld",
        ["idle"] = "SnowmanIdle",
        ["running"] = "SnowmanRun",
        ["sit"] = "SnowmanSit",
        ["sleep"] = "SnowmanSleep"
    },
    ["minigame_anims"] = {
        ["snowball_throw"] = "SnowmanSnowballThrow"
    },
    ["tricks"] = {
        { "Sit", "SnowmanSit" },
        { "Joyful", "SnowmanJoyful" },
        { "Beg", "SnowmanBeg" },
        { "Jump", "SnowmanJump" },
        { "Trick 1", "SnowmanTrick1" },
        { "Trick 2", "SnowmanTrick2" }
    },
    ["neon_parts"] = {
        ["Buttons"] = Color3.fromRGB(191, 115, 80),
        ["Buttons1"] = Color3.fromRGB(191, 115, 80),
        ["Buttons2"] = Color3.fromRGB(191, 115, 80),
        ["Nose"] = Color3.fromRGB(191, 115, 80)
    },
    ["eyes"] = { "EyeL", "EyeR" }
}
v2.snowman = v153
local v154 = {
    ["name"] = "Starfish",
    ["image"] = "rbxassetid://4800189682",
    ["model"] = "Starfish",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Star Rewards",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "StarfishBeingDoubleHeld",
        ["eating"] = "StarfishEating",
        ["hold"] = "StarfishBeingHeld",
        ["idle"] = "StarfishIdle",
        ["idle_mounted"] = "StarfishMountedIdle",
        ["running"] = "StarfishRunning",
        ["running_mounted"] = "StarfishRunningMounted",
        ["sit"] = "StarfishSit",
        ["sleep"] = "StarfishSleep"
    },
    ["tricks"] = {
        { "Sit", "StarfishSit" },
        { "Lay down", "StarfishSleep" },
        { "Joy", "StarfishJoyful" },
        { "Jump", "StarfishJump" },
        { "Trick 1", "StarfishTrick1" },
        { "Trick 2", "StarfishTrick2" }
    },
    ["neon_parts"] = {
        ["BlushMarks"] = Color3.fromRGB(255, 129, 207),
        ["Head2"] = Color3.fromRGB(110, 153, 202),
        ["LeftFoot2"] = Color3.fromRGB(110, 153, 202),
        ["LeftHand2"] = Color3.fromRGB(110, 153, 202),
        ["RightFoot2"] = Color3.fromRGB(110, 153, 202),
        ["RightHand2"] = Color3.fromRGB(110, 153, 202)
    },
    ["hold_offset"] = CFrame.new(0, 0.8, 0)
}
v2.starfish = v154
local v155 = {
    ["name"] = "Starter Egg",
    ["image"] = "rbxassetid://3215315313",
    ["model"] = "TutorialEgg",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["origin_entry"] = {
        ["origin"] = "Sir Woofington",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "EggIdle2",
        ["running"] = "EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 3
}
v2.starter_egg = v155
local v156 = {
    ["name"] = "Stegosaurus",
    ["image"] = "rbxassetid://5721844051",
    ["model"] = "Stegosaurus",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Fossil Isle",
        ["origin_items"] = { "fossil_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "StegosaurusBeingDoubleHeld",
        ["eating"] = "StegosaurusEat",
        ["hold"] = "StegosaurusBeingHeld",
        ["idle"] = "StegosaurusIdle",
        ["running"] = "StegosaurusRun",
        ["sit"] = "StegosaurusSit",
        ["sleep"] = "StegosaurusSleep"
    },
    ["tricks"] = {
        { "Sit", "StegosaurusSit" },
        { "Joyful", "StegosaurusJoyful" },
        { "Beg", "StegosaurusBeg" },
        { "Jump", "StegosaurusJump" },
        { "Trick 1", "StegosaurusTrick1" },
        { "Trick 2", "StegosaurusTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(189, 154, 84),
        ["BackRightFoot"] = Color3.fromRGB(189, 154, 84),
        ["FrontLeftFoot"] = Color3.fromRGB(189, 154, 84),
        ["FrontRightFoot"] = Color3.fromRGB(189, 154, 84),
        ["Head2"] = Color3.fromRGB(226, 76, 62),
        ["Head4"] = Color3.fromRGB(189, 154, 84),
        ["Tail11"] = Color3.fromRGB(226, 76, 62),
        ["Tail12"] = Color3.fromRGB(189, 154, 84),
        ["Tail3"] = Color3.fromRGB(226, 76, 62),
        ["Tail4"] = Color3.fromRGB(189, 154, 84),
        ["Tail7"] = Color3.fromRGB(226, 76, 62),
        ["Tail8"] = Color3.fromRGB(189, 154, 84),
        ["Torso3"] = Color3.fromRGB(226, 76, 62),
        ["Torso4"] = Color3.fromRGB(189, 154, 84)
    }
}
v2.stegosaurus = v156
local v157 = {
    ["name"] = "Stingray",
    ["image"] = "rbxassetid://6498255997",
    ["model"] = "Stingray",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Ocean Event",
        ["origin_items"] = { "ocean_egg" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "StingrayBeingDoubleHeld",
        ["eating"] = "StingrayEat",
        ["hold"] = "StingrayBeingHeld",
        ["idle"] = "StingrayIdle",
        ["running"] = "StingrayRun",
        ["sit"] = "StingraySit",
        ["sleep"] = "StingraySleep"
    },
    ["tricks"] = {
        { "Sit", "StingraySit" },
        { "Joyful", "StingrayJoyful" },
        { "Beg", "StingrayBeg" },
        { "Jump", "StingrayJump" },
        { "Trick 1", "StingrayTrick1" },
        { "Trick 2", "StingrayTrick2" }
    },
    ["neon_parts"] = {
        ["TailUnder"] = Color3.fromRGB(151, 93, 186),
        ["TorsoUnder"] = Color3.fromRGB(151, 93, 186)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_run_anim_speed"] = 0.3
}
v2.stingray = v157
local v158 = {
    ["name"] = "Swan",
    ["image"] = "rbxassetid://4506925800",
    ["model"] = "Swan",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "christmas_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "SwanBeingDoubleHeld",
        ["eating"] = "SwanEating",
        ["flying"] = "SwanFlying",
        ["hold"] = "SwanBeingHeld",
        ["idle"] = "SwanIdle",
        ["running"] = "SwanRunning",
        ["sit"] = "SwanSit",
        ["sleep"] = "SwanSleep"
    },
    ["tricks"] = {
        { "Sit", "SwanSit" },
        { "Lay down", "SwanSleep" },
        { "Bounce", "SwanJump" },
        { "Joy", "SwanJoyful" },
        { "Dance 1", "SwanTrick1" },
        { "Dance 2", "SwanTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(184, 179, 173),
        ["LeftWing"] = Color3.fromRGB(184, 179, 173),
        ["Neck"] = Color3.fromRGB(184, 179, 173),
        ["Neck2"] = Color3.fromRGB(184, 179, 173),
        ["RightWing"] = Color3.fromRGB(184, 179, 173),
        ["Tail"] = Color3.fromRGB(184, 179, 173),
        ["Torso"] = Color3.fromRGB(184, 179, 173)
    },
    ["already_has_flying_wings"] = true,
    ["hold_offset"] = CFrame.new(0, 1, 0),
    ["minimum_fly_anim_speed"] = 1
}
v2.swan = v158
local v159 = {
    ["name"] = "Tasmanian Tiger",
    ["image"] = "rbxassetid://5721844165",
    ["model"] = "TasmanianTiger",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Fossil Isle",
        ["origin_items"] = { "fossil_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "TasmanianTigerBeingDoubleHeld",
        ["eating"] = "TasmanianTigerEat",
        ["hold"] = "TasmanianTigerBeingHeld",
        ["idle"] = "TasmanianTigerIdle",
        ["running"] = "TasmanianTigerRun",
        ["sit"] = "TasmanianTigerSit",
        ["sleep"] = "TasmanianTigerSleep"
    },
    ["tricks"] = {
        { "Sit", "TasmanianTigerSit" },
        { "Joyful", "TasmanianTigerJoyful" },
        { "Beg", "TasmanianTigerBeg" },
        { "Jump", "TasmanianTigerJump" },
        { "Trick 1", "TasmanianTigerTrick1" },
        { "Trick 2", "TasmanianTigerTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(184, 105, 223),
        ["LeftFoot"] = Color3.fromRGB(184, 105, 223),
        ["LeftHand"] = Color3.fromRGB(184, 105, 223),
        ["RightEar2"] = Color3.fromRGB(184, 105, 223),
        ["RightFoot"] = Color3.fromRGB(184, 105, 223),
        ["RightHand"] = Color3.fromRGB(184, 105, 223),
        ["Stripes"] = Color3.fromRGB(184, 105, 223),
        ["TailStripe1"] = Color3.fromRGB(184, 105, 223),
        ["TailStripe2"] = Color3.fromRGB(184, 105, 223)
    }
}
v2.tasmanian_tiger = v159
local v160 = {
    ["name"] = "Toucan",
    ["image"] = "rbxassetid://4800190034",
    ["model"] = "Toucan",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Star Rewards",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "ToucanBeingDoubleHeld",
        ["eating"] = "ToucanEat",
        ["hold"] = "ToucanBeingHeld",
        ["idle"] = "ToucanIdle",
        ["running"] = "ToucanRunning",
        ["running_mounted"] = "ToucanRunningMounted",
        ["sit"] = "ToucanSit",
        ["sleep"] = "ToucanSleep"
    },
    ["tricks"] = {
        { "Sit", "ToucanSit" },
        { "Lay down", "ToucanSleep" },
        { "Bounce", "ToucanJump" },
        { "Joy", "ToucanJoyful" },
        { "Trick 1", "ToucanTrick1" },
        { "Trick 2", "ToucanTrick2" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(199, 172, 120),
        ["LeftWing.001"] = Color3.fromRGB(199, 172, 120),
        ["LowerBeak"] = Color3.fromRGB(199, 172, 120),
        ["RightFoot"] = Color3.fromRGB(199, 172, 120)
    },
    ["already_has_flying_wings"] = true,
    ["hold_offset"] = CFrame.new(0, 0.7, -0.25),
    ["minimum_run_anim_speed"] = 1,
    ["mounted_animation_scale_limit"] = 1
}
v2.toucan = v160
local v161 = {
    ["name"] = "Toy Monkey",
    ["image"] = "rbxassetid://5067925193",
    ["model"] = "ToyMonkey",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Monkey Fairground",
        ["origin_items"] = { "monkey", "3 cymbals" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "MonkeyHold2",
        ["eating"] = "MonkeyEat",
        ["hold"] = "MonkeyHold1",
        ["idle"] = "ToyMonkeyIdle",
        ["running"] = "ToyMonkeyRun",
        ["sit"] = "ToyMonkeySit",
        ["sleep"] = "MonkeySleep"
    },
    ["tricks"] = {
        { "Jump", "ToyMonkeyJump" },
        { "Lay down", "MonkeySleep" },
        { "Beg", "MonkeyBeg" },
        { "Joyful", "ToyMonkeyJoyful" },
        { "Trick 1", "ToyMonkeyTrick" },
        { "Trick 2", "MonkeyTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(191, 113, 77),
        ["LeftFoot"] = Color3.fromRGB(191, 113, 77),
        ["LeftHand"] = Color3.fromRGB(191, 113, 77),
        ["RightEar2"] = Color3.fromRGB(191, 113, 77),
        ["RightFoot"] = Color3.fromRGB(191, 113, 77),
        ["RightHand"] = Color3.fromRGB(191, 113, 77)
    },
    ["hold_offset"] = CFrame.new(0, 0.8, 0)
}
v2.toy_monkey = v161
local v162 = {
    ["name"] = "T-Rex",
    ["image"] = "rbxassetid://5721844281",
    ["model"] = "TRex",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Fossil Isle",
        ["origin_items"] = { "fossil_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "TRexBeingDoubleHeld",
        ["eating"] = "TRexEat",
        ["hold"] = "TRexBeingHeld",
        ["idle"] = "TRexIdle",
        ["running"] = "TRexRun",
        ["sit"] = "TRexSit",
        ["sleep"] = "TRexSleep"
    },
    ["tricks"] = {
        { "Sit", "TRexSit" },
        { "Joyful", "TRexJoyful" },
        { "Beg", "TRexBeg" },
        { "Jump", "TRexJump" },
        { "Trick 1", "TRexTrick1" },
        { "Trick 2", "TRexTrick2" }
    },
    ["neon_parts"] = {
        ["HeadSpines"] = Color3.fromRGB(202, 105, 88),
        ["LeftFootClaws"] = Color3.fromRGB(202, 105, 88),
        ["LeftHandClaws"] = Color3.fromRGB(202, 105, 88),
        ["RightFootClaws"] = Color3.fromRGB(202, 105, 88),
        ["RightHandClaws"] = Color3.fromRGB(202, 105, 88),
        ["Stripe3"] = Color3.fromRGB(202, 105, 88),
        ["Stripe4"] = Color3.fromRGB(202, 105, 88),
        ["Stripe5"] = Color3.fromRGB(202, 105, 88),
        ["TailSpine"] = Color3.fromRGB(202, 105, 88),
        ["TailSpine2"] = Color3.fromRGB(202, 105, 88),
        ["TailSpine3"] = Color3.fromRGB(202, 105, 88),
        ["TailSpine4"] = Color3.fromRGB(202, 105, 88),
        ["TorsoSpines"] = Color3.fromRGB(202, 105, 88),
        ["TorsoStripes"] = Color3.fromRGB(202, 105, 88)
    }
}
v2.trex = v162
local v163 = {
    ["name"] = "Triceratops",
    ["image"] = "rbxassetid://5721844402",
    ["model"] = "Triceratops",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Fossil Isle",
        ["origin_items"] = { "fossil_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "TriceratopsBeingDoubleHeld",
        ["eating"] = "TriceratopsEat",
        ["hold"] = "TriceratopsBeingHeld",
        ["idle"] = "TriceratopsIdle",
        ["running"] = "TriceratopsRun",
        ["sit"] = "TriceratopsSit",
        ["sleep"] = "TriceratopsSleep"
    },
    ["tricks"] = {
        { "Sit", "TriceratopsSit" },
        { "Joyful", "TriceratopsJoyful" },
        { "Beg", "TriceratopsBeg" },
        { "Jump", "TriceratopsJump" },
        { "Trick 1", "TriceratopsTrick1" },
        { "Trick 2", "TriceratopsTrick2" }
    },
    ["neon_parts"] = {
        ["Head4"] = Color3.fromRGB(71, 186, 96),
        ["Head5"] = Color3.fromRGB(71, 186, 96),
        ["Head7"] = Color3.fromRGB(71, 186, 96),
        ["Horns1"] = Color3.fromRGB(71, 186, 96),
        ["LeftBackFoot"] = Color3.fromRGB(71, 186, 96),
        ["LeftFrontFoot"] = Color3.fromRGB(71, 186, 96),
        ["RightBackFoot"] = Color3.fromRGB(71, 186, 96),
        ["RightFrontFoot"] = Color3.fromRGB(71, 186, 96),
        ["Tail3"] = Color3.fromRGB(71, 186, 96),
        ["Tail6"] = Color3.fromRGB(71, 186, 96),
        ["Torso3"] = Color3.fromRGB(71, 186, 96)
    }
}
v2.triceratops = v163
local v164 = {
    ["name"] = "Turkey",
    ["image"] = "rbxassetid://4440866528",
    ["model"] = "Turkey",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Farm Egg",
        ["origin_items"] = { "farm_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "ChickenBeingDoubleHeld",
        ["eating"] = "ChickenEating",
        ["hold"] = "ChickenBeingHeld",
        ["idle"] = "ChickenIdle",
        ["running"] = "ChickenRunning",
        ["sit"] = "ChickenSit",
        ["sleep"] = "ChickenSleep"
    },
    ["tricks"] = {
        { "Sit", "ChickenSit" },
        { "Lay down", "ChickenSleep" },
        { "Dig", "ChickenDig" },
        { "Joy", "ChickenJoyful" },
        { "Dance 1", "ChickenTrick1" },
        { "Dance 2", "ChickenTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(194, 103, 91),
        ["Neck"] = Color3.fromRGB(194, 103, 91),
        ["Snoods"] = Color3.fromRGB(195, 78, 75),
        ["Tail"] = Color3.fromRGB(194, 103, 91)
    },
    ["hold_offset"] = CFrame.new(0.4, 0.6, -0.4)
}
v2.turkey = v164
local v165 = {
    ["name"] = "Turtle",
    ["image"] = "rbxassetid://4708551322",
    ["model"] = "Turtle",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Aussie Egg",
        ["origin_items"] = { "aussie_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "TurtleBeingDoubleHeld",
        ["eating"] = "TurtleEating",
        ["hold"] = "TurtleBeingHeld",
        ["idle"] = "TurtleIdle",
        ["running"] = "TurtleRunning",
        ["running_mounted"] = "TurtleRunning2",
        ["sit"] = "TurtleSit",
        ["sleep"] = "TurtleSleep"
    },
    ["tricks"] = {
        { "Sit", "TurtleSit" },
        { "Jump", "TurtleJump" },
        { "Dig", "TurtleDig" },
        { "Joy", "TurtleJoyful" },
        { "Trick 1", "TurtleTrick2" },
        { "Trick 2", "TurtleTrick3" }
    },
    ["neon_parts"] = {
        ["LeftFoot"] = Color3.fromRGB(116, 179, 80),
        ["LeftHand"] = Color3.fromRGB(116, 179, 80),
        ["RightFoot"] = Color3.fromRGB(116, 179, 80),
        ["RightHand"] = Color3.fromRGB(116, 179, 80),
        ["Shell"] = Color3.fromRGB(116, 179, 80)
    },
    ["mega_neon_colors"] = { Color3.fromRGB(85, 255, 187), Color3.fromRGB(67, 213, 89) },
    ["hold_double_offset"] = CFrame.new(),
    ["hold_offset"] = CFrame.Angles(0, 3.141592653589793, 0) * CFrame.new(0.2, 0.7, 0.3)
}
v2.turtle = v165
local v166 = {
    ["name"] = "Unicorn",
    ["image"] = "rbxassetid://3181728194",
    ["model"] = "Unicorn",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Pets Update",
        ["origin_items"] = {
            "cracked_egg",
            "pet_egg",
            "royal_egg",
            "retired_egg"
        },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "RedPandaIdle",
        ["running"] = "RedPandaRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["Hair1"] = Color3.fromRGB(255, 102, 204),
        ["Hair2"] = Color3.fromRGB(95, 211, 95),
        ["Hair3"] = Color3.fromRGB(211, 203, 88),
        ["Horn"] = Color3.fromRGB(255, 102, 204),
        ["LeftFoot"] = Color3.fromRGB(255, 102, 204),
        ["LeftHand"] = Color3.fromRGB(255, 102, 204),
        ["RightFoot"] = Color3.fromRGB(255, 102, 204),
        ["RightHand"] = Color3.fromRGB(255, 102, 204),
        ["Tail"] = Color3.fromRGB(255, 102, 204)
    },
    ["mega_neon_colors"] = {
        Color3.fromRGB(255, 204, 102),
        Color3.fromRGB(44, 232, 101),
        Color3.fromRGB(225, 100, 205),
        Color3.fromRGB(95, 95, 211)
    }
}
v2.unicorn = v166
local v167 = {
    ["name"] = "Wild Boar",
    ["image"] = "rbxassetid://3409443896",
    ["model"] = "WildBoar",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Safari Egg",
        ["origin_items"] = { "safari_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "RedPandaIdle",
        ["running"] = "RedPandaRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(209, 0, 0),
        ["LeftFoot"] = Color3.fromRGB(209, 0, 0),
        ["LeftHand"] = Color3.fromRGB(209, 0, 0),
        ["RightEar2"] = Color3.fromRGB(209, 0, 0),
        ["RightFoot"] = Color3.fromRGB(209, 0, 0),
        ["RightHand"] = Color3.fromRGB(209, 0, 0),
        ["Tail2"] = Color3.fromRGB(209, 0, 0),
        ["Tusk"] = Color3.fromRGB(209, 0, 0)
    },
    ["set"] = "safari"
}
v2.wild_boar = v167
local v168 = {
    ["name"] = "Wolf",
    ["image"] = "rbxassetid://4506925747",
    ["model"] = "Wolf",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "christmas_egg" },
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "DogIdle",
        ["running"] = "RedPandaRunning",
        ["sit"] = "ReindeerSit",
        ["sleep"] = "WolfSleep"
    },
    ["tricks"] = {
        { "Sit", "ReindeerSit" },
        { "Lay down", "WolfSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "WolfRollover" },
        { "Dance", "DogDance" },
        { "Howl", "WolfTrick1" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(91, 108, 218),
        ["LeftEar2"] = Color3.fromRGB(91, 108, 218),
        ["LeftFoot"] = Color3.fromRGB(91, 108, 218),
        ["LeftHand"] = Color3.fromRGB(91, 108, 218),
        ["RightEar2"] = Color3.fromRGB(91, 108, 218),
        ["RightFoot"] = Color3.fromRGB(91, 108, 218),
        ["RightHand"] = Color3.fromRGB(91, 108, 218),
        ["Tail"] = Color3.fromRGB(91, 108, 218),
        ["Torso2"] = Color3.fromRGB(91, 108, 218)
    },
    ["hold_offset"] = CFrame.new(0.2, 0.2, 0)
}
v2.wolf = v168
local v169 = {
    ["name"] = "Wolpertinger",
    ["image"] = "rbxassetid://7126719464",
    ["model"] = "Wolpertinger",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Mythic Egg",
        ["origin_items"] = { "mythic_egg" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "WolpertingerBeingDoubleHeld",
        ["eating"] = "WolpertingerEat",
        ["hold"] = "WolpertingerBeingHeld",
        ["idle"] = "WolpertingerIdle",
        ["running"] = "WolpertingerRun",
        ["sit"] = "WolpertingerSit",
        ["sleep"] = "WolpertingerSleep"
    },
    ["tricks"] = {
        { "Sit", "WolpertingerSit" },
        { "Joyful", "WolpertingerJoyful" },
        { "Beg", "WolpertingerBeg" },
        { "Jump", "WolpertingerJump" },
        { "Trick 1", "WolpertingerTrick1" },
        { "Trick 2", "WolpertingerTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(211, 190, 150),
        ["RightEar2"] = Color3.fromRGB(211, 190, 150),
        ["Torso4"] = Color3.fromRGB(211, 190, 150),
        ["Torso5"] = Color3.fromRGB(211, 190, 150)
    },
    ["already_has_flying_wings"] = true
}
v2.wolpertinger = v169
local v170 = {
    ["name"] = "Woolly Mammoth",
    ["image"] = "rbxassetid://5721844511",
    ["model"] = "WoollyMammoth",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Fossil Isle",
        ["origin_items"] = { "fossil_egg" },
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "WoollyMammothBeingDoubleHeld",
        ["eating"] = "WoollyMammothEat",
        ["hold"] = "WoollyMammothBeingHeld",
        ["idle"] = "WoollyMammothIdle",
        ["running"] = "WoollyMammothRun",
        ["sit"] = "WoollyMammothSit",
        ["sleep"] = "WoollyMammothSleep"
    },
    ["tricks"] = {
        { "Sit", "WoollyMammothSit" },
        { "Joyful", "WoollyMammothJoyful" },
        { "Beg", "WoollyMammothBeg" },
        { "Jump", "WoollyMammothJump" },
        { "Trick 1", "WoollyMammothTrick1" },
        { "Trick 2", "WoollyMammothTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(200, 110, 122),
        ["LeftFoot"] = Color3.fromRGB(200, 110, 122),
        ["LeftHand"] = Color3.fromRGB(200, 110, 122),
        ["RightEar2"] = Color3.fromRGB(200, 110, 122),
        ["RightFoot"] = Color3.fromRGB(200, 110, 122),
        ["RightHand"] = Color3.fromRGB(200, 110, 122),
        ["Tail"] = Color3.fromRGB(200, 110, 122),
        ["Tusk"] = Color3.fromRGB(200, 110, 122)
    }
}
v2.woolly_mammoth = v170
local v171 = {
    ["name"] = "Wyvern",
    ["image"] = "rbxassetid://7126720060",
    ["model"] = "Wyvern",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Mythic Egg",
        ["origin_items"] = { "mythic_egg" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "WyvernBeingDoubleHeld",
        ["eating"] = "WyvernEat",
        ["hold"] = "WyvernBeingHeld",
        ["idle"] = "WyvernIdle",
        ["running"] = "WyvernRun",
        ["sit"] = "WyvernSit",
        ["sleep"] = "WyvernSleep"
    },
    ["tricks"] = {
        { "Sit", "WyvernSit" },
        { "Joyful", "WyvernJoyful" },
        { "Beg", "WyvernBeg" },
        { "Jump", "WyvernJump" },
        { "Trick 1", "WyvernTrick1" },
        { "Trick 2", "WyvernTrick2" }
    },
    ["neon_parts"] = {
        ["BackSpikes"] = Color3.fromRGB(178, 179, 179),
        ["FaceSpike"] = Color3.fromRGB(178, 179, 179),
        ["Spike"] = Color3.fromRGB(178, 179, 179),
        ["Spike10"] = Color3.fromRGB(178, 179, 179),
        ["Spike11"] = Color3.fromRGB(178, 179, 179),
        ["Spike12"] = Color3.fromRGB(178, 179, 179),
        ["Spike13"] = Color3.fromRGB(178, 179, 179),
        ["Spike14"] = Color3.fromRGB(178, 179, 179),
        ["Spike2"] = Color3.fromRGB(178, 179, 179),
        ["Spike3"] = Color3.fromRGB(178, 179, 179),
        ["Spike4"] = Color3.fromRGB(178, 179, 179),
        ["Spike5"] = Color3.fromRGB(178, 179, 179),
        ["Spike6"] = Color3.fromRGB(178, 179, 179),
        ["Spike8"] = Color3.fromRGB(178, 179, 179),
        ["Spike9"] = Color3.fromRGB(178, 179, 179),
        ["Tail"] = Color3.fromRGB(178, 179, 179),
        ["Torso3"] = Color3.fromRGB(178, 179, 179),
        ["Wings3"] = Color3.fromRGB(178, 179, 179)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes", "Eyes2" },
    ["minimum_run_anim_speed"] = 0.5
}
v2.wyvern = v171
local v172 = {
    ["name"] = "Yeti",
    ["image"] = "rbxassetid://6060987821",
    ["model"] = "Yeti",
    ["rarity"] = "ultra_rare",
    ["cost"] = 6000,
    ["currency_id"] = "gingerbread_2020",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2020
    },
    ["anims"] = {
        ["double_hold"] = "YetiBeingDoubleHeld",
        ["eating"] = "YetiEat",
        ["hold"] = "YetiBeingHeld",
        ["idle"] = "YetiIdle",
        ["running"] = "YetiRun",
        ["sit"] = "YetiSit",
        ["sleep"] = "YetiSleep"
    },
    ["tricks"] = {
        { "Sit", "YetiSit" },
        { "Joyful", "YetiJoyful" },
        { "Beg", "YetiBeg" },
        { "Jump", "YetiJump" },
        { "Trick 1", "YetiTrick1" },
        { "Trick 2", "YetiTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(190, 150, 93),
        ["LeftArm3"] = Color3.fromRGB(190, 150, 93),
        ["LeftFoot"] = Color3.fromRGB(190, 150, 93),
        ["RightArm3"] = Color3.fromRGB(190, 150, 93),
        ["RightFoot"] = Color3.fromRGB(190, 150, 93)
    }
}
v2.yeti = v172
local v173 = {
    ["name"] = "Zombie Buffalo",
    ["image"] = "rbxassetid://4115249264",
    ["model"] = "ZombieBuffalo",
    ["rarity"] = "ultra_rare",
    ["currency_id"] = "candy_2019",
    ["origin_entry"] = {
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2019
    },
    ["anims"] = {
        ["double_hold"] = "DogBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "DogBeingHeld",
        ["idle"] = "RedPandaIdle",
        ["running"] = "RedPandaRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["tricks"] = {
        { "Sit", "DogSit" },
        { "Lay down", "DogSleep" },
        { "Bounce", "DogBounce" },
        { "Roll over", "DogRollover" },
        { "Backflip", "DogBackflip" },
        { "Dance", "DogDance" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(255, 0, 0),
        ["Nose"] = Color3.fromRGB(255, 0, 0)
    }
}
v2.zombie_buffalo = v173
return v1(v2)