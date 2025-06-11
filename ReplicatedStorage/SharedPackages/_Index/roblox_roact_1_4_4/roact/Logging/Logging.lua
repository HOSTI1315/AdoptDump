--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Logging (ModuleScript)

local v_u_1 = true
local v_u_2 = {}
local v_u_3 = {}
local function v_u_10(p4, p5)
    local v6 = {}
    for _, v7 in ipairs(p4) do
        local v8 = ("\t"):rep(p5)
        local v9 = v8 .. v7:gsub("\n", "\n" .. v8)
        table.insert(v6, v9)
    end
    return table.concat(v6, "\n")
end
local v_u_22 = {
    ["__tostring"] = function(p11)
        local v12 = { "LogInfo {" }
        local v13 = #p11.errors
        local v14 = #p11.warnings
        local v15 = #p11.infos
        if v13 + v14 + v15 == 0 then
            table.insert(v12, "\t(no messages)")
        end
        if v13 > 0 then
            table.insert(v12, ("\tErrors (%d) {"):format(v13))
            local v16 = v_u_10
            local v17 = p11.errors
            table.insert(v12, v16(v17, 2))
            table.insert(v12, "\t}")
        end
        if v14 > 0 then
            table.insert(v12, ("\tWarnings (%d) {"):format(v14))
            local v18 = v_u_10
            local v19 = p11.warnings
            table.insert(v12, v18(v19, 2))
            table.insert(v12, "\t}")
        end
        if v15 > 0 then
            table.insert(v12, ("\tInfos (%d) {"):format(v15))
            local v20 = v_u_10
            local v21 = p11.infos
            table.insert(v12, v20(v21, 2))
            table.insert(v12, "\t}")
        end
        table.insert(v12, "}")
        return table.concat(v12, "\n")
    end
}
local function v_u_25()
    local v23 = {
        ["errors"] = {},
        ["warnings"] = {},
        ["infos"] = {}
    }
    local v24 = v_u_22
    setmetatable(v23, v24)
    return v23
end
local v_u_40 = {
    ["capture"] = function(p26)
        local v27 = v_u_25()
        local v28 = v_u_1
        v_u_1 = false
        v_u_2[v27] = true
        local v29, v30 = pcall(p26)
        v_u_2[v27] = nil
        v_u_1 = v28
        assert(v29, v30)
        return v27
    end,
    ["warn"] = function(p31, ...)
        local v32 = p31:format(...)
        for v33 in pairs(v_u_2) do
            local v34 = v33.warnings
            table.insert(v34, v32)
        end
        local v35 = debug.traceback("", 2):sub(2)
        local v36 = ("\t"):rep(1)
        local v37 = ("%s\n%s"):format(v32, v36 .. v35:gsub("\n", "\n" .. v36))
        if v_u_1 then
            warn(v37)
        end
    end,
    ["warnOnce"] = function(p38, ...)
        local v39 = debug.traceback()
        if not v_u_3[v39] then
            v_u_3[v39] = true
            v_u_40.warn(p38, ...)
        end
    end
}
return v_u_40