--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2025.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Blossom Snake",
    ["model"] = "Lunar2025BlossomSnake",
    ["image"] = "rbxassetid://122365328950491",
    ["rarity"] = "rare",
    ["cost"] = 40,
    ["currency_id"] = "stars_2025",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["year"] = 2025
    },
    ["anims"] = {
        ["sleep"] = "Lunar2025BlossomSnakeSleep",
        ["running"] = "Lunar2025SnakeRun",
        ["idle"] = "Lunar2025SnakeIdle",
        ["eating"] = "Lunar2025BlossomSnakeEat",
        ["sit"] = "Lunar2025BlossomSnakeSit",
        ["flying"] = "Lunar2025SnakeRun",
        ["hold"] = "Lunar2025SnakeBeingHeldSingle",
        ["double_hold"] = "Lunar2025SnakeBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Lunar2025BlossomSnakeSit" },
        { "Joyful", "Lunar2025SnakeJoyful" },
        { "Beg", "Lunar2025SnakeBeg" },
        { "Jump", "Lunar2025BlossomSnakeJump" },
        { "Trick 1", "Lunar2025SnakeTrick3" },
        { "Trick 2", "Lunar2025SnakeTrick4" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(182, 138, 174),
        ["Torso4"] = Color3.fromRGB(182, 138, 174),
        ["RightPetalB"] = Color3.fromRGB(177, 151, 130),
        ["LeftPetalA"] = Color3.fromRGB(177, 151, 130),
        ["RightPetalA"] = Color3.fromRGB(177, 151, 130),
        ["Head4"] = Color3.fromRGB(255, 96, 213),
        ["LeftPetalC"] = Color3.fromRGB(177, 151, 130),
        ["RightPetalC"] = Color3.fromRGB(177, 151, 130),
        ["Torso3"] = Color3.fromRGB(255, 96, 213),
        ["LeftPetalB"] = Color3.fromRGB(177, 151, 130)
    },
    ["mounted_fly_forward_tilt_compensation"] = -18
}
v2.lunar_2025_blossom_snake = v3
local v4 = {
    ["name"] = "Nebula Snake",
    ["model"] = "Lunar2025NebulaSnake",
    ["image"] = "rbxassetid://134636987874448",
    ["rarity"] = "rare",
    ["cost"] = 40,
    ["currency_id"] = "stars_2025",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["year"] = 2025
    },
    ["anims"] = {
        ["sleep"] = "Lunar2025SnakeSleep",
        ["running"] = "Lunar2025SnakeRun",
        ["idle"] = "Lunar2025SnakeIdle",
        ["eating"] = "Lunar2025SnakeEat",
        ["sit"] = "Lunar2025SnakeSit",
        ["flying"] = "Lunar2025SnakeRun",
        ["hold"] = "Lunar2025SnakeBeingHeldSingle",
        ["double_hold"] = "Lunar2025NebulaSnakeBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Lunar2025SnakeSit" },
        { "Joyful", "Lunar2025SnakeJoyful" },
        { "Beg", "Lunar2025SnakeBeg" },
        { "Jump", "Lunar2025SnakeJump" },
        { "Trick 1", "Lunar2025SnakeTrick1" },
        { "Trick 2", "Lunar2025SnakeTrick5" }
    },
    ["neon_parts"] = {
        ["Torso4"] = Color3.fromRGB(166, 193, 255),
        ["Eyes"] = Color3.fromRGB(102, 153, 184),
        ["Head2"] = Color3.fromRGB(184, 255, 225),
        ["Torso2"] = Color3.fromRGB(184, 255, 225)
    },
    ["mounted_fly_forward_tilt_compensation"] = -18
}
v2.lunar_2025_nebula_snake = v4
local v5 = {
    ["name"] = "Gilded Snake",
    ["model"] = "Lunar2025GildedSnake",
    ["image"] = "rbxassetid://118641789458122",
    ["rarity"] = "legendary",
    ["cost"] = 325,
    ["currency_id"] = "stars_2025",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["year"] = 2025
    },
    ["anims"] = {
        ["sleep"] = "Lunar2025SnakeSleep",
        ["running"] = "Lunar2025SnakeRun",
        ["idle"] = "Lunar2025SnakeIdle",
        ["eating"] = "Lunar2025SnakeEat",
        ["sit"] = "Lunar2025SnakeSit",
        ["flying"] = "Lunar2025SnakeRun",
        ["hold"] = "Lunar2025SnakeBeingHeldSingle",
        ["double_hold"] = "Lunar2025SnakeBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Lunar2025SnakeSit" },
        { "Joyful", "Lunar2025SnakeJoyful" },
        { "Beg", "Lunar2025SnakeBeg" },
        { "Jump", "Lunar2025SnakeJump" },
        { "Trick 1", "Lunar2025SnakeTrick3" },
        { "Trick 2", "Lunar2025SnakeTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(190, 109, 62),
        ["Torso2"] = Color3.fromRGB(190, 109, 62)
    },
    ["mounted_fly_forward_tilt_compensation"] = -18
}
v2.lunar_2025_gilded_snake = v5
local v6 = {
    ["name"] = "Prism Snake",
    ["model"] = "Lunar2025PrismSnake",
    ["image"] = "rbxassetid://73245262062822",
    ["rarity"] = "rare",
    ["cost"] = 40,
    ["currency_id"] = "stars_2025",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["year"] = 2025
    },
    ["anims"] = {
        ["sleep"] = "Lunar2025SnakeSleep",
        ["running"] = "Lunar2025SnakeRun",
        ["idle"] = "Lunar2025SnakeIdle",
        ["eating"] = "Lunar2025SnakeEat",
        ["sit"] = "Lunar2025SnakeSit",
        ["flying"] = "Lunar2025SnakeRun",
        ["hold"] = "Lunar2025SnakeBeingHeldSingle",
        ["double_hold"] = "Lunar2025SnakeBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Lunar2025SnakeSit" },
        { "Joyful", "Lunar2025SnakeJoyful" },
        { "Beg", "Lunar2025SnakeBeg" },
        { "Jump", "Lunar2025SnakeJump" },
        { "Trick 1", "Lunar2025SnakeTrick5" },
        { "Trick 2", "Lunar2025SnakeTrick1" }
    },
    ["neon_parts"] = {
        ["Torso3"] = Color3.fromRGB(199, 172, 129),
        ["Torso2"] = Color3.fromRGB(199, 172, 129),
        ["Head7"] = Color3.fromRGB(52, 23, 37),
        ["Head3"] = Color3.fromRGB(185, 142, 104),
        ["Head5"] = Color3.fromRGB(185, 142, 104),
        ["Head4"] = Color3.fromRGB(185, 142, 104)
    },
    ["mounted_fly_forward_tilt_compensation"] = -18
}
v2.lunar_2025_prism_snake = v6
local v7 = {
    ["name"] = "Haetae",
    ["model"] = "Lunar2025Haetae",
    ["image"] = "rbxassetid://116467943923352",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["year"] = 2025
    },
    ["anims"] = {
        ["sleep"] = "Lunar2025HaetaeSleep",
        ["running"] = "Lunar2025HaetaeRun",
        ["idle"] = "Lunar2025HaetaeIdle",
        ["eating"] = "Lunar2025HaetaeEat",
        ["sit"] = "Lunar2025HaetaeSit",
        ["flying"] = "Lunar2025HaetaeRun",
        ["hold"] = "Lunar2025HaetaeBeingHeldSingle",
        ["double_hold"] = "Lunar2025HaetaeBeingHeldDouble",
        ["pedestal_idle"] = "Lunar2025HaetaeBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Lunar2025HaetaeSit" },
        { "Joyful", "Lunar2025HaetaeJoyful" },
        { "Beg", "Lunar2025HaetaeBeg" },
        { "Jump", "Lunar2025HaetaeJump" },
        { "Trick 1", "Lunar2025HaetaeTrick1" },
        { "Trick 2", "Lunar2025HaetaeTrick2" }
    },
    ["neon_parts"] = {
        ["Tail2"] = Color3.fromRGB(96, 139, 185),
        ["ManeClump2"] = Color3.fromRGB(96, 139, 185),
        ["ManeClump4"] = Color3.fromRGB(96, 139, 185),
        ["ManeClump"] = Color3.fromRGB(96, 139, 185),
        ["RightBrow"] = Color3.fromRGB(96, 139, 185),
        ["RightEar"] = Color3.fromRGB(96, 139, 185),
        ["LeftBrow"] = Color3.fromRGB(96, 139, 185),
        ["ManeClump3"] = Color3.fromRGB(96, 139, 185),
        ["LeftEar"] = Color3.fromRGB(96, 139, 185)
    }
}
v2.lunar_2025_haetae = v7
return v1(v2)