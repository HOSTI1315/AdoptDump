--// ReplicatedStorage.ClientDB.VehicleFlapControlDB (ModuleScript)

return {
    ["default_control_callback"] = function(p1, p2, p3, p4)
        local v5 = p4 or {}
        local v6 = p1.BackLeft
        local v7 = p1.BackRight
        local v8 = p1.FrontLeft
        local v9 = p1.FrontRight
        local v10 = p1.Rudder
        local v11 = v5.pitch or p2
        local v12 = v5.yaw or p3
        if v12 == 0 then
            v8.constraint.TargetAngle = v11 * 20
            v9.constraint.TargetAngle = v11 * 20
            v6.constraint.TargetAngle = v11 * 20
            v7.constraint.TargetAngle = v11 * 20
        else
            v8.constraint.TargetAngle = v12 * -20
            v9.constraint.TargetAngle = v12 * 20
            v6.constraint.TargetAngle = v12 * -20
            v7.constraint.TargetAngle = v12 * 20
        end
        local v13 = v5.rudder or v12
        v10.constraint.TargetAngle = v13 * -20
    end,
    ["rudder_only_callback"] = function(p14, _, p15, p16)
        local v17 = p16 or {}
        local v18 = p14.Rudder
        local v19 = v17.yaw or p15
        local v20 = v17.rudder or v19
        v18.constraint.TargetAngle = v20 * -20
    end,
    ["biplane_callback"] = function(p21, p22, p23, p24)
        local v25 = p24 or {}
        local v26 = p21.TopLeft
        local v27 = p21.TopRight
        local v28 = p21.BottomLeft
        local v29 = p21.BottomRight
        local v30 = v25.pitch or p22
        local v31 = v25.yaw or p23
        if v31 == 0 then
            v26.constraint.TargetAngle = v30 * 20
            v27.constraint.TargetAngle = v30 * 20
            v28.constraint.TargetAngle = v30 * 20
            v29.constraint.TargetAngle = v30 * 20
        else
            v26.constraint.TargetAngle = v31 * -20
            v27.constraint.TargetAngle = v31 * 20
            v28.constraint.TargetAngle = v31 * -20
            v29.constraint.TargetAngle = v31 * 20
        end
    end,
    ["no_flaps_callback"] = function() end
}