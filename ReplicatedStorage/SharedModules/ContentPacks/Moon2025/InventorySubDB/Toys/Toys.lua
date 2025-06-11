--// ReplicatedStorage.SharedModules.ContentPacks.Moon2025.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Shooting Star Grappling Hook",
    ["image"] = "rbxassetid://91150470754350",
    ["rarity"] = "rare",
    ["cost"] = 5,
    ["currency_id"] = "stars_2025",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "Moon2025ShootingStarGrapplingHook",
    ["tool"] = "GrapplingHookTool"
}
v2.moon_2025_shooting_star_grappling_hook = v3
return v1(v2)