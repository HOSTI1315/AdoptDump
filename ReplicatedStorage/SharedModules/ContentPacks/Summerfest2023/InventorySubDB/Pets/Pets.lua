--// ReplicatedStorage.SharedModules.ContentPacks.Summerfest2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Arctic Tern",
    ["image"] = "rbxassetid://13804047294",
    ["model"] = "Summerfest2023ArcticTern",
    ["rarity"] = "uncommon",
    ["cost"] = 9000,
    ["currency_id"] = "beachballs_2023",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Summerfest2023ArcticTernBeingHeldDouble",
        ["eating"] = "Summerfest2023ArcticTernEat",
        ["flying"] = "Summerfest2023ArcticTernRun",
        ["hold"] = "Summerfest2023ArcticTernBeingHeldSingle",
        ["idle"] = "Summerfest2023ArcticTernIdle",
        ["running"] = "Summerfest2023ArcticTernRun",
        ["sit"] = "Summerfest2023ArcticTernSit",
        ["sleep"] = "Summerfest2023ArcticTernSleep"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2023ArcticTernSit" },
        { "Joyful", "Summerfest2023ArcticTernJoyful" },
        { "Beg", "Summerfest2023ArcticTernBeg" },
        { "Jump", "Summerfest2023ArcticTernJump" },
        { "Trick 1", "Summerfest2023ArcticTernTrick1" },
        { "Trick 2", "Summerfest2023ArcticTernTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(101, 184, 56),
        ["LeftWing"] = Color3.fromRGB(101, 184, 56),
        ["LeftWing4"] = Color3.fromRGB(101, 184, 56),
        ["LeftWing5"] = Color3.fromRGB(101, 184, 56),
        ["RightWing"] = Color3.fromRGB(101, 184, 56),
        ["RightWing4"] = Color3.fromRGB(101, 184, 56),
        ["RightWing5"] = Color3.fromRGB(101, 184, 56),
        ["Tail2"] = Color3.fromRGB(101, 184, 56)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v2.summerfest_2023_arctic_tern = v3
local v4 = {
    ["name"] = "Castle Hermit Crab",
    ["image"] = "rbxassetid://13883285383",
    ["model"] = "Summerfest2023CastleHermitCrab",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Summerfest2023CastleHermitCrabBeingHeldDouble",
        ["eating"] = "Summerfest2023CastleHermitCrabEat",
        ["flying"] = "Summerfest2023CastleHermitCrabRun",
        ["hold"] = "Summerfest2023CastleHermitCrabBeingHeldSingle",
        ["idle"] = "Summerfest2023CastleHermitCrabIdle",
        ["running"] = "Summerfest2023CastleHermitCrabRun",
        ["sit"] = "Summerfest2023CastleHermitCrabSit",
        ["sleep"] = "Summerfest2023CastleHermitCrabSleep"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2023CastleHermitCrabSit" },
        { "Joyful", "Summerfest2023CastleHermitCrabJoyful" },
        { "Beg", "Summerfest2023CastleHermitCrabBeg" },
        { "Jump", "Summerfest2023CastleHermitCrabJump" },
        { "Trick 1", "Summerfest2023CastleHermitCrabTrick1" },
        { "Trick 2", "Summerfest2023CastleHermitCrabTrick2" }
    },
    ["neon_parts"] = {
        ["Castle2"] = Color3.fromRGB(85, 122, 186),
        ["Castle3"] = Color3.fromRGB(85, 122, 186),
        ["Castle4"] = Color3.fromRGB(85, 122, 186),
        ["Castle5"] = Color3.fromRGB(85, 122, 186),
        ["Castle6"] = Color3.fromRGB(85, 122, 186),
        ["Castle7"] = Color3.fromRGB(85, 122, 186),
        ["Seaweed"] = Color3.fromRGB(90, 186, 87)
    },
    ["eyes"] = { "Eyes_Left", "Eyes_Right" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.summerfest_2023_castle_hermit_crab = v4
local v5 = {
    ["name"] = "Flying Fish",
    ["image"] = "rbxassetid://13620861015",
    ["model"] = "Summerfest2023FlyingFish",
    ["rarity"] = "common",
    ["cost"] = 3750,
    ["currency_id"] = "beachballs_2023",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Summerfest2023FlyingFishBeingHeldDouble",
        ["eating"] = "Summerfest2023FlyingFishEat",
        ["flying"] = "Summerfest2023FlyingFishRun",
        ["hold"] = "Summerfest2023FlyingFishBeingHeldSingle",
        ["idle"] = "Summerfest2023FlyingFishIdle",
        ["running"] = "Summerfest2023FlyingFishRun",
        ["sit"] = "Summerfest2023FlyingFishSit",
        ["sleep"] = "Summerfest2023FlyingFishSleep"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2023FlyingFishSit" },
        { "Dig", "Summerfest2023FlyingFishDig" },
        { "Joyful", "Summerfest2023FlyingFishJoyful" },
        { "Beg", "Summerfest2023FlyingFishBeg" },
        { "Trick 1", "Summerfest2023FlyingFishTrick1" },
        { "Trick 2", "Summerfest2023FlyingFishTrick2" }
    },
    ["neon_parts"] = {
        ["LeftWing"] = Color3.fromRGB(188, 113, 56),
        ["RightWing"] = Color3.fromRGB(188, 113, 56),
        ["TailFin"] = Color3.fromRGB(188, 113, 56),
        ["Torso"] = Color3.fromRGB(188, 113, 56)
    },
    ["already_has_flying_wings"] = true,
    ["head_rotator_disabled"] = true
}
v2.summerfest_2023_flying_fish = v5
local v6 = {
    ["name"] = "Happy Clam",
    ["image"] = "rbxassetid://13803784751",
    ["model"] = "Summerfest2023HappyClam",
    ["rarity"] = "ultra_rare",
    ["cost"] = 50000,
    ["currency_id"] = "beachballs_2023",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Summerfest2023HappyClamBeingHeldDouble",
        ["eating"] = "Summerfest2023HappyClamEat",
        ["flying"] = "Summerfest2023HappyClamRideRun",
        ["hold"] = "Summerfest2023HappyClamBeingHeldSingle",
        ["idle"] = "Summerfest2023HappyClamIdle",
        ["idle_mounted"] = "Summerfest2023HappyClamRideRun",
        ["running"] = "Summerfest2023HappyClamRun",
        ["running_mounted"] = "Summerfest2023HappyClamRideRun",
        ["sit"] = "Summerfest2023HappyClamSit",
        ["sleep"] = "Summerfest2023HappyClamSleep"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2023HappyClamSit" },
        { "Joyful", "Summerfest2023HappyClamJoyful" },
        { "Beg", "Summerfest2023HappyClamBeg" },
        { "Jump", "Summerfest2023HappyClamJump" },
        { "Trick 1", "Summerfest2023HappyClamTrick1" },
        { "Trick 2", "Summerfest2023HappyClamTrick2" }
    },
    ["neon_parts"] = {
        ["BottomShell"] = Color3.fromRGB(185, 102, 102),
        ["Head"] = Color3.fromRGB(185, 102, 102),
        ["TopShell"] = Color3.fromRGB(185, 102, 102)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.summerfest_2023_happy_clam = v6
local v7 = {
    ["name"] = "Hermit Crab",
    ["image"] = "rbxassetid://13883282884",
    ["model"] = "Summerfest2023HermitCrab",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Summerfest2023HermitCrabBeingHeldDouble",
        ["eating"] = "Summerfest2023HermitCrabEat",
        ["flying"] = "Summerfest2023HermitCrabRun",
        ["hold"] = "Summerfest2023HermitCrabBeingHeldSingle",
        ["idle"] = "Summerfest2023HermitCrabIdle",
        ["running"] = "Summerfest2023HermitCrabRun",
        ["sit"] = "Summerfest2023HermitCrabSit",
        ["sleep"] = "Summerfest2023HermitCrabSleep"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2023HermitCrabSit" },
        { "Joyful", "Summerfest2023HermitCrabJoyful" },
        { "Beg", "Summerfest2023HermitCrabBeg" },
        { "Jump", "Summerfest2023HermitCrabJump" },
        { "Trick 1", "Summerfest2023HermitCrabTrick1" },
        { "Trick 2", "Summerfest2023HermitCrabTrick2" }
    },
    ["neon_parts"] = {
        ["Torso2"] = Color3.fromRGB(185, 171, 110)
    },
    ["eyes"] = { "Eyes_Left", "Eyes_right" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.summerfest_2023_hermit_crab = v7
local v8 = {
    ["name"] = "Hot Doggo",
    ["image"] = "rbxassetid://13672542902",
    ["model"] = "Summerfest2023HotdogDog",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Summerfest2023HotdogDogBeingHeldDouble",
        ["eating"] = "Summerfest2023HotdogDogEat",
        ["flying"] = "Summerfest2023HotdogDogRun",
        ["hold"] = "Summerfest2023HotdogDogBeingHeldSingle",
        ["idle"] = "Summerfest2023HotdogDogIdle",
        ["running"] = "Summerfest2023HotdogDogRun",
        ["sit"] = "Summerfest2023HotdogDogSit",
        ["sleep"] = "Summerfest2023HotdogDogSleep"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2023HotdogDogSit" },
        { "Joyful", "Summerfest2023HotdogDogJoyful" },
        { "Beg", "Summerfest2023HotdogDogBeg" },
        { "Jump", "Summerfest2023HotdogDogJump" },
        { "Trick 1", "Summerfest2023HotdogDogTrick1" },
        { "Trick 2", "Summerfest2023HotdogDogTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(191, 101, 55),
        ["Head3"] = Color3.fromRGB(191, 101, 55),
        ["LeftLettuce"] = Color3.fromRGB(191, 101, 55),
        ["Onion"] = Color3.fromRGB(191, 101, 55),
        ["Onion2"] = Color3.fromRGB(191, 101, 55),
        ["Onion3"] = Color3.fromRGB(191, 101, 55),
        ["RightLettuce"] = Color3.fromRGB(191, 101, 55),
        ["Torso"] = Color3.fromRGB(191, 101, 55),
        ["Torso2"] = Color3.fromRGB(191, 101, 55),
        ["Torso3"] = Color3.fromRGB(191, 101, 55)
    }
}
v2.summerfest_2023_hotdog_dog = v8
local v9 = {
    ["name"] = "Ice Cream Hermit Crab",
    ["image"] = "rbxassetid://13883284001",
    ["model"] = "Summerfest2023IceCreamCrab",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Summerfest2023IceCreamCrabBeingHeldDouble",
        ["eating"] = "Summerfest2023IceCreamCrabEat",
        ["flying"] = "Summerfest2023IceCreamCrabRun",
        ["hold"] = "Summerfest2023IceCreamCrabBeingHeldSingle",
        ["idle"] = "Summerfest2023IceCreamCrabIdle",
        ["running"] = "Summerfest2023IceCreamCrabRun",
        ["sit"] = "Summerfest2023IceCreamCrabSit",
        ["sleep"] = "Summerfest2023IceCreamCrabSleep"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2023IceCreamCrabSit" },
        { "Joyful", "Summerfest2023IceCreamCrabJoyful" },
        { "Beg", "Summerfest2023IceCreamCrabBeg" },
        { "Jump", "Summerfest2023IceCreamCrabJump" },
        { "Trick 1", "Summerfest2023IceCreamCrabTrick1" },
        { "Trick 2", "Summerfest2023IceCreamCrabTrick2" }
    },
    ["neon_parts"] = {
        ["Cherry"] = Color3.fromRGB(188, 0, 0),
        ["Torso2"] = Color3.fromRGB(94, 153, 185),
        ["Torso3"] = Color3.fromRGB(188, 102, 103)
    },
    ["eyes"] = { "Eyes_Left", "Eyes_Right" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.summerfest_2023_ice_cream_crab = v9
local v10 = {
    ["name"] = "Leopard Shark",
    ["image"] = "rbxassetid://13693650831",
    ["model"] = "Summerfest2023LeopardShark",
    ["rarity"] = "rare",
    ["cost"] = 25000,
    ["currency_id"] = "beachballs_2023",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Summerfest2023LeopardSharkBeingHeldDouble",
        ["eating"] = "Summerfest2023LeopardSharkEat",
        ["flying"] = "Summerfest2023LeopardSharkRun",
        ["hold"] = "Summerfest2023LeopardSharkBeingHeldSingle",
        ["idle"] = "Summerfest2023LeopardSharkIdle",
        ["running"] = "Summerfest2023LeopardSharkRun",
        ["sit"] = "Summerfest2023LeopardSharkSit",
        ["sleep"] = "Summerfest2023LeopardSharkSleep"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2023LeopardSharkSit" },
        { "Joyful", "Summerfest2023LeopardSharkJoyful" },
        { "Beg", "Summerfest2023LeopardSharkBeg" },
        { "Jump", "Summerfest2023LeopardSharkJump" },
        { "Trick 1", "Summerfest2023LeopardSharkTrick1" },
        { "Trick 2", "Summerfest2023LeopardSharkTrick2" }
    },
    ["neon_parts"] = {
        ["BackFin"] = Color3.fromRGB(42, 184, 82),
        ["LeftFin1"] = Color3.fromRGB(42, 184, 82),
        ["LeftSmallFin1"] = Color3.fromRGB(42, 184, 82),
        ["RightFin1"] = Color3.fromRGB(42, 184, 82),
        ["RightSmallFin1"] = Color3.fromRGB(42, 184, 82),
        ["Tail2"] = Color3.fromRGB(42, 184, 82),
        ["Torso2"] = Color3.fromRGB(42, 184, 82)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v2.summerfest_2023_leopard_shark = v10
local v11 = {
    ["name"] = "Leviathan",
    ["image"] = "rbxassetid://13685038182",
    ["model"] = "Summerfest2023Leviathan",
    ["rarity"] = "legendary",
    ["cost"] = 130000,
    ["currency_id"] = "beachballs_2023",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Summerfest2023LeviathanBeingHeldDouble",
        ["eating"] = "Summerfest2023LeviathanEat",
        ["flying"] = "Summerfest2023LeviathanRun",
        ["hold"] = "Summerfest2023LeviathanBeingHeldSingle",
        ["idle"] = "Summerfest2023LeviathanIdle",
        ["running"] = "Summerfest2023LeviathanRun",
        ["sit"] = "Summerfest2023LeviathanSit",
        ["sleep"] = "Summerfest2023LeviathanSleep"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2023LeviathanSit" },
        { "Joyful", "Summerfest2023LeviathanJoyful" },
        { "Beg", "Summerfest2023LeviathanBeg" },
        { "Jump", "Summerfest2023LeviathanJump" },
        { "Trick 1", "Summerfest2023LeviathanTrick1" },
        { "Trick 2", "Summerfest2023LeviathanTrick2" }
    },
    ["neon_parts"] = {
        ["LeftAntenna"] = Color3.fromRGB(189, 101, 54),
        ["RightAntenna"] = Color3.fromRGB(189, 101, 54),
        ["Spikes"] = Color3.fromRGB(189, 101, 54),
        ["Spots"] = Color3.fromRGB(189, 101, 54),
        ["Torso"] = Color3.fromRGB(189, 101, 54)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v2.summerfest_2023_leviathan = v11
local v12 = {
    ["name"] = "Lobster",
    ["image"] = "rbxassetid://13685039170",
    ["model"] = "Summerfest2023Lobster",
    ["rarity"] = "uncommon",
    ["cost"] = 11000,
    ["currency_id"] = "beachballs_2023",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Summerfest2023LobsterBeingHeldDouble",
        ["eating"] = "Summerfest2023LobsterEat",
        ["flying"] = "Summerfest2023LobsterRun",
        ["hold"] = "Summerfest2023LobsterBeingHeldSingle",
        ["idle"] = "Summerfest2023LobsterIdle",
        ["running"] = "Summerfest2023LobsterRun",
        ["sit"] = "Summerfest2023LobsterSit",
        ["sleep"] = "Summerfest2023LobsterSleep"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2023LobsterSit" },
        { "Joyful", "Summerfest2023LobsterJoyful" },
        { "Beg", "Summerfest2023LobsterBeg" },
        { "Jump", "Summerfest2023LobsterJump" },
        { "Trick 1", "Summerfest2023LobsterTrick1" },
        { "Trick 2", "Summerfest2023LobsterTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(188, 143, 66),
        ["BackRightFoot"] = Color3.fromRGB(188, 143, 66),
        ["FrontLeftFoot"] = Color3.fromRGB(188, 143, 66),
        ["FrontRightFoot"] = Color3.fromRGB(188, 143, 66),
        ["LeftAntenna"] = Color3.fromRGB(188, 143, 66),
        ["LeftClaw"] = Color3.fromRGB(188, 143, 66),
        ["LeftMiddleFoot"] = Color3.fromRGB(188, 143, 66),
        ["RightAntenna"] = Color3.fromRGB(188, 143, 66),
        ["RightClaw"] = Color3.fromRGB(188, 143, 66),
        ["RightMiddleFoot"] = Color3.fromRGB(188, 143, 66),
        ["Tail"] = Color3.fromRGB(188, 143, 66),
        ["Torso5"] = Color3.fromRGB(188, 143, 66)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.summerfest_2023_lobster = v12
local v13 = {
    ["name"] = "Many Mackerel",
    ["image"] = "rbxassetid://13664973582",
    ["model"] = "Summerfest2023MackerelShoal",
    ["rarity"] = "ultra_rare",
    ["cost"] = 60000,
    ["currency_id"] = "beachballs_2023",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Summerfest2023MackerelShoalBeingHeldDouble",
        ["eating"] = "Summerfest2023MackerelShoalEat",
        ["flying"] = "Summerfest2023MackerelShoalRun",
        ["hold"] = "Summerfest2023MackerelShoalBeingHeldSingle",
        ["idle"] = "Summerfest2023MackerelShoalIdle",
        ["running"] = "Summerfest2023MackerelShoalRun",
        ["sit"] = "Summerfest2023MackerelShoalSit",
        ["sleep"] = "Summerfest2023MackerelShoalSleep"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2023MackerelShoalSit" },
        { "Joyful", "Summerfest2023MackerelShoalJoyful" },
        { "Beg", "Summerfest2023MackerelShoalBeg" },
        { "Jump", "Summerfest2023MackerelShoalJump" },
        { "Trick 1", "Summerfest2023MackerelShoalTrick1" },
        { "Trick 2", "Summerfest2023MackerelShoalTrick2" }
    },
    ["neon_parts"] = {
        ["FishA3"] = Color3.fromRGB(105, 188, 103),
        ["FishB4"] = Color3.fromRGB(105, 188, 103),
        ["FishC1"] = Color3.fromRGB(105, 188, 103),
        ["FishD1"] = Color3.fromRGB(105, 188, 103),
        ["FishE3"] = Color3.fromRGB(105, 188, 103),
        ["FishF1"] = Color3.fromRGB(105, 188, 103),
        ["FishG1"] = Color3.fromRGB(105, 188, 103),
        ["FishH1"] = Color3.fromRGB(105, 188, 103),
        ["FishI1"] = Color3.fromRGB(105, 188, 103)
    },
    ["head_rotator_disabled"] = true
}
v2.summerfest_2023_mackerel_shoal = v13
local v14 = {
    ["name"] = "Pirate Hermit Crab",
    ["image"] = "rbxassetid://13883274830",
    ["model"] = "Summerfest2023PirateHermitCrab",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Summerfest2023PirateHermitCrabBeingHeldDouble",
        ["eating"] = "Summerfest2023PirateHermitCrabEat",
        ["flying"] = "Summerfest2023PirateHermitCrabRun",
        ["hold"] = "Summerfest2023PirateHermitCrabBeingHeldSingle",
        ["idle"] = "Summerfest2023PirateHermitCrabIdle",
        ["running"] = "Summerfest2023PirateHermitCrabRun",
        ["sit"] = "Summerfest2023PirateHermitCrabSit",
        ["sleep"] = "Summerfest2023PirateHermitCrabSleep"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2023PirateHermitCrabSit" },
        { "Joyful", "Summerfest2023PirateHermitCrabJoyful" },
        { "Beg", "Summerfest2023PirateHermitCrabBeg" },
        { "Jump", "Summerfest2023PirateHermitCrabJump" },
        { "Trick 1", "Summerfest2023PirateHermitCrabTrick1" },
        { "Trick 2", "Summerfest2023PirateHermitCrabTrick2" }
    },
    ["neon_parts"] = {
        ["CannonHatch"] = Color3.fromRGB(17, 17, 17),
        ["LeftHook"] = Color3.fromRGB(109, 188, 97),
        ["Shipwreck10"] = Color3.fromRGB(109, 188, 97),
        ["Shipwreck2"] = Color3.fromRGB(109, 188, 97),
        ["Shipwreck3"] = Color3.fromRGB(109, 188, 97),
        ["Shipwreck4"] = Color3.fromRGB(17, 17, 17),
        ["Shipwreck5"] = Color3.fromRGB(109, 188, 97),
        ["ShipwreckSail"] = Color3.fromRGB(109, 188, 97)
    },
    ["eyes"] = { "Eyes_Left", "Eyes_Right" },
    ["generate_npc_furniture_on_runtime"] = true,
    ["head_rotator_disabled"] = true
}
v2.summerfest_2023_pirate_hermit_crab = v14
local v15 = {
    ["name"] = "Shark Puppy",
    ["image"] = "rbxassetid://13665641282",
    ["model"] = "Summerfest2023SharkDoggo",
    ["rarity"] = "legendary",
    ["cost"] = 100000,
    ["currency_id"] = "beachballs_2023",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Summerfest2023SharkDoggoBeingHeldDouble",
        ["eating"] = "Summerfest2023SharkDoggoEat",
        ["flying"] = "Summerfest2023SharkDoggoRun",
        ["hold"] = "Summerfest2023SharkDoggoBeingHeldSingle",
        ["idle"] = "Summerfest2023SharkDoggoIdle",
        ["running"] = "Summerfest2023SharkDoggoRun",
        ["sit"] = "Summerfest2023SharkDoggoSit",
        ["sleep"] = "Summerfest2023SharkDoggoSleep"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2023SharkDoggoSit" },
        { "Joyful", "Summerfest2023SharkDoggoJoyful" },
        { "Beg", "Summerfest2023SharkDoggoBeg" },
        { "Jump", "Summerfest2023SharkDoggoJump" },
        { "Trick 1", "Summerfest2023SharkDoggoTrick1" },
        { "Trick 2", "Summerfest2023SharkDoggoTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(152, 116, 188),
        ["LeftFin3"] = Color3.fromRGB(152, 116, 188),
        ["RightFin2"] = Color3.fromRGB(152, 116, 188),
        ["Tail2"] = Color3.fromRGB(152, 116, 188),
        ["Torso2"] = Color3.fromRGB(152, 116, 188)
    },
    ["flying_move_anim_speed"] = 0.8,
    ["minimum_fly_anim_speed"] = 0.8
}
v2.summerfest_2023_shark_doggo = v15
local v16 = {
    ["name"] = "Tortuga de la Isla",
    ["image"] = "rbxassetid://13621428133",
    ["model"] = "Summerfest2023TortugaDeLaIsla",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Summerfest",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Summerfest2023TortugaDeLaIslaBeingHeldDouble",
        ["eating"] = "Summerfest2023TortugaDeLaIslaEat",
        ["flying"] = "Summerfest2023TortugaDeLaIslaRideRun",
        ["hold"] = "Summerfest2023TortugaDeLaIslaBeingHeldSingle",
        ["idle"] = "Summerfest2023TortugaDeLaIslaIdle",
        ["running"] = "Summerfest2023TortugaDeLaIslaRun",
        ["running_mounted"] = "Summerfest2023TortugaDeLaIslaRideRun",
        ["sit"] = "Summerfest2023TortugaDeLaIslaSit",
        ["sleep"] = "Summerfest2023TortugaDeLaIslaSleep"
    },
    ["tricks"] = {
        { "Sit", "Summerfest2023TortugaDeLaIslaSit" },
        { "Joyful", "Summerfest2023TortugaDeLaIslaJoyful" },
        { "Beg", "Summerfest2023TortugaDeLaIslaBeg" },
        { "Jump", "Summerfest2023TortugaDeLaIslaJump" },
        { "Trick 1", "Summerfest2023TortugaDeLaIslaTrick1" },
        { "Trick 2", "Summerfest2023TortugaDeLaIslaTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(14, 116, 188),
        ["LeftBackFoot"] = Color3.fromRGB(14, 116, 188),
        ["LeftFrontFoot"] = Color3.fromRGB(14, 116, 188),
        ["PalmTree2"] = Color3.fromRGB(14, 116, 188),
        ["RightBackFoot"] = Color3.fromRGB(14, 116, 188),
        ["RightFrontFoot"] = Color3.fromRGB(14, 116, 188),
        ["Shell"] = Color3.fromRGB(14, 116, 188)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.summerfest_2023_tortuga_de_la_isla = v16
return v1(v2)