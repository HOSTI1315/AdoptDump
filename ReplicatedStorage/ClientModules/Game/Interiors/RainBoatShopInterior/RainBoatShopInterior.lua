--// ReplicatedStorage.ClientModules.Game.Interiors.RainBoatShopInterior (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("LiveOpsMapSwap")
return {
    ["render"] = function(p3, p4)
        local v_u_5 = v_u_1("InteriorsM")
        if p3.Ambience then
            p3.Ambience:Play()
        end
        v_u_1("CameraParticlesClient").set_camera_particles("MainMapRain", 10, "RainDrops")
        p4.kick_player_out = v_u_2.map_type_changed:Connect(function()
            if v_u_2.get_current_map_type() ~= "Rain" then
                v_u_5.enter_smooth("MainMap", "Neighborhood!MainDoor")
            end
        end)
        p4.terrain_cleanup = v_u_1("TerrainHelper").load_by_tagged_parts(p3, {
            ["WaterColor"] = Color3.fromRGB(49, 163, 211),
            ["WaterReflectance"] = 1,
            ["WaterTransparency"] = 0.3,
            ["WaterWaveSize"] = 0,
            ["WaterWaveSpeed"] = 4
        })
    end,
    ["cleanup"] = function(p6, p7)
        if p6.Ambience then
            p6.Ambience:Stop()
        end
        v_u_1("CameraParticlesClient").remove_camera_particles("MainMapRain")
        p7.kick_player_out:Disconnect()
        p7.kick_player_out = nil
        p7.terrain_cleanup()
        p7.terrain_cleanup = nil
    end
}