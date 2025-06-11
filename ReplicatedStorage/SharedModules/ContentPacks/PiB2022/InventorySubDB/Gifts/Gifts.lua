--// ReplicatedStorage.SharedModules.ContentPacks.PiB2022.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Accessory Chest",
    ["image"] = "rbxassetid://10967650367",
    ["rarity"] = "event",
    ["anims"] = {
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "PiB2022AccessoryChest",
    ["permanently_delete_all_copies_of_this_item_from_the_game"] = true,
    ["temporary"] = true,
    ["tool"] = "GenericTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true
}
v2.pib_2022_accessory_chest = v3
return v1(v2)