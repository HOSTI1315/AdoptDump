--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberNewContext.new (ModuleScript)

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_2 = v1.Number
local v_u_3 = v1.Error
local v_u_4 = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v5 = require(script.Parent:WaitForChild("ReactFiberStack.new"))
local v6 = require(script.Parent:WaitForChild("ReactFiberLane"))
local v7 = require(script.Parent:WaitForChild("ReactUpdateQueue.new"))
local v_u_8 = require(script.Parent:WaitForChild("ReactFiberHostConfig")).isPrimaryRenderer
local v9 = v5.createCursor
local v_u_10 = v5.push
local v_u_11 = v5.pop
local v_u_12 = require(script.Parent:WaitForChild("MaxInts")).MAX_SIGNED_31_BIT_INT
local v13 = require(script.Parent:WaitForChild("ReactWorkTags"))
local v_u_14 = v13.ContextProvider
local v_u_15 = v13.ClassComponent
local v_u_16 = v6.NoLanes
local v_u_17 = v6.NoTimestamp
local v_u_18 = v6.isSubsetOfLanes
local v_u_19 = v6.includesSomeLane
local v_u_20 = v6.mergeLanes
local v_u_21 = v6.pickArbitraryLane
local v_u_22 = require(script.Parent.Parent:WaitForChild("shared")).objectIs
local v_u_23 = v7.createUpdate
local v_u_24 = v7.ForceUpdate
local v_u_25 = {}
local v_u_26 = v9(nil)
local v_u_27 = _G.__DEV__ and {} or nil
local v_u_28 = nil
local v_u_29 = nil
local v_u_30 = nil
local v_u_31 = false
function v_u_25.resetContextDependencies()
    v_u_28 = nil
    v_u_29 = nil
    v_u_30 = nil
    if _G.__DEV__ then
        v_u_31 = false
    end
end
function v_u_25.enterDisallowedContextReadInDEV()
    if _G.__DEV__ then
        v_u_31 = true
    end
end
function v_u_25.exitDisallowedContextReadInDEV()
    if _G.__DEV__ then
        v_u_31 = false
    end
end
function v_u_25.pushProvider(p32, p33)
    local v34 = p32.type._context
    if v_u_8 then
        v_u_10(v_u_26, v34._currentValue, p32)
        v34._currentValue = p33
        if _G.__DEV__ then
            if v34._currentRenderer ~= nil and v34._currentRenderer ~= v_u_27 then
                v_u_4.error("Detected multiple renderers concurrently rendering the same context provider. This is currently unsupported.")
            end
            v34._currentRenderer = v_u_27
            return
        end
    else
        v_u_10(v_u_26, v34._currentValue2, p32)
        v34._currentValue2 = p33
        if _G.__DEV__ then
            if v34._currentRenderer2 ~= nil and v34._currentRenderer2 ~= v_u_27 then
                v_u_4.error("Detected multiple renderers concurrently rendering the same context provider. This is currently unsupported.")
            end
            v34._currentRenderer2 = v_u_27
        end
    end
end
function v_u_25.popProvider(p35)
    local v36 = v_u_26.current
    v_u_11(v_u_26, p35)
    local v37 = p35.type._context
    if v_u_8 then
        v37._currentValue = v36
    else
        v37._currentValue2 = v36
    end
end
function v_u_25.calculateChangedBits(p38, p39, p40)
    if v_u_22(p40, p39) then
        return 0
    end
    local v41 = v_u_12
    local v42 = p38._calculateChangedBits
    if typeof(v42) == "function" then
        v41 = p38._calculateChangedBits(p40, p39)
    end
    return math.floor(v41)
end
function v_u_25.scheduleWorkOnParentPath(p43, p44)
    while p43 ~= nil do
        local v45 = p43.alternate
        if v_u_18(p43.childLanes, p44) then
            if v45 == nil or v_u_18(v45.childLanes, p44) then
                break
            end
            v45.childLanes = v_u_20(v45.childLanes, p44)
        else
            p43.childLanes = v_u_20(p43.childLanes, p44)
            if v45 ~= nil then
                v45.childLanes = v_u_20(v45.childLanes, p44)
            end
        end
        p43 = p43.return_
    end
