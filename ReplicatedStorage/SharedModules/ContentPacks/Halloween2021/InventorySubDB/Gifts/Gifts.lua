--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2021.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Halloween Mummy Cat Box",
    ["image"] = "rbxassetid://7734935143",
    ["rarity"] = "common",
    ["cost"] = 600,
    ["currency_id"] = "candy_2021",
    ["anims"] = {
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "CatBox",
    ["tool"] = "CatBoxTool"
}
v2.halloween_2021_cat_box = v3
return v1(v2)