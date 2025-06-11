--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.EatPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetMovementTarget")
local v_u_3 = v1("RouterClient")
local v_u_4 = v1("InventoryDB")
local v_u_5 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_6 = v1("PetEntityHelper")
local v_u_7 = v1("PetPerformanceName")
local v_u_8 = v1("PetPotionEffectsDB")
local v_u_9 = v1("PetObjectHelper")
local v_u_10 = game:GetService("Workspace")
return {
    ["name"] = script.Name,
    ["validate"] = function(p11, p12)
        local v13 = p12.object_model
        local v14 = v13:FindFirstChild("ItemKind")
        if v14 then
            v14 = v14.Value
        end
        if v14 and (p11.base.root and (v13.PrimaryPart and v13.PrimaryPart:IsDescendantOf(v_u_10))) then
            if v_u_9.item_belongs_to_pet(p11, v13) then
                return not p11.active_performances[script.Name]
            else
                return false
            end
        else
            return false
        end
    end,
    ["init_performance"] = function(p15, p16)
        local v_u_17 = p16.object_model
        local v18 = v_u_17:FindFirstChild("ItemKind").Value
        local v19 = v_u_4.food[v18]
        local v20 = v_u_8[v18] ~= nil
        local v21, v22
        if p15.base.entry.is_food_grabber then
            v21 = v_u_2.new({
                ["target"] = function()
                    return v_u_17.PrimaryPart.Position
                end,
                ["has_reached_func"] = function()
                    return true
                end
            })
            v22 = nil
        else
            if v_u_6.has_performance(p15, v_u_7.FocusPet) then
                v21 = v_u_2.new({
                    ["target"] = function()
                        return v_u_17.PrimaryPart.Position
                    end,
                    ["has_reached_func"] = function()
                        return true
                    end
                })
            else
                v21 = v_u_2.from_target_and_follow_distance(v_u_17, 2, {
                    ["target_reach_threshold"] = 0.05
                })
            end
            v22 = v_u_2.from_callback(function()
                return v_u_17:GetPivot().Position - Vector3.new(0, 1, 0)
            end)
        end
        return {
            ["food_target"] = v21,
            ["food_look_target"] = v22,
            ["object_model"] = v_u_17,
            ["is_drink"] = v20 or v19.ailment_to_boost == "thirsty",
            ["is_potion"] = v20,
            ["is_eating"] = false,
            ["finish_eating_timestamp"] = (1 / 0),
            ["timeout"] = tick() + 6
        }
    end,
    ["step"] = function(p23, p24)
        local v25 = p24.object_model
        if not (v25 and (v25.PrimaryPart and v25.PrimaryPart:IsDescendantOf(game))) then
            return v_u_5.Cancel
        end
        local v26 = p23.base.entry.is_food_grabber
        if p24.is_eating then
            if workspace:GetServerTimeNow() >= p24.finish_eating_timestamp then
                v_u_3.get("PetAPI/ConsumeFoodObject"):FireServer(p24.object_model, p23.base.char_wrapper.pet_unique)
                if p24.is_drink then
                    if p24.is_potion then
                        p23.sounds.play_sound("DrinkingPotionFinished")
                    else
                        p23.sounds.play_sound("DrinkingFinished")
                    end
                else
                    p23.sounds.play_sound("EatingFinished")
                end
                return v_u_5.Complete
            end
        elseif p24.food_target:has_been_reached(p23) or tick() > p24.timeout then
            p24.is_eating = true
            p24.finish_eating_timestamp = workspace:GetServerTimeNow() + 4.3
            if not v26 then
                if p24.is_drink then
                    v_u_3.get("PetObjectAPI/GrabPetObject"):FireServer(p23.base.char, p24.object_model)
                else
                    v25.PrimaryPart.Anchored = true
                end
            end
        end
        return nil
    end,
    ["calculate_modifiers"] = function(p27, p28)
        local v29 = p28.is_eating
        local v30
        if v29 then
            v30 = p28.is_drink
        else
            v30 = v29
        end
        local v31, v32, v33
        if p27.base.entry.is_food_grabber then
            v31 = nil
            v32 = nil
            v33 = nil
        else
            if v30 then
                v31 = nil
            else
                v31 = p28.food_look_target or nil
            end
            if v29 or v30 then
                v32 = nil
            else
                v32 = p28.food_look_target or nil
            end
            v33 = p28.food_target
        end
        local v34 = {
            ["is_drinking"] = v30
        }
        local v35
        if p28.is_eating then
            v35 = 0
        else
            local v36 = ((p27.base.root.Position - p28.food_target:get_position(p27)) * Vector3.new(1, 0, 1)).Magnitude
            v35 = v36 >= 3 and 24 or v36 / 3 * 24
        end
        v34.walkspeed = v35
        v34.rotation_target = v31
        v34.head_target = v32
        v34.movement_target = v33
        local v37 = v30 and p27.base.entry.anims.drinking
        if not v37 then
            if p28.is_eating then
                v37 = p27.base.entry.anims.eating or nil
            else
                v37 = nil
            end
        end
        v34.anim_name = v37
        v34.eyes_id = p28.is_eating and "squinting_eyes" or (p28.is_potion and "tiny_eyes" or "happy_eyes")
        v34.effects = p28.food_target:get_distance(p27) > 5 and { "emit_smoke" } or nil
        v34.looping_sounds = v30 and { "DrinkingLoop" } or (v29 and { "EatingLoop" } or nil)
        v34.dont_allow_sit_states = true
        return v34, {}
    end
}