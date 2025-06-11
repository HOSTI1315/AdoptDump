--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Emotes.LookAtObjectPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Utilities")
local v_u_3 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_4 = v1("PetMovementTarget")
return {
    ["name"] = script.Name,
    ["validate"] = function(_, p5)
        return v_u_2.does_exist(p5.object)
    end,
    ["init_performance"] = function(_, p6)
        local v7 = {
            ["head_only"] = p6.head_only or false,
            ["object"] = p6.object,
            ["object_target"] = v_u_4.new({
                ["target"] = p6.object
            }),
            ["last_move_time"] = 0
        }
        return v7
    end,
    ["step"] = function(p8, p9)
        if not v_u_2.does_exist(p9.object) then
            return v_u_3.Cancel
        end
        if p8.move_state.is_moving then
            p9.last_move_time = os.clock()
        end
    end,
    ["calculate_modifiers"] = function(_, p10)
        local v11 = os.clock() - p10.last_move_time > 0.5
        local v12 = {}
        local v13
        if p10.head_only or not v11 then
            v13 = nil
        else
            v13 = p10.object_target or nil
        end
        v12.rotation_target = v13
        v12.head_target = p10.object_target or nil
        return v12, {}
    end
}