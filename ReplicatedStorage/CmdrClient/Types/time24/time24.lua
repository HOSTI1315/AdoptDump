--// ReplicatedStorage.CmdrClient.Types.time24 (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load("package:t")
local v_u_2 = v1.strictInterface({
    ["hour"] = v1.every(v1.numberConstrained(0, 23), v1.integer),
    ["minute"] = v1.every(v1.numberConstrained(0, 59), v1.integer),
    ["second"] = v1.every(v1.numberConstrained(0, 59), v1.integer)
})
return function(p3)
    p3:RegisterType("time24", {
        ["DisplayName"] = "HH:MM:SS",
        ["Transform"] = function(p4)
            local v5, v6, v7 = unpack(p4:split(":"))
            return {
                ["hour"] = tonumber(v5 or -1),
                ["minute"] = tonumber(v6 or -1),
                ["second"] = tonumber(v7 or -1)
            }
        end,
        ["Validate"] = function(p8)
            return v_u_2(p8)
        end
    })
end