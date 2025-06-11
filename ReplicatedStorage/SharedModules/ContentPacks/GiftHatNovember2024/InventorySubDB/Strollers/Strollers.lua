--// ReplicatedStorage.SharedModules.ContentPacks.GiftHatNovember2024.InventorySubDB.Strollers (ModuleScript)

local v1 = {
    ["gifthat_november_2024_claw_machine_stroller"] = {
        ["name"] = "Claw Machine Stroller",
        ["image"] = "rbxassetid://89043551386849",
        ["rarity"] = "ultra_rare",
        ["model_handle"] = "GiftHatNov2024ClawMachineStroller",
        ["tool"] = "StrollerTool"
    },
    ["gifthat_november_2024_drone_stroller"] = {
        ["name"] = "Drone Stroller",
        ["image"] = "rbxassetid://117478815066569",
        ["rarity"] = "ultra_rare",
        ["model_handle"] = "GiftHatNov2024DroneStroller",
        ["tool"] = "StrollerTool"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).strollers(v1)