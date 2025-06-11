--// ReplicatedStorage.SharedModules.ContentPacks.Easter2024.DeveloperProducts (ModuleScript)

local v1 = {
    ["easter_2024_classic_trade_stand"] = {
        ["name"] = "Classic Trade Stand",
        ["description"] = "Unlocks the Classic Trade Stand!",
        ["cost"] = 95,
        ["product_id"] = 1771050556,
        ["callback"] = require(game.ReplicatedStorage.Fsys).load("DeveloperProductCallbacks").add_item("toys", "easter_2024_classic_trade_stand", true)
    }
}
return v1