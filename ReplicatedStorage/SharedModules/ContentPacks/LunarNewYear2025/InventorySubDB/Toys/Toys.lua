--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2025.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Lucky Coin Flying Disc",
    ["image"] = "rbxassetid://105756632041782",
    ["rarity"] = "rare",
    ["cost"] = 5,
    ["currency_id"] = "stars_2025",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Lunar2025LuckyCoinFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.lunar_2025_lucky_coin_flying_disc = v3
local v4 = {
    ["name"] = "Pellet Drum Rattle",
    ["image"] = "rbxassetid://127601891292579",
    ["rarity"] = "rare",
    ["cost"] = 5,
    ["currency_id"] = "stars_2025",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "Lunar2025PelletDrumRattle",
    ["tool"] = "GenericTool"
}
v2.lunar_2025_pellet_drum_rattle = v4
return v1(v2)