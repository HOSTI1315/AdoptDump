--// ReplicatedStorage.SharedModules.ContentPacks.Garden2024.Eggs (ModuleScript)

local v1 = {}
local v2 = {
    ["garden_2024_egg"] = {
        ["common"] = 0.35,
        ["uncommon"] = 0.25,
        ["rare"] = 0.24,
        ["ultra_rare"] = 0.12,
        ["legendary"] = 0.04
    }
}
v1.eggs = v2
local v3 = {
    ["garden_2024_egg"] = {
        ["common"] = {
            { "pets", "garden_2024_garden_snake" }
        },
        ["uncommon"] = {
            { "pets", "garden_2024_mole" }
        },
        ["rare"] = {
            { "pets", "garden_2024_blue_jay" },
            { "pets", "garden_2024_weevil" }
        },
        ["ultra_rare"] = {
            { "pets", "garden_2024_skunk" },
            { "pets", "garden_2024_praying_mantis" }
        },
        ["legendary"] = {
            { "pets", "garden_2024_mushroom_friend" },
            { "pets", "garden_2024_rosy_maple_moth" }
        }
    }
}
v1.pets = v3
return v1