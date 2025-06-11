--// ReplicatedStorage.SharedModules.ContentPacks.UXImprovements2024.Houses (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper")
local v2 = {
    ["mansion"] = {
        ["name"] = "Mansion",
        ["model_name"] = "Mansion",
        ["image"] = "rbxassetid://2015300566",
        ["is_for_sale"] = false,
        ["rarity"] = "house"
    }
}
local v3 = {
    ["name"] = "Cozy Cabin",
    ["model_name"] = "CozyCabin",
    ["image"] = "rbxassetid://8203703840",
    ["is_for_sale"] = false,
    ["recommended_furniture"] = {
        ["content_packs"] = { "Cozy2021" },
        ["tags"] = { "cozy" }
    },
    ["rarity"] = "house",
    ["was_robux_house"] = true,
    ["was_multiple_purchase_or_developer_product"] = true
}
v2.cozy_cabin = v3
local v4 = {
    ["name"] = "Biodome Home",
    ["model_name"] = "Biodome",
    ["image"] = "rbxassetid://9799717163",
    ["is_for_sale"] = false,
    ["recommended_furniture"] = {
        ["content_packs"] = { "Biodome2022" }
    },
    ["rarity"] = "house"
}
v2.biodome = v4
local v5 = {
    ["name"] = "Ruler\'s Castle",
    ["model_name"] = "BigCastle",
    ["image"] = "rbxassetid://2167358368",
    ["is_for_sale"] = false,
    ["recommended_furniture"] = {
        ["tags"] = { "castle" }
    },
    ["rarity"] = "house"
}
v2.bigcastle = v5
local v6 = {
    ["name"] = "Pirate Ship",
    ["model_name"] = "PirateShipHouse",
    ["image"] = "rbxassetid://4935610273",
    ["is_for_sale"] = false,
    ["recommended_furniture"] = {
        ["tags"] = { "pirate" }
    },
    ["rarity"] = "house"
}
v2.pirate_ship = v6
v2.eco_natural_earth_house = {
    ["name"] = "Eco Natural Earth House",
    ["model_name"] = "EcoNaturalEarthHouse",
    ["image"] = "rbxassetid://7543744478",
    ["is_for_sale"] = false,
    ["rarity"] = "house",
    ["was_robux_house"] = true,
    ["was_multiple_purchase_or_developer_product"] = true
}
local v7 = {
    ["name"] = "Mermaid Mansion",
    ["model_name"] = "MermaidMansion",
    ["image"] = "rbxassetid://3038996371",
    ["is_for_sale"] = false,
    ["recommended_furniture"] = {
        ["tags"] = { "mermaid" }
    },
    ["rarity"] = "house",
    ["was_robux_house"] = true,
    ["was_multiple_purchase_or_developer_product"] = true
}
v2.mermaid = v7
for _, v8 in v2 do
    v8.order = -1
end
return v1.houses(v2)