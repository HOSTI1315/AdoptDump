--// ReplicatedStorage.ClientModules.Game.ControlsDisabler (ModuleScript)

local v_u_1 = game:GetService("Players").LocalPlayer
local v_u_2 = require(v_u_1.PlayerScripts.PlayerModule):GetControls()
local v_u_3 = game:GetService("RunService")
local v_u_4 = {}
local v_u_5 = {}
local function v_u_8()
    v_u_3:UnbindFromRenderStep("DisableControlsInALoop")
    if next(v_u_4) == nil then
        v_u_2:Enable()
    else
        v_u_2:Disable()
        v_u_3:BindToRenderStep("DisableControlsInALoop", Enum.RenderPriority.Input.Value - 1, function()
            v_u_2:Disable()
        end)
        local v6 = v_u_1.Character
        if v6 then
            v6 = v6:FindFirstChild("Humanoid")
        end
        if v6 then
            local v7 = v6.SeatPart
            if v7 and v7:IsA("VehicleSeat") then
                v7.Throttle = 0
                v7.Steer = 0
            end
        end
    end
end
function v_u_5.disable_controls(p9)
    assert(p9, "Must provide a string handle to disable_controls.")
    local v10 = p9 ~= v_u_5
    assert(v10, "ControlsDisabler.disable_controls is called with a period, not a colon.")
    v_u_4[p9] = true
    v_u_8()
end
function v_u_5.enable_controls(p11)
    assert(p11, "Must provide a string handle to enable_controls.")
    local v12 = p11 ~= v_u_5
    assert(v12, "ConstrolsDisabler.enable_controls is called with a period, not a colon.")
    v_u_4[p11] = nil
    v_u_8()
end
function v_u_5.get_active_disables()
    local v13 = {}
    for v14, _ in pairs(v_u_4) do
        table.insert(v13, v14)
    end
    return v13
end
return v_u_5