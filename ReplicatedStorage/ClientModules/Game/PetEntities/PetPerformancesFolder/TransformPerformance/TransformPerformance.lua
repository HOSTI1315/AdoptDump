--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.TransformPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AnimationUtil")
local v_u_3 = v1("ModifierPriority")
local v_u_4 = v1("PetMovementTarget")
return {
    ["name"] = script.Name,
    ["init_performance"] = function(p5, _)
        local v6 = p5.base.entry.transforming_pet.get_form(p5)
        local v7 = {}
        local v8 = {
            ["pause_ailment_chat_bubbles"] = true,
            ["movement_target"] = v_u_4.new({
                ["target"] = p5.base.root
            }),
            ["local_anim_speed"] = 1
        }
        v7.transforming_modifiers = v8
        v7.transforming_priorities = {
            ["movement_target"] = v_u_3.Highest,
            ["local_anim_name"] = v_u_3.Highest,
            ["local_anim_speed"] = v_u_3.Highest
        }
        v7.modifiers = {}
        v7.priorities = {}
        v7.current_form = v6
        v7.is_transforming = false
        v7.marker_reached = nil
        return v7
    end,
    ["step"] = function(p_u_9, p_u_10)
        if p_u_10.is_transforming then
            local v11 = p_u_9.animations.current_track
            if v11 and v11.Name == p_u_10.modifiers.local_anim_name then
                if not p_u_10.marker_reached then
                    p_u_10.marker_reached = v11:GetMarkerReachedSignal("transform_here"):Connect(function()
                        local v12 = p_u_9
                        p_u_10.current_form = v12.base.entry.transforming_pet.get_form(v12)
                    end)
                end
                local v13
                if v11.Length > 0 then
                    v13 = v11.TimePosition == v11.Length
                else
                    v13 = false
                end
                if v13 or v_u_2.get_load_status(v11) == "failed" then
                    p_u_10.current_form = p_u_9.base.entry.transforming_pet.get_form(p_u_9)
                    p_u_10.is_transforming = false
                end
            end
        else
            local v14 = p_u_9.base.entry.transforming_pet.get_form(p_u_9)
            if v14 ~= p_u_10.current_form then
                if p_u_10.marker_reached then
                    p_u_10.marker_reached:Disconnect()
                    p_u_10.marker_reached = nil
                end
                local v15 = p_u_9.base.entry.transforming_pet.forms[p_u_10.current_form].anims.transform
                if not v15 then
                    p_u_10.current_form = v14
                    return
                end
                p_u_10.is_transforming = true
                p_u_10.transforming_modifiers.local_anim_name = v15
            end
            return
        end
    end,
    ["calculate_modifiers"] = function(_, p16)
        p16.modifiers = not p16.is_transforming and {} or p16.transforming_modifiers
        p16.priorities = not p16.is_transforming and {} or p16.transforming_priorities
        p16.modifiers.current_form = p16.current_form
        return p16.modifiers, p16.priorities
    end
}