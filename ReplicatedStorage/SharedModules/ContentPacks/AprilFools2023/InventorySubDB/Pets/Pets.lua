--// ReplicatedStorage.SharedModules.ContentPacks.AprilFools2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Fool Egg",
    ["image"] = "rbxassetid://12733311267",
    ["model"] = "AprilFools2023FoolEgg",
    ["rarity"] = "legendary",
    ["cost"] = 1000,
    ["origin_entry"] = {
        ["origin"] = "April Fools",
        ["origin_items"] = {},
        ["year"] = 2023
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
    ["generate_npc_furniture_on_runtime"] = true
}
v2.april_fools_2023_fool_egg = v3
local v4 = {
    ["name"] = "Pudding Cat",
    ["image"] = "rbxassetid://12779257292",
    ["model"] = "AprilFools2023PuddingCat",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "April Fools",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "AprilFools2023PuddingCatBeingHeldDouble",
        ["eating"] = "AprilFools2023PuddingCatEat",
        ["hold"] = "AprilFools2023PuddingCatBeingHeldSingle",
        ["idle"] = "AprilFools2023PuddingCatIdle",
        ["running"] = "AprilFools2023PuddingCatRun",
        ["sit"] = "AprilFools2023PuddingCatSit",
        ["sleep"] = "AprilFools2023PuddingCatSleep"
    },
    ["tricks"] = {
        { "Sit", "AprilFools2023PuddingCatSit" },
        { "Joyful", "AprilFools2023PuddingCatJoyful" },
        { "Beg", "AprilFools2023PuddingCatBeg" },
        { "Jump", "AprilFools2023PuddingCatJump" },
        { "Trick 1", "AprilFools2023PuddingCatTrick1" },
        { "Trick 2", "AprilFools2023PuddingCatTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(102, 186, 136),
        ["BackRightFoot"] = Color3.fromRGB(102, 186, 136),
        ["FrontLeftFoot"] = Color3.fromRGB(102, 186, 136),
        ["FrontRightFoot"] = Color3.fromRGB(102, 186, 136),
        ["Head3"] = Color3.fromRGB(102, 186, 136),
        ["Head4"] = Color3.fromRGB(102, 186, 136),
        ["Torso4"] = Color3.fromRGB(102, 186, 136)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.8
}
v2.april_fools_2023_pudding_cat = v4
local v5 = {
    ["name"] = "Sprout Snail",
    ["image"] = "rbxassetid://12779130089",
    ["model"] = "AprilFools2023SproutSnail",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "April Fools",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "AprilFools2023SproutSnailBeingHeldDouble",
        ["eating"] = "AprilFools2023SproutSnailEat",
        ["hold"] = "AprilFools2023SproutSnailBeingHeldSingle",
        ["idle"] = "AprilFools2023SproutSnailIdle",
        ["running"] = "AprilFools2023SproutSnailRun",
        ["sit"] = "AprilFools2023SproutSnailSit",
        ["sleep"] = "AprilFools2023SproutSnailSleep"
    },
    ["tricks"] = {
        { "Sit", "AprilFools2023SproutSnailSit" },
        { "Joyful", "AprilFools2023SproutSnailJoyful" },
        { "Beg", "AprilFools2023SproutSnailBeg" },
        { "Jump", "AprilFools2023SproutSnailJump" },
        { "Trick 1", "AprilFools2023SproutSnailTrick1" },
        { "Trick 2", "AprilFools2023SproutSnailTrick2" }
    },
    ["neon_parts"] = {
        ["BodyLeaves"] = Color3.fromRGB(55, 114, 186),
        ["HeadLeaf"] = Color3.fromRGB(55, 114, 186),
        ["Torso2"] = Color3.fromRGB(55, 114, 186)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.8
}
v2.april_fools_2023_sprout_snail = v5
local v6 = {
    ["name"] = "Ti\195\179 De Nadal",
    ["image"] = "rbxassetid://12732812236",
    ["model"] = "AprilFools2023TioDeNadal",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "April Fools",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "AprilFools2023TioDeNadalBeingHeldDouble",
        ["eating"] = "AprilFools2023TioDeNadalEat",
        ["hold"] = "AprilFools2023TioDeNadalBeingHeldSingle",
        ["idle"] = "AprilFools2023TioDeNadalIdle",
        ["running"] = "AprilFools2023TioDeNadalRun",
        ["sit"] = "AprilFools2023TioDeNadalSit",
        ["sleep"] = "AprilFools2023TioDeNadalSleep"
    },
    ["tricks"] = {
        { "Sit", "AprilFools2023TioDeNadalSit" },
        { "Joyful", "AprilFools2023TioDeNadalJoyful" },
        { "Beg", "AprilFools2023TioDeNadalBeg" },
        { "Jump", "AprilFools2023TioDeNadalJump" },
        { "Trick 1", "AprilFools2023TioDeNadalTrick1" },
        { "Trick 2", "AprilFools2023TioDeNadalTrick2" }
    },
    ["neon_parts"] = {
        ["Hat2"] = Color3.fromRGB(191, 91, 88),
        ["Head"] = Color3.fromRGB(191, 91, 88),
        ["Head3"] = Color3.fromRGB(191, 91, 88),
        ["Torso2"] = Color3.fromRGB(191, 91, 88)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.8
}
v2.april_fools_2023_tio_de_nadal = v6
local v7 = {
    ["name"] = "Yule Log Dog",
    ["image"] = "rbxassetid://12778919221",
    ["model"] = "AprilFools2023YuleLogDog",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "April Fools",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "AprilFools2023YuleLogDogBeingHeldDouble",
        ["eating"] = "AprilFools2023YuleLogDogEat",
        ["hold"] = "AprilFools2023YuleLogDogBeingHeldSingle",
        ["idle"] = "AprilFools2023YuleLogDogIdle",
        ["running"] = "AprilFools2023YuleLogDogRun",
        ["sit"] = "AprilFools2023YuleLogDogSit",
        ["sleep"] = "AprilFools2023YuleLogDogSleep"
    },
    ["tricks"] = {
        { "Sit", "AprilFools2023YuleLogDogSit" },
        { "Joyful", "AprilFools2023YuleLogDogJoyful" },
        { "Beg", "AprilFools2023YuleLogDogBeg" },
        { "Jump", "AprilFools2023YuleLogDogJump" },
        { "Trick 1", "AprilFools2023YuleLogDogTrick1" },
        { "Trick 2", "AprilFools2023YuleLogDogTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(186, 102, 69),
        ["BackRightFoot"] = Color3.fromRGB(186, 102, 69),
        ["FrontLeftFoot"] = Color3.fromRGB(186, 102, 69),
        ["FrontRightFoot"] = Color3.fromRGB(186, 102, 69),
        ["LeftEar"] = Color3.fromRGB(186, 102, 69),
        ["LeftEar2"] = Color3.fromRGB(186, 102, 69),
        ["RightEar"] = Color3.fromRGB(186, 102, 69),
        ["RightEar2"] = Color3.fromRGB(186, 102, 69),
        ["Tail"] = Color3.fromRGB(186, 102, 69),
        ["Tongue"] = Color3.fromRGB(186, 102, 69),
        ["Torso2"] = Color3.fromRGB(186, 102, 69)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.8
}
v2.april_fools_2023_yule_log_dog = v7
return v1(v2)