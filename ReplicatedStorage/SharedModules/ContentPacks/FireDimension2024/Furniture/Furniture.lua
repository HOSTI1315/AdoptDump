--// ReplicatedStorage.SharedModules.ContentPacks.FireDimension2024.Furniture (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("EntryHelper")
local v3 = v1("NPCHelper")
local v4 = v2.furniture
local v5 = {
    ["fire_dimension_2024_tim_1"] = {
        ["name"] = "Tim",
        ["model_name"] = "FireDimension2024Tim1",
        ["behavior"] = v3.NPC_SIMPLE("fire_dimension_2024_tim_1")
    },
    ["fire_dimension_2024_tim_2"] = {
        ["name"] = "Tim",
        ["model_name"] = "FireDimension2024Tim1",
        ["behavior"] = v3.NPC_SIMPLE("fire_dimension_2024_tim_2")
    },
    ["fire_dimension_2024_tim_3"] = {
        ["name"] = "Tim",
        ["model_name"] = "FireDimension2024Tim1",
        ["behavior"] = v3.NPC_SIMPLE("fire_dimension_2024_tim_3")
    },
    ["fire_dimension_2024_tim_4"] = {
        ["name"] = "Tim",
        ["model_name"] = "FireDimension2024Tim1",
        ["behavior"] = v3.NPC_SIMPLE("fire_dimension_2024_tim_4")
    },
    ["fire_dimension_2024_tim_5"] = {
        ["name"] = "Tim",
        ["model_name"] = "FireDimension2024Tim2",
        ["behavior"] = v3.NPC_SIMPLE("fire_dimension_2024_tim_5")
    }
}
return v4(v5)