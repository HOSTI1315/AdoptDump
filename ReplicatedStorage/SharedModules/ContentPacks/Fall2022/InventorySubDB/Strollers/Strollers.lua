--// ReplicatedStorage.SharedModules.ContentPacks.Fall2022.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["fall_2022_harvest_wheelbarrow_stroller"] = {
        ["name"] = "Fall Wheelbarrow Stroller",
        ["image"] = "rbxassetid://9973767763",
        ["rarity"] = "ultra_rare",
        ["cost"] = 1200,
        ["liveops_map_type_required_for_purchase"] = "Fall",
        ["model_handle"] = "Fall2022HarvestWheelbarrow",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)