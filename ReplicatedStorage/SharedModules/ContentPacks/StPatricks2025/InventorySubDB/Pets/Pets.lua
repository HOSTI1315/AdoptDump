--// ReplicatedStorage.SharedModules.ContentPacks.StPatricks2025.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Clover Cow",
    ["image"] = "rbxassetid://95046891836017",
    ["model"] = "StPatricks2025CloverCow",
    ["rarity"] = "rare",
    ["cost"] = 1850,
    ["origin_entry"] = {
        ["origin"] = "St Patricks",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["anims"] = {
        ["pedestal_idle"] = "StPatricks2025CloverCowSit",
        ["double_hold"] = "StPatricks2025CloverCowBeingHeldDouble",
        ["eating"] = "StPatricks2025CloverCowEat",
        ["hold"] = "StPatricks2025CloverCowBeingHeldSingle",
        ["idle"] = "StPatricks2025CloverCowIdle",
        ["running"] = "StPatricks2025CloverCowRun",
        ["sit"] = "StPatricks2025CloverCowSit",
        ["sleep"] = "StPatricks2025CloverCowSleep"
    },
    ["tricks"] = {
        { "Sit", "StPatricks2025CloverCowSit" },
        { "Joyful", "StPatricks2025CloverCowJoyful" },
        { "Beg", "StPatricks2025CloverCowBeg" },
        { "Jump", "StPatricks2025CloverCowJump" },
        { "Trick 1", "StPatricks2025CloverCowTrick1" },
        { "Trick 2", "StPatricks2025CloverCowTrick2" }
    },
    ["neon_parts"] = {
        ["Horns"] = Color3.fromRGB(31, 173, 36),
        ["LeftEar2"] = Color3.fromRGB(31, 173, 36),
        ["RightEar2"] = Color3.fromRGB(31, 173, 36),
        ["Tail2"] = Color3.fromRGB(31, 173, 36),
        ["Torso2"] = Color3.fromRGB(31, 173, 36),
        ["RightFrontFoot"] = Color3.fromRGB(31, 173, 36),
        ["RightBackFoot"] = Color3.fromRGB(31, 173, 36),
        ["LeftBackFoot"] = Color3.fromRGB(31, 173, 36),
        ["LeftFrontFoot"] = Color3.fromRGB(31, 173, 36)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.st_patricks_2025_clover_cow = v3
local v4 = {
    ["name"] = "Gaelic Fae",
    ["image"] = "rbxassetid://122766274014139",
    ["model"] = "StPatricks2025GaelicFae",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "St Patricks",
        ["origin_items"] = {},
        ["year"] = 2025
    },
    ["anims"] = {
        ["pedestal_idle"] = "StPatricks2025GaelicFaeSit",
        ["double_hold"] = "StPatricks2025GaelicFaeBeingHeldDouble",
        ["eating"] = "StPatricks2025GaelicFaeEat",
        ["hold"] = "StPatricks2025GaelicFaeBeingHeldSingle",
        ["idle"] = "StPatricks2025GaelicFaeIdle",
        ["running"] = "StPatricks2025GaelicFaeRun",
        ["sit"] = "StPatricks2025GaelicFaeSit",
        ["sleep"] = "StPatricks2025GaelicFaeSleep"
    },
    ["tricks"] = {
        { "Sit", "StPatricks2025GaelicFaeSit" },
        { "Joyful", "StPatricks2025GaelicFaeJoyful" },
        { "Beg", "StPatricks2025GaelicFaeBeg" },
        { "Jump", "StPatricks2025GaelicFaeJump" },
        { "Trick 1", "StPatricks2025GaelicFaeTrick1" },
        { "Trick 2", "StPatricks2025GaelicFaeTrick2" }
    },
    ["neon_parts"] = {
        ["LeftWing"] = Color3.fromRGB(99, 194, 150),
        ["Head4"] = Color3.fromRGB(99, 194, 150),
        ["RightWing3"] = Color3.fromRGB(99, 194, 150),
        ["LeftWing2"] = Color3.fromRGB(99, 194, 150),
        ["RightWing"] = Color3.fromRGB(99, 194, 150),
        ["RightWing2"] = Color3.fromRGB(99, 194, 150),
        ["LeftWing1"] = Color3.fromRGB(99, 194, 150)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v2.st_patricks_2025_gaelic_fae = v4
return v1(v2)