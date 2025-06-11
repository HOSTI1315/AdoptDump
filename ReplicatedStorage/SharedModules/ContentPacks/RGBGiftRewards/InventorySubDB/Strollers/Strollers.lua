--// ReplicatedStorage.SharedModules.ContentPacks.RGBGiftRewards.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["rgb_stroller"] = {
        ["name"] = "RGB Stroller",
        ["image"] = "rbxassetid://8526099597",
        ["rarity"] = "uncommon",
        ["model_handle"] = "RGBStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)