--// ReplicatedStorage.SharedModules.ContentPacks.UGCRefresh2024.InventorySubDB.Pets (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).pets
local v2 = {}
local v3 = {
    ["name"] = "Jellyfish",
    ["image"] = "rbxassetid://15848329383",
    ["model"] = "UGCRefresh2024Jellyfish",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "UGC Refresh",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "UGCRefresh2024JellyfishBeingHeldDouble",
        ["eating"] = "UGCRefresh2024JellyfishEat",
        ["flying"] = "UGCRefresh2024JellyfishRun",
        ["hold"] = "UGCRefresh2024JellyfishBeingHeldSingle",
        ["idle"] = "UGCRefresh2024JellyfishIdle",
        ["running"] = "UGCRefresh2024JellyfishRun",
        ["sit"] = "UGCRefresh2024JellyfishSit",
        ["sleep"] = "UGCRefresh2024JellyfishSleep"
    },
    ["tricks"] = {
        { "Sit", "UGCRefresh2024JellyfishSit" },
        { "Joyful", "UGCRefresh2024JellyfishJoyful" },
        { "Beg", "UGCRefresh2024JellyfishBeg" },
        { "Jump", "UGCRefresh2024JellyfishJump" },
        { "Trick 1", "UGCRefresh2024JellyfishTrick1" },
        { "Trick 2", "UGCRefresh2024JellyfishTrick2" }
    },
    ["neon_parts"] = {
        ["Head_Transparent"] = Color3.fromRGB(198, 150, 193),
        ["Spots"] = Color3.fromRGB(245, 103, 105),
        ["Tenticle_L_1"] = Color3.fromRGB(245, 103, 105),
        ["Tenticle_M_1"] = Color3.fromRGB(245, 103, 105),
        ["Tenticle_R_1"] = Color3.fromRGB(245, 103, 105),
        ["Torso"] = Color3.fromRGB(245, 103, 105)
    },
    ["already_has_flying_wings"] = true,
    ["head_rotator_disabled"] = true,
    ["eyes"] = { "Eyes" }
}
v2.ugc_refresh_2024_jellyfish = v3
local v4 = {
    ["name"] = "Honey Badger",
    ["image"] = "rbxassetid://108242367048842",
    ["model"] = "UGCRefresh2024HoneyBadger",
    ["rarity"] = "ultra_rare",
    ["origin_entry"] = {
        ["origin"] = "UGC Refresh",
        ["origin_items"] = {},
        ["year"] = 2024
    },
    ["anims"] = {
        ["double_hold"] = "UGCRefresh2024HoneyBadgerBeingHeldDouble",
        ["eating"] = "UGCRefresh2024HoneyBadgerEat",
        ["flying"] = "UGCRefresh2024HoneyBadgerRun",
        ["hold"] = "UGCRefresh2024HoneyBadgerBeingHeldSingle",
        ["idle"] = "UGCRefresh2024HoneyBadgerIdle",
        ["running"] = "UGCRefresh2024HoneyBadgerRun",
        ["sit"] = "UGCRefresh2024HoneyBadgerSit",
        ["sleep"] = "UGCRefresh2024HoneyBadgerSleep"
    },
    ["tricks"] = {
        { "Sit", "UGCRefresh2024HoneyBadgerSit" },
        { "Joyful", "UGCRefresh2024HoneyBadgerJoyful" },
        { "Beg", "UGCRefresh2024HoneyBadgerBeg" },
        { "Jump", "UGCRefresh2024HoneyBadgerJump" },
        { "Trick 1", "UGCRefresh2024HoneyBadgerTrick1" },
        { "Trick 2", "UGCRefresh2024HoneyBadgerTrick2" }
    },
    ["neon_parts"] = {
        ["Nose"] = Color3.fromRGB(186, 112, 55),
        ["RightFrontFoot"] = Color3.fromRGB(186, 112, 55),
        ["LeftFrontFoot"] = Color3.fromRGB(186, 112, 55),
        ["LeftBackFoot"] = Color3.fromRGB(186, 112, 55),
        ["RightBackFoot"] = Color3.fromRGB(186, 112, 55),
        ["Head"] = Color3.fromRGB(186, 112, 55),
        ["Torso2"] = Color3.fromRGB(186, 112, 55),
        ["Tail2"] = Color3.fromRGB(186, 112, 55),
        ["LeftEar2"] = Color3.fromRGB(186, 112, 55),
        ["RightEar2"] = Color3.fromRGB(186, 112, 55),
        ["HairBack"] = Color3.fromRGB(186, 112, 55),
        ["HairMid"] = Color3.fromRGB(186, 112, 55),
        ["Snout"] = Color3.fromRGB(186, 112, 55),
        ["Tail3"] = Color3.fromRGB(186, 112, 55)
    }
}
v2.ugc_refresh_2024_honey_badger = v4
return v1(v2)