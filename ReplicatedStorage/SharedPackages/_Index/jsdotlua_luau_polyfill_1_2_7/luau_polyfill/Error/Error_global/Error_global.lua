--// ReplicatedStorage.SharedPackages._Index.jsdotlua_luau-polyfill@1.2.7.luau-polyfill.Error.Error.global (ModuleScript)

require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.__tostring(p2)
    local v3 = v_u_1
    return getmetatable(v3).__tostring(p2)
end
function v_u_1.new(p4)
    local v5 = v_u_1
    local v6 = setmetatable({
        ["name"] = "Error",
        ["message"] = p4 or ""
    }, v5)
    v_u_1.__captureStackTrace(v6, 4)
    return v6
end
function v_u_1.captureStackTrace(p7, p8)
    v_u_1.__captureStackTrace(p7, 3, p8)
end
function v_u_1.__captureStackTrace(p9, p10, p11)
    if typeof(p11) == "function" then
        local v12 = debug.traceback(nil, p10)
        local v13 = debug.info(p11, "n")
        local v14 = debug.info(p11, "s")
        local v15 = string.gsub(v14, "([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1") .. ":%d* function " .. v13
        local v16 = string.find(v12, v15)
        local v17
        if v16 == nil then
            v17 = nil
        else
            local v18
            v18, v17 = string.find(v12, "\n", v16 + 1)
        end
        if v17 ~= nil then
            local v19 = v17 + 1
            v12 = string.sub(v12, v19)
        end
        p9.__stack = v12
    else
        p9.__stack = debug.traceback(nil, p10)
    end
    v_u_1.__recalculateStacktrace(p9)
end
function v_u_1.__recalculateStacktrace(p20)
    local v21 = p20.message
    p20.stack = ((p20.name or "Error") .. ((v21 == nil or v21 == "") and "" or ": " .. v21)) .. "\n" .. (not p20.__stack and "" or p20.__stack)
end
return setmetatable(v_u_1, {
    ["__call"] = function(_, ...)
        local v22 = v_u_1
        local v23 = setmetatable({
            ["name"] = "Error",
            ["message"] = ... or ""
        }, v22)
        v_u_1.__captureStackTrace(v23, 4)
        return v23
    end,
    ["__tostring"] = function(p24)
        if p24.name == nil then
            return tostring("Error")
        end
        if not p24.message or p24.message == "" then
            local v25 = p24.name
            return tostring(v25)
        end
        local v26 = string.format
        local v27 = p24.name
        local v28 = tostring(v27)
        local v29 = p24.message
        return v26("%s: %s", v28, (tostring(v29)))
    end
})