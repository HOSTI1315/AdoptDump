--// ReplicatedStorage.SharedModules.ContentPacks.Summerfest2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Mini Pig",
    ["model"] = "Summerfest2024Minipig",
    ["image"] = "rbxassetid://17649307413",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Summer2024MinipigSleep",
        ["running"] = "Summer2024MinipigRun",
        ["idle"] = "Summer2024MinipigIdle",
        ["eating"] = "Summer2024MinipigEat",
        ["sit"] = "Summer2024MinipigSit",
        ["flying"] = "Summer2024MinipigRun",
        ["hold"] = "Summer2024MinipigBeingHeldSingle",
        ["double_hold"] = "Summer2024MinipigBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Summer2024MinipigSit" },
        { "Joyful", "Summer2024MinipigJoyful" },
        { "Beg", "Summer2024MinipigBeg" },
        { "Jump", "Summer2024MinipigJump" },
        { "Trick 1", "Summer2024MinipigTrick1" },
        { "Trick 2", "Summer2024MinipigTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar3"] = Color3.fromRGB(186, 92, 20),
        ["RightEar3"] = Color3.fromRGB(186, 92, 20),
        ["Torso2"] = Color3.fromRGB(186, 92, 20),
        ["Tail"] = Color3.fromRGB(186, 92, 20),
        ["Hair"] = Color3.fromRGB(186, 92, 20),
        ["RightBackFoot"] = Color3.fromRGB(186, 92, 20),
        ["LeftBackFoot"] = Color3.fromRGB(186, 92, 20),
        ["LeftFrontFoot"] = Color3.fromRGB(186, 92, 20),
        ["RightFrontFoot"] = Color3.fromRGB(186, 92, 20)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.summerfest_2024_minipig = v3
