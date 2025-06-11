--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Config (ModuleScript)

local v_u_1 = {
    ["internalTypeChecks"] = false,
    ["typeChecks"] = false,
    ["elementTracing"] = false,
    ["propValidation"] = false
}
local v_u_2 = {}
for v3 in pairs(v_u_1) do
    table.insert(v_u_2, v3)
end
local v_u_23 = {
    ["new"] = function()
        local v_u_4 = {}
        local v7 = {
            ["__index"] = function(_, p5)
                local v6 = ("Invalid global configuration key %q. Valid configuration keys are: %s"):format(tostring(p5), table.concat(v_u_2, ", "))
                error(v6, 3)
            end
        }
        v_u_4._currentConfig = setmetatable({}, v7)
        function v_u_4.set(...)
            return v_u_23.set(v_u_4, ...)
        end
        function v_u_4.get(...)
            return v_u_23.get(v_u_4, ...)
        end
        function v_u_4.scoped(...)
            return v_u_23.scoped(v_u_4, ...)
        end
        v_u_4.set(v_u_1)
        return v_u_4
    end,
    ["set"] = function(p8, p9)
        for v10, v11 in pairs(p9) do
            if v_u_1[v10] == nil then
                local v12 = ("Invalid global configuration key %q (type %s). Valid configuration keys are: %s"):format(tostring(v10), typeof(v10), table.concat(v_u_2, ", "))
                error(v12, 3)
            end
            if typeof(v11) ~= "boolean" then
                local v13 = ("Invalid value %q (type %s) for global configuration key %q. Valid values are: true, false"):format(tostring(v11), typeof(v11), (tostring(v10)))
                error(v13, 3)
            end
            p8._currentConfig[v10] = v11
        end
    end,
    ["get"] = function(p14)
        return p14._currentConfig
    end,
    ["scoped"] = function(p15, p16, p17)
        local v18 = {}
        for v19, v20 in pairs(p15._currentConfig) do
            v18[v19] = v20
        end
        p15.set(p16)
        local v21, v22 = pcall(p17)
        p15.set(v18)
        assert(v21, v22)
    end
}
return v_u_23