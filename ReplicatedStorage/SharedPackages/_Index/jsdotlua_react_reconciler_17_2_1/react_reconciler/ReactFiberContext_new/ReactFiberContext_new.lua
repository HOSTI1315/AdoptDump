--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberContext.new (ModuleScript)

local v_u_1 = _G.__DEV__
local v_u_2 = _G.__DISABLE_ALL_WARNINGS_EXCEPT_PROP_VALIDATION__
local v3 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_4 = v3.Object
local v_u_5 = v3.Error
local v_u_6 = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v7 = require(script.Parent:WaitForChild("ReactFiberStack.new"))
local v_u_8 = require(script.Parent:WaitForChild("ReactFiberTreeReflection")).isFiberMounted
local v_u_9 = require(script.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.disableLegacyContext
local v10 = require(script.Parent:WaitForChild("ReactWorkTags"))
local v_u_11 = v10.ClassComponent
local v_u_12 = v10.HostRoot
local v_u_13 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
local v_u_14 = require(script.Parent.Parent:WaitForChild("shared")).checkPropTypes
local v15 = v7.createCursor
local v_u_16 = v7.push
local v_u_17 = v7.pop
local v_u_18 = v_u_1 and {} or nil
local v_u_19 = {}
if v_u_1 then
    v_u_4.freeze(v_u_19)
end
local v_u_20 = v15(v_u_19)
local v_u_21 = v15(false)
local v_u_22 = v_u_19
local v_u_23 = nil
local function v26(_, p24, p25)
    if p25 and v_u_23(p24) then
        return v_u_22
    else
        return v_u_20.current
    end
end
v_u_23 = function(p27)
    if type(p27) == "function" then
        return false
    else
        return p27.childContextTypes ~= nil
    end
end
local function v_u_38(p28, p29, p30)
    local v31 = p28.stateNode
    local v32 = p29.childContextTypes
    if v31.getChildContext ~= nil then
        local v33 = v31.getChildContext
        if type(v33) == "function" then
            local v34 = v31:getChildContext()
            for v35, _ in v34 do
                if v32[v35] == nil then
                    local v36 = v_u_13(p29) or "Unknown"
                    error(v_u_5.new(string.format("%s.getChildContext(): key \"%s\" is not defined in childContextTypes.", v36, v35)))
                end
            end
            if v_u_1 or v_u_2 then
                v_u_14(v32, nil, v34, "child context", v_u_13(p29) or "Unknown")
            end
            return v_u_4.assign({}, p30, v34)
        end
    end
    if v_u_1 then
        local v37 = v_u_13(p29) or "Unknown"
        if not v_u_18[v37] then
            v_u_18[v37] = true
            v_u_6.error("%s.childContextTypes is specified but there is no getChildContext() method on the instance. You can either define getChildContext() on %s or remove childContextTypes from it.", v37, v37)
        end
    end
    return p30
end
return {
    ["emptyContextObject"] = v_u_19,
    ["getUnmaskedContext"] = v26,
    ["cacheContext"] = function(p39, p40, p41)
        local v42 = p39.stateNode
        v42.__reactInternalMemoizedUnmaskedChildContext = p40
        v42.__reactInternalMemoizedMaskedChildContext = p41
    end,
    ["getMaskedContext"] = function(p43, p44)
        local v45 = p43.type
        if type(v45) == "function" then
            return p44
        end
        local v46 = v45.contextTypes
        if not v46 then
            return v_u_19
        end
        local v47 = p43.stateNode
        if v47 and v47.__reactInternalMemoizedUnmaskedChildContext == p44 then
            return v47.__reactInternalMemoizedMaskedChildContext
        end
        local v48 = {}
        for v49, _ in v46 do
            v48[v49] = p44[v49]
        end
        if v_u_1 or v_u_2 then
            v_u_14(v46, nil, v48, "context", v_u_13(v45) or "Unknown")
        end
        if v47 then
            local v50 = p43.stateNode
            v50.__reactInternalMemoizedUnmaskedChildContext = p44
            v50.__reactInternalMemoizedMaskedChildContext = v48
        end
        return v48
    end,
    ["hasContextChanged"] = function()
        if v_u_9 then
            return false
        else
            return v_u_21.current
        end
    end,
    ["popContext"] = function(p51)
        v_u_17(v_u_21, p51)
        v_u_17(v_u_20, p51)
    end,
    ["popTopLevelContextObject"] = function(p52)
        v_u_17(v_u_21, p52)
        v_u_17(v_u_20, p52)
    end,
    ["pushTopLevelContextObject"] = function(p53, p54, p55)
        if v_u_20.current ~= v_u_19 then
            error(v_u_5.new("Unexpected context found on stack. This error is likely caused by a bug in React. Please file an issue."))
        end
        v_u_16(v_u_20, p54, p53)
        v_u_16(v_u_21, p55, p53)
    end,
    ["processChildContext"] = v_u_38,
    ["isContextProvider"] = v_u_23,
    ["pushContextProvider"] = function(p56)
        local v57 = p56.stateNode
        local v58 = v57 and v57.__reactInternalMemoizedMergedChildContext or v_u_19
        v_u_22 = v_u_20.current
        v_u_16(v_u_20, v58, p56)
        v_u_16(v_u_21, v_u_21.current, p56)
        return true
    end,
    ["invalidateContextProvider"] = function(p59, p60, p61)
        local v62 = p59.stateNode
        if not v62 then
            error(v_u_5.new("Expected to have an instance by this point. This error is likely caused by a bug in React. Please file an issue."))
        end
        if p61 then
            local v63 = v_u_38(p59, p60, v_u_22)
            v62.__reactInternalMemoizedMergedChildContext = v63
            v_u_17(v_u_21, p59)
            v_u_17(v_u_20, p59)
            v_u_16(v_u_20, v63, p59)
            v_u_16(v_u_21, p61, p59)
        else
            v_u_17(v_u_21, p59)
            v_u_16(v_u_21, p61, p59)
        end
    end,
    ["findCurrentUnmaskedContext"] = function(p64)
        if p64.tag ~= v_u_11 or not v_u_8(p64) then
            error(v_u_5.new("Expected subtree parent to be a mounted class component. This error is likely caused by a bug in React. Please file an issue."))
        end
        while p64.tag ~= v_u_12 do
            if p64.tag == v_u_11 and p64.type.childContextTypes ~= nil then
                return p64.stateNode.__reactInternalMemoizedMergedChildContext
            end
            p64 = p64.return_
            if p64 == nil then
                error(v_u_5.new("Found unexpected detached subtree parent. This error is likely caused by a bug in React. Please file an issue."))
                return
            end
        end
        return p64.stateNode.context
    end
}