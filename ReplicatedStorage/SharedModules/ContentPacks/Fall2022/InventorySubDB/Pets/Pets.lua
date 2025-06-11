--// ReplicatedStorage.SharedModules.ContentPacks.Fall2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Badger",
    ["image"] = "rbxassetid://10377935981",
    ["model"] = "Fall2022Badger",
    ["rarity"] = "ultra_rare",
    ["cost"] = 700,
    ["origin_entry"] = {
        ["origin"] = "Fall Update",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "BadgerBeingHeldDouble",
        ["eating"] = "BadgerEat",
        ["hold"] = "BadgerBeingHeldSingle",
        ["idle"] = "BadgerIdle",
        ["running"] = "BadgerRun",
        ["sit"] = "BadgerSit",
        ["sleep"] = "BadgerSleep"
    },
    ["tricks"] = {
        { "Sit", "BadgerSit" },
        { "Joyful", "BadgerJoyful" },
        { "Beg", "BadgerBeg" },
        { "Jump", "BadgerJump" },
        { "Trick 1", "BadgerTrick1" },
        { "Trick 2", "BadgerTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(174, 184, 167),
        ["Head2"] = Color3.fromRGB(174, 184, 167),
        ["LeftEar1"] = Color3.fromRGB(174, 184, 167),
        ["RightEar1"] = Color3.fromRGB(174, 184, 167),
        ["Torso2"] = Color3.fromRGB(174, 184, 167)
    },
    ["liveops_map_type_required_for_purchase"] = "Fall"
}
v2.fall_2022_badger = v3
local v4 = {
    ["name"] = "Black-Chested Pheasant",
    ["image"] = "rbxassetid://10284283561",
    ["model"] = "Fall2022PheasantBlack",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Fall Update",
        ["origin_items"] = { "fall_2022_golden_wheat_stalk" },
        ["text_size"] = 12,
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "PheasantBeingHeldDouble",
        ["eating"] = "PheasantEat",
        ["flying"] = "PheasantFlying",
        ["hold"] = "PheasantBeingHeldSingle",
        ["idle"] = "PheasantIdle",
        ["running"] = "PheasantRun",
        ["sit"] = "PheasantSit",
        ["sleep"] = "PheasantSleep"
    },
    ["tricks"] = {
        { "Sit", "PheasantSit" },
        { "Joyful", "PheasantJoyful" },
        { "Beg", "PheasantBeg" },
        { "Jump", "PheasantJump" },
        { "Trick 1", "PheasantTrick1" },
        { "Trick 2", "PheasantTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(103, 145, 190),
        ["Head4"] = Color3.fromRGB(103, 145, 190),
        ["LeftWing2"] = Color3.fromRGB(103, 145, 190),
        ["RightWing2"] = Color3.fromRGB(103, 145, 190),
        ["Tail"] = Color3.fromRGB(103, 145, 190)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_fly_anim_speed"] = 0.5
}
v2.fall_2022_pheasant_black = v4
local v5 = {
    ["name"] = "Brown-Chested Pheasant",
    ["image"] = "rbxassetid://10137833682",
    ["model"] = "Fall2022PheasantBrown",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Fall Update",
        ["origin_items"] = { "fall_2022_golden_wheat_stalk" },
        ["text_size"] = 12,
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "PheasantBeingHeldDouble",
        ["eating"] = "PheasantEat",
        ["flying"] = "PheasantFlying",
        ["hold"] = "PheasantBeingHeldSingle",
        ["idle"] = "PheasantIdle",
        ["running"] = "PheasantRun",
        ["sit"] = "PheasantSit",
        ["sleep"] = "PheasantSleep"
    },
    ["tricks"] = {
        { "Sit", "PheasantSit" },
        { "Joyful", "PheasantJoyful" },
        { "Beg", "PheasantBeg" },
        { "Jump", "PheasantJump" },
        { "Trick 1", "PheasantTrick1" },
        { "Trick 2", "PheasantTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(190, 130, 0),
        ["Head4"] = Color3.fromRGB(190, 130, 0),
        ["LeftWing2"] = Color3.fromRGB(190, 130, 0),
        ["RightWing2"] = Color3.fromRGB(190, 130, 0),
        ["Tail"] = Color3.fromRGB(190, 130, 0)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_fly_anim_speed"] = 0.5
}
v2.fall_2022_pheasant_brown = v5
local v6 = {
    ["name"] = "Green-Chested Pheasant",
    ["image"] = "rbxassetid://10137833794",
    ["model"] = "Fall2022PheasantGreen",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Fall Update",
        ["origin_items"] = { "fall_2022_golden_wheat_stalk" },
        ["text_size"] = 12,
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "PheasantBeingHeldDouble",
        ["eating"] = "PheasantEat",
        ["flying"] = "PheasantFlying",
        ["hold"] = "PheasantBeingHeldSingle",
        ["idle"] = "PheasantIdle",
        ["running"] = "PheasantRun",
        ["sit"] = "PheasantSit",
        ["sleep"] = "PheasantSleep"
    },
    ["tricks"] = {
        { "Sit", "PheasantSit" },
        { "Joyful", "PheasantJoyful" },
        { "Beg", "PheasantBeg" },
        { "Jump", "PheasantJump" },
        { "Trick 1", "PheasantTrick1" },
        { "Trick 2", "PheasantTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(123, 186, 120),
        ["Head4"] = Color3.fromRGB(123, 186, 120),
        ["LeftWing2"] = Color3.fromRGB(123, 186, 120),
        ["RightWing2"] = Color3.fromRGB(123, 186, 120),
        ["Tail"] = Color3.fromRGB(123, 186, 120)
    },
    ["already_has_flying_wings"] = true,
    ["minimum_fly_anim_speed"] = 0.5
}
v2.fall_2022_pheasant_green = v6
return v1(v2)