--// ReplicatedStorage.SharedModules.ContentPacks.LegendHat2022.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Regal Chest",
    ["image"] = "rbxassetid://9414073952",
    ["rarity"] = "legendary",
    ["cost"] = 300,
    ["anims"] = {
        ["box_opening"] = { "LegendaryHatShop2022RegalBoxOpen1", "LegendaryHatShop2022RegalBoxOpen2" },
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "LegendaryHatShop2022RegalChest",
    ["tool"] = "LegendaryHatShopBoxTool"
}
v2.legend_hat_2022_regal_chest = v3
local v4 = {
    ["name"] = "Standard Chest",
    ["image"] = "rbxassetid://9414074169",
    ["rarity"] = "legendary",
    ["cost"] = 105,
    ["anims"] = {
        ["box_opening"] = { "LegendaryHatShop2022SimpleBoxOpen1", "LegendaryHatShop2022SimpleBoxOpen2" },
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "LegendaryHatShop2022SimpleChest",
    ["tool"] = "LegendaryHatShopBoxTool"
}
v2.legend_hat_2022_simple_chest = v4
return v1(v2)