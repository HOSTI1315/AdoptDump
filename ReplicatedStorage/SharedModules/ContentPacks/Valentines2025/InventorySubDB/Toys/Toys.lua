--// ReplicatedStorage.SharedModules.ContentPacks.Valentines2025.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Heart Throwing Disc",
    ["image"] = "rbxassetid://71199198181669",
    ["rarity"] = "common",
    ["cost"] = 600,
    ["currency_id"] = "cupid_hearts_2025",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Valentines2025HeartThrowingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.valentines_2025_heart_throwing_disc = v3
local v4 = {
    ["name"] = "Cupid\'s Bow Grappling Hook",
    ["image"] = "rbxassetid://131184810456060",
    ["rarity"] = "ultra_rare",
    ["cost"] = 1600,
    ["currency_id"] = "cupid_hearts_2025",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "Valentines2025CupidsBowGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.valentines_2025_cupids_bow_grappling_hook = v4
return v1(v2)