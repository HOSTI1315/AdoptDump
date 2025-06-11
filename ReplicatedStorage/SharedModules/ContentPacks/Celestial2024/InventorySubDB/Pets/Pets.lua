--// ReplicatedStorage.SharedModules.ContentPacks.Celestial2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Singularity Beetle",
    ["model"] = "Celestial2024SingularityBeetle",
    ["image"] = "rbxassetid://18819382634",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Celestial",
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Celestial2024SingularityBeetleSleep",
        ["running"] = "Celestial2024SingularityBeetleRun",
        ["idle"] = "Celestial2024SingularityBeetleIdle",
        ["running_mounted"] = "Celestial2024SingularityBeetleRideRun",
        ["idle_mounted"] = "Celestial2024SingularityBeetleRideIdle",
        ["eating"] = "Celestial2024SingularityBeetleEat",
        ["sit"] = "Celestial2024SingularityBeetleSit",
        ["flying"] = "Celestial2024SingularityBeetleRideRun",
        ["hold"] = "Celestial2024SingularityBeetleBeingHeldSingle",
        ["double_hold"] = "Celestial2024SingularityBeetleBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Celestial2024SingularityBeetleSit" },
        { "Joyful", "Celestial2024SingularityBeetleJoyful" },
        { "Beg", "Celestial2024SingularityBeetleBeg" },
        { "Jump", "Celestial2024SingularityBeetleJump" },
        { "Trick 1", "Celestial2024SingularityBeetleTrick1" },
        { "Trick 2", "Celestial2024SingularityBeetleTrick2" }
    }
}
local v4 = {
    ["BackLeftFoot"] = Color3.fromRGB(55, 28, 68),
    ["BackLeftFoot2"] = Color3.fromRGB(255, 241, 184),
    ["BackLeftFoot3"] = {
        ["Color"] = Color3.fromRGB(231, 124, 252),
        ["Material"] = Enum.Material.ForceField
    },
    ["BackRightFoot"] = Color3.fromRGB(255, 241, 184),
    ["BackRightFoot2"] = {
        ["Color"] = Color3.fromRGB(231, 124, 252),
        ["Material"] = Enum.Material.ForceField
    },
    ["BackRightFoot3"] = Color3.fromRGB(55, 28, 68),
    ["BlackHole"] = Color3.fromRGB(0, 0, 0),
    ["BlackHole2"] = Color3.fromRGB(0, 0, 0),
    ["BlackHole3"] = Color3.fromRGB(0, 0, 0),
    ["BlackHole4"] = Color3.fromRGB(0, 0, 0),
    ["BlackHole5"] = Color3.fromRGB(0, 0, 0),
    ["BlackHoleVFX"] = Color3.fromRGB(55, 28, 68),
    ["DungSphereOuterShell"] = {
        ["Color"] = Color3.fromRGB(231, 124, 252),
        ["Material"] = Enum.Material.ForceField
    },
    ["DungStars"] = Color3.fromRGB(255, 255, 176),
    ["Dungball"] = Color3.fromRGB(55, 28, 68),
    ["Eyes"] = Color3.fromRGB(167, 145, 102),
    ["FrontLeftFoot"] = Color3.fromRGB(255, 241, 184),
    ["FrontLeftFoot2"] = {
        ["Color"] = Color3.fromRGB(231, 124, 252),
        ["Material"] = Enum.Material.ForceField
    },
    ["FrontLeftFoot3"] = Color3.fromRGB(55, 28, 68),
    ["FrontRightFoot"] = Color3.fromRGB(255, 241, 184),
    ["FrontRightFoot2"] = {
        ["Color"] = Color3.fromRGB(231, 124, 252),
        ["Material"] = Enum.Material.ForceField
    },
    ["FrontRightFoot3"] = Color3.fromRGB(55, 28, 68),
    ["Head"] = Color3.fromRGB(94, 58, 202),
    ["MiddleLeftFoot"] = Color3.fromRGB(255, 241, 184),
    ["MiddleLeftFoot2"] = {
        ["Color"] = Color3.fromRGB(231, 124, 252),
        ["Material"] = Enum.Material.ForceField
    },
    ["MiddleLeftFoot3"] = Color3.fromRGB(55, 28, 68),
    ["MiddleRightFoot"] = Color3.fromRGB(255, 241, 184),
    ["MiddleRightFoot2"] = {
        ["Color"] = Color3.fromRGB(231, 124, 252),
        ["Material"] = Enum.Material.ForceField
    },
    ["MiddleRightFoot3"] = Color3.fromRGB(55, 28, 68),
    ["ShellOuter"] = {
        ["Color"] = Color3.fromRGB(231, 124, 252),
        ["Material"] = Enum.Material.ForceField
    },
    ["Torso"] = Color3.fromRGB(55, 28, 68),
    ["Torso2"] = {
        ["Color"] = Color3.fromRGB(231, 124, 252),
        ["Material"] = Enum.Material.ForceField
    },
    ["TorsoStars"] = Color3.fromRGB(255, 241, 184)
}
v3.neon_parts = v4
local v5 = {
    ["BackLeftFoot2"] = Color3.fromRGB(255, 241, 184),
    ["BackLeftFoot3"] = {
        ["Material"] = Enum.Material.ForceField
    },
    ["BackRightFoot"] = Color3.fromRGB(255, 241, 184),
    ["BackRightFoot2"] = {
        ["Material"] = Enum.Material.ForceField
    },
    ["DungSphereOuterShell"] = {
        ["Material"] = Enum.Material.ForceField
    },
    ["DungStars"] = Color3.fromRGB(255, 255, 176),
    ["Eyes"] = Color3.fromRGB(167, 145, 102),
    ["FrontLeftFoot"] = Color3.fromRGB(255, 241, 184),
    ["FrontLeftFoot2"] = {
        ["Material"] = Enum.Material.ForceField
    },
    ["FrontRightFoot"] = Color3.fromRGB(255, 241, 184),
    ["FrontRightFoot2"] = {
        ["Material"] = Enum.Material.ForceField
    },
    ["Head"] = Color3.fromRGB(94, 58, 202),
    ["MiddleLeftFoot"] = Color3.fromRGB(255, 241, 184),
    ["MiddleLeftFoot2"] = {
        ["Material"] = Enum.Material.ForceField
    },
    ["MiddleRightFoot"] = Color3.fromRGB(255, 241, 184),
    ["MiddleRightFoot2"] = {
        ["Material"] = Enum.Material.ForceField
    },
    ["ShellOuter"] = {
        ["Material"] = Enum.Material.ForceField
    },
    ["Torso2"] = {
        ["Material"] = Enum.Material.ForceField
    },
    ["TorsoStars"] = Color3.fromRGB(255, 241, 184)
}
v3.mega_neon_parts = v5
v2.celestial_2024_singularity_beetle = v3
local v6 = {
    ["name"] = "Starhopper",
    ["model"] = "Celestial2024Starhopper",
    ["image"] = "rbxassetid://18957942216",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Celestial",
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Celestial2024StarhopperSleep",
        ["running"] = "Celestial2024StarhopperRun",
        ["idle"] = "Celestial2024StarhopperIdle",
        ["eating"] = "Celestial2024StarhopperEat",
        ["sit"] = "Celestial2024StarhopperSit",
        ["hold"] = "Celestial2024StarhopperBeingHeldSingle",
        ["double_hold"] = "Celestial2024StarhopperBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Celestial2024StarhopperSit" },
        { "Joyful", "Celestial2024StarhopperJoyful" },
        { "Beg", "Celestial2024StarhopperBeg" },
        { "Jump", "Celestial2024StarhopperJump" },
        { "Trick 1", "Celestial2024StarhopperTrick1" },
        { "Trick 2", "Celestial2024StarhopperTrick2" }
    },
    ["neon_parts"] = {
        ["RightLeg"] = Color3.fromRGB(186, 126, 41),
        ["LeftLeg"] = Color3.fromRGB(186, 126, 41),
        ["RightStar"] = Color3.fromRGB(186, 126, 41),
        ["LeftStar"] = Color3.fromRGB(186, 126, 41),
        ["Torso"] = Color3.fromRGB(186, 126, 41),
        ["Head3"] = Color3.fromRGB(186, 126, 41)
    }
}
v2.celestial_2024_starhopper = v6
local v7 = {
    ["name"] = "Glormy Hound",
    ["model"] = "Celestial2024GlormyHound",
    ["image"] = "rbxassetid://120475294381736",
    ["rarity"] = "legendary",
    ["cost"] = 175,
    ["currency_id"] = "galactic_shards_2024",
    ["origin_entry"] = {
        ["origin"] = "Celestial",
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Celestial2024GlormyHoundSleep",
        ["running"] = "Celestial2024GlormyHoundRun",
        ["idle"] = "Celestial2024GlormyHoundIdle",
        ["pedestal_idle"] = "Celestial2024GlormyHoundPedestalIdle",
        ["eating"] = "Celestial2024GlormyHoundEat",
        ["sit"] = "Celestial2024GlormyHoundSit",
        ["hold"] = "Celestial2024GlormyHoundBeingHeldSingle",
        ["double_hold"] = "Celestial2024GlormyHoundBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Celestial2024GlormyHoundSit" },
        { "Joyful", "Celestial2024GlormyHoundJoyful" },
        { "Beg", "Celestial2024GlormyHoundBeg" },
        { "Jump", "Celestial2024GlormyHoundJump" },
        { "Trick 1", "Celestial2024GlormyHoundTrick1" },
        { "Trick 2", "Celestial2024GlormyHoundTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(37, 167, 184),
        ["Hair"] = Color3.fromRGB(18, 238, 212),
        ["Hair2"] = Color3.fromRGB(18, 238, 212),
        ["HairStars"] = Color3.fromRGB(37, 167, 184),
        ["NeckFur"] = Color3.fromRGB(18, 238, 212),
        ["Nose"] = Color3.fromRGB(18, 238, 212),
        ["HeadStars"] = Color3.fromRGB(37, 167, 184),
        ["LeftFrontFoot"] = Color3.fromRGB(18, 238, 212),
        ["LeftFrontFoot2"] = Color3.fromRGB(18, 238, 212),
        ["LeftFrontFootStars"] = Color3.fromRGB(37, 167, 184),
        ["LeftBackFoot"] = Color3.fromRGB(18, 238, 212),
        ["LeftBackFoot2"] = Color3.fromRGB(18, 238, 212),
        ["LeftBackFootStars"] = Color3.fromRGB(37, 167, 184),
        ["LeftEar"] = Color3.fromRGB(18, 238, 212),
        ["LeftEarStars"] = Color3.fromRGB(37, 167, 184),
        ["RightFrontFoot"] = Color3.fromRGB(18, 238, 212),
        ["RightFrontFoot2"] = Color3.fromRGB(18, 238, 212),
        ["RightFrontFootStars"] = Color3.fromRGB(37, 167, 184),
        ["RightBackFoot"] = Color3.fromRGB(18, 238, 212),
        ["RightBackFoot2"] = Color3.fromRGB(18, 238, 212),
        ["RightBackFootStars"] = Color3.fromRGB(37, 167, 184),
        ["RightEar"] = Color3.fromRGB(18, 238, 212),
        ["RightEarStars"] = Color3.fromRGB(37, 167, 184),
        ["Tail"] = Color3.fromRGB(18, 238, 212),
        ["TailStars"] = Color3.fromRGB(37, 167, 184),
        ["TorsoStars"] = Color3.fromRGB(37, 167, 184)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v2.celestial_2024_glormy_hound = v7
local v8 = {
    ["name"] = "Glormy Leo",
    ["model"] = "Celestial2024GlormyLeo",
    ["image"] = "rbxassetid://123037843357105",
    ["rarity"] = "legendary",
    ["cost"] = 175,
    ["currency_id"] = "galactic_shards_2024",
    ["origin_entry"] = {
        ["origin"] = "Celestial",
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Celestial2024GlormyLeoSleep",
        ["running"] = "Celestial2024GlormyLeoRun",
        ["idle"] = "Celestial2024GlormyLeoIdle",
        ["pedestal_idle"] = "Celestial2024GlormyLeoPedestalIdle",
        ["eating"] = "Celestial2024GlormyLeoEat",
        ["sit"] = "Celestial2024GlormyLeoSit",
        ["hold"] = "Celestial2024GlormyLeoBeingHeldSingle",
        ["double_hold"] = "Celestial2024GlormyLeoBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Celestial2024GlormyLeoSit" },
        { "Joyful", "Celestial2024GlormyLeoJoyful" },
        { "Beg", "Celestial2024GlormyLeoBeg" },
        { "Jump", "Celestial2024GlormyLeoJump" },
        { "Trick 1", "Celestial2024GlormyLeoTrick1" },
        { "Trick 2", "Celestial2024GlormyLeoTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(18, 238, 212),
        ["Brow"] = Color3.fromRGB(18, 238, 212),
        ["Hair"] = Color3.fromRGB(18, 238, 212),
        ["LeftBackFoot"] = Color3.fromRGB(18, 238, 212),
        ["RightBackFoot"] = Color3.fromRGB(18, 238, 212),
        ["LeftFrontFoot"] = Color3.fromRGB(18, 238, 212),
        ["RightFrontFoot"] = Color3.fromRGB(18, 238, 212),
        ["LeftEar2"] = Color3.fromRGB(18, 238, 212),
        ["RightEar2"] = Color3.fromRGB(18, 238, 212),
        ["Nose"] = Color3.fromRGB(18, 238, 212),
        ["Snout"] = Color3.fromRGB(18, 238, 212),
        ["Tail"] = Color3.fromRGB(18, 238, 212),
        ["Torso2"] = Color3.fromRGB(18, 238, 212),
        ["Whisker"] = Color3.fromRGB(18, 238, 212)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v2.celestial_2024_glormy_leo = v8
local v9 = {
    ["name"] = "Singularity Pisces",
    ["model"] = "Celestial2024SingularityPisces",
    ["image"] = "rbxassetid://96039704958671",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Celestial",
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Celestial2024SingularityPiscesSleep",
        ["running"] = "Celestial2024SingularityPiscesRun",
        ["idle"] = "Celestial2024SingularityPiscesIdle",
        ["eating"] = "Celestial2024SingularityPiscesEat",
        ["sit"] = "Celestial2024SingularityPiscesSit",
        ["hold"] = "Celestial2024SingularityPiscesBeingHeldSingle",
        ["double_hold"] = "Celestial2024SingularityPiscesBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Celestial2024SingularityPiscesSit" },
        { "Joyful", "Celestial2024SingularityPiscesJoyful" },
        { "Beg", "Celestial2024SingularityPiscesBeg" },
        { "Jump", "Celestial2024SingularityPiscesJump" },
        { "Trick 1", "Celestial2024SingularityPiscesTrick1" },
        { "Trick 2", "Celestial2024SingularityPiscesTrick2" }
    },
    ["neon_parts"] = {
        ["Torso2"] = Color3.fromRGB(94, 142, 188),
        ["Head3"] = Color3.fromRGB(94, 142, 188),
        ["RightPelvicFin3"] = Color3.fromRGB(94, 142, 188),
        ["LeftPelvicFin3"] = Color3.fromRGB(94, 142, 188),
        ["BottomFin3"] = Color3.fromRGB(94, 142, 188),
        ["DorsalFin3"] = Color3.fromRGB(94, 142, 188)
    },
    ["already_has_flying_wings"] = true,
    ["head_rotator_disabled"] = true
}
v2.celestial_2024_singularity_pisces = v9
local v10 = {
    ["name"] = "Moonlight Moth",
    ["model"] = "Celestial2024MoonlightMoth",
    ["image"] = "rbxassetid://128469688002747",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Celestial",
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Celestial2024MoonlightMothSleep",
        ["running"] = "Celestial2024MoonlightMothRun",
        ["idle"] = "Celestial2024MoonlightMothIdle",
        ["eating"] = "Celestial2024MoonlightMothEat",
        ["sit"] = "Celestial2024MoonlightMothSit",
        ["hold"] = "Celestial2024MoonlightMothBeingHeldSingle",
        ["double_hold"] = "Celestial2024MoonlightMothBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Celestial2024MoonlightMothSit" },
        { "Joyful", "Celestial2024MoonlightMothJoyful" },
        { "Beg", "Celestial2024MoonlightMothBeg" },
        { "Jump", "Celestial2024MoonlightMothJump" },
        { "Trick 1", "Celestial2024MoonlightMothTrick1" },
        { "Trick 2", "Celestial2024MoonlightMothTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(255, 24, 184),
        ["LeftAntenna"] = Color3.fromRGB(173, 236, 220),
        ["RightAntenna"] = Color3.fromRGB(173, 236, 220),
        ["LowerLeftWing3"] = Color3.fromRGB(111, 185, 186),
        ["LowerRightWing3"] = Color3.fromRGB(111, 185, 186),
        ["UpperLeftWing"] = Color3.fromRGB(111, 185, 186),
        ["UpperLeftWing4"] = Color3.fromRGB(111, 185, 186),
        ["UpperLeftWing5"] = Color3.fromRGB(255, 241, 184),
        ["UpperLeftWing6"] = Color3.fromRGB(143, 53, 200),
        ["UpperRightWing"] = Color3.fromRGB(111, 185, 186),
        ["UpperRightWing4"] = Color3.fromRGB(111, 185, 186),
        ["UpperRightWing5"] = Color3.fromRGB(255, 241, 184),
        ["UpperRightWing6"] = Color3.fromRGB(143, 53, 200),
        ["Torso"] = Color3.fromRGB(111, 185, 186)
    },
    ["already_has_flying_wings"] = true
}
v2.celestial_2024_moonlight_moth = v10
return v1(v2)