end
function v_u_25.propagateContextChange(p46, p47, p48, p49)
    local v50 = p46.child
    if v50 ~= nil then
        v50.return_ = p46
    end
    while true do
        local v51
        if true then
            if v50 == nil then
                return
            end
            local v52 = v50.dependencies
            if v52 == nil then
                if v50.tag == v_u_14 then
                    if v50.type == p46.type then
                        v51 = nil
                    else
                        v51 = v50.child
                    end
                else
                    v51 = v50.child
                end
            else
                v51 = v50.child
                local v53 = v52.firstContext
                while v53 ~= nil do
                    if v53.context == p47 then
                        local v54 = v53.observedBits
                        if bit32.band(v54, p48) ~= 0 then
                            if v50.tag == v_u_15 then
                                local v55 = v_u_23(v_u_17, v_u_21(p49))
                                v55.tag = v_u_24
                                local v56 = v50.updateQueue
                                if v56 ~= nil then
                                    local v57 = v56.shared
                                    local v58 = v57.pending
                                    if v58 == nil then
                                        v55.next = v55
                                    else
                                        v55.next = v58.next
                                        v58.next = v55
                                    end
                                    v57.pending = v55
                                end
                            end
                            local v59 = v50.lanes
                            v50.lanes = bit32.bor(v59, p49)
                            local v60 = v50.alternate
                            if v60 ~= nil then
                                local v61 = v60.lanes
                                v60.lanes = bit32.bor(v61, p49)
                            end
                            v_u_25.scheduleWorkOnParentPath(v50.return_, p49)
                            local v62 = v52.lanes
                            v52.lanes = bit32.bor(v62, p49)
                            break
                        end
                    end
                    v53 = v53.next
                end
            end
        end
        if v51 == nil then
            while true do
                if v50 == nil then
                    v51 = v50
                end
                if v50 == p46 then
                    v51 = nil
                end
                v51 = v50.sibling
                if v51 ~= nil then
                    v51.return_ = v50.return_
                end
                v50 = v50.return_
            end
        else
            v51.return_ = v50
        end
        v50 = v51
    end
end
function v_u_25.prepareToReadContext(p63, p64, p65)
    v_u_28 = p63
    v_u_29 = nil
    v_u_30 = nil
    local v66 = p63.dependencies
    if v66 ~= nil and v66.firstContext ~= nil then
        if v_u_19(v66.lanes, p64) then
            p65()
        end
        v66.firstContext = nil
    end
end
function v_u_25.readContext(p67, p68)
    if _G.__DEV__ and v_u_31 then
        v_u_4.error("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo().")
    end
    if v_u_30 ~= p67 and (p68 ~= false and p68 ~= 0) then
        if typeof(p68) ~= "number" or p68 == v_u_2.MAX_SAFE_INTEGER then
            v_u_30 = p67
            p68 = v_u_2.MAX_SAFE_INTEGER
        end
        local v69 = {
            ["context"] = p67,
            ["observedBits"] = p68,
            ["next"] = nil
        }
        if v_u_29 == nil then
            if v_u_28 == nil then
                error(v_u_3.new("Context can only be read while React is rendering. In classes, you can read it in the render method or getDerivedStateFromProps. In function components, you can read it directly in the function body, but not inside Hooks like useReducer() or useMemo()."))
            end
            v_u_29 = v69
            v_u_28.dependencies = {
                ["lanes"] = v_u_16,
                ["firstContext"] = v69,
                ["responders"] = nil
            }
        else
            v_u_29.next = v69
            v_u_29 = v69
        end
    end
    if v_u_8 then
        return p67._currentValue
    else
        return p67._currentValue2
    end
end
return v_u_25