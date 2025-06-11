--// ReplicatedStorage.SharedPackages._Index.roblox_testez@0.4.1.testez.ExpectationContext (ModuleScript)

local v_u_1 = require(script.Parent.Expectation)
local v_u_2 = v_u_1.checkMatcherNameCollisions
local v_u_3 = {}
v_u_3.__index = v_u_3
function v_u_3.new(p4)
    local v5 = {}
    if p4 then
        local v6 = p4._extensions
        v10 = {}
        for v7, v8 in pairs(v6) do
            v10[v7] = v8
        end
        if v10 then
            ::l6::
            v5._extensions = v10
            local v9 = v_u_3
            return setmetatable(v5, v9)
        end
    end
    local v10 = {}
    goto l6
end
function v_u_3.startExpectationChain(p11, ...)
    return v_u_1.new(...):extend(p11._extensions)
end
function v_u_3.extend(p12, p13)
    for v14, v15 in pairs(p13) do
        local v16 = p12._extensions[v14] == nil
        local v17 = string.format
        assert(v16, v17("Cannot reassign %q in expect.extend", v14))
        local v18 = v_u_2(v14)
        local v19 = string.format
        assert(v18, v19("Cannot overwrite matcher %q; it already exists", v14))
        p12._extensions[v14] = v15
    end
end
return v_u_3