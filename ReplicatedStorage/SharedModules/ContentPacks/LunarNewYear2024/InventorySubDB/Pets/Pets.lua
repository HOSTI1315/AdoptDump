--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Fanghorn Tortoise",
    ["image"] = "rbxassetid://16075008092",
    ["model"] = "Lunar2024FanghornTortoise",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = { "lunar_2024_lunar_new_year_gift_box", "lunar_2024_special_lunar_new_year_gift_box" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Lunar2024FanghornTortoiseBeingHeldDouble",
        ["eating"] = "Lunar2024FanghornTortoiseEat",
        ["flying"] = "Lunar2024FanghornTortoiseRun",
        ["hold"] = "Lunar2024FanghornTortoiseBeingHeldSingle",
        ["idle"] = "Lunar2024FanghornTortoiseIdle",
        ["running"] = "Lunar2024FanghornTortoiseRun",
        ["sit"] = "Lunar2024FanghornTortoiseSit",
        ["sleep"] = "Lunar2024FanghornTortoiseSleep"
    },
    ["tricks"] = {
        { "Sit", "Lunar2024FanghornTortoiseSit" },
        { "Joyful", "Lunar2024FanghornTortoiseJoyful" },
        { "Beg", "Lunar2024FanghornTortoiseBeg" },
        { "Jump", "Lunar2024FanghornTortoiseJump" },
        { "Trick 1", "Lunar2024FanghornTortoiseTrick1" },
        { "Trick 2", "Lunar2024FanghornTortoiseTrick2" }
    },
    ["neon_parts"] = {
        ["BackLeftFoot"] = Color3.fromRGB(81, 184, 105),
        ["BackRightFoot"] = Color3.fromRGB(81, 184, 105),
        ["Beard"] = Color3.fromRGB(81, 184, 105),
        ["FrontLeftFoot"] = Color3.fromRGB(81, 184, 105),
        ["FrontRightFoot"] = Color3.fromRGB(81, 184, 105),
        ["Horns"] = Color3.fromRGB(81, 184, 105),
        ["Torso"] = Color3.fromRGB(81, 184, 105)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.lunar_2024_fanghorn_tortoise = v3
local v4 = {
    ["name"] = "Midnight Dragon",
    ["image"] = "rbxassetid://16127039676",
    ["model"] = "Lunar2024MidnightDragon",
    ["rarity"] = "legendary"
}
local v5 = {
    ["origin"] = "Lunar New Year",
    ["origin_items"] = {},
    ["viewport_override"] = {
        ["distance"] = 9.5,
        ["offset"] = CFrame.new(0, -1.5, 1.25)
    },
    ["year"] = 2024
}
v4.origin_entry = v5
v4.anims = {
    ["double_hold"] = "Lunar2024MidnightDragonBeingHeldDouble",
    ["eating"] = "Lunar2024MidnightDragonEat",
    ["flying"] = "Lunar2024MidnightDragonRun",
    ["hold"] = "Lunar2024MidnightDragonBeingHeldSingle",
    ["idle"] = "Lunar2024MidnightDragonIdle",
    ["running"] = "Lunar2024MidnightDragonRun",
    ["sit"] = "Lunar2024MidnightDragonSit",
    ["sleep"] = "Lunar2024MidnightDragonSleep"
}
v4.tricks = {
    { "Sit", "Lunar2024MidnightDragonSit" },
    { "Joyful", "Lunar2024MidnightDragonJoyful" },
    { "Beg", "Lunar2024MidnightDragonBeg" },
    { "Jump", "Lunar2024MidnightDragonJump" },
    { "Trick 1", "Lunar2024MidnightDragonTrick1" },
    { "Trick 2", "Lunar2024MidnightDragonTrick2" }
}
v4.neon_parts = {
    ["Eyes"] = Color3.fromRGB(160, 130, 195),
    ["Hair"] = Color3.fromRGB(79, 175, 72),
    ["LeftFoot"] = Color3.fromRGB(79, 175, 72),
    ["RightFoot"] = Color3.fromRGB(79, 175, 72),
    ["Stars"] = Color3.fromRGB(244, 249, 255),
    ["Stars2"] = Color3.fromRGB(227, 163, 254),
    ["Tail"] = Color3.fromRGB(79, 175, 72),
    ["Torso"] = Color3.fromRGB(20, 29, 70),
    ["Torso2"] = Color3.fromRGB(79, 175, 72)
}
v4.already_has_flying_wings = true
v4.generate_npc_furniture_on_runtime = true
v4.max_ride_scale = 1.2
v4.mounted_animation_scale_limit = 1
v2.lunar_2024_midnight_dragon = v4
local v6 = {
    ["name"] = "Rainbow Dragon",
    ["image"] = "rbxassetid://16116063171",
    ["model"] = "Lunar2024RainbowDragon",
    ["rarity"] = "legendary"
}
local v7 = {
    ["origin"] = "Lunar New Year",
    ["origin_items"] = { "lunar_2024_lunar_new_year_gift_box", "lunar_2024_special_lunar_new_year_gift_box" },
    ["viewport_override"] = {
        ["distance"] = 9.5,
        ["offset"] = CFrame.new(0, 0, 6.5)
    },
    ["year"] = 2024
}
v6.origin_entry = v7
v6.anims = {
    ["double_hold"] = "Lunar2024RainbowDragonBeingHeldDouble",
    ["eating"] = "Lunar2024RainbowDragonEat",
    ["flying"] = "Lunar2024RainbowDragonRun",
    ["hold"] = "Lunar2024RainbowDragonBeingHeldSingle",
    ["idle"] = "Lunar2024RainbowDragonIdle",
    ["running"] = "Lunar2024RainbowDragonRun",
    ["sit"] = "Lunar2024RainbowDragonSit",
    ["sleep"] = "Lunar2024RainbowDragonSleep"
}
v6.tricks = {
    { "Sit", "Lunar2024RainbowDragonSit" },
    { "Joyful", "Lunar2024RainbowDragonJoyful" },
    { "Beg", "Lunar2024RainbowDragonBeg" },
    { "Jump", "Lunar2024RainbowDragonJump" },
    { "Trick 1", "Lunar2024RainbowDragonTrick1" },
    { "Trick 2", "Lunar2024RainbowDragonTrick2" }
}
v6.neon_parts = {
    ["Brows"] = Color3.fromRGB(184, 129, 0),
    ["LeftFoot2"] = Color3.fromRGB(184, 129, 0),
    ["RightFoot2"] = Color3.fromRGB(184, 129, 0),
    ["Spike"] = Color3.fromRGB(111, 15, 16),
    ["Spike10"] = Color3.fromRGB(90, 182, 32),
    ["Spike11"] = Color3.fromRGB(125, 189, 41),
    ["Spike12"] = Color3.fromRGB(91, 185, 33),
    ["Spike13"] = Color3.fromRGB(37, 81, 135),
    ["Spike2"] = Color3.fromRGB(185, 9, 9),
    ["Spike3"] = Color3.fromRGB(255, 0, 0),
    ["Spike4"] = Color3.fromRGB(188, 94, 0),
    ["Spike5"] = Color3.fromRGB(173, 121, 0),
    ["Spike6"] = Color3.fromRGB(42, 134, 28),
    ["Spike7"] = Color3.fromRGB(0, 94, 217),
    ["Spike8"] = Color3.fromRGB(54, 119, 194),
    ["Spike9"] = Color3.fromRGB(255, 44, 44),
    ["Tail"] = Color3.fromRGB(184, 129, 0),
    ["Whiskers"] = Color3.fromRGB(184, 129, 0)
}
v6.already_has_flying_wings = true
v6.generate_npc_furniture_on_runtime = true
v6.max_ride_scale = 1.6
v6.mounted_animation_scale_limit = 1
v6.head_rotator_disabled = true
v2.lunar_2024_rainbow_dragon = v6
local v8 = {
    ["name"] = "Rice Cake Rabbit",
    ["image"] = "rbxassetid://16127157068",
    ["model"] = "Lunar2024RiceCakeRabbit",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Lunar New Year",
        ["origin_items"] = { "lunar_2024_lunar_new_year_gift_box", "lunar_2024_special_lunar_new_year_gift_box" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "Lunar2024RiceCakeRabbitBeingHeldDouble",
        ["eating"] = "Lunar2024RiceCakeRabbitEat",
        ["flying"] = "Lunar2024RiceCakeRabbitRun",
        ["hold"] = "Lunar2024RiceCakeRabbitBeingHeldSingle",
        ["idle"] = "Lunar2024RiceCakeRabbitIdle",
        ["running"] = "Lunar2024RiceCakeRabbitRun",
        ["sit"] = "Lunar2024RiceCakeRabbitSit",
        ["sleep"] = "Lunar2024RiceCakeRabbitSleep"
    },
    ["tricks"] = {
        { "Sit", "Lunar2024RiceCakeRabbitSit" },
        { "Joyful", "Lunar2024RiceCakeRabbitJoyful" },
        { "Beg", "Lunar2024RiceCakeRabbitBeg" },
        { "Jump", "Lunar2024RiceCakeRabbitJump" },
        { "Trick 1", "Lunar2024RiceCakeRabbitTrick1" },
        { "Trick 2", "Lunar2024RiceCakeRabbitTrick2" }
    },
    ["neon_parts"] = {
        ["Eyes"] = Color3.fromRGB(171, 125, 186),
        ["Head2"] = Color3.fromRGB(115, 105, 191),
        ["Head3"] = Color3.fromRGB(115, 105, 191),
        ["LeftEar2"] = Color3.fromRGB(115, 105, 191),
        ["RightEar2"] = Color3.fromRGB(115, 105, 191),
        ["Tail"] = Color3.fromRGB(115, 105, 191)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.lunar_2024_rice_cake_rabbit = v8
return v1(v2)