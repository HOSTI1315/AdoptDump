--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react@17.2.1.react.ReactLazy (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("shared")).console
local v_u_2 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).util.inspect
require(script.Parent.Parent:WaitForChild("shared"))
local v_u_3 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols.REACT_LAZY_TYPE
function lazyInitializer(p_u_4)
    if p_u_4._status == -1 then
        local v5 = p_u_4._result()
        p_u_4._status = 0
        p_u_4._result = v5
        v5:andThen(function(p6)
            if p_u_4._status == 0 then
                local v7 = p6.default
                if _G.__DEV__ and v7 == nil then
                    v_u_1.error("lazy: Expected the result of a dynamic import() call. Instead received: `%s`\n\nYour code should look like: \n  local MyComponent = lazy(function() return reqquire(script.Parent.MyComponent) end)", v_u_2(p6))
                end
                local v8 = p_u_4
                v8._status = 1
                v8._result = v7
            end
        end, function(p9)
            if p_u_4._status == 0 then
                local v10 = p_u_4
                v10._status = 2
                v10._result = p9
            end
        end)
    end
    if p_u_4._status == 1 then
        return p_u_4._result
    end
    error(p_u_4._result)
end
return {
    ["lazy"] = function(p11)
        local v12 = {
            ["$$typeof"] = v_u_3,
            ["_payload"] = {
                ["_status"] = -1,
                ["_result"] = p11
            },
            ["_init"] = lazyInitializer
        }
        if _G.__DEV__ then
            local v_u_13 = nil
            local v_u_14 = nil
            local v19 = {
                ["__index"] = function(_, p15)
                    if p15 == "defaultProps" then
                        return v_u_13
                    end
                    if p15 == "propTypes" then
                        return v_u_14
                    end
                end,
                ["__newindex"] = function(p16, p17, p18)
                    if p17 == "defaultProps" then
                        v_u_1.error("React.lazy(...): It is not supported to assign `defaultProps` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.")
                        v_u_13 = p18
                        setmetatable(p16, {
                            ["__index"] = function() end,
                            ["__newindex"] = function() end
                        })
                    end
                    if p17 == "propTypes" then
                        v_u_1.error("React.lazy(...): It is not supported to assign `propTypes` to a lazy component import. Either specify them where the component is defined, or create a wrapping component around it.")
                        v_u_14 = p18
                        setmetatable(p16, {
                            ["__index"] = function() end,
                            ["__newindex"] = function() end
                        })
                    end
                end
            }
            setmetatable(v12, v19)
        end
        return v12
    end
}