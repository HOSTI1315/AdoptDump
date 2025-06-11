--// ReplicatedStorage.ClientModules.ReactRoduxMods.Rodux.Signal (ModuleScript)

local function v_u_6(p1, ...)
    local v2 = #p1
    local v3 = {}
    for v4 = 1, v2 do
        v3[v4] = p1[v4]
    end
    for v5 = 1, select("#", ...) do
        v3[v2 + v5] = select(v5, ...)
    end
    return v3
end
local function v_u_12(p7, p8)
    local v9 = {}
    for v10 = 1, #p7 do
        if p7[v10] ~= p8 then
            local v11 = p7[v10]
            table.insert(v9, v11)
        end
    end
    return v9
end
local v_u_13 = {}
v_u_13.__index = v_u_13
function v_u_13.new()
    local v14 = {
        ["_listeners"] = {}
    }
    local v15 = v_u_13
    setmetatable(v14, v15)
    return v14
end
function v_u_13.connect(p_u_16, p17)
    local v_u_18 = {
        ["callback"] = p17,
        ["disconnected"] = false
    }
    p_u_16._listeners = v_u_6(p_u_16._listeners, v_u_18)
    return {
        ["disconnect"] = function()
            v_u_18.disconnected = true
            p_u_16._listeners = v_u_12(p_u_16._listeners, v_u_18)
        end
    }
end
function v_u_13.fire(p19, ...)
    for _, v20 in ipairs(p19._listeners) do
        if not v20.disconnected then
            v20.callback(...)
        end
    end
end
return v_u_13