--// ReplicatedStorage.ClientServices.VehicleClient.VehicleTypes.BoatVehicle.BoatVehicleAnimator (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Class")
local v_u_2 = require(game.ReplicatedStorage.new.modules.RaycastHelper)
local v_u_3 = v1("BoatVehicleAnimator")
v_u_3.SURFACE = {
    ["Land"] = 1,
    ["Sand"] = 2,
    ["Water"] = 3
}
local v_u_4 = {
    ["Default"] = true,
    ["terrain"] = true
}
function v_u_3.__init(p5, p6, p7)
    p5.vehicle_model = p6
    p5.vehicle_db_entry = p7
    p5.vehicle_seat = p6:WaitForChild("VehicleSeat")
    p5.float_part = p6:WaitForChild("Float")
    p5.engine_part = p6:WaitForChild("Engine")
    p5.spray_emitter = p6:FindFirstChild("SprayEmitter")
    local v8 = p5.spray_emitter
    if v8 then
        v8 = p5.spray_emitter:FindFirstChild("Particle")
    end
    p5.spray_particle = v8
end
local function v_u_14(p9, p10, p11)
    local v12 = p9:Dot(p10)
    local v13 = p9:Cross(p10)
    if v12 < -0.99999 then
        return CFrame.fromAxisAngle(p11, 3.141592653589793)
    else
        return CFrame.new(0, 0, 0, v13.X, v13.Y, v13.Z, 1 + v12)
    end
end
function v_u_3._calculate_surface(p15)
    local v17 = v_u_2.cast_ray({
        ["origin"] = p15.float_part.Position,
        ["direction"] = Vector3.new(0, -50, 0),
        ["ignore_water"] = false,
        ["filter_type"] = Enum.RaycastFilterType.Exclude,
        ["instances"] = { p15.vehicle_model },
        ["callback"] = function(p16)
            return p16.Instance:IsA("BasePart") and (p16.Instance.CanCollide and v_u_4[p16.Instance.CollisionGroup]) and true or false
        end
    })
    if v17 and v17.Instance == workspace.Terrain then
        return v_u_3.SURFACE.Water
    elseif v17 and v17.Instance.Name == "Sand" then
        return v_u_3.SURFACE.Sand
    else
        return v_u_3.SURFACE.Land
    end
end
function v_u_3.get_state(p18)
    local v19 = p18.engine_part.CFrame
    local v20 = v_u_14(v19.YVector, Vector3.new(0, 1, 0), v19.ZVector)
    return {
        ["flattened_arc"] = v20,
        ["flattened_engine_cf"] = v20 * v19,
        ["surface"] = p18:_calculate_surface()
    }
end
function v_u_3.update(p21, _, p22)
    if p21.spray_particle then
        local v23 = p22 or p21:get_state()
        local v24 = v23.flattened_engine_cf:VectorToObjectSpace(p21.engine_part.AssemblyLinearVelocity).Z
        local v25
        if math.abs(v24) > 4 then
            v25 = v23.surface == v_u_3.SURFACE.Water
        else
            v25 = false
        end
        p21.spray_particle.Enabled = v25
    end
end
function v_u_3.destroy(_) end
return v_u_3