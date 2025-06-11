--// ReplicatedStorage.SharedModules.ContentPacks.Winter2024.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["winter_2024_snowman_stroller"] = {
        ["name"] = "Snowman Stroller",
        ["image"] = "rbxassetid://94746653822647",
        ["rarity"] = "rare",
        ["cost"] = 20000,
        ["currency_id"] = "gingerbread_2024",
        ["model_handle"] = "Winter2024SnowmanStroller",
        ["tool"] = "StrollerTool"
    },
    ["winter_2024_ice_skate_stroller"] = {
        ["name"] = "Ice Skate Stroller",
        ["image"] = "rbxassetid://90939473209940",
        ["rarity"] = "rare",
        ["model_handle"] = "Winter2024IceSkateStroller",
        ["tool"] = "StrollerTool"
    },
    ["winter_2024_snow_globe_stroller"] = {
        ["name"] = "Snow Globe Stroller",
        ["image"] = "rbxassetid://78707157099551",
        ["rarity"] = "uncommon",
        ["cost"] = 13000,
        ["currency_id"] = "gingerbread_2024",
        ["model_handle"] = "Winter2024SnowGlobeStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)