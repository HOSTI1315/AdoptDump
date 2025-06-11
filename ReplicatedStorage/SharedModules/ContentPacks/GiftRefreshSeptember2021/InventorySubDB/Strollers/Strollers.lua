--// ReplicatedStorage.SharedModules.ContentPacks.GiftRefreshSeptember2021.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["lunar_stroller"] = {
        ["name"] = "Lunar Stroller",
        ["image"] = "rbxassetid://7368046225",
        ["rarity"] = "ultra_rare",
        ["model_handle"] = "LunarStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)