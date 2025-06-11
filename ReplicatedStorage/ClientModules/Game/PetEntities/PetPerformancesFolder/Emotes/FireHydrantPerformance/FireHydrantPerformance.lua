--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Emotes.FireHydrantPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetMovementTarget")
local v_u_3 = v1("SharedConstants")
local v_u_4 = v1("SteppedTask")
return {
    ["name"] = script.Name,
    ["init_performance"] = function(p5, p6)
        local v7 = p6.fire_hydrant_model
        local v8 = {
            ["sit_anim_name"] = p5.base.entry.anims.sit,
            ["goal_target"] = v_u_2.new({
                ["target"] = v7,
                ["target_reach_threshold"] = v_u_3.fire_hydrant_range * 0.5
            }),
            ["look_target"] = v_u_2.from_target_and_follow_distance(v7, v_u_3.fire_hydrant_range * 2, {
                ["has_reached_func"] = function()
                    return false
                end
            }),
            ["modifiers"] = {}
        }
        return v8
    end,
    ["step"] = function(p_u_9, p_u_10)
        local v_u_11 = p_u_10.sit_anim_name
        local v_u_12 = p_u_10.modifiers
        v_u_12.movement_target = p_u_10.goal_target
        p_u_10.task = p_u_10.task or v_u_4.new(function(p13)
            while not p_u_10.goal_target:has_been_reached(p_u_9) do
                p13:wait_for_step()
            end
            v_u_12.rotation_target = p_u_10.look_target
            v_u_12.anim_name = v_u_11
            v_u_12.walkspeed = 0
            v_u_12.eyes_id = "wat_eyes"
            v_u_12.effects = nil
            v_u_12.looping_sounds = nil
        end)
        return p_u_10.task:step()
    end,
    ["calculate_modifiers"] = function(_, p14, _)
        return p14.modifiers or {}, {}
    end
}