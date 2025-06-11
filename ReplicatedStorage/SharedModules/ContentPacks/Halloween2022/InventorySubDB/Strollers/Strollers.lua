--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2022.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["halloween_2022_crystal_ball_stroller"] = {
        ["name"] = "Crystal Ball Stroller",
        ["image"] = "rbxassetid://10920164175",
        ["rarity"] = "rare",
        ["cost"] = 4000,
        ["currency_id"] = "candy_2022",
        ["model_handle"] = "Halloween2022CrystalBallStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)