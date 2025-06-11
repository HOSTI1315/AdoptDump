--// ReplicatedStorage.SharedModules.ContentPacks.Hamstertime2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Hamster",
    ["image"] = "rbxassetid://16548686870",
    ["model"] = "Hamstertime2024Hamster",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Hamstertime",
        ["origin_items"] = { "hamstertime_2024_golden_corn" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Hamstertime2024HamsterSleep",
        ["running"] = "Hamstertime2024HamsterRun",
        ["idle"] = "Hamstertime2024HamsterIdle",
        ["eating"] = "Hamstertime2024HamsterEat",
        ["sit"] = "Hamstertime2024HamsterSit",
        ["flying"] = "Hamstertime2024HamsterRun",
        ["hold"] = "Hamstertime2024HamsterBeingHeldSingle",
        ["double_hold"] = "Hamstertime2024HamsterBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Hamstertime2024HamsterSit" },
        { "Joyful", "Hamstertime2024HamsterJoyful" },
        { "Beg", "Hamstertime2024HamsterBeg" },
        { "Jump", "Hamstertime2024HamsterJump" },
        { "Trick 1", "Hamstertime2024HamsterTrick1" },
        { "Trick 2", "Hamstertime2024HamsterTrick2" }
    },
    ["neon_parts"] = {
        ["LeftEar2"] = Color3.fromRGB(217, 112, 0),
        ["RightEar2"] = Color3.fromRGB(217, 112, 0),
        ["LeftHand"] = Color3.fromRGB(217, 112, 0),
        ["LeftFoot"] = Color3.fromRGB(217, 112, 0),
        ["RightFoot"] = Color3.fromRGB(217, 112, 0),
        ["RightHand"] = Color3.fromRGB(217, 112, 0),
        ["Tail"] = Color3.fromRGB(217, 112, 0),
        ["Whiskers"] = Color3.fromRGB(217, 112, 0),
        ["Nose"] = Color3.fromRGB(217, 112, 0)
    }
}
v2.hamstertime_2024_hamster = v3
local v4 = {
    ["name"] = "Golden Hamster",
    ["image"] = "rbxassetid://16548792521",
    ["model"] = "Hamstertime2024GoldenHamster",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Hamstertime",
        ["origin_items"] = { "hamstertime_2024_golden_corn" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Hamstertime2024HamsterSleep",
        ["running"] = "Hamstertime2024HamsterRun",
        ["idle"] = "Hamstertime2024HamsterIdle",
        ["eating"] = "Hamstertime2024HamsterEat",
        ["sit"] = "Hamstertime2024HamsterSit",
        ["flying"] = "Hamstertime2024HamsterRun",
        ["hold"] = "Hamstertime2024HamsterBeingHeldSingle",
        ["double_hold"] = "Hamstertime2024HamsterBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Hamstertime2024HamsterSit" },
        { "Joyful", "Hamstertime2024HamsterJoyful" },
        { "Beg", "Hamstertime2024HamsterBeg" },
        { "Jump", "Hamstertime2024HamsterJump" },
        { "Trick 1", "Hamstertime2024HamsterTrick1" },
        { "Trick 2", "Hamstertime2024HamsterTrick2" }
    },
    ["neon_parts"] = {
        ["Whiskers"] = Color3.fromRGB(188, 179, 82),
        ["Tail"] = Color3.fromRGB(188, 179, 82),
        ["RightHand"] = Color3.fromRGB(188, 179, 82),
        ["RightFoot"] = Color3.fromRGB(188, 179, 82),
        ["RightEar2"] = Color3.fromRGB(188, 179, 82),
        ["LeftHand"] = Color3.fromRGB(188, 179, 82),
        ["Nose"] = Color3.fromRGB(188, 179, 82),
        ["LeftFoot"] = Color3.fromRGB(188, 179, 82),
        ["LeftEar2"] = Color3.fromRGB(188, 179, 82)
    }
}
v2.hamstertime_2024_golden_hamster = v4
local v5 = {
    ["name"] = "Diamond Hamster",
    ["image"] = "rbxassetid://16548793509",
    ["model"] = "Hamstertime2024DiamondHamster",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Hamstertime",
        ["origin_items"] = { "hamstertime_2024_golden_corn" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Hamstertime2024HamsterSleep",
        ["running"] = "Hamstertime2024HamsterRun",
        ["idle"] = "Hamstertime2024HamsterIdle",
        ["eating"] = "Hamstertime2024HamsterEat",
        ["sit"] = "Hamstertime2024HamsterSit",
        ["flying"] = "Hamstertime2024HamsterRun",
        ["hold"] = "Hamstertime2024HamsterBeingHeldSingle",
        ["double_hold"] = "Hamstertime2024HamsterBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Hamstertime2024HamsterSit" },
        { "Joyful", "Hamstertime2024HamsterJoyful" },
        { "Beg", "Hamstertime2024HamsterBeg" },
        { "Jump", "Hamstertime2024HamsterJump" },
        { "Trick 1", "Hamstertime2024HamsterTrick1" },
        { "Trick 2", "Hamstertime2024HamsterTrick2" }
    },
    ["neon_parts"] = {
        ["Whiskers"] = Color3.fromRGB(184, 121, 165),
        ["Tail"] = Color3.fromRGB(184, 121, 165),
        ["RightHand"] = Color3.fromRGB(184, 121, 165),
        ["RightFoot"] = Color3.fromRGB(184, 121, 165),
        ["RightEar2"] = Color3.fromRGB(184, 121, 165),
        ["Nose"] = Color3.fromRGB(184, 121, 165),
        ["LeftHand"] = Color3.fromRGB(184, 121, 165),
        ["LeftFoot"] = Color3.fromRGB(184, 121, 165),
        ["LeftEar2"] = Color3.fromRGB(184, 121, 165)
    }
}
v2.hamstertime_2024_diamond_hamster = v5
return v1(v2)