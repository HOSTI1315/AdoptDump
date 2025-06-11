--// ReplicatedStorage.SharedModules.ContentPacks.Camping2025.DeveloperProducts (ModuleScript)

local v1 = {
    ["camping_2025_maple_leaf_treat"] = {
        ["name"] = "Maple Leaf Treat",
        ["description"] = "Unlocks the Maple Leaf Treat!",
        ["cost"] = 199,
        ["product_id"] = 3290081344,
        ["callback"] = require(game.ReplicatedStorage.Fsys).load("DeveloperProductCallbacks").add_item("food", "camping_2025_maple_leaf_treat", true)
    }
}
return v1