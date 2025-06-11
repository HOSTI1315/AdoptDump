--// ReplicatedStorage.ClientServices.VehicleClient.VehicleCamera (ModuleScript)

local v1 = game:GetService("Players")
local v_u_2 = require(v1.LocalPlayer.PlayerScripts.PlayerModule):GetCameras()
local v_u_3 = {
    ["default"] = v_u_2:GetDefaultVehicleCameraConfig(),
    ["hoverboard"] = {
        ["pitchStiffness"] = 0
    },
    ["freecam"] = {
        ["autocorrectDelay"] = (1 / 0),
        ["pitchStiffness"] = 0,
        ["yawStiffness"] = 0
    },
    ["skates_desktop"] = {
        ["yawStiffness"] = 1.35,
        ["autocorrectResponse"] = 1,
        ["cutoffMinAngularVelYaw"] = 60,
        ["cutoffMaxAngularVelYaw"] = 180,
        ["yawReponseDampingRising"] = 1,
        ["yawResponseDampingFalling"] = 3
    }
}
local v_u_4 = {}
local v_u_5 = "default"
function v_u_4.validate_configuration_name(p6)
    local v7 = v_u_3[p6]
    local v8 = ("No configuration exists by name %*!"):format(p6)
    assert(v7, v8)
end
function v_u_4.apply_configuration(p9)
    local v10 = p9 or "default"
    local v11 = v_u_3[v10]
    v_u_4.validate_configuration_name(v10)
    if v10 ~= v_u_5 then
        v_u_2:SetVehicleCameraConfig(v11)
        v_u_5 = v10
    end
end
function v_u_4.reset_configuration()
    v_u_4.apply_configuration("default")
end
return v_u_4