--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Emotes.BoredPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetMovementTarget")
local v_u_3 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_4 = v1("SteppedTask")
local v_u_5 = game:GetService("Players")
return {
    ["name"] = script.Name,
    ["init_performance"] = function(_, _)
        local v6 = {
            ["player_target"] = v_u_2.new({
                ["target"] = v_u_5.LocalPlayer
            }),
            ["modifiers"] = {}
        }
        return v6
    end,
    ["step"] = function(p_u_7, p_u_8)
        if p_u_8.player_target:get_distance(p_u_7) > 10 or not p_u_7.ailments.bored then
            return v_u_3.Complete
        end
        local v_u_9 = p_u_7.base.entry.anims.sit
        p_u_8.task = p_u_8.task or v_u_4.new(function(p10)
            local v11 = p_u_8.modifiers
            p_u_7.sounds.play_sound("BoredSit")
            v11.anim_name = v_u_9
            v11.anim_fade_time = 0.5
            v11.walkspeed = 0
            p10:wait(0.5)
            p_u_7.sounds.play_sound("BoredCloseEyes")
            v11.eyes_id = "squinting_eyes"
            p10:wait(2)
            p_u_7.sounds.play_sound("BoredSigh")
            v11.effects = { "sigh" }
            p10:wait(2.25)
            p_u_7.sounds.play_sound("DispleasedSweatdrop")
            v11.effects = { "emit_sweatdrop" }
        end)
        return p_u_8.task:step()
    end,
    ["calculate_modifiers"] = function(_, p12, _)
        return p12.modifiers or {}, {}
    end
}