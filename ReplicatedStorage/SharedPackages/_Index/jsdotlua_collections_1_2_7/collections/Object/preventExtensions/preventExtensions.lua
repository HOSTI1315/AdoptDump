--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Object.preventExtensions (ModuleScript)

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1)
    local v_u_2 = tostring(p1)
    return setmetatable(p1, {
        ["__newindex"] = function(_, p3, _)
            local v4 = ("%q (%s) is not a valid member of %s"):format(tostring(p3), typeof(p3), v_u_2)
            error(v4, 2)
        end,
        ["__metatable"] = false
    })
end