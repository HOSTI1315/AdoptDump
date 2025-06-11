--// ReplicatedStorage.SharedModules.ContentPacks.Winter2023.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Hare Box",
    ["image"] = "rbxassetid://15507725301",
    ["rarity"] = "legendary",
    ["cost"] = 20000,
    ["currency_id"] = "gingerbread_2023",
    ["anims"] = {
        ["box_opening"] = { "Winter2023HareBoxOpen" },
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "Winter2023HareBox",
    ["tool"] = "GenericBoxTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true
}
v2.winter_2023_hare_box = v3
return v1(v2)