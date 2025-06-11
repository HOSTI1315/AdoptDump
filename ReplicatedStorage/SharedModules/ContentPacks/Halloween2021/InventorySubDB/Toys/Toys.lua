--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2021.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Halloween Black Bat Propeller",
    ["image"] = "rbxassetid://7718786203",
    ["rarity"] = "uncommon",
    ["cost"] = 75,
    ["currency_id"] = "candy_2021",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "BatPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "MonkeyPropellerSpin",
    ["tool"] = "PropellerTool"
}
v2.halloween_2021_bat_propeller = v3
local v4 = {
    ["name"] = "Halloween White Ghost Balloon",
    ["image"] = "rbxassetid://7718786309",
    ["rarity"] = "uncommon",
    ["cost"] = 60,
    ["currency_id"] = "candy_2021",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "GhostBalloon",
    ["tool"] = "BalloonTool"
}
v2.halloween_2021_ghost_balloon = v4
local v5 = {
    ["name"] = "Halloween Orange Pumpkin Balloon",
    ["image"] = "rbxassetid://7718786386",
    ["rarity"] = "common",
    ["cost"] = 35,
    ["currency_id"] = "candy_2021",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "PumpkinBalloon",
    ["tool"] = "BalloonTool"
}
v2.halloween_2021_pumpkin_balloon = v5
local v6 = {
    ["name"] = "Halloween Orange Pumpkin Flying Disc",
    ["image"] = "rbxassetid://7718800511",
    ["rarity"] = "common",
    ["cost"] = 40,
    ["currency_id"] = "candy_2021",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "PumpkinFlyingDisk",
    ["tool"] = "FlyingDiscTool"
}
v2.halloween_2021_pumpkin_flying_disc = v6
local v7 = {
    ["name"] = "Halloween Orange Pumpkin Voodoo Doll",
    ["image"] = "rbxassetid://7718789139",
    ["rarity"] = "rare",
    ["cost"] = 200,
    ["currency_id"] = "candy_2021",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "PumpkinVoodooDoll",
    ["tool"] = "GenericTool"
}
v2.halloween_2021_pumpkin_voodoo_doll = v7
local v8 = {
    ["name"] = "Halloween Wooden Scythe Grappling Hook",
    ["image"] = "rbxassetid://7718791071",
    ["rarity"] = "rare",
    ["cost"] = 130,
    ["currency_id"] = "candy_2021",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["model_handle"] = "ScytheGrapple",
    ["tool"] = "GrapplingHookTool"
}
v2.halloween_2021_scythe_grapple = v8
local v9 = {
    ["name"] = "Halloween Black Victorian Candlestick Rattle",
    ["image"] = "rbxassetid://7718791167",
    ["rarity"] = "uncommon",
    ["cost"] = 90,
    ["currency_id"] = "candy_2021",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "VictorianCandleRattle",
    ["tool"] = "GenericTool"
}
v2.halloween_2021_victorian_candle_rattle = v9
return v1(v2)