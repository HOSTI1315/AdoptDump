--// ReplicatedStorage.SharedModules.ContentPacks.StarRewards2022.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["star_rewards_2022_frog_stroller"] = {
        ["name"] = "Froggy Stroller",
        ["image"] = "rbxassetid://10202932059",
        ["rarity"] = "rare",
        ["model_handle"] = "StarRewards2022FrogStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)