--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2023.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Duckling Box",
    ["image"] = "rbxassetid://12917348178",
    ["rarity"] = "legendary",
    ["cost"] = 12000,
    ["currency_id"] = "eggs_2023",
    ["anims"] = {
        ["box_opening"] = { "DucklingBoxOpen1", "DucklingBoxOpen2" },
        ["hold"] = "HoldingBaby"
    },
    ["model_handle"] = "Springfest2023DucklingBox",
    ["tool"] = "GenericBoxTool",
    ["use_generated_public_lootbox_tooltip_description_rarities"] = true
}
v2.springfest_2023_duckling_box = v3
return v1(v2)