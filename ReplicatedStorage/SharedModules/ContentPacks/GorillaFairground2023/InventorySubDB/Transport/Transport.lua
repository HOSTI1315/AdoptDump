--// ReplicatedStorage.SharedModules.ContentPacks.GorillaFairground2023.InventorySubDB.Transport (ModuleScript)

local v1 = {
    ["gorilla_fair_2023_bumper_car"] = {
        ["name"] = "Bumper Car",
        ["image"] = "rbxassetid://12519249137",
        ["rarity"] = "ultra_rare",
        ["colorable"] = true
    },
    ["gorilla_fair_2023_circus_ball_unicycle"] = {
        ["name"] = "Circus Ball Unicycle",
        ["image"] = "rbxassetid://12519249424",
        ["rarity"] = "uncommon"
    }
}
return require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport(v1)