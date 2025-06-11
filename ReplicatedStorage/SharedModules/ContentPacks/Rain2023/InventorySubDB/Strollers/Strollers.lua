--// ReplicatedStorage.SharedModules.ContentPacks.Rain2023.InventorySubDB.Strollers (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers
local v2 = {}
local v3 = {
    ["name"] = "Shipwreck Stroller",
    ["image"] = "rbxassetid://11003843044",
    ["rarity"] = "rare",
    ["cost"] = 700,
    ["anims"] = {
        ["baby_hold"] = "RainBabyStrollerHold",
        ["parent_hold"] = "RainParentStrollerHold"
    },
    ["liveops_map_type_required_for_purchase"] = "Rain",
    ["model_handle"] = "Rain2023ShipwreckStroller",
    ["tool"] = "StrollerTool"
}
v2.rain_2023_shipwreck_stroller = v3
return v1(v2)