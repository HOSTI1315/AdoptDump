--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.KaijuPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_3 = v1("PetMovementTarget")
local v_u_4 = v1("Utilities")
return {
    ["name"] = script.Name,
    ["validate"] = function(_, p5)
        return v_u_4.does_exist(p5.look_part)
    end,
    ["init_performance"] = function(_, p6)
        local v7 = {
            ["look_part_target"] = v_u_3.new({
                ["target"] = p6.look_part
            })
        }
        return v7
    end,
    ["step"] = function(_, p8)
        return v_u_4.does_exist(p8.look_part) and v_u_2.None or v_u_2.Cancel
    end,
    ["calculate_modifiers"] = function(_, p9)
        return {
            ["rotation_target"] = p9.look_part_target,
            ["head_target"] = p9.look_part_target,
            ["teleporting_disabled"] = true,
            ["dont_allow_remote_interaction"] = true,
            ["dont_allow_mount_states"] = true,
            ["shouldnt_pathfind"] = true,
            ["dont_allow_sit_states"] = true,
            ["pause_ailment_chat_bubbles"] = true,
            ["should_jump"] = false,
            ["walkspeed"] = 0
        }, {}
    end
}