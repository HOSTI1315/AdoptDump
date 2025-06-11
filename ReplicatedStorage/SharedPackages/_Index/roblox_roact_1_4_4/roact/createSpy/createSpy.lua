--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.createSpy (ModuleScript)

local v_u_1 = require(script.Parent.assertDeepEqual)
return function(p_u_2)
    local v_u_13 = {
        ["callCount"] = 0,
        ["values"] = {},
        ["valuesLength"] = 0,
        ["value"] = function(...)
            v_u_13.callCount = v_u_13.callCount + 1
            v_u_13.values = { ... }
            v_u_13.valuesLength = select("#", ...)
            if p_u_2 == nil then
                return nil
            else
                return p_u_2(...)
            end
        end,
        ["assertCalledWith"] = function(_, ...)
            local v3 = select("#", ...)
            if v_u_13.valuesLength ~= v3 then
                error(("Expected %d arguments, but was called with %d arguments"):format(v_u_13.valuesLength, v3), 2)
            end
            for v4 = 1, v3 do
                local v5 = select(v4, ...) == v_u_13.values[v4]
                assert(v5, "value differs")
            end
        end,
        ["assertCalledWithDeepEqual"] = function(_, ...)
            local v6 = select("#", ...)
            if v_u_13.valuesLength ~= v6 then
                error(("Expected %d arguments, but was called with %d arguments"):format(v_u_13.valuesLength, v6), 2)
            end
            for v7 = 1, v6 do
                local v8 = select(v7, ...)
                v_u_1(v_u_13.values[v7], v8)
            end
        end,
        ["captureValues"] = function(_, ...)
            local v9 = select("#", ...)
            local v10 = v_u_13.valuesLength == v9
            assert(v10, "length of expected values differs from stored values")
            local v11 = {}
            for v12 = 1, v9 do
                v11[select(v12, ...)] = v_u_13.values[v12]
            end
            return v11
        end
    }
    setmetatable(v_u_13, {
        ["__index"] = function(_, p14)
            error(("%q is not a valid member of spy"):format(p14))
        end
    })
    return v_u_13
end