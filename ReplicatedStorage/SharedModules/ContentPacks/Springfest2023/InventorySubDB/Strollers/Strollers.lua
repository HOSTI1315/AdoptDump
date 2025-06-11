--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2023.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["springfest_2023_big_leaf_stroller"] = {
        ["name"] = "Big Leaf Stroller",
        ["image"] = "rbxassetid://12792508616",
        ["rarity"] = "common",
        ["cost"] = 300,
        ["currency_id"] = "eggs_2023",
        ["model_handle"] = "Springfest2023BigLeafStroller",
        ["tool"] = "StrollerTool"
    },
    ["springfest_2023_flower_cart_stroller"] = {
        ["name"] = "Flower Cart Stroller",
        ["image"] = "rbxassetid://12792507846",
        ["rarity"] = "rare",
        ["cost"] = 800,
        ["currency_id"] = "eggs_2023",
        ["model_handle"] = "Springfest2023FlowerCartStroller",
        ["tool"] = "StrollerTool"
    },
    ["springfest_2023_tulip_stroller"] = {
        ["name"] = "Tulip Stroller",
        ["image"] = "rbxassetid://12917527827",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1500,
        ["currency_id"] = "eggs_2023",
        ["model_handle"] = "Springfest2023TulipStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)