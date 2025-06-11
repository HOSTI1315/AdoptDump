--// ReplicatedStorage.SharedModules.Number (ModuleScript)

local v_u_25 = {
    ["round"] = function(p1, p2)
        local v3 = 10 ^ (p2 or 0)
        local v4
        if p1 < 0 then
            p1 = -p1
            v4 = true
        else
            v4 = false
        end
        local v5 = p1 * v3 + 0.5
        return (v4 and -1 or 1) * math.floor(v5) / v3
    end,
    ["round_up"] = function(p6, p7)
        local v8 = 10 ^ (p7 or 0)
        local v9
        if p6 < 0 then
            p6 = -p6
            v9 = true
        else
            v9 = false
        end
        local v10 = p6 * v8
        return (v9 and -1 or 1) * math.ceil(v10) / v8
    end,
    ["roll_over"] = function(p11, p12, p13)
        if p13 < p11 then
            return p12 + (p11 - p13) - 1
        elseif p11 < p12 then
            return p13 - (p12 - p11) + 1
        else
            return p11
        end
    end,
    ["mean"] = function(p14)
        local v15 = 0
        local v16 = 0
        for _, v17 in pairs(p14) do
            if type(v17) == "number" then
                v15 = v15 + v17
                v16 = v16 + 1
            end
        end
        return v15 / v16
    end,
    ["standard_deviation"] = function(p18)
        local v19 = v_u_25.mean(p18)
        local v20 = 0
        local v21 = 0
        for _, v22 in pairs(p18) do
            if type(v22) == "number" then
                local v23 = v22 - v19
                v20 = v20 + v23 * v23
                v21 = v21 + 1
            end
        end
        local v24 = v20 / (v21 - 1)
        return math.sqrt(v24)
    end
}
return v_u_25