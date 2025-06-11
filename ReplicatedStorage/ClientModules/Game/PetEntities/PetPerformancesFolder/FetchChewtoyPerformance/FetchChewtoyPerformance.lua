--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.FetchChewtoyPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetMovementTarget")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_5 = v1("SteppedTask")
local v_u_6 = v1("Utilities")
local v_u_7 = v1("PetObjectHelper")
return {
    ["name"] = script.Name,
    ["validate"] = function(_, _)
        return true
    end,
    ["init_performance"] = function(p8, p9)
        local v10 = p9.object_model
        local v11 = v_u_7.item_belongs_to_pet(p8, v10)
        local v12 = {
            ["toy_target"] = v_u_2.new({
                ["target"] = v10,
                ["target_reach_threshold"] = 3
            }),
            ["stay_in_place_target"] = v_u_2.new({
                ["target"] = p8.base.root
            }),
            ["object_model"] = v10,
            ["can_grab_timestamp"] = os.clock() + 0.2,
            ["is_my_toy"] = v11,
            ["modifiers"] = {}
        }
        return v12
    end,
    ["step"] = function(p_u_13, p_u_14)
        if p_u_13.base.humanoid:GetState() == Enum.HumanoidStateType.Swimming or p_u_13.swim_state.enabled then
            return v_u_4.Cancel
        end
        if not v_u_6.does_exist(p_u_14.object_model.PrimaryPart) then
            return v_u_4.Cancel
        end
        p_u_14.task = p_u_14.task or v_u_5.new(function(p15)
            v_u_3.get("PetObjectAPI/DropPetObject"):FireServer(p_u_13.base.char)
            local v16 = p_u_14.modifiers
            local v17 = p_u_14.is_my_toy
            if p_u_14.toy_target:get_distance(p_u_13) > 15 then
                p_u_13.sounds.play_sound("FetchingRunStart")
            end
            p15:wait_until(p_u_14.can_grab_timestamp)
            local v18 = tick() + 6
            repeat
                p15:wait_for_step()
                v16.movement_target = p_u_14.toy_target
                v16.head_target = p_u_14.toy_target
            until p_u_14.toy_target:has_been_reached(p_u_13) or v18 < tick()
            if not v17 then
                return v_u_4.Complete
            end
            v_u_3.get("PetObjectAPI/GrabPetObject"):FireServer(p_u_13.base.char, p_u_14.object_model)
            p_u_13.sounds.play_sound("ReturnFetchToy")
            v16.head_target = nil
            v16.movement_target = p_u_14.stay_in_place_target
            v16.eyes_id = "happy_eyes"
            v16.anim_name = p_u_13.base.entry.anims.sit
            return v_u_4.None
        end)
        return p_u_14.task:step()
    end,
    ["calculate_modifiers"] = function(p19, p20, _)
        local v21 = p20.modifiers or {}
        v21.dont_allow_sit_states = true
        local v22 = v21.movement_target
        if v22 then
            local v23 = v21.movement_target
            if v23 == p20.stay_in_place_target then
                v22 = nil
            else
                local v24 = v23:get_distance(p19)
                v22 = v24 >= 15 and 30 or v24 / 15 * 30
            end
        end
        v21.walkspeed = v22
        if v21.movement_target and v21.movement_target:get_distance(p19) < 15 then
            v21.effects = nil
            v21.looping_sounds = nil
        elseif v21.movement_target then
            v21.effects = { "emit_smoke", "smoke_trail" }
            v21.looping_sounds = { "FetchingRunLoop" }
        end
        v21.shouldnt_start_pathfinding_from_vertical_target_distance = p20.object_model.PrimaryPart.Velocity.Magnitude > 2
        return v21, {}
    end
}