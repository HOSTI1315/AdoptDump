--// ReplicatedStorage.SharedModules.ContentPacks.BasicEgg2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Alicorn",
    ["image"] = "rbxassetid://17255958862",
    ["model"] = "BasicEgg2022Alicorn",
    ["rarity"] = "legendary"
}
local v4 = {
    ["origin"] = "Basic Egg Update",
    ["origin_items"] = { "pet_egg" },
    ["viewport_override"] = {
        ["distance"] = 4,
        ["offset"] = CFrame.new(0, 0, 0)
    },
    ["year"] = 2022
}
v3.origin_entry = v4
v3.anims = {
    ["double_hold"] = "AlicornBeingHeldDouble",
    ["eating"] = "AlicornEat",
    ["hold"] = "AlicornBeingHeldSingle",
    ["idle"] = "AlicornIdle",
    ["running"] = "AlicornRun",
    ["sit"] = "AlicornSit",
    ["sleep"] = "AlicornSleep"
}
v3.tricks = {
    { "Sit", "AlicornSit" },
    { "Joyful", "AlicornJoyful" },
    { "Beg", "AlicornBeg" },
    { "Jump", "AlicornJump" },
    { "Trick 1", "AlicornTrick1" },
    { "Trick 2", "AlicornTrick2" }
}
v3.neon_parts = {
    ["BackLeftFoot"] = Color3.fromRGB(106, 148, 194),
    ["BackRightFoot"] = Color3.fromRGB(106, 148, 194),
    ["FrontLeftFoot"] = Color3.fromRGB(106, 148, 194),
    ["FrontRightFoot"] = Color3.fromRGB(106, 148, 194),
    ["Hair"] = Color3.fromRGB(106, 148, 194),
    ["HairLow"] = Color3.fromRGB(106, 148, 194),
    ["Horn"] = Color3.fromRGB(106, 148, 194),
    ["LeftWing2"] = Color3.fromRGB(106, 148, 194),
    ["RightWing2"] = Color3.fromRGB(106, 148, 194),
    ["Tail"] = Color3.fromRGB(106, 148, 194),
    ["TailLow"] = Color3.fromRGB(106, 148, 194)
}
v3.already_has_flying_wings = true
v3.eyes = { "Eyes" }
v3.minimum_run_anim_speed = 0.5
v2.basic_egg_2022_alicorn = v3
local v5 = {
    ["name"] = "Ancient Dragon",
    ["image"] = "rbxassetid://9678195673",
    ["model"] = "BasicEgg2022AncientDragon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Basic Egg Update",
        ["origin_items"] = { "pet_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "AncientDragonBeingHeldDouble",
        ["eating"] = "AncientDragonEat",
        ["hold"] = "AncientDragonBeingHeldSingle",
        ["idle"] = "AncientDragonIdle",
        ["running"] = "AncientDragonRun",
        ["sit"] = "AncientDragonSit",
        ["sleep"] = "AncientDragonSleep"
    },
    ["tricks"] = {
        { "Sit", "AncientDragonSit" },
        { "Joyful", "AncientDragonJoyful" },
        { "Beg", "AncientDragonBeg" },
        { "Jump", "AncientDragonJump" },
        { "Trick 1", "AncientDragonTrick1" },
        { "Trick 2", "AncientDragonTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(212, 88, 92),
        ["Head4"] = Color3.fromRGB(212, 88, 92),
        ["LeftWing2"] = Color3.fromRGB(212, 88, 92),
        ["RightWing2"] = Color3.fromRGB(212, 88, 92),
        ["Tail3"] = Color3.fromRGB(212, 88, 92)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_run_anim_speed"] = 0.5
}
v2.basic_egg_2022_ancient_dragon = v5
local v6 = {
    ["name"] = "Ant",
    ["image"] = "rbxassetid://9664487060",
    ["model"] = "BasicEgg2022Ant",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Basic Egg Update",
        ["origin_items"] = { "pet_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "AntBeingHeldDouble",
        ["eating"] = "AntEat",
        ["hold"] = "AntBeingHeldSingle",
        ["idle"] = "AntIdle",
        ["running"] = "AntRun",
        ["sit"] = "AntSit",
        ["sleep"] = "AntSleep"
    },
    ["tricks"] = {
        { "Sit", "AntSit" },
        { "Joyful", "AntJoyful" },
        { "Beg", "AntBeg" },
        { "Jump", "AntJump" },
        { "Trick 1", "AntTrick1" },
        { "Trick 2", "AntTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar"] = Color3.fromRGB(184, 180, 116),
        ["LeftEar2"] = Color3.fromRGB(184, 180, 116),
        ["RightEar"] = Color3.fromRGB(184, 180, 116),
        ["RightEar2"] = Color3.fromRGB(184, 180, 116),
        ["Torso"] = Color3.fromRGB(184, 180, 116),
        ["Torso3"] = Color3.fromRGB(184, 180, 116)
    },
    ["eyes"] = { "Eyes" }
}
v2.basic_egg_2022_ant = v6
local v7 = {
    ["name"] = "Camel",
    ["image"] = "rbxassetid://10306934599",
    ["model"] = "BasicEgg2022Camel",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Basic Egg Update",
        ["origin_items"] = { "pet_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "CamelBeingHeldDouble",
        ["eating"] = "CamelEat",
        ["hold"] = "CamelBeingHeldSingle",
        ["idle"] = "CamelIdle",
        ["running"] = "CamelRun",
        ["sit"] = "CamelSit",
        ["sleep"] = "CamelSleep"
    },
    ["tricks"] = {
        { "Sit", "CamelSit" },
        { "Joyful", "CamelJoyful" },
        { "Beg", "CamelBeg" },
        { "Jump", "CamelJump" },
        { "Trick 1", "CamelTrick1" },
        { "Trick 2", "CamelTrick2" }
    },
    ["neon_parts"] = {
        ["EarL"] = Color3.fromRGB(188, 155, 93),
        ["EarR"] = Color3.fromRGB(188, 155, 93),
        ["Torso"] = Color3.fromRGB(188, 155, 93)
    },
    ["eyes"] = { "Eyes" }
}
v2.basic_egg_2022_camel = v7
local v8 = {
    ["name"] = "Corgi",
    ["image"] = "rbxassetid://10235589000",
    ["model"] = "BasicEgg2022Corgi",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Basic Egg Update",
        ["origin_items"] = { "pet_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "CorgiBeingHeldDouble",
        ["eating"] = "CorgiEat",
        ["hold"] = "CorgiBeingHeldSingle",
        ["idle"] = "CorgiIdle",
        ["running"] = "CorgiRun",
        ["sit"] = "CorgiSit",
        ["sleep"] = "CorgiSleep"
    },
    ["tricks"] = {
        { "Sit", "CorgiSit" },
        { "Joyful", "CorgiJoyful" },
        { "Beg", "CorgiBeg" },
        { "Jump", "CorgiJump" },
        { "Trick 1", "CorgiTrick1" },
        { "Trick 2", "CorgiTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(186, 151, 115),
        ["BackRightFoot"] = Color3.fromRGB(186, 151, 115),
        ["FrontLeftFoot"] = Color3.fromRGB(186, 151, 115),
        ["FrontRightFoot"] = Color3.fromRGB(186, 151, 115),
        ["Head2"] = Color3.fromRGB(186, 151, 115),
        ["InnerEarL"] = Color3.fromRGB(186, 151, 115),
        ["InnerEarR"] = Color3.fromRGB(186, 151, 115),
        ["Tail"] = Color3.fromRGB(186, 151, 115),
        ["Torso2"] = Color3.fromRGB(186, 151, 115)
    },
    ["eyes"] = { "Eyes" }
}
v2.basic_egg_2022_corgi = v8
local v9 = {
    ["name"] = "Donkey",
    ["image"] = "rbxassetid://9718162456",
    ["model"] = "BasicEgg2022Donkey",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Basic Egg Update",
        ["origin_items"] = { "pet_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "DonkeyBeingHeldDouble",
        ["eating"] = "DonkeyEat",
        ["hold"] = "DonkeyBeingHeldSingle",
        ["idle"] = "DonkeyIdle",
        ["running"] = "DonkeyRun",
        ["sit"] = "DonkeySit",
        ["sleep"] = "DonkeySleep"
    },
    ["tricks"] = {
        { "Sit", "DonkeySit" },
        { "Joyful", "DonkeyJoyful" },
        { "Beg", "DonkeyBeg" },
        { "Jump", "DonkeyJump" },
        { "Trick 1", "DonkeyTrick1" },
        { "Trick 2", "DonkeyTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(102, 189, 153),
        ["Head4"] = Color3.fromRGB(102, 189, 153),
        ["LeftEar2"] = Color3.fromRGB(102, 189, 153),
        ["RightEar2"] = Color3.fromRGB(102, 189, 153),
        ["Tail2"] = Color3.fromRGB(102, 189, 153),
        ["Torso2"] = Color3.fromRGB(102, 189, 153)
    },
    ["eyes"] = { "Eyes" }
}
v2.basic_egg_2022_donkey = v9
local v10 = {
    ["name"] = "Dragonfly",
    ["image"] = "rbxassetid://9922229151",
    ["model"] = "BasicEgg2022Dragonfly",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Basic Egg Update",
        ["origin_items"] = { "pet_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "DragonflyBeingHeldDouble",
        ["eating"] = "DragonflyEat",
        ["hold"] = "DragonflyBeingHeldSingle",
        ["idle"] = "DragonflyIdle",
        ["running"] = "DragonflyRun",
        ["sit"] = "DragonflySit",
        ["sleep"] = "DragonflySleep"
    },
    ["tricks"] = {
        { "Sit", "DragonflySit" },
        { "Joyful", "DragonflyJoyful" },
        { "Beg", "DragonflyBeg" },
        { "Jump", "DragonflyJump" },
        { "Trick 1", "DragonflyTrick1" },
        { "Trick 2", "DragonflyTrick2" }
    },
    ["neon_parts"] = {
        ["LeftAntenna"] = Color3.fromRGB(214, 101, 171),
        ["LeftWing3"] = Color3.fromRGB(214, 101, 171),
        ["LeftWing6"] = Color3.fromRGB(214, 101, 171),
        ["RightAntenna"] = Color3.fromRGB(214, 101, 171),
        ["RightWing3"] = Color3.fromRGB(214, 101, 171),
        ["RightWing6"] = Color3.fromRGB(214, 101, 171),
        ["Tail3"] = Color3.fromRGB(214, 101, 171)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_run_anim_speed"] = 1
}
v2.basic_egg_2022_dragonfly = v10
local v11 = {
    ["name"] = "Mouse",
    ["image"] = "rbxassetid://9678196095",
    ["model"] = "BasicEgg2022Mouse",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Basic Egg Update",
        ["origin_items"] = { "pet_egg", "tutorial_2025_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "MouseBeingHeldDouble",
        ["eating"] = "MouseEat",
        ["hold"] = "MouseBeingHeldSingle",
        ["idle"] = "MouseIdle",
        ["running"] = "MouseRun",
        ["sit"] = "MouseSit",
        ["sleep"] = "MouseSleep"
    },
    ["tricks"] = {
        { "Sit", "MouseSit" },
        { "Joyful", "MouseJoyful" },
        { "Beg", "MouseBeg" },
        { "Jump", "MouseJump" },
        { "Trick 1", "MouseTrick1" },
        { "Trick 2", "MouseTrick2" }
    },
    ["neon_parts"] = {
        ["LeftBackFoot"] = Color3.fromRGB(13, 119, 190),
        ["LeftEar2"] = Color3.fromRGB(13, 119, 190),
        ["LeftFrontFoot"] = Color3.fromRGB(13, 119, 190),
        ["Nose"] = Color3.fromRGB(13, 119, 190),
        ["RightBackFoot"] = Color3.fromRGB(13, 119, 190),
        ["RightEar2"] = Color3.fromRGB(13, 119, 190),
        ["RightFrontFoot"] = Color3.fromRGB(13, 119, 190),
        ["Tail"] = Color3.fromRGB(13, 119, 190)
    },
    ["eyes"] = { "Eyes" }
}
v2.basic_egg_2022_mouse = v11
local v12 = {
    ["name"] = "Orangutan",
    ["image"] = "rbxassetid://9982358951",
    ["model"] = "BasicEgg2022Orangutan",
    ["rarity"] = "rare"
}
local v13 = {
    ["origin"] = "Basic Egg Update",
    ["origin_items"] = { "pet_egg" },
    ["viewport_override"] = {
        ["distance"] = 5,
        ["offset"] = CFrame.new(0, 0, 0)
    },
    ["year"] = 2022
}
v12.origin_entry = v13
v12.anims = {
    ["double_hold"] = "OrangutanBeingHeldDouble",
    ["eating"] = "OrangutanEat",
    ["hold"] = "OrangutanBeingHeldSingle",
    ["idle"] = "OrangutanIdle",
    ["running"] = "OrangutanRun",
    ["sit"] = "OrangutanSit",
    ["sleep"] = "OrangutanSleep"
}
v12.tricks = {
    { "Sit", "OrangutanSit" },
    { "Joyful", "OrangutanJoyful" },
    { "Beg", "OrangutanBeg" },
    { "Jump", "OrangutanJump" },
    { "Trick 1", "OrangutanTrick1" },
    { "Trick 2", "OrangutanTrick2" }
}
v12.neon_parts = {
    ["Head2"] = Color3.fromRGB(195, 108, 102),
    ["Head3"] = Color3.fromRGB(195, 108, 102),
    ["LeftArm3"] = Color3.fromRGB(195, 108, 102),
    ["RightArm3"] = Color3.fromRGB(195, 108, 102),
    ["Torso2"] = Color3.fromRGB(195, 108, 102)
}
v12.eyes = { "Eyes" }
v2.basic_egg_2022_orangutan = v12
local v14 = {
    ["name"] = "Parakeet",
    ["image"] = "rbxassetid://9708962205",
    ["model"] = "BasicEgg2022Parakeet",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Basic Egg Update",
        ["origin_items"] = { "pet_egg", "tutorial_2025_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "ParakeetBeingHeldDouble",
        ["eating"] = "ParakeetEat",
        ["hold"] = "ParakeetBeingHeldSingle",
        ["idle"] = "ParakeetIdle",
        ["running"] = "ParakeetRun",
        ["sit"] = "ParakeetSit",
        ["sleep"] = "ParakeetSleep"
    },
    ["tricks"] = {
        { "Sit", "ParakeetSit" },
        { "Joyful", "ParakeetJoyful" },
        { "Beg", "ParakeetBeg" },
        { "Jump", "ParakeetJump" },
        { "Trick 1", "ParakeetTrick1" },
        { "Trick 2", "ParakeetTrick2" }
    },
    ["neon_parts"] = {
        ["Torso"] = Color3.fromRGB(15, 124, 202)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_run_anim_speed"] = 0.5
}
v2.basic_egg_2022_parakeet = v14
local v15 = {
    ["name"] = "Poodle",
    ["image"] = "rbxassetid://9982202041",
    ["model"] = "BasicEgg2022Poodle",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Basic Egg Update",
        ["origin_items"] = { "pet_egg", "tutorial_2025_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "PoodleBeingHeldDouble",
        ["eating"] = "PoodleEat",
        ["hold"] = "PoodleBeingHeldSingle",
        ["idle"] = "PoodleIdle",
        ["running"] = "PoodleRun",
        ["sit"] = "PoodleSit",
        ["sleep"] = "PoodleSleep"
    },
    ["tricks"] = {
        { "Sit", "PoodleSit" },
        { "Joyful", "PoodleJoyful" },
        { "Beg", "PoodleBeg" },
        { "Jump", "PoodleJump" },
        { "Trick 1", "PoodleTrick1" },
        { "Trick 2", "PoodleTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(184, 110, 159),
        ["LeftBackFoot"] = Color3.fromRGB(184, 110, 159),
        ["LeftFrontFoot"] = Color3.fromRGB(184, 110, 159),
        ["Nose"] = Color3.fromRGB(184, 110, 159),
        ["RightBackFoot"] = Color3.fromRGB(184, 110, 159),
        ["RightFrontFoot"] = Color3.fromRGB(184, 110, 159),
        ["Tail2"] = Color3.fromRGB(184, 110, 159),
        ["Torso"] = Color3.fromRGB(184, 110, 159)
    },
    ["eyes"] = { "Eyes" }
}
v2.basic_egg_2022_poodle = v15
local v16 = {
    ["name"] = "Robot",
    ["image"] = "rbxassetid://9664282145",
    ["model"] = "BasicEgg2022Robot",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Basic Egg Update",
        ["origin_items"] = { "pet_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "RobotBeingHeldDouble",
        ["eating"] = "RobotEat",
        ["hold"] = "RobotBeingHeldSingle",
        ["idle"] = "RobotIdle",
        ["running"] = "RobotRun",
        ["sit"] = "RobotSit",
        ["sleep"] = "RobotSleep"
    },
    ["tricks"] = {
        { "Sit", "RobotSit" },
        { "Joyful", "RobotJoyful" },
        { "Beg", "RobotBeg" },
        { "Jump", "RobotJump" },
        { "Trick 1", "RobotTrick1" },
        { "Trick 2", "RobotTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(213, 115, 61),
        ["BackLeftLeg"] = Color3.fromRGB(213, 115, 61),
        ["BackLeftLeg2"] = Color3.fromRGB(213, 115, 61),
        ["BackRightFoot"] = Color3.fromRGB(213, 115, 61),
        ["BackRightLeg"] = Color3.fromRGB(213, 115, 61),
        ["BackRightLeg2"] = Color3.fromRGB(213, 115, 61),
        ["FrontLeftFoot"] = Color3.fromRGB(213, 115, 61),
        ["FrontLeftLeg"] = Color3.fromRGB(213, 115, 61),
        ["FrontLeftLeg2"] = Color3.fromRGB(213, 115, 61),
        ["FrontRightFoot"] = Color3.fromRGB(213, 115, 61),
        ["FrontRightLeg"] = Color3.fromRGB(213, 115, 61),
        ["FrontRightLeg2"] = Color3.fromRGB(213, 115, 61),
        ["Head3"] = Color3.fromRGB(213, 115, 61),
        ["Head5"] = Color3.fromRGB(213, 115, 61),
        ["Head6"] = Color3.fromRGB(213, 115, 61),
        ["Head7"] = Color3.fromRGB(213, 115, 61),
        ["Head9"] = Color3.fromRGB(213, 115, 61),
        ["Torso"] = Color3.fromRGB(213, 115, 61)
    },
    ["eyes"] = { "LeftEye", "RightEye" }
}
v2.basic_egg_2022_robot = v16
local v17 = {
    ["name"] = "Swordfish",
    ["image"] = "rbxassetid://9543194411",
    ["model"] = "BasicEgg2022Swordfish",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Basic Egg Update",
        ["origin_items"] = { "pet_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "SwordfishBeingHeldDouble",
        ["eating"] = "SwordfishEat",
        ["hold"] = "SwordfishBeingHeldSingle",
        ["idle"] = "SwordfishIdle",
        ["running"] = "SwordfishRun",
        ["sit"] = "SwordfishSit",
        ["sleep"] = "SwordfishSleep"
    },
    ["tricks"] = {
        { "Sit", "SwordfishSit" },
        { "Joyful", "SwordfishJoyful" },
        { "Beg", "SwordfishBeg" },
        { "Jump", "SwordfishJump" },
        { "Trick 1", "SwordfishTrick1" },
        { "Trick 2", "SwordfishTrick2" }
    },
    ["neon_parts"] = {
        ["Fin2"] = Color3.fromRGB(185, 161, 81),
        ["FrontLeftLeg"] = Color3.fromRGB(185, 161, 81),
        ["LeftFin"] = Color3.fromRGB(185, 161, 81),
        ["RightFin"] = Color3.fromRGB(185, 161, 81),
        ["Tail"] = Color3.fromRGB(185, 161, 81),
        ["Torso2"] = Color3.fromRGB(185, 161, 81)
    },
    ["eyes"] = { "Eyes" }
}
v2.basic_egg_2022_swordfish = v17
local v18 = {
    ["name"] = "Zebra",
    ["image"] = "rbxassetid://9549841158",
    ["model"] = "BasicEgg2022Zebra",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Basic Egg Update",
        ["origin_items"] = { "pet_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "ZebraBeingHeldDouble",
        ["eating"] = "ZebraEat",
        ["hold"] = "ZebraBeingHeldSingle",
        ["idle"] = "ZebraIdle",
        ["running"] = "ZebraRun",
        ["sit"] = "ZebraSit",
        ["sleep"] = "ZebraSleep"
    },
    ["tricks"] = {
        { "Sit", "ZebraSit" },
        { "Joyful", "ZebraJoyful" },
        { "Beg", "ZebraBeg" },
        { "Jump", "ZebraJump" },
        { "Trick 1", "ZebraTrick1" },
        { "Trick 2", "ZebraTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(14, 188, 165),
        ["BackRightFoot"] = Color3.fromRGB(14, 188, 165),
        ["FrontLeftFoot"] = Color3.fromRGB(14, 188, 165),
        ["FrontRightFoot"] = Color3.fromRGB(14, 188, 165),
        ["Head2"] = Color3.fromRGB(14, 188, 165),
        ["Head4"] = Color3.fromRGB(14, 188, 165),
        ["Nose"] = Color3.fromRGB(14, 188, 165),
        ["Tail2"] = Color3.fromRGB(14, 188, 165),
        ["Torso2"] = Color3.fromRGB(14, 188, 165)
    },
    ["eyes"] = { "Eyes" }
}
v2.basic_egg_2022_zebra = v18
local v19 = {
    ["name"] = "Retired Egg",
    ["image"] = "rbxassetid://9922274393",
    ["model"] = "RetiredEgg",
    ["rarity"] = "rare",
    ["cost"] = 600,
    ["origin_entry"] = {
        ["origin"] = "Basic Egg Update",
        ["origin_items"] = {},
        ["year"] = 2022
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
    ["is_non_event_egg"] = true,
    ["vip_exclusive"] = true
}
v2.retired_egg = v19
return v1(v2)