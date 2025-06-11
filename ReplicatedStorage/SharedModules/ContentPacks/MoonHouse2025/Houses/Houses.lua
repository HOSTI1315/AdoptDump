--// ReplicatedStorage.SharedModules.ContentPacks.MoonHouse2025.Houses (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v1("package:t")
local v3 = v1("EntryHelper").houses
local v4 = {}
local v5 = {
    ["name"] = "Moon House",
    ["model_name"] = "MoonHouseInterior",
    ["exterior_name"] = "MoonHouseExterior",
    ["image"] = "rbxassetid://137165460653779",
    ["order"] = 306,
    ["cost"] = 4000,
    ["is_for_sale"] = true,
    ["rarity"] = "house",
    ["disable_setting_wall_textures"] = true,
    ["disable_setting_floor_textures"] = true,
    ["recommended_furniture"] = {
        ["tags"] = { "MoonHouse2025" }
    },
    ["validate_properties"] = v2.strictInterface({
        ["low_gravity"] = v2.boolean
    })
}
v4.moon_house = v5
return v3(v4)