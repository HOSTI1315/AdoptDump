--// ReplicatedStorage.SharedModules.ContentPacks.Rain2023.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Captain\'s Wheel Throw Toy",
    ["image"] = "rbxassetid://10982839418",
    ["rarity"] = "common",
    ["cost"] = 200,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["liveops_map_type_required_for_purchase"] = "Rain",
    ["model_handle"] = "Rain2023CaptainsWheelThrowToy",
    ["tool"] = "FlyingDiscTool"
}
v2.rain_2023_captains_wheel_throw_toy = v3
local v4 = {
    ["name"] = "Crow\'s Nest Balloon",
    ["image"] = "rbxassetid://10982856841",
    ["rarity"] = "common",
    ["cost"] = 99,
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["liveops_map_type_required_for_purchase"] = "Rain",
    ["model_handle"] = "Rain2023CrowsNestBalloon",
    ["tool"] = "BalloonTool"
}
v2.rain_2023_crows_nest_balloon = v4
local v5 = {
    ["name"] = "Grapplenana",
    ["image"] = "rbxassetid://10982905826",
    ["rarity"] = "ultra_rare",
    ["cost"] = 1500,
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["liveops_map_type_required_for_purchase"] = "Rain",
    ["model_handle"] = "Rain2023Grapplenana",
    ["tool"] = "GrapplingHookTool"
}
v2.rain_2023_grapplenana = v5
local v6 = {
    ["name"] = "Pirate Plushie",
    ["image"] = "rbxassetid://10982876338",
    ["rarity"] = "rare",
    ["cost"] = 899,
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["liveops_map_type_required_for_purchase"] = "Rain",
    ["model_handle"] = "Rain2023PiratePlushie",
    ["tool"] = "GenericTool"
}
v2.rain_2023_pirate_plushie = v6
local v7 = {
    ["name"] = "Rain Stick",
    ["image"] = "rbxassetid://11157468208",
    ["rarity"] = "common",
    ["cost"] = 300,
    ["anims"] = {
        ["hold"] = "RainstickHold",
        ["use"] = "RainstickPlay"
    },
    ["liveops_map_type_required_for_purchase"] = "Rain",
    ["model_handle"] = "Rain2023RainStick",
    ["sounds"] = { "Rainstick1", "Rainstick2", "Rainstick3" },
    ["tool"] = "MusicalInstrumentTool"
}
v2.rain_2023_rain_stick = v7
local v8 = {
    ["name"] = "Ship\'s Mast Pogo",
    ["image"] = "rbxassetid://10982815288",
    ["rarity"] = "rare",
    ["cost"] = 995,
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["liveops_map_type_required_for_purchase"] = "Rain",
    ["model_handle"] = "Rain2023ShipsMastPogo",
    ["tool"] = "PogoTool"
}
v2.rain_2023_ships_mast_pogo = v8
return v1(v2)