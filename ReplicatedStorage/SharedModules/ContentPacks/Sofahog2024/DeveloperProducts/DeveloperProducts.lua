--// ReplicatedStorage.SharedModules.ContentPacks.Sofahog2024.DeveloperProducts (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("DeveloperProductCallbacks")
local v2 = {
    ["sofahog_2024_groundhog"] = {
        ["name"] = "Groundhog",
        ["description"] = "Unlocks Groundhog pet!",
        ["cost"] = 150,
        ["product_id"] = 1738957646,
        ["callback"] = v1.all({ v1.add_item("pets", "sofahog_2024_groundhog", true) })
    }
}
return v2