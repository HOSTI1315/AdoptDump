--// ReplicatedStorage.SharedModules.ContentPacks.Winter2022.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Pony Box",
    ["image"] = "rbxassetid://11695538664",
    ["rarity"] = "legendary",
    ["cost"] = 14000,
    ["currency_id"] = "gingerbread_2022",
    ["anims"] = {
        ["box_opening"] = { "Winter2022PonyBoxOpen1", "Winter2022PonyBoxOpen2", "Winter2022PonyBoxOpen3" },
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "Winter2022PonyBox",
    ["tool"] = "PonyBoxTool"
}
v2.winter_2022_pony_box = v3
return v1(v2)