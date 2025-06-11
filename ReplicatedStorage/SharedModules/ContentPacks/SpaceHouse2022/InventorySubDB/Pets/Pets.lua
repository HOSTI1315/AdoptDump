--// ReplicatedStorage.SharedModules.ContentPacks.SpaceHouse2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Capricorn",
    ["image"] = "rbxassetid://9542440966",
    ["model"] = "SpaceHouse2022Capricorn",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Space House",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "CapricornBeingHeldDouble",
        ["eating"] = "CapricornEat",
        ["flying"] = "CapricornRun",
        ["hold"] = "CapricornBeingHeldSingle",
        ["idle"] = "CapricornIdle",
        ["running"] = "CapricornRun",
        ["sit"] = "CapricornSit",
        ["sleep"] = "CapricornSleep"
    },
    ["tricks"] = {
        { "Sit", "CapricornSit" },
        { "Joyful", "CapricornJoyful" },
        { "Beg", "CapricornBeg" },
        { "Jump", "CapricornJump" },
        { "Trick 1", "CapricornTrick1" },
        { "Trick 2", "CapricornTrick2" }
    },
    ["neon_parts"] = {
        ["Head"] = Color3.fromRGB(189, 163, 114),
        ["LeftFoot"] = Color3.fromRGB(189, 163, 114),
        ["RightFoot"] = Color3.fromRGB(189, 163, 114),
        ["TailLeft"] = Color3.fromRGB(189, 163, 114),
        ["TailRight"] = Color3.fromRGB(189, 163, 114),
        ["Torso"] = Color3.fromRGB(189, 163, 114)
    },
    ["already_has_flying_wings"] = true,
    ["flying_move_anim_speed"] = 1,
    ["minimum_fly_anim_speed"] = 1
}
v2.space_house_2022_capricorn = v3
local v4 = {
    ["name"] = "Space Whale",
    ["image"] = "rbxassetid://9473352533",
    ["model"] = "SpaceHouse2022SpaceWhale",
    ["rarity"] = "ultra_rare",
    ["cost"] = 2499,
    ["origin_entry"] = {
        ["origin"] = "Space House",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "SpaceWhaleBeingHeldDouble",
        ["eating"] = "SpaceWhaleEat",
        ["flying"] = "SpaceWhaleRun",
        ["hold"] = "SpaceWhaleBeingHeldSingle",
        ["idle"] = "SpaceWhaleIdle",
        ["running"] = "SpaceWhaleRun",
        ["sit"] = "SpaceWhaleSit",
        ["sleep"] = "SpaceWhaleSleep"
    },
    ["tricks"] = {
        { "Sit", "SpaceWhaleSit" },
        { "Joyful", "SpaceWhaleJoyful" },
        { "Beg", "SpaceWhaleBeg" },
        { "Jump", "SpaceWhaleJump" },
        { "Trick 1", "SpaceWhaleTrick1" },
        { "Trick 2", "SpaceWhaleTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFin2"] = Color3.fromRGB(0, 188, 128),
        ["BackRightFin2"] = Color3.fromRGB(0, 188, 128),
        ["Fin"] = Color3.fromRGB(163, 166, 108),
        ["Fin2"] = Color3.fromRGB(163, 166, 108),
        ["Fin3"] = Color3.fromRGB(163, 166, 108),
        ["Fin4"] = Color3.fromRGB(163, 166, 108),
        ["Fin5"] = Color3.fromRGB(163, 166, 108),
        ["Fin6"] = Color3.fromRGB(163, 166, 108),
        ["Fin7"] = Color3.fromRGB(163, 166, 108),
        ["FrontLeftFin2"] = Color3.fromRGB(0, 188, 128),
        ["FrontRightFin2"] = Color3.fromRGB(0, 188, 128),
        ["HeadTenticle2"] = Color3.fromRGB(163, 166, 108),
        ["Stars"] = Color3.fromRGB(170, 170, 105),
        ["Tail"] = Color3.fromRGB(0, 188, 128),
        ["Tail2"] = Color3.fromRGB(163, 166, 108),
        ["Torso2"] = Color3.fromRGB(28, 28, 76),
        ["Torso3"] = Color3.fromRGB(163, 166, 108),
        ["Torso4"] = Color3.fromRGB(0, 188, 128)
    },
    ["already_has_flying_wings"] = true,
    ["flying_move_anim_speed"] = 1,
    ["minimum_fly_anim_speed"] = 1
}
v2.space_house_2022_space_whale = v4
return v1(v2)