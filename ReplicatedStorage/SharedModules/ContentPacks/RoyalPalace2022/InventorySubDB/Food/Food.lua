--// ReplicatedStorage.SharedModules.ContentPacks.RoyalPalace2022.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Tea Party Scone",
    ["image"] = "rbxassetid://10526013565",
    ["rarity"] = "common",
    ["donatable"] = false,
    ["cost"] = 0,
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "BurgerHold",
        ["use"] = "BurgerEat"
    },
    ["model_handle"] = "RoyalPalace2022TeaPartyScone",
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["uses"] = 3
}
v2.royal_palace_2022_tea_party_scone = v3
return v1(v2)