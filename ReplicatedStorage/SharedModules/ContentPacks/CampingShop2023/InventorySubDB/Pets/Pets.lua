--// ReplicatedStorage.SharedModules.ContentPacks.CampingShop2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Firefly",
    ["image"] = "rbxassetid://12187391973",
    ["model"] = "Camping2023Firefly",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Camping Shop",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Camping2023FireflyBeingDoubleHeld",
        ["eating"] = "Camping2023FireflyEating",
        ["hold"] = "Camping2023FireflyBeingHeld",
        ["idle"] = "Camping2023FireflyIdle",
        ["running"] = "Camping2023FireflyRun",
        ["sit"] = "Camping2023FireflySit",
        ["sleep"] = "Camping2023FireflySleep"
    },
    ["tricks"] = {
        { "Sit", "Camping2023FireflySit" },
        { "Joyful", "Camping2023FireflyJoyful" },
        { "Beg", "Camping2023FireflyBeg" },
        { "Jump", "Camping2023FireflyJump" },
        { "Trick 1", "Camping2023FireflyTrick1" },
        { "Trick 2", "Camping2023FireflyTrick2" }
    },
    ["neon_parts"] = {
        ["LeftAntenna"] = Color3.fromRGB(184, 104, 184),
        ["LeftWing"] = Color3.fromRGB(184, 104, 184),
        ["LeftWing2"] = Color3.fromRGB(184, 104, 184),
        ["RightAntenna"] = Color3.fromRGB(184, 104, 184),
        ["RightWing"] = Color3.fromRGB(184, 104, 184),
        ["RightWing2"] = Color3.fromRGB(184, 104, 184),
        ["Torso3"] = Color3.fromRGB(184, 104, 184)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_fly_anim_speed"] = 0.5
}
v2.camping_2023_firefly = v3
local v4 = {
    ["name"] = "Possum",
    ["image"] = "rbxassetid://12432807176",
    ["model"] = "Camping2023Possum",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Camping Shop",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Camping2023PossumBeingDoubleHeld",
        ["eating"] = "Camping2023PossumEating",
        ["hold"] = "Camping2023PossumBeingHeld",
        ["idle"] = "Camping2023PossumIdle",
        ["running"] = "Camping2023PossumRun",
        ["sit"] = "Camping2023PossumSit",
        ["sleep"] = "Camping2023PossumSleep"
    },
    ["tricks"] = {
        { "Sit", "Camping2023PossumSit" },
        { "Joyful", "Camping2023PossumJoyful" },
        { "Beg", "Camping2023PossumBeg" },
        { "Jump", "Camping2023PossumJump" },
        { "Trick 1", "Camping2023PossumTrick1" },
        { "Trick 2", "Camping2023PossumTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(102, 162, 184),
        ["LeftEar2"] = Color3.fromRGB(102, 162, 184),
        ["RightEar2"] = Color3.fromRGB(102, 162, 184),
        ["Tail2"] = Color3.fromRGB(102, 162, 184),
        ["Torso2"] = Color3.fromRGB(102, 162, 184)
    },
    ["minimum_fly_anim_speed"] = 0.5
}
v2.camping_2023_possum = v4
return v1(v2)