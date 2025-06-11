--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2023.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Scarecrow Box",
    ["image"] = "rbxassetid://15087706291",
    ["rarity"] = "legendary",
    ["cost"] = 18000,
    ["currency_id"] = "candy_2023",
    ["anims"] = {
        ["box_opening"] = { "Halloween2023ScarecrowBoxOpen" },
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "Halloween2023ScarecrowBox",
    ["tool"] = "GenericBoxTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true
}
v2.halloween_2023_scarecrow_box = v3
return v1(v2)