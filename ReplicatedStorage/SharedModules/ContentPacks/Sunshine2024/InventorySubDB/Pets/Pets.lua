--// ReplicatedStorage.SharedModules.ContentPacks.Sunshine2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Bush Elephant",
    ["model"] = "Sunshine2024BushElephant",
    ["image"] = "rbxassetid://18508016126",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Sunshine Games",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Sunshine2024BushElephantSleep",
        ["running"] = "Sunshine2024BushElephantRun",
        ["idle"] = "Sunshine2024BushElephantIdle",
        ["eating"] = "Sunshine2024BushElephantEat",
        ["sit"] = "Sunshine2024BushElephantSit",
        ["flying"] = "Sunshine2024BushElephantRun",
        ["hold"] = "Sunshine2024BushElephantBeingHeldSingle",
        ["double_hold"] = "Sunshine2024BushElephantBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Sunshine2024BushElephantSit" },
        { "Joyful", "Sunshine2024BushElephantJoyful" },
        { "Beg", "Sunshine2024BushElephantBeg" },
        { "Jump", "Sunshine2024BushElephantJump" },
        { "Trick 1", "Sunshine2024BushElephantTrick1" },
        { "Trick 2", "Sunshine2024BushElephantTrick2" }
    },
    ["neon_parts"] = {
        ["Torso2"] = Color3.fromRGB(185, 123, 107),
        ["LeftEar"] = Color3.fromRGB(185, 123, 107),
        ["RightEar"] = Color3.fromRGB(185, 123, 107),
        ["Head3"] = Color3.fromRGB(185, 123, 107),
        ["Head2"] = Color3.fromRGB(185, 123, 107)
    }
}
v2.sunshine_2024_bush_elephant = v3
local v4 = {
    ["name"] = "Peregrine Falcon",
    ["model"] = "Sunshine2024PeregrineFalcon",
    ["image"] = "rbxassetid://18508184138",
    ["rarity"] = "ultra_rare",
    ["already_has_flying_wings"] = true,
    ["origin_entry"] = {
        ["origin"] = "Sunshine Games",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Sunshine2024PeregrineFalconSleep",
        ["running"] = "Sunshine2024PeregrineFalconRun",
        ["idle"] = "Sunshine2024PeregrineFalconIdle",
        ["eating"] = "Sunshine2024PeregrineFalconEat",
        ["sit"] = "Sunshine2024PeregrineFalconSit",
        ["flying"] = "Sunshine2024PeregrineFalconRun",
        ["hold"] = "Sunshine2024PeregrineFalconBeingHeldSingle",
        ["double_hold"] = "Sunshine2024PeregrineFalconBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Sunshine2024PeregrineFalconSit" },
        { "Joyful", "Sunshine2024PeregrineFalconJoyful" },
        { "Beg", "Sunshine2024PeregrineFalconBeg" },
        { "Jump", "Sunshine2024PeregrineFalconJump" },
        { "Trick 1", "Sunshine2024PeregrineFalconTrick1" },
        { "Trick 2", "Sunshine2024PeregrineFalconTrick2" }
    },
    ["neon_parts"] = {
        ["LeftFoot"] = Color3.fromRGB(185, 107, 54),
        ["RightFoot"] = Color3.fromRGB(185, 107, 54),
        ["Torso2"] = Color3.fromRGB(185, 107, 54),
        ["Head2"] = Color3.fromRGB(185, 107, 54),
        ["Tail2"] = Color3.fromRGB(185, 107, 54),
        ["RightWing2"] = Color3.fromRGB(185, 107, 54),
        ["LeftWing2"] = Color3.fromRGB(185, 107, 54)
    }
}
v2.sunshine_2024_peregrine_falcon = v4
local v5 = {
    ["name"] = "Cheetah",
    ["model"] = "Sunshine2024Cheetah",
    ["image"] = "rbxassetid://18515755354",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Sunshine Games",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Sunshine2024CheetahSleep",
        ["running"] = "Sunshine2024CheetahRun",
        ["idle"] = "Sunshine2024CheetahIdle",
        ["eating"] = "Sunshine2024CheetahEat",
        ["sit"] = "Sunshine2024CheetahSit",
        ["flying"] = "Sunshine2024CheetahRun",
        ["hold"] = "Sunshine2024CheetahBeingHeldSingle",
        ["double_hold"] = "Sunshine2024CheetahBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Sunshine2024CheetahSit" },
        { "Joyful", "Sunshine2024CheetahJoyful" },
        { "Beg", "Sunshine2024CheetahBeg" },
        { "Jump", "Sunshine2024CheetahJump" },
        { "Trick 1", "Sunshine2024CheetahTrick1" },
        { "Trick 2", "Sunshine2024CheetahTrick2" }
    },
    ["neon_parts"] = {
        ["Torso3"] = Color3.fromRGB(255, 106, 19),
        ["Tail2"] = Color3.fromRGB(255, 106, 19),
        ["Head5"] = Color3.fromRGB(255, 106, 19)
    }
}
v2.sunshine_2024_cheetah = v5
local v6 = {
    ["name"] = "Black Marlin",
    ["model"] = "Sunshine2024BlackMarlin",
    ["image"] = "rbxassetid://18515939072",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Sunshine Games",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Sunshine2024BlackMarlinSleep",
        ["running"] = "Sunshine2024BlackMarlinRun",
        ["idle"] = "Sunshine2024BlackMarlinIdle",
        ["eating"] = "Sunshine2024BlackMarlinEat",
        ["sit"] = "Sunshine2024BlackMarlinSit",
        ["flying"] = "Sunshine2024BlackMarlinRun",
        ["hold"] = "Sunshine2024BlackMarlinBeingHeldSingle",
        ["double_hold"] = "Sunshine2024BlackMarlinBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Sunshine2024BlackMarlinSit" },
        { "Joyful", "Sunshine2024BlackMarlinJoyful" },
        { "Beg", "Sunshine2024BlackMarlinBeg" },
        { "Jump", "Sunshine2024BlackMarlinJump" },
        { "Trick 1", "Sunshine2024BlackMarlinTrick1" },
        { "Trick 2", "Sunshine2024BlackMarlinTrick2" }
    },
    ["neon_parts"] = {
        ["Torso4"] = Color3.fromRGB(94, 147, 194),
        ["BottomFins2"] = Color3.fromRGB(94, 147, 194),
        ["Tail2"] = Color3.fromRGB(94, 147, 194),
        ["TopFins2"] = Color3.fromRGB(94, 147, 194),
        ["TailBot2"] = Color3.fromRGB(94, 147, 194),
        ["TailTop2"] = Color3.fromRGB(94, 147, 194),
        ["Eyes"] = Color3.fromRGB(94, 147, 194)
    }
}
v2.sunshine_2024_black_marlin = v6
return v1(v2)