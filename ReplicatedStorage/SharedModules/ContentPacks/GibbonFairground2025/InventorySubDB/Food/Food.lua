--// ReplicatedStorage.SharedModules.ContentPacks.GibbonFairground2025.InventorySubDB.Food (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).food
local v2 = {}
local v3 = {
    ["name"] = "Cinnamon Roasted Almonds",
    ["image"] = "rbxassetid://70470796143413",
    ["rarity"] = "common",
    ["ailment_to_boost"] = "hungry",
    ["anims"] = {
        ["hold"] = "ChocolateHold",
        ["use"] = "ChocolateEat"
    },
    ["model_handle"] = "Gibbon2025CinnamonRoastedAlmonds",
    ["tool"] = "CandyTool",
    ["uses"] = 1
}
v2.gibbon_2025_cinnamon_roasted_almonds = v3
return v1(v2)