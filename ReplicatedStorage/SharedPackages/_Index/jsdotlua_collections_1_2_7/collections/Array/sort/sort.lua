--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.sort (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("Object"):WaitForChild("None"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local function v_u_4(p2, p3)
    return type(p2) .. tostring(p2) < type(p3) .. tostring(p3)
end
return function(p5, p_u_6)
    local v7 = v_u_4
    if p_u_6 ~= nil and p_u_6 ~= v_u_1 then
        if typeof(p_u_6) == "function" then
            v7 = function(p11, p12)
                local v13 = p_u_6(p11, p12)
                if typeof(v13) ~= "number" then
                    error(("invalid result from compare function, expected number but got %s"):format((typeof(v13))))
                end
                return v13 < 0
            end
        else
            error("invalid argument to Array.sort: compareFunction must be a function")
            v7 = function(p11, p12)
                local v13 = p_u_6(p11, p12)
                if typeof(v13) ~= "number" then
                    error(("invalid result from compare function, expected number but got %s"):format((typeof(v13))))
                end
                return v13 < 0
            end
        end
    end
    table.sort(p5, v7)
    return p5
end