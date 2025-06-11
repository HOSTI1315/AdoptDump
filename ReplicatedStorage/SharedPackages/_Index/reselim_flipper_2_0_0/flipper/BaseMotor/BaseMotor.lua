--// ReplicatedStorage.SharedPackages._Index.reselim_flipper@2.0.0.flipper.BaseMotor (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v_u_2 = require(script.Parent.Signal)
local function v3() end
local v_u_4 = {}
v_u_4.__index = v_u_4
function v_u_4.new()
    local v5 = {
        ["_onStep"] = v_u_2.new(),
        ["_onStart"] = v_u_2.new(),
        ["_onComplete"] = v_u_2.new()
    }
    local v6 = v_u_4
    return setmetatable(v5, v6)
end
function v_u_4.onStep(p7, p8)
    return p7._onStep:connect(p8)
end
function v_u_4.onStart(p9, p10)
    return p9._onStart:connect(p10)
end
function v_u_4.onComplete(p11, p12)
    return p11._onComplete:connect(p12)
end
function v_u_4.start(p_u_13)
    if not p_u_13._connection then
        p_u_13._connection = v_u_1.RenderStepped:Connect(function(p14)
            p_u_13:step(p14)
        end)
    end
end
function v_u_4.stop(p15)
    if p15._connection then
        p15._connection:Disconnect()
        p15._connection = nil
    end
end
v_u_4.destroy = v_u_4.stop
v_u_4.step = v3
v_u_4.getValue = v3
v_u_4.setGoal = v3
function v_u_4.__tostring(_)
    return "Motor"
end
return v_u_4