--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.SingleEventManager (ModuleScript)

local v_u_1 = require(script.Parent.Logging)
local v_u_2 = {
    ["Disabled"] = "Disabled",
    ["Suspended"] = "Suspended",
    ["Enabled"] = "Enabled"
}
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4)
    local v5 = {
        ["_suspendedEventQueue"] = {},
        ["_connections"] = {},
        ["_listeners"] = {},
        ["_status"] = v_u_2.Disabled,
        ["_isResuming"] = false,
        ["_instance"] = p4
    }
    local v6 = v_u_3
    return setmetatable(v5, v6)
end
function v_u_3.connectEvent(p7, p8, p9)
    p7:_connect(p8, p7._instance[p8], p9)
end
function v_u_3.connectPropertyChange(p_u_10, p_u_11, p12)
    local v13, v14 = pcall(function()
        return p_u_10._instance:GetPropertyChangedSignal(p_u_11)
    end)
    if not v13 then
        error(("Cannot get changed signal on property %q: %s"):format(tostring(p_u_11), v14), 0)
    end
    p_u_10:_connect("Change." .. p_u_11, v14, p12)
end
function v_u_3._connect(p_u_15, p_u_16, p17, p18)
    if p18 == nil then
        if p_u_15._connections[p_u_16] ~= nil then
            p_u_15._connections[p_u_16]:Disconnect()
            p_u_15._connections[p_u_16] = nil
        end
        p_u_15._listeners[p_u_16] = nil
    else
        if p_u_15._connections[p_u_16] == nil then
            p_u_15._connections[p_u_16] = p17:Connect(function(...)
                if p_u_15._status == v_u_2.Enabled then
                    p_u_15._listeners[p_u_16](p_u_15._instance, ...)
                elseif p_u_15._status == v_u_2.Suspended then
                    local v19 = select("#", ...)
                    local v20 = p_u_15._suspendedEventQueue
                    local v21 = { p_u_16, v19, ... }
                    table.insert(v20, v21)
                end
            end)
        end
        p_u_15._listeners[p_u_16] = p18
    end
end
function v_u_3.suspend(p22)
    p22._status = v_u_2.Suspended
end
function v_u_3.resume(p23)
    if not p23._isResuming then
        p23._isResuming = true
        local v24 = 1
        while v24 <= #p23._suspendedEventQueue do
            local v25 = p23._suspendedEventQueue[v24]
            local v26 = p23._listeners[v25[1]]
            local v27 = v25[2]
            if v26 ~= nil then
                local v28 = coroutine.create(v26)
                local v29 = coroutine.resume
                local v30 = p23._instance
                local v31 = 2 + v27
                local v32, v33 = v29(v28, v30, unpack(v25, 3, v31))
                if not v32 then
                    v_u_1.warn("%s", v33)
                end
            end
            v24 = v24 + 1
        end
        p23._isResuming = false
        p23._status = v_u_2.Enabled
        p23._suspendedEventQueue = {}
    end
end
return v_u_3