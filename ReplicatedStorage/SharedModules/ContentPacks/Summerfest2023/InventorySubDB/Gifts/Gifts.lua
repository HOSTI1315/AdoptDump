--// ReplicatedStorage.SharedModules.ContentPacks.Summerfest2023.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Hermit Crab Box",
    ["image"] = "rbxassetid://13744267578",
    ["rarity"] = "legendary",
    ["cost"] = 12000,
    ["currency_id"] = "beachballs_2023",
    ["anims"] = {
        ["box_opening"] = { "Summerfest2023HermitCrabBoxOpen1", "Summerfest2023HermitCrabBoxOpen2" },
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "Summerfest2023HermitCrabBox",
    ["tool"] = "GenericBoxTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true
}
v2.summerfest_2023_hermit_crab_box = v3
return v1(v2)