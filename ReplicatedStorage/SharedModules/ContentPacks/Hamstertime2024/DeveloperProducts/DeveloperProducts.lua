--// ReplicatedStorage.SharedModules.ContentPacks.Hamstertime2024.DeveloperProducts (ModuleScript)

local v1 = {
    ["hamstertime_2024_golden_corn"] = {
        ["name"] = "Golden Corn",
        ["description"] = "Unlocks the Golden Corn bait!",
        ["cost"] = 199,
        ["product_id"] = 1764626429,
        ["callback"] = require(game.ReplicatedStorage.Fsys).load("DeveloperProductCallbacks").add_item("food", "hamstertime_2024_golden_corn")
    }
}
return v1