--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberStack.new (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("shared")).console
require(script.Parent:WaitForChild("ReactInternalTypes"))
local v_u_2 = {}
local v_u_3 = {}
local v_u_4 = _G.__DEV__ and {} or nil
local v_u_5 = 0
return {
    ["createCursor"] = function(p6)
        return {
            ["current"] = p6
        }
    end,
    ["isEmpty"] = function()
        return v_u_5 == 0
    end,
    ["pop"] = function(p7, p8)
        if v_u_5 < 1 then
            if _G.__DEV__ then
                v_u_1.error("Unexpected pop.")
            end
        else
            if _G.__DEV__ and p8 ~= v_u_4[v_u_5] then
                v_u_1.error("Unexpected Fiber popped.")
            end
            local v9 = v_u_3[v_u_5]
            if v9 == v_u_2 then
                p7.current = nil
            else
                p7.current = v9
            end
            v_u_3[v_u_5] = nil
            if _G.__DEV__ then
                v_u_4[v_u_5] = nil
            end
            v_u_5 = v_u_5 - 1
        end
    end,
    ["push"] = function(p10, p11, p12)
        v_u_5 = v_u_5 + 1
        local v13 = p10.current
        if v13 == nil then
            v_u_3[v_u_5] = v_u_2
        else
            v_u_3[v_u_5] = v13
        end
        if _G.__DEV__ then
            v_u_4[v_u_5] = p12
        end
        p10.current = p11
    end,
    ["checkThatStackIsEmpty"] = function()
        if _G.__DEV__ and v_u_5 ~= 0 then
            v_u_1.error("Expected an empty stack. Something was not reset properly.")
        end
    end,
    ["resetStackAfterFatalErrorInDev"] = function()
        if _G.__DEV__ then
            v_u_5 = 0
            table.clear(v_u_3)
            table.clear(v_u_4)
        end
    end
}