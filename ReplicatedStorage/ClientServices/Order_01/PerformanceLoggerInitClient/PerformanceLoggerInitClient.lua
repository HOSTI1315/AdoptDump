--// ReplicatedStorage.ClientServices.Order_01.PerformanceLoggerInitClient (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.Fsys).load
local v_u_2 = v_u_1("PlatformM")
local v_u_3 = v_u_1("package:Promise")
return {
    ["init"] = function()
        v_u_3.try(function()
            local v_u_4 = v_u_1("package:PerformanceLogger").clientPlayerLogger()
            v_u_4.start()
            v_u_4.logStaticTiming("ServicesLoadStarted", time())
            v_u_4.logPlayerState("UiType", v_u_2.get_platform())
            v_u_1("InteriorsM").on_location_changed:Connect(function(p5)
                v_u_4.logPlayerState("Interior", p5.destination_id)
            end)
        end):catch(warn)
    end
}