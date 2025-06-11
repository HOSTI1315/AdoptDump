--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.PetChargePerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_3 = v1("PetMovementTarget")
local v_u_4 = v1("SteppedTask")
local v_u_5 = v1("Utilities")
return {
    ["name"] = script.Name,
    ["init_performance"] = function(_, p6)
        local v7 = p6.enemy_model
        local v8 = v_u_3.new({
            ["target"] = v7,
            ["target_reach_threshold"] = 3
        })
        local v9 = {
            ["enemy_model"] = v7,
            ["has_played_sound"] = false,
            ["modifiers"] = {
                ["movement_target"] = v8,
                ["head_target"] = v8,
                ["walkspeed"] = p6.walkspeed,
                ["eyes_id"] = "super_squinting_eyes",
                ["effects"] = { "smoke_trail", "emit_smoke" },
                ["looping_sounds"] = { "FetchingRunLoop" }
            }
        }
        return v9
    end,
    ["step"] = function(p_u_10, p_u_11)
        if not v_u_5.does_exist(p_u_11.enemy_model) then
            return v_u_2.Cancel
        end
        if not p_u_11.has_played_sound then
            p_u_11.has_played_sound = true
            p_u_10.sounds.play_sound("FetchingRunStart")
        end
        p_u_11.task = p_u_11.task or v_u_4.new(function(p12)
            while not p_u_11.modifiers.movement_target:has_been_reached(p_u_10) do
                p12:wait_for_step()
            end
            return v_u_2.Complete
        end)
        return p_u_11.task:step()
    end,
    ["calculate_modifiers"] = function(_, p13, _)
        return p13.modifiers, {}
    end
}