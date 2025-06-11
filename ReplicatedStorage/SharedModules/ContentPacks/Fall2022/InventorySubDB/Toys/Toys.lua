--// ReplicatedStorage.SharedModules.ContentPacks.Fall2022.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Acorn Plushie",
    ["image"] = "rbxassetid://9973756733",
    ["rarity"] = "common",
    ["cost"] = 120,
    ["anims"] = {
        ["hold"] = "PlushieHold",
        ["use"] = "PlushieUse"
    },
    ["liveops_map_type_required_for_purchase"] = "Fall",
    ["model_handle"] = "Fall2022AcornPlushieFriend",
    ["tool"] = "GenericTool"
}
v2.fall_2022_acorn_plushie = v3
local v4 = {
    ["name"] = "Cinnamon Stick",
    ["image"] = "rbxassetid://9973757214",
    ["rarity"] = "common",
    ["cost"] = 300,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["liveops_map_type_required_for_purchase"] = "Fall",
    ["model_handle"] = "Fall2022CinnamonStickThrowToy",
    ["tool"] = "FlyingDiscTool"
}
v2.fall_2022_cinnamon_stick = v4
local v5 = {
    ["name"] = "Fall Corn Grappling Hook",
    ["image"] = "rbxassetid://9973757393",
    ["rarity"] = "legendary",
    ["cost"] = 5000,
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["liveops_map_type_required_for_purchase"] = "Fall",
    ["model_handle"] = "Fall2022CornGrapple",
    ["tool"] = "GrapplingHookTool"
}
v2.fall_2022_corn_grapple = v5
local v6 = {
    ["name"] = "Finger Piano",
    ["image"] = "rbxassetid://9973767467",
    ["rarity"] = "rare",
    ["cost"] = 450,
    ["anims"] = {
        ["hold"] = "BongosHold",
        ["use"] = "BongosHit"
    },
    ["liveops_map_type_required_for_purchase"] = "Fall",
    ["model_handle"] = "Fall2022FingerPiano",
    ["sounds"] = {
        "ThumbPiano1",
        "ThumbPiano2",
        "ThumbPiano3",
        "ThumbPiano4"
    },
    ["tool"] = "MusicalInstrumentTool"
}
v2.fall_2022_finger_piano = v6
local v7 = {
    ["name"] = "Mushroom Pogo",
    ["image"] = "rbxassetid://9973768034",
    ["rarity"] = "ultra_rare",
    ["cost"] = 995,
    ["anims"] = {
        ["hold"] = "PogoMove"
    },
    ["liveops_map_type_required_for_purchase"] = "Fall",
    ["model_handle"] = "Fall2022MushroomPogo",
    ["tool"] = "PogoTool"
}
v2.fall_2022_mushroom_pogo = v7
local v8 = {
    ["name"] = "Fall Rains Balloon",
    ["image"] = "rbxassetid://9973768324",
    ["rarity"] = "rare",
    ["cost"] = 500,
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["liveops_map_type_required_for_purchase"] = "Fall",
    ["model_handle"] = "Fall2022RainCloudBalloon",
    ["tool"] = "BalloonTool"
}
v2.fall_2022_rain_cloud_balloon = v8
return v1(v2)