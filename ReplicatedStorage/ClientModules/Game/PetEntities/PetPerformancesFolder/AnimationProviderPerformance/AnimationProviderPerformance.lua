--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.AnimationProviderPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_3 = v1("ModifierPriority")
local v_u_4 = v1("AnimationUtil")
return {
    ["name"] = script.Name,
    ["init_performance"] = function(_, p5)
        return {
            ["anim_name"] = p5.anim_name,
            ["anim_speed"] = p5.anim_speed,
            ["fade_time"] = p5.anim_fade_time
        }
    end,
    ["step"] = function(p6, p7)
        local v8 = p6.animations.current_track
        if v8 and v8.Name == p7.anim_name then
            local v9
            if v8.Length > 0 then
                v9 = v8.TimePosition == v8.Length
            else
                v9 = false
            end
            if v9 or v_u_4.get_load_status(v8) == "failed" then
                return v_u_2.Complete
            end
        end
    end,
    ["calculate_modifiers"] = function(_, p10)
        return {
            ["local_anim_name"] = p10.anim_name,
            ["local_anim_speed"] = p10.anim_speed,
            ["anim_fade_time"] = p10.fade_time
        }, {
            ["local_anim_name"] = v_u_3.Highest
        }
    end
}