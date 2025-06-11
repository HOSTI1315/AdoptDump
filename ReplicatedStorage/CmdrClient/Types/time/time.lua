--// ReplicatedStorage.CmdrClient.Types.time (ModuleScript)

local v_u_1 = {
    1,
    60,
    3600,
    86400
}
return function(p2)
    p2:RegisterType("time", {
        ["DisplayName"] = "Time",
        ["Transform"] = function(p3)
            local v4 = p3:split(":")
            for v5, v6 in ipairs(v4) do
                local v7 = tonumber(v6) or false
                if v7 and (v7 ~= v7 or (v7 == (1 / 0) or v7 == (-1 / 0))) then
                    v7 = false
                end
                v4[v5] = v7
            end
            return v4
        end,
        ["Validate"] = function(p8)
            if #p8 > 4 then
                return false, "A time should have up to four parts: days:hours:minutes:seconds"
            end
            for _, v9 in ipairs(p8) do
                if not v9 then
                    return false, "A time should be made up of numbers"
                end
            end
            return true
        end,
        ["Parse"] = function(p10)
            local v11 = 0
            for v12 = 1, #p10 do
                v11 = v11 + p10[#p10 + 1 - v12] * v_u_1[v12]
            end
            return v11
        end
    })
end