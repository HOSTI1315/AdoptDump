--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Emotes.GreetPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("SteppedTask")
local v_u_3 = v1("PetMovementTarget")
local v_u_4 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_5 = game:GetService("Players")
return {
    ["name"] = script.Name,
    ["init_performance"] = function(_, p6)
        local v7 = v_u_3.from_target_and_follow_distance(v_u_5.LocalPlayer, 4)
        local v8 = v_u_3.new({
            ["target"] = v_u_5.LocalPlayer
        })
        local v9 = {
            ["modifiers"] = {
                ["rotation_target"] = v8,
                ["head_target"] = v8,
                ["movement_target"] = p6.target or v7,
                ["pause_ailment_chat_bubbles"] = true
            },
            ["is_friend"] = p6.is_friend
        }
        return v9
    end,
    ["step"] = function(p_u_10, p_u_11)
        p_u_11.task = p_u_11.task or v_u_2.new(function(p12)
            local v13 = p_u_11.modifiers
            v13.eyes_id = "happy_eyes"
            p12:wait(0.45)
            v13.should_jump = true
            v13.jump_height = 2
            p12:wait(0.5)
            p_u_10.sounds.play_sound("CuredHearts")
            v13.should_jump = nil
            v13.jump_height = nil
            v13.effects = { p_u_11.is_friend and "hearts_boosted" or "hearts" }
            p12:wait(2)
            return v_u_4.Complete
        end)
        return p_u_11.task:step()
    end,
    ["calculate_modifiers"] = function(_, p14, _)
        return p14.modifiers or {}, {}
    end
}