--// ReplicatedStorage.SharedModules.ContentPacks.CampingShop2023.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["camping_2023_wheelbarrow_stroller"] = {
        ["name"] = "Camper\'s Wheelbarrow Stroller",
        ["image"] = "rbxassetid://12403142964",
        ["rarity"] = "uncommon",
        ["cost"] = 400,
        ["colorable"] = true,
        ["model_handle"] = "Camping2023WheelbarrowStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)