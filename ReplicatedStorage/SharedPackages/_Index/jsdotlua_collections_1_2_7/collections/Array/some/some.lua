--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.some (ModuleScript)

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
return function(p1, p2, p3)
    if typeof(p1) ~= "table" then
        error(string.format("Array.some called on %s", (typeof(p1))))
    end
    if typeof(p2) ~= "function" then
        error("callback is not a function")
    end
    for v4, v5 in p1 do
        if p3 == nil then
            if v5 ~= nil and p2(v5, v4, p1) then
                return true
            end
        elseif v5 ~= nil and p2(p3, v5, v4, p1) then
            return true
        end
    end
    return false
end