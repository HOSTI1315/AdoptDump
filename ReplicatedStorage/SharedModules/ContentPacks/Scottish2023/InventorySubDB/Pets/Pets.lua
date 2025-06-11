--// ReplicatedStorage.SharedModules.ContentPacks.Scottish2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Highland Cow",
    ["image"] = "rbxassetid://11837080223",
    ["model"] = "Scottish2023HighlandCow",
    ["rarity"] = "ultra_rare",
    ["cost"] = 2000,
    ["origin_entry"] = {
        ["origin"] = "Scottish",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Scottish2023HighlandCowBeingHeldDouble",
        ["eating"] = "Scottish2023HighlandCowEat",
        ["hold"] = "Scottish2023HighlandCowBeingHeldSingle",
        ["idle"] = "Scottish2023HighlandCowIdle",
        ["running"] = "Scottish2023HighlandCowRun",
        ["sit"] = "Scottish2023HighlandCowSit",
        ["sleep"] = "Scottish2023HighlandCowSleep"
    },
    ["tricks"] = {
        { "Sit", "Scottish2023HighlandCowSit" },
        { "Joyful", "Scottish2023HighlandCowJoyful" },
        { "Beg", "Scottish2023HighlandCowBeg" },
        { "Jump", "Scottish2023HighlandCowJump" },
        { "Trick 1", "Scottish2023HighlandCowTrick1" },
        { "Trick 2", "Scottish2023HighlandCowTrick2" }
    },
    ["neon_parts"] = {
        ["Hair"] = Color3.fromRGB(159, 106, 155),
        ["Hair2"] = Color3.fromRGB(159, 106, 155),
        ["Nose"] = Color3.fromRGB(159, 106, 155),
        ["Tail2"] = Color3.fromRGB(159, 106, 155),
        ["joint17"] = Color3.fromRGB(159, 106, 155),
        ["joint18"] = Color3.fromRGB(159, 106, 155),
        ["joint20"] = Color3.fromRGB(159, 106, 155),
        ["joint21"] = Color3.fromRGB(159, 106, 155)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.2
}
v2.scottish_2023_highland_cow = v3
local v4 = {
    ["name"] = "Nessie",
    ["image"] = "rbxassetid://11773429123",
    ["model"] = "Scottish2023Nessie",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Scottish",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Scottish2023NessieBeingHeldDouble",
        ["eating"] = "Scottish2023NessieEat",
        ["hold"] = "Scottish2023NessieBeingHeldSingle",
        ["idle"] = "Scottish2023NessieIdle",
        ["running"] = "Scottish2023NessieRun",
        ["sit"] = "Scottish2023NessieSit",
        ["sleep"] = "Scottish2023NessieSleep"
    },
    ["tricks"] = {
        { "Sit", "Scottish2023NessieSit" },
        { "Joyful", "Scottish2023NessieJoyful" },
        { "Beg", "Scottish2023NessieBeg" },
        { "Jump", "Scottish2023NessieJump" },
        { "Trick 1", "Scottish2023NessieTrick1" },
        { "Trick 2", "Scottish2023NessieTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFlipper2"] = Color3.fromRGB(6, 108, 197),
        ["BackRightFlipper2"] = Color3.fromRGB(6, 108, 197),
        ["FrontLeftFlipper2"] = Color3.fromRGB(6, 108, 197),
        ["FrontRightFlipper2"] = Color3.fromRGB(6, 108, 197),
        ["Head2"] = Color3.fromRGB(6, 108, 197),
        ["LeftHeadFlappies2"] = Color3.fromRGB(6, 108, 197),
        ["RightHeadFlappies2"] = Color3.fromRGB(6, 108, 197),
        ["Spine"] = Color3.fromRGB(6, 108, 197),
        ["Torso2"] = Color3.fromRGB(6, 108, 197),
        ["Torso3"] = Color3.fromRGB(6, 108, 197)
    },
    ["eyes"] = { "Eyes" },
    ["minimum_fly_anim_speed"] = 0.2
}
v2.scottish_2023_nessie = v4
return v1(v2)