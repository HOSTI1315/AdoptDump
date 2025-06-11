--// ReplicatedStorage.SharedModules.ContentPacks.CampingShop2023.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Camper\'s Bongos",
    ["image"] = "rbxassetid://12403129085",
    ["rarity"] = "uncommon",
    ["cost"] = 200,
    ["anims"] = {
        ["hold"] = "BongosHold",
        ["use"] = "BongosHit"
    },
    ["model_handle"] = "Camping2023Bongos",
    ["sounds"] = {
        "Bongos1",
        "Bongos2",
        "Bongos3",
        "Bongos4"
    },
    ["tool"] = "MusicalInstrumentTool"
}
v2.camping_2023_bongos = v3
v2.camping_2023_camping_tent = {
    ["name"] = "Camper\'s Tent",
    ["image"] = "rbxassetid://12403129234",
    ["rarity"] = "uncommon",
    ["cost"] = 1200,
    ["colorable"] = true,
    ["model_handle"] = "Camping2023CampingTent",
    ["placeable_type"] = "toy_furniture",
    ["tool"] = "PlaceableTool"
}
local v4 = {
    ["name"] = "Camper\'s Flashlight",
    ["image"] = "rbxassetid://12403129346",
    ["rarity"] = "uncommon",
    ["cost"] = 30,
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "CandyCannonHold"
    },
    ["colorable"] = true,
    ["model_handle"] = "Camping2023Flashlight",
    ["tool"] = "FlashlightTool"
}
v2.camping_2023_flashlight = v4
local v5 = {
    ["name"] = "Camper\'s Guitar",
    ["image"] = "rbxassetid://12403129430",
    ["rarity"] = "rare",
    ["cost"] = 500,
    ["anims"] = {
        ["hold"] = "GuitarHold",
        ["use"] = "GuitarPlay"
    },
    ["model_handle"] = "Camping2023Guitar",
    ["sounds"] = {
        "Guitar1",
        "Guitar2",
        "Guitar3",
        "Guitar4",
        "Guitar5",
        "Guitar6"
    },
    ["tool"] = "MusicalInstrumentTool"
}
v2.camping_2023_guitar = v5
v2.camping_2023_log_bench = {
    ["name"] = "Camper\'s Bench",
    ["image"] = "rbxassetid://12368282268",
    ["rarity"] = "uncommon",
    ["cost"] = 900,
    ["model_handle"] = "Camping2023LogBench",
    ["placeable_type"] = "toy_furniture",
    ["tool"] = "PlaceableTool"
}
v2.camping_2023_sleeping_bag = {
    ["name"] = "Camper\'s Sleeping Bag",
    ["image"] = "rbxassetid://12403129618",
    ["rarity"] = "uncommon",
    ["cost"] = 1000,
    ["colorable"] = true,
    ["model_handle"] = "Camping2023SleepingBag",
    ["placeable_type"] = "toy_furniture",
    ["tool"] = "PlaceableTool"
}
local v6 = {
    ["name"] = "Camper\'s Sparkler",
    ["image"] = "rbxassetid://12403142855",
    ["rarity"] = "uncommon",
    ["cost"] = 20,
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "Camping2023Sparkler",
    ["tool"] = "GenericTool"
}
v2.camping_2023_sparkler = v6
return v1(v2)