--// ReplicatedStorage.SharedModules.ContentPacks.Beach2024.DeveloperProducts (ModuleScript)

local v1 = {
    ["beach_2024_nautilus"] = {
        ["name"] = "Nautilus",
        ["description"] = "Unlocks the Nautilus!",
        ["cost"] = 249,
        ["product_id"] = 1755586353,
        ["callback"] = require(game.ReplicatedStorage.Fsys).load("DeveloperProductCallbacks").add_item("pets", "beach_2024_nautilus", true)
    }
}
return v1