--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Array.flat (ModuleScript)

local v_u_1 = _G.__DEV__
local v_u_2 = require(script.Parent:WaitForChild("isArray"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local function v_u_10(p3, p4)
    if v_u_1 then
        if typeof(p3) ~= "table" then
            error(string.format("Array.flat called on %s", (typeof(p3))))
        end
        if p4 ~= nil and typeof(p4) ~= "number" then
            error("depth is not a number or nil")
        end
    end
    local v5 = p4 or 1
    local v6 = {}
    for _, v8 in p3 do
        if v_u_2(v8) then
            if v5 > 1 then
                local v8 = v_u_10(v8, v5 - 1)
            end
            for _, v9 in v8 do
                table.insert(v6, v9)
            end
        else
            table.insert(v6, v8)
        end
    end
    return v6
end
return v_u_10