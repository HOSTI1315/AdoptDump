--// ReplicatedStorage.SharedPackages._Index.roblox_testez@0.4.1.testez.TestRunner (ModuleScript)

local v_u_1 = require(script.Parent.TestEnum)
local v_u_2 = require(script.Parent.TestSession)
local v_u_3 = require(script.Parent.LifecycleHooks)
local v_u_4 = {
    ["environment"] = {}
}
local function v_u_6(p_u_5)
    return setmetatable({
        ["extend"] = function(...)
            p_u_5:extend(...)
        end
    }, {
        ["__call"] = function(_, ...)
            return p_u_5:startExpectationChain(...)
        end
    })
end
function v_u_4.runPlan(p7)
    local v8 = v_u_2.new(p7)
    local v9 = v_u_3.new()
    v8.hasFocusNodes = #p7:findNodes(function(p10)
        return p10.modifier == v_u_1.NodeModifier.Focus
    end) > 0
    v_u_4.runPlanNode(v8, p7, v9)
    return v8:finalize()
end
function v_u_4.runPlanNode(p_u_11, p12, p_u_13)
    local function v_u_30(p_u_14, p15)
        _G.__TESTEZ_RUNNING_TEST__ = true
        local v16 = getfenv(p_u_14)
        local v_u_17 = true
        local v_u_18 = nil
        local v_u_19 = p15 or ""
        for v20, v21 in pairs(v_u_4.environment) do
            v16[v20] = v21
        end
        function v16.fail(p22)
            local v23 = p22 == nil and "fail() was called." or p22
            v_u_17 = false
            v_u_18 = v_u_19 .. debug.traceback(tostring(v23), 2)
        end
        v16.expect = v_u_6(p_u_11:getExpectationContext())
        local v_u_24 = p_u_11:getContext()
        local v26, v27 = xpcall(function()
            p_u_14(v_u_24)
        end, function(p25)
            return v_u_19 .. debug.traceback(tostring(p25), 2)
        end)
        if not v26 then
            local v28 = false
            local v29 = v27
            v_u_18 = v29
            v_u_17 = v28
        end
        _G.__TESTEZ_RUNNING_TEST__ = nil
        return v_u_17, v_u_18
    end
    p_u_13:pushHooksFrom(p12)
    local v31 = false
    local function v41(p32)
        for _, v33 in ipairs(p_u_13:getBeforeEachHooks()) do
            local v34, v35 = v_u_30(v33, "beforeEach hook: ")
            if not v34 then
                return false, v35
            end
        end
        local v36, v37 = v_u_30(p32.callback)
        for _, v38 in ipairs(p_u_13:getAfterEachHooks()) do
            local v39, v40 = v_u_30(v38, "afterEach hook: ")
            if not v39 then
                if v36 then
                    return false, v40
                else
                    return false, v37 .. "\nWhile cleaning up the failed test another error was found:\n" .. v40
                end
            end
        end
        if v36 then
            return true, nil
        else
            return false, v37
        end
    end
    for _, v42 in ipairs(p_u_13:getBeforeAllHooks()) do
        local v43, v44 = v_u_30(v42, "beforeAll hook: ")
        if not v43 then
            p_u_11:addDummyError("beforeAll", v44)
            v31 = true
        end
    end
    if not v31 then
        for _, v45 in ipairs(p12.children) do
            if v45.type == v_u_1.NodeType.It then
                p_u_11:pushNode(v45)
                if p_u_11:shouldSkip() then
                    p_u_11:setSkipped()
                else
                    local v46, v47 = v41(v45)
                    if v46 then
                        p_u_11:setSuccess()
                    else
                        p_u_11:setError(v47)
                    end
                end
                p_u_11:popNode()
            elseif v45.type == v_u_1.NodeType.Describe then
                p_u_11:pushNode(v45)
                v_u_4.runPlanNode(p_u_11, v45, p_u_13)
                if v45.loadError then
                    p_u_11:setError("Error during planning: " .. v45.loadError)
                else
                    p_u_11:setStatusFromChildren()
                end
                p_u_11:popNode()
            end
        end
    end
    for _, v48 in ipairs(p_u_13:getAfterAllHooks()) do
        local v49, v50 = v_u_30(v48, "afterAll hook: ")
        if not v49 then
            p_u_11:addDummyError("afterAll", v50)
        end
    end
    p_u_13:popHooks()
end
return v_u_4