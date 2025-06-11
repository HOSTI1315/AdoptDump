--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Dancing Dragon",
    ["image"] = "rbxassetid://8665606875",
    ["model"] = "LNY2022Dragon",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "LNYDragonBeingHeldDouble",
        ["eating"] = "LNYDragonEat",
        ["hold"] = "LNYDragonBeingHeldSingle",
        ["idle"] = "LNYDragonIdle",
        ["idle_mounted"] = "LNYDragonRun",
        ["running"] = "LNYDragonRun",
        ["sit"] = "LNYDragonSit",
        ["sleep"] = "LNYDragonSleep"
    },
    ["tricks"] = {
        { "Sit", "LNYDragonSit" },
        { "Joyful", "LNYDragonJoyful" },
        { "Beg", "LNYDragonBeg" },
        { "Jump", "LNYDragonJump" },
        { "Trick 1", "LNYDragonTrick1" },
        { "Trick 2", "LNYDragonTrick2" }
    },
    ["neon_parts"] = {
        ["EarL2"] = Color3.fromRGB(188, 118, 60),
        ["EarR2"] = Color3.fromRGB(188, 118, 60),
        ["Hair"] = Color3.fromRGB(188, 118, 60),
        ["Hair2"] = Color3.fromRGB(188, 118, 60),
        ["LeftBackFoot2"] = Color3.fromRGB(188, 118, 60),
        ["LeftFrontFoot2"] = Color3.fromRGB(188, 118, 60),
        ["LeftWhisker"] = Color3.fromRGB(188, 118, 60),
        ["Nose2"] = Color3.fromRGB(188, 118, 60),
        ["RightBackFoot2"] = Color3.fromRGB(188, 118, 60),
        ["RightFrontFoot2"] = Color3.fromRGB(188, 118, 60),
        ["RightWhisker"] = Color3.fromRGB(188, 118, 60),
        ["Tail"] = Color3.fromRGB(188, 118, 60),
        ["Torso2"] = Color3.fromRGB(188, 118, 60)
    },
    ["already_has_flying_wings"] = true,
    ["avatar_editor_app_camera_distance_overrides"] = {
        ["fit_to_screen"] = 17.846,
        ["front_facing"] = 13.754
    },
    ["flying_move_anim_speed"] = 1,
    ["minimum_fly_anim_speed"] = 1,
    ["minimum_run_anim_speed"] = 1
}
v2.lny_2022_dragon = v3
local v4 = {
    ["name"] = "Lunar Tiger",
    ["image"] = "rbxassetid://8663441120",
    ["model"] = "LNY2022Tiger",
    ["rarity"] = "rare",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = { "lny_2022_tiger_box" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "TigerBeingHeldDouble",
        ["eating"] = "TigerEat",
        ["hold"] = "TigerBeingHeldSingle",
        ["idle"] = "TigerIdle",
        ["running"] = "TigerRun",
        ["sit"] = "TigerSit",
        ["sleep"] = "TigerSleep"
    },
    ["tricks"] = {
        { "Sit", "TigerSit" },
        { "Joyful", "TigerJoyful" },
        { "Beg", "TigerBeg" },
        { "Jump", "TigerJump" },
        { "Trick 1", "TigerTrick1" },
        { "Trick 2", "TigerTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(219, 38, 26),
        ["LeftEar2"] = Color3.fromRGB(219, 38, 26),
        ["RightEar2"] = Color3.fromRGB(219, 38, 26),
        ["Tail2"] = Color3.fromRGB(219, 38, 26),
        ["Torso3"] = Color3.fromRGB(219, 38, 26)
    }
}
v2.lny_2022_tiger = v4
local v5 = {
    ["name"] = "Lunar Gold Tiger",
    ["image"] = "rbxassetid://8663440945",
    ["model"] = "LNY2022TigerGold",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = { "lny_2022_tiger_box" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "TigerBeingHeldDouble",
        ["eating"] = "TigerEat",
        ["hold"] = "TigerBeingHeldSingle",
        ["idle"] = "TigerIdle",
        ["running"] = "TigerRun",
        ["sit"] = "TigerSit",
        ["sleep"] = "TigerSleep"
    },
    ["tricks"] = {
        { "Sit", "TigerSit" },
        { "Joyful", "TigerJoyful" },
        { "Beg", "TigerBeg" },
        { "Jump", "TigerJump" },
        { "Trick 1", "TigerTrick1" },
        { "Trick 2", "TigerTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(43, 93, 193),
        ["LeftEar2"] = Color3.fromRGB(43, 93, 193),
        ["RightEar2"] = Color3.fromRGB(43, 93, 193),
        ["Tail2"] = Color3.fromRGB(43, 93, 193),
        ["Torso3"] = Color3.fromRGB(43, 93, 193)
    }
}
v2.lny_2022_tiger_gold = v5
local v6 = {
    ["name"] = "Lunar White Tiger",
    ["image"] = "rbxassetid://8663441035",
    ["model"] = "LNY2022TigerWhite",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = { "lny_2022_tiger_box" },
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "TigerBeingHeldDouble",
        ["eating"] = "TigerEat",
        ["hold"] = "TigerBeingHeldSingle",
        ["idle"] = "TigerIdle",
        ["running"] = "TigerRun",
        ["sit"] = "TigerSit",
        ["sleep"] = "TigerSleep"
    },
    ["tricks"] = {
        { "Sit", "TigerSit" },
        { "Joyful", "TigerJoyful" },
        { "Beg", "TigerBeg" },
        { "Jump", "TigerJump" },
        { "Trick 1", "TigerTrick1" },
        { "Trick 2", "TigerTrick2" }
    },
    ["neon_parts"] = {
        ["Head3"] = Color3.fromRGB(186, 105, 175),
        ["LeftEar2"] = Color3.fromRGB(186, 105, 175),
        ["RightEar2"] = Color3.fromRGB(186, 105, 175),
        ["Tail2"] = Color3.fromRGB(186, 105, 175),
        ["Torso3"] = Color3.fromRGB(186, 105, 175)
    }
}
v2.lny_2022_tiger_white = v6
return v1(v2)