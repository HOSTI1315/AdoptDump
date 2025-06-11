--// ReplicatedStorage.SharedModules.DurationHelper (ModuleScript)

local v1 = {}
local function v_u_4(p2, p3)
    return (p2 == 1 and "%d %s" or "%d %ss"):format(p2, p3)
end
local function v_u_13(p5)
    local v6 = math.abs(p5)
    local v7 = {}
    local v8 = v6 / 604800
    v7.weeks = math.floor(v8)
    local v9 = v6 % 604800 / 86400
    v7.days = math.floor(v9)
    local v10 = v6 % 86400 / 3600
    v7.hours = math.floor(v10)
    local v11 = v6 % 3600 / 60
    v7.minutes = math.floor(v11)
    local v12 = v6 % 60
    v7.seconds = math.floor(v12)
    return v7
end
function v1.duration_to_human_readable(p14)
    local v15 = v_u_13(p14)
    local v16 = {}
    if v15.weeks > 0 then
        local v17 = v_u_4
        local v18 = v15.weeks
        table.insert(v16, v17(v18, "week"))
    end
    if v15.weeks > 0 or v15.days > 0 then
        local v19 = v_u_4
        local v20 = v15.days
        table.insert(v16, v19(v20, "day"))
    end
    local v21 = v15.hours
    local v22 = v15.minutes
    local v23 = v15.seconds
    table.insert(v16, ("%d:%02d:%02d"):format(v21, v22, v23))
    return table.concat(v16, " ")
end
function v1.duration_to_human_readable_short(p24)
    local v25 = v_u_13(p24)
    if v25.weeks > 0 then
        return v_u_4(v25.weeks, "week")
    elseif v25.days > 0 then
        return v_u_4(v25.days, "day")
    elseif v25.hours > 0 then
        return v_u_4(v25.hours, "hour")
    elseif v25.minutes > 0 then
        return v_u_4(v25.minutes, "minute")
    else
        return v_u_4(v25.seconds, "second")
    end
end
return v1