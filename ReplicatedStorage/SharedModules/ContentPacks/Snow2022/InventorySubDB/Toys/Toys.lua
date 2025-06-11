--// ReplicatedStorage.SharedModules.ContentPacks.Snow2022.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Ice Grapple",
    ["image"] = "rbxassetid://9343448574",
    ["rarity"] = "legendary",
    ["cost"] = 5000,
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["liveops_map_type_required_for_purchase"] = "Snow",
    ["model_handle"] = "Snow2022IceGrapple",
    ["tool"] = "GrapplingHookTool"
}
v2.snow_2022_ice_grapple = v3
local v4 = {
    ["name"] = "Ski Pole Pogo",
    ["image"] = "rbxassetid://9343634249",
    ["rarity"] = "ultra_rare",
    ["cost"] = 995,
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["liveops_map_type_required_for_purchase"] = "Snow",
    ["model_handle"] = "Snow2022SkiPolePogo",
    ["tool"] = "PogoTool"
}
v2.snow_2022_ski_pole_pogo = v4
local v5 = {
    ["name"] = "Snow Balloon",
    ["image"] = "rbxassetid://9343716441",
    ["rarity"] = "ultra_rare",
    ["cost"] = 800,
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["liveops_map_type_required_for_purchase"] = "Snow",
    ["model_handle"] = "Snow2022SnowCloudBalloon",
    ["tool"] = "BalloonTool"
}
v2.snow_2022_snow_cloud_balloon = v5
local v6 = {
    ["name"] = "Snowflake Throwing Disc",
    ["image"] = "rbxassetid://9343775742",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["liveops_map_type_required_for_purchase"] = "Snow",
    ["model_handle"] = "Snow2022SnowflakeThrowingDisc",
    ["tool"] = "FlyingDiscTool"
}
v2.snow_2022_snowflake_throwing_disc = v6
local v7 = {
    ["name"] = "Snowman Plushie Friend",
    ["image"] = "rbxassetid://9343971785",
    ["rarity"] = "uncommon",
    ["cost"] = 95,
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["liveops_map_type_required_for_purchase"] = "Snow",
    ["model_handle"] = "Snow2022SnowmanPlushieFriend",
    ["tool"] = "GenericTool"
}
v2.snow_2022_snowman_plushie_friend = v7
local v8 = {
    ["name"] = "Tundra Violin",
    ["image"] = "rbxassetid://9343576405",
    ["rarity"] = "rare",
    ["cost"] = 450,
    ["anims"] = {
        ["hold"] = "GuitarHold",
        ["use"] = "GuitarPlay"
    },
    ["liveops_map_type_required_for_purchase"] = "Snow",
    ["model_handle"] = "Snow2022TundraViolin",
    ["sounds"] = { "ArcticFiddle1", "ArcticFiddle2", "ArcticFiddle3" },
    ["tool"] = "MusicalInstrumentTool"
}
v2.snow_2022_tundra_violin = v8
return v1(v2)