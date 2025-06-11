--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.consoleWithStackDev (ModuleScript)

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_2 = v1.console
local v_u_3 = v1.Array
local v_u_4 = require(script.Parent:WaitForChild("ReactSharedInternals"))
local v_u_5 = nil
local v8 = {
    ["warn"] = function(p6, ...)
        if _G.__DEV__ then
            v_u_5("warn", p6, { ... })
        end
    end,
    ["error"] = function(p7, ...)
        if _G.__DEV__ then
            v_u_5("error", p7, { ... })
        end
    end
}
v_u_5 = function(p9, p10, p11)
    if _G.__DEV__ then
        local v12 = v_u_4.ReactDebugCurrentFrame.getStackAddendum()
        if v12 ~= "" then
            p10 = p10 .. "%s"
            p11 = v_u_3.slice(p11, 1)
            table.insert(p11, v12)
        end
        local v13 = v_u_3.map(p11, tostring)
        local v14 = "Warning: " .. p10
        table.insert(v13, 1, v14)
        v_u_2[p9](unpack(v13))
    end
end
return v8