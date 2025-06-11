--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react@17.2.1.react.ReactContext (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("shared")).console
local v2 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local v_u_3 = v2.REACT_PROVIDER_TYPE
local v_u_4 = v2.REACT_CONTEXT_TYPE
return {
    ["createContext"] = function(p5, p6)
        local v_u_7 = {
            ["$$typeof"] = v_u_4,
            ["_calculateChangedBits"] = p6,
            ["_currentValue"] = p5,
            ["_currentValue2"] = p5,
            ["_threadCount"] = 0,
            ["Provider"] = nil,
            ["Consumer"] = nil,
            ["displayName"] = nil,
            ["_currentRenderer"] = nil,
            ["_currentRenderer2"] = nil
        }
        v_u_7.Provider = {
            ["$$typeof"] = v_u_3,
            ["_context"] = v_u_7
        }
        local v_u_8 = false
        if _G.__DEV__ then
            local v9 = {
                ["$$typeof"] = v_u_4,
                ["_context"] = v_u_7,
                ["_calculateChangedBits"] = v_u_7._calculateChangedBits
            }
            local v13 = {
                ["__index"] = function(_, p10)
                    if p10 == "_currentValue" then
                        return v_u_7._currentValue
                    elseif p10 == "_currentValue2" then
                        return v_u_7._currentValue2
                    elseif p10 == "_threadCount" then
                        return v_u_7._threadCount
                    elseif p10 == "displayName" then
                        return v_u_7.displayName
                    else
                        return nil
                    end
                end,
                ["__newindex"] = function(_, p11, p12)
                    if p11 == "_currentValue" then
                        v_u_7._currentValue = p12
                        return
                    elseif p11 == "_currentValue2" then
                        v_u_7._currentValue2 = p12
                        return
                    elseif p11 == "_threadCount" then
                        v_u_7._threadCount = p12
                    elseif p11 == "displayName" and not v_u_8 then
                        v_u_1.warn("Setting `displayName` on Context.Consumer has no effect. " .. "You should set it directly on the context with Context.displayName = " .. p12 .. ".")
                        v_u_8 = true
                    end
                end
            }
            setmetatable(v9, v13)
            v_u_7.Consumer = v9
        else
            v_u_7.Consumer = v_u_7
        end
        if _G.__DEV__ then
            v_u_7._currentRenderer = nil
            v_u_7._currentRenderer2 = nil
        end
        return v_u_7
    end
}