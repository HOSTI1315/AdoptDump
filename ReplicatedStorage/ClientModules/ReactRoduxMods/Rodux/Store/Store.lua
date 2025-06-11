--// ReplicatedStorage.ClientModules.ReactRoduxMods.Rodux.Store (ModuleScript)

local v1 = game:GetService("RunService")
local v_u_2 = require(script.Parent.Signal)
local v_u_3 = require(script.Parent.NoYield)
local v_u_4 = {
    ["_flushEvent"] = v1.Heartbeat
}
v_u_4.__index = v_u_4
function v_u_4.new(p5, p6, p7)
    local v8 = typeof(p5) == "function"
    assert(v8, "Bad argument #1 to Store.new, expected function.")
    local v9 = p7 == nil and true or typeof(p7) == "table"
    assert(v9, "Bad argument #3 to Store.new, expected nil or table.")
    local v_u_10 = {
        ["_reducer"] = p5,
        ["_state"] = p5(p6, {
            ["type"] = "@@INIT"
        })
    }
    v_u_10._lastState = v_u_10._state
    v_u_10._mutatedSinceFlush = false
    v_u_10._connections = {}
    v_u_10.changed = v_u_2.new()
    local v11 = v_u_4
    setmetatable(v_u_10, v11)
    local v12 = v_u_10._flushEvent:Connect(function()
        v_u_10:flush()
    end)
    local v13 = v_u_10._connections
    table.insert(v13, v12)
    if p7 then
        local v_u_14 = v_u_10.dispatch
        local function v_u_15(...)
            return v_u_14(v_u_10, ...)
        end
        for v16 = #p7, 1, -1 do
            v_u_15 = p7[v16](v_u_15, v_u_10)
        end
        function v_u_10.dispatch(_, ...)
            return v_u_15(...)
        end
    end
    return v_u_10
end
function v_u_4.getState(p17)
    return p17._state
end
function v_u_4.dispatch(p18, p19)
    if typeof(p19) == "table" then
        if p19.type == nil then
            error("action does not have a type field", 2)
        end
        p18._state = p18._reducer(p18._state, p19)
        p18._mutatedSinceFlush = true
    else
        error(("actions of type %q are not permitted"):format((typeof(p19))), 2)
    end
end
function v_u_4.destruct(p20)
    for _, v21 in ipairs(p20._connections) do
        v21:Disconnect()
    end
    p20._connections = nil
end
function v_u_4.flush(p_u_22)
    if p_u_22._mutatedSinceFlush then
        p_u_22._mutatedSinceFlush = false
        local v_u_23 = p_u_22._state
        v_u_3(function()
            p_u_22.changed:fire(v_u_23, p_u_22._lastState)
        end)
        p_u_22._lastState = v_u_23
    end
end
return v_u_4