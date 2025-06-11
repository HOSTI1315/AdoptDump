--// ReplicatedStorage.SharedModules.ContentPacks.GiftRefreshNovember2022.InventorySubDB.Strollers (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers
local v2 = {
    ["gift_refresh_2022_apple_barrel_stroller"] = {
        ["name"] = "Apple Barrel Stroller",
        ["image"] = "rbxassetid://10905074349",
        ["rarity"] = "rare",
        ["model_handle"] = "GiftRefreshNovember2022AppleBarrelStroller",
        ["tool"] = "StrollerTool"
    }
}
local v3 = {
    ["name"] = "Old Lump of Log Stroller",
    ["image"] = "rbxassetid://10905075030",
    ["rarity"] = "uncommon",
    ["anims"] = {
        ["baby_hold"] = "OldLogBabyHoldingStroller",
        ["parent_hold"] = "OldLogParentHoldingStroller"
    },
    ["model_handle"] = "GiftRefreshNovember2022OldLumpOfLogStroller",
    ["tool"] = "StrollerTool"
}
v2.gift_refresh_2022_old_lump_of_log_stroller = v3
v2.gift_refresh_2022_tractor_stroller = {
    ["name"] = "Tractor Stroller",
    ["image"] = "rbxassetid://10905074615",
    ["rarity"] = "ultra_rare",
    ["model_handle"] = "GiftRefreshNovember2022TractorStroller",
    ["tool"] = "StrollerTool"
}
return v1(v2)