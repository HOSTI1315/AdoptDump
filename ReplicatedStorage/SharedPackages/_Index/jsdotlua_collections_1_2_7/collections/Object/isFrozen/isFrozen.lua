--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Object.isFrozen (ModuleScript)

local v_u_1 = _G.__DEV__
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p2)
    if v_u_1 then
        print("Luau now has a direct table.isfrozen call that can save the overhead of this library function call")
    end
    return table.isfrozen(p2)
end