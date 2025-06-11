--// ReplicatedStorage.SharedModules.ContentPacks.FireDimension2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Wildfire Hawk",
    ["image"] = "rbxassetid://16088267136",
    ["model"] = "FireDimension2024WildfireHawk",
    ["rarity"] = "ultra_rare",
    ["already_has_flying_wings"] = true,
    ["origin_entry"] = {
        ["origin"] = "Fire Dimension",
        ["year"] = 2024,
        ["origin_items"] = { "fire_dimension_2024_burnt_bites_bait", "fire_dimension_2024_baked_alaska_bait" }
    },
    ["anims"] = {
        ["sleep"] = "FireDimension2024WildfireHawkSleep",
        ["running"] = "FireDimension2024WildfireHawkRun",
        ["idle"] = "FireDimension2024WildfireHawkIdle",
        ["eating"] = "FireDimension2024WildfireHawkEat",
        ["sit"] = "FireDimension2024WildfireHawkSit",
        ["flying"] = "FireDimension2024WildfireHawkRun",
        ["hold"] = "FireDimension2024WildfireHawkBeingHeldSingle",
        ["double_hold"] = "FireDimension2024WildfireHawkBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "FireDimension2024WildfireHawkSit" },
        { "Joyful", "FireDimension2024WildfireHawkJoyful" },
        { "Beg", "FireDimension2024WildfireHawkBeg" },
        { "Jump", "FireDimension2024WildfireHawkJump" },
        { "Trick 1", "FireDimension2024WildfireHawkTrick1" },
        { "Trick 2", "FireDimension2024WildfireHawkTrick2" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(48, 161, 213),
        ["Chest"] = Color3.fromRGB(41, 140, 216),
        ["Tail"] = Color3.fromRGB(41, 140, 216),
        ["RightWing2"] = Color3.fromRGB(41, 140, 216),
        ["LeftWing2"] = Color3.fromRGB(41, 140, 216),
        ["Eyes"] = Color3.fromRGB(46, 155, 223)
    }
}
v2.fire_dimension_2024_wildfire_hawk = v3
local v4 = {
    ["name"] = "Burning Bunny",
    ["image"] = "rbxassetid://16088266364",
    ["model"] = "FireDimension2024BurningBunny",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Fire Dimension",
        ["year"] = 2024,
        ["origin_items"] = { "fire_dimension_2024_burnt_bites_bait", "fire_dimension_2024_baked_alaska_bait" }
    },
    ["anims"] = {
        ["sleep"] = "FireDimension2024BurningBunnySleep",
        ["running"] = "FireDimension2024BurningBunnyRun",
        ["idle"] = "FireDimension2024BurningBunnyIdle",
        ["eating"] = "FireDimension2024BurningBunnyEat",
        ["sit"] = "FireDimension2024BurningBunnySit",
        ["flying"] = "FireDimension2024BurningBunnyRun",
        ["hold"] = "FireDimension2024BurningBunnyBeingHeldSingle",
        ["double_hold"] = "FireDimension2024BurningBunnyBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "FireDimension2024BurningBunnySit" },
        { "Joyful", "FireDimension2024BurningBunnyJoyful" },
        { "Beg", "FireDimension2024BurningBunnyBeg" },
        { "Jump", "FireDimension2024BurningBunnyJump" },
        { "Trick 1", "FireDimension2024BurningBunnyTrick1" },
        { "Trick 2", "FireDimension2024BurningBunnyTrick2" }
    }
}
local v5 = {
    ["Torso2"] = {
        ["Color"] = Color3.fromRGB(47, 107, 186),
        ["Transparency"] = 0.2
    },
    ["Torso3"] = {
        ["Color"] = Color3.fromRGB(183, 230, 255),
        ["Transparency"] = 0
    },
    ["Tail"] = Color3.fromRGB(49, 75, 189),
    ["Tail2"] = Color3.fromRGB(48, 94, 205),
    ["Tail3"] = Color3.fromRGB(47, 107, 186),
    ["Tail4"] = {
        ["Color"] = Color3.fromRGB(47, 107, 186),
        ["Transparency"] = 0.2
    },
    ["Tail5"] = {
        ["Color"] = Color3.fromRGB(183, 230, 255),
        ["Transparency"] = 0
    },
    ["Whisker"] = Color3.fromRGB(42, 202, 234),
    ["LeftEar2"] = Color3.fromRGB(48, 94, 205),
    ["LeftEar"] = Color3.fromRGB(49, 75, 189),
    ["LeftEar3"] = {
        ["Color"] = Color3.fromRGB(47, 107, 186),
        ["Transparency"] = 0.2
    },
    ["LeftEar4"] = {
        ["Color"] = Color3.fromRGB(183, 230, 255),
        ["Transparency"] = 0.2
    },
    ["RightEar"] = Color3.fromRGB(49, 75, 189),
    ["RightEar2"] = Color3.fromRGB(48, 94, 205),
    ["RightEar3"] = {
        ["Color"] = Color3.fromRGB(47, 107, 186),
        ["Transparency"] = 0.2
    },
    ["RightEar4"] = {
        ["Color"] = Color3.fromRGB(183, 230, 255),
        ["Transparency"] = 0.2
    },
    ["RightBackFoot2"] = {
        ["Color"] = Color3.fromRGB(47, 107, 186),
        ["Transparency"] = 0.2
    },
    ["RightFrontFoot2"] = {
        ["Color"] = Color3.fromRGB(47, 107, 186),
        ["Transparency"] = 0.2
    },
    ["LeftBackFoot2"] = {
        ["Color"] = Color3.fromRGB(47, 107, 186),
        ["Transparency"] = 0.2
    },
    ["LeftFrontFoot2"] = {
        ["Color"] = Color3.fromRGB(47, 107, 186),
        ["Transparency"] = 0.2
    },
    ["RightBackFoot3"] = {
        ["Color"] = Color3.fromRGB(183, 230, 255),
        ["Transparency"] = 0
    },
    ["RightFrontFoot3"] = {
        ["Color"] = Color3.fromRGB(183, 230, 255),
        ["Transparency"] = 0
    },
    ["LeftBackFoot3"] = {
        ["Color"] = Color3.fromRGB(183, 230, 255),
        ["Transparency"] = 0
    },
    ["LeftFrontFoot3"] = {
        ["Color"] = Color3.fromRGB(183, 230, 255),
        ["Transparency"] = 0
    },
    ["Eyes"] = Color3.fromRGB(87, 110, 186),
    ["Nose"] = Color3.fromRGB(87, 110, 186),
    ["Head2"] = Color3.fromRGB(42, 202, 234),
    ["Collar"] = Color3.fromRGB(101, 187, 240)
}
v4.neon_parts = v5
v2.fire_dimension_2024_burning_bunny = v4
local v6 = {
    ["name"] = "Flaming Fox",
    ["image"] = "rbxassetid://16088265753",
    ["model"] = "FireDimension2024FlamingFox",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Fire Dimension",
        ["year"] = 2024,
        ["origin_items"] = { "fire_dimension_2024_burnt_bites_bait", "fire_dimension_2024_baked_alaska_bait" }
    },
    ["anims"] = {
        ["sleep"] = "FireDimension2024FlamingFoxSleep",
        ["running"] = "FireDimension2024FlamingFoxRun",
        ["idle"] = "FireDimension2024FlamingFoxIdle",
        ["eating"] = "FireDimension2024FlamingFoxEat",
        ["sit"] = "FireDimension2024FlamingFoxSit",
        ["flying"] = "FireDimension2024FlamingFoxRun",
        ["hold"] = "FireDimension2024FlamingFoxBeingHeldSingle",
        ["double_hold"] = "FireDimension2024FlamingFoxBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "FireDimension2024FlamingFoxSit" },
        { "Joyful", "FireDimension2024FlamingFoxJoyful" },
        { "Beg", "FireDimension2024FlamingFoxBeg" },
        { "Jump", "FireDimension2024FlamingFoxJump" },
        { "Trick 1", "FireDimension2024FlamingFoxTrick1" },
        { "Trick 2", "FireDimension2024FlamingFoxTrick2" }
    }
}
local v7 = {
    ["Nose"] = Color3.fromRGB(9, 137, 207),
    ["Tail2"] = Color3.fromRGB(36, 89, 188),
    ["Torso3"] = {
        ["Color"] = Color3.fromRGB(9, 137, 207),
        ["Transparency"] = 0.2
    },
    ["Torso4"] = Color3.fromRGB(177, 167, 255),
    ["Tail4"] = {
        ["Color"] = Color3.fromRGB(9, 137, 207),
        ["Transparency"] = 0.2
    },
    ["Tail3"] = Color3.fromRGB(2, 155, 189),
    ["Tail5"] = Color3.fromRGB(177, 167, 255),
    ["Tail"] = Color3.fromRGB(61, 80, 185),
    ["LeftEar3"] = {
        ["Color"] = Color3.fromRGB(177, 167, 255),
        ["Transparency"] = 0
    },
    ["RightEar3"] = {
        ["Color"] = Color3.fromRGB(177, 167, 255),
        ["Transparency"] = 0
    },
    ["RightEar2"] = {
        ["Color"] = Color3.fromRGB(9, 137, 207),
        ["Transparency"] = 0.35
    },
    ["LeftEar2"] = {
        ["Color"] = Color3.fromRGB(9, 137, 207),
        ["Transparency"] = 0.35
    },
    ["RightFrontFoot"] = Color3.fromRGB(9, 137, 207),
    ["LeftFrontFoot"] = Color3.fromRGB(9, 137, 207),
    ["RightBackFoot"] = Color3.fromRGB(9, 137, 207),
    ["LeftBackFoot"] = Color3.fromRGB(9, 137, 207)
}
v6.neon_parts = v7
v2.fire_dimension_2024_flaming_fox = v6
local v8 = {
    ["name"] = "Volcanic Rhino",
    ["image"] = "rbxassetid://16088264958",
    ["model"] = "FireDimension2024VolcanicRhino",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Fire Dimension",
        ["year"] = 2024,
        ["origin_items"] = { "fire_dimension_2024_burnt_bites_bait", "fire_dimension_2024_baked_alaska_bait" }
    },
    ["anims"] = {
        ["sleep"] = "FireDimension2024VolcanicRhinoSleep",
        ["running"] = "FireDimension2024VolcanicRhinoRun",
        ["idle"] = "FireDimension2024VolcanicRhinoIdle",
        ["eating"] = "FireDimension2024VolcanicRhinoEat",
        ["sit"] = "FireDimension2024VolcanicRhinoSit",
        ["flying"] = "FireDimension2024VolcanicRhinoRun",
        ["hold"] = "FireDimension2024VolcanicRhinoBeingHeldSingle",
        ["double_hold"] = "FireDimension2024VolcanicRhinoBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "FireDimension2024VolcanicRhinoSit" },
        { "Joyful", "FireDimension2024VolcanicRhinoJoyful" },
        { "Beg", "FireDimension2024VolcanicRhinoBeg" },
        { "Jump", "FireDimension2024VolcanicRhinoJump" },
        { "Trick 1", "FireDimension2024VolcanicRhinoTrick1" },
        { "Trick 2", "FireDimension2024VolcanicRhinoTrick2" }
    },
    ["neon_parts"] = {
        ["FrontRightFoot2"] = Color3.fromRGB(73, 114, 226),
        ["BackLeftFoot2"] = Color3.fromRGB(73, 114, 226),
        ["LeftEar2"] = Color3.fromRGB(73, 114, 226),
        ["RightEar2"] = Color3.fromRGB(73, 114, 226),
        ["FrontLeftFoot2"] = Color3.fromRGB(73, 114, 226),
        ["BackRightFoot2"] = Color3.fromRGB(73, 114, 226),
        ["Torso2"] = Color3.fromRGB(73, 114, 226),
        ["Head2"] = Color3.fromRGB(73, 114, 226),
        ["Nose2"] = Color3.fromRGB(73, 114, 226),
        ["Nose3"] = Color3.fromRGB(73, 114, 226),
        ["Eyes"] = Color3.fromRGB(73, 114, 226)
    }
}
v2.fire_dimension_2024_volcanic_rhino = v8
local v9 = {
    ["name"] = "Ornate Horned Frog",
    ["image"] = "rbxassetid://16369178617",
    ["model"] = "FireDimension2024OrnateHornedFrog",
    ["rarity"] = "ultra_rare",
    ["cost"] = 1500,
    ["origin_entry"] = {
        ["origin"] = "Fire Dimension",
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "FireDimension2024OrnateHornedFrogSleep",
        ["running"] = "FireDimension2024OrnateHornedFrogRun",
        ["idle"] = "FireDimension2024OrnateHornedFrogIdle",
        ["eating"] = "FireDimension2024OrnateHornedFrogEat",
        ["sit"] = "FireDimension2024OrnateHornedFrogSit",
        ["flying"] = "FireDimension2024OrnateHornedFrogFly",
        ["hold"] = "FireDimension2024OrnateHornedFrogBeingHeldSingle",
        ["double_hold"] = "FireDimension2024OrnateHornedFrogBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "FireDimension2024OrnateHornedFrogSit" },
        { "Joyful", "FireDimension2024OrnateHornedFrogJoyful" },
        { "Beg", "FireDimension2024OrnateHornedFrogBeg" },
        { "Jump", "FireDimension2024OrnateHornedFrogJump" },
        { "Trick 1", "FireDimension2024OrnateHornedFrogTrick1" },
        { "Trick 2", "FireDimension2024OrnateHornedFrogTrick2" }
    },
    ["neon_parts"] = {
        ["Body2"] = Color3.fromRGB(186, 61, 79),
        ["Head2"] = Color3.fromRGB(186, 61, 79),
        ["Body3"] = Color3.fromRGB(186, 61, 79)
    }
}
v2.fire_dimension_2024_ornate_horned_frog = v9
return v1(v2)