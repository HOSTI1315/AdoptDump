--// ReplicatedStorage.SharedModules.ContentPacks.Springfest2025.DeveloperProducts (ModuleScript)

local v1 = {
    ["spring_2025_dance_arcade_stand"] = {
        ["name"] = "Dance Arcade Stand",
        ["description"] = "Unlocks the Dance Arcade Stand!",
        ["cost"] = 125,
        ["product_id"] = 3266476151,
        ["callback"] = require(game.ReplicatedStorage.Fsys).load("DeveloperProductCallbacks").add_item("toys", "spring_2025_dance_arcade_stand", true)
    }
}
return v1