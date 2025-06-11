--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.ReactComponentStackFrame (ModuleScript)

require(script.Parent:WaitForChild("ReactElementType"))
require(script.Parent:WaitForChild("flowtypes.roblox"))
local v1 = require(script.Parent:WaitForChild("ReactSymbols"))
local v_u_2 = v1.REACT_SUSPENSE_TYPE
local v_u_3 = v1.REACT_SUSPENSE_LIST_TYPE
local v_u_4 = v1.REACT_FORWARD_REF_TYPE
local v_u_5 = v1.REACT_MEMO_TYPE
local v_u_6 = v1.REACT_BLOCK_TYPE
local v_u_7 = v1.REACT_LAZY_TYPE
local v8 = require(script.Parent:WaitForChild("ConsolePatchingDev.roblox"))
local v_u_9 = v8.disableLogs
local v_u_10 = v8.reenableLogs
local v_u_11 = require(script.Parent:WaitForChild("ReactSharedInternals")).ReactCurrentDispatcher
local v_u_12 = nil
local function v_u_17(p13, p14, p15)
    local v16
    if _G.__DEV__ and p15 then
        if type(p15) == "function" then
            v16 = debug.info(p15, "n")
        elseif type(p15) == "table" then
            v16 = tostring(p15)
        else
            v16 = nil
        end
    else
        v16 = nil
    end
    return v_u_12(p13, p14, v16)
end
local v_u_18 = false
local v_u_19
if _G.__DEV__ then
    v_u_19 = setmetatable({}, {
        ["__mode"] = "k"
    })
else
    v_u_19 = nil
end
local function v38(p_u_20, p_u_21)
    if not p_u_20 or v_u_18 then
        return ""
    end
    if _G.__DEV__ then
        local v22 = v_u_19[p_u_20]
        if v22 ~= nil then
            return v22
        end
    end
    local v_u_23 = nil
    v_u_18 = true
    local v24
    if _G.__DEV__ then
        v24 = v_u_11.current
        v_u_11.current = nil
        v_u_9()
    else
        v24 = nil
    end
    local v_u_25 = nil
    local _, v29 = xpcall(function()
        if not p_u_21 then
            local _, v27 = pcall(function()
                v_u_25 = debug.traceback()
                local v26 = {
                    ["stack"] = v_u_25
                }
                error(v26)
            end)
            v_u_23 = v27
            p_u_20()
        end
    end, function(p28)
        return {
            ["message"] = p28,
            ["stack"] = v_u_25
        }
    end)
    local v30 = nil
    if v29 and v_u_23 then
        local v31 = v29.stack
        if type(v31) == "string" then
            local v32 = string.split(v29.stack, "\n")
            local v33 = string.split(v_u_23.stack, "\n")
            local v34 = #v32 - 1
            local v35 = #v33 - 1
            while v34 >= 2 and (v35 >= 0 and v32[v34] ~= v33[v35]) do
                v35 = v35 - 1
            end
            while v34 >= 3 and v35 >= 1 do
                v34 = v34 - 1
                v35 = v35 - 1
                if v32[v34] ~= v33[v35] then
                    if v34 == 1 and v35 == 1 then
                        break
                    end
                    while true do
                        v34 = v34 - 1
                        v35 = v35 - 1
                        if v35 < 0 or v32[v34] ~= v33[v35] then
                            v30 = "\n" .. "    in " .. v32[v34]
                            if _G.__DEV__ then
                                v_u_19[p_u_20] = v30
                            end
                        end
                        if v34 < 3 or v35 < 1 then
                            break
                        end
                    end
                end
            end
        end
    end
    v_u_18 = false
    if _G.__DEV__ then
        v_u_11.current = v24
        v_u_10()
    end
    if v30 ~= nil then
        return v30
    end
    local v36
    if type(p_u_20) == "function" then
        v36 = debug.info(p_u_20, "n")
    else
        v36 = type(p_u_20) ~= "table" and "" or tostring(p_u_20)
    end
    local v37
    if v36 == nil or v36 == "" then
        v37 = ""
    else
        local _ = _G.__DEV__
        v37 = v_u_12(v36, nil, nil)
    end
    if _G.__DEV__ then
        v_u_19[p_u_20] = v37
    end
    return v37
