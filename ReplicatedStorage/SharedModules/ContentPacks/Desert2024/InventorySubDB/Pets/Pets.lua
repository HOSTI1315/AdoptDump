--// ReplicatedStorage.SharedModules.ContentPacks.Desert2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Armadillo",
    ["image"] = "rbxassetid://15923574361",
    ["model"] = "Desert2024Armadillo",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Desert",
        ["origin_items"] = { "desert_2024_egg" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Desert2024ArmadilloBeingHeldDouble",
        ["eating"] = "Desert2024ArmadilloEat",
        ["flying"] = "Desert2024ArmadilloRunningMounted",
        ["hold"] = "Desert2024ArmadilloBeingHeldSingle",
        ["idle"] = "Desert2024ArmadilloIdle",
        ["running"] = "Desert2024ArmadilloRun",
        ["running_mounted"] = "Desert2024ArmadilloRunningMounted",
        ["sit"] = "Desert2024ArmadilloSit",
        ["sleep"] = "Desert2024ArmadilloSleep"
    },
    ["tricks"] = {
        { "Sit", "Desert2024ArmadilloSit" },
        { "Joyful", "Desert2024ArmadilloJoyful" },
        { "Beg", "Desert2024ArmadilloBeg" },
        { "Jump", "Desert2024ArmadilloJump" },
        { "Trick 1", "Desert2024ArmadilloTrick1" },
        { "Trick 2", "Desert2024ArmadilloTrick2" }
    },
    ["neon_parts"] = {
        ["LeftBackFoot"] = Color3.fromRGB(189, 69, 14),
        ["LeftEar2"] = Color3.fromRGB(189, 69, 14),
        ["LeftFrontFoot"] = Color3.fromRGB(189, 69, 14),
        ["Nose"] = Color3.fromRGB(189, 69, 14),
        ["RightBackFoot"] = Color3.fromRGB(189, 69, 14),
        ["RightEar2"] = Color3.fromRGB(189, 69, 14),
        ["RightFrontFoot"] = Color3.fromRGB(189, 69, 14),
        ["Tail"] = Color3.fromRGB(189, 69, 14),
        ["Torso6"] = Color3.fromRGB(189, 69, 14),
        ["Torso7"] = Color3.fromRGB(189, 69, 14),
        ["Torso8"] = Color3.fromRGB(189, 69, 14),
        ["Torso9"] = Color3.fromRGB(189, 69, 14)
    }
}
v2.desert_2024_armadillo = v3
local v4 = {
    ["name"] = "Cactus Friend",
    ["image"] = "rbxassetid://15931200262",
    ["model"] = "Desert2024CactusFriend",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Desert",
        ["origin_items"] = { "desert_2024_egg" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Desert2024CactusFriendBeingHeldDouble",
        ["eating"] = "Desert2024CactusFriendEat",
        ["flying"] = "Desert2024CactusFriendRun",
        ["hold"] = "Desert2024CactusFriendBeingHeldSingle",
        ["idle"] = "Desert2024CactusFriendIdle",
        ["running"] = "Desert2024CactusFriendRun",
        ["sit"] = "Desert2024CactusFriendSit",
        ["sleep"] = "Desert2024CactusFriendSleep"
    },
    ["tricks"] = {
        { "Sit", "Desert2024CactusFriendSit" },
        { "Joyful", "Desert2024CactusFriendJoyful" },
        { "Beg", "Desert2024CactusFriendBeg" },
        { "Jump", "Desert2024CactusFriendJump" },
        { "Trick 1", "Desert2024CactusFriendTrick1" },
        { "Trick 2", "Desert2024CactusFriendTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(125, 184, 93),
        ["LeftArm"] = Color3.fromRGB(125, 184, 93),
        ["LeftArm1"] = Color3.fromRGB(125, 184, 93),
        ["LeftArm2"] = Color3.fromRGB(125, 184, 93),
        ["LeftFoot"] = Color3.fromRGB(125, 184, 93),
        ["RightArm"] = Color3.fromRGB(125, 184, 93),
        ["RightArm1"] = Color3.fromRGB(125, 184, 93),
        ["RightArm2"] = Color3.fromRGB(125, 184, 93),
        ["RightFoot"] = Color3.fromRGB(125, 184, 93),
        ["Torso3"] = Color3.fromRGB(125, 184, 93)
    }
}
v2.desert_2024_cactus_friend = v4
local v5 = {
    ["name"] = "Coyote",
    ["image"] = "rbxassetid://15921927876",
    ["model"] = "Desert2024Coyote",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Desert",
        ["origin_items"] = { "desert_2024_egg" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Desert2024CoyoteBeingHeldDouble",
        ["eating"] = "Desert2024CoyoteEat",
        ["flying"] = "Desert2024CoyoteRun",
        ["hold"] = "Desert2024CoyoteBeingHeldSingle",
        ["idle"] = "Desert2024CoyoteIdle",
        ["running"] = "Desert2024CoyoteRun",
        ["sit"] = "Desert2024CoyoteSit",
        ["sleep"] = "Desert2024CoyoteSleep"
    },
    ["tricks"] = {
        { "Sit", "Desert2024CoyoteSit" },
        { "Joyful", "Desert2024CoyoteJoyful" },
        { "Beg", "Desert2024CoyoteBeg" },
        { "Jump", "Desert2024CoyoteJump" },
        { "Trick 1", "Desert2024CoyoteTrick1" },
        { "Trick 2", "Desert2024CoyoteTrick2" }
    },
    ["neon_parts"] = {
        ["Hair"] = Color3.fromRGB(190, 101, 28),
        ["Hair2"] = Color3.fromRGB(190, 101, 28),
        ["Hair2Left"] = Color3.fromRGB(190, 101, 28),
        ["Hair2Right"] = Color3.fromRGB(190, 101, 28),
        ["HairLeft"] = Color3.fromRGB(190, 101, 28),
        ["HairRight"] = Color3.fromRGB(190, 101, 28),
        ["LeftBackFoot"] = Color3.fromRGB(190, 101, 28),
        ["LeftEar2"] = Color3.fromRGB(190, 101, 28),
        ["LeftFrontFoot"] = Color3.fromRGB(190, 101, 28),
        ["Nose"] = Color3.fromRGB(190, 101, 28),
        ["RightBackFoot"] = Color3.fromRGB(190, 101, 28),
        ["RightEar2"] = Color3.fromRGB(190, 101, 28),
        ["RightFrontFoot"] = Color3.fromRGB(190, 101, 28),
        ["Tail2"] = Color3.fromRGB(190, 101, 28),
        ["Tail4"] = Color3.fromRGB(190, 101, 28),
        ["Tail5"] = Color3.fromRGB(190, 101, 28),
        ["Teeth"] = Color3.fromRGB(190, 101, 28)
    }
}
v2.desert_2024_coyote = v5
local v6 = {
    ["name"] = "Criosphinx",
    ["image"] = "rbxassetid://15931348363",
    ["model"] = "Desert2024Criosphinx",
    ["rarity"] = "legendary"
}
local v7 = {
    ["origin"] = "Desert",
    ["origin_items"] = { "desert_2024_egg" },
    ["viewport_override"] = {
        ["distance"] = 4,
        ["offset"] = CFrame.new(0, 0, -0.25)
    },
    ["year"] = 2024
}
v6.origin_entry = v7
v6.anims = {
    ["double_hold"] = "Desert2024CriosphinxBeingHeldDouble",
    ["eating"] = "Desert2024CriosphinxEat",
    ["flying"] = "Desert2024CriosphinxRun",
    ["hold"] = "Desert2024CriosphinxBeingHeldSingle",
    ["idle"] = "Desert2024CriosphinxIdle",
    ["running"] = "Desert2024CriosphinxRun",
    ["sit"] = "Desert2024CriosphinxSit",
    ["sleep"] = "Desert2024CriosphinxSleep"
}
v6.tricks = {
    { "Sit", "Desert2024CriosphinxSit" },
    { "Joyful", "Desert2024CriosphinxJoyful" },
    { "Beg", "Desert2024CriosphinxBeg" },
    { "Jump", "Desert2024CriosphinxJump" },
    { "Trick 1", "Desert2024CriosphinxTrick1" },
    { "Trick 2", "Desert2024CriosphinxTrick2" }
}
v6.neon_parts = {
    ["BackLeftFoot"] = Color3.fromRGB(60, 77, 185),
    ["BackRightFoot"] = Color3.fromRGB(60, 77, 185),
    ["FrontLeftFoot"] = Color3.fromRGB(60, 77, 185),
    ["FrontRightFoot"] = Color3.fromRGB(60, 77, 185),
    ["Gemstone"] = Color3.fromRGB(60, 77, 185),
    ["Head3"] = Color3.fromRGB(60, 77, 185),
    ["HeadDress2"] = Color3.fromRGB(60, 77, 185),
    ["HeadDressLeft"] = Color3.fromRGB(60, 77, 185),
    ["HeadDressLeft2"] = Color3.fromRGB(60, 77, 185),
    ["HeadDressLeft3"] = Color3.fromRGB(60, 77, 185),
    ["HeadDressRight"] = Color3.fromRGB(60, 77, 185),
    ["HeadDressRight2"] = Color3.fromRGB(60, 77, 185),
    ["HeadDressRight3"] = Color3.fromRGB(60, 77, 185),
    ["LeftHorn"] = Color3.fromRGB(60, 77, 185),
    ["LeftHorn3"] = Color3.fromRGB(60, 77, 185),
    ["LeftWing"] = Color3.fromRGB(60, 77, 185),
    ["LeftWing2"] = Color3.fromRGB(60, 77, 185),
    ["LeftWing4"] = Color3.fromRGB(60, 77, 185),
    ["LeftWing5"] = Color3.fromRGB(60, 77, 185),
    ["RightHorn"] = Color3.fromRGB(60, 77, 185),
    ["RightHorn3"] = Color3.fromRGB(60, 77, 185),
    ["RightWing"] = Color3.fromRGB(60, 77, 185),
    ["RightWing2"] = Color3.fromRGB(60, 77, 185),
    ["RightWing4"] = Color3.fromRGB(60, 77, 185),
    ["RightWing5"] = Color3.fromRGB(60, 77, 185),
    ["Tail2"] = Color3.fromRGB(60, 77, 185),
    ["Tail5"] = Color3.fromRGB(60, 77, 185),
    ["Tail6"] = Color3.fromRGB(60, 77, 185),
    ["Tail7"] = Color3.fromRGB(60, 77, 185),
    ["Tail8"] = Color3.fromRGB(60, 77, 185),
    ["Torso3"] = Color3.fromRGB(60, 77, 185)
}
v6.already_has_flying_wings = true
v2.desert_2024_criosphinx = v6
local v8 = {
    ["name"] = "Deathstalker Scorpion",
    ["image"] = "rbxassetid://15886122789",
    ["model"] = "Desert2024DeathstalkerScorpion",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Desert",
        ["origin_items"] = { "desert_2024_egg" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Desert2024DeathstalkerScorpionBeingHeldDouble",
        ["eating"] = "Desert2024DeathstalkerScorpionEat",
        ["flying"] = "Desert2024DeathstalkerScorpionRun",
        ["hold"] = "Desert2024DeathstalkerScorpionBeingHeldSingle",
        ["idle"] = "Desert2024DeathstalkerScorpionIdle",
        ["running"] = "Desert2024DeathstalkerScorpionRun",
        ["sit"] = "Desert2024DeathstalkerScorpionSit",
        ["sleep"] = "Desert2024DeathstalkerScorpionSleep"
    },
    ["tricks"] = {
        { "Sit", "Desert2024DeathstalkerScorpionSit" },
        { "Joyful", "Desert2024DeathstalkerScorpionJoyful" },
        { "Beg", "Desert2024DeathstalkerScorpionBeg" },
        { "Jump", "Desert2024DeathstalkerScorpionJump" },
        { "Trick 1", "Desert2024DeathstalkerScorpionTrick1" },
        { "Trick 2", "Desert2024DeathstalkerScorpionTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(93, 76, 190),
        ["LeftClaw2"] = Color3.fromRGB(93, 76, 190),
        ["RightClaw2"] = Color3.fromRGB(93, 76, 190),
        ["Tail5"] = Color3.fromRGB(93, 76, 190),
        ["Torso2"] = Color3.fromRGB(93, 76, 190),
        ["Torso3"] = Color3.fromRGB(93, 76, 190)
    }
}
v2.desert_2024_deathstalker_scorpion = v8
local v9 = {
    ["name"] = "Desert Egg",
    ["image"] = "rbxassetid://15931761708",
    ["model"] = "Desert2024Egg",
    ["rarity"] = "legendary",
    ["cost"] = 750,
    ["origin_entry"] = {
        ["origin"] = "Desert",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "Desert2024EggEat",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "Desert2024EggIdle",
        ["running"] = "Desert2024EggRun",
        ["sit"] = "Desert2024EggSit",
        ["sleep"] = "Desert2024EggSleep"
    },
    ["ailments_to_hatch"] = 5
}
v2.desert_2024_egg = v9
local v10 = {
    ["name"] = "Gila Monster",
    ["image"] = "rbxassetid://15930472964",
    ["model"] = "Desert2024GilaMonster",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Desert",
        ["origin_items"] = { "desert_2024_egg" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Desert2024GilaMonsterBeingHeldDouble",
        ["eating"] = "Desert2024GilaMonsterEat",
        ["flying"] = "Desert2024GilaMonsterRun",
        ["hold"] = "Desert2024GilaMonsterBeingHeldSingle",
        ["idle"] = "Desert2024GilaMonsterIdle",
        ["running"] = "Desert2024GilaMonsterRun",
        ["sit"] = "Desert2024GilaMonsterSit",
        ["sleep"] = "Desert2024GilaMonsterSleep"
    },
    ["tricks"] = {
        { "Sit", "Desert2024GilaMonsterSit" },
        { "Joyful", "Desert2024GilaMonsterJoyful" },
        { "Beg", "Desert2024GilaMonsterBeg" },
        { "Jump", "Desert2024GilaMonsterJump" },
        { "Trick 1", "Desert2024GilaMonsterTrick1" },
        { "Trick 2", "Desert2024GilaMonsterTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(186, 135, 73),
        ["Torso"] = Color3.fromRGB(186, 135, 73),
        ["Torso5"] = Color3.fromRGB(186, 135, 73),
        ["Torso6"] = Color3.fromRGB(186, 135, 73),
        ["Torso7"] = Color3.fromRGB(186, 135, 73)
    }
}
v2.desert_2024_gila_monster = v10
local v11 = {
    ["name"] = "Oryx",
    ["image"] = "rbxassetid://15923337068",
    ["model"] = "Desert2024Oryx",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Desert",
        ["origin_items"] = { "desert_2024_egg" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Desert2024OryxBeingHeldDouble",
        ["eating"] = "Desert2024OryxEat",
        ["flying"] = "Desert2024OryxRun",
        ["hold"] = "Desert2024OryxBeingHeldSingle",
        ["idle"] = "Desert2024OryxIdle",
        ["running"] = "Desert2024OryxRun",
        ["sit"] = "Desert2024OryxSit",
        ["sleep"] = "Desert2024OryxSleep"
    },
    ["tricks"] = {
        { "Sit", "Desert2024OryxSit" },
        { "Joyful", "Desert2024OryxJoyful" },
        { "Beg", "Desert2024OryxBeg" },
        { "Jump", "Desert2024OryxJump" },
        { "Trick 1", "Desert2024OryxTrick1" },
        { "Trick 2", "Desert2024OryxTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(73, 170, 189),
        ["Horn2"] = Color3.fromRGB(73, 170, 189),
        ["LeftBackFoot2"] = Color3.fromRGB(73, 170, 189),
        ["LeftEar2"] = Color3.fromRGB(73, 170, 189),
        ["LeftFrontFoot2"] = Color3.fromRGB(73, 170, 189),
        ["RightBackFoot2"] = Color3.fromRGB(73, 170, 189),
        ["RightEar2"] = Color3.fromRGB(73, 170, 189),
        ["RightFrontFoot2"] = Color3.fromRGB(73, 170, 189),
        ["Tail2"] = Color3.fromRGB(73, 170, 189),
        ["Tail4"] = Color3.fromRGB(73, 170, 189),
        ["Tail5"] = Color3.fromRGB(73, 170, 189),
        ["Tail6"] = Color3.fromRGB(73, 170, 189),
        ["Torso2"] = Color3.fromRGB(73, 170, 189),
        ["Torso4"] = Color3.fromRGB(73, 170, 189)
    }
}
v2.desert_2024_oryx = v11
local v12 = {
    ["name"] = "Rattlesnake",
    ["image"] = "rbxassetid://15937689999",
    ["model"] = "Desert2024Rattlesnake",
    ["rarity"] = "uncommon"
}
local v13 = {
    ["origin"] = "Desert",
    ["origin_items"] = { "desert_2024_egg" },
    ["viewport_override"] = {
        ["distance"] = 4.5,
        ["offset"] = CFrame.new(0, 1.25, -2)
    },
    ["year"] = 2024
}
v12.origin_entry = v13
v12.anims = {
    ["double_hold"] = "Desert2024RattlesnakeBeingHeldDouble",
    ["eating"] = "Desert2024RattlesnakeEat",
    ["flying"] = "Desert2024RattlesnakeRun",
    ["hold"] = "Desert2024RattlesnakeBeingHeldSingle",
    ["idle"] = "Desert2024RattlesnakeIdle",
    ["running"] = "Desert2024RattlesnakeRun",
    ["sit"] = "Desert2024RattlesnakeSit",
    ["sleep"] = "Desert2024RattlesnakeSleep"
}
v12.tricks = {
    { "Sit", "Desert2024RattlesnakeSit" },
    { "Joyful", "Desert2024RattlesnakeJoyful" },
    { "Beg", "Desert2024RattlesnakeBeg" },
    { "Jump", "Desert2024RattlesnakeJump" },
    { "Trick 1", "Desert2024RattlesnakeTrick1" },
    { "Trick 2", "Desert2024RattlesnakeTrick2" }
}
v12.neon_parts = {
    ["Head2"] = Color3.fromRGB(188, 106, 79),
    ["Head4"] = Color3.fromRGB(188, 106, 79),
    ["Tail"] = Color3.fromRGB(188, 106, 79),
    ["Tail2"] = Color3.fromRGB(188, 106, 79),
    ["Tail3"] = Color3.fromRGB(188, 106, 79),
    ["Tail4"] = Color3.fromRGB(188, 106, 79),
    ["Tongue"] = Color3.fromRGB(188, 106, 79),
    ["Tongue2"] = Color3.fromRGB(188, 106, 79),
    ["Tongue3"] = Color3.fromRGB(188, 106, 79),
    ["Torso10"] = Color3.fromRGB(188, 106, 79),
    ["Torso11"] = Color3.fromRGB(188, 106, 79),
    ["Torso12"] = Color3.fromRGB(188, 106, 79),
    ["Torso3"] = Color3.fromRGB(188, 106, 79),
    ["Torso8"] = Color3.fromRGB(188, 106, 79),
    ["Torso9"] = Color3.fromRGB(188, 106, 79)
}
v2.desert_2024_rattlesnake = v12
local v14 = {
    ["name"] = "Roadrunner",
    ["image"] = "rbxassetid://15922874831",
    ["model"] = "Desert2024Roadrunner",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Desert",
        ["origin_items"] = { "desert_2024_egg" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Desert2024RoadrunnerBeingHeldDouble",
        ["eating"] = "Desert2024RoadrunnerEat",
        ["flying"] = "Desert2024RoadrunnerRun",
        ["hold"] = "Desert2024RoadrunnerBeingHeldSingle",
        ["idle"] = "Desert2024RoadrunnerIdle",
        ["running"] = "Desert2024RoadrunnerRun",
        ["sit"] = "Desert2024RoadrunnerSit",
        ["sleep"] = "Desert2024RoadrunnerSleep"
    },
    ["tricks"] = {
        { "Sit", "Desert2024RoadrunnerSit" },
        { "Joyful", "Desert2024RoadrunnerJoyful" },
        { "Beg", "Desert2024RoadrunnerBeg" },
        { "Jump", "Desert2024RoadrunnerJump" },
        { "Trick 1", "Desert2024RoadrunnerTrick1" },
        { "Trick 2", "Desert2024RoadrunnerTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(92, 136, 190),
        ["Head3"] = Color3.fromRGB(92, 136, 190),
        ["Head4"] = Color3.fromRGB(92, 136, 190),
        ["Head5"] = Color3.fromRGB(92, 136, 190),
        ["LeftWing"] = Color3.fromRGB(92, 136, 190),
        ["LeftWing2"] = Color3.fromRGB(92, 136, 190),
        ["RightWing"] = Color3.fromRGB(92, 136, 190),
        ["RightWing2"] = Color3.fromRGB(92, 136, 190),
        ["Tail2"] = Color3.fromRGB(92, 136, 190),
        ["Tail_L"] = Color3.fromRGB(92, 136, 190),
        ["Tail_L2"] = Color3.fromRGB(92, 136, 190),
        ["Tail_L3"] = Color3.fromRGB(92, 136, 190),
        ["Tail_R"] = Color3.fromRGB(92, 136, 190),
        ["Tail_R2"] = Color3.fromRGB(92, 136, 190),
        ["Tail_R3"] = Color3.fromRGB(92, 136, 190),
        ["Torso2"] = Color3.fromRGB(92, 136, 190)
    }
}
v2.desert_2024_roadrunner = v14
local v15 = {
    ["name"] = "Royal Desert Egg",
    ["image"] = "rbxassetid://15932251755",
    ["model"] = "Desert2024RoyalEgg",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Desert",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "Desert2024EggEat",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "Desert2024EggIdle",
        ["running"] = "Desert2024EggRun",
        ["sit"] = "Desert2024EggSit",
        ["sleep"] = "Desert2024EggSleep"
    },
    ["ailments_to_hatch"] = 5
}
v2.desert_2024_royal_egg = v15
local v16 = {
    ["name"] = "Sandfish",
    ["image"] = "rbxassetid://15930540035",
    ["model"] = "Desert2024Sandfish",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Desert",
        ["origin_items"] = { "desert_2024_egg" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Desert2024SandfishBeingHeldDouble",
        ["eating"] = "Desert2024SandfishEat",
        ["flying"] = "Desert2024SandfishRun",
        ["hold"] = "Desert2024SandfishBeingHeldSingle",
        ["idle"] = "Desert2024SandfishIdle",
        ["running"] = "Desert2024SandfishRun",
        ["sit"] = "Desert2024SandfishSit",
        ["sleep"] = "Desert2024SandfishSleep"
    },
    ["tricks"] = {
        { "Sit", "Desert2024SandfishSit" },
        { "Joyful", "Desert2024SandfishJoyful" },
        { "Beg", "Desert2024SandfishBeg" },
        { "Jump", "Desert2024SandfishJump" },
        { "Trick 1", "Desert2024SandfishTrick1" },
        { "Trick 2", "Desert2024SandfishTrick2" }
    },
    ["neon_parts"] = {
        ["Torso2"] = Color3.fromRGB(202, 153, 85),
        ["Torso4"] = Color3.fromRGB(202, 153, 85)
    }
}
v2.desert_2024_sandfish = v16
local v17 = {
    ["name"] = "Thorny Devil",
    ["image"] = "rbxassetid://15921713413",
    ["model"] = "Desert2024ThornyDevil",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Desert",
        ["origin_items"] = { "desert_2024_egg" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Desert2024ThornyDevilBeingHeldDouble",
        ["eating"] = "Desert2024ThornyDevilEat",
        ["flying"] = "Desert2024ThornyDevilRun",
        ["hold"] = "Desert2024ThornyDevilBeingHeldSingle",
        ["idle"] = "Desert2024ThornyDevilIdle",
        ["running"] = "Desert2024ThornyDevilRun",
        ["sit"] = "Desert2024ThornyDevilSit",
        ["sleep"] = "Desert2024ThornyDevilSleep"
    },
    ["tricks"] = {
        { "Sit", "Desert2024ThornyDevilSit" },
        { "Joyful", "Desert2024ThornyDevilJoyful" },
        { "Beg", "Desert2024ThornyDevilBeg" },
        { "Jump", "Desert2024ThornyDevilJump" },
        { "Trick 1", "Desert2024ThornyDevilTrick1" },
        { "Trick 2", "Desert2024ThornyDevilTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(102, 184, 40),
        ["Torso3"] = Color3.fromRGB(102, 184, 40)
    }
}
v2.desert_2024_thorny_devil = v17
local v18 = {
    ["name"] = "Vulture",
    ["image"] = "rbxassetid://15870220155",
    ["model"] = "Desert2024Vulture",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Desert",
        ["origin_items"] = { "desert_2024_egg" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Desert2024VultureBeingHeldDouble",
        ["eating"] = "Desert2024VultureEat",
        ["flying"] = "Desert2024VultureRun",
        ["hold"] = "Desert2024VultureBeingHeldSingle",
        ["idle"] = "Desert2024VultureIdle",
        ["running"] = "Desert2024VultureRun",
        ["sit"] = "Desert2024VultureSit",
        ["sleep"] = "Desert2024VultureSleep"
    },
    ["tricks"] = {
        { "Sit", "Desert2024VultureSit" },
        { "Joyful", "Desert2024VultureJoyful" },
        { "Beg", "Desert2024VultureBeg" },
        { "Jump", "Desert2024VultureJump" },
        { "Trick 1", "Desert2024VultureTrick1" },
        { "Trick 2", "Desert2024VultureTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(152, 109, 190),
        ["Head3"] = Color3.fromRGB(152, 109, 190),
        ["LeftFoot"] = Color3.fromRGB(152, 109, 190),
        ["LeftWing2"] = Color3.fromRGB(152, 109, 190),
        ["RightFoot"] = Color3.fromRGB(152, 109, 190),
        ["RightWing2"] = Color3.fromRGB(152, 109, 190),
        ["Torso2"] = Color3.fromRGB(152, 109, 190)
    },
    ["already_has_flying_wings"] = true
}
v2.desert_2024_vulture = v18
return v1(v2)