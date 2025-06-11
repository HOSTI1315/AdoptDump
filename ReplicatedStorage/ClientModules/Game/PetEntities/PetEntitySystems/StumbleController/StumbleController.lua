--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.StumbleController (ModuleScript)

return {
    ["setup"] = function(p1)
        local v2 = Instance.new("BodyGyro")
        v2.Name = "StumbleBodyGyro"
        v2.P = 30000
        v2.D = 500
        v2.MaxTorque = Vector3.new(1000000, 1000000, 1000000)
        local v3 = Instance.new("BodyVelocity")
        v3.Name = "StumbleBodyVelocity"
        v3.P = 30000
        v3.MaxForce = Vector3.new(1000000, 0, 1000000)
        p1.stumble_state.stumble_bodygyro = v2
        p1.stumble_state.stumble_bodyvelocity = v3
        p1.stumble_state.enabled = false
    end,
    ["cleanup"] = function(p4)
        if p4.stumble_state.stumble_bodygyro then
            p4.stumble_state.stumble_bodygyro:Destroy()
        end
        if p4.stumble_state.stumble_bodyvelocity then
            p4.stumble_state.stumble_bodyvelocity:Destroy()
        end
    end,
    ["step"] = function(p5, _)
        if p5.base.entry.is_ice_skating_penguin then
            local v6 = p5.modifier_values_from_performances
            local v7 = v6.stumble_time
            local v8 = v6.stumble_direction
            local v9 = v7 ~= nil
            if v9 and not p5.stumble_state.enabled then
                local v10 = p5.stumble_state
                v10.stumble_bodygyro.Parent = p5.base.root
                v10.stumble_bodyvelocity.Parent = p5.base.root
                v10.enabled = true
            elseif not v9 and p5.stumble_state.enabled then
                local v11 = p5.stumble_state
                v11.stumble_bodygyro.Parent = nil
                v11.stumble_bodyvelocity.Parent = nil
                v11.enabled = false
            end
            if v9 then
                if v7 < 1.5 then
                    p5.default_eyes.eyes_closed = true
                else
                    p5.default_eyes.eyes_closed = false
                end
                if v7 > 1.5 and v7 < 7 then
                    p5.base.char.Brows.Transparency = 0
                else
                    p5.base.char.Brows.Transparency = 1
                end
                if v7 > 2 and v7 < 6 then
                    p5.base.char.AngryVein.Transparency = 0
                    local v12 = os.clock() % 0.4 / 0.4
                    if v12 < 0.5 then
                        p5.base.char.AngryVein.Size = Vector3.new(0.5, 0.5, 0.5) + Vector3.new(0.5, 0.5, 0.5) * v12 / 0.5
                    else
                        p5.base.char.AngryVein.Size = Vector3.new(1, 1, 1) - Vector3.new(0.5, 0.5, 0.5) * (v12 - 0.5) / 0.5
                    end
                else
                    p5.base.char.AngryVein.Transparency = 1
                end
                local v13 = v7 / 1.5
                local v14 = 1 - math.clamp(v13, 0, 1)
                p5.stumble_state.stumble_bodygyro.CFrame = CFrame.lookAt(Vector3.new(), v8) * CFrame.Angles(0, 12.566370614359172 * v14 ^ 2, 0)
                p5.stumble_state.stumble_bodyvelocity.Velocity = -v8 * 15 * v14 ^ 2
            else
                p5.base.char.Brows.Transparency = 1
                p5.base.char.AngryVein.Transparency = 1
            end
        else
            return
        end
    end
}