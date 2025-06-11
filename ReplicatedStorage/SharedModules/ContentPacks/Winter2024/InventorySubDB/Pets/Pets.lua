--// ReplicatedStorage.SharedModules.ContentPacks.Winter2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper)
local v2 = {}
local v3 = {
    ["name"] = "Fairy Bat Dragon",
    ["model"] = "Winter2024FairyBatDragon",
    ["image"] = "rbxassetid://76035105070441",
    ["rarity"] = "legendary",
    ["already_has_flying_wings"] = true,
    ["anims"] = {
        ["sleep"] = "Winter2024FairyBatDragonSleep",
        ["running"] = "Winter2024FairyBatDragonRun",
        ["idle"] = "Winter2024FairyBatDragonIdle",
        ["eating"] = "Winter2024FairyBatDragonEat",
        ["sit"] = "Winter2024FairyBatDragonSit",
        ["flying"] = "Winter2024FairyBatDragonRun",
        ["hold"] = "Winter2024FairyBatDragonBeingHeldSingle",
        ["double_hold"] = "Winter2024FairyBatDragonBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Winter2024FairyBatDragonSit" },
        { "Joyful", "Winter2024FairyBatDragonJoyful" },
        { "Beg", "Winter2024FairyBatDragonBeg" },
        { "Jump", "Winter2024FairyBatDragonJump" },
        { "Trick 1", "Winter2024FairyBatDragonTrick1" },
        { "Trick 2", "Winter2024FairyBatDragonTrick2" }
    },
    ["neon_parts"] = {
        ["Fangs"] = Color3.fromRGB(189, 129, 89),
        ["Nose"] = Color3.fromRGB(201, 223, 151),
        ["Torso3"] = Color3.fromRGB(168, 186, 126),
        ["Tail3"] = Color3.fromRGB(168, 186, 126),
        ["Horns"] = Color3.fromRGB(162, 162, 111),
        ["Torso4"] = Color3.fromRGB(253, 234, 141),
        ["RightFrontFoot"] = Color3.fromRGB(189, 129, 89),
        ["LeftFrontFoot"] = Color3.fromRGB(189, 129, 89),
        ["LeftBackFoot"] = Color3.fromRGB(189, 129, 89),
        ["LeftBackFoot3"] = Color3.fromRGB(253, 234, 141),
        ["RightBackFoot3"] = Color3.fromRGB(253, 234, 141),
        ["RightFrontFoot3"] = Color3.fromRGB(253, 234, 141),
        ["RightWing4"] = Color3.fromRGB(253, 234, 141),
        ["RightBackFoot"] = Color3.fromRGB(189, 129, 89),
        ["LeftFrontFoot3"] = Color3.fromRGB(253, 234, 141),
        ["Spikes"] = Color3.fromRGB(196, 217, 147),
        ["LeftWing4"] = Color3.fromRGB(253, 234, 141),
        ["Tail2"] = Color3.fromRGB(189, 129, 89),
        ["Head3"] = Color3.fromRGB(189, 129, 89),
        ["RightFrontFoot2"] = Color3.fromRGB(168, 186, 126),
        ["LeftFrontFoot2"] = Color3.fromRGB(168, 186, 126),
        ["LeftBackFoot2"] = Color3.fromRGB(168, 186, 126),
        ["RightBackFoot2"] = Color3.fromRGB(168, 186, 126),
        ["Torso2"] = Color3.fromRGB(189, 129, 89),
        ["RightWing3"] = Color3.fromRGB(189, 129, 89),
        ["LeftWing3"] = Color3.fromRGB(189, 129, 89),
        ["RightWing2"] = Color3.fromRGB(168, 186, 126),
        ["LeftWing2"] = Color3.fromRGB(168, 186, 126),
        ["LeftEar2"] = Color3.fromRGB(189, 129, 89),
        ["RightEar2"] = Color3.fromRGB(189, 129, 89),
        ["LeftWing6"] = Color3.fromRGB(168, 186, 126),
        ["RightWing6"] = Color3.fromRGB(168, 186, 126),
        ["Tail4"] = Color3.fromRGB(189, 129, 89),
        ["Tail5"] = Color3.fromRGB(168, 186, 126)
    },
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["gamepass_id"] = "winter_2024_fairy_bat_dragon_bundle",
    ["maximum_run_anim_speed"] = 0.85,
    ["minimum_fly_anim_speed"] = 0.85,
    ["maximum_fly_anim_speed"] = 0.85,
    ["baked_in_accessory_parts"] = {
        ["winter_2024_gold_fairy_crown"] = { "Crown", "Crown2" }
    },
    ["pre_equipped_removable_accessories"] = { "winter_2024_gold_fairy_crown" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2024_fairy_bat_dragon = v3
local v4 = {
    ["name"] = "Ratatoskr",
    ["model"] = "Winter2024Ratatoskr",
    ["cost"] = 3400,
    ["currency_id"] = "gingerbread_2024",
    ["image"] = "rbxassetid://124671555129102",
    ["rarity"] = "common",
    ["anims"] = {
        ["sleep"] = "Winter2024RatatoskrSleep",
        ["running"] = "Winter2024RatatoskrRun",
        ["idle"] = "Winter2024RatatoskrIdle",
        ["eating"] = "Winter2024RatatoskrEat",
        ["sit"] = "Winter2024RatatoskrSit",
        ["flying"] = "Winter2024RatatoskrRun",
        ["hold"] = "Winter2024RatatoskrBeingHeldSingle",
        ["double_hold"] = "Winter2024RatatoskrBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Winter2024RatatoskrSit" },
        { "Joyful", "Winter2024RatatoskrJoyful" },
        { "Beg", "Winter2024RatatoskrBeg" },
        { "Jump", "Winter2024RatatoskrJump" },
        { "Trick 1", "Winter2024RatatoskrTrick1" },
        { "Trick 2", "Winter2024RatatoskrTrick2" }
    },
    ["neon_parts"] = {
        ["Torso"] = Color3.fromRGB(189, 147, 99),
        ["Head2"] = Color3.fromRGB(189, 147, 99),
        ["LeftEar3"] = Color3.fromRGB(189, 147, 99),
        ["RightEar3"] = Color3.fromRGB(189, 147, 99),
        ["Tail2"] = Color3.fromRGB(189, 147, 99)
    },
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["minimum_fly_anim_speed"] = 0.85,
    ["maximum_fly_anim_speed"] = 0.85,
    ["mounted_fly_forward_tilt_compensation"] = -26,
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2024_ratatoskr = v4
local v5 = {
    ["name"] = "Bauble Buddies",
    ["model"] = "Winter2024BaubleBuddies",
    ["cost"] = 85000,
    ["currency_id"] = "gingerbread_2024",
    ["image"] = "rbxassetid://114456035353449",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["sleep"] = "Winter2024BaubleBuddiesSleep",
        ["running"] = "Winter2024BaubleBuddiesRun",
        ["idle"] = "Winter2024BaubleBuddiesIdle",
        ["eating"] = "Winter2024BaubleBuddiesEat",
        ["sit"] = "Winter2024BaubleBuddiesSit",
        ["flying"] = "Winter2024BaubleBuddiesRun",
        ["hold"] = "Winter2024BaubleBuddiesBeingHeldSingle",
        ["double_hold"] = "Winter2024BaubleBuddiesBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Winter2024BaubleBuddiesSit" },
        { "Joyful", "Winter2024BaubleBuddiesJoyful" },
        { "Beg", "Winter2024BaubleBuddiesBeg" },
        { "Jump", "Winter2024BaubleBuddiesJump" },
        { "Trick 1", "Winter2024BaubleBuddiesTrick1" },
        { "Trick 2", "Winter2024BaubleBuddiesTrick2" }
    },
    ["neon_parts"] = {
        ["TorsoLeft"] = Color3.fromRGB(26, 255, 217),
        ["HeadRight"] = Color3.fromRGB(75, 184, 35)
    }
}
local v6 = {
    ["origin"] = "Winter",
    ["origin_items"] = {},
    ["year"] = 2024,
    ["viewport_override"] = {
        ["distance"] = 4,
        ["offset"] = CFrame.new(0, 0, -0.25)
    }
}
v5.origin_entry = v6
v5.head_rotator_disabled = true
v5.generate_npc_furniture_on_runtime = true
v2.winter_2024_bauble_buddies = v5
local v7 = {
    ["name"] = "Mistletroll",
    ["image"] = "rbxassetid://124908510040897",
    ["model"] = "Winter2024Mistletroll",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["double_hold"] = "Winter2024MistletrollBeingHeldDouble",
        ["eating"] = "Winter2024MistletrollEat",
        ["flying"] = "Winter2024MistletrollRun",
        ["hold"] = "Winter2024MistletrollBeingHeldSingle",
        ["idle"] = "Winter2024MistletrollIdle",
        ["running"] = "Winter2024MistletrollRun",
        ["sit"] = "Winter2024MistletrollSit",
        ["sleep"] = "Winter2024MistletrollSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2024MistletrollSit" },
        { "Joyful", "Winter2024MistletrollJoyful" },
        { "Beg", "Winter2024MistletrollBeg" },
        { "Jump", "Winter2024MistletrollJump" },
        { "Trick 1", "Winter2024MistletrollTrick1" },
        { "Trick 2", "Winter2024MistletrollTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(58, 104, 255),
        ["Tail"] = Color3.fromRGB(58, 104, 255),
        ["RightEar"] = Color3.fromRGB(58, 104, 255),
        ["LeftEar"] = Color3.fromRGB(58, 104, 255)
    },
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["cost"] = 16000,
    ["currency_id"] = "gingerbread_2024",
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2024_mistletroll = v7
local v8 = {
    ["name"] = "Merry Mistletroll",
    ["image"] = "rbxassetid://130734656883878",
    ["model"] = "Winter2024MerryMistletroll",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["double_hold"] = "Winter2024MistletrollBeingHeldDouble",
        ["eating"] = "Winter2024MistletrollEat",
        ["flying"] = "Winter2024MistletrollRun",
        ["hold"] = "Winter2024MistletrollBeingHeldSingle",
        ["idle"] = "Winter2024MistletrollIdle",
        ["running"] = "Winter2024MistletrollRun",
        ["sit"] = "Winter2024MistletrollSit",
        ["sleep"] = "Winter2024MistletrollSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2024MistletrollSit" },
        { "Joyful", "Winter2024MistletrollJoyful" },
        { "Beg", "Winter2024MistletrollBeg" },
        { "Jump", "Winter2024MistletrollJump" },
        { "Trick 1", "Winter2024MistletrollTrick1" },
        { "Trick 2", "Winter2024MistletrollTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(191, 104, 82),
        ["Tail"] = Color3.fromRGB(191, 104, 82),
        ["RightEar"] = Color3.fromRGB(191, 104, 82),
        ["LeftEar"] = Color3.fromRGB(191, 104, 82)
    },
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "winter_2024_golden_mistletoe" },
        ["year"] = 2024
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2024_merry_mistletroll = v8
local v9 = {
    ["name"] = "Royal Mistletroll",
    ["image"] = "rbxassetid://137637490639925",
    ["model"] = "Winter2024RoyalMistletroll",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["double_hold"] = "Winter2024MistletrollBeingHeldDouble",
        ["eating"] = "Winter2024MistletrollEat",
        ["flying"] = "Winter2024MistletrollRun",
        ["hold"] = "Winter2024MistletrollBeingHeldSingle",
        ["idle"] = "Winter2024MistletrollIdle",
        ["running"] = "Winter2024MistletrollRun",
        ["sit"] = "Winter2024MistletrollSit",
        ["sleep"] = "Winter2024MistletrollSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2024MistletrollSit" },
        { "Joyful", "Winter2024MistletrollJoyful" },
        { "Beg", "Winter2024MistletrollBeg" },
        { "Jump", "Winter2024MistletrollJump" },
        { "Trick 1", "Winter2024MistletrollTrick1" },
        { "Trick 2", "Winter2024MistletrollTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(148, 189, 95),
        ["Tail"] = Color3.fromRGB(148, 189, 95),
        ["RightEar"] = Color3.fromRGB(148, 189, 95),
        ["LeftEar"] = Color3.fromRGB(148, 189, 95)
    },
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "winter_2024_golden_mistletoe" },
        ["year"] = 2024
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2024_royal_mistletroll = v9
local v10 = {
    ["name"] = "Naughty Mistletroll",
    ["image"] = "rbxassetid://88361277330582",
    ["model"] = "Winter2024NaughtyMistletroll",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["double_hold"] = "Winter2024MistletrollBeingHeldDouble",
        ["eating"] = "Winter2024MistletrollEat",
        ["flying"] = "Winter2024MistletrollRun",
        ["hold"] = "Winter2024MistletrollBeingHeldSingle",
        ["idle"] = "Winter2024MistletrollIdle",
        ["running"] = "Winter2024MistletrollRun",
        ["sit"] = "Winter2024MistletrollSit",
        ["sleep"] = "Winter2024MistletrollSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2024MistletrollSit" },
        { "Joyful", "Winter2024MistletrollJoyful" },
        { "Beg", "Winter2024MistletrollBeg" },
        { "Jump", "Winter2024MistletrollJump" },
        { "Trick 1", "Winter2024MistletrollTrick1" },
        { "Trick 2", "Winter2024MistletrollTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(177, 127, 164),
        ["Head4"] = Color3.fromRGB(142, 111, 188),
        ["RightEar4"] = Color3.fromRGB(142, 111, 188),
        ["LeftEar4"] = Color3.fromRGB(142, 111, 188),
        ["Tail"] = Color3.fromRGB(142, 111, 188)
    },
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "winter_2024_golden_mistletoe" },
        ["year"] = 2024
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2024_naughty_mistletroll = v10
local v11 = {
    ["name"] = "Mr. Whiskerpips",
    ["image"] = "rbxassetid://136340738568203",
    ["model"] = "Winter2024MrWhiskerpips",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["double_hold"] = "Winter2024MrWhiskerpipsBeingHeldDouble",
        ["eating"] = "Winter2024MrWhiskerpipsEat",
        ["flying"] = "Winter2024MrWhiskerpipsRun",
        ["hold"] = "Winter2024MrWhiskerpipsBeingHeldSingle",
        ["idle"] = "Winter2024MrWhiskerpipsIdle",
        ["running"] = "Winter2024MrWhiskerpipsRun",
        ["sit"] = "Winter2024MrWhiskerpipsSit",
        ["sleep"] = "Winter2024MrWhiskerpipsSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2024MrWhiskerpipsSit" },
        { "Joyful", "Winter2024MrWhiskerpipsJoyful" },
        { "Beg", "Winter2024MrWhiskerpipsBeg" },
        { "Jump", "Winter2024MrWhiskerpipsJump" },
        { "Trick 1", "Winter2024MrWhiskerpipsTrick1" },
        { "Trick 2", "Winter2024MrWhiskerpipsTrick2" }
    },
    ["neon_parts"] = {
        ["FrontLeftFoot"] = Color3.fromRGB(186, 123, 111),
        ["LeftEar3"] = Color3.fromRGB(188, 108, 143),
        ["FrontRightFoot"] = Color3.fromRGB(186, 123, 111),
        ["RightEar3"] = Color3.fromRGB(188, 108, 143),
        ["Head3"] = Color3.fromRGB(186, 123, 111),
        ["Tail"] = Color3.fromRGB(186, 123, 111),
        ["Torso6"] = Color3.fromRGB(186, 123, 111),
        ["RightEar2"] = Color3.fromRGB(186, 123, 111),
        ["LeftEar2"] = Color3.fromRGB(186, 123, 111)
    },
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["maximum_run_anim_speed"] = 0.85,
    ["minimum_fly_anim_speed"] = 0.7,
    ["maximum_fly_anim_speed"] = 0.7,
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2024_mr_whiskerpips = v11
local v12 = {
    ["name"] = "Ice Cube",
    ["image"] = "rbxassetid://73641371341710",
    ["model"] = "Winter2024IceCube",
    ["rarity"] = "rare",
    ["anims"] = {
        ["double_hold"] = "Winter2024IceCubeBeingHeldDouble",
        ["eating"] = "Winter2024IceCubeEat",
        ["flying"] = "Winter2024IceCubeRun",
        ["hold"] = "Winter2024IceCubeBeingHeldSingle",
        ["idle"] = "Winter2024IceCubeIdle",
        ["running"] = "Winter2024IceCubeRun",
        ["sit"] = "Winter2024IceCubeSit",
        ["sleep"] = "Winter2024IceCubeSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2024IceCubeSit" },
        { "Joyful", "Winter2024IceCubeJoyful" },
        { "Beg", "Winter2024IceCubeBeg" },
        { "Jump", "Winter2024IceCubeJump" },
        { "Trick 1", "Winter2024IceCubeTrick1" },
        { "Trick 2", "Winter2024IceCubeTrick2" }
    }
}
local v13 = {
    ["Torso"] = {
        ["Color"] = Color3.fromRGB(99, 176, 197),
        ["Transparency"] = 0.55
    },
    ["Core"] = {
        ["Color"] = Color3.fromRGB(50, 151, 179)
    },
    ["Torso2"] = {
        ["Color"] = Color3.fromRGB(255, 255, 255),
        ["Material"] = Enum.Material.ForceField
    }
}
v12.neon_parts = v13
v12.origin_entry = {
    ["origin"] = "Winter",
    ["origin_items"] = { "winter_2024_ice_tray" },
    ["year"] = 2024
}
v12.generate_npc_furniture_on_runtime = true
v2.winter_2024_ice_cube = v12
local v14 = {
    ["name"] = "Cold Cube",
    ["image"] = "rbxassetid://95871612352029",
    ["model"] = "Winter2024ColdCube",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["double_hold"] = "Winter2024ColdCubeBeingHeldDouble",
        ["eating"] = "Winter2024ColdCubeEat",
        ["flying"] = "Winter2024ColdCubeRun",
        ["hold"] = "Winter2024ColdCubeBeingHeldSingle",
        ["idle"] = "Winter2024ColdCubeIdle",
        ["running"] = "Winter2024ColdCubeRun",
        ["sit"] = "Winter2024ColdCubeSit",
        ["sleep"] = "Winter2024ColdCubeSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2024ColdCubeSit" },
        { "Joyful", "Winter2024ColdCubeJoyful" },
        { "Beg", "Winter2024ColdCubeBeg" },
        { "Jump", "Winter2024ColdCubeJump" },
        { "Trick 1", "Winter2024ColdCubeTrick1" },
        { "Trick 2", "Winter2024ColdCubeTrick2" }
    }
}
local v15 = {
    ["Torso2"] = {
        ["Color"] = Color3.fromRGB(65, 194, 168),
        ["Transparency"] = 0.55
    },
    ["Core"] = {
        ["Color"] = Color3.fromRGB(132, 173, 67)
    },
    ["Torso"] = {
        ["Color"] = Color3.fromRGB(255, 255, 255),
        ["Material"] = Enum.Material.ForceField
    },
    ["Eyes"] = {
        ["Transparency"] = 0.02,
        ["Material"] = Enum.Material.SmoothPlastic
    }
}
v14.neon_parts = v15
v14.origin_entry = {
    ["origin"] = "Winter",
    ["origin_items"] = { "winter_2024_ice_tray" },
    ["year"] = 2024
}
v14.generate_npc_furniture_on_runtime = true
v2.winter_2024_cold_cube = v14
local v16 = {
    ["name"] = "Berry Cool Cube",
    ["image"] = "rbxassetid://102144672439627",
    ["model"] = "Winter2024BerryCoolCube",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["double_hold"] = "Winter2024BerryCoolCubeBeingHeldDouble",
        ["eating"] = "Winter2024BerryCoolCubeEat",
        ["flying"] = "Winter2024BerryCoolCubeRun",
        ["hold"] = "Winter2024BerryCoolCubeBeingHeldSingle",
        ["idle"] = "Winter2024BerryCoolCubeIdle",
        ["running"] = "Winter2024BerryCoolCubeRun",
        ["sit"] = "Winter2024BerryCoolCubeSit",
        ["sleep"] = "Winter2024BerryCoolCubeSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2024BerryCoolCubeSit" },
        { "Joyful", "Winter2024BerryCoolCubeJoyful" },
        { "Beg", "Winter2024BerryCoolCubeBeg" },
        { "Jump", "Winter2024BerryCoolCubeJump" },
        { "Trick 1", "Winter2024BerryCoolCubeTrick1" },
        { "Trick 2", "Winter2024BerryCoolCubeTrick2" }
    }
}
local v17 = {
    ["Torso"] = {
        ["Color"] = Color3.fromRGB(255, 255, 255),
        ["Material"] = Enum.Material.ForceField,
        ["Transparency"] = 0
    },
    ["Torso2"] = {
        ["Color"] = Color3.fromRGB(31, 213, 104),
        ["Transparency"] = 0.8
    },
    ["Core"] = Color3.fromRGB(147, 25, 1),
    ["Torso3"] = {
        ["Color"] = Color3.fromRGB(94, 167, 194),
        ["Transparency"] = 0.15
    }
}
v16.neon_parts = v17
v16.origin_entry = {
    ["origin"] = "Winter",
    ["origin_items"] = { "winter_2024_ice_tray" },
    ["year"] = 2024
}
v16.generate_npc_furniture_on_runtime = true
v2.winter_2024_berry_cool_cube = v16
local v18 = {
    ["name"] = "Partridge",
    ["image"] = "rbxassetid://110894046614323",
    ["model"] = "Winter2024Partridge",
    ["rarity"] = "ultra_rare",
    ["cost"] = 79000,
    ["currency_id"] = "gingerbread_2024",
    ["anims"] = {
        ["double_hold"] = "Winter2024PartridgeBeingHeldDouble",
        ["eating"] = "Winter2024PartridgeEat",
        ["flying"] = "Winter2024PartridgeRun",
        ["hold"] = "Winter2024PartridgeBeingHeldSingle",
        ["idle"] = "Winter2024PartridgeIdle",
        ["running"] = "Winter2024PartridgeRun",
        ["sit"] = "Winter2024PartridgeSit",
        ["sleep"] = "Winter2024PartridgeSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2024PartridgeSit" },
        { "Joyful", "Winter2024PartridgeJoyful" },
        { "Beg", "Winter2024PartridgeBeg" },
        { "Jump", "Winter2024PartridgeJump" },
        { "Trick 1", "Winter2024PartridgeTrick1" },
        { "Trick 2", "Winter2024PartridgeTrick2" }
    },
    ["neon_parts"] = {
        ["Torso2"] = Color3.fromRGB(189, 97, 36),
        ["Head3"] = Color3.fromRGB(189, 97, 36),
        ["Torso3"] = Color3.fromRGB(189, 97, 36),
        ["Tail2"] = Color3.fromRGB(189, 97, 36)
    },
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2024_partridge = v18
local v19 = {
    ["name"] = "Frostclaw",
    ["image"] = "rbxassetid://76354526914534",
    ["model"] = "Winter2024Frostclaw",
    ["rarity"] = "legendary",
    ["cost"] = 170000,
    ["currency_id"] = "gingerbread_2024",
    ["anims"] = {
        ["double_hold"] = "Winter2024FrostclawBeingHeldDouble",
        ["eating"] = "Winter2024FrostclawEat",
        ["flying"] = "Winter2024FrostclawRun",
        ["hold"] = "Winter2024FrostclawBeingHeldSingle",
        ["idle"] = "Winter2024FrostclawIdle",
        ["running"] = "Winter2024FrostclawRun",
        ["sit"] = "Winter2024FrostclawSit",
        ["sleep"] = "Winter2024FrostclawSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2024FrostclawSit" },
        { "Joyful", "Winter2024FrostclawJoyful" },
        { "Beg", "Winter2024FrostclawBeg" },
        { "Jump", "Winter2024FrostclawJump" },
        { "Trick 1", "Winter2024FrostclawTrick1" },
        { "Trick 2", "Winter2024FrostclawTrick2" }
    },
    ["neon_parts"] = {
        ["RightPointer"] = Color3.fromRGB(64, 104, 198),
        ["RightPinky"] = Color3.fromRGB(64, 104, 198),
        ["LeftThumb"] = Color3.fromRGB(64, 104, 198),
        ["RightMiddle"] = Color3.fromRGB(64, 104, 198),
        ["LeftPinky"] = Color3.fromRGB(64, 104, 198),
        ["LeftPointer"] = Color3.fromRGB(64, 104, 198),
        ["RightThumb"] = Color3.fromRGB(64, 104, 198),
        ["LeftMiddle"] = Color3.fromRGB(64, 104, 198),
        ["Head2"] = Color3.fromRGB(64, 104, 198),
        ["Eyes2"] = Color3.fromRGB(1, 62, 166),
        ["Eyes1"] = Color3.fromRGB(101, 198, 183),
        ["Eyes"] = Color3.fromRGB(101, 198, 183),
        ["Back"] = Color3.fromRGB(64, 104, 198),
        ["Jaw"] = Color3.fromRGB(15, 15, 17)
    },
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["eyes"] = { "Eyes", "Eyes1" },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2024_frostclaw = v19
local v20 = {
    ["name"] = "Great Pyrenees",
    ["image"] = "rbxassetid://90987982535884",
    ["model"] = "Winter2024GreatPyrenees",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["cost"] = 35000,
    ["currency_id"] = "gingerbread_2024",
    ["anims"] = {
        ["double_hold"] = "Winter2024GreatPyreneesBeingHeldDouble",
        ["eating"] = "Winter2024GreatPyreneesEat",
        ["flying"] = "Winter2024GreatPyreneesRun",
        ["hold"] = "Winter2024GreatPyreneesBeingHeldSingle",
        ["idle"] = "Winter2024GreatPyreneesIdle",
        ["running"] = "Winter2024GreatPyreneesRun",
        ["sit"] = "Winter2024GreatPyreneesSit",
        ["sleep"] = "Winter2024GreatPyreneesSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2024GreatPyreneesSit" },
        { "Joyful", "Winter2024GreatPyreneesJoyful" },
        { "Beg", "Winter2024GreatPyreneesBeg" },
        { "Jump", "Winter2024GreatPyreneesJump" },
        { "Trick 1", "Winter2024GreatPyreneesTrick1" },
        { "Trick 2", "Winter2024GreatPyreneesTrick2" }
    },
    ["neon_parts"] = {
        ["Tongue"] = Color3.fromRGB(103, 144, 184),
        ["Nose"] = Color3.fromRGB(103, 144, 184),
        ["Freckles"] = Color3.fromRGB(103, 144, 184),
        ["Torso2"] = Color3.fromRGB(103, 144, 184),
        ["Tail"] = Color3.fromRGB(103, 144, 184),
        ["RightFrontFoot"] = Color3.fromRGB(103, 144, 184),
        ["LeftEar"] = Color3.fromRGB(103, 144, 184),
        ["LeftBackFoot"] = Color3.fromRGB(103, 144, 184),
        ["LeftFrontFoot"] = Color3.fromRGB(103, 144, 184),
        ["RightEar"] = Color3.fromRGB(103, 144, 184),
        ["RightBackFoot"] = Color3.fromRGB(103, 144, 184)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2024_great_pyrenees = v20
local v21 = {
    ["name"] = "Winter Buck",
    ["image"] = "rbxassetid://139217275750567",
    ["model"] = "Winter2024WinterBuck",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "winter_2024_winter_deer_bait" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Winter2024WinterBuckBeingHeldDouble",
        ["eating"] = "Winter2024WinterBuckEat",
        ["flying"] = "Winter2024WinterBuckRun",
        ["hold"] = "Winter2024WinterBuckBeingHeldSingle",
        ["idle"] = "Winter2024WinterBuckIdle",
        ["running"] = "Winter2024WinterBuckRun",
        ["sit"] = "Winter2024WinterBuckSit",
        ["sleep"] = "Winter2024WinterBuckSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2024WinterBuckSit" },
        { "Beg", "Winter2024WinterBuckBeg" },
        { "Joyful", "Winter2024WinterBuckJoyful" },
        { "Jump", "Winter2024WinterBuckJump" },
        { "Trick 1", "Winter2024WinterBuckTrick1" },
        { "Trick 2", "Winter2024WinterBuckTrick2" }
    },
    ["neon_parts"] = {
        ["Antlers"] = Color3.fromRGB(66, 138, 232)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2024_winter_buck = v21
local v22 = {
    ["name"] = "Winter Doe",
    ["image"] = "rbxassetid://93751644677101",
    ["model"] = "Winter2024WinterDoe",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "winter_2024_winter_deer_bait" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Winter2024WinterDoeBeingHeldDouble",
        ["eating"] = "Winter2024WinterDoeEat",
        ["flying"] = "Winter2024WinterDoeRun",
        ["hold"] = "Winter2024WinterDoeBeingHeldSingle",
        ["idle"] = "Winter2024WinterDoeIdle",
        ["running"] = "Winter2024WinterDoeRun",
        ["sit"] = "Winter2024WinterDoeSit",
        ["sleep"] = "Winter2024WinterDoeSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2024WinterDoeSit" },
        { "Beg", "Winter2024WinterDoeBeg" },
        { "Joyful", "Winter2024WinterDoeJoyful" },
        { "Jump", "Winter2024WinterDoeJump" },
        { "Trick 1", "Winter2024WinterDoeTrick1" },
        { "Trick 2", "Winter2024WinterDoeTrick2" }
    },
    ["neon_parts"] = {
        ["Antlers"] = Color3.fromRGB(104, 134, 232),
        ["Head3"] = Color3.fromRGB(56, 255, 122)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2024_winter_doe = v22
local v23 = {
    ["name"] = "Winter Fawn",
    ["image"] = "rbxassetid://104838807480936",
    ["model"] = "Winter2024WinterFawn",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "winter_2024_winter_deer_bait" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Winter2024WinterFawnBeingHeldDouble",
        ["eating"] = "Winter2024WinterFawnEat",
        ["flying"] = "Winter2024WinterFawnRun",
        ["hold"] = "Winter2024WinterFawnBeingHeldSingle",
        ["idle"] = "Winter2024WinterFawnIdle",
        ["running"] = "Winter2024WinterFawnRun",
        ["sit"] = "Winter2024WinterFawnSit",
        ["sleep"] = "Winter2024WinterFawnSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2024WinterFawnSit" },
        { "Beg", "Winter2024WinterFawnBeg" },
        { "Joyful", "Winter2024WinterFawnJoyful" },
        { "Jump", "Winter2024WinterFawnJump" },
        { "Trick 1", "Winter2024WinterFawnTrick1" },
        { "Trick 2", "Winter2024WinterFawnTrick2" }
    },
    ["neon_parts"] = {
        ["Antlers"] = Color3.fromRGB(118, 162, 232)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2024_winter_fawn = v23
local v24 = {
    ["name"] = "Aurora Fox",
    ["image"] = "rbxassetid://105346917979221",
    ["model"] = "Winter2024AuroraFox",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["double_hold"] = "Winter2024AuroraFoxBeingHeldDouble",
        ["eating"] = "Winter2024AuroraFoxEat",
        ["flying"] = "Winter2024AuroraFoxRun",
        ["hold"] = "Winter2024AuroraFoxBeingHeldSingle",
        ["idle"] = "Winter2024AuroraFoxIdle",
        ["running"] = "Winter2024AuroraFoxRun",
        ["sit"] = "Winter2024AuroraFoxSit",
        ["sleep"] = "Winter2024AuroraFoxSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2024AuroraFoxSit" },
        { "Joyful", "Winter2024AuroraFoxJoyful" },
        { "Beg", "Winter2024AuroraFoxBeg" },
        { "Jump", "Winter2024AuroraFoxJump" },
        { "Trick 1", "Winter2024AuroraFoxTrick1" },
        { "Trick 2", "Winter2024AuroraFoxTrick2" }
    },
    ["neon_parts"] = {
        ["Torso2"] = Color3.fromRGB(71, 167, 186),
        ["Head3"] = Color3.fromRGB(71, 167, 186),
        ["LeftEar2"] = Color3.fromRGB(69, 90, 186),
        ["RightEar2"] = Color3.fromRGB(69, 90, 186)
    },
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.winter_2024_aurora_fox = v24
local v25 = {
    ["name"] = "Frostbite Cub",
    ["image"] = "rbxassetid://76735046136809",
    ["model"] = "Winter2024FrostbiteCub",
    ["rarity"] = "ultra_rare",
    ["cost"] = 70000,
    ["currency_id"] = "gingerbread_2024",
    ["anims"] = {
        ["double_hold"] = "Winter2024FrostbiteCubBeingHeldDouble",
        ["eating"] = "Winter2024FrostbiteCubEat",
        ["flying"] = "Winter2024FrostbiteCubRun",
        ["hold"] = "Winter2024FrostbiteCubBeingHeldSingle",
        ["idle"] = "Winter2024FrostbiteCubIdle",
        ["running"] = "Winter2024FrostbiteCubRun",
        ["sit"] = "Winter2024FrostbiteCubSit",
        ["sleep"] = "Winter2024FrostbiteCubSleep"
    },
    ["tricks"] = {
        { "Sit", "Winter2024FrostbiteCubSit" },
        { "Joyful", "Winter2024FrostbiteCubJoyful" },
        { "Beg", "Winter2024FrostbiteCubBeg" },
        { "Jump", "Winter2024FrostbiteCubJump" },
        { "Trick 1", "Winter2024FrostbiteCubTrick1" },
        { "Trick 2", "Winter2024FrostbiteCubTrick2" }
    }
}
local v26 = {
    ["TailShell"] = {
        ["Color"] = Color3.fromRGB(81, 143, 191),
        ["Transparency"] = 0.65
    },
    ["Torso"] = {
        ["Color"] = Color3.fromRGB(157, 167, 165),
        ["Transparency"] = 0.65
    },
    ["Head"] = {
        ["Color"] = Color3.fromRGB(157, 167, 165),
        ["Transparency"] = 0.65
    },
    ["LeftFootShell2"] = {
        ["Color"] = Color3.fromRGB(81, 143, 191),
        ["Transparency"] = 0.65
    },
    ["HeadShell2"] = {
        ["Color"] = Color3.fromRGB(81, 143, 191),
        ["Transparency"] = 0.65
    },
    ["RightEarShellB2"] = {
        ["Color"] = Color3.fromRGB(81, 143, 191),
        ["Transparency"] = 0.65
    },
    ["TorsoShell2"] = {
        ["Color"] = Color3.fromRGB(81, 143, 191),
        ["Transparency"] = 0.65
    },
    ["RightFootShell2"] = {
        ["Color"] = Color3.fromRGB(81, 143, 191),
        ["Transparency"] = 0.65
    },
    ["LeftEarShellB2"] = {
        ["Color"] = Color3.fromRGB(81, 143, 191),
        ["Transparency"] = 0.65
    },
    ["RightArmShell2"] = {
        ["Color"] = Color3.fromRGB(81, 143, 191),
        ["Transparency"] = 0.65
    },
    ["LeftArmShell2"] = {
        ["Color"] = Color3.fromRGB(81, 143, 191),
        ["Transparency"] = 0.65
    },
    ["TailShell2"] = {
        ["Color"] = Color3.fromRGB(81, 143, 191),
        ["Transparency"] = 0.65
    },
    ["LeftEar"] = {
        ["Color"] = Color3.fromRGB(157, 167, 165),
        ["Transparency"] = 0.65
    },
    ["RightEar"] = {
        ["Color"] = Color3.fromRGB(81, 143, 191),
        ["Transparency"] = 0.65
    }
}
v25.neon_parts = v26
v25.eye_transparency = 0.02
v25.origin_entry = {
    ["origin"] = "Winter",
    ["origin_items"] = {},
    ["year"] = 2024
}
v25.generate_npc_furniture_on_runtime = true
v2.winter_2024_frostbite_cub = v25
return v1.pets(v2)