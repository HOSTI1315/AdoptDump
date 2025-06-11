--// ReplicatedStorage.SharedModules.ContentPacks.Lures2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Ash Zebra",
    ["image"] = "rbxassetid://14471275373",
    ["model"] = "Lures2023AshZebra",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Lures",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Lures2023AshZebraBeingHeldDouble",
        ["eating"] = "Lures2023AshZebraEat",
        ["flying"] = "Lures2023AshZebraRun",
        ["hold"] = "Lures2023AshZebraBeingHeldSingle",
        ["idle"] = "Lures2023AshZebraIdle",
        ["running"] = "Lures2023AshZebraRun",
        ["sit"] = "Lures2023AshZebraSit",
        ["sleep"] = "Lures2023AshZebraSleep"
    },
    ["tricks"] = {
        { "Sit", "Lures2023AshZebraSit" },
        { "Joyful", "Lures2023AshZebraJoyful" },
        { "Beg", "Lures2023AshZebraBeg" },
        { "Jump", "Lures2023AshZebraJump" },
        { "Trick 1", "Lures2023AshZebraTrick1" },
        { "Trick 2", "Lures2023AshZebraTrick2" }
    },
    ["neon_parts"] = {
        ["Tail3"] = Color3.fromRGB(182, 63, 47),
        ["Tail4"] = Color3.fromRGB(190, 77, 33),
        ["Tail5"] = Color3.fromRGB(203, 94, 17),
        ["Tail6"] = Color3.fromRGB(218, 112, 5),
        ["Tail7"] = Color3.fromRGB(202, 105, 14),
        ["Tail8"] = Color3.fromRGB(218, 112, 5)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_run_anim_speed"] = 1.2
}
v2.lures_2023_ash_zebra = v3
local v4 = {
    ["name"] = "Blazing Lion",
    ["image"] = "rbxassetid://14689005829",
    ["model"] = "Lures2023BlazingLion",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Lures",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Lures2023BlazingLionBeingHeldDouble",
        ["eating"] = "Lures2023BlazingLionEat",
        ["flying"] = "Lures2023BlazingLionRun",
        ["hold"] = "Lures2023BlazingLionBeingHeldSingle",
        ["idle"] = "Lures2023BlazingLionIdle",
        ["running"] = "Lures2023BlazingLionRun",
        ["sit"] = "Lures2023BlazingLionSit",
        ["sleep"] = "Lures2023BlazingLionSleep"
    },
    ["tricks"] = {
        { "Sit", "Lures2023BlazingLionSit" },
        { "Joyful", "Lures2023BlazingLionJoyful" },
        { "Beg", "Lures2023BlazingLionBeg" },
        { "Jump", "Lures2023BlazingLionJump" },
        { "Trick 1", "Lures2023BlazingLionTrick1" },
        { "Trick 2", "Lures2023BlazingLionTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(55, 21, 70),
        ["BackLeftFoot2"] = Color3.fromRGB(255, 255, 255),
        ["BackRightFoot"] = Color3.fromRGB(55, 21, 70),
        ["BackRightFoot2"] = Color3.fromRGB(255, 255, 255),
        ["Eyes"] = Color3.fromRGB(175, 111, 188),
        ["FrontLeftFoot"] = Color3.fromRGB(55, 21, 70),
        ["FrontLeftFoot2"] = Color3.fromRGB(255, 255, 255),
        ["FrontRightFoot"] = Color3.fromRGB(255, 255, 255),
        ["FrontRightFoot2"] = Color3.fromRGB(55, 21, 70),
        ["Head"] = Color3.fromRGB(97, 28, 116),
        ["LeftEar"] = Color3.fromRGB(38, 32, 39),
        ["LeftEar2"] = Color3.fromRGB(167, 133, 189),
        ["MainFront"] = Color3.fromRGB(97, 28, 116),
        ["ManeBot"] = Color3.fromRGB(55, 21, 70),
        ["ManeBot2"] = Color3.fromRGB(255, 255, 255),
        ["ManeInnerShell"] = Color3.fromRGB(55, 21, 70),
        ["ManeLeft"] = Color3.fromRGB(167, 133, 189),
        ["ManeMain"] = Color3.fromRGB(97, 28, 116),
        ["ManeMid"] = Color3.fromRGB(55, 21, 70),
        ["ManeMid2"] = Color3.fromRGB(255, 255, 255),
        ["ManeOuterShell"] = Color3.fromRGB(255, 255, 255),
        ["ManeRight"] = Color3.fromRGB(167, 133, 189),
        ["ManeTop"] = Color3.fromRGB(175, 111, 188),
        ["ManeTop2"] = Color3.fromRGB(38, 32, 39),
        ["ManeTop3"] = Color3.fromRGB(38, 32, 39),
        ["Nose"] = Color3.fromRGB(167, 133, 189),
        ["RightEar"] = Color3.fromRGB(38, 32, 39),
        ["RightEar2"] = Color3.fromRGB(167, 133, 189),
        ["Tail"] = Color3.fromRGB(97, 28, 116),
        ["Tail2"] = Color3.fromRGB(97, 28, 116),
        ["Tail3"] = Color3.fromRGB(97, 28, 116),
        ["Tail4"] = Color3.fromRGB(97, 28, 116),
        ["Torso"] = Color3.fromRGB(97, 28, 116)
    },
    ["mega_neon_colors"] = {
        Color3.fromRGB(255, 74, 92),
        Color3.fromRGB(255, 96, 93),
        Color3.fromRGB(166, 177, 18),
        Color3.fromRGB(115, 201, 58),
        Color3.fromRGB(51, 179, 58),
        Color3.fromRGB(58, 185, 115),
        Color3.fromRGB(59, 36, 185),
        Color3.fromRGB(137, 88, 211),
        Color3.fromRGB(209, 78, 155),
        Color3.fromRGB(255, 101, 101)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_run_anim_speed"] = 1.2
}
v2.lures_2023_blazing_lion = v4
local v5 = {
    ["name"] = "Flaming Zebra",
    ["image"] = "rbxassetid://14360919129",
    ["model"] = "Lures2023FlamingZebra",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Lures",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Lures2023FlamingZebraBeingHeldDouble",
        ["eating"] = "Lures2023FlamingZebraEat",
        ["flying"] = "Lures2023FlamingZebraRun",
        ["hold"] = "Lures2023FlamingZebraBeingHeldSingle",
        ["idle"] = "Lures2023FlamingZebraIdle",
        ["running"] = "Lures2023FlamingZebraRun",
        ["sit"] = "Lures2023FlamingZebraSit",
        ["sleep"] = "Lures2023FlamingZebraSleep"
    },
    ["tricks"] = {
        { "Sit", "Lures2023FlamingZebraSit" },
        { "Joyful", "Lures2023FlamingZebraJoyful" },
        { "Beg", "Lures2023FlamingZebraBeg" },
        { "Jump", "Lures2023FlamingZebraJump" },
        { "Trick 1", "Lures2023FlamingZebraTrick1" },
        { "Trick 2", "Lures2023FlamingZebraTrick2" }
    },
    ["neon_parts"] = {
        ["Hair"] = Color3.fromRGB(196, 40, 28),
        ["Hair2"] = Color3.fromRGB(212, 162, 255),
        ["Head2"] = Color3.fromRGB(204, 93, 90),
        ["LeftBackFoot2"] = Color3.fromRGB(204, 93, 90),
        ["LeftEar2"] = Color3.fromRGB(204, 80, 64),
        ["LeftFrontFoot2"] = Color3.fromRGB(204, 93, 90),
        ["RightBackFoot2"] = Color3.fromRGB(204, 93, 90),
        ["RightEar2"] = Color3.fromRGB(204, 80, 64),
        ["RightFrontFoot2"] = Color3.fromRGB(204, 93, 90),
        ["Tail"] = Color3.fromRGB(204, 93, 90),
        ["Tail3"] = Color3.fromRGB(129, 10, 6),
        ["Tail4"] = Color3.fromRGB(199, 86, 52),
        ["Tail5"] = Color3.fromRGB(255, 72, 55),
        ["Tail6"] = Color3.fromRGB(196, 40, 28),
        ["Tail7"] = Color3.fromRGB(212, 162, 255),
        ["Torso2"] = Color3.fromRGB(204, 93, 90)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_run_anim_speed"] = 1.2
}
v2.lures_2023_flaming_zebra = v5
local v6 = {
    ["name"] = "Magma Moose",
    ["image"] = "rbxassetid://14360917588",
    ["model"] = "Lures2023MagmaMoose",
    ["rarity"] = "ultra_rare"
}
local v7 = {
    ["origin"] = "Lures",
    ["origin_items"] = {},
    ["viewport_override"] = {
        ["distance"] = 5,
        ["offset"] = CFrame.new(0, 0, 0)
    },
    ["year"] = 2023
}
v6.origin_entry = v7
v6.anims = {
    ["double_hold"] = "Lures2023MagmaMooseBeingHeldDouble",
    ["eating"] = "Lures2023MagmaMooseEat",
    ["flying"] = "Lures2023MagmaMooseRun",
    ["hold"] = "Lures2023MagmaMooseBeingHeldSingle",
    ["idle"] = "Lures2023MagmaMooseIdle",
    ["running"] = "Lures2023MagmaMooseRun",
    ["sit"] = "Lures2023MagmaMooseSit",
    ["sleep"] = "Lures2023MagmaMooseSleep"
}
v6.tricks = {
    { "Sit", "Lures2023MagmaMooseSit" },
    { "Joyful", "Lures2023MagmaMooseJoyful" },
    { "Beg", "Lures2023MagmaMooseBeg" },
    { "Jump", "Lures2023MagmaMooseJump" },
    { "Trick 1", "Lures2023MagmaMooseTrick1" },
    { "Trick 2", "Lures2023MagmaMooseTrick2" }
}
v6.neon_parts = {
    ["Antlers2"] = Color3.fromRGB(93, 84, 255),
    ["Antlers3"] = Color3.fromRGB(93, 84, 255),
    ["BackLeftFoot2"] = Color3.fromRGB(93, 84, 255),
    ["BackRightFoot2"] = Color3.fromRGB(93, 84, 255),
    ["Drool"] = Color3.fromRGB(93, 84, 255),
    ["Eyes"] = Color3.fromRGB(93, 84, 255),
    ["FrontLeftFoot2"] = Color3.fromRGB(93, 84, 255),
    ["FrontRightFoot2"] = Color3.fromRGB(93, 84, 255),
    ["LeftEar2"] = Color3.fromRGB(93, 84, 255),
    ["Nose"] = Color3.fromRGB(93, 84, 255),
    ["RightEar2"] = Color3.fromRGB(93, 84, 255),
    ["Torso2"] = Color3.fromRGB(93, 84, 255)
}
v6.eyes = { "Eyes" }
v6.minimum_run_anim_speed = 1.2
v2.lures_2023_magma_moose = v6
local v8 = {
    ["name"] = "Magma Snail",
    ["image"] = "rbxassetid://14457148635",
    ["model"] = "Lures2023MagmaSnail",
    ["rarity"] = "ultra_rare"
}
local v9 = {
    ["origin"] = "Lures",
    ["origin_items"] = {},
    ["viewport_override"] = {
        ["distance"] = 6,
        ["offset"] = CFrame.new(0, 0, 0)
    },
    ["year"] = 2023
}
v8.origin_entry = v9
v8.anims = {
    ["double_hold"] = "Lures2023MagmaSnailBeingHeldDouble",
    ["eating"] = "Lures2023MagmaSnailEat",
    ["flying"] = "Lures2023MagmaSnailRun",
    ["hold"] = "Lures2023MagmaSnailBeingHeldSingle",
    ["idle"] = "Lures2023MagmaSnailIdle",
    ["running"] = "Lures2023MagmaSnailRun",
    ["sit"] = "Lures2023MagmaSnailSit",
    ["sleep"] = "Lures2023MagmaSnailSleep"
}
v8.tricks = {
    { "Sit", "Lures2023MagmaSnailSit" },
    { "Joyful", "Lures2023MagmaSnailJoyful" },
    { "Beg", "Lures2023MagmaSnailBeg" },
    { "Jump", "Lures2023MagmaSnailJump" },
    { "Trick 1", "Lures2023MagmaSnailTrick1" },
    { "Trick 2", "Lures2023MagmaSnailTrick2" }
}
v8.neon_parts = {
    ["Drip"] = Color3.fromRGB(0, 167, 197),
    ["Eyes"] = Color3.fromRGB(0, 167, 197),
    ["HeadLeft"] = Color3.fromRGB(0, 167, 197),
    ["HeadLeft2"] = Color3.fromRGB(0, 167, 197),
    ["HeadLeft3"] = Color3.fromRGB(0, 167, 197),
    ["HeadRight"] = Color3.fromRGB(0, 167, 197),
    ["HeadRight2"] = Color3.fromRGB(0, 167, 197),
    ["HeadRight3"] = Color3.fromRGB(0, 167, 197),
    ["Lava2"] = Color3.fromRGB(0, 167, 197),
    ["Part"] = Color3.fromRGB(0, 167, 197),
    ["Pupil"] = Color3.fromRGB(0, 167, 197),
    ["Tail2"] = Color3.fromRGB(59, 179, 223),
    ["Tail3"] = Color3.fromRGB(59, 179, 223),
    ["Tail4"] = Color3.fromRGB(0, 167, 197),
    ["Torso"] = Color3.fromRGB(59, 179, 223),
    ["Torso2g"] = Color3.fromRGB(59, 179, 223),
    ["Torso2h"] = Color3.fromRGB(59, 179, 223)
}
v8.eyes = { "Eyes", "Pupil" }
v2.lures_2023_magma_snail = v8
local v10 = {
    ["name"] = "Toasty Red Panda",
    ["image"] = "rbxassetid://14360919997",
    ["model"] = "Lures2023ToastyRedPanda",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Lures",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Lures2023ToastyRedPandaBeingHeldDouble",
        ["eating"] = "Lures2023ToastyRedPandaEat",
        ["flying"] = "Lures2023ToastyRedPandaRun",
        ["hold"] = "Lures2023ToastyRedPandaBeingHeldSingle",
        ["idle"] = "Lures2023ToastyRedPandaIdle",
        ["running"] = "Lures2023ToastyRedPandaRun",
        ["sit"] = "Lures2023ToastyRedPandaSit",
        ["sleep"] = "Lures2023ToastyRedPandaSleep"
    },
    ["tricks"] = {
        { "Sit", "Lures2023ToastyRedPandaSit" },
        { "Joyful", "Lures2023ToastyRedPandaJoyful" },
        { "Beg", "Lures2023ToastyRedPandaBeg" },
        { "Jump", "Lures2023ToastyRedPandaJump" },
        { "Trick 1", "Lures2023ToastyRedPandaTrick1" },
        { "Trick 2", "Lures2023ToastyRedPandaTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot2"] = Color3.fromRGB(184, 108, 31),
        ["BackRightFoot2"] = Color3.fromRGB(184, 108, 31),
        ["FrontLeftFoot2"] = Color3.fromRGB(184, 108, 31),
        ["FrontRightFoot2"] = Color3.fromRGB(184, 108, 31),
        ["LeftCheek"] = Color3.fromRGB(212, 66, 161),
        ["LeftCheek3"] = Color3.fromRGB(207, 141, 225),
        ["LeftCheek4"] = Color3.fromRGB(111, 75, 189),
        ["LeftEar"] = Color3.fromRGB(212, 66, 161),
        ["LeftEar3"] = Color3.fromRGB(207, 141, 225),
        ["LeftEar4"] = Color3.fromRGB(212, 66, 161),
        ["RightCheek"] = Color3.fromRGB(212, 66, 161),
        ["RightCheek3"] = Color3.fromRGB(207, 141, 225),
        ["RightCheek4"] = Color3.fromRGB(111, 75, 189),
        ["RightEar"] = Color3.fromRGB(212, 66, 161),
        ["RightEar3"] = Color3.fromRGB(207, 141, 225),
        ["RightEar4"] = Color3.fromRGB(111, 75, 189),
        ["Tail"] = Color3.fromRGB(184, 109, 17),
        ["Torso2"] = Color3.fromRGB(184, 88, 19),
        ["Torso3"] = Color3.fromRGB(184, 108, 31)
    },
    ["eyes"] = { "Eyes" }
}
v2.lures_2023_toasty_red_panda = v10
return v1(v2)