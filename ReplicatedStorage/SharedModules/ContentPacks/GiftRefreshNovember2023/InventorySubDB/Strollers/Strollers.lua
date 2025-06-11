--// ReplicatedStorage.SharedModules.ContentPacks.GiftRefreshNovember2023.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["gift_refresh_2023_pea_pod_stroller"] = {
        ["name"] = "Pea Pod Stroller",
        ["image"] = "rbxassetid://15175548925",
        ["rarity"] = "ultra_rare",
        ["model_handle"] = "GiftRefreshNovember2023PeaPodStroller",
        ["tool"] = "StrollerTool"
    },
    ["gift_refresh_2023_sailboat_stroller"] = {
        ["name"] = "Sailboat Stroller",
        ["image"] = "rbxassetid://15175549352",
        ["rarity"] = "uncommon",
        ["model_handle"] = "GiftRefreshNovember2023SailboatStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)