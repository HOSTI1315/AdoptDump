--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.ReactRoblox (ModuleScript)

require(script.Parent.Parent.Parent:WaitForChild("shared"))
require(script.Parent:WaitForChild("ReactRobloxHostTypes.roblox"))
local v1 = require(script.Parent:WaitForChild("ReactRobloxRoot"))
local v2 = v1.createRoot
local v3 = v1.createBlockingRoot
local v4 = v1.createLegacyRoot
local v_u_5 = v1.isValidContainer
local v6 = require(script.Parent.Parent:WaitForChild("ReactReconciler.roblox"))
local v7 = v6.batchedUpdates
local v8 = v6.flushSync
local v9 = v6.injectIntoDevTools
local v10 = v6.flushPassiveEffects
local v11 = v6.IsThisRendererActing
local v_u_12 = v6.createPortal
local v13 = require(script.Parent.Parent.Parent:WaitForChild("shared")).ReactVersion
local v_u_14 = require(script.Parent.Parent.Parent:WaitForChild("shared")).invariant
local v15 = require(script.Parent.Parent.Parent:WaitForChild("shared")).ReactFeatureFlags.enableNewReconciler
local v16 = require(script.Parent:WaitForChild("ReactRobloxComponentTree"))
local v17 = v16.getInstanceFromNode
local v18 = v16.getNodeFromInstance
local v19 = v16.getFiberCurrentPropsFromNode
local v20 = v16.getClosestInstanceFromNode
local v24 = {
    ["createPortal"] = function(p21, p22, p23)
        v_u_14(v_u_5(p22), "Target container is not a Roblox Instance.")
        return v_u_12(p21, p22, nil, p23)
    end,
    ["unstable_batchedUpdates"] = v7,
    ["flushSync"] = v8,
    ["__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED"] = {
        ["Events"] = {
            ["getInstanceFromNode"] = v17,
            ["getNodeFromInstance"] = v18,
            ["getFiberCurrentPropsFromNode"] = v19,
            ["flushPassiveEffects"] = v10,
            ["IsThisRendererActing"] = v11
        }
    },
    ["version"] = v13,
    ["createRoot"] = v2,
    ["createBlockingRoot"] = v3,
    ["createLegacyRoot"] = v4,
    ["Event"] = require(script.Parent.Parent.Parent:WaitForChild("shared")).Event,
    ["Change"] = require(script.Parent.Parent.Parent:WaitForChild("shared")).Change,
    ["Tag"] = require(script.Parent.Parent.Parent:WaitForChild("shared")).Tag,
    ["unstable_isNewReconciler"] = v15,
    ["act"] = function(_)
        error("ReactRoblox.act is only available in testing environments, not production. Enable the `__ROACT_17_MOCK_SCHEDULER__` global in your test configuration in order to use `act`.")
    end
}
if _G.__ROACT_17_MOCK_SCHEDULER__ then
    v24.act = v6.act
end
v9({
    ["findFiberByHostInstance"] = v20,
    ["bundleType"] = _G.__DEV__ and 1 or 0,
    ["version"] = v13,
    ["rendererPackageName"] = "ReactRoblox"
})
local _ = _G.__DEV__
v24.robloxReactProfiling = v6.robloxReactProfiling
return v24