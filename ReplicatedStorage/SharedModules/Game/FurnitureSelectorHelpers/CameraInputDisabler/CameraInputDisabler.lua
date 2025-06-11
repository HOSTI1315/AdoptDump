--// ReplicatedStorage.SharedModules.Game.FurnitureSelectorHelpers.CameraInputDisabler (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("PlatformM")
local v_u_2 = game:GetService("Players")
local v_u_3 = {}
local v_u_4 = {}
local v_u_5 = nil
function v_u_3.get_camera_input_enabled(p6)
    return not v_u_4[p6]
end
function v_u_3.set_camera_input_enabled(p7, p8)
    if p8 then
        v_u_4[p7] = nil
    else
        v_u_4[p7] = true
    end
    local v9 = next(v_u_4)
    if not v_u_5 then
        local v10 = v_u_2.LocalPlayer
        for _, v11 in {
            "PlayerScripts",
            "PlayerModule",
            "CameraModule",
            "CameraInput"
        } do
            v10 = v10:FindFirstChild(v11)
            if not v10 then
                v10 = nil
                break
            end
        end
        if v10 then
            v_u_5 = require(v10)
        end
    end
    v_u_5.setInputEnabled(not v9)
end
function v_u_3.set_camera_input_enabled_mobile(p_u_12, p_u_13)
    local v14 = {
        ["tablet"] = "phone",
        ["phone"] = function()
            v_u_3.set_camera_input_enabled(p_u_12, p_u_13)
        end
    }
    v_u_1.run(v14)
end
return v_u_3