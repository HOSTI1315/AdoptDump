--// ReplicatedStorage.SharedModules.ContentPacks.Jokes2024.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Box of Jokes",
    ["image"] = "rbxassetid://18662258036",
    ["rarity"] = "uncommon",
    ["cost"] = 555,
    ["anims"] = {
        ["box_opening"] = { "Jokes2024GiftBoxOpen" },
        ["hold"] = "PumpkinHold"
    },
    ["model_handle"] = "Jokes2024GiftBox",
    ["tool"] = "GenericBoxTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true
}
v2.jokes_2024_gift_box = v3
return v1(v2)