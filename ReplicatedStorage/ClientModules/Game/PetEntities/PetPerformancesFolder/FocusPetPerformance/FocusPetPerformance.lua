--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.FocusPetPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_3 = v1("ModifierPriority")
local v_u_4 = v1("UIManager")
local v_u_5 = v1("package:Sift")
return {
    ["name"] = script.Name,
    ["allowed_exclusive_states"] = { v2.Navigating, v2.FollowingPresetPath, v2.DoingTrick },
    ["init_performance"] = function(p6, _)
        local v7 = p6.base.pet_model:FindFirstChild("HumanoidRootPart")
        local v8
        if v7 then
            v8 = v7:FindFirstChild("PetFocusPosition")
        else
            v8 = nil
        end
        local v9 = not v8 and "sit" or v8:FindFirstChild("PetFocusAnimName").Value
        local v10 = {
            ["modifiers"] = {
                ["local_anim_name"] = p6.base.entry.anims[v9],
                ["cframe"] = p6.base.root.CFrame,
                ["anim_fade_time"] = 0.2,
                ["local_anim_speed"] = 1,
                ["dont_allow_sit_states"] = true,
                ["dont_allow_remote_interaction"] = true
            }
        }
        v10.priorities = v_u_5.Dictionary.map(v10.modifiers, function()
            return v_u_3.Higher
        end)
        return v10
    end,
    ["calculate_modifiers"] = function(p11, p12)
        local v13 = v_u_4.apps.FocusPetApp
        local v14 = v13.camera.desired_pet_cframe
        p12.modifiers.cframe = p11 == v13.pet_entity and v14 and v14 or p11.base.root.CFrame
        return p12.modifiers, p12.priorities
    end
}