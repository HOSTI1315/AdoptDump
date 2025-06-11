--// ReplicatedStorage.SharedModules.ContentPacks.Pool2023.Furniture (ModuleScript)

local v1 = {
    ["pool_2023_exterior_chair"] = {
        ["model_name"] = "Pool2023ExteriorChair",
        ["name"] = "Exterior Chair"
    },
    ["pool_2023_interior_chair"] = {
        ["model_name"] = "Pool2023InteriorChair",
        ["name"] = "Interior Chair"
    },
    ["pool_2023_hottub_button"] = {
        ["model_name"] = "Pool2023HottubButton",
        ["name"] = "Hot Tub Button"
    },
    ["pool_2023_water_spout"] = {
        ["model_name"] = "Pool2023WaterSpout",
        ["name"] = "Water Spout"
    },
    ["pool_2023_blue_mermaid_float"] = {
        ["model_name"] = "Pool2023BlueMermaidFloat",
        ["name"] = "Blue Mermaid Float"
    },
    ["pool_2023_red_inner_tube"] = {
        ["model_name"] = "Pool2023RedInnerTube",
        ["name"] = "Red Inner Tube"
    },
    ["pool_2023_green_inner_tube"] = {
        ["model_name"] = "Pool2023GreenInnerTube",
        ["name"] = "Green Inner Tube"
    },
    ["pool_2023_purple_inner_tube"] = {
        ["model_name"] = "Pool2023PurpleInnerTube",
        ["name"] = "Purple Inner Tube"
    },
    ["pool_2023_red_lazy_float"] = {
        ["model_name"] = "Pool2023RedLazyFloat",
        ["name"] = "Red Lazy Float"
    },
    ["pool_2023_yellow_lazy_float"] = {
        ["model_name"] = "Pool2023YellowLazyFloat",
        ["name"] = "Yellow Lazy Float"
    },
    ["pool_2023_red_tulip_chair"] = {
        ["model_name"] = "Pool2023RedTulipChair",
        ["name"] = "Red Tulip Chair"
    },
    ["pool_2023_blue_tulip_chair"] = {
        ["model_name"] = "Pool2023BlueTulipChair",
        ["name"] = "Blue Tulip Chair"
    }
}
return require(game.ReplicatedStorage.Fsys).load("EntryHelper").furniture(v1)