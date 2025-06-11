--// ReplicatedStorage.SharedModules.ContentPacks.SkyUX2023.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Cuddly Candle",
    ["image"] = "rbxassetid://13186021971",
    ["model"] = "SkyUX2023CuddlyCandle",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Sky Castle",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "SkyUX2023CuddlyCandleBeingHeldDouble",
        ["eating"] = "SkyUX2023CuddlyCandleEat",
        ["hold"] = "SkyUX2023CuddlyCandleBeingHeldSingle",
        ["idle"] = "SkyUX2023CuddlyCandleIdle",
        ["running"] = "SkyUX2023CuddlyCandleRun",
        ["sit"] = "SkyUX2023CuddlyCandleSit",
        ["sleep"] = "SkyUX2023CuddlyCandleSleep"
    },
    ["tricks"] = {
        { "Sit", "SkyUX2023CuddlyCandleSit" },
        { "Joyful", "SkyUX2023CuddlyCandleJoyful" },
        { "Beg", "SkyUX2023CuddlyCandleBeg" },
        { "Jump", "SkyUX2023CuddlyCandleJump" },
        { "Trick 1", "SkyUX2023CuddlyCandleTrick1" },
        { "Trick 2", "SkyUX2023CuddlyCandleTrick2" }
    },
    ["neon_parts"] = {
        ["Flame2"] = Color3.fromRGB(180, 184, 107),
        ["Flame3"] = Color3.fromRGB(180, 184, 107),
        ["FlameInner"] = Color3.fromRGB(180, 184, 107),
        ["FlameMiddle"] = Color3.fromRGB(180, 184, 107),
        ["FlameOuter"] = Color3.fromRGB(180, 184, 107),
        ["Head"] = Color3.fromRGB(180, 184, 107),
        ["Torso3"] = Color3.fromRGB(180, 184, 107),
        ["Wick"] = Color3.fromRGB(180, 184, 107),
        ["Wick2"] = Color3.fromRGB(180, 184, 107)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.sky_ux_2023_cuddly_candle = v3
local v4 = {
    ["name"] = "Grinmoire",
    ["image"] = "rbxassetid://13186022212",
    ["model"] = "SkyUX2023Grinmoire",
    ["rarity"] = "ultra_rare",
    ["cost"] = 2500,
    ["origin_entry"] = {
        ["origin"] = "Sky Castle",
        ["origin_items"] = {},
        ["year"] = 2023
    },
    ["anims"] = {
        ["double_hold"] = "SkyUX2023GrinmoireBeingHeldDouble",
        ["eating"] = "SkyUX2023GrinmoireEat",
        ["flying"] = "SkyUX2023GrinmoireIdle",
        ["hold"] = "SkyUX2023GrinmoireBeingHeldSingle",
        ["idle"] = "SkyUX2023GrinmoireIdle",
        ["running"] = "SkyUX2023GrinmoireRun",
        ["running_mounted"] = "SkyUX2023GrinmoireIdle",
        ["sit"] = "SkyUX2023GrinmoireSit",
        ["sleep"] = "SkyUX2023GrinmoireSleep"
    },
    ["tricks"] = {
        { "Sit", "SkyUX2023GrinmoireSit" },
        { "Joyful", "SkyUX2023GrinmoireJoyful" },
        { "Beg", "SkyUX2023GrinmoireBeg" },
        { "Jump", "SkyUX2023GrinmoireJump" },
        { "Trick 1", "SkyUX2023GrinmoireTrick1" },
        { "Trick 2", "SkyUX2023GrinmoireTrick2" }
    },
    ["neon_parts"] = {
        ["Page1"] = Color3.fromRGB(124, 89, 213),
        ["Page10"] = Color3.fromRGB(124, 89, 213),
        ["Page11"] = Color3.fromRGB(124, 89, 213),
        ["Page12"] = Color3.fromRGB(124, 89, 213),
        ["Page13"] = Color3.fromRGB(124, 89, 213),
        ["Page14"] = Color3.fromRGB(124, 89, 213),
        ["Page15"] = Color3.fromRGB(124, 89, 213),
        ["Page16"] = Color3.fromRGB(124, 89, 213),
        ["Page2"] = Color3.fromRGB(124, 89, 213),
        ["Page3"] = Color3.fromRGB(124, 89, 213),
        ["Page4"] = Color3.fromRGB(124, 89, 213),
        ["Page5"] = Color3.fromRGB(124, 89, 213),
        ["Page6"] = Color3.fromRGB(124, 89, 213),
        ["Page7"] = Color3.fromRGB(124, 89, 213),
        ["Page8"] = Color3.fromRGB(124, 89, 213),
        ["Page9"] = Color3.fromRGB(124, 89, 213),
        ["Torso"] = Color3.fromRGB(124, 89, 213)
    },
    ["generate_npc_furniture_on_runtime"] = true
}
v2.sky_ux_2023_grinmoire = v4
return v1(v2)