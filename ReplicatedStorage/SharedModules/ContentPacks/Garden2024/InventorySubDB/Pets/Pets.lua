--// ReplicatedStorage.SharedModules.ContentPacks.Garden2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Mushroom Friend",
    ["model"] = "Garden2024MushroomFriend",
    ["image"] = "rbxassetid://17119623510",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Garden",
        ["origin_items"] = { "garden_2024_egg" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Garden2024MushroomFriendSleep",
        ["running"] = "Garden2024MushroomFriendRun",
        ["idle"] = "Garden2024MushroomFriendIdle",
        ["eating"] = "Garden2024MushroomFriendEat",
        ["sit"] = "Garden2024MushroomFriendSit",
        ["flying"] = "Garden2024MushroomFriendRun",
        ["hold"] = "Garden2024MushroomFriendBeingHeldSingle",
        ["double_hold"] = "Garden2024MushroomFriendBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Garden2024MushroomFriendSit" },
        { "Joyful", "Garden2024MushroomFriendJoyful" },
        { "Beg", "Garden2024MushroomFriendBeg" },
        { "Jump", "Garden2024MushroomFriendJump" },
        { "Trick 1", "Garden2024MushroomFriendTrick1" },
        { "Trick 2", "Garden2024MushroomFriendTrick2" }
    },
    ["neon_parts"] = {
        ["Fungus2"] = Color3.fromRGB(69, 186, 98),
        ["Fungus3"] = Color3.fromRGB(69, 186, 98),
        ["Fungus4"] = Color3.fromRGB(69, 186, 98)
    }
}
v2.garden_2024_mushroom_friend = v3
local v4 = {
    ["name"] = "Praying Mantis",
    ["model"] = "Garden2024PrayingMantis",
    ["image"] = "rbxassetid://17120012859",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Garden",
        ["origin_items"] = { "garden_2024_egg" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Garden2024PrayingMantisSleep",
        ["running"] = "Garden2024PrayingMantisRun",
        ["idle"] = "Garden2024PrayingMantisIdle",
        ["eating"] = "Garden2024PrayingMantisEat",
        ["sit"] = "Garden2024PrayingMantisSit",
        ["flying"] = "Garden2024PrayingMantisRun",
        ["hold"] = "Garden2024PrayingMantisBeingHeldSingle",
        ["double_hold"] = "Garden2024PrayingMantisBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Garden2024PrayingMantisSit" },
        { "Joyful", "Garden2024PrayingMantisJoyful" },
        { "Beg", "Garden2024PrayingMantisBeg" },
        { "Jump", "Garden2024PrayingMantisJump" },
        { "Trick 1", "Garden2024PrayingMantisTrick1" },
        { "Trick 2", "Garden2024PrayingMantisTrick2" }
    },
    ["neon_parts"] = {
        ["Torso"] = Color3.fromRGB(103, 50, 188),
        ["AntennaL1"] = Color3.fromRGB(103, 50, 188)
    }
}
v2.garden_2024_praying_mantis = v4
local v5 = {
    ["name"] = "Rosy Maple Moth",
    ["model"] = "Garden2024RosyMapleMoth",
    ["image"] = "rbxassetid://17120184484",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Garden",
        ["origin_items"] = { "garden_2024_egg" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Garden2024RosyMapleMothSleep",
        ["running"] = "Garden2024RosyMapleMothRun",
        ["idle"] = "Garden2024RosyMapleMothIdle",
        ["eating"] = "Garden2024RosyMapleMothEat",
        ["sit"] = "Garden2024RosyMapleMothSit",
        ["flying"] = "Garden2024RosyMapleMothRun",
        ["hold"] = "Garden2024RosyMapleMothBeingHeldSingle",
        ["double_hold"] = "Garden2024RosyMapleMothBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Garden2024RosyMapleMothSit" },
        { "Joyful", "Garden2024RosyMapleMothJoyful" },
        { "Beg", "Garden2024RosyMapleMothBeg" },
        { "Jump", "Garden2024RosyMapleMothJump" },
        { "Trick 1", "Garden2024RosyMapleMothTrick1" },
        { "Trick 2", "Garden2024RosyMapleMothTrick2" }
    },
    ["neon_parts"] = {
        ["LeftAntenna"] = Color3.new(142, 95, 189),
        ["RightAntenna"] = Color3.new(142, 95, 189),
        ["LeftWing3"] = Color3.new(142, 95, 189),
        ["RightWing3"] = Color3.new(142, 95, 189),
        ["Torso2"] = Color3.new(142, 95, 189)
    },
    ["already_has_flying_wings"] = true,
    ["head_rotator_disabled"] = true
}
v2.garden_2024_rosy_maple_moth = v5
local v6 = {
    ["name"] = "Garden Snake",
    ["model"] = "Garden2024GardenSnake",
    ["image"] = "rbxassetid://17174085645",
    ["rarity"] = "common",
    ["origin_entry"] = {
        ["origin"] = "Garden",
        ["origin_items"] = { "garden_2024_egg" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Garden2024GardenSnakeSleep",
        ["running"] = "Garden2024GardenSnakeRun",
        ["idle"] = "Garden2024GardenSnakeIdle",
        ["eating"] = "Garden2024GardenSnakeEat",
        ["sit"] = "Garden2024GardenSnakeSit",
        ["flying"] = "Garden2024GardenSnakeRun",
        ["hold"] = "Garden2024GardenSnakeBeingHeldSingle",
        ["double_hold"] = "Garden2024GardenSnakeBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Garden2024GardenSnakeSit" },
        { "Joyful", "Garden2024GardenSnakeJoyful" },
        { "Beg", "Garden2024GardenSnakeBeg" },
        { "Jump", "Garden2024GardenSnakeJump" },
        { "Trick 1", "Garden2024GardenSnakeTrick1" },
        { "Trick 2", "Garden2024GardenSnakeTrick2" }
    },
    ["neon_parts"] = {
        ["Torso21"] = Color3.fromRGB(186, 124, 83),
        ["Head2"] = Color3.fromRGB(186, 124, 83)
    },
    ["interaction_part_name"] = "InteractionPart"
}
v2.garden_2024_garden_snake = v6
local v7 = {
    ["name"] = "Blue Jay",
    ["model"] = "Garden2024BlueJay",
    ["image"] = "rbxassetid://17163957321",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Garden",
        ["origin_items"] = { "garden_2024_egg" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Garden2024BlueJaySleep",
        ["running"] = "Garden2024BlueJayRun",
        ["idle"] = "Garden2024BlueJayIdle",
        ["eating"] = "Garden2024BlueJayEat",
        ["sit"] = "Garden2024BlueJaySit",
        ["flying"] = "Garden2024BlueJayRun",
        ["hold"] = "Garden2024BlueJayBeingHeldSingle",
        ["double_hold"] = "Garden2024BlueJayBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Garden2024BlueJaySit" },
        { "Joyful", "Garden2024BlueJayJoyful" },
        { "Beg", "Garden2024BlueJayBeg" },
        { "Jump", "Garden2024BlueJayJump" },
        { "Trick 1", "Garden2024BlueJayTrick1" },
        { "Trick 2", "Garden2024BlueJayTrick2" }
    },
    ["neon_parts"] = {
        ["Tail2"] = Color3.fromRGB(103, 144, 184),
        ["Tail3"] = Color3.fromRGB(103, 144, 184),
        ["Torso"] = Color3.fromRGB(103, 144, 184),
        ["RightWing3"] = Color3.fromRGB(103, 144, 184),
        ["LeftWing3"] = Color3.fromRGB(103, 144, 184)
    },
    ["already_has_flying_wings"] = true
}
v2.garden_2024_blue_jay = v7
local v8 = {
    ["name"] = "Skunk",
    ["model"] = "Garden2024Skunk",
    ["image"] = "rbxassetid://17174216294",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Garden",
        ["origin_items"] = { "garden_2024_egg" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Garden2024SkunkSleep",
        ["running"] = "Garden2024SkunkRun",
        ["idle"] = "Garden2024SkunkIdle",
        ["eating"] = "Garden2024SkunkEat",
        ["sit"] = "Garden2024SkunkSit",
        ["flying"] = "Garden2024SkunkRun",
        ["hold"] = "Garden2024SkunkBeingHeldSingle",
        ["double_hold"] = "Garden2024SkunkBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Garden2024SkunkSit" },
        { "Joyful", "Garden2024SkunkJoyful" },
        { "Beg", "Garden2024SkunkBeg" },
        { "Jump", "Garden2024SkunkJump" },
        { "Trick 1", "Garden2024SkunkTrick1" },
        { "Trick 2", "Garden2024SkunkTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(98, 169, 185),
        ["Head4"] = Color3.fromRGB(98, 169, 185),
        ["Torso2"] = Color3.fromRGB(98, 169, 185),
        ["Tail2"] = Color3.fromRGB(98, 169, 185),
        ["Tail3"] = Color3.fromRGB(98, 169, 185)
    }
}
v2.garden_2024_skunk = v8
local v9 = {
    ["name"] = "Golden Tortoise Beetle",
    ["model"] = "Garden2024GoldenTortoiseBeetle",
    ["image"] = "rbxassetid://17174656536",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Garden",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Garden2024GoldenTortoiseBeetleSleep",
        ["running"] = "Garden2024GoldenTortoiseBeetleRun",
        ["idle"] = "Garden2024GoldenTortoiseBeetleIdle",
        ["eating"] = "Garden2024GoldenTortoiseBeetleEat",
        ["sit"] = "Garden2024GoldenTortoiseBeetleSit",
        ["flying"] = "Garden2024GoldenTortoiseBeetleRun",
        ["hold"] = "Garden2024GoldenTortoiseBeetleBeingHeldSingle",
        ["double_hold"] = "Garden2024GoldenTortoiseBeetleBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Garden2024GoldenTortoiseBeetleSit" },
        { "Joyful", "Garden2024GoldenTortoiseBeetleJoyful" },
        { "Beg", "Garden2024GoldenTortoiseBeetleBeg" },
        { "Jump", "Garden2024GoldenTortoiseBeetleJump" },
        { "Trick 1", "Garden2024GoldenTortoiseBeetleTrick1" },
        { "Trick 2", "Garden2024GoldenTortoiseBeetleTrick2" }
    }
}
local v10 = {
    ["Torso"] = Color3.fromRGB(226, 101, 29),
    ["Shell2"] = {
        ["Color"] = Color3.fromRGB(255, 135, 66),
        ["Transparency"] = 0.9
    },
    ["Shell3"] = {
        ["Color"] = Color3.fromRGB(255, 210, 74),
        ["Transparency"] = 0.9
    },
    ["Head2"] = Color3.fromRGB(226, 101, 29)
}
v9.neon_parts = v10
v2.garden_2024_golden_tortoise_beetle = v9
local v11 = {
    ["name"] = "Mole",
    ["model"] = "Garden2024Mole",
    ["image"] = "rbxassetid://17183022910",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Garden",
        ["origin_items"] = { "garden_2024_egg" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Garden2024MoleSleep",
        ["running"] = "Garden2024MoleRun",
        ["idle"] = "Garden2024MoleIdle",
        ["eating"] = "Garden2024MoleEat",
        ["sit"] = "Garden2024MoleSit",
        ["flying"] = "Garden2024MoleRun",
        ["hold"] = "Garden2024MoleBeingHeldSingle",
        ["double_hold"] = "Garden2024MoleBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Garden2024MoleSit" },
        { "Joyful", "Garden2024MoleJoyful" },
        { "Beg", "Garden2024MoleBeg" },
        { "Jump", "Garden2024MoleJump" },
        { "Trick 1", "Garden2024MoleTrick1" },
        { "Trick 2", "Garden2024MoleTrick2" }
    },
    ["neon_parts"] = {
        ["Nose"] = Color3.fromRGB(184, 92, 63),
        ["Head"] = Color3.fromRGB(184, 92, 63),
        ["Head2"] = Color3.fromRGB(184, 92, 63),
        ["Torso2"] = Color3.fromRGB(184, 92, 63)
    }
}
v2.garden_2024_mole = v11
local v12 = {
    ["name"] = "Weevil",
    ["model"] = "Garden2024Weevil",
    ["image"] = "rbxassetid://17255807019",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Garden",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Garden2024WeevilSleep",
        ["running"] = "Garden2024WeevilRun",
        ["idle"] = "Garden2024WeevilIdle",
        ["eating"] = "Garden2024WeevilEat",
        ["sit"] = "Garden2024WeevilSit",
        ["flying"] = "Garden2024WeevilRun",
        ["hold"] = "Garden2024WeevilBeingHeldSingle",
        ["double_hold"] = "Garden2024WeevilBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Garden2024WeevilSit" },
        { "Joyful", "Garden2024WeevilJoyful" },
        { "Beg", "Garden2024WeevilBeg" },
        { "Jump", "Garden2024WeevilJump" },
        { "Trick 1", "Garden2024WeevilTrick1" },
        { "Trick 2", "Garden2024WeevilTrick2" }
    },
    ["neon_parts"] = {
        ["Torso2"] = Color3.fromRGB(188, 115, 32),
        ["Torso4"] = Color3.fromRGB(188, 115, 32)
    }
}
v2.garden_2024_weevil = v12
local v13 = {
    ["name"] = "Garden Egg",
    ["image"] = "rbxassetid://17183502626",
    ["model"] = "Garden2024Egg",
    ["rarity"] = "legendary",
    ["cost"] = 750,
    ["origin_entry"] = {
        ["origin"] = "Garden",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "Garden2024EggIdle",
        ["running"] = "Garden2024EggRun",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 5
}
v2.garden_2024_egg = v13
return v1(v2)