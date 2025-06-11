--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.WeakMap (ModuleScript)

require(script.Parent.Parent:WaitForChild("es7-types"))
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new()
    local v2 = {
        ["_weakMap"] = setmetatable({}, {
            ["__mode"] = "k"
        })
    }
    local v3 = v_u_1
    return setmetatable(v2, v3)
end
function v_u_1.get(p4, p5)
    return p4._weakMap[p5]
end
function v_u_1.set(p6, p7, p8)
    p6._weakMap[p7] = p8
    return p6
end
function v_u_1.has(p9, p10)
    return p9._weakMap[p10] ~= nil
end
return v_u_1