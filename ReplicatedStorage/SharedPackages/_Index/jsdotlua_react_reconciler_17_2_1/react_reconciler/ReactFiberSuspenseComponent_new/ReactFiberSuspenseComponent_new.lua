--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberSuspenseComponent.new (ModuleScript)

require(script.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v1 = require(script.Parent:WaitForChild("ReactFiberHostConfig"))
require(script.Parent:WaitForChild("ReactFiberLane"))
local v2 = require(script.Parent:WaitForChild("ReactWorkTags"))
local v_u_3 = v2.SuspenseComponent
local v_u_4 = v2.SuspenseListComponent
local v5 = require(script.Parent:WaitForChild("ReactFiberFlags"))
local v_u_6 = v5.NoFlags
local v_u_7 = v5.DidCapture
local v_u_8 = v1.isSuspenseInstancePending
local v_u_9 = v1.isSuspenseInstanceFallback
return {
    ["shouldCaptureSuspense"] = function(p10, p11)
        local v12 = p10.memoizedState
        if v12 then
            return v12.dehydrated ~= nil
        else
            local v13 = p10.memoizedProps
            if v13.fallback == nil then
                return false
            else
                return v13.unstable_avoidThisFallback ~= true and true or not p11
            end
        end
    end,
    ["findFirstSuspended"] = function(p14)
        local v15 = p14
        while true do
            while true do
                if p14 == nil then
                    return nil
                end
                if p14.tag == v_u_3 then
                    break
                end
                if p14.tag == v_u_4 and p14.memoizedProps.revealOrder ~= nil then
                    local v16 = p14.flags
                    local v17 = v_u_7
                    if bit32.band(v16, v17) ~= v_u_6 then
                        return p14
                    end
                    goto l6
                end
                if p14.child == nil then
                    goto l6
                end
                p14.child.return_ = p14
                p14 = p14.child
            end
            local v18 = p14.memoizedState
            if v18 then
                local v19 = v18.dehydrated
                if v19 == nil or (v_u_8(v19) or v_u_9(v19)) then
                    return p14
                end
            end
            ::l6::
            if p14 == v15 then
                return nil
            end
            while p14.sibling == nil do
                if p14.return_ == nil or p14.return_ == v15 then
                    return nil
                end
                p14 = p14.return_
            end
            p14.sibling.return_ = p14.return_
            p14 = p14.sibling
        end
    end
}