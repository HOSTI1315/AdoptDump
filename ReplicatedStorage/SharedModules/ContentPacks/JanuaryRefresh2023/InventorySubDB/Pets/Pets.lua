--// ReplicatedStorage.SharedModules.ContentPacks.JanuaryRefresh2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Bloodhound",
    ["image"] = "rbxassetid://11571113805",
    ["model"] = "JanRefresh2023Bloodhound",
    ["rarity"] = "rare",
    ["cost"] = 600,
    ["origin_entry"] = {
        ["origin"] = "UGC Refresh",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "BloodhoundBeingHeldDouble",
        ["eating"] = "BloodhoundEat",
        ["flying"] = "BloodhoundRun",
        ["hold"] = "BloodhoundBeingHeldSingle",
        ["idle"] = "BloodhoundIdle",
        ["running"] = "BloodhoundRun",
        ["sit"] = "BloodhoundSit",
        ["sleep"] = "BloodhoundSleep"
    },
    ["tricks"] = {
        { "Sit", "BloodhoundSit" },
        { "Joyful", "BloodhoundJoyful" },
        { "Beg", "BloodhoundBeg" },
        { "Jump", "BloodhoundJump" },
        { "Trick 1", "BloodhoundTrick1" },
        { "Trick 2", "BloodhoundTrick2" }
    },
    ["neon_parts"] = {
        ["Head2"] = Color3.fromRGB(186, 181, 155),
        ["LeftEar"] = Color3.fromRGB(186, 181, 155),
        ["LeftEar2"] = Color3.fromRGB(186, 181, 155),
        ["LeftEar3"] = Color3.fromRGB(186, 181, 155),
        ["RightEar"] = Color3.fromRGB(186, 181, 155),
        ["RightEar2"] = Color3.fromRGB(186, 181, 155),
        ["RightEar3"] = Color3.fromRGB(186, 181, 155),
        ["Tail"] = Color3.fromRGB(186, 181, 155)
    },
    ["eyes"] = { "Eyes" },
    ["generate_npc_furniture_on_runtime"] = true,
    ["minimum_fly_anim_speed"] = 0.5
}
v2.jan_refresh_2023_bloodhound = v3
local v4 = {
    ["name"] = "Glacier Moth",
    ["image"] = "rbxassetid://11571113906",
    ["model"] = "JanRefresh2023GlacierMoth",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "UGC Refresh",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "GlacierMothBeingHeldDouble",
        ["eating"] = "GlacierMothEat",
        ["flying"] = "GlacierMothRun",
        ["hold"] = "GlacierMothBeingHeldSingle",
        ["idle"] = "GlacierMothIdle",
        ["running"] = "GlacierMothRun",
        ["sit"] = "GlacierMothSit",
        ["sleep"] = "GlacierMothSleep"
    },
    ["tricks"] = {
        { "Sit", "GlacierMothSit" },
        { "Joyful", "GlacierMothJoyful" },
        { "Beg", "GlacierMothBeg" },
        { "Jump", "GlacierMothJump" },
        { "Trick 1", "GlacierMothTrick1" },
        { "Trick 2", "GlacierMothTrick2" }
    },
    ["neon_parts"] = {
        ["Body"] = Color3.fromRGB(102, 147, 219),
        ["LeftAntenna"] = Color3.fromRGB(102, 147, 219),
        ["LeftWing1"] = Color3.fromRGB(102, 147, 219),
        ["LeftWing2"] = Color3.fromRGB(102, 147, 219),
        ["RightAntenna"] = Color3.fromRGB(102, 147, 219),
        ["RightWing1"] = Color3.fromRGB(102, 147, 219),
        ["RightWing2"] = Color3.fromRGB(102, 147, 219)
    },
    ["already_has_flying_wings"] = true,
    ["eyes"] = { "Eyes" },
    ["flying_move_anim_speed"] = 0.6,
    ["minimum_fly_anim_speed"] = 0.6
}
v2.ugc_rewards_2023_glacier_moth = v4
return v1(v2)