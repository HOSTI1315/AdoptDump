--// ReplicatedStorage.SharedModules.ContentPacks.Summerfest2024.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Stable Token",
    ["image"] = "rbxassetid://17746997370",
    ["rarity"] = "uncommon",
    ["donatable"] = true,
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "Summerfest2024ShowhorseLobbyEntryToken",
    ["tool"] = "FlyingDiscTool"
}
v2.summerfest_2024_stable_token = v3
local v4 = {
    ["name"] = "Fortune Wheel Flying Disc",
    ["image"] = "rbxassetid://17823041782",
    ["rarity"] = "uncommon",
    ["cost"] = 800,
    ["currency_id"] = "tickets_2024",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "Summerfest2024FortuneWheelFlyingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.summerfest_2024_fortune_wheel_flying_disc = v4
local v5 = {
    ["name"] = "Kazoo",
    ["image"] = "rbxassetid://17823038736",
    ["rarity"] = "ultra_rare",
    ["cost"] = 7800,
    ["currency_id"] = "tickets_2024",
    ["anims"] = {
        ["hold"] = "PhoenixHold",
        ["use"] = "Summerfest2024KazooPlay"
    },
    ["model_handle"] = "Summerfest2024Kazoo",
    ["sounds"] = {
        "SummerKazoo1",
        "SummerKazoo2",
        "SummerKazoo3",
        "SummerKazoo4"
    },
    ["tool"] = "MusicalInstrumentTool"
}
v2.summerfest_2024_kazoo = v5
local v6 = {
    ["name"] = "Paddle Ball Rattle",
    ["image"] = "rbxassetid://17823037340",
    ["rarity"] = "common",
    ["cost"] = 300,
    ["currency_id"] = "tickets_2024",
    ["anims"] = {
        ["hold"] = "RattleHold",
        ["use"] = "RattleShake"
    },
    ["model_handle"] = "Summerfest2024PaddleBallRattle",
    ["tool"] = "GenericConstraintsTool",
    ["preserve_model_welds"] = true
}
v2.summerfest_2024_paddle_ball_rattle = v6
local v7 = {
    ["name"] = "Balloon Pogostick",
    ["image"] = "rbxassetid://18117854597",
    ["rarity"] = "common",
    ["cost"] = 1250,
    ["currency_id"] = "tickets_2024",
    ["anims"] = {
        ["hold"] = "MinigamePogo"
    },
    ["model_handle"] = "Summer2024BalloonPogo",
    ["tool"] = "PogoTool"
}
v2.summerfest_2024_balloon_pogostick = v7
local v8 = {
    ["name"] = "Chair Swing Propeller",
    ["image"] = "rbxassetid://18117854110",
    ["rarity"] = "uncommon",
    ["cost"] = 1400,
    ["currency_id"] = "tickets_2024",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "Summer2024ChairPropeller",
    ["preserve_model_welds"] = true,
    ["spin_anim"] = "SlowPropeller",
    ["tool"] = "PropellerTool"
}
v2.summerfest_2024_chair_propeller = v8
local v9 = {
    ["name"] = "Popcorn Plush",
    ["image"] = "rbxassetid://18117853172",
    ["rarity"] = "rare",
    ["cost"] = 4900,
    ["currency_id"] = "tickets_2024",
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["model_handle"] = "Summer2024PopcornPlushie",
    ["tool"] = "GenericTool"
}
v2.summerfest_2024_popcorn_plushie = v9
local v10 = {
    ["name"] = "Light Spinner Throw Toy",
    ["image"] = "rbxassetid://18117853596",
    ["rarity"] = "ultra_rare",
    ["cost"] = 6400,
    ["currency_id"] = "tickets_2024",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "Summer2024LightspinnerThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.summerfest_2024_lightspinner_throw_toy = v10
return v1(v2)