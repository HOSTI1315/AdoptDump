--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper)
local v_u_2 = require(game.ReplicatedStorage.Fsys).load("LiveOpsTime")
local v3 = v1.pets
local v4 = {}
local v5 = {
    ["name"] = "Evil Rock",
    ["image"] = "rbxassetid://15096097714",
    ["model"] = "Halloween2023EvilRock",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["year"] = 2023,
        ["origin"] = "Halloween",
        ["origin_items"] = {}
    },
    ["anims"] = {
        ["sleep"] = "RockIdle",
        ["running"] = "RockRunning",
        ["eating"] = "RockEating",
        ["idle"] = "RockIdle",
        ["sit"] = "RockIdle",
        ["hold"] = "RockIdle",
        ["running_mounted"] = "EggRunning",
        ["double_hold"] = "RockIdle"
    },
    ["tricks"] = {
        { "Do Nothing", "RockIdle" },
        { "Play Dead", "RockIdle" },
        { "Stay", "RockIdle" },
        { "Erode", "RockIdle" },
        { "Sit Still", "RockIdle" },
        { "Think", "RockIdle" }
    },
    ["neon_parts"] = {
        ["EyeWhites"] = Color3.fromRGB(255, 119, 121),
        ["Pupil1"] = Color3.fromRGB(255, 119, 121),
        ["Pupil2"] = Color3.fromRGB(255, 119, 121),
        ["Lips"] = Color3.fromRGB(255, 119, 121)
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["hold_offset"] = CFrame.new(0, 1.1, 0),
    ["no_eyes"] = true
}
v4.halloween_2023_evil_rock = v5
local v6 = {
    ["name"] = "Vampire Dragon",
    ["image"] = "rbxassetid://14782580581",
    ["model"] = "Halloween2023VampireDragon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["year"] = 2023,
        ["origin"] = "Halloween",
        ["origin_items"] = {}
    },
    ["anims"] = {
        ["sleep"] = "Halloween2023VampireDragonSleep",
        ["running"] = "Halloween2023VampireDragonRun",
        ["eating"] = "Halloween2023VampireDragonEat",
        ["idle"] = "Halloween2023VampireDragonIdle",
        ["sit"] = "Halloween2023VampireDragonSit",
        ["hold"] = "Halloween2023VampireDragonBeingHeldSingle",
        ["flying"] = "Halloween2023VampireDragonRun",
        ["double_hold"] = "Halloween2023VampireDragonBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Halloween2023VampireDragonSit" },
        { "Joyful", "Halloween2023VampireDragonJoyful" },
        { "Beg", "Halloween2023VampireDragonBeg" },
        { "Jump", "Halloween2023VampireDragonJump" },
        { "Trick 1", "Halloween2023VampireDragonTrick1" },
        { "Trick 2", "Halloween2023VampireDragonTrick2" }
    },
    ["neon_parts"] = {
        ["LeftWing4bb"] = Color3.fromRGB(92, 85, 188),
        ["LeftWing3"] = Color3.fromRGB(92, 85, 188),
        ["Torso2"] = Color3.fromRGB(92, 85, 188),
        ["FrontRightFoot"] = Color3.fromRGB(92, 85, 188),
        ["RightWing2"] = Color3.fromRGB(92, 85, 188),
        ["LeftWing2"] = Color3.fromRGB(92, 85, 188),
        ["LeftWing4aaa"] = Color3.fromRGB(92, 85, 188),
        ["Head"] = Color3.fromRGB(92, 85, 188),
        ["RightWing4aaa"] = Color3.fromRGB(92, 85, 188),
        ["RightWing4aa"] = Color3.fromRGB(92, 85, 188),
        ["RightWing4"] = Color3.fromRGB(92, 85, 188),
        ["BackRightFoot"] = Color3.fromRGB(92, 85, 188),
        ["Eyes"] = Color3.fromRGB(131, 115, 252),
        ["RightWing3"] = Color3.fromRGB(92, 85, 188),
        ["LeftWing4aa"] = Color3.fromRGB(92, 85, 188),
        ["BackLeftFoot"] = Color3.fromRGB(92, 85, 188),
        ["LeftWing4"] = Color3.fromRGB(92, 85, 188),
        ["RightWing4bb"] = Color3.fromRGB(92, 85, 188),
        ["FrontLeftFoot"] = Color3.fromRGB(92, 85, 188)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v4.halloween_2023_vampire_dragon = v6
local v7 = {
    ["name"] = "Dire Stag",
    ["image"] = "rbxassetid://14892649590",
    ["model"] = "Halloween2023DireStag",
    ["rarity"] = "legendary",
    ["cost"] = 125000,
    ["currency_id"] = "candy_2023",
    ["origin_entry"] = {
        ["year"] = 2023,
        ["origin"] = "Halloween",
        ["origin_items"] = {}
    },
    ["anims"] = {
        ["sleep"] = "Halloween2023DireStagSleep",
        ["running"] = "Halloween2023DireStagRun",
        ["eating"] = "Halloween2023DireStagEat",
        ["idle"] = "Halloween2023DireStagIdle",
        ["sit"] = "Halloween2023DireStagSit",
        ["flying"] = "Halloween2023DireStagRun",
        ["hold"] = "Halloween2023DireStagBeingHeldSingle",
        ["double_hold"] = "Halloween2023DireStagBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Halloween2023DireStagSit" },
        { "Joyful", "Halloween2023DireStagJoyful" },
        { "Beg", "Halloween2023DireStagBeg" },
        { "Jump", "Halloween2023DireStagJump" },
        { "Trick 1", "Halloween2023DireStagTrick1" },
        { "Trick 2", "Halloween2023DireStagTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(229, 183, 126),
        ["RightAntler"] = Color3.fromRGB(221, 87, 25),
        ["LeftAntler"] = Color3.fromRGB(221, 87, 25),
        ["Fur"] = Color3.fromRGB(221, 87, 25),
        ["Head2"] = Color3.fromRGB(66, 68, 60),
        ["Nose"] = Color3.fromRGB(221, 87, 25),
        ["Head3"] = Color3.fromRGB(221, 87, 25)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v4.halloween_2023_dire_stag = v7
local v8 = {
    ["name"] = "Scarecrow Cat",
    ["image"] = "rbxassetid://14978702254",
    ["model"] = "Halloween2023ScarecrowCat",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["year"] = 2023,
        ["origin"] = "Halloween",
        ["origin_items"] = { "halloween_2023_scarecrow_box" }
    },
    ["anims"] = {
        ["sleep"] = "Halloween2023ScarecrowCatSleep",
        ["running"] = "Halloween2023ScarecrowCatRun",
        ["eating"] = "Halloween2023ScarecrowCatEat",
        ["idle"] = "Halloween2023ScarecrowCatIdle",
        ["sit"] = "Halloween2023ScarecrowCatSit",
        ["flying"] = "Halloween2023ScarecrowCatRun",
        ["hold"] = "Halloween2023ScarecrowCatBeingHeldSingle",
        ["double_hold"] = "Halloween2023ScarecrowCatBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Halloween2023ScarecrowCatSit" },
        { "Joyful", "Halloween2023ScarecrowCatJoyful" },
        { "Beg", "Halloween2023ScarecrowCatBeg" },
        { "Jump", "Halloween2023ScarecrowCatJump" },
        { "Trick 1", "Halloween2023ScarecrowCatTrick1" },
        { "Trick 2", "Halloween2023ScarecrowCatTrick2" }
    },
    ["neon_parts"] = {
        ["Torso2"] = Color3.fromRGB(189, 93, 73),
        ["RightArm"] = Color3.fromRGB(189, 93, 73),
        ["Eyes"] = Color3.fromRGB(200, 107, 26),
        ["LeftArm"] = Color3.fromRGB(189, 93, 73)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v4.halloween_2023_scarecrow_cat = v8
local v9 = {
    ["name"] = "Scarecrow Crow",
    ["image"] = "rbxassetid://14978701948",
    ["model"] = "Halloween2023ScarecrowCrow",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["year"] = 2023,
        ["origin"] = "Halloween",
        ["origin_items"] = { "halloween_2023_scarecrow_box" }
    },
    ["anims"] = {
        ["sleep"] = "Halloween2023ScarecrowCrowSleep",
        ["running"] = "Halloween2023ScarecrowCrowRun",
        ["eating"] = "Halloween2023ScarecrowCrowEat",
        ["idle"] = "Halloween2023ScarecrowCrowIdle",
        ["sit"] = "Halloween2023ScarecrowCrowSit",
        ["flying"] = "Halloween2023ScarecrowCrowRun",
        ["hold"] = "Halloween2023ScarecrowCrowBeingHeldSingle",
        ["double_hold"] = "Halloween2023ScarecrowCrowBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Halloween2023ScarecrowCrowSit" },
        { "Joyful", "Halloween2023ScarecrowCrowJoyful" },
        { "Beg", "Halloween2023ScarecrowCrowBeg" },
        { "Jump", "Halloween2023ScarecrowCrowJump" },
        { "Trick 1", "Halloween2023ScarecrowCrowTrick1" },
        { "Trick 2", "Halloween2023ScarecrowCrowTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(193, 115, 70),
        ["LeftWing2"] = Color3.fromRGB(188, 109, 45),
        ["RightWing3"] = Color3.fromRGB(188, 109, 45),
        ["Torso2"] = Color3.fromRGB(188, 109, 45),
        ["RightWing2"] = Color3.fromRGB(188, 109, 45),
        ["Tail"] = Color3.fromRGB(188, 109, 45),
        ["Head3"] = Color3.fromRGB(188, 109, 45),
        ["LeftWing3"] = Color3.fromRGB(188, 109, 45)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v4.halloween_2023_scarecrow_crow = v9
local v10 = {
    ["name"] = "Ghost",
    ["image"] = "rbxassetid://14815828879",
    ["model"] = "Halloween2023Ghost",
    ["rarity"] = "common",
    ["cost"] = 3500,
    ["currency_id"] = "candy_2023",
    ["origin_entry"] = {
        ["year"] = 2023,
        ["origin"] = "Halloween",
        ["origin_items"] = {}
    },
    ["anims"] = {
        ["sleep"] = "Halloween2023GhostSleep",
        ["running"] = "Halloween2023GhostRun",
        ["eating"] = "Halloween2023GhostEat",
        ["idle"] = "Halloween2023GhostIdle",
        ["sit"] = "Halloween2023GhostSit",
        ["hold"] = "Halloween2023GhostBeingHeldSingle",
        ["flying"] = "Halloween2023GhostRun",
        ["double_hold"] = "Halloween2023GhostBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Halloween2023GhostSit" },
        { "Joyful", "Halloween2023GhostJoyful" },
        { "Beg", "Halloween2023GhostBeg" },
        { "Jump", "Halloween2023GhostJump" },
        { "Trick 1", "Halloween2023GhostTrick1" },
        { "Trick 2", "Halloween2023GhostTrick2" }
    },
    ["neon_parts"] = {
        ["Torso"] = Color3.fromRGB(180, 180, 184)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true,
    ["head_rotator_disabled"] = true
}
v4.halloween_2023_ghost = v10
local v11 = {
    ["name"] = "Cute-A-Cabra",
    ["image"] = "rbxassetid://14850232913",
    ["model"] = "Halloween2023Cuteacabra",
    ["rarity"] = "uncommon",
    ["cost"] = 9000,
    ["currency_id"] = "candy_2023",
    ["origin_entry"] = {
        ["year"] = 2023,
        ["origin"] = "Halloween",
        ["origin_items"] = {}
    },
    ["anims"] = {
        ["sleep"] = "Halloween2023CuteacabraSleep",
        ["running"] = "Halloween2023CuteacabraRun",
        ["eating"] = "Halloween2023CuteacabraEat",
        ["idle"] = "Halloween2023CuteacabraIdle",
        ["sit"] = "Halloween2023CuteacabraSit",
        ["flying"] = "Halloween2023CuteacabraRun",
        ["hold"] = "Halloween2023CuteacabraBeingHeldSingle",
        ["double_hold"] = "Halloween2023CuteacabraBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Halloween2023CuteacabraSit" },
        { "Joyful", "Halloween2023CuteacabraJoyful" },
        { "Beg", "Halloween2023CuteacabraBeg" },
        { "Jump", "Halloween2023CuteacabraJump" },
        { "Trick 1", "Halloween2023CuteacabraTrick1" },
        { "Trick 2", "Halloween2023CuteacabraTrick2" }
    },
    ["neon_parts"] = {
        ["Head4"] = Color3.fromRGB(105, 100, 206),
        ["Torso3"] = Color3.fromRGB(105, 100, 206),
        ["BackRightFoot"] = Color3.fromRGB(105, 100, 206),
        ["LeftEar2"] = Color3.fromRGB(105, 100, 206),
        ["FrontRightFoot"] = Color3.fromRGB(105, 100, 206),
        ["BackLeftFoot"] = Color3.fromRGB(105, 100, 206),
        ["RightEar2"] = Color3.fromRGB(105, 100, 206),
        ["Torso2"] = Color3.fromRGB(105, 100, 206),
        ["FrontLeftFoot"] = Color3.fromRGB(105, 100, 206)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v4.halloween_2023_cuteacabra = v11
local v12 = {
    ["name"] = "Scarecrow",
    ["image"] = "rbxassetid://14978701751",
    ["model"] = "Halloween2023Scarecrow",
    ["rarity"] = "uncommon",
    ["cost"] = 11000,
    ["currency_id"] = "candy_2023",
    ["origin_entry"] = {
        ["year"] = 2023,
        ["origin"] = "Halloween",
        ["origin_items"] = {}
    },
    ["anims"] = {
        ["sleep"] = "Halloween2023ScarecrowSleep",
        ["running"] = "Halloween2023ScarecrowRun",
        ["eating"] = "Halloween2023ScarecrowEat",
        ["idle"] = "Halloween2023ScarecrowIdle",
        ["sit"] = "Halloween2023ScarecrowSit",
        ["flying"] = "Halloween2023ScarecrowRun",
        ["hold"] = "Halloween2023ScarecrowBeingHeldSingle",
        ["double_hold"] = "Halloween2023ScarecrowBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Halloween2023ScarecrowSit" },
        { "Joyful", "Halloween2023ScarecrowJoyful" },
        { "Beg", "Halloween2023ScarecrowBeg" },
        { "Jump", "Halloween2023ScarecrowJump" },
        { "Trick 1", "Halloween2023ScarecrowTrick1" },
        { "Trick 2", "Halloween2023ScarecrowTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(200, 107, 26),
        ["LeftArm3"] = Color3.fromRGB(234, 121, 22),
        ["Head4"] = Color3.fromRGB(234, 121, 22),
        ["Bottom"] = Color3.fromRGB(234, 121, 22),
        ["Torso2"] = Color3.fromRGB(234, 121, 22),
        ["RightArm3"] = Color3.fromRGB(234, 121, 22),
        ["HatRoot"] = Color3.fromRGB(234, 121, 22),
        ["Torso3"] = Color3.fromRGB(234, 121, 22)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v4.halloween_2023_scarecrow = v12
local v13 = {
    ["name"] = "Undead Elk",
    ["image"] = "rbxassetid://14782580070",
    ["model"] = "Halloween2023UndeadElk",
    ["rarity"] = "rare",
    ["cost"] = 25000,
    ["currency_id"] = "candy_2023",
    ["origin_entry"] = {
        ["year"] = 2023,
        ["origin"] = "Halloween",
        ["origin_items"] = {}
    },
    ["anims"] = {
        ["sleep"] = "Halloween2023UndeadElkSleep",
        ["running"] = "Halloween2023UndeadElkRun",
        ["eating"] = "Halloween2023UndeadElkEat",
        ["idle"] = "Halloween2023UndeadElkIdle",
        ["sit"] = "Halloween2023UndeadElkSit",
        ["hold"] = "Halloween2023UndeadElkBeingHeldSingle",
        ["flying"] = "Halloween2023UndeadElkRun",
        ["double_hold"] = "Halloween2023UndeadElkBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Halloween2023UndeadElkSit" },
        { "Joyful", "Halloween2023UndeadElkJoyful" },
        { "Beg", "Halloween2023UndeadElkBeg" },
        { "Jump", "Halloween2023UndeadElkJump" },
        { "Trick 1", "Halloween2023UndeadElkTrick1" },
        { "Trick 2", "Halloween2023UndeadElkTrick2" }
    },
    ["neon_parts"] = {
        ["AntlerLeft"] = Color3.fromRGB(115, 1, 191),
        ["Head4"] = Color3.fromRGB(115, 1, 191),
        ["Antler2"] = Color3.fromRGB(115, 1, 191),
        ["Torso"] = Color3.fromRGB(110, 56, 190),
        ["HumanoidRootPart"] = Color3.fromRGB(110, 56, 190),
        ["Torso2"] = Color3.fromRGB(110, 56, 190),
        ["Teeth"] = Color3.fromRGB(110, 56, 190),
        ["Head5"] = Color3.fromRGB(110, 56, 190),
        ["Antler"] = Color3.fromRGB(110, 56, 190),
        ["AntlerRight2"] = Color3.fromRGB(115, 1, 191),
        ["BackRightFoot"] = Color3.fromRGB(110, 56, 190),
        ["FrontRightFoot"] = Color3.fromRGB(110, 56, 190),
        ["FrontLeftFoot"] = Color3.fromRGB(110, 56, 190),
        ["BackLeftFoot"] = Color3.fromRGB(110, 56, 190),
        ["Eyes"] = Color3.fromRGB(141, 97, 208),
        ["AntlerLeft3"] = Color3.fromRGB(115, 1, 191),
        ["AntlerLeft2"] = Color3.fromRGB(115, 1, 191)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v4.halloween_2023_undead_elk = v13
local v14 = {
    ["name"] = "Scarecrow Horse",
    ["image"] = "rbxassetid://14978701264",
    ["model"] = "Halloween2023ScarecrowHorse",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["year"] = 2023,
        ["origin"] = "Halloween",
        ["origin_items"] = { "halloween_2023_scarecrow_box" }
    },
    ["anims"] = {
        ["sleep"] = "Halloween2023ScarecrowHorseSleep",
        ["running"] = "Halloween2023ScarecrowHorseRun",
        ["eating"] = "Halloween2023ScarecrowHorseEat",
        ["idle"] = "Halloween2023ScarecrowHorseIdle",
        ["sit"] = "Halloween2023ScarecrowHorseSit",
        ["flying"] = "Halloween2023ScarecrowHorseRun",
        ["hold"] = "Halloween2023ScarecrowHorseBeingHeldSingle",
        ["double_hold"] = "Halloween2023ScarecrowHorseBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Halloween2023ScarecrowHorseSit" },
        { "Joyful", "Halloween2023ScarecrowHorseJoyful" },
        { "Beg", "Halloween2023ScarecrowHorseBeg" },
        { "Jump", "Halloween2023ScarecrowHorseJump" },
        { "Trick 1", "Halloween2023ScarecrowHorseTrick1" },
        { "Trick 2", "Halloween2023ScarecrowHorseTrick2" }
    },
    ["neon_parts"] = {
        ["Hair5"] = Color3.fromRGB(99, 185, 107),
        ["Torso5"] = Color3.fromRGB(99, 185, 107),
        ["Hair7"] = Color3.fromRGB(99, 185, 107),
        ["BackLeftFoot2"] = Color3.fromRGB(99, 185, 107),
        ["Tail"] = Color3.fromRGB(99, 185, 107),
        ["Head3"] = Color3.fromRGB(99, 185, 107),
        ["Torso3"] = Color3.fromRGB(99, 185, 107),
        ["FrontLeftFoot2"] = Color3.fromRGB(99, 185, 107),
        ["Hair6"] = Color3.fromRGB(99, 185, 107),
        ["FrontRightFoot"] = Color3.fromRGB(99, 185, 107),
        ["Hair2"] = Color3.fromRGB(99, 185, 107),
        ["Tail2"] = Color3.fromRGB(99, 185, 107),
        ["Hair4_a"] = Color3.fromRGB(99, 185, 107),
        ["FrontRightFoot2"] = Color3.fromRGB(99, 185, 107),
        ["Torso4"] = Color3.fromRGB(99, 185, 107),
        ["LeftTail"] = Color3.fromRGB(99, 185, 107),
        ["Hair6_a"] = Color3.fromRGB(99, 185, 107),
        ["Head5"] = Color3.fromRGB(99, 185, 107),
        ["Hair"] = Color3.fromRGB(99, 185, 107),
        ["Collar"] = Color3.fromRGB(99, 185, 107),
        ["Tail3"] = Color3.fromRGB(99, 185, 107),
        ["BackRightFoot2"] = Color3.fromRGB(99, 185, 107),
        ["Head6"] = Color3.fromRGB(99, 185, 107),
        ["BackRightFoot"] = Color3.fromRGB(99, 185, 107),
        ["Head2"] = Color3.fromRGB(99, 185, 107),
        ["Hair4"] = Color3.fromRGB(99, 185, 107),
        ["RightTail"] = Color3.fromRGB(99, 185, 107),
        ["BackLeftFoot"] = Color3.fromRGB(99, 185, 107),
        ["Hair3"] = Color3.fromRGB(99, 185, 107),
        ["Eyes"] = Color3.fromRGB(200, 107, 26),
        ["FrontLeftFoot"] = Color3.fromRGB(99, 185, 107)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v4.halloween_2023_scarecrow_horse = v14
local v15 = {
    ["name"] = "Ghost Dog",
    ["image"] = "rbxassetid://14883937353",
    ["model"] = "Halloween2023GhostDog",
    ["rarity"] = "rare",
    ["cost"] = 34000,
    ["currency_id"] = "candy_2023",
    ["origin_entry"] = {
        ["year"] = 2023,
        ["origin"] = "Halloween",
        ["origin_items"] = {}
    },
    ["anims"] = {
        ["sleep"] = "Halloween2023GhostDogSleep",
        ["running"] = "Halloween2023GhostDogRun",
        ["eating"] = "Halloween2023GhostDogEat",
        ["idle"] = "Halloween2023GhostDogIdle",
        ["sit"] = "Halloween2023GhostDogSit",
        ["flying"] = "Halloween2023GhostDogRun",
        ["hold"] = "Halloween2023GhostDogBeingHeldSingle",
        ["double_hold"] = "Halloween2023GhostDogBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Halloween2023GhostDogSit" },
        { "Joyful", "Halloween2023GhostDogJoyful" },
        { "Beg", "Halloween2023GhostDogBeg" },
        { "Jump", "Halloween2023GhostDogJump" },
        { "Trick 1", "Halloween2023GhostDogTrick1" },
        { "Trick 2", "Halloween2023GhostDogTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar"] = Color3.fromRGB(193, 97, 0),
        ["LeftEar3"] = Color3.fromRGB(193, 97, 0),
        ["RightEar"] = Color3.fromRGB(193, 97, 0),
        ["Tail"] = Color3.fromRGB(193, 97, 0),
        ["LeftEar2"] = Color3.fromRGB(193, 97, 0),
        ["RightEar2"] = Color3.fromRGB(193, 97, 0),
        ["RightEar3"] = Color3.fromRGB(193, 97, 0),
        ["Tail2"] = Color3.fromRGB(193, 97, 0),
        ["DogSkirtG1"] = Color3.fromRGB(193, 97, 0),
        ["Nose"] = Color3.fromRGB(193, 97, 0),
        ["DogSkirtA1"] = Color3.fromRGB(193, 97, 0)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v4.halloween_2023_ghost_dog = v15
local v16 = {
    ["name"] = "Nightmare Owl",
    ["image"] = "rbxassetid://14782579567",
    ["model"] = "Halloween2023NightmareOwl",
    ["rarity"] = "ultra_rare",
    ["cost"] = 75000,
    ["currency_id"] = "candy_2023",
    ["origin_entry"] = {
        ["year"] = 2023,
        ["origin"] = "Halloween",
        ["origin_items"] = {}
    },
    ["anims"] = {
        ["sleep"] = "Halloween2023NightmareOwlSleep",
        ["running"] = "Halloween2023NightmareOwlRun",
        ["eating"] = "Halloween2023NightmareOwlEat",
        ["idle"] = "Halloween2023NightmareOwlIdle",
        ["sit"] = "Halloween2023NightmareOwlSit",
        ["hold"] = "Halloween2023NightmareOwlBeingHeldSingle",
        ["flying"] = "Halloween2023NightmareOwlRun",
        ["double_hold"] = "Halloween2023NightmareOwlBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Halloween2023NightmareOwlSit" },
        { "Joyful", "Halloween2023NightmareOwlJoyful" },
        { "Beg", "Halloween2023NightmareOwlBeg" },
        { "Jump", "Halloween2023NightmareOwlJump" },
        { "Trick 1", "Halloween2023NightmareOwlTrick1" },
        { "Trick 2", "Halloween2023NightmareOwlTrick2" }
    }
}
local v17 = {
    ["LeftEar"] = Color3.fromRGB(27, 42, 53),
    ["RightEar"] = Color3.fromRGB(27, 42, 53),
    ["Head"] = Color3.fromRGB(27, 42, 53),
    ["Collar"] = Color3.fromRGB(27, 42, 53),
    ["Torso"] = Color3.fromRGB(27, 42, 53),
    ["Head3"] = {
        ["Color"] = Color3.fromRGB(255, 255, 254),
        ["Transparency"] = 0
    },
    ["LeftEar2"] = {
        ["Color"] = Color3.fromRGB(255, 255, 254),
        ["Transparency"] = 0
    },
    ["RightEar2"] = {
        ["Color"] = Color3.fromRGB(255, 255, 254),
        ["Transparency"] = 0
    },
    ["Collar2"] = {
        ["Color"] = Color3.fromRGB(255, 255, 254),
        ["Transparency"] = 0
    }
}
v16.neon_parts = v17
local v18 = {
    ["RightEar2"] = {
        ["Color"] = Color3.fromRGB(255, 255, 254),
        ["Transparency"] = 0
    },
    ["LeftEar2"] = {
        ["Color"] = Color3.fromRGB(255, 255, 254),
        ["Transparency"] = 0
    },
    ["Collar2"] = {
        ["Color"] = Color3.fromRGB(255, 255, 254),
        ["Transparency"] = 0
    },
    ["Head3"] = {
        ["Color"] = Color3.fromRGB(255, 255, 254),
        ["Transparency"] = 0
    }
}
v16.mega_neon_parts = v18
v16.already_has_flying_wings = true
v16.generate_npc_furniture_on_runtime = true
v4.halloween_2023_nightmare_owl = v16
local v19 = {
    ["name"] = "Slime",
    ["image"] = "rbxassetid://15093139154",
    ["model"] = "Halloween2023Slime",
    ["rarity"] = "ultra_rare",
    ["cost"] = 60000,
    ["currency_id"] = "candy_2023",
    ["origin_entry"] = {
        ["year"] = 2023,
        ["origin"] = "Halloween",
        ["origin_items"] = {}
    },
    ["anims"] = {
        ["sleep"] = "Halloween2023SlimeSleep",
        ["running"] = "Halloween2023SlimeRun",
        ["eating"] = "Halloween2023SlimeEat",
        ["idle"] = "Halloween2023SlimeIdle",
        ["sit"] = "Halloween2023SlimeSit",
        ["flying"] = "Halloween2023SlimeRun",
        ["hold"] = "Halloween2023SlimeBeingHeldSingle",
        ["double_hold"] = "Halloween2023SlimeBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Halloween2023SlimeSit" },
        { "Joyful", "Halloween2023SlimeJoyful" },
        { "Beg", "Halloween2023SlimeBeg" },
        { "Jump", "Halloween2023SlimeJump" },
        { "Trick 1", "Halloween2023SlimeTrick1" },
        { "Trick 2", "Halloween2023SlimeTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(137, 255, 10),
        ["Mid"] = Color3.fromRGB(137, 255, 10),
        ["InnerShellReversed"] = Color3.fromRGB(14, 143, 255),
        ["OuterShell"] = Color3.fromRGB(184, 199, 130),
        ["Ball"] = Color3.fromRGB(162, 186, 109),
        ["InnerShell"] = Color3.fromRGB(6, 140, 189),
        ["Base"] = Color3.fromRGB(137, 255, 10),
        ["Torso"] = Color3.fromRGB(137, 255, 10)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v4.halloween_2023_slime = v19
local v20 = {
    ["name"] = "Werewolf",
    ["image"] = "rbxassetid://15148532648",
    ["model"] = "Halloween2023Werewolf",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["year"] = 2023,
        ["origin"] = "Halloween",
        ["origin_items"] = {}
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(166, 0, 0),
        ["Nose"] = Color3.fromRGB(166, 0, 0),
        ["RightEar2"] = Color3.fromRGB(166, 0, 0),
        ["Eyes_Changed"] = Color3.fromRGB(166, 0, 0),
        ["Nose_Changed"] = Color3.fromRGB(166, 0, 0),
        ["Tail"] = Color3.fromRGB(166, 0, 0),
        ["Hair"] = Color3.fromRGB(166, 0, 0),
        ["Tail2_Changed"] = Color3.fromRGB(166, 0, 0),
        ["Hair3_Changed"] = Color3.fromRGB(166, 0, 0),
        ["Teeth_Changed"] = Color3.fromRGB(166, 0, 0),
        ["RightFrontFoot2_Changed"] = Color3.fromRGB(166, 0, 0),
        ["Hair4_Changed"] = Color3.fromRGB(166, 0, 0),
        ["RightBackFoot2_Changed"] = Color3.fromRGB(166, 0, 0),
        ["LeftFrontFoot2_Changed"] = Color3.fromRGB(166, 0, 0),
        ["LeftBackFoot2_Changed"] = Color3.fromRGB(166, 0, 0),
        ["Hair2_Changed"] = Color3.fromRGB(166, 0, 0),
        ["Hair2_Left_Changed"] = Color3.fromRGB(166, 0, 0),
        ["Hair2_Right_Changed"] = Color3.fromRGB(166, 0, 0),
        ["Hair3_a_Changed"] = Color3.fromRGB(166, 0, 0),
        ["Hair3_b_Changed"] = Color3.fromRGB(166, 0, 0),
        ["Hair3_c_Changed"] = Color3.fromRGB(166, 0, 0),
        ["Hair3_d_Changed"] = Color3.fromRGB(166, 0, 0),
        ["Hair3_e_Changed"] = Color3.fromRGB(166, 0, 0),
        ["Hair4_a_Changed"] = Color3.fromRGB(166, 0, 0),
        ["Hair_Left"] = Color3.fromRGB(166, 0, 0),
        ["Tail3"] = Color3.fromRGB(166, 0, 0),
        ["Tail4"] = Color3.fromRGB(166, 0, 0),
        ["Tail5"] = Color3.fromRGB(166, 0, 0),
        ["Tail2_a_Changed"] = Color3.fromRGB(166, 0, 0),
        ["Hair_Right"] = Color3.fromRGB(166, 0, 0),
        ["Tail2"] = Color3.fromRGB(166, 0, 0)
    }
}
local v21 = {
    ["get_form"] = function()
        return v_u_2.get_is_day() and "normal" or "changed"
    end,
    ["default_form"] = "changed"
}
local v22 = {}
local v23 = {}
local v24 = {
    ["Hair"] = {
        ["Color"] = Color3.fromRGB(41, 43, 44)
    },
    ["Head"] = {
        ["Color"] = Color3.fromRGB(41, 43, 44)
    },
    ["LeftBackFoot"] = {
        ["Color"] = Color3.fromRGB(41, 43, 44)
    },
    ["LeftEar2"] = {
        ["Color"] = Color3.fromRGB(168, 107, 82)
    },
    ["LeftFrontFoot"] = {
        ["Color"] = Color3.fromRGB(41, 43, 44)
    },
    ["Nose"] = {
        ["Color"] = Color3.fromRGB(17, 17, 17),
        ["Material"] = Enum.Material.SmoothPlastic
    },
    ["RightBackFoot"] = {
        ["Color"] = Color3.fromRGB(41, 43, 44)
    },
    ["RightEar2"] = {
        ["Color"] = Color3.fromRGB(168, 107, 82)
    },
    ["RightFrontFoot"] = {
        ["Color"] = Color3.fromRGB(41, 43, 44)
    },
    ["Tail"] = {
        ["Color"] = Color3.fromRGB(41, 43, 44)
    },
    ["Torso"] = {
        ["Color"] = Color3.fromRGB(41, 43, 44)
    }
}
v23.part_properties = v24
v23.parts = { "Eyes" }
v23.eyes = { "Eyes" }
v23.anims = {
    ["running"] = "Halloween2023WerewolfNormalRun",
    ["idle"] = "Halloween2023WerewolfNormalIdle",
    ["sleep"] = "Halloween2023WerewolfNormalSleep",
    ["sit"] = "Halloween2023WerewolfNormalSit",
    ["hold"] = "Halloween2023WerewolfNormalBeingHeldSingle",
    ["double_hold"] = "Halloween2023WerewolfNormalBeingHeldDouble",
    ["eating"] = "Halloween2023WerewolfNormalEat",
    ["transform"] = "Halloween2023WerewolfTransformIn"
}
v23.tricks = {
    { "Sit", "Halloween2023WerewolfNormalSit" },
    { "Joyful", "Halloween2023WerewolfNormalJoyful" },
    { "Beg", "Halloween2023WerewolfNormalBeg" },
    { "Jump", "Halloween2023WerewolfNormalJump" },
    { "Trick 1", "Halloween2023WerewolfNormalTrick1" },
    { "Trick 2", "Halloween2023WerewolfNormalTrick2" }
}
v22.normal = v23
local v25 = {}
local v26 = {
    ["Hair"] = {
        ["Color"] = Color3.fromRGB(62, 62, 70)
    },
    ["Head"] = {
        ["Color"] = Color3.fromRGB(16, 26, 33)
    },
    ["LeftBackFoot"] = {
        ["Color"] = Color3.fromRGB(16, 26, 33)
    },
    ["LeftEar2"] = {
        ["Color"] = Color3.fromRGB(62, 62, 70)
    },
    ["LeftFrontFoot"] = {
        ["Color"] = Color3.fromRGB(16, 26, 33)
    },
    ["Nose"] = {
        ["Color"] = Color3.fromRGB(188, 37, 26),
        ["Material"] = Enum.Material.Neon
    },
    ["RightBackFoot"] = {
        ["Color"] = Color3.fromRGB(16, 26, 33)
    },
    ["RightEar2"] = {
        ["Color"] = Color3.fromRGB(62, 62, 70)
    },
    ["RightFrontFoot"] = {
        ["Color"] = Color3.fromRGB(16, 26, 33)
    },
    ["Tail"] = {
        ["Color"] = Color3.fromRGB(16, 26, 33)
    },
    ["Torso"] = {
        ["Color"] = Color3.fromRGB(16, 26, 33)
    }
}
v25.part_properties = v26
v25.parts = {
    "Eyes_Changed",
    "Hair2_Changed",
    "Hair2_Left_Changed",
    "Hair2_Right_Changed",
    "Hair3_a_Changed",
    "Hair3_b_Changed",
    "Hair3_c_Changed",
    "Hair3_Changed",
    "Hair3_d_Changed",
    "Hair3_e_Changed",
    "Hair4_a_Changed",
    "Hair4_Changed",
    "LeftBackFoot2_Changed",
    "LeftFrontFoot2_Changed",
    "Nose_Changed",
    "RightBackFoot2_Changed",
    "RightFrontFoot2_Changed",
    "Tail2_a_Changed",
    "Tail2_Changed",
    "Teeth_Changed"
}
v25.eyes = { "Eyes_Changed" }
v25.anims = {
    ["running"] = "Halloween2023WerewolfChangedRun",
    ["idle"] = "Halloween2023WerewolfChangedIdle",
    ["sleep"] = "Halloween2023WerewolfNormalSleep",
    ["sit"] = "Halloween2023WerewolfChangedSit",
    ["hold"] = "Halloween2023WerewolfChangedBeingHeldSingle",
    ["double_hold"] = "Halloween2023WerewolfChangedBeingHeldDouble",
    ["eating"] = "Halloween2023WerewolfChangedEat",
    ["transform"] = "Halloween2023WerewolfTransformOut"
}
v25.tricks = {
    { "Sit", "Halloween2023WerewolfChangedSit" },
    { "Joyful", "Halloween2023WerewolfChangedJoyful" },
    { "Beg", "Halloween2023WerewolfChangedBeg" },
    { "Jump", "Halloween2023WerewolfChangedJump" },
    { "Trick 1", "Halloween2023WerewolfChangedTrick1" },
    { "Trick 2", "Halloween2023WerewolfChangedTrick2" }
}
v22.changed = v25
v21.forms = v22
v20.transforming_pet = v21
v20.flying_move_anim_speed = 0.85
v20.eyes = { "Eyes", "Eyes_Changed" }
v20.generate_npc_furniture_on_runtime = true
v4.halloween_2023_werewolf = v20
return v3(v4)