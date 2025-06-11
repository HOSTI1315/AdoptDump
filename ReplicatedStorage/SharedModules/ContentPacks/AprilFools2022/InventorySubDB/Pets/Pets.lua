--// ReplicatedStorage.SharedModules.ContentPacks.AprilFools2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Mechapup",
    ["image"] = "rbxassetid://9174893483",
    ["model"] = "AprilFools2022Mechapup",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "April Fools",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "MechapupBeingHeldDouble",
        ["eating"] = "MechapupEat",
        ["hold"] = "MechapupBeingHeldSingle",
        ["idle"] = "MechapupIdle",
        ["idle_mounted"] = "MechapupIdle",
        ["running"] = "MechapupRun",
        ["sit"] = "MechapupSit",
        ["sleep"] = "MechapupSleep"
    },
    ["tricks"] = {
        { "Sit", "MechapupSit" },
        { "Joyful", "MechapupJoyful" },
        { "Beg", "MechapupBeg" },
        { "Jump", "MechapupJump" },
        { "Trick 1", "MechapupTrick1" },
        { "Trick 2", "MechapupTrick2" }
    },
    ["neon_parts"] = {
        ["LeftHand1"] = Color3.fromRGB(162, 184, 188),
        ["LeftHand3"] = Color3.fromRGB(218, 105, 79),
        ["LeftHand5"] = Color3.fromRGB(190, 76, 56),
        ["LeftIndex2"] = Color3.fromRGB(218, 105, 79),
        ["LeftPinkie2"] = Color3.fromRGB(218, 105, 79),
        ["LeftShoulder4"] = Color3.fromRGB(190, 76, 56),
        ["LeftThumb2"] = Color3.fromRGB(218, 105, 79),
        ["RightHand1"] = Color3.fromRGB(162, 184, 188),
        ["RightHand3"] = Color3.fromRGB(218, 105, 79),
        ["RightHand5"] = Color3.fromRGB(190, 76, 56),
        ["RightIndex2"] = Color3.fromRGB(218, 105, 79),
        ["RightPinkie2"] = Color3.fromRGB(218, 105, 79),
        ["RightShoulder4"] = Color3.fromRGB(190, 76, 56),
        ["RightThumb2"] = Color3.fromRGB(218, 105, 79),
        ["Rock"] = Color3.fromRGB(184, 102, 173),
        ["Torso4"] = Color3.fromRGB(218, 105, 79),
        ["Torso5"] = Color3.fromRGB(190, 76, 56)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_run_anim_speed"] = 0.5,
    ["head_rotator_disabled"] = true
}
v2.april_fools_2022_mechapup = v3
local v4 = {
    ["name"] = "Rock",
    ["image"] = "rbxassetid://4841039508",
    ["model"] = "AprilFools2022Rock",
    ["rarity"] = "uncommon",
    ["cost"] = 350,
    ["origin_entry"] = {
        ["origin"] = "April Fools",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "RockIdle",
        ["eating"] = "RockEating",
        ["hold"] = "RockIdle",
        ["idle"] = "RockIdle",
        ["running"] = "RockRunning",
        ["running_mounted"] = "EggRunning",
        ["sit"] = "RockIdle",
        ["sleep"] = "RockIdle"
    },
    ["tricks"] = {
        { "Do Nothing", "RockIdle" },
        { "Play Dead", "RockIdle" },
        { "Stay", "RockIdle" },
        { "Erode", "RockIdle" },
        { "Sit Still", "RockIdle" },
        { "Think", "RockIdle" }
    },
    ["neon_parts"] = {
        ["Rock"] = Color3.fromRGB(184, 102, 173)
    },
    ["hold_offset"] = CFrame.new(0, 1.1, 0),
    ["no_eyes"] = true
}
v2.april_fools_2022_rock = v4
return v1(v2)