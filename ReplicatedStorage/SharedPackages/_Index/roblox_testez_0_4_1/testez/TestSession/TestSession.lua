--// ReplicatedStorage.SharedPackages._Index.roblox_testez@0.4.1.testez.TestSession (ModuleScript)

local v_u_1 = require(script.Parent.TestEnum)
local v_u_2 = require(script.Parent.TestResults)
local v_u_3 = require(script.Parent.Context)
local v_u_4 = require(script.Parent.ExpectationContext)
local v_u_5 = {}
v_u_5.__index = v_u_5
function v_u_5.new(p6)
    local v7 = {
        ["results"] = v_u_2.new(p6),
        ["nodeStack"] = {},
        ["contextStack"] = {},
        ["expectationContextStack"] = {},
        ["hasFocusNodes"] = false
    }
    local v8 = v_u_5
    setmetatable(v7, v8)
    return v7
end
function v_u_5.calculateTotals(p9)
    local v_u_10 = p9.results
    v_u_10.successCount = 0
    v_u_10.failureCount = 0
    v_u_10.skippedCount = 0
    v_u_10:visitAllNodes(function(p11)
        local v12 = p11.status
        if p11.planNode.type == v_u_1.NodeType.It then
            if v12 == v_u_1.TestStatus.Success then
                v_u_10.successCount = v_u_10.successCount + 1
                return
            end
            if v12 == v_u_1.TestStatus.Failure then
                v_u_10.failureCount = v_u_10.failureCount + 1
                return
            end
            if v12 == v_u_1.TestStatus.Skipped then
                v_u_10.skippedCount = v_u_10.skippedCount + 1
            end
        end
    end)
end
function v_u_5.gatherErrors(p13)
    local v_u_14 = p13.results
    v_u_14.errors = {}
    v_u_14:visitAllNodes(function(p15)
        if #p15.errors > 0 then
            for _, v16 in ipairs(p15.errors) do
                local v17 = v_u_14.errors
                table.insert(v17, v16)
            end
        end
    end)
end
function v_u_5.finalize(p18)
    if #p18.nodeStack ~= 0 then
        error("Cannot finalize TestResults with nodes still on the stack!", 2)
    end
    p18:calculateTotals()
    p18:gatherErrors()
    return p18.results
end
function v_u_5.pushNode(p19, p20)
    local v21 = v_u_2.createNode(p20)
    local v22 = (p19.nodeStack[#p19.nodeStack] or p19.results).children
    table.insert(v22, v21)
    local v23 = p19.nodeStack
    table.insert(v23, v21)
    local v24 = p19.contextStack[#p19.contextStack]
    local v25 = v_u_3.new(v24)
    local v26 = p19.contextStack
    table.insert(v26, v25)
    local v27 = p19.expectationContextStack[#p19.expectationContextStack]
    local v28 = v_u_4.new(v27)
    local v29 = p19.expectationContextStack
    table.insert(v29, v28)
end
function v_u_5.popNode(p30)
    local v31 = #p30.nodeStack > 0
    assert(v31, "Tried to pop from an empty node stack!")
    table.remove(p30.nodeStack, #p30.nodeStack)
    table.remove(p30.contextStack, #p30.contextStack)
    table.remove(p30.expectationContextStack, #p30.expectationContextStack)
end
function v_u_5.getContext(p32)
    local v33 = #p32.contextStack > 0
    assert(v33, "Tried to get context from an empty stack!")
    return p32.contextStack[#p32.contextStack]
end
function v_u_5.getExpectationContext(p34)
    local v35 = #p34.expectationContextStack > 0
    assert(v35, "Tried to get expectationContext from an empty stack!")
    return p34.expectationContextStack[#p34.expectationContextStack]
end
function v_u_5.shouldSkip(p36)
    if p36.hasFocusNodes then
        for v37 = #p36.nodeStack, 1, -1 do
            local v38 = p36.nodeStack[v37]
            if v38.planNode.modifier == v_u_1.NodeModifier.Skip then
                return true
            end
            if v38.planNode.modifier == v_u_1.NodeModifier.Focus then
                return false
            end
        end
        return true
    else
        for v39 = #p36.nodeStack, 1, -1 do
            if p36.nodeStack[v39].planNode.modifier == v_u_1.NodeModifier.Skip then
                return true
            end
        end
        return false
    end
end
function v_u_5.setSuccess(p40)
    local v41 = #p40.nodeStack > 0
    assert(v41, "Attempting to set success status on empty stack")
    p40.nodeStack[#p40.nodeStack].status = v_u_1.TestStatus.Success
end
function v_u_5.setSkipped(p42)
    local v43 = #p42.nodeStack > 0
    assert(v43, "Attempting to set skipped status on empty stack")
    p42.nodeStack[#p42.nodeStack].status = v_u_1.TestStatus.Skipped
end
function v_u_5.setError(p44, p45)
    local v46 = #p44.nodeStack > 0
    assert(v46, "Attempting to set error status on empty stack")
    local v47 = p44.nodeStack[#p44.nodeStack]
    v47.status = v_u_1.TestStatus.Failure
    local v48 = v47.errors
    table.insert(v48, p45)
end
function v_u_5.addDummyError(p49, p50, p51)
    p49:pushNode({
        ["type"] = v_u_1.NodeType.It,
        ["phrase"] = p50
    })
    p49:setError(p51)
    p49:popNode()
    p49.nodeStack[#p49.nodeStack].status = v_u_1.TestStatus.Failure
end
function v_u_5.setStatusFromChildren(p52)
    local v53 = #p52.nodeStack > 0
    assert(v53, "Attempting to set status from children on empty stack")
    local v54 = p52.nodeStack[#p52.nodeStack]
    local v55 = v_u_1.TestStatus.Success
    local v56 = true
    for _, v57 in ipairs(v54.children) do
        if v57.status ~= v_u_1.TestStatus.Skipped then
            v56 = false
            if v57.status == v_u_1.TestStatus.Failure then
                v55 = v_u_1.TestStatus.Failure
            end
        end
    end
    if v56 then
        v55 = v_u_1.TestStatus.Skipped
    end
    v54.status = v55
end
return v_u_5