end
v_u_12 = function(p39, p40, p41)
    local v42 = ""
    if _G.__DEV__ and p40 then
        local v43 = p40.fileName
        local v44 = string.gsub(v43, "^(.*)[\\/]", "")
        if string.match(v44, "^init%.") then
            local v45 = string.match(v43, "^(.*)[\\/]")
            if v45 and #v45 ~= 0 then
                v44 = string.gsub(v45, "^(.*)[\\/]", "") .. "/" .. v44
            end
        end
        v42 = " (at " .. v44 .. ":" .. p40.lineNumber .. ")"
    elseif p41 then
        v42 = " (created by " .. p41 .. ")"
    end
    return "\n    in " .. (p39 or "Unknown") .. v42
end
local function v_u_51(p46, p47, p48)
    local v49 = tostring(p46)
    local v50
    if _G.__DEV__ and p48 then
        if type(p48) == "function" then
            v50 = debug.info(p48, "n")
        elseif type(p48) == "table" then
            v50 = tostring(p48)
        else
            v50 = nil
        end
    else
        v50 = nil
    end
    return v_u_12(v49, p47, v50)
end
local function v_u_57(p52, p53, p54)
    if not p52 then
        return ""
    end
    local v55
    if type(p52) == "function" then
        v55 = debug.info(p52, "n")
    else
        v55 = tostring(p52)
    end
    local v56
    if _G.__DEV__ and p54 then
        if type(p54) == "function" then
            v56 = debug.info(p54, "n")
        elseif type(p54) == "table" then
            v56 = tostring(p54)
        else
            v56 = nil
        end
    else
        v56 = nil
    end
    return v_u_12(v55, p53, v56)
end
local function v_u_67(p58, p_u_59, p_u_60)
    if not _G.__DEV__ then
        return ""
    end
    if p58 == nil then
        return ""
    end
    if type(p58) == "table" then
        local v61 = p58.__ctor
        if type(v61) == "function" then
            return v_u_51(p58, p_u_59, p_u_60)
        end
    end
    if type(p58) == "function" then
        return v_u_57(p58, p_u_59, p_u_60)
    end
    if type(p58) == "string" then
        return v_u_17(p58, p_u_59, p_u_60)
    end
    if p58 == v_u_2 then
        return v_u_17("Suspense", p_u_59, p_u_60)
    end
    if p58 == v_u_3 then
        return v_u_17("SuspenseList", p_u_59, p_u_60)
    end
    if type(p58) == "table" then
        local v62 = p58["$$typeof"]
        if v62 == v_u_4 then
            return v_u_57(p58.render, p_u_59, p_u_60)
        end
        if v62 == v_u_5 then
            return v_u_67(p58.type, p_u_59, p_u_60)
        end
        if v62 == v_u_6 then
            return v_u_57(p58._render, p_u_59, p_u_60)
        end
        if v62 == v_u_7 then
            local v_u_63 = p58._payload
            local v_u_64 = p58._init
            local v65, v66 = pcall(function()
                v_u_67(v_u_64(v_u_63), p_u_59, p_u_60)
            end)
            if v65 then
                return v66
            end
        end
    end
    return ""
end
return {
    ["describeComponentFrame"] = v_u_12,
    ["describeBuiltInComponentFrame"] = v_u_17,
    ["describeNativeComponentFrame"] = v38,
    ["describeClassComponentFrame"] = v_u_51,
    ["describeFunctionComponentFrame"] = v_u_57,
    ["describeUnknownElementTypeFrameInDEV"] = v_u_67
}