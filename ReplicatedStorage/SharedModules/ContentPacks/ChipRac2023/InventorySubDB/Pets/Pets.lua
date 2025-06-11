--// ReplicatedStorage.SharedModules.ContentPacks.ChipRac2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Chipmunk",
    ["image"] = "rbxassetid://14448124117",
    ["model"] = "ChipRac2023Chipmunk",
    ["rarity"] = "rare",
    ["cost"] = 1300,
    ["origin_entry"] = {
        ["origin"] = "ChipRac",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "ChipRac2023ChipmunkBeingHeldDouble",
        ["eating"] = "ChipRac2023ChipmunkEat",
        ["flying"] = "ChipRac2023ChipmunkRun",
        ["hold"] = "ChipRac2023ChipmunkBeingHeldSingle",
        ["idle"] = "ChipRac2023ChipmunkIdle",
        ["running"] = "ChipRac2023ChipmunkRun",
        ["sit"] = "ChipRac2023ChipmunkSit",
        ["sleep"] = "ChipRac2023ChipmunkSleep"
    },
    ["tricks"] = {
        { "Sit", "ChipRac2023ChipmunkSit" },
        { "Joyful", "ChipRac2023ChipmunkJoyful" },
        { "Beg", "ChipRac2023ChipmunkBeg" },
        { "Jump", "ChipRac2023ChipmunkJump" },
        { "Trick 1", "ChipRac2023ChipmunkTrick1" },
        { "Trick 2", "ChipRac2023ChipmunkTrick2" }
    },
    ["neon_parts"] = {
        ["Hair"] = Color3.fromRGB(190, 111, 63),
        ["Hair2"] = Color3.fromRGB(190, 111, 63),
        ["Head3"] = Color3.fromRGB(190, 111, 63),
        ["LeftEar"] = Color3.fromRGB(190, 111, 63),
        ["LeftFoot"] = Color3.fromRGB(190, 111, 63),
        ["LeftHand"] = Color3.fromRGB(190, 111, 63),
        ["RightEar"] = Color3.fromRGB(190, 111, 63),
        ["RightFoot"] = Color3.fromRGB(190, 111, 63),
        ["RightHand"] = Color3.fromRGB(190, 111, 63),
        ["Tail3"] = Color3.fromRGB(190, 111, 63),
        ["Torso3"] = Color3.fromRGB(190, 111, 63),
        ["Whiskers"] = Color3.fromRGB(190, 111, 63)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.chiprac_2023_chipmunk = v3
local v4 = {
    ["name"] = "Raccoon",
    ["image"] = "rbxassetid://14446659851",
    ["model"] = "ChipRac2023Raccoon",
    ["rarity"] = "uncommon",
    ["cost"] = 600,
    ["origin_entry"] = {
        ["origin"] = "ChipRac",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "ChipRac2023RaccoonBeingHeldDouble",
        ["eating"] = "ChipRac2023RaccoonEat",
        ["flying"] = "ChipRac2023RaccoonRun",
        ["hold"] = "ChipRac2023RaccoonBeingHeldSingle",
        ["idle"] = "ChipRac2023RaccoonIdle",
        ["running"] = "ChipRac2023RaccoonRun",
        ["sit"] = "ChipRac2023RaccoonSit",
        ["sleep"] = "ChipRac2023RaccoonSleep"
    },
    ["tricks"] = {
        { "Sit", "ChipRac2023RaccoonSit" },
        { "Joyful", "ChipRac2023RaccoonJoyful" },
        { "Beg", "ChipRac2023RaccoonBeg" },
        { "Jump", "ChipRac2023RaccoonJump" },
        { "Trick 1", "ChipRac2023RaccoonTrick1" },
        { "Trick 2", "ChipRac2023RaccoonTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(86, 66, 200),
        ["LeftBackFoot"] = Color3.fromRGB(86, 66, 200),
        ["LeftEar2"] = Color3.fromRGB(86, 66, 200),
        ["LeftFrontFoot"] = Color3.fromRGB(86, 66, 200),
        ["RightBackFoot"] = Color3.fromRGB(86, 66, 200),
        ["RightEar2"] = Color3.fromRGB(86, 66, 200),
        ["RightFrontFoot"] = Color3.fromRGB(86, 66, 200),
        ["Tail2"] = Color3.fromRGB(86, 66, 200)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.chiprac_2023_raccoon = v4
return v1(v2)