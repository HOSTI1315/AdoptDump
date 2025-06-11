--// ReplicatedStorage.ClientModules.ReactRoduxMods.Roact.SingleEventManager (ModuleScript)

local v_u_1 = {}
v_u_1.__index = v_u_1
local function v_u_5(p_u_2, p3, p_u_4)
    return {
        ["method"] = p_u_4,
        ["connection"] = p_u_2:GetPropertyChangedSignal(p3):Connect(function(...)
            p_u_4(p_u_2, ...)
        end)
    }
end
local function v_u_7(p6)
    return ("!PropertyChangeEvent:%s"):format(p6)
end
function v_u_1.new()
    local v8 = {
        ["_hookCache"] = {}
    }
    local v9 = v_u_1
    setmetatable(v8, v9)
    return v8
end
function v_u_1.connect(p10, p_u_11, p12, p_u_13)
    local v14 = p10._hookCache[p_u_11]
    if v14 then
        local v15 = v14[p12]
        if v15 then
            if v15.method == p_u_13 then
                return
            end
            v15.connection:Disconnect()
        end
        v14[p12] = {
            ["method"] = p_u_13,
            ["connection"] = p_u_11[p12]:Connect(function(...)
                p_u_13(p_u_11, ...)
            end)
        }
    else
        local v16 = {
            [p12] = {
                ["method"] = p_u_13,
                ["connection"] = p_u_11[p12]:Connect(function(...)
                    p_u_13(p_u_11, ...)
                end)
            }
        }
        p10._hookCache[p_u_11] = v16
    end
end
function v_u_1.connectProperty(p17, p18, p19, p20)
    local v21 = p17._hookCache[p18]
    local v22 = ("!PropertyChangeEvent:%s"):format(p19)
    if v21 then
        local v23 = v21[v22]
        if v23 then
            if v23.method == p20 then
                return
            end
            v23.connection:Disconnect()
        end
        v21[v22] = v_u_5(p18, p19, p20)
    else
        local v24 = {
            [v22] = v_u_5(p18, p19, p20)
        }
        p17._hookCache[p18] = v24
    end
end
function v_u_1.disconnect(p25, p26, p27)
    local v28 = p25._hookCache[p26]
    if v28 then
        local v29 = v28[p27]
        if v29 then
            v29.connection:Disconnect()
            v28[p27] = nil
            if next(v28) == nil then
                p25._hookCache[p26] = nil
            end
        end
    else
        return
    end
end
function v_u_1.disconnectProperty(p30, p31, p32)
    p30:disconnect(p31, v_u_7(p32))
end
function v_u_1.disconnectAll(p33, p34)
    local v35 = p33._hookCache[p34]
    if v35 then
        for _, v36 in pairs(v35) do
            v36.connection:Disconnect()
        end
        p33._hookCache[p34] = nil
    end
end
return v_u_1