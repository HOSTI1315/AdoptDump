--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.inspect (ModuleScript)

local v_u_1 = game:GetService("HttpService")
local v_u_2 = require(script.Parent:WaitForChild("Array"):WaitForChild("isArray"))
require(script.Parent.Parent:WaitForChild("es7-types"))
local v_u_3 = nil
local v_u_4 = nil
local v_u_5 = nil
local v_u_6 = nil
local v_u_7 = nil
local function v12(p8, p9)
    local v10 = p9 or {
        ["depth"] = 2
    }
    local v11 = v10.depth or 2
    v10.depth = v11 < 0 and 2 or v11
    return v_u_3(p8, {}, v10)
end
local function v_u_17(p13, p14)
    local v15 = type(p13)
    local v16 = type(p14)
    if v15 == v16 and (v15 == "number" or v15 == "string") then
        return p13 < p14
    else
        return v15 < v16
    end
end
local function v_u_26(p18)
    local v19 = 1
    local v20 = rawget(p18, v19)
    local v21 = 0
    local v22 = {}
    while v20 ~= nil do
        v19 = v19 + 1
        v20 = rawget(p18, v19)
    end
    local v23 = v19 - 1
    for v24, _ in next, p18 do
        local v25
        if type(v24) == "number" and (v24 <= v23 and v24 >= 1) then
            v25 = math.floor(v24) == v24
        else
            v25 = false
        end
        if not v25 then
            v21 = v21 + 1
            v22[v21] = v24
        end
    end
    table.sort(v22, v_u_17)
    return v22, v21, v23
end
v_u_3 = function(p27, p28, p29)
    local v30 = typeof(p27)
    if v30 == "string" then
        return v_u_1:JSONEncode(p27)
    elseif v30 == "number" then
        return p27 ~= p27 and "NaN" or (p27 == (1 / 0) and "Infinity" or (p27 == (-1 / 0) and "-Infinity" or tostring(p27)))
    elseif v30 == "function" then
        local v31 = "[function"
        local v32 = debug.info(p27, "n")
        if v32 ~= nil and v32 ~= "" then
            v31 = v31 .. " " .. v32
        end
        return v31 .. "]"
    elseif v30 == "table" then
        return v_u_4(p27, p28, p29)
    else
        return tostring(p27)
    end
end
v_u_4 = function(p33, p34, p35)
    if table.find(p34, p33) ~= nil then
        return "[Circular]"
    end
    local v36 = { unpack(p34) }
    table.insert(v36, p33)
    local v37 = p33.toJSON
    if typeof(v37) == "function" then
        local v38 = p33:toJSON(p33)
        if v38 ~= p33 then
            if typeof(v38) == "string" then
                return v38
            else
                return v_u_3(v38, v36, p35)
            end
        end
    elseif v_u_2(p33) then
        return v_u_5(p33, v36, p35)
    end
    return v_u_6(p33, v36, p35)
end
v_u_6 = function(p39, p40, p41)
    local v42 = ""
    local v43 = getmetatable(p39)
    if v43 and rawget(v43, "__tostring") then
        return tostring(p39)
    end
    local v44, v45, v46 = v_u_26(p39)
    if v46 == 0 and v45 == 0 then
        return v42 .. "{}"
    end
    if #p40 > p41.depth then
        return v42 .. "[" .. v_u_7(p39) .. "]"
    end
    local v47 = {}
    for v48 = 1, v46 do
        local v49 = v_u_3(p39[v48], p40, p41)
        table.insert(v47, v49)
    end
    for v50 = 1, v45 do
        local v51 = v44[v50]
        local v52 = v51 .. ": " .. v_u_3(p39[v51], p40, p41)
        table.insert(v47, v52)
    end
    return v42 .. "{ " .. table.concat(v47, ", ") .. " }"
end
v_u_5 = function(p53, p54, p55)
    local v56 = #p53
    if v56 == 0 then
        return "[]"
    end
    if #p54 > p55.depth then
        return "[Array]"
    end
    local v57 = math.min(10, v56)
    local v58 = v56 - v57
    local v59 = {}
    for v60 = 1, v57 do
        v59[v60] = v_u_3(p53[v60], p54, p55)
    end
    if v58 == 1 then
        table.insert(v59, "... 1 more item")
    elseif v58 > 1 then
        local v61 = tostring(v58)
        table.insert(v59, ("... %s more items"):format(v61))
    end
    return "[" .. table.concat(v59, ", ") .. "]"
end
v_u_7 = function(_)
    return "Object"
end
return v12