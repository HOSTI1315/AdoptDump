--// ReplicatedStorage.SharedModules.ContentPacks.IceCream2025.Houses (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper").houses
local v2 = {}
local v3 = {
    ["name"] = "Ice Cream House",
    ["model_name"] = "IceCreamHouse",
    ["image"] = "rbxassetid://73040943638419",
    ["order"] = 306,
    ["is_for_sale"] = true,
    ["cost"] = 2150,
    ["default_color"] = Color3.fromRGB(241, 134, 255),
    ["recommended_furniture"] = {
        ["content_packs"] = { "IceCreamHouse2025" }
    },
    ["rarity"] = "house"
}
v2.ice_cream_house = v3
return v1(v2)