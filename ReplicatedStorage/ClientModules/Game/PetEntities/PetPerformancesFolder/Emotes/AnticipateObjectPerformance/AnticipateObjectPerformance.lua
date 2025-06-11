--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Emotes.AnticipateObjectPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Utilities")
local v_u_3 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_4 = v1("PetMovementTarget")
local v_u_5 = v1("EquippedPets")
local v_u_6 = game:GetService("Players")
return {
    ["name"] = script.Name,
    ["validate"] = function(_, p7)
        return v_u_2.does_exist(p7.object)
    end,
    ["init_performance"] = function(p_u_8, p_u_9)
        local v10 = {
            ["object"] = p_u_9.object,
            ["eyes_id"] = p_u_9.eyes_id,
            ["effects"] = p_u_9.effects,
            ["looping_sounds"] = p_u_9.looping_sounds,
            ["allow_sit_states"] = p_u_9.allow_sit_states or false,
            ["object_target"] = v_u_4.new({
                ["target"] = p_u_9.object
            })
        }
        local v16 = {
            ["target"] = function()
                local v11 = v_u_6.LocalPlayer.Character
                if v11 then
                    v11 = v11:FindFirstChild("HumanoidRootPart")
                end
                if not v11 then
                    return Vector3.new()
                end
                local v12 = 0
                local v13 = v_u_5.get_my_equipped_char_wrappers()
                if #v13 > 1 then
                    for v14, v15 in v13 do
                        if v15 == p_u_8.base.char_wrapper then
                            v12 = ((#v13 + 1) / 2 - v14) * 3
                            break
                        end
                    end
                end
                return (v11.CFrame * CFrame.new(v12, 0, 0)).Position + v11.CFrame.LookVector * p_u_9.distance
            end
        }
        v10.follow_player_target = v_u_4.new(v16)
        return v10
    end,
    ["step"] = function(_, p17)
        if not v_u_2.does_exist(p17.object) then
            return v_u_3.Cancel
        end
    end,
    ["calculate_modifiers"] = function(_, p18)
        return {
            ["movement_target"] = p18.follow_player_target,
            ["rotation_target"] = p18.object_target,
            ["head_target"] = p18.object_target,
            ["eyes_id"] = p18.eyes_id,
            ["effects"] = p18.effects,
            ["looping_sounds"] = p18.looping_sounds,
            ["dont_allow_sit_states"] = not p18.allow_sit_states
        }, {}
    end
}