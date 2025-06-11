--// ReplicatedStorage.ClientModules.ReactRoduxMods.Roact.ReconcilerCompat (ModuleScript)

local v_u_1 = require(script.Parent.Reconciler)
local v_u_2 = {}
local v_u_5 = {
    ["_warn"] = warn,
    ["reify"] = function(...)
        local v3 = debug.traceback("Roact.reify has been renamed to Roact.mount and will be removed in a future release.\nCheck the call to Roact.reify at:\n", 3)
        if not v_u_2[v3] then
            v_u_2[v3] = true
            v_u_5._warn(v3)
        end
        return v_u_1.mount(...)
    end,
    ["teardown"] = function(...)
        local v4 = debug.traceback("Roact.teardown has been renamed to Roact.unmount and will be removed in a future release.\nCheck the call to Roact.teardown at:\n", 3)
        if not v_u_2[v4] then
            v_u_2[v4] = true
            v_u_5._warn(v4)
        end
        return v_u_1.unmount(...)
    end
}
return v_u_5