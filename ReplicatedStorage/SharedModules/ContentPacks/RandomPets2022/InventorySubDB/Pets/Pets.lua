--// ReplicatedStorage.SharedModules.ContentPacks.RandomPets2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Ibex",
    ["image"] = "rbxassetid://9227407648",
    ["model"] = "RandomPets2022Ibex",
    ["rarity"] = "rare",
    ["cost"] = 980,
    ["origin_entry"] = {
        ["origin"] = "Random Pets",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "IbexBeingHeldDouble",
        ["eating"] = "IbexEat",
        ["hold"] = "IbexBeingHeldSingle",
        ["idle"] = "IbexIdle",
        ["running"] = "IbexRun",
        ["sit"] = "IbexSit",
        ["sleep"] = "IbexSleep"
    },
    ["tricks"] = {
        { "Sit", "IbexSit" },
        { "Joyful", "IbexJoyful" },
        { "Beg", "IbexBeg" },
        { "Jump", "IbexJump" },
        { "Trick 1", "IbexTrick1" },
        { "Trick 2", "IbexTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(178, 184, 110),
        ["Head5"] = Color3.fromRGB(178, 184, 110),
        ["Tail2"] = Color3.fromRGB(178, 184, 110)
    }
}
v2.random_pets_2022_ibex = v3
local v4 = {
    ["name"] = "Winged Horse",
    ["image"] = "rbxassetid://9226723356",
    ["model"] = "RandomPets2022WingedHorse",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Random Pets",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "WingedHorseBeingHeldDouble",
        ["eating"] = "WingedHorseEat",
        ["hold"] = "WingedHorseBeingHeldSingle",
        ["idle"] = "WingedHorseIdle",
        ["running"] = "WingedHorseRun",
        ["sit"] = "WingedHorseSit",
        ["sleep"] = "WingedHorseSleep"
    },
    ["tricks"] = {
        { "Sit", "WingedHorseSit" },
        { "Joyful", "WingedHorseJoyful" },
        { "Beg", "WingedHorseBeg" },
        { "Jump", "WingedHorseJump" },
        { "Trick 1", "WingedHorseTrick1" },
        { "Trick 2", "WingedHorseTrick2" }
    },
    ["neon_parts"] = {
        ["Hair"] = Color3.fromRGB(103, 145, 190),
        ["Hair10"] = Color3.fromRGB(103, 145, 190),
        ["Hair11"] = Color3.fromRGB(103, 145, 190),
        ["Hair12"] = Color3.fromRGB(103, 145, 190),
        ["Hair4"] = Color3.fromRGB(103, 145, 190),
        ["Hair6"] = Color3.fromRGB(103, 145, 190),
        ["Hair7"] = Color3.fromRGB(103, 145, 190),
        ["Hair8"] = Color3.fromRGB(103, 145, 190),
        ["Hair9"] = Color3.fromRGB(103, 145, 190),
        ["LeftBackFoot2"] = Color3.fromRGB(103, 145, 190),
        ["LeftFrontFoot2"] = Color3.fromRGB(103, 145, 190),
        ["LeftWing2"] = Color3.fromRGB(103, 145, 190),
        ["RightBackFoot2"] = Color3.fromRGB(103, 145, 190),
        ["RightFrontFoot2"] = Color3.fromRGB(103, 145, 190),
        ["RightWing2"] = Color3.fromRGB(103, 145, 190),
        ["Tail"] = Color3.fromRGB(103, 145, 190),
        ["Tail1"] = Color3.fromRGB(103, 145, 190),
        ["Tail10"] = Color3.fromRGB(103, 145, 190),
        ["Tail11"] = Color3.fromRGB(103, 145, 190),
        ["Tail2"] = Color3.fromRGB(103, 145, 190),
        ["Tail3"] = Color3.fromRGB(103, 145, 190),
        ["Tail4"] = Color3.fromRGB(103, 145, 190),
        ["Tail5"] = Color3.fromRGB(103, 145, 190),
        ["Tail6"] = Color3.fromRGB(103, 145, 190),
        ["Tail7"] = Color3.fromRGB(103, 145, 190),
        ["Tail8"] = Color3.fromRGB(103, 145, 190),
        ["Tail9"] = Color3.fromRGB(103, 145, 190)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_run_anim_speed"] = 0.5
}
v2.random_pets_2022_winged_horse = v4
return v1(v2)