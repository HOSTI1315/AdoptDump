--// ReplicatedStorage.SharedModules.SharedDB.VehicleDB.VehicleProperties.BoatVehiclePropertiesDB (ModuleScript)

local v1 = {
    ["desert_2022_trireme"] = {
        ["model_name"] = "Desert2022Trireme",
        ["acceleration"] = 30,
        ["max_drift_speed"] = 5,
        ["max_speed"] = 25,
        ["target_mass"] = 100,
        ["turn_speed"] = 1.5707963267948966,
        ["turn_velocity_damping"] = 0.3
    },
    ["halloween_2023_charons_boat"] = {
        ["model_name"] = "Halloween2023CharonsBoat",
        ["acceleration"] = 20,
        ["max_drift_speed"] = 15,
        ["max_speed"] = 25,
        ["target_mass"] = 65,
        ["turn_speed"] = 0.7853981633974483,
        ["turn_velocity_damping"] = 0.45
    },
    ["party_surfboard"] = {
        ["model_name"] = "PartySurfboard",
        ["acceleration"] = 80,
        ["animation"] = "Snowboard",
        ["max_drift_speed"] = 10,
        ["max_speed"] = 50,
        ["target_mass"] = 20,
        ["turn_speed"] = 1.5707963267948966,
        ["turn_velocity_damping"] = 0.3
    },
    ["rain_2023_galleon"] = {
        ["model_name"] = "Rain2023Galleon",
        ["acceleration"] = 15,
        ["max_drift_speed"] = 5,
        ["max_speed"] = 27.5,
        ["no_player_collisions"] = true,
        ["target_mass"] = 450,
        ["turn_speed"] = 0.7853981633974483,
        ["turn_velocity_damping"] = 0.5
    },
    ["rain_2023_old_sail_boat"] = {
        ["model_name"] = "Rain2023OldSailBoat",
        ["acceleration"] = 30,
        ["animation"] = "SailBoatSit",
        ["max_drift_speed"] = 5,
        ["max_speed"] = 18,
        ["target_mass"] = 30,
        ["turn_speed"] = 1.5707963267948966,
        ["turn_velocity_damping"] = 0.3
    },
    ["speedboat"] = {
        ["model_name"] = "Speedboat",
        ["acceleration"] = 70,
        ["max_drift_speed"] = 15,
        ["max_speed"] = 35,
        ["pitch_angle"] = 0.3490658503988659,
        ["target_mass"] = 100,
        ["turn_speed"] = 1.5707963267948966,
        ["turn_velocity_damping"] = 0.3
    },
    ["summerfest_2023_jetski"] = {
        ["model_name"] = "Summerfest2023Jetski",
        ["acceleration"] = 80,
        ["bank_angle"] = 0.2617993877991494,
        ["max_drift_speed"] = 10,
        ["max_speed"] = 50,
        ["max_tilt"] = 0.4363323129985824,
        ["target_mass"] = 115,
        ["turn_speed"] = 1.9198621771937625,
        ["turn_velocity_damping"] = 0.3
    },
    ["surfboard"] = {
        ["model_name"] = "Surfboard",
        ["acceleration"] = 80,
        ["animation"] = "Snowboard",
        ["max_drift_speed"] = 10,
        ["max_speed"] = 50,
        ["target_mass"] = 20,
        ["turn_speed"] = 1.5707963267948966,
        ["turn_velocity_damping"] = 0.3
    },
    ["vehicle_shop_2022_jet_boat"] = {
        ["model_name"] = "VehicleShop2022JetBoat",
        ["acceleration"] = 60,
        ["max_drift_speed"] = 10,
        ["max_speed"] = 30,
        ["target_mass"] = 100,
        ["turn_speed"] = 1.5707963267948966,
        ["turn_velocity_damping"] = 0.3,
        ["water_check_fudge_factor"] = 1.5
    },
    ["winter_2022_ice_breaker_ship"] = {
        ["model_name"] = "Winter2022IceBreakerShip",
        ["acceleration"] = 30,
        ["max_drift_speed"] = 5,
        ["max_speed"] = 25,
        ["target_mass"] = 100,
        ["turn_speed"] = 1.5707963267948966,
        ["turn_velocity_damping"] = 0.3
    }
}
require(game.ReplicatedStorage:WaitForChild("Fsys")).load("ContentPackHelper").merge("VehicleProperties", {
    ["boats"] = v1
}, true)
local v2 = {
    ["turn_torque"] = 10,
    ["tilt_torque"] = 10,
    ["bank_torque"] = 100,
    ["pitch_torque"] = 100,
    ["wobble_torque"] = 10,
    ["max_tilt"] = 0.5235987755982988,
    ["bank_angle"] = 0.4363323129985824,
    ["pitch_angle"] = 0.17453292519943295,
    ["idle_wobble"] = 0.17453292519943295
}
for _, v3 in v1 do
    for v4, v5 in v2 do
        if v3[v4] == nil then
            v3[v4] = v5
        end
    end
    if not v3.vehicle_render_effects then
        v3.vehicle_render_effects = {}
    end
    local v6 = v3.vehicle_render_effects
    table.insert(v6, "boat_spray")
    v3.max_tilt_dot = CFrame.fromEulerAnglesXYZ(v3.max_tilt, 0, 0).YVector.Y
    v3.vehicle_type = "boat"
end
return v1