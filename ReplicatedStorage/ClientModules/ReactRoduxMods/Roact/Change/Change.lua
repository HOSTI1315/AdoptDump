--// ReplicatedStorage.ClientModules.ReactRoduxMods.Roact.Change (ModuleScript)

local v_u_1 = {}
local v_u_3 = {
    ["__tostring"] = function(p2)
        return ("ChangeListener(%s)"):format(p2.name)
    end
}
setmetatable(v_u_1, {
    ["__index"] = function(_, p4)
        local v5 = {
            ["type"] = v_u_1,
            ["name"] = p4
        }
        local v6 = v_u_3
        setmetatable(v5, v6)
        v_u_1[p4] = v5
        return v5
    end
})
return v_u_1