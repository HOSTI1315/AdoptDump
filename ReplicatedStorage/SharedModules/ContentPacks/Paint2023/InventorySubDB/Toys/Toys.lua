--// ReplicatedStorage.SharedModules.ContentPacks.Paint2023.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Paint Sealer",
    ["image"] = "rbxassetid://12999025391",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "CandyCannonHold",
        ["use"] = "ColoredHairsprayUse"
    },
    ["model_handle"] = "Paint2023ColoredHairSpraySealer",
    ["tool"] = "ColoredHairSpraySealer"
}
v2.paint_2023_colored_hair_spray_sealer = v3
return v1(v2)