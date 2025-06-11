--// ReplicatedStorage.SharedModules.ContentPacks.Moon2025.Eggs (ModuleScript)

local v1 = {}
local v2 = {
    ["moon_2025_egg"] = {
        ["common"] = 0.35,
        ["uncommon"] = 0.25,
        ["rare"] = 0.24,
        ["ultra_rare"] = 0.12,
        ["legendary"] = 0.04
    },
    ["moon_2025_royal_egg"] = {
        ["common"] = 0,
        ["uncommon"] = 0.35,
        ["rare"] = 0.34,
        ["ultra_rare"] = 0.25,
        ["legendary"] = 0.06
    }
}
v1.eggs = v2
local v3 = {
    ["moon_2025_egg"] = {
        ["common"] = {
            { "pets", "moon_2025_hopbop" }
        },
        ["uncommon"] = {
            { "pets", "moon_2025_snorgle" }
        },
        ["rare"] = {
            { "pets", "moon_2025_zeopod" },
            { "pets", "moon_2025_moonpine" }
        },
        ["ultra_rare"] = {
            { "pets", "moon_2025_starmite" },
            { "pets", "moon_2025_puptune" }
        },
        ["legendary"] = {
            { "pets", "moon_2025_dimension_drifter" },
            { "pets", "moon_2025_sunglider" }
        }
    },
    ["moon_2025_royal_egg"] = {
        ["uncommon"] = {
            { "pets", "moon_2025_snorgle" }
        },
        ["rare"] = {
            { "pets", "moon_2025_zeopod" },
            { "pets", "moon_2025_moonpine" }
        },
        ["ultra_rare"] = {
            { "pets", "moon_2025_starmite" },
            { "pets", "moon_2025_puptune" }
        },
        ["legendary"] = {
            { "pets", "moon_2025_dimension_drifter" },
            { "pets", "moon_2025_sunglider" }
        }
    }
}
v1.pets = v3
return v1