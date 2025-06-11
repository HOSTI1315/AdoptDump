--// ReplicatedStorage.ClientModules.Game.InteriorHelpers.LiveOpsShopSignHelper (ModuleScript)

local v1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v1("FormatHelper")
local v_u_3 = v1("GrammarUtil")
local v_u_4 = v1("LiveOpsMapSwap")
local v_u_5 = v1("LiveOpsTime")
local v_u_6 = v1("MapForecast")
local v_u_7 = v1("package:Promise")
LiveOpsShopSignHelper = {}
function LiveOpsShopSignHelper.update_promise(p_u_8, p_u_9)
    return v_u_7.new(function(_, _, p10)
        while not p10() do
            local v11 = v_u_6.get_unique_forecast(v_u_5.now(), 2)[2].timestamp
            local v12 = v_u_2.get_time_breakdown
            local v13 = v11 - v_u_5.now()
            local v14 = v12((math.max(0, v13)))
            local v15 = v14.hours + v14.days * 24
            if v_u_4.get_current_map_type() == p_u_8 then
                if v15 < 36 then
                    p_u_9.Text = ("%02d:%02d:%02d"):format(v15, v14.minutes, v14.seconds)
                else
                    p_u_9.Text = string.format("%d %s", v14.days, v_u_3.get_plural_or_singular(v14.days, "DAYS", "DAY"))
                end
            else
                p_u_9.Text = "INACTIVE"
            end
            task.wait(1)
        end
    end)
end
return LiveOpsShopSignHelper