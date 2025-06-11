--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.BodyRotator (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_3 = v1("PetEntityHelper")
local v4 = {}
local v_u_5 = {
    [v2.Swimming] = true,
    [v2.Carried] = true,
    [v2.Sitting] = true,
    [v2.Mounted] = true
}
function v4.setup(p6)
    local v7 = Instance.new("BodyGyro")
    v7.Name = "BodyRotator"
    v7.MaxTorque = Vector3.new()
    v7.D = 200
    v7.P = 3000
    p6.rotation.rotation_bodygyro = v7
end
function v4.cleanup(p8)
    if p8.rotation.rotation_bodygyro then
        p8.rotation.rotation_bodygyro:Destroy()
    end
end
function v4.step(p9, _)
    if p9.client_has_control and not (p9.exclusive_state and v_u_5[p9.exclusive_state]) and not (v_u_3.is_pet_mounted(p9.base.char) or p9.is_changing_interiors) then
        local v10 = p9.modifier_values_from_performances.rotation_target
        if v10 then
            v10 = v10:get_position(p9)
        end
        local v11 = p9.modifier_values_from_performances.rotation_power
        if not v10 and (p9.base.entry.is_egg and p9.move_state.is_moving) then
            v10 = p9.base.root.Position + p9.move_state.final_move_vector
            v11 = 3000
        end
        if v10 then
            local v12 = p9.base.root
            local v13 = v12.Position
            p9.rotation.rotation_bodygyro.Parent = v12
            p9.rotation.rotation_bodygyro.CFrame = CFrame.new(v13 * Vector3.new(1, 0, 1), v10 * Vector3.new(1, 0, 1))
            p9.rotation.rotation_bodygyro.P = v11 or 3000
            p9.rotation.rotation_bodygyro.MaxTorque = Vector3.new(0, 80000, 0)
            p9.body_rotator_active = true
            return
        elseif p9.body_rotator_active then
            local v14 = p9.rotation
            if v14.rotation_bodygyro and v14.rotation_bodygyro.Parent ~= nil then
                p9.rotation.rotation_bodygyro.Parent = nil
                p9.rotation.rotation_bodygyro.MaxTorque = Vector3.new()
                p9.body_rotator_active = false
            end
        end
    elseif p9.body_rotator_active then
        local v15 = p9.rotation
        if v15.rotation_bodygyro and v15.rotation_bodygyro.Parent ~= nil then
            p9.rotation.rotation_bodygyro.Parent = nil
            p9.rotation.rotation_bodygyro.MaxTorque = Vector3.new()
            p9.body_rotator_active = false
        end
    end
end
return v4