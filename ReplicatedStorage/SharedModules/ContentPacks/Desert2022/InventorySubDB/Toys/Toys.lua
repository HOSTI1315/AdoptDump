--// ReplicatedStorage.SharedModules.ContentPacks.Desert2022.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Anhk Pogostick",
    ["image"] = "rbxassetid://8569429457",
    ["rarity"] = "ultra_rare",
    ["cost"] = 995,
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["liveops_map_type_required_for_purchase"] = "Desert",
    ["model_handle"] = "Desert2022AnhkPogostick",
    ["tool"] = "PogoTool"
}
v2.desert_2022_anhk_pogostick = v3
local v4 = {
    ["name"] = "Cactus Balloon",
    ["image"] = "rbxassetid://8528286711",
    ["rarity"] = "ultra_rare",
    ["cost"] = 800,
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["liveops_map_type_required_for_purchase"] = "Desert",
    ["model_handle"] = "Desert2022CactusBalloon",
    ["tool"] = "BalloonTool"
}
v2.desert_2022_cactus_balloon = v4
local v5 = {
    ["name"] = "Cactus Friend Plushie",
    ["image"] = "rbxassetid://8535789498",
    ["rarity"] = "uncommon",
    ["cost"] = 95,
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["liveops_map_type_required_for_purchase"] = "Desert",
    ["model_handle"] = "Desert2022CactusFriendPlushie",
    ["tool"] = "GenericTool"
}
v2.desert_2022_cactus_friend_plushie = v5
local v6 = {
    ["name"] = "Crook Throw Toy",
    ["image"] = "rbxassetid://8528286799",
    ["rarity"] = "uncommon",
    ["cost"] = 250,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["liveops_map_type_required_for_purchase"] = "Desert",
    ["model_handle"] = "Desert2022CrookThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.desert_2022_crook_throw_toy = v6
local v7 = {
    ["name"] = "Desert Drum",
    ["image"] = "rbxassetid://8535789599",
    ["rarity"] = "rare",
    ["cost"] = 450,
    ["anims"] = {
        ["hold"] = "GuitarHold",
        ["use"] = "SkullDrumPlay"
    },
    ["liveops_map_type_required_for_purchase"] = "Desert",
    ["model_handle"] = "Desert2022DesertDrum",
    ["sounds"] = { "DesertDrum1", "DesertDrum2", "DesertDrum3" },
    ["tool"] = "MusicalInstrumentTool"
}
v2.desert_2022_desert_drum = v7
local v8 = {
    ["name"] = "Scarab Crossbow Grappling Hook",
    ["image"] = "rbxassetid://8569429638",
    ["rarity"] = "legendary",
    ["cost"] = 5000,
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["liveops_map_type_required_for_purchase"] = "Desert",
    ["model_handle"] = "Desert2022ScarabGrapple",
    ["tool"] = "GrapplingHookTool"
}
v2.desert_2022_scarab_grapple = v8
return v1(v2)