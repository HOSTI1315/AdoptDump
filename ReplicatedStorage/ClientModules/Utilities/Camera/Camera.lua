--// ReplicatedStorage.ClientModules.Utilities.Camera (ModuleScript)

local v_u_31 = {
    ["set_zoom_distance"] = function(p1)
        local v2 = game.Players.LocalPlayer.CameraMaxZoomDistance
        local v3 = game.Players.LocalPlayer.CameraMinZoomDistance
        game.Players.LocalPlayer.CameraMaxZoomDistance = p1
        game.Players.LocalPlayer.CameraMinZoomDistance = p1
        game.Players.LocalPlayer.CameraMaxZoomDistance = v2
        game.Players.LocalPlayer.CameraMinZoomDistance = v3
    end,
    ["world_to_screen_point"] = function(p4, p5, p6, p7)
        local v8 = p5.X / 2
        local v9 = p5.Y / 2
        local v10 = p4:PointToObjectSpace(p7)
        local v11 = -v9
        local v12 = p6 * 3.141592653589793 / 360
        local v13 = v11 / math.tan(v12)
        local v14 = v10.Y / v10.Z * v13
        local v15 = v10.X / v10.Z * v13
        local v16
        if v10.Z < 0 and math.abs(v15) < v8 then
            v16 = math.abs(v14) < v9
        else
            v16 = false
        end
        local v17 = v8 + v15
        local v18 = v9 - v14
        local v19 = -v10.Z
        return Vector3.new(v17, v18, v19), v16
    end,
    ["calculate_desired_camera_cframe"] = function(p20, p21, p22, p23, p24, p25)
        local v26 = (p20 - p20.p + p23) * CFrame.new(0, 0, p25)
        local v27 = v_u_31.world_to_screen_point(v26 * CFrame.new(1, 1, 0), p21, p22, p23) - v_u_31.world_to_screen_point(v26, p21, p22, p23)
        local v28 = Vector2.new(v27.X, v27.Y)
        local v29 = (p24 - p21 / 2) / v28
        return v26 * CFrame.new(v29.X, v29.Y, 0)
    end,
    ["is_in_first_person"] = function()
        local v30 = require(game.Players.LocalPlayer.PlayerScripts.PlayerModule):GetCameras().activeCameraController
        if v30 then
            return v30:IsInFirstPerson()
        else
            return false
        end
    end,
    ["enter_scriptable_camera"] = function()
        if not v_u_31.is_in_first_person() then
            workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
            return function() end
        end
        v_u_31.set_zoom_distance(5)
        workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
        return function()
            v_u_31.set_zoom_distance(0)
        end
    end
}
return v_u_31