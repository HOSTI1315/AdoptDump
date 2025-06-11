--// ReplicatedStorage.SharedModules.ContentPacks.VIP2022.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Golden Bone",
    ["image"] = "rbxassetid://9938968082",
    ["rarity"] = "legendary",
    ["anims"] = {
        ["hold"] = "SandwichHold"
    },
    ["custom_tooltip_description"] = "You need to be in the VIP Lounge to use this",
    ["model_handle"] = "VIP2022GoldenBone",
    ["tool"] = "GoldenBone"
}
v2.vip_2022_golden_bone = v3
return v1(v2)