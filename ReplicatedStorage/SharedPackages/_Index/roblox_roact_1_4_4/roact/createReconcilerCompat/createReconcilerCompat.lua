--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.createReconcilerCompat (ModuleScript)

local v_u_1 = require(script.Parent.Logging)
return function(p_u_2)
    return {
        ["reify"] = function(...)
            v_u_1.warnOnce("Roact.reify has been renamed to Roact.mount and will be removed in a future release.\nCheck the call to Roact.reify at:\n")
            return p_u_2.mountVirtualTree(...)
        end,
        ["teardown"] = function(...)
            v_u_1.warnOnce("Roact.teardown has been renamed to Roact.unmount and will be removed in a future release.\nCheck the call to Roact.teardown at:\n")
            return p_u_2.unmountVirtualTree(...)
        end,
        ["reconcile"] = function(...)
            v_u_1.warnOnce("Roact.reconcile has been renamed to Roact.update and will be removed in a future release.\nCheck the call to Roact.reconcile at:\n")
            return p_u_2.updateVirtualTree(...)
        end
    }
end