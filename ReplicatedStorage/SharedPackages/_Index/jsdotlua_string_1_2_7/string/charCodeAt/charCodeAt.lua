--// ReplicatedStorage.SharedPackages._Index.jsdotlua_string@1.2.7.string.charCodeAt (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("number")).NaN
return function(p2, p3)
    local v4 = type(p3) ~= "number" and 1 or p3
    local v5 = string.len(p2)
    if v4 < 1 or v5 < v4 then
        return v_u_1
    else
        local v6 = utf8.offset(p2, v4)
        if v6 == nil or v5 < v6 then
            return v_u_1
        else
            local v7 = utf8.codepoint(p2, v6, v6)
            if v7 == nil then
                return v_u_1
            else
                return v7
            end
        end
    end
end