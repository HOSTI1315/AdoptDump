--// ReplicatedStorage.SharedModules.ContentPacks.IceCream2025.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Snow Cone Stand",
    ["image"] = "rbxassetid://118207311116147",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "IceCream2025SnowConeStand",
    ["placeable_type"] = "refreshment",
    ["tool"] = "PlaceableTool"
}
v2.ice_cream_2025_snow_cone_stand = v3
return v1(v2)