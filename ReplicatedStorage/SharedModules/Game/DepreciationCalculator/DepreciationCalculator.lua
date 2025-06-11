--// ReplicatedStorage.SharedModules.Game.DepreciationCalculator (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v2 = v_u_1("TimeZoneHelper")
local v_u_3 = v_u_1("FurnitureDB")
local v_u_4 = game:GetService("RunService")
local v_u_5 = v2.from_timezone("UTC", {
    ["year"] = 2019,
    ["month"] = 8,
    ["day"] = 9
})
local v_u_21 = {
    ["was_furniture_created_this_session"] = function(p6, p7)
        local v8 = v_u_3[p7.id]
        assert(v8, "No entry found for furniture")
        local v9
        if v_u_4:IsServer() then
            local v10 = v_u_1("DataM").get_store(p6)
            v9 = v10 and v10:get("sessions_played") or -1
        else
            local v11 = v_u_1("ClientData")
            local v12 = v_u_1("HouseClient").get_current_house_owner()
            v9 = v12 and v11.get_server(v12, "sessions_played") or -1
        end
        return p7.session_added == v9
    end,
    ["calculate_furniture_depreciation"] = function(p13, p14)
        local v15 = v_u_3[p14.id]
        assert(v15, "No entry found for furniture")
        if p14.was_free then
            return 0
        end
        if p14.time_added <= 0 then
            return 0
        end
        local v16 = v15.cost or 0
        if v15.kind == "moneytree" and p14.time_added < v_u_5 then
            return v16
        end
        local v17 = os.time() - p14.time_added
        if v_u_21.was_furniture_created_this_session(p13, p14) or v17 < 1800 then
            return v16 * (v15.immediate_depreciation or 1)
        end
        local v18 = v17 / 2592000
        local v19 = (1 - math.clamp(v18, 0, 1)) * 0.75
        local v20 = v16 * math.clamp(v19, 0.1, 1)
        return math.floor(v20)
    end
}
return v_u_21