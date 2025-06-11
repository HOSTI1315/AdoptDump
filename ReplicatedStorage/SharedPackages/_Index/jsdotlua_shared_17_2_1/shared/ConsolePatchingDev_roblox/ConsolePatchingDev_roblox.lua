--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.ConsolePatchingDev.roblox (ModuleScript)

local v_u_1 = require(script.Parent:WaitForChild("console"))
local v_u_2 = 0
local v_u_3 = nil
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = nil
local v_u_8 = nil
local v_u_9 = nil
local function v_u_10() end
return {
    ["disabledLog"] = v_u_10,
    ["disableLogs"] = function()
        if _G.__DEV__ then
            if v_u_2 == 0 then
                v_u_3 = v_u_1.log
                v_u_4 = v_u_1.info
                v_u_5 = v_u_1.warn
                v_u_6 = v_u_1.error
                v_u_7 = v_u_1.group
                v_u_8 = v_u_1.groupCollapsed
                v_u_9 = v_u_1.groupEnd
                v_u_1.info = v_u_10
                v_u_1.log = v_u_10
                v_u_1.warn = v_u_10
                v_u_1.error = v_u_10
                v_u_1.group = v_u_10
                v_u_1.groupCollapsed = v_u_10
                v_u_1.groupEnd = v_u_10
            end
            v_u_2 = v_u_2 + 1
        end
    end,
    ["reenableLogs"] = function()
        if _G.__DEV__ then
            v_u_2 = v_u_2 - 1
            if v_u_2 == 0 then
                v_u_1.log = v_u_3
                v_u_1.info = v_u_4
                v_u_1.warn = v_u_5
                v_u_1.error = v_u_6
                v_u_1.group = v_u_7
                v_u_1.groupCollapsed = v_u_8
                v_u_1.groupEnd = v_u_9
            end
            if v_u_2 < 0 then
                v_u_1.error("disabledDepth fell below zero. This is a bug in React. Please file an issue.")
            end
        end
    end
}