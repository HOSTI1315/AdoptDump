--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.RunInCirclesPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_3 = v1("PetMovementTarget")
local v_u_4 = v1("Utilities")
local v_u_5 = game:GetService("Players")
local v14 = {
    ["name"] = script.Name,
    ["init_performance"] = function(p_u_6, p7)
        local v8 = p7.target or v_u_3.new({
            ["target"] = v_u_5.LocalPlayer
        })
        local v9 = {
            ["target"] = v8,
            ["walkspeed"] = p7.walkspeed,
            ["radius"] = p7.radius
        }
        local v10
        if p7.duration then
            v10 = os.clock() + p7.duration or nil
        else
            v10 = nil
        end
        v9.end_timestamp = v10
        v9.modifiers = {
            ["effects"] = p7.effects,
            ["eyes_id"] = p7.eyes_id,
            ["looping_sounds"] = p7.looping_sounds,
            ["head_target"] = v8,
            ["rotation_target"] = v_u_3.from_callback(function()
                return p_u_6.base.root.Position + p_u_6.base.humanoid.MoveDirection * 10
            end)
        }
        v9.play_sounds = p7.play_sounds or {}
        v9.has_played_sounds = false
        return v9
    end,
    ["step"] = function(p11, p12)
        if not p12.has_played_sounds then
            p12.has_played_sounds = true
            for _, v13 in ipairs(p12.play_sounds) do
                p11.sounds.play_sound(v13)
            end
        end
        if p12.end_timestamp and os.clock() > p12.end_timestamp then
            return v_u_2.Complete
        end
    end
}
local function v_u_30(p15, p16)
    local v17 = p16.radius
    local v18 = p15.base.root.Position
    local v19 = p16.target:get_position() - Vector3.new(0, 2, 0)
    local v20 = v_u_4.zero_out_y(v18 - v19)
    local v21 = v20.Magnitude
    local v22
    if v21 == 0 then
        v22 = Vector3.new(1, 0, 0)
    else
        local v23
        if v21 <= v17 then
            v23 = -0.08726646259971647
        else
            local v24 = v17 / v21
            v23 = math.acos(v24)
        end
        local v25 = math.cos(v23)
        local v26 = math.sin(v23)
        local v27 = v25 * v20.X - v26 * v20.Z
        local v28 = -(v26 * v20.X + v25 * v20.Z)
        v22 = Vector3.new(v28, 0, v27).Unit
    end
    local v29 = v22 * p16.walkspeed
    if p16.target:get_target_value() == v_u_5.LocalPlayer then
        v29 = v29 + p15.speed_state.owner_move_vector_raw
    end
    return v29
end
function v14.calculate_modifiers(p31, p32)
    local v33 = p32.modifiers
    v33.movement_vector = v_u_30(p31, p32)
    v33.dont_allow_sit_states = true
    return v33, {}
end
return v14