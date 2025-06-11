--// ReplicatedStorage.SharedModules.FormatHelper (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load("GrammarUtil")
local v_u_23 = {
    ["add_number_commas"] = function(p2)
        local _, _, v3, v4, v5 = tostring(p2):find("([-]?)(%d+)([.]?%d*)")
        return v3 .. v4:reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "") .. v5
    end,
    ["get_time_breakdown"] = function(p6)
        if p6 < 0 then
            warn("Negative seconds passed to get_time_breakdown. This may be a programming error.")
        end
        local v7 = p6 / 86400
        local v8 = math.floor(v7)
        local v9 = (p6 - v8 * 86400) / 3600
        local v10 = math.floor(v9)
        local v11 = (p6 - v8 * 86400 - v10 * 3600) / 60
        local v12 = math.floor(v11)
        local v13 = p6 - v8 * 86400 - v10 * 3600 - v12 * 60
        return {
            ["days"] = v8,
            ["hours"] = v10,
            ["minutes"] = v12,
            ["seconds"] = math.floor(v13),
            ["milliseconds"] = p6 - math.floor(p6)
        }
    end,
    ["verbose_format_time"] = function(p14)
        local v15 = v_u_23.get_time_breakdown(p14)
        local v16 = v15.days
        local v17 = v15.hours
        local v18 = v15.minutes
        local v19 = v15.seconds
        if v16 > 0 then
            return string.format("%d %s, %d %s, %d %s", v16, v_u_1.get_plural_or_singular(v16, "Days", "Day"), v17, v_u_1.get_plural_or_singular(v17, "Hours", "Hour"), v18, v_u_1.get_plural_or_singular(v18, "Mins", "Min"))
        elseif v17 > 0 then
            return string.format("%d %s, %d %s", v17, v_u_1.get_plural_or_singular(v17, "Hours", "Hour"), v18, v_u_1.get_plural_or_singular(v18, "Mins", "Min"))
        else
            return string.format("%02d", v18) .. ":" .. string.format("%02d", v19)
        end
    end,
    ["format_countdown"] = function(p20, p21, p22)
        return ("%*:%*:%*"):format(p20 > 9 and tostring(p20) or "0" .. tostring(p20), p21 > 9 and tostring(p21) or "0" .. tostring(p21), p22 > 9 and tostring(p22) or "0" .. tostring(p22))
    end
}
return v_u_23