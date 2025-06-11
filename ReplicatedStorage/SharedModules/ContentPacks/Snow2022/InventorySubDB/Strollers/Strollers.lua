--// ReplicatedStorage.SharedModules.ContentPacks.Snow2022.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["snow_2022_snowmobile_stroller"] = {
        ["name"] = "Snow Mobile Stroller",
        ["image"] = "rbxassetid://9343109811",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1200,
        ["liveops_map_type_required_for_purchase"] = "Snow",
        ["model_handle"] = "Snow2022SnowmobileStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)