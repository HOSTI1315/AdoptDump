--// ReplicatedStorage.SharedPackages._Index.reselim_flipper@2.0.0.flipper.SingleMotor (ModuleScript)

local v_u_1 = require(script.Parent.BaseMotor)
local v_u_2 = setmetatable({}, v_u_1)
v_u_2.__index = v_u_2
function v_u_2.new(p3, p4)
    assert(p3, "Missing argument #1: initialValue")
    local v5 = typeof(p3) == "number"
    assert(v5, "initialValue must be a number!")
    local v6 = v_u_1.new()
    local v7 = v_u_2
    local v8 = setmetatable(v6, v7)
    if p4 == nil then
        v8._useImplicitConnections = true
    else
        v8._useImplicitConnections = p4
    end
    v8._goal = nil
    v8._state = {
        ["complete"] = true,
        ["value"] = p3
    }
    return v8
end
function v_u_2.step(p9, p10)
    if p9._state.complete then
        return true
    end
    local v11 = p9._goal:step(p9._state, p10)
    p9._state = v11
    p9._onStep:fire(v11.value)
    if v11.complete then
        if p9._useImplicitConnections then
            p9:stop()
        end
        p9._onComplete:fire()
    end
    return v11.complete
end
function v_u_2.getValue(p12)
    return p12._state.value
end
function v_u_2.setGoal(p13, p14)
    p13._state.complete = false
    p13._goal = p14
    p13._onStart:fire()
    if p13._useImplicitConnections then
        p13:start()
    end
end
function v_u_2.__tostring(_)
    return "Motor(Single)"
end
return v_u_2