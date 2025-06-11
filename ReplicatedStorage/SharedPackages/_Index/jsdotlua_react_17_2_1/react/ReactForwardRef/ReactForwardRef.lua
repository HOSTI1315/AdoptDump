--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react@17.2.1.react.ReactForwardRef (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("shared")).console
local v2 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
require(script.Parent.Parent:WaitForChild("shared"))
local v_u_3 = v2.REACT_FORWARD_REF_TYPE
local v_u_4 = v2.REACT_MEMO_TYPE
return {
    ["forwardRef"] = function(p5)
        if _G.__DEV__ then
            if typeof(p5) == "table" and p5["$$typeof"] == v_u_4 then
                v_u_1.error("forwardRef requires a render function but received a `memo` component. Instead of forwardRef(memo(...)), use memo(forwardRef(...)).")
            elseif typeof(p5) == "function" then
                local v6, _ = debug.info(p5, "a")
                if v6 ~= 0 and v6 ~= 2 then
                    v_u_1.error("forwardRef render functions accept exactly two parameters: props and ref. %s", v6 == 1 and "Did you forget to use the ref parameter?" or "Any additional parameter will be undefined.")
                end
            else
                v_u_1.error("forwardRef requires a render function but was given %s.", (typeof(p5)))
            end
        end
        local v7 = {
            ["$$typeof"] = v_u_3,
            ["render"] = p5
        }
        if _G.__DEV__ then
            local v_u_8 = nil
            local v14 = {
                ["__index"] = function(p9, p10)
                    if p10 == "displayName" then
                        return v_u_8
                    else
                        return rawget(p9, p10)
                    end
                end,
                ["__newindex"] = function(p11, p12, p13)
                    if p12 == "displayName" then
                        v_u_8 = p13
                    else
                        rawset(p11, p12, p13)
                    end
                end
            }
            setmetatable(v7, v14)
        end
        return v7
    end
}