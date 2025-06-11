--// ReplicatedStorage.SharedPackages._Index.roblox_testez@0.4.1.testez.Context (ModuleScript)

return {
    ["new"] = function(p1)
        local v2 = {}
        local v_u_3 = {}
        v2.__index = v_u_3
        if p1 then
            for v4, v5 in pairs(getmetatable(p1).__index) do
                v_u_3[v4] = v5
            end
        end
        function v2.__newindex(_, p6, p7)
            local v8 = v_u_3[p6] == nil
            local v9 = string.format
            local v10 = tostring(p6)
            assert(v8, v9("Cannot reassign %s in context", v10))
            v_u_3[p6] = p7
        end
        return setmetatable({}, v2)
    end
}