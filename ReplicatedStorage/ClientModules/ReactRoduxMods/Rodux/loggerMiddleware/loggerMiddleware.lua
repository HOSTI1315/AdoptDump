--// ReplicatedStorage.ClientModules.ReactRoduxMods.Rodux.loggerMiddleware (ModuleScript)

local function v_u_14(p1, p2)
    local v3 = p2 or 0
    local v4 = {}
    if typeof(p1) == "table" then
        table.insert(v4, "{\n")
        for v5, v6 in pairs(p1) do
            local v7 = v3 + 1
            table.insert(v4, ("    "):rep(v7))
            local v8 = tostring(v5)
            table.insert(v4, v8)
            table.insert(v4, " = ")
            local v9 = v_u_14
            local v10 = v3 + 1
            table.insert(v4, v9(v6, v10))
            table.insert(v4, "\n")
        end
        table.insert(v4, ("    "):rep(v3))
        table.insert(v4, "}")
    elseif typeof(p1) == "string" then
        local v11 = string.format
        table.insert(v4, v11("%q", p1))
        table.insert(v4, " (string)")
    else
        local v12 = tostring(p1)
        table.insert(v4, v12)
        table.insert(v4, " (")
        local v13 = typeof(p1)
        table.insert(v4, v13)
        table.insert(v4, ")")
    end
    return table.concat(v4, "")
end
local v_u_19 = {
    ["outputFunction"] = print,
    ["middleware"] = function(p_u_15, p_u_16)
        return function(p17)
            local v18 = p_u_15(p17)
            v_u_19.outputFunction(("Action dispatched: %s\nState changed to: %s"):format(v_u_14(p17), v_u_14(p_u_16:getState())))
            return v18
        end
    end
}
return v_u_19