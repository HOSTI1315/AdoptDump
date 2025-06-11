--// ReplicatedStorage.ClientModules.Game.Interiors.RainPetShopInterior (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("LiveOpsMapSwap")
return {
    ["render"] = function(p_u_3, p4)
        local v_u_5 = v_u_1("InteriorsM")
        local v_u_6 = v_u_1("PublicLootBoxRewards")
        if p_u_3.Ambience then
            p_u_3.Ambience:Play()
        end
        v_u_1("CameraParticlesClient").set_camera_particles("MainMapRain", 10, "RainDrops")
        v_u_1("AmazonAdoption").start(p_u_3, p4)
        v_u_6.request():andThen(function(p7)
            p_u_3.SignBoard.MainFace.SurfaceGui.Odds.Text = v_u_6.convert_to_human_readable(p7.rain_2023_golden_plantain)
        end)
        p4.kick_player_out = v_u_2.map_type_changed:Connect(function()
            if v_u_2.get_current_map_type() ~= "Rain" then
                v_u_5.enter_smooth("MainMap", "Neighborhood!MainDoor")
            end
        end)
        p4.terrain_cleanup = v_u_1("TerrainHelper").load_by_tagged_parts(p_u_3, {
            ["WaterColor"] = Color3.fromRGB(49, 163, 211),
            ["WaterReflectance"] = 1,
            ["WaterTransparency"] = 0.3,
            ["WaterWaveSize"] = 0,
            ["WaterWaveSpeed"] = 4
        })
    end,
    ["cleanup"] = function(p8, p9)
        if p8.Ambience then
            p8.Ambience:Stop()
        end
        v_u_1("CameraParticlesClient").remove_camera_particles("MainMapRain")
        v_u_1("AmazonAdoption").stop(p8)
        p9.kick_player_out:Disconnect()
        p9.kick_player_out = nil
        p9.terrain_cleanup()
        p9.terrain_cleanup = nil
    end
}