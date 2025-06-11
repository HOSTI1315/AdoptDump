--// ReplicatedStorage.SharedModules.LocalizationCommon (ModuleScript)

local v_u_15 = {
    ["normalize_locale_roblox"] = function(p1)
        local v2, v3 = p1:gsub("%-", "_"):match("^(%w+)_?(%w*)$")
        if v3 == "" then
            return v2:lower()
        else
            return v2:lower() .. "-" .. v3:lower()
        end
    end,
    ["normalize_values_roblox"] = function(p4)
        local v5 = {}
        for v6, v7 in pairs(p4) do
            v5[v_u_15.normalize_locale_roblox(v6)] = v7
        end
        return v5
    end,
    ["locale_as_underscore_lowercase"] = function(p8)
        return p8:gsub("%-", "_"):lower()
    end,
    ["get_value_for_locale"] = function(p9, p10)
        if p9[p10] then
            return p9[p10], p10
        end
        local v11 = p10:match("^(%w+)")
        if v11 == nil then
            return nil, nil
        end
        if p9[v11] then
            return p9[v11], v11
        end
        for v12, v13 in p9 do
            local v14 = #v11
            if string.sub(v12, 1, v14) == v11 then
                return v13, v12
            end
        end
        return nil, nil
    end
}
return v_u_15