--// ReplicatedStorage.SharedModules.ContentPacks.Beach2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Nautilus",
    ["image"] = "rbxassetid://16382424275",
    ["model"] = "Beach2024Nautilus",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Summer Beach",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Beach2024NautilusSleep",
        ["running"] = "Beach2024NautilusRun",
        ["idle"] = "Beach2024NautilusIdle",
        ["eating"] = "Beach2024NautilusEat",
        ["sit"] = "Beach2024NautilusSit",
        ["flying"] = "Beach2024NautilusRun",
        ["hold"] = "Beach2024NautilusBeingHeldSingle",
        ["double_hold"] = "Beach2024NautilusBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Beach2024NautilusSit" },
        { "Joyful", "Beach2024NautilusJoyful" },
        { "Beg", "Beach2024NautilusBeg" },
        { "Jump", "Beach2024NautilusJump" },
        { "Trick 1", "Beach2024NautilusTrick1" },
        { "Trick 2", "Beach2024NautilusTrick2" }
    },
    ["neon_parts"] = {
        ["HeadShell"] = Color3.fromRGB(63, 103, 214),
        ["HeadShell3"] = Color3.fromRGB(63, 103, 214),
        ["Torso"] = Color3.fromRGB(63, 103, 214)
    },
    ["already_has_flying_wings"] = true,
    ["generate_npc_furniture_on_runtime"] = true
}
v2.beach_2024_nautilus = v3
local v4 = {
    ["name"] = "Mahi Mahi",
    ["image"] = "rbxassetid://16440727263",
    ["model"] = "Beach2024MahiMahi",
    ["rarity"] = "uncommon",
    ["origin_entry"] = {
        ["origin"] = "Summer Beach",
        ["origin_items"] = { "beach_2024_mahi_spinning_rod" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Beach2024MahiMahiSleep",
        ["running"] = "Beach2024MahiMahiRun",
        ["idle"] = "Beach2024MahiMahiIdle",
        ["eating"] = "Beach2024MahiMahiEat",
        ["sit"] = "Beach2024MahiMahiSit",
        ["flying"] = "Beach2024MahiMahiRun",
        ["hold"] = "Beach2024MahiMahiBeingHeldSingle",
        ["double_hold"] = "Beach2024MahiMahiBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Beach2024MahiMahiSit" },
        { "Joyful", "Beach2024MahiMahiJoyful" },
        { "Beg", "Beach2024MahiMahiBeg" },
        { "Jump", "Beach2024MahiMahiJump" },
        { "Trick 1", "Beach2024MahiMahiTrick1" },
        { "Trick 2", "Beach2024MahiMahiTrick2" }
    },
    ["neon_parts"] = {
        ["TailFin"] = Color3.fromRGB(14, 119, 194),
        ["BottomFin2"] = Color3.fromRGB(14, 119, 194),
        ["Torso3"] = Color3.fromRGB(14, 119, 194),
        ["RightFin"] = Color3.fromRGB(14, 119, 194),
        ["DorsalFin2"] = Color3.fromRGB(14, 119, 194),
        ["LeftFin"] = Color3.fromRGB(14, 119, 194),
        ["RightBottomFin2"] = Color3.fromRGB(14, 119, 194),
        ["LeftBottomFIn2"] = Color3.fromRGB(14, 119, 194)
    },
    ["already_has_flying_wings"] = true
}
v2.beach_2024_mahi_mahi = v4
local v5 = {
    ["name"] = "Gold Mahi Mahi",
    ["image"] = "rbxassetid://16441364976",
    ["model"] = "Beach2024GoldMahiMahi",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "Summer Beach",
        ["origin_items"] = { "beach_2024_mahi_spinning_rod" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Beach2024MahiMahiSleep",
        ["running"] = "Beach2024MahiMahiRun",
        ["idle"] = "Beach2024MahiMahiIdle",
        ["eating"] = "Beach2024MahiMahiEat",
        ["sit"] = "Beach2024MahiMahiSit",
        ["flying"] = "Beach2024MahiMahiRun",
        ["hold"] = "Beach2024MahiMahiBeingHeldSingle",
        ["double_hold"] = "Beach2024MahiMahiBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Beach2024MahiMahiSit" },
        { "Joyful", "Beach2024MahiMahiJoyful" },
        { "Beg", "Beach2024MahiMahiBeg" },
        { "Jump", "Beach2024MahiMahiJump" },
        { "Trick 1", "Beach2024MahiMahiTrick1" },
        { "Trick 2", "Beach2024MahiMahiTrick2" }
    },
    ["neon_parts"] = {
        ["TailFin"] = Color3.fromRGB(213, 115, 61),
        ["BottomFin2"] = Color3.fromRGB(213, 115, 61),
        ["Torso3"] = Color3.fromRGB(213, 115, 61),
        ["RightFin"] = Color3.fromRGB(213, 115, 61),
        ["DorsalFin2"] = Color3.fromRGB(213, 115, 61),
        ["LeftFin"] = Color3.fromRGB(213, 115, 61),
        ["RightBottomFin2"] = Color3.fromRGB(213, 115, 61),
        ["LeftBottomFIn2"] = Color3.fromRGB(213, 115, 61)
    },
    ["already_has_flying_wings"] = true
}
v2.beach_2024_gold_mahi_mahi = v5
local v6 = {
    ["name"] = "Diamond Mahi Mahi",
    ["image"] = "rbxassetid://16441372760",
    ["model"] = "Beach2024DiamondMahiMahi",
    ["rarity"] = "legendary",
    ["origin_entry"] = {
        ["origin"] = "Summer Beach",
        ["origin_items"] = { "beach_2024_mahi_spinning_rod" },
        ["year"] = 2024
    },
    ["anims"] = {
        ["sleep"] = "Beach2024MahiMahiSleep",
        ["running"] = "Beach2024MahiMahiRun",
        ["idle"] = "Beach2024MahiMahiIdle",
        ["eating"] = "Beach2024MahiMahiEat",
        ["sit"] = "Beach2024MahiMahiSit",
        ["flying"] = "Beach2024MahiMahiRun",
        ["hold"] = "Beach2024MahiMahiBeingHeldSingle",
        ["double_hold"] = "Beach2024MahiMahiBeingHeldDouble"
    },
    ["tricks"] = {
        { "Sit", "Beach2024MahiMahiSit" },
        { "Joyful", "Beach2024MahiMahiJoyful" },
        { "Beg", "Beach2024MahiMahiBeg" },
        { "Jump", "Beach2024MahiMahiJump" },
        { "Trick 1", "Beach2024MahiMahiTrick1" },
        { "Trick 2", "Beach2024MahiMahiTrick2" }
    },
    ["neon_parts"] = {
        ["TailFin"] = Color3.fromRGB(226, 90, 181),
        ["BottomFin2"] = Color3.fromRGB(226, 90, 181),
        ["Torso3"] = Color3.fromRGB(226, 90, 181),
        ["RightFin"] = Color3.fromRGB(226, 90, 181),
        ["DorsalFin2"] = Color3.fromRGB(226, 90, 181),
        ["LeftFin"] = Color3.fromRGB(226, 90, 181),
        ["RightBottomFin2"] = Color3.fromRGB(226, 90, 181),
        ["LeftBottomFIn2"] = Color3.fromRGB(226, 90, 181)
    },
    ["already_has_flying_wings"] = true
}
v2.beach_2024_diamond_mahi_mahi = v6
return v1(v2)