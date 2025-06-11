--// ReplicatedStorage.SharedModules.ContentPacks.Beach2024.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Mahi Spinning Rod",
    ["image"] = "rbxassetid://16371882651",
    ["rarity"] = "common",
    ["cost"] = 600,
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["custom_tooltip_description"] = "You need to be in the Shipwreck Shop to use this!",
    ["model_handle"] = "Beach2024MahiSpinningRod",
    ["tool"] = "MahiSpinningRod"
}
v2.beach_2024_mahi_spinning_rod = v3
local v4 = {
    ["name"] = "Mahi Spinning Rod",
    ["image"] = "rbxassetid://16371882651",
    ["rarity"] = "common",
    ["temporary"] = true,
    ["donatable"] = false,
    ["anims"] = {
        ["hold"] = "CandyCannonHold"
    },
    ["custom_tooltip_description"] = "You need to be in the Shipwreck Shop to use this!",
    ["model_handle"] = "Beach2024MahiSpinningRod",
    ["tool"] = "MahiFishingRod"
}
v2.beach_2024_mahi_spinning_rod_temporary = v4
return v1(v2)