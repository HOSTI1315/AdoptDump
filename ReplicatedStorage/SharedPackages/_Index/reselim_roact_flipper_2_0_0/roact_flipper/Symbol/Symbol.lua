--// ReplicatedStorage.SharedPackages._Index.reselim_roact-flipper@2.0.0.roact-flipper.Symbol (ModuleScript)

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
    end
}