--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.invariant (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Error
return function(p2, p3, ...)
    if not p2 then
        error(v_u_1(string.format(p3, ...)))
    end
end