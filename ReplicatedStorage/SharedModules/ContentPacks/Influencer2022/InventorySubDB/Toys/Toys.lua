--// ReplicatedStorage.SharedModules.ContentPacks.Influencer2022.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Camera",
    ["image"] = "rbxassetid://10702073242",
    ["rarity"] = "uncommon",
    ["cost"] = 130,
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "Influencer2022Camera",
    ["tool"] = "GenericTool"
}
v2.influencer_2022_camera = v3
v2.influencer_2022_camera_and_tripod = {
    ["name"] = "Tripod Camera",
    ["image"] = "rbxassetid://10637391289",
    ["rarity"] = "common",
    ["cost"] = 120,
    ["model_handle"] = "Influencer2022CameraAndTripod",
    ["placeable_type"] = "toy_furniture",
    ["tool"] = "PlaceableTool"
}
local v4 = {
    ["name"] = "Selfie Stick",
    ["image"] = "rbxassetid://10722932330",
    ["rarity"] = "common",
    ["cost"] = 80,
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["model_handle"] = "Influencer2022SelfieStick",
    ["tool"] = "GenericTool"
}
v2.influencer_2022_selfie_stick = v4
return v1(v2)