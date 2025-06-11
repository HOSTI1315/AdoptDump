--// ReplicatedStorage.SharedModules.ContentPacks.Desert2022.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["desert_2022_chariot_stroller"] = {
        ["name"] = "Egyptian Chariot Stroller",
        ["image"] = "rbxassetid://8528286474",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1200,
        ["liveops_map_type_required_for_purchase"] = "Desert",
        ["model_handle"] = "Desert2022ChariotStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)