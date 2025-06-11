--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.roblox.SingleEventManager (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Parent.Parent:WaitForChild("shared")).console
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
function v_u_3.connectPropertyChange(p10, p11, p12)
    local v13, v14 = pcall(p10._instance.GetPropertyChangedSignal, p10._instance, p11)
    if not v13 then
        error(string.format("Cannot get changed signal on property %q: %s", tostring(p11), v14), 0)
    end
    p10:_connect("Change." .. p11, v14, p12)
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
        for _, v24 in p23._suspendedEventQueue do
            local v25 = p23._listeners[v24[1]]
            local v26 = v24[2]
            if v25 ~= nil then
                local v27 = coroutine.create(v25)
                local v28 = coroutine.resume
                local v29 = p23._instance
                local v30 = 2 + v26
                local v31, v32 = v28(v27, v29, unpack(v24, 3, v30))
                if not v31 then
                    v_u_1.warn("%s", v32)
                end
            end
        end
        p23._isResuming = false
        p23._status = v_u_2.Enabled
        table.clear(p23._suspendedEventQueue)
    end
end
return v_u_3