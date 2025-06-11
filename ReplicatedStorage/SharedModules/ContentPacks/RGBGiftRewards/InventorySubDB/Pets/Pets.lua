--// ReplicatedStorage.SharedModules.ContentPacks.RGBGiftRewards.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Chameleon",
    ["image"] = "rbxassetid://8596153183",
    ["model"] = "RGBChameleon",
    ["rarity"] = "legendary",
    ["cost"] = 1000,
    ["origin_entry"] = {
        ["origin"] = "Task Board Update",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "ChameleonBeingHeldDouble",
        ["eating"] = "ChameleonEat",
        ["hold"] = "ChameleonBeingHeldSingle",
        ["idle"] = "ChameleonIdle",
        ["running"] = "ChameleonRun",
        ["sit"] = "ChameleonSit",
        ["sleep"] = "ChameleonSleep"
    },
    ["tricks"] = {
        { "Sit", "ChameleonSit" },
        { "Joyful", "ChameleonJoyful" },
        { "Beg", "ChameleonBeg" },
        { "Jump", "ChameleonJump" },
        { "Trick 1", "ChameleonTrick1" },
        { "Trick 2", "ChameleonTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(44, 186, 181),
        ["LeftBackFoot2"] = Color3.fromRGB(44, 186, 181),
        ["LeftFrontFoot2"] = Color3.fromRGB(44, 186, 181),
        ["RightBackFoot2"] = Color3.fromRGB(44, 186, 181),
        ["RightFrontFoot2"] = Color3.fromRGB(44, 186, 181),
        ["Spikes"] = Color3.fromRGB(44, 186, 181),
        ["Torso2"] = Color3.fromRGB(44, 186, 181)
    },
    ["interaction_part_name"] = "HumanoidRootPart"
}
v2.rgb_chameleon = v3
local v4 = {
    ["name"] = "Squid",
    ["image"] = "rbxassetid://8596147681",
    ["model"] = "RGBSquid",
    ["rarity"] = "legendary",
    ["cost"] = 1000,
    ["origin_entry"] = {
        ["origin"] = "Task Board Update",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "SquidBeingHeldDouble",
        ["eating"] = "SquidEat",
        ["flying"] = "SquidIdle",
        ["hold"] = "SquidBeingHeldSingle",
        ["idle"] = "SquidIdle",
        ["running"] = "SquidRun",
        ["running_mounted"] = "SquidIdle",
        ["sit"] = "SquidSit",
        ["sleep"] = "SquidSleep"
    },
    ["tricks"] = {
        { "Sit", "SquidSit" },
        { "Joyful", "SquidJoyful" },
        { "Beg", "SquidBeg" },
        { "Jump", "SquidJump" },
        { "Trick 1", "SquidTrick1" },
        { "Trick 2", "SquidTrick2" }
    },
    ["neon_parts"] = {
        ["Spot2"] = Color3.fromRGB(201, 117, 208),
        ["Spot3"] = Color3.fromRGB(114, 186, 179),
        ["Spot4"] = Color3.fromRGB(72, 116, 203),
        ["Spot5"] = Color3.fromRGB(60, 194, 109),
        ["Spot6"] = Color3.fromRGB(182, 179, 80),
        ["Spot7"] = Color3.fromRGB(189, 111, 42),
        ["Spots"] = Color3.fromRGB(190, 113, 131)
    },
    ["already_has_flying_wings"] = true,
    ["head_rotator_disabled"] = true
}
v2.rgb_squid = v4
return v1(v2)