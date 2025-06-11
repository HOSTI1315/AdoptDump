--// ReplicatedStorage.SharedModules.ContentPacks.Snow2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Albatross",
    ["image"] = "rbxassetid://9475753090",
    ["model"] = "Snow2022Albatross",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Snow Update",
        ["origin_items"] = { "snow_2022_golden_clam" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "AlbatrossBeingHeldDouble",
        ["eating"] = "AlbatrossEat",
        ["hold"] = "AlbatrossBeingHeldSingle",
        ["idle"] = "AlbatrossIdle",
        ["running"] = "AlbatrossRun",
        ["sit"] = "AlbatrossSit",
        ["sleep"] = "AlbatrossSleep"
    },
    ["tricks"] = {
        { "Sit", "AlbatrossSit" },
        { "Joyful", "AlbatrossJoyful" },
        { "Beg", "AlbatrossBeg" },
        { "Jump", "AlbatrossJump" },
        { "Trick 1", "AlbatrossTrick1" },
        { "Trick 2", "AlbatrossTrick2" }
    },
    ["neon_parts"] = {
        ["LeftWing2"] = Color3.fromRGB(190, 255, 120),
        ["LeftWing3"] = Color3.fromRGB(190, 255, 120),
        ["RightWing2"] = Color3.fromRGB(190, 255, 120),
        ["RightWing3"] = Color3.fromRGB(190, 255, 120),
        ["Tail"] = Color3.fromRGB(190, 255, 120),
        ["Torso2"] = Color3.fromRGB(190, 255, 120)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_run_anim_speed"] = 0.75
}
v2.snow_2022_albatross = v3
local v4 = {
    ["name"] = "Diamond Albatross",
    ["image"] = "rbxassetid://9602676771",
    ["model"] = "Snow2022DiamondAlbatross",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Snow Update",
        ["origin_items"] = { "snow_2022_golden_clam" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "AlbatrossBeingHeldDouble",
        ["eating"] = "AlbatrossEat",
        ["hold"] = "AlbatrossBeingHeldSingle",
        ["idle"] = "AlbatrossIdle",
        ["running"] = "AlbatrossRun",
        ["sit"] = "AlbatrossSit",
        ["sleep"] = "AlbatrossSleep"
    },
    ["tricks"] = {
        { "Sit", "AlbatrossSit" },
        { "Joyful", "AlbatrossJoyful" },
        { "Beg", "AlbatrossBeg" },
        { "Jump", "AlbatrossJump" },
        { "Trick 1", "AlbatrossTrick1" },
        { "Trick 2", "AlbatrossTrick2" }
    },
    ["neon_parts"] = {
        ["LeftWing2"] = Color3.fromRGB(131, 167, 188),
        ["LeftWing3"] = Color3.fromRGB(131, 167, 188),
        ["RightWing2"] = Color3.fromRGB(131, 167, 188),
        ["RightWing3"] = Color3.fromRGB(131, 167, 188),
        ["Tail"] = Color3.fromRGB(131, 167, 188),
        ["Torso2"] = Color3.fromRGB(131, 167, 188)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_run_anim_speed"] = 0.75
}
v2.snow_2022_diamond_albatross = v4
local v5 = {
    ["name"] = "Golden Albatross",
    ["image"] = "rbxassetid://9475753542",
    ["model"] = "Snow2022GoldenAlbatross",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Snow Update",
        ["origin_items"] = { "snow_2022_golden_clam" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "AlbatrossBeingHeldDouble",
        ["eating"] = "AlbatrossEat",
        ["hold"] = "AlbatrossBeingHeldSingle",
        ["idle"] = "AlbatrossIdle",
        ["running"] = "AlbatrossRun",
        ["sit"] = "AlbatrossSit",
        ["sleep"] = "AlbatrossSleep"
    },
    ["tricks"] = {
        { "Sit", "AlbatrossSit" },
        { "Joyful", "AlbatrossJoyful" },
        { "Beg", "AlbatrossBeg" },
        { "Jump", "AlbatrossJump" },
        { "Trick 1", "AlbatrossTrick1" },
        { "Trick 2", "AlbatrossTrick2" }
    },
    ["neon_parts"] = {
        ["LeftWing2"] = Color3.fromRGB(197, 135, 202),
        ["LeftWing3"] = Color3.fromRGB(197, 135, 202),
        ["RightWing2"] = Color3.fromRGB(197, 135, 202),
        ["RightWing3"] = Color3.fromRGB(197, 135, 202),
        ["Tail"] = Color3.fromRGB(197, 135, 202),
        ["Torso2"] = Color3.fromRGB(197, 135, 202)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["minimum_run_anim_speed"] = 0.75
}
v2.snow_2022_golden_albatross = v5
local v6 = {
    ["name"] = "Ribbon Seal",
    ["image"] = "rbxassetid://9474010501",
    ["model"] = "Snow2022RibbonSeal",
    ["rarity"] = "ultra_rare",
    ["cost"] = 700,
    ["origin_entry"] = {
        ["origin"] = "Snow Update",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "SealBeingHeldDouble",
        ["eating"] = "SealEat",
        ["hold"] = "SealBeingHeldSingle",
        ["idle"] = "SealIdle",
        ["running"] = "SealRun",
        ["sit"] = "SealSit",
        ["sleep"] = "SealSleep"
    },
    ["tricks"] = {
        { "Sit", "SealSit" },
        { "Joyful", "SealJoyful" },
        { "Beg", "SealBeg" },
        { "Jump", "SealJump" },
        { "Trick 1", "SealTrick1" },
        { "Trick 2", "SealTrick2" }
    },
    ["neon_parts"] = {
        ["Head_02"] = Color3.fromRGB(110, 153, 202),
        ["Spine_01"] = Color3.fromRGB(110, 153, 202)
    },
    ["eyes"] = { "Eye_L", "Eye_R" },
    ["liveops_map_type_required_for_purchase"] = "Snow"
}
v2.snow_2022_ribbon_seal = v6
return v1(v2)