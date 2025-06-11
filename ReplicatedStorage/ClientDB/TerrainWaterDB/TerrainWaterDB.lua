--// ReplicatedStorage.ClientDB.TerrainWaterDB (ModuleScript)

local v1 = {
    ["default"] = {
        ["WaterColor"] = workspace.Terrain.WaterColor,
        ["WaterReflectance"] = 0.6,
        ["WaterTransparency"] = 0.3,
        ["WaterWaveSize"] = 0.15,
        ["WaterWaveSpeed"] = 13
    },
    ["housing_default"] = {
        ["WaterColor"] = Color3.fromRGB(138, 179, 255),
        ["WaterReflectance"] = 0,
        ["WaterTransparency"] = 1,
        ["WaterWaveSize"] = 0.15,
        ["WaterWaveSpeed"] = 3
    }
}
return v1