--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2022.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Wolf Box",
    ["image"] = "rbxassetid://11124256555",
    ["rarity"] = "legendary",
    ["cost"] = 14000,
    ["currency_id"] = "candy_2022",
    ["anims"] = {
        ["box_opening"] = { "LegendaryHatShop2022RegalBoxOpen1", "LegendaryHatShop2022RegalBoxOpen2" },
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "Halloween2022WolfBox",
    ["tool"] = "WolfBoxTool"
}
v2.halloween_2022_wolf_box = v3
return v1(v2)