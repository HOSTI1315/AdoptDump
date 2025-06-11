--// ReplicatedStorage.SharedPackages._Index.reselim_flipper@2.0.0.flipper.GroupMotor (ModuleScript)

local v_u_1 = require(script.Parent.BaseMotor)
local v_u_2 = require(script.Parent.SingleMotor)
local v_u_3 = require(script.Parent.isMotor)
local v_u_4 = setmetatable({}, v_u_1)
v_u_4.__index = v_u_4
local function v_u_7(p5)
    if v_u_3(p5) then
        return p5
    end
    local v6 = typeof(p5)
    if v6 == "number" then
        return v_u_2.new(p5, false)
    end
    if v6 == "table" then
        return v_u_4.new(p5, false)
    end
    error(("Unable to convert %q to motor; type %s is unsupported"):format(p5, v6), 2)
end
function v_u_4.new(p8, p9)
    assert(p8, "Missing argument #1: initialValues")
    local v10 = typeof(p8) == "table"
    assert(v10, "initialValues must be a table!")
    local v11 = not p8.step
    assert(v11, "initialValues contains disallowed property \"step\". Did you mean to put a table of values here?")
    local v12 = v_u_1.new()
    local v13 = v_u_4
    local v14 = setmetatable(v12, v13)
    if p9 == nil then
        v14._useImplicitConnections = true
    else
        v14._useImplicitConnections = p9
    end
    v14._complete = true
    v14._motors = {}
    for v15, v16 in pairs(p8) do
        v14._motors[v15] = v_u_7(v16)
    end
    return v14
end
function v_u_4.step(p17, p18)
    if p17._complete then
        return true
    end
    local v19 = true
    for _, v20 in pairs(p17._motors) do
        if not v20:step(p18) then
            v19 = false
        end
    end
    p17._onStep:fire(p17:getValue())
    if v19 then
        if p17._useImplicitConnections then
            p17:stop()
        end
        p17._complete = true
        p17._onComplete:fire()
    end
    return v19
end
function v_u_4.setGoal(p21, p22)
    local v23 = not p22.step
    assert(v23, "goals contains disallowed property \"step\". Did you mean to put a table of goals here?")
    p21._complete = false
    p21._onStart:fire()
    for v24, v25 in pairs(p22) do
        local v26 = p21._motors[v24]
        assert(v26, ("Unknown motor for key %s"):format(v24)):setGoal(v25)
    end
    if p21._useImplicitConnections then
        p21:start()
    end
end
function v_u_4.getValue(p27)
    local v28 = {}
    for v29, v30 in pairs(p27._motors) do
        v28[v29] = v30:getValue()
    end
    return v28
end
function v_u_4.__tostring(_)
    return "Motor(Group)"
end
return v_u_4