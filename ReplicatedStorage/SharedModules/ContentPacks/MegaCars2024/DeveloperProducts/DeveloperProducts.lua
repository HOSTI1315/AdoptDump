--// ReplicatedStorage.SharedModules.ContentPacks.MegaCars2024.DeveloperProducts (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("DeveloperProductCallbacks")
local v2 = {
    ["mega_cars_2024_mega_car_pack"] = {
        ["name"] = "Mega Car Pack",
        ["description"] = "Unlocks 3 Legendary Mega Cars!",
        ["cost"] = 800,
        ["product_id"] = 1727304601,
        ["callback"] = v1.all({
            v1.add_item("transport", "mega_cars_2024_regal_roller"),
            v1.add_item("transport", "mega_cars_2024_street_racer"),
            v1.add_item("transport", "mega_cars_2024_cupids_buggy"),
            v1.dialog("Your 3 Mega Cars are unlocked and ready in your inventory")
        })
    }
}
return v2