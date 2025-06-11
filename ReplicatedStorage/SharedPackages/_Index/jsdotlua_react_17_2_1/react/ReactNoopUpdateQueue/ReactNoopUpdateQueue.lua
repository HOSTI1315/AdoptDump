--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react@17.2.1.react.ReactNoopUpdateQueue (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("shared")).console
local v_u_2 = {}
return {
    ["isMounted"] = function(_)
        return false
    end,
    ["enqueueForceUpdate"] = function(p3, _, _)
        if _G.__DEV__ then
            local v4 = p3.__componentName or "ReactClass"
            local v5 = v4 .. ".forceUpdate"
            if v_u_2[v5] then
                return
            end
            v_u_1.error("Can\'t call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component\'s `init` method.", "forceUpdate", v4)
            v_u_2[v5] = true
        end
    end,
    ["enqueueReplaceState"] = function(p6, _, _, _)
        if _G.__DEV__ then
            local v7 = p6.__componentName or "ReactClass"
            local v8 = v7 .. ".replaceState"
            if v_u_2[v8] then
                return
            end
            v_u_1.error("Can\'t call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component\'s `init` method.", "replaceState", v7)
            v_u_2[v8] = true
        end
    end,
    ["enqueueSetState"] = function(p9, _, _, _)
        if _G.__DEV__ then
            local v10 = p9.__componentName or "ReactClass"
            local v11 = v10 .. ".setState"
            if v_u_2[v11] then
                return
            end
            v_u_1.error("Can\'t call %s on a component that is not yet mounted. This is a no-op, but it might indicate a bug in your application. Instead, assign to `self.state` directly with the desired state in the %s component\'s `init` method.", "setState", v10)
            v_u_2[v11] = true
        end
    end
}