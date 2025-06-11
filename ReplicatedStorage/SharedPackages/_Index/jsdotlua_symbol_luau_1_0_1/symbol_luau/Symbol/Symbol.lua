--// ReplicatedStorage.SharedPackages._Index.jsdotlua_symbol-luau@1.0.1.symbol-luau.Symbol (ModuleScript)

return {
    ["new"] = function(p1)
        local v2 = newproxy(true)
        local v_u_3 = not p1 and "Symbol()" or ("Symbol(%s)"):format(p1)
        getmetatable(v2).__tostring = function()
            return v_u_3
        end
        return v2
    end
}