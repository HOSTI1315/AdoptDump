--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.invokeGuardedCallbackImpl (ModuleScript)

local v_u_1 = require(script.Parent:WaitForChild("ErrorHandling.roblox")).describeError
local _ = _G.__DEV__
return function(p2, _, p3, p4, ...)
    local v5 = nil
    local v6
    if _G.__YOLO__ then
        v6 = true
        if p4 == nil then
            p3(...)
        else
            p3(p4, ...)
        end
    elseif p4 == nil then
        v6, v5 = xpcall(p3, v_u_1, ...)
    else
        v6, v5 = xpcall(p3, v_u_1, p4, ...)
    end
    if not v6 then
        p2.onError(v5)
    end
end