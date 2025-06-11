--// ReplicatedStorage.SharedModules.HardenConstants (ModuleScript)

local v_u_4 = {
    ["__index"] = function(_, p1)
        if p1 == "init" then
            return
        elseif p1 == nil then
            error("Attempt to index a constants table with nil value")
        else
            error(string.format("\'%s\' is not a valid member of this constants table", (tostring(p1))))
        end
    end,
    ["__newindex"] = function(_, p2, p3)
        error(string.format("Not allowed to set values in a constants table (tried to set %s = %s)", tostring(p2), (tostring(p3))))
    end
}
local v_u_13 = {
    ["harden_map"] = function(p5)
        local v6 = {}
        for v7, v8 in pairs(p5) do
            v6[v7] = v8
        end
        local v9 = v_u_4
        setmetatable(v6, v9)
        return v6
    end,
    ["harden_key_to_key_map"] = function(p10)
        local v11 = {}
        for _, v12 in ipairs(p10) do
            v11[v12] = v12
        end
        return v_u_13.harden_map(v11)
    end
}
return v_u_13