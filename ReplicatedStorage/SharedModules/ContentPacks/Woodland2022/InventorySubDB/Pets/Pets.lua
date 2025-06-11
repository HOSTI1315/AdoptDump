--// ReplicatedStorage.SharedModules.ContentPacks.Woodland2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Bullfrog",
    ["image"] = "rbxassetid://8938703774",
    ["model"] = "Woodland2022Bullfrog",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Woodland Egg",
        ["origin_items"] = { "woodland_2022_woodland_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "BullfrogBeingHeldDouble",
        ["eating"] = "BullfrogEat",
        ["hold"] = "BullfrogBeingHeldSingle",
        ["idle"] = "BullfrogIdle",
        ["running"] = "BullfrogRun",
        ["sit"] = "BullfrogSit",
        ["sleep"] = "BullfrogSleep"
    },
    ["tricks"] = {
        { "Sit", "BullfrogSit" },
        { "Joyful", "BullfrogJoyful" },
        { "Beg", "BullfrogBeg" },
        { "Jump", "BullfrogJump" },
        { "Trick 1", "BullfrogTrick1" },
        { "Trick 2", "BullfrogTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(104, 87, 191),
        ["Torso2"] = Color3.fromRGB(104, 87, 191)
    }
}
v2.woodland_2022_bullfrog = v3
local v4 = {
    ["name"] = "Fallow Deer",
    ["image"] = "rbxassetid://8938703243",
    ["model"] = "Woodland2022FallowDeer",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Woodland Egg",
        ["origin_items"] = { "woodland_2022_woodland_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "FallowDeerBeingHeldDouble",
        ["eating"] = "FallowDeerEat",
        ["hold"] = "FallowDeerBeingHeldSingle",
        ["idle"] = "FallowDeerIdle",
        ["running"] = "FallowDeerRun",
        ["sit"] = "FallowDeerSit",
        ["sleep"] = "FallowDeerSleep"
    },
    ["tricks"] = {
        { "Sit", "FallowDeerSit" },
        { "Joyful", "FallowDeerJoyful" },
        { "Beg", "FallowDeerBeg" },
        { "Jump", "FallowDeerJump" },
        { "Trick 1", "FallowDeerTrick1" },
        { "Trick 2", "FallowDeerTrick2" }
    },
    ["neon_parts"] = {
        ["Antlers"] = Color3.fromRGB(110, 150, 93),
        ["Head2"] = Color3.fromRGB(110, 150, 93),
        ["Head3"] = Color3.fromRGB(110, 150, 93),
        ["Tail2"] = Color3.fromRGB(110, 150, 93),
        ["Torso2"] = Color3.fromRGB(110, 150, 93),
        ["Torso3"] = Color3.fromRGB(110, 150, 93),
        ["Torso4"] = Color3.fromRGB(110, 150, 93)
    }
}
v2.woodland_2022_fallow_deer = v4
local v5 = {
    ["name"] = "Hawk",
    ["image"] = "rbxassetid://8938702589",
    ["model"] = "Woodland2022Hawk",
    ["rarity"] = "legendary"
}
local v6 = {
    ["origin"] = "Woodland Egg",
    ["origin_items"] = { "woodland_2022_woodland_egg" },
    ["viewport_override"] = {
        ["distance"] = 5,
        ["offset"] = CFrame.new(0, 0, 0)
    },
    ["year"] = 2022
}
v5.origin_entry = v6
v5.anims = {
    ["double_hold"] = "HawkBeingHeldDouble",
    ["eating"] = "HawkEat",
    ["hold"] = "HawkBeingHeldSingle",
    ["idle"] = "HawkIdle",
    ["running"] = "HawkRun",
    ["sit"] = "HawkSit",
    ["sleep"] = "HawkSleep"
}
v5.tricks = {
    { "Sit", "HawkSit" },
    { "Joyful", "HawkJoyful" },
    { "Beg", "HawkBeg" },
    { "Jump", "HawkJump" },
    { "Trick 1", "HawkTrick1" },
    { "Trick 2", "HawkTrick2" }
}
v5.neon_parts = {
    ["Torso2"] = Color3.fromRGB(184, 159, 111)
}
v5.already_has_flying_wings = true
v5.minimum_run_anim_speed = 0.5
v2.woodland_2022_hawk = v5
local v7 = {
    ["name"] = "Pine Marten",
    ["image"] = "rbxassetid://8938702150",
    ["model"] = "Woodland2022PineMarten",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Woodland Egg",
        ["origin_items"] = { "woodland_2022_woodland_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "PineMartenBeingHeldDouble",
        ["eating"] = "PineMartenEat",
        ["hold"] = "PineMartenBeingHeldSingle",
        ["idle"] = "PineMartenIdle",
        ["running"] = "PineMartenRun",
        ["sit"] = "PineMartenSit",
        ["sleep"] = "PineMartenSleep"
    },
    ["tricks"] = {
        { "Sit", "PineMartenSit" },
        { "Joyful", "PineMartenJoyful" },
        { "Beg", "PineMartenBeg" },
        { "Jump", "PineMartenJump" },
        { "Trick 1", "PineMartenTrick1" },
        { "Trick 2", "PineMartenTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(170, 85, 0),
        ["BackRightFoot"] = Color3.fromRGB(170, 85, 0),
        ["FrontLeftFoot"] = Color3.fromRGB(170, 85, 0),
        ["FrontRightFoot"] = Color3.fromRGB(170, 85, 0),
        ["Fur"] = Color3.fromRGB(170, 85, 0),
        ["Torso2"] = Color3.fromRGB(170, 85, 0)
    }
}
v2.woodland_2022_pine_marten = v7
local v8 = {
    ["name"] = "Red Cardinal",
    ["image"] = "rbxassetid://8938701683",
    ["model"] = "Woodland2022RedCardinal",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Woodland Egg",
        ["origin_items"] = { "woodland_2022_woodland_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "CardinalBeingHeldDouble",
        ["eating"] = "CardinalEat",
        ["hold"] = "CardinalBeingHeldSingle",
        ["idle"] = "CardinalIdle",
        ["running"] = "CardinalRun",
        ["sit"] = "CardinalSit",
        ["sleep"] = "CardinalSleep"
    },
    ["tricks"] = {
        { "Sit", "CardinalSit" },
        { "Joyful", "CardinalJoyful" },
        { "Beg", "CardinalBeg" },
        { "Jump", "CardinalJump" },
        { "Trick 1", "CardinalTrick1" },
        { "Trick 2", "CardinalTrick2" }
    },
    ["neon_parts"] = {
        ["LeftWing2"] = Color3.fromRGB(97, 114, 191),
        ["RightWing2"] = Color3.fromRGB(97, 114, 191),
        ["Tail2"] = Color3.fromRGB(97, 114, 191),
        ["Tail4"] = Color3.fromRGB(97, 114, 191)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_run_anim_speed"] = 0.5
}
v2.woodland_2022_red_cardinal = v8
local v9 = {
    ["name"] = "Red Fox",
    ["image"] = "rbxassetid://8969010905",
    ["model"] = "Woodland2022RedFox",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Woodland Egg",
        ["origin_items"] = { "woodland_2022_woodland_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "RedFoxBeingHeldDouble",
        ["eating"] = "RedFoxEat",
        ["hold"] = "RedFoxBeingHeldSingle",
        ["idle"] = "RedFoxIdle",
        ["running"] = "RedFoxRun",
        ["sit"] = "RedFoxSit",
        ["sleep"] = "RedFoxSleep"
    },
    ["tricks"] = {
        { "Sit", "RedFoxSit" },
        { "Joyful", "RedFoxJoyful" },
        { "Beg", "RedFoxBeg" },
        { "Jump", "RedFoxJump" },
        { "Trick 1", "RedFoxTrick1" },
        { "Trick 2", "RedFoxTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(184, 110, 161),
        ["LeftEar2"] = Color3.fromRGB(184, 110, 161),
        ["RightEar2"] = Color3.fromRGB(184, 110, 161),
        ["Tail2"] = Color3.fromRGB(184, 110, 161),
        ["Torso2"] = Color3.fromRGB(184, 110, 161)
    }
}
v2.woodland_2022_red_fox = v9
local v10 = {
    ["name"] = "Salamander",
    ["image"] = "rbxassetid://8939633862",
    ["model"] = "Woodland2022Salamander",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Woodland Egg",
        ["origin_items"] = { "woodland_2022_woodland_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "SalamanderBeingHeldDouble",
        ["eating"] = "SalamanderEat",
        ["hold"] = "SalamanderBeingHeldSingle",
        ["idle"] = "SalamanderIdle",
        ["running"] = "SalamanderRun",
        ["sit"] = "SalamanderSit",
        ["sleep"] = "SalamanderSleep"
    },
    ["tricks"] = {
        { "Sit", "SalamanderSit" },
        { "Joyful", "SalamanderJoyful" },
        { "Beg", "SalamanderBeg" },
        { "Jump", "SalamanderJump" },
        { "Trick 1", "SalamanderTrick1" },
        { "Trick 2", "SalamanderTrick2" }
    },
    ["neon_parts"] = {
        ["Stripes"] = Color3.fromRGB(238, 91, 243),
        ["Torso2"] = Color3.fromRGB(238, 91, 243)
    }
}
v2.woodland_2022_salamander = v10
local v11 = {
    ["name"] = "Woodland Egg",
    ["image"] = "rbxassetid://8972175010",
    ["model"] = "Woodland2022WoodlandEgg",
    ["rarity"] = "legendary",
    ["cost"] = 750,
    ["origin_entry"] = {
        ["origin"] = "Woodland Egg",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "WoodlandEggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "WoodlandEggBeingSingleHeld",
        ["idle"] = "WoodlandEggIdle",
        ["running"] = "WoodlandEggRun",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 6
}
v2.woodland_2022_woodland_egg = v11
local v12 = {
    ["name"] = "Woodpecker",
    ["image"] = "rbxassetid://8938701212",
    ["model"] = "Woodland2022Woodpecker",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Woodland Egg",
        ["origin_items"] = { "woodland_2022_woodland_egg" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "WoodpeckerBeingHeldDouble",
        ["eating"] = "WoodpeckerEat",
        ["hold"] = "WoodpeckerBeingHeldSingle",
        ["idle"] = "WoodpeckerIdle",
        ["running"] = "WoodpeckerRun",
        ["sit"] = "WoodpeckerSit",
        ["sleep"] = "WoodpeckerSleep"
    },
    ["tricks"] = {
        { "Sit", "WoodpeckerSit" },
        { "Joyful", "WoodpeckerJoyful" },
        { "Beg", "WoodpeckerBeg" },
        { "Jump", "WoodpeckerJump" },
        { "Trick 1", "WoodpeckerTrick1" },
        { "Trick 2", "WoodpeckerTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(110, 185, 91),
        ["LWing2"] = Color3.fromRGB(110, 185, 91),
        ["LeftFoot"] = Color3.fromRGB(110, 185, 91),
        ["RWing2"] = Color3.fromRGB(110, 185, 91),
        ["RightFoot"] = Color3.fromRGB(110, 185, 91)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_run_anim_speed"] = 0.5
}
v2.woodland_2022_woodpecker = v12
return v1(v2)