--// ReplicatedStorage.SharedModules.ContentPacks.Summerfest2024.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["summerfest_2024_plane_stroller"] = {
        ["name"] = "Plane Stroller",
        ["image"] = "rbxassetid://17823278539",
        ["rarity"] = "uncommon",
        ["cost"] = 5500,
        ["currency_id"] = "tickets_2024",
        ["model_handle"] = "Summerfest2024PlaneStroller",
        ["tool"] = "StrollerTool"
    },
    ["summerfest_2024_elephant_stroller"] = {
        ["name"] = "Elephant Stroller",
        ["image"] = "rbxassetid://18117852633",
        ["rarity"] = "ultra_rare",
        ["cost"] = 23000,
        ["currency_id"] = "tickets_2024",
        ["model_handle"] = "Summer2024ElephantStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)