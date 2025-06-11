--// ReplicatedStorage.new.modules.Performance.ToggleableSignal (ModuleScript)

local v_u_1 = require(script.Parent.Parent.LegacyLoad)("Signal")
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new(p3, p4)
    local v5 = {
        ["enabled"] = false,
        ["event"] = v_u_1.new(),
        ["_internal"] = p3
    }
    local v6 = v_u_2
    local v7 = setmetatable(v5, v6)
    if p4 ~= nil then
        v7:set_enabled(p4)
    end
    return v7
end
function v_u_2.newConnect(p8, p9, p10)
    local v_u_11 = v_u_2.new(p8, p10)
    local v12 = v_u_11:Connect(p9)
    local v_u_14 = {
        ["_connections"] = { v12 },
        ["disconnect"] = function()
            v_u_11:Destroy()
            for _, v13 in v_u_14._connections do
                v13:Disconnect()
            end
        end
    }
    v_u_14.Disconnect = v_u_14.disconnect
    function v_u_14.set_enabled(p15)
        v_u_11:set_enabled(p15)
    end
    v_u_14.setEnabled = v_u_14.set_enabled
    v_u_14.SetEnabled = v_u_14.set_enabled
    function v_u_14.with_property(p16, p_u_17, p_u_18, p19)
        local v_u_21 = p19 or function(p20)
            return p20 and true or false
        end
        v_u_11:set_enabled(v_u_21(p_u_17[p_u_18]))
        local v22 = v_u_14._connections
        local v23 = p_u_17:GetPropertyChangedSignal(p_u_18)
        local function v24()
            v_u_11:set_enabled(v_u_21(p_u_17[p_u_18]))
        end
        table.insert(v22, v23:Connect(v24))
        return p16
    end
    v_u_14.withProperty = v_u_14.with_property
    v_u_14.WithProperty = v_u_14.with_property
    setmetatable(v_u_14, {
        ["__index"] = v12
    })
    return v_u_14
end
function v_u_2.connect(p25, p26)
    if p25.destroyed then
        error("Attempted to connect to destroyed ToggleableSignal")
    end
    return p25.event:Connect(p26)
end
v_u_2.Connect = v_u_2.connect
function v_u_2.wait(p27)
    if p27.destroyed then
        error("Attempted to connect to destroyed ToggleableSignal")
    end
    return p27.event:Wait()
end
v_u_2.Wait = v_u_2.wait
function v_u_2.once(p28, p_u_29)
    if p28.destroyed then
        error("Attempted to connect to destroyed ToggleableSignal")
    end
    local v_u_30 = nil
    v_u_30 = p28.event:Connect(function(...)
        v_u_30:Disconnect()
        p_u_29(...)
    end)
    return v_u_30
end
v_u_2.Once = v_u_2.once
function v_u_2.destroy(p31)
    p31.event:Destroy()
    if p31._internal_conn then
        p31._internal_conn:Disconnect()
    end
    p31.destroyed = true
end
v_u_2.Destroy = v_u_2.destroy
function v_u_2.set_enabled(p_u_32, p33)
    if p_u_32.enabled == p33 then
        return
    else
        p_u_32.enabled = p33
        if p33 then
            p_u_32._internal_conn = p_u_32._internal:Connect(function(...)
                p_u_32.event:Fire(...)
            end)
        else
            if p_u_32._internal_conn then
                p_u_32._internal_conn:Disconnect()
            end
            p_u_32._internal_conn = nil
        end
    end
end
v_u_2.setEnabled = v_u_2.set_enabled
v_u_2.SetEnabled = v_u_2.set_enabled
return v_u_2