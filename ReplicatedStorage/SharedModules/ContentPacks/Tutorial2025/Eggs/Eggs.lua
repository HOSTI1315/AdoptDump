--// ReplicatedStorage.SharedModules.ContentPacks.Tutorial2025.Eggs (ModuleScript)

local v1 = {}
local v2 = {
    ["tutorial_2025_egg"] = {
        ["common"] = 0.6,
        ["uncommon"] = 0.3,
        ["rare"] = 0.1
    }
}
v1.eggs = v2
local v3 = {
    ["tutorial_2025_egg"] = {
        ["common"] = {
            { "pets", "basic_egg_2022_mouse" }
        },
        ["uncommon"] = {
            { "pets", "basic_egg_2022_poodle" }
        },
        ["rare"] = {
            { "pets", "basic_egg_2022_parakeet" }
        }
    }
}
v1.pets = v3
return v1