--// ReplicatedStorage.SharedModules.ContentPacks.Tutorial2025.Interiors (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("TerrainHelper")
local v5 = {
    ["Tutorial"] = {
        ["render"] = function(p2, p3)
            p3.terrain_cleanup = v_u_1.load_by_tagged_parts(p2, {
                ["WaterColor"] = Color3.fromRGB(49, 163, 211),
                ["WaterReflectance"] = 1,
                ["WaterTransparency"] = 0.3,
                ["WaterWaveSize"] = 0,
                ["WaterWaveSpeed"] = 4
            })
        end,
        ["cleanup"] = function(_, p4)
            p4.terrain_cleanup()
        end
    }
}
return v5