--// ReplicatedStorage.CmdrClient.Types.date (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("package:t")
local v_u_2 = {
    31,
    28,
    31,
    30,
    31,
    30,
    31,
    31,
    30,
    31,
    30,
    31
}
local v_u_3 = v1.strictInterface({
    ["year"] = v1.every(v1.numberMin(0), v1.integer),
    ["month"] = v1.every(v1.numberConstrained(1, 12), v1.integer),
    ["day"] = v1.every(v1.numberConstrained(1, 31), v1.integer)
})
return function(p4)
    p4:RegisterType("date", {
        ["DisplayName"] = "YYYY-MM-DD",
        ["Transform"] = function(p5)
            local v6, v7, v8 = unpack(p5:split("-"))
            return {
                ["year"] = tonumber(v6 or -1),
                ["month"] = tonumber(v7 or -1),
                ["day"] = tonumber(v8 or -1)
            }
        end,
        ["Validate"] = function(p9)
            if not v_u_3(p9) then
                return false
            end
            local v10 = v_u_2[p9.month]
            if p9.month == 2 then
                local v11 = p9.year
                local v12
                if v11 % 4 == 0 then
                    v12 = v11 % 100 ~= 0 and true or v11 % 400 == 0
                else
                    v12 = false
                end
                v10 = v12 and 29 or v10
            end
            return v10 >= p9.day
        end
    })
end