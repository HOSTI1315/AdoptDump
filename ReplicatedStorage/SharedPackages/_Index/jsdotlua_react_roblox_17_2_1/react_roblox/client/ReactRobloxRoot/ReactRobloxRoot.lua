--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.ReactRobloxRoot (ModuleScript)

require(script.Parent:WaitForChild("ReactRobloxHostTypes.roblox"))
require(script.Parent.Parent.Parent:WaitForChild("react-reconciler"))
require(script.Parent.Parent.Parent:WaitForChild("shared"))
require(script.Parent.Parent.Parent:WaitForChild("react-reconciler"))
local v1 = require(script.Parent:WaitForChild("ReactRobloxComponentTree"))
local v_u_2 = v1.markContainerAsRoot
local v_u_3 = v1.unmarkContainerAsRoot
local v4 = require(script.Parent.Parent:WaitForChild("ReactReconciler.roblox"))
local v_u_5 = v4.createContainer
local v_u_6 = v4.updateContainer
local v_u_7 = require(script.Parent.Parent.Parent:WaitForChild("shared")).invariant
local v_u_8 = require(script.Parent.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableEagerRootListeners
local v_u_9 = v4.flushSync
local v_u_10 = v4.flushPassiveEffects
local v_u_11 = v4.ReactRootTags.BlockingRoot
local v_u_12 = v4.ReactRootTags.ConcurrentRoot
local v_u_13 = v4.ReactRootTags.LegacyRoot
local v_u_14 = nil
local v_u_15 = {}
v_u_15.__index = v_u_15
function v_u_15.new(p16, p17)
    local v18 = v_u_15
    local v19 = setmetatable({}, v18)
    v19._internalRoot = v_u_14(p16, v_u_12, p17)
    return v19
end
function v_u_15.render(p20, p21)
    v_u_6(p21, p20._internalRoot, nil)
end
function v_u_15.unmount(p22)
    local v_u_23 = p22._internalRoot
    local v_u_24 = v_u_23.containerInfo
    v_u_9(function()
        v_u_6(nil, v_u_23, nil, function()
            v_u_3(v_u_24)
        end)
    end)
    v_u_10()
end
v_u_14 = function(p25, p26, p27)
    local v28
    if p27 == nil then
        v28 = false
    else
        v28 = p27.hydrate == true
    end
    local v29
    if p27 == nil then
        v29 = nil
    else
        v29 = p27.hydrationOptions
    end
    local v30
    if p27 == nil or p27.hydrationOptions == nil then
        v30 = nil
    else
        v30 = p27.hydrationOptions.mutableSources or nil
    end
    local v31 = v_u_5(p25, p26, v28, v29)
    v_u_2(v31.current, p25)
    return v31
end
local v45 = {
    ["isValidContainer"] = function(p32)
        return typeof(p32) == "Instance"
    end,
    ["createRoot"] = function(p33, p34)
        v_u_7(typeof(p33) == "Instance", "createRoot(...): Target container is not a Roblox Instance.")
        warnIfReactDOMContainerInDEV(p33)
        return v_u_15.new(p33, p34)
    end,
    ["createBlockingRoot"] = function(p35, p36)
        v_u_7(typeof(p35) == "Instance", "createRoot(...): Target container is not a Roblox Instance.")
        warnIfReactDOMContainerInDEV(p35)
        local v37 = v_u_11
        local v38 = v_u_15
        local v39 = setmetatable({}, v38)
        v39._internalRoot = v_u_14(p35, v37, p36)
        return v39
    end,
    ["createLegacyRoot"] = function(p40, p41)
        local v42 = v_u_13
        local v43 = v_u_15
        local v44 = setmetatable({}, v43)
        v44._internalRoot = v_u_14(p40, v42, p41)
        return v44
    end
}
function warnIfReactDOMContainerInDEV(_)
    local _ = _G.__DEV__
end
return v45