--// ReplicatedStorage.SharedModules.ContentPacks.Easter2022.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["easter_2022_egg_basket_stroller"] = {
        ["name"] = "Egg Basket Stroller",
        ["image"] = "rbxassetid://9296247382",
        ["rarity"] = "rare",
        ["cost"] = 2250,
        ["model_handle"] = "Easter2022EggBasketStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)