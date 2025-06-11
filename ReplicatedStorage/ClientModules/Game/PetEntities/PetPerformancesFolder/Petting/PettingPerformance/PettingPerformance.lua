--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.Petting.PettingPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v2 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_3 = v1("ModifierPriority")
local v_u_4 = {
    ["pet_me"] = { "love" },
    ["dirty"] = { "fast_sparkles", "suds" }
}
return {
    ["name"] = script.Name,
    ["allowed_exclusive_states"] = { v2.Focused },
    ["init_performance"] = function(_, p5)
        local v6 = {
            ["ailment_kind"] = p5.ailment_kind,
            ["update_petting"] = p5.update_petting,
            ["modifiers"] = {
                ["effects"] = v_u_4[p5.ailment_kind],
                ["local_anim_speed"] = 0.25,
                ["eyes_id"] = "squinting_eyes",
                ["pause_ailment_chat_bubbles"] = true
            },
            ["priorities"] = {
                ["local_anim_speed"] = v_u_3.Highest
            }
        }
        return v6
    end,
    ["step"] = function(p7, p8)
        if p7.head_rotation and p7.head_rotation.head_motors then
            local v9, v10 = p8.update_petting()
            if v10 then
                local v11 = p7.head_rotation
                local v12 = v11.head_motors[#v11.head_motors]
                local v13 = v12.Part0.CFrame * v12.C0
                local v14 = workspace.CurrentCamera:WorldToViewportPoint(v13.Position)
                local v15 = (v9 - Vector2.new(v14.X, v14.Y)).Unit
                local v16 = p8.modifiers
                local v17 = -v15.X * 0.3490658503988659
                local v18 = v15.Y * 0.3490658503988659
                local v19 = -v15.X * 0.17453292519943295
                v16.head_angles = Vector3.new(v17, v18, v19)
                p8.modifiers.effects = v_u_4[p8.ailment_kind]
                p8.modifiers.local_anim_speed = 0.25
                p8.modifiers.eyes_id = "squinting_eyes"
            else
                p8.modifiers.head_angles = nil
                p8.modifiers.effects = nil
                p8.modifiers.local_anim_speed = nil
                p8.modifiers.eyes_id = nil
            end
        else
            return
        end
    end,
    ["calculate_modifiers"] = function(_, p20)
        return p20.modifiers, p20.priorities
    end
}