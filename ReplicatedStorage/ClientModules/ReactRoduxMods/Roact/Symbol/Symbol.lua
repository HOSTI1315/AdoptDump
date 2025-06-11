--// ReplicatedStorage.ClientModules.ReactRoduxMods.Roact.Symbol (ModuleScript)

return {
    ["named"] = function(p1)
        local v2 = type(p1) == "string"
        assert(v2, "Symbols must be created using a string name!")
        local v3 = newproxy(true)
        local v_u_4 = ("Symbol(%s)"):format(p1)
        getmetatable(v3).__tostring = function()
            return v_u_4
        end
        return v3
    end,
    ["unnamed"] = function()
        local v5 = newproxy(true)
        getmetatable(v5).__tostring = function()
            return "Unnamed Symbol"
        end
        return v5
    end
}