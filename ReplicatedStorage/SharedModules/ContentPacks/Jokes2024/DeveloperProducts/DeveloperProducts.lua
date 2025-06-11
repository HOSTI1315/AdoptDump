--// ReplicatedStorage.SharedModules.ContentPacks.Jokes2024.DeveloperProducts (ModuleScript)

local v1 = {
    ["jokes_2024_homeing_rocket"] = {
        ["name"] = "Home-ing Rocket",
        ["description"] = "Take a rocket flight to your house!",
        ["cost"] = 150,
        ["product_id"] = 1888247831,
        ["callback"] = require(game.ReplicatedStorage.Fsys).load("DeveloperProductCallbacks").add_item("toys", "jokes_2024_homeing_rocket", true)
    }
}
return v1