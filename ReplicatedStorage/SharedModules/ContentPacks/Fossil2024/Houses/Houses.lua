--// ReplicatedStorage.SharedModules.ContentPacks.Fossil2024.Houses (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper").houses
local v2 = {}
local v3 = {
    ["name"] = "Expandable Dino House",
    ["model_name"] = "DinoHouse",
    ["image"] = "rbxassetid://17159480411",
    ["order"] = 308,
    ["gamepass"] = "fossil_isle_bundle_gamepass",
    ["is_for_sale"] = true,
    ["default_color"] = Color3.fromRGB(158, 112, 89),
    ["terrain_properties"] = {
        ["WaterColor"] = Color3.fromRGB(78, 173, 217),
        ["WaterReflectance"] = 0.6,
        ["WaterTransparency"] = 0.4
    },
    ["recommended_furniture"] = {
        ["content_packs"] = { "Fossil2024" }
    }
}
local v4 = {
    ["extension_2"] = {
        ["name"] = "Side Extension",
        ["cost"] = 600,
        ["order"] = 1
    },
    ["extension_3"] = {
        ["name"] = "Pool Extension",
        ["cost"] = 700,
        ["order"] = 2
    },
    ["extension_4"] = {
        ["name"] = "Second Floor",
        ["cost"] = 800,
        ["order"] = 3
    },
    ["extension_5"] = {
        ["name"] = "Sunken Basement",
        ["cost"] = 500,
        ["order"] = 4
    }
}
v3.addons = v4
v3.rarity = "house"
v2.dino_house = v3
return v1(v2)