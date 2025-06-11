--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.Symbol.roblox (ModuleScript)

return {
    ["named"] = function(p1)
        local v2 = type(p1) == "string"
        assert(v2, "Symbols must be created using a string name!")
        local v3 = newproxy(true)
        local v_u_4 = string.format("Symbol(%s)", p1)
        getmetatable(v3).__tostring = function()
            return v_u_4
        end
        return v3
    end
}