local v4 = {
    ["name"] = "Cow Calf",
    ["model"] = "Summerfest2024CowCalf",
    ["image"] = "rbxassetid://17649489402",
    ["rarity"] = "rare",
    ["cost"] = 26000,
    ["currency_id"] = "tickets_2024",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Summer2024CowCalfSleep",
        ["running"] = "Summer2024CowCalfRun",
        ["idle"] = "Summer2024CowCalfIdle",
        ["eating"] = "Summer2024CowCalfEat",
        ["sit"] = "Summer2024CowCalfSit",
        ["flying"] = "Summer2024CowCalfRun",
        ["hold"] = "Summer2024CowCalfBeingHeldSingle",
        ["double_hold"] = "Summer2024CowCalfBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Summer2024CowCalfSit" },
        { "Joyful", "Summer2024CowCalfJoyful" },
        { "Beg", "Summer2024CowCalfBeg" },
        { "Jump", "Summer2024CowCalfJump" },
        { "Trick 1", "Summer2024CowCalfTrick1" },
        { "Trick 2", "Summer2024CowCalfTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(107, 129, 191),
        ["Head4"] = Color3.fromRGB(107, 129, 191),
        ["Tail2"] = Color3.fromRGB(107, 129, 191),
        ["Tail4"] = Color3.fromRGB(107, 129, 191),
        ["Tail5"] = Color3.fromRGB(107, 129, 191)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.summerfest_2024_cow_calf = v4
local v5 = {
    ["name"] = "Kid Goat",
    ["model"] = "Summerfest2024KidGoat",
    ["image"] = "rbxassetid://17649624018",
    ["rarity"] = "common",
    ["cost"] = 3750,
    ["currency_id"] = "tickets_2024",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Summer2024KidGoatSleep",
        ["running"] = "Summer2024KidGoatRun",
        ["idle"] = "Summer2024KidGoatIdle",
        ["eating"] = "Summer2024KidGoatEat",
        ["sit"] = "Summer2024KidGoatSit",
        ["flying"] = "Summer2024KidGoatRun",
        ["hold"] = "Summer2024KidGoatBeingHeldSingle",
        ["double_hold"] = "Summer2024KidGoatBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Summer2024KidGoatSit" },
        { "Joyful", "Summer2024KidGoatJoyful" },
        { "Beg", "Summer2024KidGoatBeg" },
        { "Jump", "Summer2024KidGoatJump" },
        { "Trick 1", "Summer2024KidGoatTrick1" },
        { "Trick 2", "Summer2024KidGoatTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(107, 129, 191),
        ["Head4"] = Color3.fromRGB(107, 129, 191),
        ["Tail2"] = Color3.fromRGB(107, 129, 191),
        ["Tail4"] = Color3.fromRGB(107, 129, 191),
        ["Tail5"] = Color3.fromRGB(107, 129, 191)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.summerfest_2024_kid_goat = v5
local v6 = {
    ["name"] = "Show Pony",
    ["image"] = "rbxassetid://17661844380",
    ["model"] = "Summerfest2024ShowPony",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["anims"] = {
        ["sleep"] = "Summer2024ShowPonySleep",
        ["running"] = "Summer2024ShowPonyRun",
        ["idle"] = "Summer2024ShowPonyIdle",
        ["eating"] = "Summer2024ShowPonyEat",
        ["sit"] = "Summer2024ShowPonySit",
        ["flying"] = "Summer2024ShowPonyRun",
        ["hold"] = "Summer2024ShowPonyBeingHeldSingle",
        ["double_hold"] = "Summer2024ShowPonyBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Summer2024ShowPonySit" },
        { "Joyful", "Summer2024ShowPonyJoyful" },
        { "Beg", "Summer2024ShowPonyBeg" },
        { "Jump", "Summer2024ShowPonyJump" },
        { "Trick 1", "Summer2024ShowPonyTrick1" },
        { "Trick 2", "Summer2024ShowPonyTrick2" }
    },
    ["neon_parts"] = {
        ["Hair"] = Color3.fromRGB(94, 142, 188),
        ["Tail"] = Color3.fromRGB(94, 142, 188),
        ["LeftEar2"] = Color3.fromRGB(94, 142, 188),
        ["RightEar2"] = Color3.fromRGB(94, 142, 188)
    }
}
v2.summerfest_2024_show_pony = v6
local v7 = {
    ["name"] = "Punk Pony",
    ["image"] = "rbxassetid://17662289865",
    ["model"] = "Summerfest2024ShowPonyPunk",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["anims"] = {
        ["sleep"] = "Summer2024ShowPonyPunkSleep",
        ["running"] = "Summer2024ShowPonyPunkRun",
        ["idle"] = "Summer2024ShowPonyPunkIdle",
        ["eating"] = "Summer2024ShowPonyPunkEat",
        ["sit"] = "Summer2024ShowPonyPunkSit",
        ["flying"] = "Summer2024ShowPonyPunkRun",
        ["hold"] = "Summer2024ShowPonyPunkBeingHeldSingle",
        ["double_hold"] = "Summer2024ShowPonyPunkBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Summer2024ShowPonyPunkSit" },
        { "Joyful", "Summer2024ShowPonyPunkJoyful" },
        { "Beg", "Summer2024ShowPonyPunkBeg" },
        { "Jump", "Summer2024ShowPonyPunkJump" },
        { "Trick 1", "Summer2024ShowPonyPunkTrick1" },
        { "Trick 2", "Summer2024ShowPonyPunkTrick2" }
    },
    ["neon_parts"] = {
        ["RightEar2"] = Color3.fromRGB(185, 36, 55),
        ["LeftEar2"] = Color3.fromRGB(185, 36, 55),
        ["Torso2"] = Color3.fromRGB(185, 36, 55),
        ["Torso3"] = Color3.fromRGB(185, 36, 55),
        ["Tail"] = Color3.fromRGB(66, 78, 189),
        ["Hair2"] = Color3.fromRGB(66, 78, 189),
        ["Hair"] = Color3.fromRGB(185, 36, 55)
    }
}
v2.summerfest_2024_punk_pony = v7
local v8 = {
    ["name"] = "Pretty Pony",
    ["image"] = "rbxassetid://17662893972",
    ["model"] = "Summerfest2024ShowPonyRibbon",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["anims"] = {
        ["sleep"] = "Summer2024ShowPonyRibbonSleep",
        ["running"] = "Summer2024ShowPonyRibbonRun",
        ["idle"] = "Summer2024ShowPonyRibbonIdle",
        ["eating"] = "Summer2024ShowPonyRibbonEat",
        ["sit"] = "Summer2024ShowPonyRibbonSit",
        ["flying"] = "Summer2024ShowPonyRibbonRun",
        ["hold"] = "Summer2024ShowPonyRibbonBeingHeldSingle",
        ["double_hold"] = "Summer2024ShowPonyRibbonBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Summer2024ShowPonyRibbonSit" },
        { "Joyful", "Summer2024ShowPonyRibbonJoyful" },
        { "Beg", "Summer2024ShowPonyRibbonBeg" },
        { "Jump", "Summer2024ShowPonyRibbonJump" },
        { "Trick 1", "Summer2024ShowPonyRibbonTrick1" },
        { "Trick 2", "Summer2024ShowPonyRibbonTrick2" }
    },
    ["neon_parts"] = {
        ["RightEar2"] = Color3.fromRGB(186, 73, 97),
        ["Torso2"] = Color3.fromRGB(186, 73, 97),
        ["LeftEar2"] = Color3.fromRGB(186, 73, 97),
        ["Tail"] = Color3.fromRGB(186, 73, 97),
        ["Hair"] = Color3.fromRGB(186, 73, 97),
        ["Torso3"] = Color3.fromRGB(186, 73, 97)
    }
}
v2.summerfest_2024_pretty_pony = v8
local v9 = {
    ["name"] = "Majestic Pony",
    ["model"] = "Summerfest2024ShowPonyBraided",
    ["image"] = "rbxassetid://17747001377",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["anims"] = {
        ["sleep"] = "Summer2024ShowPonyBraidedSleep",
        ["running"] = "Summer2024ShowPonyBraidedRun",
        ["idle"] = "Summer2024ShowPonyBraidedIdle",
        ["eating"] = "Summer2024ShowPonyBraidedEat",
        ["sit"] = "Summer2024ShowPonyBraidedSit",
        ["flying"] = "Summer2024ShowPonyBraidedRun",
        ["hold"] = "Summer2024ShowPonyBraidedBeingHeldSingle",
        ["double_hold"] = "Summer2024ShowPonyBraidedBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Summer2024ShowPonyBraidedSit" },
        { "Joyful", "Summer2024ShowPonyBraidedJoyful" },
        { "Beg", "Summer2024ShowPonyBraidedBeg" },
        { "Jump", "Summer2024ShowPonyBraidedJump" },
        { "Trick 1", "Summer2024ShowPonyBraidedTrick1" },
        { "Trick 2", "Summer2024ShowPonyBraidedTrick2" }
    },
    ["neon_parts"] = {
        ["Hair"] = Color3.fromRGB(186, 73, 97),
        ["Hair2"] = Color3.fromRGB(186, 73, 97),
        ["BackRightFoot"] = Color3.fromRGB(105, 52, 191),
        ["BackLeftFoot"] = Color3.fromRGB(105, 52, 191),
        ["FrontRightFoot"] = Color3.fromRGB(105, 52, 191),
        ["FrontLeftFoot"] = Color3.fromRGB(105, 52, 191),
        ["HairFlowers"] = Color3.fromRGB(151, 105, 204),
        ["HairFlowers3"] = Color3.fromRGB(186, 112, 55),
        ["HairRibbon"] = Color3.fromRGB(105, 52, 191),
        ["HeadFlowers"] = Color3.fromRGB(186, 112, 55),
        ["HeadFlowers2"] = Color3.fromRGB(151, 105, 204),
        ["Tail"] = Color3.fromRGB(186, 73, 97),
        ["TailRibbon"] = Color3.fromRGB(105, 52, 191)
    }
}
v2.summerfest_2024_majestic_pony = v9
local v10 = {
    ["name"] = "Blue Betta Fish",
    ["model"] = "Summerfest2024BlueBettaFish",
    ["image"] = "rbxassetid://17822543288",
    ["rarity"] = "legendary",
    ["cost"] = 0,
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["anims"] = {
        ["sleep"] = "Summerfest2024BlueBettaFishSleep",
        ["running"] = "Summerfest2024BlueBettaFishRun",
        ["idle"] = "Summerfest2024BlueBettaFishIdle",
        ["eating"] = "Summerfest2024BlueBettaFishEat",
        ["sit"] = "Summerfest2024BlueBettaFishSit",
        ["flying"] = "Summerfest2024BlueBettaFishRun",
        ["hold"] = "Summerfest2024BlueBettaFishBeingHeldSingle",
        ["double_hold"] = "Summerfest2024BlueBettaFishBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2024BlueBettaFishSit" },
        { "Joyful", "Summerfest2024BlueBettaFishJoyful" },
        { "Beg", "Summerfest2024BlueBettaFishBeg" },
        { "Jump", "Summerfest2024BlueBettaFishJump" },
        { "Trick 1", "Summerfest2024BlueBettaFishTrick1" },
        { "Trick 2", "Summerfest2024BlueBettaFishTrick2" }
    },
    ["neon_parts"] = {
        ["BottomFin2"] = Color3.fromRGB(184, 184, 184),
        ["TopFin2"] = Color3.fromRGB(184, 184, 184),
        ["RightFin2"] = Color3.fromRGB(184, 184, 184),
        ["LeftFin2"] = Color3.fromRGB(184, 184, 184),
        ["BackFin2"] = Color3.fromRGB(184, 184, 184),
        ["Torso2"] = Color3.fromRGB(184, 184, 184),
        ["BackFinA"] = Color3.fromRGB(184, 184, 184),
        ["BackFinB"] = Color3.fromRGB(184, 184, 184),
        ["BackFin3"] = Color3.fromRGB(184, 184, 184),
        ["BackFinRoot"] = Color3.fromRGB(184, 184, 184),
        ["BottomFin3"] = Color3.fromRGB(184, 184, 184),
        ["LeftFin3"] = Color3.fromRGB(184, 184, 184),
        ["LeftFinA"] = Color3.fromRGB(184, 184, 184),
        ["TopFin3"] = Color3.fromRGB(184, 184, 184),
        ["RightFin3"] = Color3.fromRGB(184, 184, 184),
        ["RightFinA"] = Color3.fromRGB(184, 184, 184)
    },
    ["head_rotator_disabled"] = true
}
v2.summerfest_2024_blue_betta_fish = v10
local v11 = {
    ["name"] = "Pink Betta Fish",
    ["model"] = "Summerfest2024PinkBettaFish",
    ["image"] = "rbxassetid://17822765706",
    ["rarity"] = "ultra_rare",
    ["cost"] = 0,
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["anims"] = {
        ["sleep"] = "Summerfest2024PinkBettaFishSleep",
        ["running"] = "Summerfest2024PinkBettaFishRun",
        ["idle"] = "Summerfest2024PinkBettaFishIdle",
        ["eating"] = "Summerfest2024PinkBettaFishEat",
        ["sit"] = "Summerfest2024PinkBettaFishSit",
        ["flying"] = "Summerfest2024PinkBettaFishRun",
        ["hold"] = "Summerfest2024PinkBettaFishBeingHeldSingle",
        ["double_hold"] = "Summerfest2024PinkBettaFishBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2024PinkBettaFishSit" },
        { "Joyful", "Summerfest2024PinkBettaFishJoyful" },
        { "Beg", "Summerfest2024PinkBettaFishBeg" },
        { "Jump", "Summerfest2024PinkBettaFishJump" },
        { "Trick 1", "Summerfest2024PinkBettaFishTrick1" },
        { "Trick 2", "Summerfest2024PinkBettaFishTrick2" }
    },
    ["neon_parts"] = {
        ["LeftFin2"] = Color3.fromRGB(94, 184, 131),
        ["TopFin2"] = Color3.fromRGB(94, 184, 131),
        ["BottomFin2"] = Color3.fromRGB(94, 184, 131),
        ["RightFin2"] = Color3.fromRGB(94, 184, 131),
        ["BackFin3"] = Color3.fromRGB(94, 184, 131),
        ["BackFinRoot"] = Color3.fromRGB(94, 184, 131),
        ["BottomFin3"] = Color3.fromRGB(94, 184, 131),
        ["LeftFin3"] = Color3.fromRGB(94, 184, 131),
        ["LeftFinA"] = Color3.fromRGB(94, 184, 131),
        ["RightFin3"] = Color3.fromRGB(94, 184, 131),
        ["RightFinA"] = Color3.fromRGB(94, 184, 131),
        ["TopFin3"] = Color3.fromRGB(94, 184, 131),
        ["BackFin2"] = Color3.fromRGB(94, 184, 131),
        ["Torso2"] = Color3.fromRGB(94, 184, 131)
    },
    ["head_rotator_disabled"] = true
}
v2.summerfest_2024_pink_betta_fish = v11
local v12 = {
    ["name"] = "Orange Betta Fish",
    ["model"] = "Summerfest2024OrangeBettaFish",
    ["image"] = "rbxassetid://17822797244",
    ["rarity"] = "rare",
    ["cost"] = 0,
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["generate_npc_furniture_on_runtime"] = true,
    ["anims"] = {
        ["sleep"] = "Summerfest2024OrangeBettaFishSleep",
        ["running"] = "Summerfest2024OrangeBettaFishRun",
        ["idle"] = "Summerfest2024OrangeBettaFishIdle",
        ["eating"] = "Summerfest2024OrangeBettaFishEat",
        ["sit"] = "Summerfest2024OrangeBettaFishSit",
        ["flying"] = "Summerfest2024OrangeBettaFishRun",
        ["hold"] = "Summerfest2024OrangeBettaFishBeingHeldSingle",
        ["double_hold"] = "Summerfest2024OrangeBettaFishBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2024OrangeBettaFishSit" },
        { "Joyful", "Summerfest2024OrangeBettaFishJoyful" },
        { "Beg", "Summerfest2024OrangeBettaFishBeg" },
        { "Jump", "Summerfest2024OrangeBettaFishJump" },
        { "Trick 1", "Summerfest2024OrangeBettaFishTrick1" },
        { "Trick 2", "Summerfest2024OrangeBettaFishTrick2" }
    },
    ["neon_parts"] = {
        ["BackFin2"] = Color3.fromRGB(88, 152, 186),
        ["LeftFin2"] = Color3.fromRGB(88, 152, 186),
        ["TopFin2"] = Color3.fromRGB(88, 152, 186),
        ["BottomFin2"] = Color3.fromRGB(88, 152, 186),
        ["RightFin2"] = Color3.fromRGB(88, 152, 186),
        ["Torso2"] = Color3.fromRGB(88, 152, 186),
        ["BackFin3"] = Color3.fromRGB(88, 152, 186),
        ["BackFinA"] = Color3.fromRGB(88, 152, 186),
        ["BackFinB"] = Color3.fromRGB(88, 152, 186),
        ["BackFinRoot"] = Color3.fromRGB(88, 152, 186),
        ["BottomFin3"] = Color3.fromRGB(88, 152, 186),
        ["LeftFin3"] = Color3.fromRGB(88, 152, 186),
        ["LeftFinA"] = Color3.fromRGB(88, 152, 186),
        ["RightFin3"] = Color3.fromRGB(88, 152, 186),
        ["RightFinA"] = Color3.fromRGB(88, 152, 186),
        ["TopFin3"] = Color3.fromRGB(88, 152, 186)
    },
    ["head_rotator_disabled"] = true
}
v2.summerfest_2024_orange_betta_fish = v12
local v13 = {
    ["name"] = "Balloon Unicorn",
    ["model"] = "Summerfest2024BalloonUnicorn",
    ["image"] = "rbxassetid://18117855573",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Summerfest2024BalloonUnicornSleep",
        ["running"] = "Summerfest2024BalloonUnicornRun",
        ["idle"] = "Summerfest2024BalloonUnicornIdle",
        ["eating"] = "Summerfest2024BalloonUnicornEat",
        ["sit"] = "Summerfest2024BalloonUnicornSit",
        ["flying"] = "Summerfest2024BalloonUnicornRun",
        ["hold"] = "Summerfest2024BalloonUnicornBeingHeldSingle",
        ["double_hold"] = "Summerfest2024BalloonUnicornBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2024BalloonUnicornSit" },
        { "Joyful", "Summerfest2024BalloonUnicornJoyful" },
        { "Beg", "Summerfest2024BalloonUnicornBeg" },
        { "Jump", "Summerfest2024BalloonUnicornJump" },
        { "Trick 1", "Summerfest2024BalloonUnicornTrick1" },
        { "Trick 2", "Summerfest2024BalloonUnicornTrick2" }
    },
    ["neon_parts"] = {
        ["Tail"] = Color3.fromRGB(169, 79, 185),
        ["Hair"] = Color3.fromRGB(169, 79, 185),
        ["LeftEar2"] = Color3.fromRGB(169, 79, 185),
        ["RightEar2"] = Color3.fromRGB(169, 79, 185),
        ["Horn"] = Color3.fromRGB(169, 79, 185)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.summerfest_2024_balloon_unicorn = v13
local v14 = {
    ["name"] = "Corn Doggo",
    ["model"] = "Summerfest2024CornDoggo",
    ["image"] = "rbxassetid://18117855114",
    ["rarity"] = "legendary",
    ["cost"] = 125000,
    ["currency_id"] = "tickets_2024",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Summerfest2024CornDoggoSleep",
        ["running"] = "Summerfest2024CornDoggoRun",
        ["idle"] = "Summerfest2024CornDoggoIdle",
        ["eating"] = "Summerfest2024CornDoggoEat",
        ["sit"] = "Summerfest2024CornDoggoSit",
        ["flying"] = "Summerfest2024CornDoggoRun",
        ["hold"] = "Summerfest2024CornDoggoBeingHeldSingle",
        ["double_hold"] = "Summerfest2024CornDoggoBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2024CornDoggoSit" },
        { "Joyful", "Summerfest2024CornDoggoJoyful" },
        { "Beg", "Summerfest2024CornDoggoBeg" },
        { "Jump", "Summerfest2024CornDoggoJump" },
        { "Trick 1", "Summerfest2024CornDoggoTrick1" },
        { "Trick 2", "Summerfest2024CornDoggoTrick2" }
    },
    ["neon_parts"] = {
        ["Mustard"] = Color3.fromRGB(189, 145, 43),
        ["Nose"] = Color3.fromRGB(190, 105, 89),
        ["FrontLeftFoot"] = Color3.fromRGB(190, 105, 89),
        ["Tail"] = Color3.fromRGB(190, 105, 89),
        ["Tongue"] = Color3.fromRGB(189, 145, 43),
        ["BackRightFoot"] = Color3.fromRGB(190, 105, 89),
        ["BackLeftFoot"] = Color3.fromRGB(190, 105, 89),
        ["FrontRightFoot"] = Color3.fromRGB(190, 105, 89),
        ["Tail2"] = Color3.fromRGB(190, 105, 89),
        ["Tail3"] = Color3.fromRGB(190, 105, 89),
        ["Tail4"] = Color3.fromRGB(190, 105, 89),
        ["Torso4"] = Color3.fromRGB(190, 105, 89)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.summerfest_2024_corn_doggo = v14
local v15 = {
    ["name"] = "Bald Eagle",
    ["model"] = "Summerfest2024BaldEagle",
    ["image"] = "rbxassetid://18119064023",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Summer2024BaldEagleSleep",
        ["running"] = "Summer2024BaldEagleRun",
        ["idle"] = "Summer2024BaldEagleIdle",
        ["eating"] = "Summer2024BaldEagleEat",
        ["sit"] = "Summer2024BaldEagleSit",
        ["flying"] = "Summer2024BaldEagleRun",
        ["hold"] = "Summer2024BaldEagleBeingHeldSingle",
        ["double_hold"] = "Summer2024BaldEagleBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Summer2024BaldEagleSit" },
        { "Joyful", "Summer2024BaldEagleJoyful" },
        { "Beg", "Summer2024BaldEagleBeg" },
        { "Jump", "Summer2024BaldEagleJump" },
        { "Trick 1", "Summer2024BaldEagleTrick1" },
        { "Trick 2", "Summer2024BaldEagleTrick2" }
    },
    ["neon_parts"] = {
        ["LeftWing3"] = Color3.fromRGB(101, 179, 186),
        ["LeftWing4"] = Color3.fromRGB(101, 179, 186),
        ["LeftWing2"] = Color3.fromRGB(101, 179, 186),
        ["RightWing5"] = Color3.fromRGB(101, 179, 186),
        ["Tail"] = Color3.fromRGB(101, 179, 186),
        ["LeftWing5"] = Color3.fromRGB(101, 179, 186),
        ["RightWing4"] = Color3.fromRGB(101, 179, 186),
        ["RightWing3"] = Color3.fromRGB(101, 179, 186),
        ["RightWing2"] = Color3.fromRGB(101, 179, 186),
        ["Head"] = Color3.fromRGB(101, 179, 186),
        ["LeftWing3a"] = Color3.fromRGB(101, 179, 186),
        ["LeftWing4a"] = Color3.fromRGB(101, 179, 186),
        ["LeftWing5a"] = Color3.fromRGB(101, 179, 186),
        ["LeftWingEnd"] = Color3.fromRGB(101, 179, 186),
        ["RightWing3a"] = Color3.fromRGB(101, 179, 186),
        ["RightWing4a"] = Color3.fromRGB(101, 179, 186),
        ["RightWing5a"] = Color3.fromRGB(101, 179, 186),
        ["RightWingEnd"] = Color3.fromRGB(101, 179, 186),
        ["Tail2"] = Color3.fromRGB(101, 179, 186),
        ["Tail3"] = Color3.fromRGB(101, 179, 186)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v2.summerfest_2024_bald_eagle = v15
local v16 = {
    ["name"] = "Rodeo Bull",
    ["model"] = "Summerfest2024Bull",
    ["image"] = "rbxassetid://18119333909",
    ["rarity"] = "uncommon",
    ["cost"] = 10000,
    ["currency_id"] = "tickets_2024",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Summer2024BullSleep",
        ["running"] = "Summer2024BullRun",
        ["idle"] = "Summer2024BullIdle",
        ["eating"] = "Summer2024BullEat",
        ["sit"] = "Summer2024BullSit",
        ["flying"] = "Summer2024BullRun",
        ["hold"] = "Summer2024BullBeingHeldSingle",
        ["double_hold"] = "Summer2024BullBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Summer2024BullSit" },
        { "Joyful", "Summer2024BullJoyful" },
        { "Beg", "Summer2024BullBeg" },
        { "Jump", "Summer2024BullJump" },
        { "Trick 1", "Summer2024BullTrick1" },
        { "Trick 2", "Summer2024BullTrick2" }
    },
    ["neon_parts"] = {
        ["Tail2"] = Color3.fromRGB(186, 92, 20),
        ["Horns"] = Color3.fromRGB(186, 92, 20),
        ["Ring"] = Color3.fromRGB(186, 92, 20),
        ["LeftBackFoot"] = Color3.fromRGB(186, 92, 20),
        ["RightBackFoot"] = Color3.fromRGB(186, 92, 20),
        ["LeftFrontFoot"] = Color3.fromRGB(186, 92, 20),
        ["RightFrontFoot"] = Color3.fromRGB(186, 92, 20),
        ["Hair"] = Color3.fromRGB(186, 92, 20),
        ["Hair2"] = Color3.fromRGB(186, 92, 20),
        ["Brows"] = Color3.fromRGB(186, 92, 20),
        ["LeftEar2"] = Color3.fromRGB(186, 92, 20),
        ["RightEar2"] = Color3.fromRGB(200, 82, 56),
        ["Hair3"] = Color3.fromRGB(170, 32, 37),
        ["Tail3"] = Color3.fromRGB(170, 32, 37),
        ["Tail4"] = Color3.fromRGB(170, 32, 37),
        ["Tail5"] = Color3.fromRGB(170, 32, 37)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.summerfest_2024_bull = v16
return v1(v2)