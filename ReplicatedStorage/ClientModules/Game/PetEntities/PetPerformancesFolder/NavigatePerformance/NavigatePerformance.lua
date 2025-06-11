--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.NavigatePerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("PetMovementTarget")
local v_u_3 = v1("StateManagerClient")
local v_u_4 = v1("SteppedTask")
local v_u_5 = v1("UIManager")
local v_u_6 = v1("package:Sift")
local v_u_7 = {
    ["BabyBeingHeld"] = true,
    ["BabyOnStroller"] = true,
    ["SitInVehicle"] = true
}
local function v_u_9()
    local v8 = game.Players.LocalPlayer.Character
    if v8 then
        v8 = v8:FindFirstChild("HumanoidRootPart")
    end
    if v8 then
        if v8.Velocity.Magnitude == 0 then
            return v8.Position
        else
            return v8.Position + v8.Velocity.Unit * 8
        end
    else
        return Vector3.new(0, 0, 0)
    end
end
return {
    ["name"] = script.Name,
    ["init_performance"] = function(_, p10)
        local v11 = p10 or {}
        local v12 = {
            ["nav_name"] = v11.nav_name,
            ["initial_pathfinding_failed"] = false,
            ["next_stop_time"] = os.clock(),
            ["target"] = v11.target,
            ["catchup_attempts"] = 0,
            ["goal_target"] = v_u_2.new({
                ["target"] = v11.target,
                ["target_reach_threshold"] = 5
            }),
            ["player_target"] = v_u_2.new({
                ["target"] = game.Players.LocalPlayer
            })
        }
        local v13 = {
            ["target"] = v_u_9,
            ["target_reach_threshold"] = 5
        }
        v12.return_target = v_u_2.new(v13)
        v12.base_modifiers = {
            ["dont_allow_remote_interaction"] = true,
            ["pause_ailment_chat_bubbles"] = true
        }
        v12.return_modifiers = {
            ["dont_allow_remote_interaction"] = true,
            ["pause_ailment_chat_bubbles"] = true
        }
        v12.modifiers = {
            ["ignore_goal_when_teleporting"] = true,
            ["dont_allow_remote_interaction"] = true,
            ["pause_ailment_chat_bubbles"] = true
        }
        v12.return_modifiers.movement_target = v12.return_target
        return v12
    end,
    ["step"] = function(p_u_14, p_u_15)
        p_u_15.task = p_u_15.task or v_u_4.new(function(p16)
            local v17 = p_u_15.modifiers
            local v18 = p_u_14.base.root.CFrame.Position
            local v19 = game.Players.LocalPlayer.Character
            if v19 then
                v19 = v19:FindFirstChild("HumanoidRootPart")
            end
            if v19 then
                v19 = v19.Position
            end
            local v20 = (v18 - (v19 or Vector3.new(0, 0, 0))).Magnitude
            while not p_u_15.goal_target:has_been_reached(p_u_14) or p_u_15.come_back_to_player do
                local v21 = p_u_14.base.root.CFrame.Position
                local v22 = game.Players.LocalPlayer.Character
                if v22 then
                    v22 = v22:FindFirstChild("HumanoidRootPart")
                end
                if v22 then
                    v22 = v22.Position
                end
                local v23 = v21 - (v22 or Vector3.new(0, 0, 0))
                v20 = v23.Magnitude
                local v24 = nil or p_u_14.move_state.final_move_vector
                local v25 = (v24.Magnitude <= 0 and Vector3.new(0, 0, 0) or v24.Unit):Dot(v23)
                local v26 = math.abs(v25)
                local v27 = math.min(v20, v26)
                local v28 = p_u_14.move_state.final_move_vector
                if (v27 > 10 or v20 > 50) and os.clock() > p_u_15.next_stop_time then
                    v17.walkspeed = 0
                    v17.head_target = nil
                    v17.rotation_target = p_u_15.player_target
                    v17.effects = { "exclaim" }
                    v17.eyes_id = "happy_eyes"
                    p16:wait(0.5)
                    v17.effects = nil
                    while v27 > 10 and v27 <= 20 or v20 > 50 and v20 <= 60 do
                        p16:wait_for_step()
                        local v29 = p_u_14.base.root.CFrame.Position
                        local v30 = game.Players.LocalPlayer.Character
                        if v30 then
                            v30 = v30:FindFirstChild("HumanoidRootPart")
                        end
                        if v30 then
                            v30 = v30.Position
                        end
                        v23 = v29 - (v30 or Vector3.new(0, 0, 0))
                        v20 = v23.Magnitude
                        local v31 = v28 or p_u_14.move_state.final_move_vector
                        local v32 = (v31.Magnitude <= 0 and Vector3.new(0, 0, 0) or v31.Unit):Dot(v23)
                        local v33 = math.abs(v32)
                        v27 = math.min(v20, v33)
                    end
                    p_u_15.next_stop_time = os.clock() + 1
                    p_u_15.initial_pathfinding_failed = false
                end
                if v27 > 20 or v20 > 60 then
                    p_u_15.come_back_to_player = true
                    local v34 = p_u_15
                    v34.catchup_attempts = v34.catchup_attempts + 1
                    if p_u_15.catchup_attempts >= 5 then
                        local v35 = p_u_14.base.entry
                        v_u_5.apps.HintApp:hint({
                            ["text"] = ("Your %* wants you to follow them!"):format(v35.name),
                            ["length"] = 4,
                            ["yields"] = false,
                            ["overridable"] = true
                        })
                    end
                    while not p_u_15.return_target:has_been_reached(p_u_14) do
                        p16:wait_for_step()
                        local v36 = p_u_14.base.root.CFrame.Position
                        local v37 = game.Players.LocalPlayer.Character
                        if v37 then
                            v37 = v37:FindFirstChild("HumanoidRootPart")
                        end
                        if v37 then
                            v37 = v37.Position
                        end
                        v23 = v36 - (v37 or Vector3.new(0, 0, 0))
                        v20 = v23.Magnitude
                        local v38 = v28 or p_u_14.move_state.final_move_vector
                        local v39 = (v38.Magnitude <= 0 and Vector3.new(0, 0, 0) or v38.Unit):Dot(v23)
                        local v40 = math.abs(v39)
                        math.min(v20, v40)
                        local v41 = p_u_15.return_modifiers
                        local v42 = 36
                        local v43 = game.Players.LocalPlayer.Character
                        if v43 then
                            v43 = v43:FindFirstChild("Humanoid")
                        end
                        if v43 then
                            v43 = v43.WalkSpeed
                        end
                        local v44 = (v43 or 0) * 1.5
                        v41.walkspeed = math.max(v42, v44)
                    end
                    p_u_15.come_back_to_player = false
                    p_u_15.initial_pathfinding_failed = false
                end
                v17.effects = nil
                v17.eyes_id = nil
                v17.rotation_target = nil
                v17.head_target = p_u_15.goal_target
                v17.movement_target = p_u_15.goal_target
                local v45 = nil or p_u_14.move_state.final_move_vector
                local v46 = (v45.Magnitude <= 0 and Vector3.new(0, 0, 0) or v45.Unit):Dot(v23)
                if v46 > 8 then
                    local v47 = game.Players.LocalPlayer.Character
                    if v47 then
                        v47 = v47:FindFirstChild("Humanoid")
                    end
                    if v47 then
                        v47 = v47.WalkSpeed
                    end
                    v17.walkspeed = (v47 or 0) * 0.5
                elseif v46 > 5 then
                    local v48 = game.Players.LocalPlayer.Character
                    if v48 then
                        v48 = v48:FindFirstChild("Humanoid")
                    end
                    if v48 then
                        v48 = v48.WalkSpeed
                    end
                    v17.walkspeed = v48 or 0
                else
                    local v49 = game.Players.LocalPlayer.Character
                    if v49 then
                        v49 = v49:FindFirstChild("Humanoid")
                    end
                    if v49 then
                        v49 = v49.WalkSpeed
                    end
                    v17.walkspeed = (v49 or 0) * 1.5
                end
                if p_u_14.pathfinding.did_path_fail_this_frame then
                    p_u_15.initial_pathfinding_failed = true
                end
                v17.should_start_pathfinding = not p_u_15.initial_pathfinding_failed
                p16:wait_for_step()
            end
            p_u_15.come_back_to_player = false
            v17.eyes_id = "pleading_eyes"
            v17.rotation_target = p_u_15.goal_target
            v17.head_target = p_u_15.goal_target
            v17.looping_sounds = { "PleadingLoop" }
            v17.walkspeed = 0
            while v20 < 60 do
                v17.rotation_target = p_u_15.goal_target
                v17.head_target = p_u_15.goal_target
                p16:wait(1)
                v17.rotation_target = p_u_15.player_target
                v17.head_target = p_u_15.player_target
                p16:wait(1)
                local v50 = p_u_14.base.root.CFrame.Position
                local v51 = game.Players.LocalPlayer.Character
                if v51 then
                    v51 = v51:FindFirstChild("HumanoidRootPart")
                end
                if v51 then
                    v51 = v51.Position
                end
                v20 = (v50 - (v51 or Vector3.new(0, 0, 0))).Magnitude
            end
            p_u_15.task = nil
            p_u_15.come_back_to_player = true
            p_u_15.initial_pathfinding_failed = false
            v_u_6.Dictionary.copy(p_u_15.base_modifiers).ignore_goal_when_teleporting = true
        end)
        if p_u_15.task then
            return p_u_15.task:step()
        end
    end,
    ["calculate_modifiers"] = function(p52, p53)
        local v54 = v_u_3.get(p52.base.char)
        if v54 and v54.is_sitting then
            for _, v55 in v54.states do
                if v_u_7[v55.id] then
                    return p53.base_modifiers, {}
                end
            end
        end
        local v56 = v_u_5.apps.FocusPetApp.pet_entity
        if v56 and v56.unique_id == p52.unique_id then
            return p53.base_modifiers, {}
        elseif p53.come_back_to_player then
            return p53.return_modifiers, {}
        else
            return p53.modifiers, {}
        end
    end
}