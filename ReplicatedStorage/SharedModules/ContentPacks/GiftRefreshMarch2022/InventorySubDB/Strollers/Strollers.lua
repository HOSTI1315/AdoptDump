--// ReplicatedStorage.SharedModules.ContentPacks.GiftRefreshMarch2022.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["gift_refresh_2022_red_wagon_stroller"] = {
        ["name"] = "Red Wagon Stroller",
        ["image"] = "rbxassetid://8994946640",
        ["rarity"] = "ultra_rare",
        ["model_handle"] = "GiftRefreshMarch2022RedWagonStroller",
        ["tool"] = "StrollerTool"
    },
    ["gift_refresh_2022_trike_stroller"] = {
        ["name"] = "Trike Stroller",
        ["image"] = "rbxassetid://8994946769",
        ["rarity"] = "common",
        ["model_handle"] = "GiftRefreshMarch2022TrikeStroller",
        ["tool"] = "StrollerTool"
    },
    ["gift_refresh_2022_woodland_stroller"] = {
        ["name"] = "Woodland Cradle Stroller",
        ["image"] = "rbxassetid://8978767570",
        ["rarity"] = "ultra_rare",
        ["model_handle"] = "GiftRefreshMarch2022FlowerSwingStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)