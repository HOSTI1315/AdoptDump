--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.FetchThrowtoyPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = game:GetService("Players")
local v_u_3 = v1("PetMovementTarget")
local v_u_4 = v1("RouterClient")
local v_u_5 = v1("PetObjectHelper")
local v_u_6 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_7 = v1("Utilities")
local v_u_8 = v1("SteppedTask")
return {
    ["name"] = script.Name,
    ["init_performance"] = function(p9, p10)
        local v11 = p10.object_model
        local v12 = v11:FindFirstChild("CreatorPlayer")
        if v12 then
            v12 = v12.Value
        end
        local v13 = v_u_5.item_belongs_to_pet(p9, v11)
        local v14 = {
            ["toy_target"] = v_u_3.new({
                ["target"] = v11,
                ["target_reach_threshold"] = 3
            }),
            ["player_target"] = v_u_3.new({
                ["target"] = v12 or v_u_2.LocalPlayer,
                ["target_reach_threshold"] = 4
            }),
            ["stay_in_place_target"] = v_u_3.new({
                ["target"] = p9.base.root
            }),
            ["object_model"] = v11,
            ["can_grab_timestamp"] = os.clock() + 0.2,
            ["modifiers"] = {},
            ["grab_by_attachment"] = p10.grab_by_attachment,
            ["is_my_toy"] = v13,
            ["slowed"] = false
        }
        return v14
    end,
    ["step"] = function(p_u_15, p_u_16)
        if not v_u_7.does_exist(p_u_16.object_model.PrimaryPart) then
            return v_u_6.Cancel
        end
        if p_u_15.mount_state.is_mounted then
            return v_u_6.Cancel
        end
        p_u_16.task = p_u_16.task or v_u_8.new(function(p17)
            local v18 = p_u_16.modifiers
            local v19 = p_u_16.is_my_toy
            if p_u_16.toy_target:get_distance(p_u_15) > 15 then
                p_u_15.sounds.play_sound("FetchingRunStart")
            end
            v18.eyes_id = "squinting_eyes"
            p17:wait_until(p_u_16.can_grab_timestamp)
            local v20 = tick() + 6
            repeat
                p17:wait_for_step()
                v18.movement_target = p_u_16.toy_target
                v18.head_target = p_u_16.toy_target
            until p_u_16.toy_target:has_been_reached(p_u_15) or v20 < tick()
            if v19 then
                v_u_4.get("PetObjectAPI/GrabPetObject"):FireServer(p_u_15.base.char, p_u_16.object_model, p_u_16.grab_by_attachment)
            end
            v18.movement_target = p_u_16.stay_in_place_target
            v18.head_target = p_u_16.player_target
            v18.rotation_target = p_u_16.player_target
            if v19 then
                v18.eyes_id = "happy_eyes"
            end
            p17:wait(0.3)
            p_u_16.modifiers.should_jump = v19
            p17:wait(0.85)
            p_u_16.modifiers.should_jump = nil
            p17:wait(0.25)
            v18.movement_target = p_u_16.player_target
            v18.eyes_id = "squinting_eyes"
            if not v19 then
                p_u_16.slowed = true
            end
            local v21 = tick() + 6
            repeat
                p17:wait_for_step()
            until p_u_16.player_target:has_been_reached(p_u_15) or v21 < tick()
            p_u_16.slowed = false
            if v19 then
                local v22 = p_u_16.object_model:FindFirstChild("CreatorPlayer")
                if v22 then
                    v22 = v22.Value
                end
                if v22 == v_u_2.LocalPlayer then
                    p_u_15.sounds.play_sound("ReturnFetchToy")
                    p17:run_async(function()
                        v_u_5.equip_item_from_pet_object(p_u_16.object_model)
                    end)
                end
                v_u_4.get("PetObjectAPI/DropPetObject"):FireServer(p_u_15.base.char)
            end
            return v_u_6.Complete
        end)
        return p_u_16.task:step()
    end,
    ["calculate_modifiers"] = function(p23, p24, _)
        local v25 = p24.modifiers or {}
        local v26 = not v25.movement_target and true or v25.movement_target:get_distance(p23) < 15
        v25.shouldnt_start_pathfinding_from_vertical_target_distance = p24.object_model.PrimaryPart.Velocity.Magnitude > 2
        v25.rotation_power = v25.rotation_target and 5000 or nil
        v25.jump_height = v25.should_jump and 2 or nil
        local v27
        if v25.movement_target then
            local v28 = v25.movement_target
            local v29
            if v28 == p24.stay_in_place_target then
                v29 = nil
            else
                local v30 = v28:get_distance(p23)
                local v31 = 30
                if v30 < 15 then
                    v31 = v31 * (v30 / 15)
                end
                v29 = v31 * (p24.slowed and 0.8 or 1)
            end
            v27 = v29 or nil
        else
            v27 = nil
        end
        v25.walkspeed = v27
        v25.dont_allow_sit_states = true
        if v26 or p24.slowed then
            v25.effects = nil
            v25.looping_sounds = nil
        elseif v25.movement_target then
            v25.effects = { "emit_smoke", "smoke_trail" }
            v25.looping_sounds = { "FetchingRunLoop" }
        end
        return v25, {}
    end
}