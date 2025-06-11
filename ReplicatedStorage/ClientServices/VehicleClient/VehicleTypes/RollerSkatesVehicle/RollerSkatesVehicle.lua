--// ReplicatedStorage.ClientServices.VehicleClient.VehicleTypes.RollerSkatesVehicle (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("Class")
local v_u_3 = v1("BaseSkatesVehicle")
local v4 = v2("RollerSkatesVehicle", v_u_3)
function v4.__init(p5, p6, p7, p8)
    local v9 = v_u_3.__init
    local v10 = {
        ["slope_limit"] = 0.7853981633974483,
        ["can_tilt"] = true,
        ["jump"] = {
            ["enabled"] = true,
            ["height"] = 12.5,
            ["debounce"] = 0.1
        },
        ["stumble"] = {
            ["slide_duration"] = 0,
            ["debounce"] = 0
        }
    }
    local v11 = {
        ["idle_slowdown_1"] = {
            ["frequency"] = 4,
            ["damping_ratio"] = 2
        },
        ["idle_slowdown_2"] = {
            ["frequency"] = 0.3,
            ["damping_ratio"] = 2
        },
        ["touch_idle_slowdown_1"] = {
            ["frequency"] = 4,
            ["damping_ratio"] = 2
        },
        ["touch_idle_slowdown_2"] = {
            ["frequency"] = 4,
            ["damping_ratio"] = 8
        },
        ["touch_idle_slowdown_3"] = {
            ["frequency"] = 16,
            ["damping_ratio"] = 8
        },
        ["brake"] = {
            ["frequency"] = 1.5,
            ["damping_ratio"] = 8
        },
        ["moving"] = {
            ["frequency"] = 0.8,
            ["damping_ratio"] = 2
        }
    }
    v10.throttle = v11
    v9(p5, p6, p7, p8, v10)
end
function v4.set_speed_factor(p12, _)
    p12.speed_factor = 1
end
return v4