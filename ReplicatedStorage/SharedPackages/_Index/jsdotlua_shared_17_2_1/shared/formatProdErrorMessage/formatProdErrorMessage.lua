--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.formatProdErrorMessage (ModuleScript)

local v_u_1 = game:GetService("HttpService")
return function(p2, ...)
    local v3 = "https://reactjs.org/docs/error-decoder.html?invariant=" .. tostring(p2)
    for v4 = 1, select("#", ...) do
        v3 = v3 .. "&args[]=" .. v_u_1:UrlEncode(select(v4, ...))
    end
    return string.format("Minified React error #%d; visit %s for the full message or use the non-minified dev environment for full errors and additional helpful warnings.", p2, v3)
end