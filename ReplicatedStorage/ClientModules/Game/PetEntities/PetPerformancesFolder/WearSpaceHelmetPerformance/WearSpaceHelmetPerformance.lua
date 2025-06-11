--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.WearSpaceHelmetPerformance (ModuleScript)

local v1 = {
    ["name"] = script.Name
}
local v_u_2 = {
    ["moon_2025_starmite"] = true,
    ["moon_2025_puptune"] = true,
    ["moon_2025_zeopod"] = true,
    ["moon_2025_snorgle"] = true,
    ["moon_2025_hopbop"] = true,
    ["moon_2025_dimension_drifter"] = true,
    ["moon_2025_moonpine"] = true,
    ["moon_2025_sunglider"] = true
}
function v1.init_performance(p3, _)
    if v_u_2[p3.base.entry.id] then
        return nil
    end
    local v4 = {
        ["modifiers"] = {
            ["accessory_ids"] = { "moon_egg_2025_helmet" }
        },
        ["priorities"] = {
            ["accessory_ids"] = 10000
        }
    }
    return v4
end
function v1.step()
    return nil
end
function v1.calculate_modifiers(_, p5)
    return p5.modifiers or {}, p5.priorities or {}
end
return v1