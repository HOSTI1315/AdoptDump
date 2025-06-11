--// ReplicatedStorage.SharedPackages._Index.jsdotlua_collections@1.2.7.collections.Map.Map (ModuleScript)

local v_u_1 = _G.__DEV__
local v_u_2 = require(script.Parent.Parent:WaitForChild("Array"):WaitForChild("forEach"))
local v_u_3 = require(script.Parent.Parent:WaitForChild("Array"):WaitForChild("map"))
local v_u_4 = require(script.Parent.Parent:WaitForChild("Array"):WaitForChild("isArray"))
local v_u_5 = require(script.Parent.Parent.Parent:WaitForChild("instance-of"))
require(script.Parent.Parent.Parent:WaitForChild("es7-types"))
local v_u_50 = {
    ["new"] = function(p6)
        local v7 = nil
        local v8 = nil
        if p6 == nil then
            v7 = {}
            v8 = {}
        elseif v_u_4(p6) then
            if v_u_1 and #p6 > 0 then
                local v9 = p6[1]
                if typeof(v9) ~= "table" then
                    local v10 = error
                    local v11 = p6[1]
                    v10("Value `" .. typeof(v11) .. "` is not an entry object.\n Cannot create Map from {K, V} form, it must be { {K, V}... }")
                end
            end
            v7 = table.create(#p6)
            v8 = {}
            for _, v12 in p6 do
                local v13 = v12[1]
                if v_u_1 and v13 == nil then
                    error("cannot create Map from a table that isn\'t an array.")
                end
                local v14 = v12[2]
                if v8[v13] == nil then
                    table.insert(v7, v13)
                end
                v8[v13] = v14
            end
        elseif v_u_5(p6, v_u_50) then
            v7 = table.clone(p6._array)
            v8 = table.clone(p6._map)
        else
            error(("`%s` `%s` is not iterable, cannot make Map using it"):format(typeof(p6), (tostring(p6))))
        end
        local v15 = {
            ["size"] = #v7,
            ["_map"] = v8,
            ["_array"] = v7
        }
        local v16 = v_u_50
        return setmetatable(v15, v16)
    end,
    ["set"] = function(p17, p18, p19)
        if p17._map[p18] == nil then
            p17.size = p17.size + 1
            local v20 = p17._array
            table.insert(v20, p18)
        end
        p17._map[p18] = p19
        return p17
    end,
    ["get"] = function(p21, p22)
        return p21._map[p22]
    end,
    ["clear"] = function(p23)
        local v24 = table
        p23.size = 0
        v24.clear(p23._map)
        v24.clear(p23._array)
    end,
    ["delete"] = function(p25, p26)
        if p25._map[p26] == nil then
            return false
        end
        p25.size = p25.size - 1
        p25._map[p26] = nil
        local v27 = table.find(p25._array, p26)
        if v27 then
            table.remove(p25._array, v27)
        end
        return true
    end,
    ["forEach"] = function(p_u_28, p_u_29, p_u_30)
        if v_u_1 and typeof(p_u_29) ~= "function" then
            error("callback is not a function")
        end
        v_u_2(p_u_28._array, function(p31)
            local v32 = p_u_28._map[p31]
            if p_u_30 == nil then
                p_u_29(v32, p31, p_u_28)
            else
                p_u_29(p_u_30, v32, p31, p_u_28)
            end
        end)
    end,
    ["has"] = function(p33, p34)
        return p33._map[p34] ~= nil
    end,
    ["keys"] = function(p35)
        return p35._array
    end,
    ["values"] = function(p_u_36)
        return v_u_3(p_u_36._array, function(p37)
            return p_u_36._map[p37]
        end)
    end,
    ["entries"] = function(p_u_38)
        return v_u_3(p_u_38._array, function(p39)
            return { p39, p_u_38._map[p39] }
        end)
    end,
    ["ipairs"] = function(p40)
        if v_u_1 then
            warn(debug.traceback("`for _,_ in myMap:ipairs() do` is deprecated and will be removed in a future release, please use `for _,_ in myMap do` instead\n", 2))
        end
        return ipairs(p40:entries())
    end,
    ["__iter"] = function(p41)
        return next, p41:entries()
    end,
    ["__index"] = function(p42, p43)
        local v44 = v_u_50
        local v45 = rawget(v44, p43)
        if v45 ~= nil then
            return v45
        end
        if v_u_1 then
            local v46 = rawget(p42, "_map")
            assert(v46, "Map has been corrupted, and is missing private state! Did you accidentally call table.clear() instead of map:clear()?")
        end
        return v_u_50.get(p42, p43)
    end,
    ["__newindex"] = function(p47, p48, p49)
        p47:set(p48, p49)
    end
}
return v_u_50