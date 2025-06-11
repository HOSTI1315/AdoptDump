--// ReplicatedStorage.SharedModules.ContentPacks.Meme2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Feesh",
    ["image"] = "rbxassetid://12139319231",
    ["model"] = "Meme2023Feesh",
    ["rarity"] = "rare",
    ["cost"] = 1500,
    ["origin_entry"] = {
        ["origin"] = "Meme",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Meme2023FeeshBeingDoubleHeld",
        ["eating"] = "Meme2023FeeshEating",
        ["hold"] = "Meme2023FeeshBeingHeld",
        ["idle"] = "Meme2023FeeshIdle",
        ["running"] = "Meme2023FeeshRun",
        ["sit"] = "Meme2023FeeshSit",
        ["sleep"] = "Meme2023FeeshSleep"
    },
    ["tricks"] = {
        { "Sit", "Meme2023FeeshSit" },
        { "Joyful", "Meme2023FeeshJoyful" },
        { "Beg", "Meme2023FeeshBeg" },
        { "Jump", "Meme2023FeeshJump" },
        { "Trick 1", "Meme2023FeeshTrick1" },
        { "Trick 2", "Meme2023FeeshTrick2" }
    },
    ["neon_parts"] = {
        ["DorsalFin"] = Color3.fromRGB(111, 156, 185),
        ["Gills"] = Color3.fromRGB(111, 156, 185),
        ["Head"] = Color3.fromRGB(111, 156, 185),
        ["LeftFin"] = Color3.fromRGB(111, 156, 185),
        ["LeftFoot"] = Color3.fromRGB(111, 156, 185),
        ["RightFin"] = Color3.fromRGB(111, 156, 185),
        ["RightFoot"] = Color3.fromRGB(111, 156, 185)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true,
    ["minimum_fly_anim_speed"] = 0.8
}
v2.meme_2023_feesh = v3
local v4 = {
    ["name"] = "Frogspawn",
    ["image"] = "rbxassetid://12139338880",
    ["model"] = "Meme2023Frogspawn",
    ["rarity"] = "uncommon",
    ["cost"] = 600
}
local v5 = {
    ["origin"] = "Meme",
    ["origin_items"] = {},
    ["viewport_override"] = {
        ["distance"] = 3.5,
        ["offset"] = CFrame.new(0, 0, -0.5)
    },
    ["year"] = 2023
}
v4.origin_entry = v5
v4.anims = {
    ["double_hold"] = "Meme2023FrogspawnBeingDoubleHeld",
    ["eating"] = "Meme2023FrogspawnEating",
    ["hold"] = "Meme2023FrogspawnBeingHeld",
    ["idle"] = "Meme2023FrogspawnIdle",
    ["running"] = "Meme2023FrogspawnRun",
    ["sit"] = "Meme2023FrogspawnSit",
    ["sleep"] = "Meme2023FrogspawnSleep"
}
v4.tricks = {
    { "Sit", "Meme2023FrogspawnSit" },
    { "Joyful", "Meme2023FrogspawnJoyful" },
    { "Beg", "Meme2023FrogspawnBeg" },
    { "Jump", "Meme2023FrogspawnJump" },
    { "Trick 1", "Meme2023FrogspawnTrick1" },
    { "Trick 2", "Meme2023FrogspawnTrick2" }
}
local v6 = {
    ["NeonTorso"] = {
        ["Color"] = Color3.fromRGB(111, 191, 116),
        ["Transparency"] = 0
    },
    ["Torso"] = {
        ["Transparency"] = 1
    }
}
v4.neon_parts = v6
v4.already_has_flying_wings = false
v4.eyes = { "EyeLeft", "EyeRight" }
v4.generate_npc_furniture_on_runtime = true
v4.minimum_fly_anim_speed = 0.8
v2.meme_2023_frogspawn = v4
local v7 = {
    ["name"] = "Sheeeeep",
    ["image"] = "rbxassetid://12139402705",
    ["model"] = "Meme2023Sheeeeep",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Meme",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "Meme2023SheeeeepBeingDoubleHeld",
        ["eating"] = "Meme2023SheeeeepEating",
        ["hold"] = "Meme2023SheeeeepBeingHeld",
        ["idle"] = "Meme2023SheeeeepIdle",
        ["running"] = "Meme2023SheeeeepRun",
        ["sit"] = "Meme2023SheeeeepSit",
        ["sleep"] = "Meme2023SheeeeepSleep"
    },
    ["tricks"] = {
        { "Sit", "Meme2023SheeeeepSit" },
        { "Joyful", "Meme2023SheeeeepJoyful" },
        { "Beg", "Meme2023SheeeeepBeg" },
        { "Jump", "Meme2023SheeeeepJump" },
        { "Trick 1", "Meme2023SheeeeepTrick1" },
        { "Trick 2", "Meme2023SheeeeepTrick2" }
    },
    ["neon_parts"] = {
        ["Hair"] = Color3.fromRGB(181, 111, 186),
        ["Spine1"] = Color3.fromRGB(181, 111, 186),
        ["Tail"] = Color3.fromRGB(181, 111, 186),
        ["Tail2"] = Color3.fromRGB(181, 111, 186),
        ["Tail3"] = Color3.fromRGB(181, 111, 186),
        ["Torso"] = Color3.fromRGB(181, 111, 186)
    },
    ["already_has_flying_wings"] = false,
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true,
    ["minimum_fly_anim_speed"] = 0.8
}
v2.meme_2023_sheeeeep = v7
return v1(v2)