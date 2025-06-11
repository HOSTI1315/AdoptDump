--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.ReactErrorUtils (ModuleScript)

local v_u_1 = require(script.Parent:WaitForChild("invariant"))
local v_u_2 = require(script.Parent:WaitForChild("invokeGuardedCallbackImpl"))
local v_u_3 = nil
local v_u_4 = false
local v_u_5 = nil
local v_u_6 = false
local v_u_7 = nil
local v_u_9 = {
    ["onError"] = function(p8)
        v_u_4 = true
        v_u_5 = p8
    end
}
local v_u_12 = {
    ["invokeGuardedCallback"] = function(...)
        v_u_4 = false
        v_u_5 = nil
        v_u_2(v_u_9, ...)
    end,
    ["invokeGuardedCallbackAndCatchFirstError"] = function(...)
        v_u_12.invokeGuardedCallback(...)
        if v_u_4 then
            local v10 = v_u_3()
            if not v_u_6 then
                v_u_6 = true
                v_u_7 = v10
            end
        end
    end,
    ["rethrowCaughtError"] = function()
        if v_u_6 then
            local v11 = v_u_7
            v_u_6 = false
            v_u_7 = nil
            error(v11)
        end
    end,
    ["hasCaughtError"] = function()
        return v_u_4
    end
}
v_u_3 = function()
    if not v_u_4 then
        v_u_1(false, "clearCaughtError was called but no error was captured. This error is likely caused by a bug in React. Please file an issue.")
        return nil
    end
    local v13 = v_u_5
    v_u_4 = false
    v_u_5 = nil
    return v13
end
v_u_12.clearCaughtError = v_u_3
return v_u_12