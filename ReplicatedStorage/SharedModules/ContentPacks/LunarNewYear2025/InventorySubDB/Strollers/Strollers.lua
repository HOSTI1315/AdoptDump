--// ReplicatedStorage.SharedModules.ContentPacks.LunarNewYear2025.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["lunar_2025_rickshaw_stroller"] = {
        ["name"] = "Lunar New Year Rickshaw Stroller",
        ["image"] = "rbxassetid://116989245202211",
        ["rarity"] = "ultra_rare",
        ["cost"] = 30,
        ["currency_id"] = "stars_2025",
        ["model_handle"] = "Lunar2025RickshawStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)