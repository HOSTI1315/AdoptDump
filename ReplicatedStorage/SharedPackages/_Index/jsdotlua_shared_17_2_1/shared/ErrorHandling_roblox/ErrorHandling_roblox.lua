--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.ErrorHandling.roblox (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("luau-polyfill"))
local v_u_2 = v_u_1.Error
local v_u_3 = v_u_1.util.inspect
return {
    ["describeError"] = function(p4)
        if typeof(p4) ~= "string" then
            return p4
        end
        local _, v5 = string.find(p4, ":[%d]+: ")
        if v5 then
            local v6 = v5 + 1
            p4 = string.sub(p4, v6)
        end
        local v7 = v_u_1.Error.new(p4)
        v7.stack = debug.traceback(nil, 2)
        return v7
    end,
    ["errorToString"] = function(p8)
        if typeof(p8) ~= "table" then
            return v_u_3(p8)
        end
        if not (p8.message and p8.stack) then
            return v_u_3(p8)
        end
        local v9 = p8.message
        local v10 = p8.stack
        return "\n------ Error caught by React ------\n" .. v9 .. "\n------ Error caught by React ------\n" .. tostring(v10)
    end,
    ["parseReactError"] = function(p11)
        local v12 = string.split(p11, "\n------ Error caught by React ------\n")
        if #v12 ~= 3 then
            local v13 = v_u_2.new(p11)
            v13.stack = nil
            return v13, ""
        end
        local v14, v15, v16 = table.unpack(v12)
        local v17 = v_u_2.new(v15)
        v17.stack = v16
        return v17, v14
    end,
    ["__ERROR_DIVIDER"] = "\n------ Error caught by React ------\n"
}