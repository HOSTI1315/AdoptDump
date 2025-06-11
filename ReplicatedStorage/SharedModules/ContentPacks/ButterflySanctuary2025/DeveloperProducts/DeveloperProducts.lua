--// ReplicatedStorage.SharedModules.ContentPacks.ButterflySanctuary2025.DeveloperProducts (ModuleScript)

local v1 = {
    ["butterfly_2025_goldenrod_flower"] = {
        ["name"] = "Goldenrod Flower",
        ["description"] = "Unlocks the Goldenrod Flower!",
        ["cost"] = 199,
        ["product_id"] = 3294520900,
        ["callback"] = require(game.ReplicatedStorage.Fsys).load("DeveloperProductCallbacks").add_item("food", "butterfly_2025_goldenrod_flower", true)
    }
}
return v1