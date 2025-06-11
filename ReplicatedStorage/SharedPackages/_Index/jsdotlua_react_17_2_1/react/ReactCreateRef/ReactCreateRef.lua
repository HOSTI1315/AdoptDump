--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react@17.2.1.react.ReactCreateRef (ModuleScript)

require(script.Parent.Parent:WaitForChild("shared"))
local v_u_1 = require(script.Parent:WaitForChild("ReactBinding.roblox"))
return {
    ["createRef"] = function()
        local v_u_2, _ = v_u_1.create(nil)
        local v3 = {}
        if _G.__DEV__ then
            v_u_2._source = debug.traceback("Ref created at:", 1)
        end
        local v8 = {
            ["__index"] = function(_, p4)
                if p4 == "current" then
                    return v_u_2:getValue()
                else
                    return v_u_2[p4]
                end
            end,
            ["__newindex"] = function(_, p5, p6)
                if p5 == "current" then
                    v_u_1.update(v_u_2, p6)
                end
                v_u_2[p5] = p6
            end,
            ["__tostring"] = function(_)
                local v7 = v_u_2
                return string.format("Ref(%s)", (tostring(v7:getValue())))
            end
        }
        setmetatable(v3, v8)
        return v3
    end
}