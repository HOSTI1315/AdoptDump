--// ReplicatedStorage.SharedModules.ContentPacks.GiftHatNovember2024.DeveloperProducts (ModuleScript)

local v1 = {
    ["gifthat_november_2024_hippogriff"] = {
        ["name"] = "Hippogrif",
        ["description"] = "Unlocks the Legendary Hippogriff pet!",
        ["cost"] = 600,
        ["product_id"] = 2653673789,
        ["callback"] = require(game.ReplicatedStorage.Fsys).load("DeveloperProductCallbacks").add_item("pets", "gifthat_november_2024_hippogriff", true)
    }
}
return v1