--// ReplicatedStorage.SharedModules.ContentPacks.IceCream2025.DeveloperProducts (ModuleScript)

local v1 = {
    ["ice_cream_2025_snow_cone_stand"] = {
        ["name"] = "Snow Cone Stand",
        ["description"] = "Unlocks the Snow Cone Stand!",
        ["cost"] = 60,
        ["product_id"] = 2879189827,
        ["callback"] = require(game.ReplicatedStorage.Fsys).load("DeveloperProductCallbacks").add_item("toys", "ice_cream_2025_snow_cone_stand", true)
    }
}
return v1