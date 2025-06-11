--// ReplicatedStorage.SharedModules.ContentPacks.Stickers2024.DeveloperProducts (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("DeveloperProductCallbacks")
local v2 = {
    ["stickers_2024_premium_pack"] = {
        ["name"] = "Premium Sticker Pack",
        ["description"] = "Unlocks the Premium Sticker Pack! ",
        ["cost"] = 50,
        ["product_id"] = 1780851018,
        ["callback"] = v1.all({ v1.add_item("gifts", "stickers_2024_premium_pack") })
    }
}
return v2