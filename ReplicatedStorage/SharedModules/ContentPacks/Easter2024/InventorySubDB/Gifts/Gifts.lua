--// ReplicatedStorage.SharedModules.ContentPacks.Easter2024.InventorySubDB.Gifts (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).gifts
local v2 = {}
local v3 = {
    ["name"] = "Easter Eggy Box",
    ["image"] = "rbxassetid://16722908299",
    ["rarity"] = "legendary",
    ["cost"] = 14000,
    ["currency_id"] = "eggs_2024",
    ["anims"] = {
        ["hold"] = "HoldingBaby",
        ["box_opening"] = { "Easter2024EggyBoxOpen" }
    },
    ["model_handle"] = "Easter2024EggyBox",
    ["tool"] = "GenericBoxTool"
}
v2.easter_2024_eggy_box = v3
return v1(v2)