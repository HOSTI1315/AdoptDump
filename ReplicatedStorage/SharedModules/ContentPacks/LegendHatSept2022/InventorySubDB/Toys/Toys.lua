--// ReplicatedStorage.SharedModules.ContentPacks.LegendHatSept2022.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Cotton Candy Stand",
    ["image"] = "rbxassetid://10979219546",
    ["rarity"] = "ultra_rare",
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["model_handle"] = "CottonCandyStand",
    ["placeable_type"] = "refreshment",
    ["tool"] = "PlaceableTool"
}
v2.cotton_candy_stand = v3
return v1(v2)