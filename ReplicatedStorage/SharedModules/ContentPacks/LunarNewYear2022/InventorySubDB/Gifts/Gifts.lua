--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2022.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Lunar Tiger Box",
    ["image"] = "rbxassetid://8663440464",
    ["rarity"] = "legendary",
    ["cost"] = 350,
    ["anims"] = {
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "LNY2022TigerBox",
    ["tool"] = "LunarTigerBoxTool"
}
v2.lny_2022_tiger_box = v3
return v1(v2)