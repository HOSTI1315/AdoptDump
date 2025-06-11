--// ReplicatedStorage.SharedModules.ContentPacks.Desert2024.Eggs (ModuleScript)

local v1 = {}
local v2 = {
    ["desert_2024_egg"] = {
        ["common"] = 0.4,
        ["uncommon"] = 0.25,
        ["rare"] = 0.17,
        ["ultra_rare"] = 0.14,
        ["legendary"] = 0.04
    },
    ["desert_2024_royal_egg"] = {
        ["common"] = 0,
        ["uncommon"] = 0.25,
        ["rare"] = 0.37,
        ["ultra_rare"] = 0.3,
        ["legendary"] = 0.08
    }
}
v1.eggs = v2
local v3 = {
    ["desert_2024_egg"] = {
        ["common"] = {
            { "pets", "desert_2024_coyote" },
            { "pets", "desert_2024_armadillo" },
            { "pets", "desert_2024_sandfish" }
        },
        ["uncommon"] = {
            { "pets", "desert_2024_rattlesnake" },
            { "pets", "desert_2024_gila_monster" }
        },
        ["rare"] = {
            { "pets", "desert_2024_thorny_devil" },
            { "pets", "desert_2024_oryx" }
        },
        ["ultra_rare"] = {
            { "pets", "desert_2024_vulture" },
            { "pets", "desert_2024_deathstalker_scorpion" },
            { "pets", "desert_2024_roadrunner" }
        },
        ["legendary"] = {
            { "pets", "desert_2024_cactus_friend" },
            { "pets", "desert_2024_criosphinx" }
        }
    },
    ["desert_2024_royal_egg"] = {
        ["common"] = {},
        ["uncommon"] = {
            { "pets", "desert_2024_rattlesnake" },
            { "pets", "desert_2024_gila_monster" }
        },
        ["rare"] = {
            { "pets", "desert_2024_thorny_devil" },
            { "pets", "desert_2024_oryx" }
        },
        ["ultra_rare"] = {
            { "pets", "desert_2024_vulture" },
            { "pets", "desert_2024_deathstalker_scorpion" },
            { "pets", "desert_2024_roadrunner" }
        },
        ["legendary"] = {
            { "pets", "desert_2024_cactus_friend" },
            { "pets", "desert_2024_criosphinx" }
        }
    }
}
v1.pets = v3
return v1