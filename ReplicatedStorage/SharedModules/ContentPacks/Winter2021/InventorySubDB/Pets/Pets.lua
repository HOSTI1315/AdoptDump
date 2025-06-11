--// ReplicatedStorage.SharedModules.ContentPacks.Winter2021.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Golden Walrus",
    ["image"] = "rbxassetid://8143039289",
    ["model"] = "GoldenWalrus",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "winter_2021_walrus_box" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "WalrusBeingHeldDouble",
        ["eating"] = "WalrusEat",
        ["hold"] = "WalrusBeingHeldSingle",
        ["idle"] = "WalrusIdle",
        ["running"] = "WalrusRun",
        ["sit"] = "WalrusSit",
        ["sleep"] = "WalrusSleep"
    },
    ["tricks"] = {
        { "Sit", "WalrusSit" },
        { "Joyful", "WalrusJoyful" },
        { "Beg", "WalrusBeg" },
        { "Jump", "WalrusJump" },
        { "Trick 1", "WalrusTrick1" },
        { "Trick 2", "WalrusTrick2" }
    },
    ["neon_parts"] = {
        ["Nose"] = Color3.fromRGB(58, 102, 149),
        ["Spots"] = Color3.fromRGB(58, 102, 149),
        ["Teeth"] = Color3.fromRGB(58, 102, 149),
        ["Whiskers"] = Color3.fromRGB(58, 102, 149)
    }
}
v2.winter_2021_golden_walrus = v3
local v4 = {
    ["name"] = "Husky",
    ["image"] = "rbxassetid://8077189379",
    ["model"] = "Husky",
    ["rarity"] = "rare",
    ["cost"] = 40000,
    ["currency_id"] = "gingerbread_2021",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "HuskyBeingHeldDouble",
        ["eating"] = "HuskyEat",
        ["hold"] = "HuskyBeingHeldSingle",
        ["idle"] = "HuskyIdle",
        ["running"] = "HuskyRun",
        ["sit"] = "HuskySit",
        ["sleep"] = "HuskySleep"
    },
    ["tricks"] = {
        { "Sit", "HuskySit" },
        { "Joyful", "HuskyJoyful" },
        { "Beg", "HuskyBeg" },
        { "Jump", "HuskyJump" },
        { "Trick 1", "HuskyTrick1" },
        { "Trick 2", "HuskyTrick2" }
    },
    ["neon_parts"] = {
        ["FrontLeftFoot"] = Color3.fromRGB(101, 142, 186),
        ["FrontRightFoot"] = Color3.fromRGB(101, 142, 186),
        ["Head2"] = Color3.fromRGB(101, 142, 186),
        ["LeftEar2"] = Color3.fromRGB(101, 142, 186),
        ["LeftFoot"] = Color3.fromRGB(101, 142, 186),
        ["RightEar2"] = Color3.fromRGB(101, 142, 186),
        ["RightFoot"] = Color3.fromRGB(101, 142, 186),
        ["Tail2"] = Color3.fromRGB(101, 142, 186),
        ["Torso2"] = Color3.fromRGB(101, 142, 186)
    }
}
v2.winter_2021_husky = v4
local v5 = {
    ["name"] = "Ice Golem",
    ["image"] = "rbxassetid://8070897995",
    ["model"] = "IceGolem",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "IceGolemBeingHeldDouble",
        ["eating"] = "IceGolemEat",
        ["flying"] = "IceGolemRun",
        ["hold"] = "IceGolemBeingHeldSingle",
        ["idle"] = "IceGolemIdle",
        ["running"] = "IceGolemRun",
        ["sit"] = "IceGolemSit",
        ["sleep"] = "IceGolemSleep"
    },
    ["minigame_anims"] = {
        ["summon"] = "IceGolemSummon"
    },
    ["tricks"] = {
        { "Sit", "IceGolemSit" },
        { "Joyful", "IceGolemJoyful" },
        { "Beg", "IceGolemBeg" },
        { "Jump", "IceGolemJump" },
        { "Trick 1", "IceGolemTrick1" },
        { "Trick 2", "IceGolemTrick2" }
    }
}
local v6 = {
    ["Core"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["Core2"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["FloatingCrystal1"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["FloatingCrystal10"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["FloatingCrystal11"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["FloatingCrystal12"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["FloatingCrystal2"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["FloatingCrystal3"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["FloatingCrystal4"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["FloatingCrystal5"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["FloatingCrystal6"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["FloatingCrystal7"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["FloatingCrystal8"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["FloatingCrystal9"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["Head2"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["Head3"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["LeftArm"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["LeftArm2"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["LeftArm3"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["LeftArm4"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["LeftEye"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["LeftEye2"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["RightArm"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["RightArm2"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["RightArm3"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["RightArm4"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["RightEye"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    },
    ["RightEye2"] = {
        ["Color"] = Color3.fromRGB(213, 115, 61),
        ["Reflectance"] = 0.75,
        ["Transparency"] = 0.45
    }
}
v5.neon_parts = v6
v5.already_has_flying_wings = true
v5.eyes = {
    "LeftEye",
    "LeftEye2",
    "RightEye",
    "RightEye2"
}
v5.flying_move_anim_speed = 0.2
v5.minimum_fly_anim_speed = 0.2
v2.winter_2021_ice_golem = v5
local v7 = {
    ["name"] = "Puffin",
    ["image"] = "rbxassetid://8077189117",
    ["model"] = "Puffin",
    ["rarity"] = "ultra_rare",
    ["cost"] = 120000,
    ["currency_id"] = "gingerbread_2021",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "PuffinBeingHeldDouble",
        ["eating"] = "PuffinEat",
        ["flying"] = "PuffinRun",
        ["hold"] = "PuffinBeingHeldSingle",
        ["idle"] = "PuffinIdle",
        ["running"] = "PuffinRun",
        ["sit"] = "PuffinSit",
        ["sleep"] = "PuffinSleep"
    },
    ["tricks"] = {
        { "Sit", "PuffinSit" },
        { "Joyful", "PuffinJoyful" },
        { "Beg", "PuffinBeg" },
        { "Jump", "PuffinJump" },
        { "Trick 1", "PuffinTrick1" },
        { "Trick 2", "PuffinTrick2" }
    },
    ["neon_parts"] = {
        ["Head_Black"] = Color3.fromRGB(14, 191, 168),
        ["Head_Grey"] = Color3.fromRGB(14, 191, 168),
        ["Tail"] = Color3.fromRGB(14, 191, 168),
        ["Torso"] = Color3.fromRGB(14, 191, 168),
        ["WingL2"] = Color3.fromRGB(14, 191, 168),
        ["WingR2"] = Color3.fromRGB(14, 191, 168)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_fly_anim_speed"] = 1,
    ["mounted_fly_forward_tilt_compensation"] = -20
}
v2.winter_2021_puffin = v7
local v8 = {
    ["name"] = "Snow Leopard",
    ["image"] = "rbxassetid://8070926551",
    ["model"] = "SnowLeopard",
    ["rarity"] = "uncommon",
    ["cost"] = 10000,
    ["currency_id"] = "gingerbread_2021",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "SnowLeopardBeingHeldDouble",
        ["eating"] = "SnowLeopardEat",
        ["hold"] = "SnowLeopardBeingHeldSingle",
        ["idle"] = "SnowLeopardIdle",
        ["running"] = "SnowLeopardRun",
        ["sit"] = "SnowLeopardSit",
        ["sleep"] = "SnowLeopardSleep"
    },
    ["tricks"] = {
        { "Sit", "SnowLeopardSit" },
        { "Joyful", "SnowLeopardJoyful" },
        { "Beg", "SnowLeopardBeg" },
        { "Jump", "SnowLeopardJump" },
        { "Trick 1", "SnowLeopardTrick1" },
        { "Trick 2", "SnowLeopardTrick2" }
    },
    ["neon_parts"] = {
        ["FrontLeftFoot"] = Color3.fromRGB(188, 123, 57),
        ["FrontRightFoot"] = Color3.fromRGB(188, 123, 57),
        ["Head2"] = Color3.fromRGB(188, 123, 57),
        ["Head3"] = Color3.fromRGB(188, 123, 57),
        ["Head6"] = Color3.fromRGB(188, 123, 57),
        ["LeftEar2"] = Color3.fromRGB(188, 123, 57),
        ["LeftFoot"] = Color3.fromRGB(188, 123, 57),
        ["RightEar2"] = Color3.fromRGB(188, 123, 57),
        ["RightFoot"] = Color3.fromRGB(188, 123, 57),
        ["Tail2"] = Color3.fromRGB(188, 123, 57),
        ["Tail3"] = Color3.fromRGB(188, 123, 57),
        ["Torso2"] = Color3.fromRGB(188, 123, 57),
        ["Torso3"] = Color3.fromRGB(188, 123, 57),
        ["Torso4"] = Color3.fromRGB(188, 123, 57)
    }
}
v2.winter_2021_snow_leopard = v8
local v9 = {
    ["name"] = "St Bernard",
    ["image"] = "rbxassetid://8071236757",
    ["model"] = "StBernard",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = {},
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "StBernardBeingHeldDouble",
        ["eating"] = "StBernardEat",
        ["hold"] = "StBernardBeingHeldSingle",
        ["idle"] = "StBernardIdle",
        ["running"] = "StBernardRun",
        ["sit"] = "StBernardSit",
        ["sleep"] = "StBernardSleep"
    },
    ["tricks"] = {
        { "Sit", "StBernardSit" },
        { "Joyful", "StBernardJoyful" },
        { "Beg", "StBernardBeg" },
        { "Jump", "StBernardJump" },
        { "Trick 1", "StBernardTrick1" },
        { "Trick 2", "StBernardTrick2" }
    },
    ["neon_parts"] = {
        ["FrontLeftFoot"] = Color3.fromRGB(185, 156, 120),
        ["FrontRightFoot"] = Color3.fromRGB(185, 156, 120),
        ["Head2"] = Color3.fromRGB(185, 156, 120),
        ["Head5"] = Color3.fromRGB(185, 156, 120),
        ["LeftFoot"] = Color3.fromRGB(185, 156, 120),
        ["RightFoot"] = Color3.fromRGB(185, 156, 120),
        ["Tail2"] = Color3.fromRGB(185, 156, 120),
        ["Torso"] = Color3.fromRGB(185, 156, 120)
    }
}
v2.winter_2021_st_bernard = v9
local v10 = {
    ["name"] = "Summer Walrus",
    ["image"] = "rbxassetid://8143039445",
    ["model"] = "SummerWalrus",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "winter_2021_walrus_box" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "WalrusBeingHeldDouble",
        ["eating"] = "WalrusEat",
        ["hold"] = "WalrusBeingHeldSingle",
        ["idle"] = "WalrusIdle",
        ["running"] = "WalrusRun",
        ["sit"] = "WalrusSit",
        ["sleep"] = "WalrusSleep"
    },
    ["tricks"] = {
        { "Sit", "WalrusSit" },
        { "Joyful", "WalrusJoyful" },
        { "Beg", "WalrusBeg" },
        { "Jump", "WalrusJump" },
        { "Trick 1", "WalrusTrick1" },
        { "Trick 2", "WalrusTrick2" }
    },
    ["neon_parts"] = {
        ["Nose"] = Color3.fromRGB(58, 102, 149),
        ["Spots"] = Color3.fromRGB(58, 102, 149),
        ["Teeth"] = Color3.fromRGB(58, 102, 149),
        ["Whiskers"] = Color3.fromRGB(58, 102, 149)
    }
}
v2.winter_2021_summer_walrus = v10
local v11 = {
    ["name"] = "Walrus",
    ["image"] = "rbxassetid://8077196440",
    ["model"] = "Walrus",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Winter",
        ["origin_items"] = { "winter_2021_walrus_box" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "WalrusBeingHeldDouble",
        ["eating"] = "WalrusEat",
        ["hold"] = "WalrusBeingHeldSingle",
        ["idle"] = "WalrusIdle",
        ["running"] = "WalrusRun",
        ["sit"] = "WalrusSit",
        ["sleep"] = "WalrusSleep"
    },
    ["tricks"] = {
        { "Sit", "WalrusSit" },
        { "Joyful", "WalrusJoyful" },
        { "Beg", "WalrusBeg" },
        { "Jump", "WalrusJump" },
        { "Trick 1", "WalrusTrick1" },
        { "Trick 2", "WalrusTrick2" }
    },
    ["neon_parts"] = {
        ["Nose"] = Color3.fromRGB(58, 102, 149),
        ["Spots"] = Color3.fromRGB(58, 102, 149),
        ["Teeth"] = Color3.fromRGB(58, 102, 149),
        ["Whiskers"] = Color3.fromRGB(58, 102, 149)
    }
}
v2.winter_2021_walrus = v11
return v1(v2)