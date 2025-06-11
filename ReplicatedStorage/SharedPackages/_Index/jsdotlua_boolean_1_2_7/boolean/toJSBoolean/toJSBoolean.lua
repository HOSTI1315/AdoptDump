--// ReplicatedStorage.SharedPackages._Index.jsdotlua_boolean@1.2.7.boolean.toJSBoolean (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("number"))
return function(p2)
    local v3 = p2 and true or false
    if v3 then
        if p2 == 0 or p2 == "" then
            v3 = false
        else
            v3 = not v_u_1.isNaN(p2)
        end
    end
    return v3
end