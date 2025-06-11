--// ReplicatedStorage.SharedModules.ContentPacks.IceDimension2025.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {
    ["ice_dimension_2025_placeable_snowperson"] = {
        ["name"] = "Placeable Snowperson",
        ["image"] = "rbxassetid://121255958863278",
        ["rarity"] = "common",
        ["model_handle"] = "IceDimension2025PlaceableSnowperson",
        ["placeable_type"] = "toy_furniture",
        ["tool"] = "PlaceableTool"
    }
}
local v3 = {
    ["name"] = "Ice Cube Throw Toy",
    ["image"] = "rbxassetid://115279726317639",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "ChocolateHold"
    },
    ["model_handle"] = "IceDimension2025IceCubeThrowToy",
    ["tool"] = "ThrowToyTool"
}
v2.ice_dimension_2025_ice_cube_throw_toy = v3
local v4 = {
    ["name"] = "Frozen Balloon",
    ["image"] = "rbxassetid://132511972129868",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "HeartBalloonHold"
    },
    ["model_handle"] = "IceDimension2025FrozenBalloon",
    ["tool"] = "BalloonTool"
}
v2.ice_dimension_2025_frozen_balloon = v4
return v1(v2)