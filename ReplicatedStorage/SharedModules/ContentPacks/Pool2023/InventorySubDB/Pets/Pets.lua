--// ReplicatedStorage.SharedModules.ContentPacks.Pool2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Goldfish",
    ["image"] = "rbxassetid://12596400214",
    ["model"] = "Pool2023Goldfish",
    ["rarity"] = "rare",
    ["cost"] = 1400,
    ["origin_entry"] = {
        ["origin"] = "Pool Party",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Pool2023GoldfishBeingHeldDouble",
        ["eating"] = "Pool2023GoldfishEat",
        ["hold"] = "Pool2023GoldfishBeingHeldSingle",
        ["idle"] = "Pool2023GoldfishIdle",
        ["running"] = "Pool2023GoldfishRun",
        ["sit"] = "Pool2023GoldfishSit",
        ["sleep"] = "Pool2023GoldfishSleep"
    },
    ["tricks"] = {
        { "Sit", "Pool2023GoldfishSit" },
        { "Joyful", "Pool2023GoldfishJoyful" },
        { "Beg", "Pool2023GoldfishBeg" },
        { "Jump", "Pool2023GoldfishJump" },
        { "Trick 1", "Pool2023GoldfishTrick1" },
        { "Trick 2", "Pool2023GoldfishTrick2" }
    },
    ["neon_parts"] = {
        ["DorsalFin"] = Color3.fromRGB(57, 100, 193),
        ["LeftFin"] = Color3.fromRGB(57, 100, 193),
        ["LeftFin2"] = Color3.fromRGB(57, 100, 193),
        ["RightFin"] = Color3.fromRGB(57, 100, 193),
        ["RightFin2"] = Color3.fromRGB(57, 100, 193),
        ["TailFin"] = Color3.fromRGB(57, 100, 193),
        ["TailFin2"] = Color3.fromRGB(57, 100, 193),
        ["TailFin3"] = Color3.fromRGB(57, 100, 193),
        ["TailFin4"] = Color3.fromRGB(57, 100, 193),
        ["Torso3"] = Color3.fromRGB(92, 92, 223)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.pool_2023_goldfish = v3
local v4 = {
    ["name"] = "Red Sand Dollar",
    ["image"] = "rbxassetid://12597276740",
    ["model"] = "Pool2023RedSandDollar",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Pool Party",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Pool2023SandDollarBeingHeldDouble",
        ["eating"] = "Pool2023SandDollarEat",
        ["hold"] = "Pool2023SandDollarBeingHeldSingle",
        ["idle"] = "Pool2023SandDollarIdle",
        ["running"] = "Pool2023SandDollarRun",
        ["sit"] = "Pool2023SandDollarSit",
        ["sleep"] = "Pool2023SandDollarSleep"
    },
    ["tricks"] = {
        { "Sit", "Pool2023SandDollarSit" },
        { "Joyful", "Pool2023SandDollarJoyful" },
        { "Beg", "Pool2023SandDollarBeg" },
        { "Jump", "Pool2023SandDollarJump" },
        { "Trick 1", "Pool2023SandDollarTrick1" },
        { "Trick 2", "Pool2023SandDollarTrick2" }
    },
    ["neon_parts"] = {
        ["Cheeks"] = Color3.fromRGB(194, 111, 62),
        ["FrillsLarge"] = Color3.fromRGB(194, 111, 62),
        ["Torso2"] = Color3.fromRGB(194, 111, 62),
        ["Torso3"] = Color3.fromRGB(194, 111, 62)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.pool_2023_red_sand_dollar = v4
local v5 = {
    ["name"] = "White Sand Dollar",
    ["image"] = "rbxassetid://12597275903",
    ["model"] = "Pool2023WhiteSandDollar",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Pool Party",
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Pool2023SandDollarBeingHeldDouble",
        ["eating"] = "Pool2023SandDollarEat",
        ["hold"] = "Pool2023SandDollarBeingHeldSingle",
        ["idle"] = "Pool2023SandDollarIdle",
        ["running"] = "Pool2023SandDollarRun",
        ["sit"] = "Pool2023SandDollarSit",
        ["sleep"] = "Pool2023SandDollarSleep"
    },
    ["tricks"] = {
        { "Sit", "Pool2023SandDollarSit" },
        { "Joyful", "Pool2023SandDollarJoyful" },
        { "Beg", "Pool2023SandDollarBeg" },
        { "Jump", "Pool2023SandDollarJump" },
        { "Trick 1", "Pool2023SandDollarTrick1" },
        { "Trick 2", "Pool2023SandDollarTrick2" }
    },
    ["neon_parts"] = {
        ["Cheeks"] = Color3.fromRGB(86, 109, 191),
        ["FrillsLarge"] = Color3.fromRGB(86, 109, 191),
        ["Torso2"] = Color3.fromRGB(86, 109, 191),
        ["Torso3"] = Color3.fromRGB(86, 109, 191)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.pool_2023_white_sand_dollar = v5
return v1(v2)