--// ReplicatedStorage.SharedModules.ContentPacks.Halloween2022.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("EntryHelper")
local v2 = {
    ["halloween_2022_floating_crystal_light"] = {
        ["name"] = "Floating Crystal Light",
        ["cost"] = 900,
        ["model_name"] = "Halloween2022FloatingCrystalLight",
        ["image_id"] = 11096369937
    },
    ["halloween_2022_evil_chandelier"] = {
        ["name"] = "Evil Chandelier",
        ["cost"] = 300,
        ["model_name"] = "Halloween2022EvilChandelier",
        ["image_id"] = 11096369858
    },
    ["halloween_2022_evil_chair"] = {
        ["name"] = "Evil Chair",
        ["cost"] = 57,
        ["model_name"] = "Halloween2022EvilChair",
        ["image_id"] = 11096369764
    },
    ["halloween_2022_evil_table"] = {
        ["name"] = "Evil Table",
        ["cost"] = 145,
        ["model_name"] = "Halloween2022EvilTable",
        ["image_id"] = 11096370012
    },
    ["halloween_2022_evil_window"] = {
        ["name"] = "Evil Window",
        ["cost"] = 110,
        ["model_name"] = "Halloween2022EvilWindow",
        ["image_id"] = 11096370210
    },
    ["halloween_2022_evil_window_tall"] = {
        ["name"] = "Evil Window Tall",
        ["cost"] = 120,
        ["model_name"] = "Halloween2022EvilWindowTall",
        ["image_id"] = 11096376765
    }
}
for _, v3 in v2 do
    v3.tags = { "Halloween2022Placeable" }
end
return v1.furniture(v2)