--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Set (ModuleScript)

local v_u_1 = _G.__DEV__
local v_u_2 = require(script.Parent:WaitForChild("inspect"))
local v_u_3 = require(script.Parent:WaitForChild("Array"):WaitForChild("isArray"))
local v_u_4 = require(script.Parent:WaitForChild("Array"):WaitForChild("forEach"))
local v_u_5 = require(script.Parent:WaitForChild("Array"):WaitForChild("from"):WaitForChild("fromString"))
require(script.Parent.Parent:WaitForChild("es7-types"))
local v_u_10 = {
    ["__iter"] = function(p6)
        return next, p6._array
    end,
    ["__tostring"] = function(p7)
        local v8 = "Set "
        if #p7._array > 0 then
            local v9 = #p7._array
            v8 = v8 .. "(" .. tostring(v9) .. ") "
        end
        return v8 .. v_u_2(p7._array)
    end
}
v_u_10.__index = v_u_10
function v_u_10.new(p11)
    local v12 = {}
    local v13
    if p11 == nil then
        v13 = {}
    else
        local v14 = nil
        if typeof(p11) == "table" then
            if v_u_3(p11) then
                v14 = table.clone(p11)
            else
                local v15 = getmetatable(p11)
                if v15 and rawget(v15, "__iter") then
                    v14 = p11
                elseif v_u_1 then
                    error("cannot create array from an object-like table")
                end
            end
        elseif typeof(p11) == "string" then
            v14 = v_u_5(p11)
        else
            error(("cannot create array from value of type `%s`"):format((typeof(p11))))
        end
        if v14 then
            v13 = table.create(#v14)
            for _, v16 in v14 do
                if not v12[v16] then
                    v12[v16] = true
                    table.insert(v13, v16)
                end
            end
        else
            v13 = {}
        end
    end
    local v17 = {
        ["size"] = #v13,
        ["_map"] = v12,
        ["_array"] = v13
    }
    local v18 = v_u_10
    return setmetatable(v17, v18)
end
function v_u_10.add(p19, p20)
    if not p19._map[p20] then
        p19.size = p19.size + 1
        p19._map[p20] = true
        local v21 = p19._array
        table.insert(v21, p20)
    end
    return p19
end
function v_u_10.clear(p22)
    p22.size = 0
    table.clear(p22._map)
    table.clear(p22._array)
end
function v_u_10.delete(p23, p24)
    if not p23._map[p24] then
        return false
    end
    p23.size = p23.size - 1
    p23._map[p24] = nil
    local v25 = table.find(p23._array, p24)
    if v25 then
        table.remove(p23._array, v25)
    end
    return true
end
function v_u_10.forEach(p_u_26, p_u_27, p_u_28)
    if typeof(p_u_27) ~= "function" then
        error("callback is not a function")
    end
    v_u_4(p_u_26._array, function(p29)
        if p_u_28 == nil then
            p_u_27(p29, p29, p_u_26)
        else
            p_u_27(p_u_28, p29, p29, p_u_26)
        end
    end)
end
function v_u_10.has(p30, p31)
    return p30._map[p31] ~= nil
end
function v_u_10.ipairs(p32)
    if v_u_1 then
        warn(debug.traceback("`for _,_ in mySet:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in mySet do` instead\n", 2))
    end
    return ipairs(p32._array)
end
return v_u_10