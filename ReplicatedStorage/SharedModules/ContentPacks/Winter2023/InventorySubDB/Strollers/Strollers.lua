--// ReplicatedStorage.SharedModules.ContentPacks.Winter2023.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["winter_2023_hot_cocoa_stroller"] = {
        ["name"] = "Hot Cocoa Stroller",
        ["image"] = "rbxassetid://15416937269",
        ["rarity"] = "rare",
        ["model_handle"] = "Winter2023HotCocoaStroller",
        ["tool"] = "StrollerTool"
    },
    ["winter_2023_sleigh_stroller"] = {
        ["name"] = "Sleigh Stroller",
        ["image"] = "rbxassetid://15319353313",
        ["rarity"] = "uncommon",
        ["cost"] = 5600,
        ["currency_id"] = "gingerbread_2023",
        ["model_handle"] = "Winter2023SleighStroller",
        ["tool"] = "StrollerTool"
    },
    ["winter_2023_stocking_stroller"] = {
        ["name"] = "Stocking Stroller",
        ["image"] = "rbxassetid://15556195687",
        ["rarity"] = "rare",
        ["cost"] = 6900,
        ["currency_id"] = "gingerbread_2023",
        ["model_handle"] = "Winter2023StockingStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)