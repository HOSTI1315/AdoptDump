--// ReplicatedStorage.SharedModules.ContentPacks.Hamstertime2024.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Golden Corn",
    ["image"] = "rbxassetid://16555220226",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "IceCreamHold"
    },
    ["custom_tooltip_description"] = "You need to be in the Pet Shop to use this!",
    ["model_handle"] = "Hamstertime2024GoldenCorn",
    ["tool"] = "GoldenCorn"
}
v2.hamstertime_2024_golden_corn = v3
return v1(v2)