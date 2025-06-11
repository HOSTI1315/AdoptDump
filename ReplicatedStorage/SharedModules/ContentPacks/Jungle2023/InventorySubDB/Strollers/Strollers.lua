--// ReplicatedStorage.SharedModules.ContentPacks.Jungle2023.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["shopping_cart_stroller"] = {
        ["name"] = "Shopping Cart Stroller",
        ["image"] = "rbxassetid://13986982302",
        ["rarity"] = "common",
        ["cost"] = 200,
        ["colorable"] = true,
        ["colorable_models"] = { "ShoppingCartStroller" },
        ["model_handle"] = "ShoppingCartStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)