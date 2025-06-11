--// ReplicatedStorage.SharedModules.Time (ModuleScript)

return {
    ["format_seconds"] = function(p1, p2)
        local v3 = p2 == nil and true or p2
        local v4 = tonumber(p1)
        if v4 <= 0 then
            return "00:00:00"
        else
            local v5 = string.format
            local v6 = v4 / 3600
            local v7 = v5("%02.f", (math.floor(v6)))
            local v8 = string.format
            local v9 = v4 / 60 - v7 * 60
            local v10 = v8("%02.f", (math.floor(v9)))
            local v11 = string.format
            local v12 = v4 - v7 * 3600 - v10 * 60
            local v13 = v11("%02.f", (math.floor(v12)))
            if v3 then
                return v7 .. ":" .. v10 .. ":" .. v13
            else
                return v10 .. ":" .. v13
            end
        end
    end
}