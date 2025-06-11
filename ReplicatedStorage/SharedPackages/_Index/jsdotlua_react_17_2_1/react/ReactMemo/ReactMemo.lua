--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react@17.2.1.react.ReactMemo (ModuleScript)

local v1 = require(script.Parent.Parent:WaitForChild("shared"))
local v_u_2 = v1.console
local v3 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_4 = v3.Array
local v_u_5 = v3.Object
local v_u_6 = v3.util.inspect
local v7 = v1.ReactSymbols
local v_u_8 = v7.REACT_MEMO_TYPE
local v_u_9 = v7.REACT_ELEMENT_TYPE
local v_u_10 = v1.isValidElementType
local v_u_11 = v1.getComponentName
return {
    ["memo"] = function(p_u_12, p13)
        if _G.__DEV__ and not v_u_10(p_u_12) then
            local v14 = ""
            if p_u_12 == nil or typeof(p_u_12) == "table" and #v_u_5.keys(p_u_12) == 0 then
                v14 = v14 .. " You likely forgot to export your component from the file it\'s defined in, or you might have mixed up default and named imports."
            end
            local v15
            if p_u_12 == nil then
                v15 = "nil"
            elseif v_u_4.isArray(p_u_12) then
                v15 = "array"
            elseif p_u_12 == nil or (typeof(p_u_12) ~= "table" or p_u_12["$$typeof"] ~= v_u_9) then
                v15 = typeof(p_u_12)
                if p_u_12 ~= nil then
                    v14 = "\n" .. v_u_6(p_u_12)
                end
            else
                v15 = string.format("<%s />", v_u_11(p_u_12.type) or "UNKNOWN")
                v14 = " Did you accidentally export a JSX literal or Element instead of a component?"
            end
            v_u_2.error("memo: The first argument must be a component. Instead received: `%s`.%s", v15, v14)
        end
        local v16 = {
            ["$$typeof"] = v_u_8,
            ["type"] = p_u_12,
            ["compare"] = p13 or nil
        }
        if _G.__DEV__ then
            local v_u_17 = nil
            local v24 = {
                ["__index"] = function(p18, p19)
                    if p19 == "displayName" then
                        return v_u_17
                    else
                        return rawget(p18, p19)
                    end
                end,
                ["__newindex"] = function(p20, p21, p22)
                    if p21 == "displayName" then
                        v_u_17 = p22
                        local v23 = p_u_12
                        if typeof(v23) == "table" and p_u_12.displayName == nil then
                            p_u_12.displayName = v_u_17
                            return
                        end
                    else
                        rawset(p20, p21, p22)
                    end
                end
            }
            setmetatable(v16, v24)
        end
        return v16
    end
}