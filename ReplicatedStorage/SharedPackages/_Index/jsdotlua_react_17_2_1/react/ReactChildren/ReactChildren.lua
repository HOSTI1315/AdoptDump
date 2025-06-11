--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react@17.2.1.react.ReactChildren (ModuleScript)

require(script.Parent.Parent:WaitForChild("shared"))
local v_u_1 = require(script.Parent.Parent:WaitForChild("shared")).invariant
local v2 = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols
local v_u_3 = v2.getIteratorFn
local v_u_4 = v2.REACT_ELEMENT_TYPE
local v_u_5 = v2.REACT_PORTAL_TYPE
local v_u_6 = require(script.Parent.Parent:WaitForChild("luau-polyfill")).Array
local v7 = require(script.Parent:WaitForChild("ReactElement"))
local v_u_8 = v7.isValidElement
local v_u_9 = v7.cloneAndReplaceKey
local function v_u_44(p10, p11, p12, p13, p14)
    local v15 = typeof(p10)
    if v15 == "nil" or (v15 == "boolean" or v15 == "userdata") then
        p10 = nil
    end
    local v16 = false
    if p10 == nil or (v15 == "string" or v15 == "number") then
        v16 = true
    elseif v15 == "table" then
        local v17 = p10["$$typeof"]
        v16 = (v17 == v_u_4 or v17 == v_u_5) and true or v16
    end
    if v16 then
        local v18 = p14(p10)
        if p13 == "" then
            local v19 = "."
            local v20
            if typeof(p10) == "table" and (p10 ~= nil and p10.key ~= nil) then
                local v21 = p10.key
                local v22 = tostring(v21)
                local v23 = string.gsub(v22, "=", "=0")
                v20 = "$" .. string.gsub(v23, ":", "=2")
            else
                v20 = tostring(1)
            end
            p13 = v19 .. v20
        end
        if v_u_6.isArray(v18) then
            v_u_44(v18, p11, p13 == nil and "" or p13 .. "/", "", function(p24)
                return p24
            end)
        elseif v18 ~= nil then
            if v_u_8(v18) then
                local v25 = v18.key
                v18 = v_u_9(v18, p12 .. ((not v25 or p10 and p10.key == v25) and "" or tostring(v25) .. "/") .. p13)
            end
            table.insert(p11, v18)
        end
        return 1
    end
    local v26 = 0
    local v27 = p13 == "" and "." or p13 .. ":"
    if v_u_6.isArray(p10) then
        for v28 = 1, #p10 do
            local v29 = p10[v28]
            local v30
            if typeof(v29) == "table" and (v29 ~= nil and v29.key ~= nil) then
                local v31 = v29.key
                local v32 = tostring(v31)
                local v33 = string.gsub(v32, "=", "=0")
                v30 = "$" .. string.gsub(v33, ":", "=2")
            else
                v30 = tostring(v28)
            end
            v26 = v26 + v_u_44(v29, p11, p12, v27 .. v30, p14)
        end
        return v26
    end
    local v34 = v_u_3(p10)
    if typeof(v34) == "function" then
        local v35 = v34(p10)
        local v36 = v35.next()
        local v37 = 1
        while not v36.done do
            local v38 = v36.value
            local v39
            if typeof(v38) == "table" and (v38 ~= nil and v38.key ~= nil) then
                local v40 = v38.key
                local v41 = tostring(v40)
                local v42 = string.gsub(v41, "=", "=0")
                v39 = "$" .. string.gsub(v42, ":", "=2")
            else
                v39 = tostring(v37)
            end
            local v43 = v27 .. v39
            v37 = v37 + 1
            v26 = v26 + v_u_44(v38, p11, p12, v43, p14)
            v36 = v35.next()
        end
    end
    return v26
end
local function v_u_51(p45, p_u_46, _)
    if p45 == nil then
        return nil
    end
    local v47 = {}
    local v_u_48 = 1
    v_u_44(p45, v47, "", "", function(p49)
        local v50 = p_u_46(p49, v_u_48)
        v_u_48 = v_u_48 + 1
        return v50
    end)
    return v47
end
return {
    ["forEach"] = function(p52, p_u_53, p54)
        v_u_51(p52, function(...)
            p_u_53(...)
        end, p54)
    end,
    ["map"] = v_u_51,
    ["count"] = function(p55)
        local v_u_56 = 0
        v_u_51(p55, function()
            v_u_56 = v_u_56 + 1
        end)
        return v_u_56
    end,
    ["only"] = function(p57)
        v_u_1(v_u_8(p57), "React.Children.only expected to receive a single React element child.")
        return p57
    end,
    ["toArray"] = function(p58)
        return v_u_51(p58, function(p59)
            return p59
        end) or {}
    end
}