--// ReplicatedStorage.SharedModules.ContentPacks.Amatruck2023.InventorySubDB.Transport (ModuleScript)

local v1 = require(game.ReplicatedStorage.ClientDB.Inventory.EntryHelper).transport
local v2 = {}
local v3 = {
    ["name"] = "Toy Delivery Truck",
    ["image"] = "rbxassetid://13000665972",
    ["rarity"] = "uncommon",
    ["colorable"] = true,
    ["viewport_override"] = {
        ["distance"] = 22.5,
        ["orientation"] = CFrame.fromEulerAnglesYXZ(-0.3490658503988659, -1.5707963267948966, 0)
    }
}
v2.amatruck_2023_toy_delivery_truck = v3
return v1(v2)