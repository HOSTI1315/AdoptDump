--// ReplicatedStorage.SharedPackages._Index.roblox_testez@0.4.1.testez.LifecycleHooks (ModuleScript)

local v_u_1 = require(script.Parent.TestEnum)
local v_u_2 = {}
v_u_2.__index = v_u_2
function v_u_2.new()
    local v3 = v_u_2
    return setmetatable({
        ["_stack"] = {}
    }, v3)
end
function v_u_2.getBeforeEachHooks(p4)
    local v5 = v_u_1.NodeType.BeforeEach
    local v6 = {}
    for _, v7 in ipairs(p4._stack) do
        for _, v8 in ipairs(v7[v5]) do
            table.insert(v6, v8)
        end
    end
    return v6
end
function v_u_2.getAfterEachHooks(p9)
    local v10 = v_u_1.NodeType.AfterEach
    local v11 = {}
    for _, v12 in ipairs(p9._stack) do
        for _, v13 in ipairs(v12[v10]) do
            table.insert(v11, 1, v13)
        end
    end
    return v11
end
function v_u_2.popHooks(p14)
    table.remove(p14._stack, #p14._stack)
end
function v_u_2.pushHooksFrom(p15, p16)
    local v17 = p16 ~= nil
    assert(v17)
    local v18 = p15._stack
    local v19 = {
        [v_u_1.NodeType.BeforeAll] = p15:_getHooksOfType(p16.children, v_u_1.NodeType.BeforeAll),
        [v_u_1.NodeType.AfterAll] = p15:_getHooksOfType(p16.children, v_u_1.NodeType.AfterAll),
        [v_u_1.NodeType.BeforeEach] = p15:_getHooksOfType(p16.children, v_u_1.NodeType.BeforeEach),
        [v_u_1.NodeType.AfterEach] = p15:_getHooksOfType(p16.children, v_u_1.NodeType.AfterEach)
    }
    table.insert(v18, v19)
end
function v_u_2.getBeforeAllHooks(p20)
    return p20._stack[#p20._stack][v_u_1.NodeType.BeforeAll]
end
function v_u_2.getAfterAllHooks(p21)
    return p21._stack[#p21._stack][v_u_1.NodeType.AfterAll]
end
function v_u_2._getHooksOfType(_, p22, p23)
    local v24 = {}
    for _, v25 in ipairs(p22) do
        if v25.type == p23 then
            local v26 = v25.callback
            table.insert(v24, v26)
        end
    end
    return v24
end
return v_u_2