--// ReplicatedStorage.SharedModules.ContentPacks.Easter2024.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["easter_2024_meadow_barrow_stroller"] = {
        ["name"] = "Meadow Barrow Stroller",
        ["image"] = "rbxassetid://16734252542",
        ["rarity"] = "uncommon",
        ["cost"] = 5400,
        ["currency_id"] = "eggs_2024",
        ["model_handle"] = "Easter2024MeadowBarrowStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)