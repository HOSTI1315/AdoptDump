--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberErrorLogger (ModuleScript)

local v1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_2 = v1.util.inspect
local v_u_3 = v1.setTimeout
local v4 = require(script.Parent.Parent:WaitForChild("shared"))
local v_u_5 = v4.console
local v_u_6 = v4.errorToString
require(script.Parent:WaitForChild("ReactInternalTypes"))
require(script.Parent:WaitForChild("ReactCapturedValue"))
local v_u_7 = require(script.Parent:WaitForChild("ReactFiberErrorDialog")).showErrorDialog
local v_u_8 = require(script.Parent:WaitForChild("ReactWorkTags")).ClassComponent
local v_u_9 = require(script.Parent.Parent:WaitForChild("shared")).getComponentName
return {
    ["logCapturedError"] = function(p_u_10, p_u_11)
        local v19, v_u_20 = pcall(function()
            if v_u_7(p_u_10, p_u_11) == false then
                return nil
            end
            local v12 = p_u_11.value
            if _G.__DEV__ then
                local v13 = p_u_11.source
                local v14 = p_u_11.stack or ""
                if v12 ~= nil and v12._suppressLogging then
                    if p_u_10.tag == v_u_8 then
                        return
                    end
                    v_u_5.error(v12)
                end
                local v15
                if v13 == nil then
                    v15 = nil
                else
                    v15 = v_u_9(v13.type)
                end
                local v16 = not v15 and "The above error occurred in one of your React components:" or "The above error occurred in the <" .. tostring(v15) .. "> component:"
                local v17 = v_u_9(p_u_10.type)
                local v18 = v16 .. "\n" .. v14 .. "\n\n" .. (not v17 and "Consider adding an error boundary to your tree to customize error handling behavior.\nVisit https://reactjs.org/link/error-boundaries to learn more about error boundaries." or "React will try to recreate this component tree from scratch " .. "using the error boundary you provided, " .. v17 .. ".")
                v_u_5.error(v18)
            else
                v_u_5.error(v_u_2(v12))
            end
            return nil
        end)
        if not v19 then
            warn("failed to error with error: " .. v_u_2(v_u_20))
            v_u_3(function()
                error(v_u_6(v_u_20))
            end)
        end
    end
}