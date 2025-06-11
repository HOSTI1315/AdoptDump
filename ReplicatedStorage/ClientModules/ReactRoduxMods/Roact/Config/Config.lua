--// ReplicatedStorage.ClientModules.ReactRoduxMods.Roact.Config (ModuleScript)

local v_u_1 = {
    ["elementTracing"] = false,
    ["componentInstrumentation"] = false
}
local v_u_2 = {}
for v3 in pairs(v_u_1) do
    table.insert(v_u_2, v3)
end
local function v_u_11(p4, p5)
    local v6 = {}
    for v7, v8 in pairs(p4) do
        v6[v7] = v8
    end
    for v9, v10 in pairs(p5) do
        v6[v9] = v10
    end
    return v6
end
local v_u_24 = {
    ["new"] = function()
        local v_u_12 = {
            ["_lastConfigTraceback"] = nil,
            ["_currentConfig"] = v_u_1,
            ["set"] = function(...)
                return v_u_24.set(v_u_12, ...)
            end,
            ["getValue"] = function(...)
                return v_u_24.getValue(v_u_12, ...)
            end,
            ["reset"] = function(...)
                return v_u_24.reset(v_u_12, ...)
            end
        }
        return v_u_12
    end,
    ["set"] = function(p13, p14)
        if p13._lastConfigTraceback then
            local v15 = ("Global configuration can only be set once. Configuration was already set at:%s"):format(p13._lastConfigTraceback)
            error(v15, 3)
        end
        p13._lastConfigTraceback = debug.traceback("", 3)
        for v16, v17 in pairs(p14) do
            if v_u_1[v16] == nil then
                local v18 = ("Invalid global configuration key %q (type %s). Valid configuration keys are: %s"):format(tostring(v16), typeof(v16), table.concat(v_u_2, ", "))
                error(v18, 3)
            end
            if typeof(v17) ~= "boolean" then
                local v19 = ("Invalid value %q (type %s) for global configuration key %q. Valid values are: true, false"):format(tostring(v17), typeof(v17), (tostring(v16)))
                error(v19, 3)
            end
        end
        p13._currentConfig = v_u_11(p13._currentConfig, p14)
    end,
    ["getValue"] = function(p20, p21)
        if v_u_1[p21] == nil then
            local v22 = ("Invalid global configuration key %q (type %s). Valid configuration keys are: %s"):format(tostring(p21), typeof(p21), table.concat(v_u_2, ", "))
            error(v22, 3)
        end
        return p20._currentConfig[p21]
    end,
    ["reset"] = function(p23)
        p23._lastConfigTraceback = nil
        p23._currentConfig = v_u_1
    end
}
return v_u_24