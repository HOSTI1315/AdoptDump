--// ReplicatedStorage.SharedModules.ContentPacks.AilmentsRefresh2024.InventorySubDB.Toys (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).toys
local v2 = {}
local v3 = {
    ["name"] = "Squeaky Bone",
    ["image"] = "rbxassetid://4710374481",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["anims"] = {
        ["hold"] = "PhoenixHold"
    },
    ["colorable"] = false,
    ["model_handle"] = "SqueakyBone",
    ["temporary"] = true,
    ["tool"] = "SqueakyToyTool"
}
v2.squeaky_bone_default = v3
return v1(v2)