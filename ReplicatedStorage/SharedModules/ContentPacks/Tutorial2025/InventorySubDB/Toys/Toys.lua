--// ReplicatedStorage.SharedModules.ContentPacks.Tutorial2025.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Soap",
    ["image"] = "rbxassetid://96315669351179",
    ["rarity"] = "common",
    ["anims"] = {
        ["hold"] = "PotionHold"
    },
    ["model_handle"] = "Soap",
    ["tool"] = "CleanPetTool",
    ["temporary"] = true,
    ["donatable"] = false
}
v2.soap_default = v3
return v1(v2)