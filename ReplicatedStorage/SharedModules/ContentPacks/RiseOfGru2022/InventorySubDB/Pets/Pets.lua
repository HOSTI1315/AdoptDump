--// ReplicatedStorage.SharedModules.ContentPacks.RiseOfGru2022.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Zodiac Minion Chick",
    ["image"] = "rbxassetid://9669227320",
    ["model"] = "Gru2022ZodiacChick",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Minions: Rise of Gru",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["anims"] = {
        ["double_hold"] = "ZodiacChickBeingHeldDouble",
        ["eating"] = "ZodiacChickEat",
        ["hold"] = "ZodiacChickBeingHeldSingle",
        ["idle"] = "ZodiacChickIdle",
        ["running"] = "ZodiacChickRun",
        ["sit"] = "ZodiacChickSit",
        ["sleep"] = "ZodiacChickSleep"
    },
    ["tricks"] = {
        { "Sit", "ZodiacChickSit" },
        { "Joyful", "ZodiacChickJoyful" },
        { "Beg", "ZodiacChickBeg" },
        { "Jump", "ZodiacChickJump" },
        { "Trick 1", "ZodiacChickTrick1" },
        { "Trick 2", "ZodiacChickTrick2" }
    },
    ["neon_parts"] = {
        ["Beak"] = Color3.fromRGB(218, 133, 65),
        ["Hair"] = Color3.fromRGB(218, 133, 65),
        ["LeftFoot"] = Color3.fromRGB(218, 133, 65),
        ["LeftWing"] = Color3.fromRGB(218, 133, 65),
        ["RightFoot"] = Color3.fromRGB(218, 133, 65),
        ["RightWing"] = Color3.fromRGB(218, 133, 65),
        ["Tail"] = Color3.fromRGB(218, 133, 65)
    },
    ["flying_wings_color"] = Color3.fromRGB(245, 205, 48),
    ["head_rotator_uses_torso_instead"] = true,
    ["is_right_eye_hidden"] = true,
    ["wings_override"] = "default_wings"
}
v2.gru_2022_zodiac_chick = v3
local v4 = {
    ["name"] = "Zodiac Minion Egg",
    ["image"] = "rbxassetid://9661880325",
    ["model"] = "Gru2022ZodiacEgg",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Minions: Rise of Gru",
        ["origin_items"] = {},
        ["year"] = 2022
    },
    ["is_egg"] = true,
    ["anims"] = {
        ["double_hold"] = "EggBeingDoubleHeld",
        ["eating"] = "DogEating",
        ["hold"] = "EggBeingHeld",
        ["idle"] = "EggIdle2",
        ["running"] = "EggRunning",
        ["sit"] = "DogSit",
        ["sleep"] = "DogSleep"
    },
    ["ailments_to_hatch"] = 6
}
v2.gru_2022_zodiac_egg = v4
return v1(v2)