--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.UninitializedState.roblox (ModuleScript)

local v_u_1 = require(script.Parent:WaitForChild("console"))
local v2 = {}
setmetatable(v2, {
    ["__index"] = function(_, _)
        if _G.__DEV__ then
            v_u_1.warn("Attempted to access uninitialized state. Use setState to initialize state")
        end
        return nil
    end,
    ["__newindex"] = function(_, _)
        if _G.__DEV__ then
            v_u_1.error("Attempted to directly mutate state. Use setState to assign new values to state.")
        end
        return nil
    end,
    ["__tostring"] = function(_)
        return "<uninitialized component state>"
    end,
    ["__metatable"] = "UninitializedState"
})
return v2