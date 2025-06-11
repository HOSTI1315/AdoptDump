--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2021.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Halloween Black Mummy Cat",
    ["image"] = "rbxassetid://7734902490",
    ["model"] = "BlackMummyCat",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["display_name"] = "Black Mummy Cat",
        ["origin"] = "Halloween",
        ["origin_items"] = { "halloween_2021_cat_box" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "MummyCatBeingHeldDouble",
        ["eating"] = "MummyCatEat",
        ["hold"] = "MummyCatBeingHeldSingle",
        ["idle"] = "MummyCatIdle",
        ["running"] = "MummyCatRun",
        ["sit"] = "MummyCatSit",
        ["sleep"] = "MummyCatSleep"
    },
    ["tricks"] = {
        { "Sit", "MummyCatSit" },
        { "Joyful", "MummyCatJoyful" },
        { "Beg", "MummyCatBeg" },
        { "Jump", "MummyCatJump" },
        { "Trick 1", "MummyCatTrick1" },
        { "Trick 2", "MummyCatTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(106, 188, 19),
        ["Nose"] = Color3.fromRGB(106, 188, 19),
        ["RightEar2"] = Color3.fromRGB(106, 188, 19),
        ["Tail"] = Color3.fromRGB(106, 188, 19)
    },
    ["hold_double_offset"] = CFrame.new(0, 0, 1) * CFrame.fromEulerAnglesXYZ(1.5707963267948966, 0, 0),
    ["is_left_eye_hidden"] = true
}
v2.halloween_2021_black_mummy_cat = v3
local v4 = {
    ["name"] = "Halloween Evil Dachshund",
    ["image"] = "rbxassetid://7734900613",
    ["model"] = "EvilDachshund",
    ["rarity"] = "rare",
    ["cost"] = 1000,
    ["currency_id"] = "candy_2021",
    ["origin_entry"] = {
        ["display_name"] = "Evil Dachshund",
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "EvilDachshundBeingHeldDouble",
        ["eating"] = "EvilDachshundEat",
        ["hold"] = "EvilDachshundBeingHeldSingle",
        ["idle"] = "EvilDachshundIdle",
        ["running"] = "EvilDachshundRun",
        ["sit"] = "EvilDachshundSit",
        ["sleep"] = "EvilDachshundSleep"
    },
    ["tricks"] = {
        { "Sit", "EvilDachshundSit" },
        { "Joyful", "EvilDachshundJoyful" },
        { "Beg", "EvilDachshundBeg" },
        { "Jump", "EvilDachshundJump" },
        { "Trick 1", "EvilDachshundTrick1" },
        { "Trick 2", "EvilDachshundTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(194, 133, 0),
        ["Horns"] = Color3.fromRGB(194, 133, 0),
        ["Nose"] = Color3.fromRGB(194, 133, 0),
        ["Teeth"] = Color3.fromRGB(194, 133, 0),
        ["ToyTail"] = Color3.fromRGB(194, 133, 0),
        ["Trident"] = Color3.fromRGB(194, 133, 0)
    },
    ["hold_double_offset"] = CFrame.new(0, 1, -1),
    ["hold_offset"] = CFrame.new(0, 1, -0.2)
}
v2.halloween_2021_evil_dachshund = v4
local v5 = {
    ["name"] = "Halloween White Ghost Dragon",
    ["image"] = "rbxassetid://7734925172",
    ["model"] = "GhostDragon",
    ["rarity"] = "legendary"
}
local v6 = {
    ["display_name"] = "Ghost Dragon",
    ["origin"] = "Halloween",
    ["origin_items"] = {},
    ["viewport_override"] = {
        ["distance"] = 5,
        ["offset"] = CFrame.new(0, 0, 0)
    },
    ["year"] = 2021
}
v5.origin_entry = v6
v5.anims = {
    ["double_hold"] = "GhostDragonBeingHeldDouble",
    ["eating"] = "GhostDragonEat",
    ["flying"] = "GhostDragonIdle",
    ["hold"] = "GhostDragonBeingHeldSingle",
    ["idle"] = "GhostDragonIdle",
    ["running"] = "GhostDragonRun",
    ["sit"] = "GhostDragonSit",
    ["sleep"] = "GhostDragonSleep"
}
v5.tricks = {
    { "Sit", "GhostDragonSit" },
    { "Joyful", "GhostDragonJoyful" },
    { "Beg", "GhostDragonBeg" },
    { "Jump", "GhostDragonJump" },
    { "Trick 1", "GhostDragonTrick1" },
    { "Trick 2", "GhostDragonTrick2" }
}
v5.neon_parts = {
    ["EarL"] = Color3.fromRGB(118, 111, 198),
    ["EarR"] = Color3.fromRGB(118, 111, 198),
    ["GCTorso2"] = Color3.fromRGB(163, 162, 165),
    ["GCTorso3"] = Color3.fromRGB(163, 162, 165),
    ["GCTorso4"] = Color3.fromRGB(163, 162, 165),
    ["GCTorso5"] = Color3.fromRGB(163, 162, 165),
    ["GCTorso6"] = Color3.fromRGB(163, 162, 165),
    ["Head"] = Color3.fromRGB(120, 127, 141),
    ["LWhiskers"] = Color3.fromRGB(93, 51, 198),
    ["LWing"] = Color3.fromRGB(118, 111, 198),
    ["LWingTip"] = Color3.fromRGB(93, 51, 198),
    ["NoseL"] = Color3.fromRGB(118, 111, 198),
    ["NoseR"] = Color3.fromRGB(118, 111, 198),
    ["RWhiskers"] = Color3.fromRGB(93, 51, 198),
    ["RWing"] = Color3.fromRGB(118, 111, 198),
    ["RWingTip"] = Color3.fromRGB(93, 51, 198),
    ["Torso"] = Color3.fromRGB(120, 127, 141)
}
v5.already_has_flying_wings = true
v5.minimum_fly_anim_speed = 1
v2.halloween_2021_ghost_dragon = v5
local v7 = {
    ["name"] = "Halloween Golden Mummy Cat",
    ["image"] = "rbxassetid://7734928470",
    ["model"] = "GoldenMummyCat",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["display_name"] = "Golden Mummy Cat",
        ["origin"] = "Halloween",
        ["origin_items"] = { "halloween_2021_cat_box" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "MummyCatBeingHeldDouble",
        ["eating"] = "MummyCatEat",
        ["hold"] = "MummyCatBeingHeldSingle",
        ["idle"] = "MummyCatIdle",
        ["running"] = "MummyCatRun",
        ["sit"] = "MummyCatSit",
        ["sleep"] = "MummyCatSleep"
    },
    ["tricks"] = {
        { "Sit", "MummyCatSit" },
        { "Joyful", "MummyCatJoyful" },
        { "Beg", "MummyCatBeg" },
        { "Jump", "MummyCatJump" },
        { "Trick 1", "MummyCatTrick1" },
        { "Trick 2", "MummyCatTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(106, 188, 19),
        ["Nose"] = Color3.fromRGB(106, 188, 19),
        ["RightEar2"] = Color3.fromRGB(106, 188, 19),
        ["Tail"] = Color3.fromRGB(106, 188, 19)
    },
    ["hold_double_offset"] = CFrame.new(0, 0, 1) * CFrame.fromEulerAnglesXYZ(1.5707963267948966, 0, 0),
    ["is_left_eye_hidden"] = true
}
v2.halloween_2021_golden_mummy_cat = v7
local v8 = {
    ["name"] = "Halloween Blue Scorpion",
    ["image"] = "rbxassetid://7734928397",
    ["model"] = "Scorpion",
    ["rarity"] = "uncommon",
    ["cost"] = 300,
    ["currency_id"] = "candy_2021",
    ["origin_entry"] = {
        ["display_name"] = "Scorpion",
        ["origin"] = "Halloween",
        ["origin_items"] = {},
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "ScorpionBeingHeldDouble",
        ["eating"] = "ScorpionEat",
        ["hold"] = "ScorpionBeingHeldSingle",
        ["idle"] = "ScorpionIdle",
        ["running"] = "ScorpionRun",
        ["sit"] = "ScorpionSit",
        ["sleep"] = "ScorpionSleep"
    },
    ["tricks"] = {
        { "Sit", "ScorpionSit" },
        { "Joyful", "ScorpionJoyful" },
        { "Beg", "ScorpionBeg" },
        { "Jump", "ScorpionJump" },
        { "Trick 1", "ScorpionTrick1" },
        { "Trick 2", "ScorpionTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(176, 145, 34)
    },
    ["hold_double_offset"] = CFrame.new(0, 0.7, -1),
    ["hold_offset"] = CFrame.new(0, 0.5, -0.2)
}
v2.halloween_2021_scorpion = v8
local v9 = {
    ["name"] = "Halloween White Skeleton Dog",
    ["image"] = "rbxassetid://7734900468",
    ["model"] = "SkeleDog",
    ["rarity"] = "ultra_rare",
    ["cost"] = 1200,
    ["currency_id"] = "candy_2021"
}
local v10 = {
    ["display_name"] = "Skeleton Dog",
    ["origin"] = "Halloween",
    ["origin_items"] = {},
    ["viewport_override"] = {
        ["distance"] = 4,
        ["offset"] = CFrame.new(0, 0, 0)
    },
    ["year"] = 2021
}
v9.origin_entry = v10
v9.anims = {
    ["double_hold"] = "SkeleDogBeingHeldDouble",
    ["eating"] = "SkeleDogEat",
    ["hold"] = "SkeleDogBeingHeldSingle",
    ["idle"] = "SkeleDogIdle",
    ["running"] = "SkeleDogRun",
    ["sit"] = "SkeleDogSit",
    ["sleep"] = "SkeleDogSleep"
}
v9.tricks = {
    { "Sit", "SkeleDogSit" },
    { "Joyful", "SkeleDogJoyful" },
    { "Beg", "SkeleDogBeg" },
    { "Jump", "SkeleDogJump" },
    { "Trick 1", "SkeleDogTrick1" },
    { "Trick 2", "SkeleDogTrick2" }
}
v9.neon_parts = {
    ["BackLeftFoot"] = Color3.fromRGB(209, 255, 140),
    ["BackRightFoot"] = Color3.fromRGB(209, 255, 140),
    ["EarL"] = Color3.fromRGB(209, 255, 140),
    ["EarL2"] = Color3.fromRGB(209, 255, 140),
    ["EarR"] = Color3.fromRGB(209, 255, 140),
    ["EarR2"] = Color3.fromRGB(209, 255, 140),
    ["Eyes"] = Color3.fromRGB(70, 255, 3),
    ["FrontLeftFoot"] = Color3.fromRGB(209, 255, 140),
    ["FrontRightFoot"] = Color3.fromRGB(209, 255, 140),
    ["Head"] = Color3.fromRGB(209, 255, 140),
    ["Jaw"] = Color3.fromRGB(209, 255, 140),
    ["Tail"] = Color3.fromRGB(209, 255, 140),
    ["Tail2"] = Color3.fromRGB(209, 255, 140),
    ["Tail3"] = Color3.fromRGB(209, 255, 140),
    ["Torso"] = Color3.fromRGB(209, 255, 140),
    ["Torso2"] = Color3.fromRGB(209, 255, 140),
    ["Torso3"] = Color3.fromRGB(209, 255, 140),
    ["Torso4"] = Color3.fromRGB(209, 255, 140)
}
v9.hold_double_offset = CFrame.new(0, 0, -1)
v2.halloween_2021_skele_dog = v9
local v11 = {
    ["name"] = "Halloween White Mummy Cat",
    ["image"] = "rbxassetid://7734902431",
    ["model"] = "WhiteMummyCat",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["display_name"] = "White Mummy Cat",
        ["origin"] = "Halloween",
        ["origin_items"] = { "halloween_2021_cat_box" },
        ["year"] = 2021
    },
    ["anims"] = {
        ["double_hold"] = "MummyCatBeingHeldDouble",
        ["eating"] = "MummyCatEat",
        ["hold"] = "MummyCatBeingHeldSingle",
        ["idle"] = "MummyCatIdle",
        ["running"] = "MummyCatRun",
        ["sit"] = "MummyCatSit",
        ["sleep"] = "MummyCatSleep"
    },
    ["tricks"] = {
        { "Sit", "MummyCatSit" },
        { "Joyful", "MummyCatJoyful" },
        { "Beg", "MummyCatBeg" },
        { "Jump", "MummyCatJump" },
        { "Trick 1", "MummyCatTrick1" },
        { "Trick 2", "MummyCatTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(106, 188, 19),
        ["Nose"] = Color3.fromRGB(106, 188, 19),
        ["RightEar2"] = Color3.fromRGB(106, 188, 19),
        ["Tail"] = Color3.fromRGB(106, 188, 19)
    },
    ["hold_double_offset"] = CFrame.new(0, 0, 1) * CFrame.fromEulerAnglesXYZ(1.5707963267948966, 0, 0),
    ["is_left_eye_hidden"] = true
}
v2.halloween_2021_white_mummy_cat = v11
return v1(v2)