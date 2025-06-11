--// ReplicatedStorage.ClientModules.Core.InteractionsEngine.Interaction (ModuleScript)

local v_u_1 = game:GetService("RunService")
local v2 = require(game.ReplicatedStorage.Fsys).load
local v3 = v2("Class")
local v_u_4 = v2("Debug")
local v_u_5 = v2("Signal")
local v_u_6 = 0
local v7 = v3("Interaction")
function v7.__init(p8, p9, p10)
    local v11 = p10 or {}
    p8.interactions_engine = p9
    p8.text = v11.text
    p8.on_selected = v11.on_selected
    p8.on_finished = v11.on_finished
    p8.is_visible = v11.is_visible
    p8.tag = v11.tag or "default"
    p8.icon_replacement = v11.icon_replacement
    p8.part = v11.part
    p8.offset = v11.offset
    p8.offset_relative_to_part_rotation = v11.offset_relative_to_part_rotation
    p8.hidden = v11.hidden or false
    p8.horizontal_dist = v11.horizontal_dist
    p8.max_speed = v11.max_speed
    p8.closeness_priority = v11.closeness_priority or 100
    p8.custom_menu_wheel_offset = v11.custom_menu_wheel_offset
    p8.on_interaction_shown = v11.on_interaction_shown
    p8.destroyed = v_u_5.new()
    p8._is_destroyed = false
    p8.anti_occlusion_mode_model = v11.anti_occlusion_mode_model
    local v12 = p8.part
    assert(v12, "Missing part")
    local v13 = p8.on_selected
    assert(v13, "Missing on_selected callback or tree")
    p8.eligible_for_lookup_optimization = true
    p8:_watch_for_position_changes()
    p8.visible = false
    p8.in_use = false
    p8.id = v_u_6
    v_u_6 = v_u_6 + 1
    p8:step()
end
function v7.set_hidden(p14, p15)
    if p14.hidden ~= p15 then
        p14.hidden = p15
        p14.interactions_engine:get_gui_callback("set_hidden")(p14, p14.hidden)
    end
end
function v7.is_hidden(p16)
    return p16.hidden
end
function v7.get_closeness_priority(p17)
    return p17.closeness_priority
end
function v7._watch_for_position_changes(p_u_18)
    local v_u_19 = nil
    local v_u_20 = nil
    local v_u_21 = nil
    local v_u_22 = 0
    local v_u_23 = p_u_18:get_position()
    local function v_u_25()
        local v24 = p_u_18:get_position()
        if (v24 - v_u_23).Magnitude < 1 then
            return
        else
            v_u_23 = v24
            v_u_22 = v_u_22 + 1
            if v_u_22 >= 3 then
                p_u_18.eligible_for_lookup_optimization = false
                p_u_18:update_registration()
                v_u_19:Disconnect()
                if v_u_20 then
                    v_u_20:Disconnect()
                end
                if v_u_21 then
                    v_u_21:Disconnect()
                end
            else
                task.delay(1, function()
                    v_u_22 = v_u_22 - 1
                end)
                p_u_18:update_registration()
            end
        end
    end
    local function v28()
        if p_u_18.part.Anchored then
            if v_u_20 then
                v_u_20:Disconnect()
            end
            if not v_u_21 then
                v_u_21 = p_u_18.part:GetPropertyChangedSignal("Position"):Connect(v_u_25)
                return
            end
        else
            if not v_u_20 then
                local v_u_26 = p_u_18.part.Position
                v_u_20 = v_u_1.PostSimulation:Connect(function()
                    debug.profilebegin("Interaction:_watch_for_position_changes.post_simulation")
                    local v27 = p_u_18.part.Position
                    if v_u_26 ~= v27 then
                        v_u_26 = v27
                        v_u_25()
                    end
                    debug.profileend()
                end)
            end
            if v_u_21 then
                v_u_21:Disconnect()
            end
        end
    end
    v_u_19 = p_u_18.part:GetPropertyChangedSignal("Anchored"):Connect(v28)
    task.spawn(v28)
end
function v7.get_max_visibility_radius(p29)
    local v30 = p29.horizontal_dist or 10
    local v31 = p29.visibility_distance or v30
    return math.max(v30, v31, 10, 5)
end
function v7.get_position(p32)
    local v33 = p32.part.Position
    if p32.offset then
        v33 = v33 + p32.offset
    end
    return v33
end
function v7.update_registration(p34)
    if p34._is_destroyed then
        return
    elseif p34.eligible_for_lookup_optimization then
        p34.interactions_engine.chunked_lookup:place_item(p34, p34:get_position(), p34:get_max_visibility_radius())
        p34.interactions_engine.unoptimized_interactions:remove(p34)
    else
        p34.interactions_engine.chunked_lookup:remove_item(p34)
        p34.interactions_engine.unoptimized_interactions:add(p34)
    end
end
function v7.step(p35)
    debug.profilebegin("Interaction:step")
    if not p35._is_destroyed then
        local v36 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if v36 then
            v36 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        end
        if v36 ~= nil then
            local v37 = p35.interactions_engine:is_enabled()
            if v37 then
                v37 = p35.interactions_engine:can_render_tag(p35.tag)
            end
            local v38 = p35.horizontal_dist or 10
            local v39 = p35.part
            local v40 = v39.Position
            if p35.offset then
                v40 = v40 + p35.offset
            end
            local v41 = p35.visibility_distance
            local v42 = p35.max_speed or nil
            local v43
            if v39.AssemblyRootPart then
                v43 = v39.AssemblyRootPart.Anchored
            else
                v43 = false
            end
            local v44 = not p35.in_use
            local v45 = v39.Parent ~= nil
            local v46 = v40.X - v36.X
            local v47 = math.abs(v46) < (v41 or v38)
            local v48 = v40.Z - v36.Z
            local v49 = math.abs(v48) < (v41 or v38)
            local v50 = v40.Y - v36.Y < (v41 or 10)
            local v51 = v36.Y - v40.Y < (v41 or 5)
            local v52 = (not v42 or v43) and true or v39.Velocity.Magnitude < v42
            local v53 = not p35.is_visible and true or p35:is_visible()
            if v37 then
                if v44 then
                    if v45 then
                        if v47 then
                            if v49 then
                                if v50 then
                                    if v51 then
                                        if not v52 then
                                            v53 = v52
                                        end
                                    else
                                        v53 = v51
                                    end
                                else
                                    v53 = v50
                                end
                            else
                                v53 = v49
                            end
                        else
                            v53 = v47
                        end
                    else
                        v53 = v45
                    end
                else
                    v53 = v44
                end
            else
                v53 = v37
            end
            local v54 = v53 or false
            if v54 ~= p35.visible then
                p35.visible = v54
                if v54 then
                    p35.interactions_engine:get_gui_callback("add_initial_gui")(p35, p35.hidden)
                else
                    p35.interactions_engine:get_gui_callback("delete_gui")(p35)
                end
            end
            debug.profileend()
            return v54
        end
    end
end
function v7.set_visibility_distance(p55, p56)
    p55.visibility_distance = p56
    p55:update_registration()
end
function v7.clear_visibility_distance(p57)
    p57.visibility_distance = nil
    p57:update_registration()
end
function v7.get_distance_squared(p58, p59, p60)
    local v61 = not p59 and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))
    if v61 then
        v61 = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    end
    if v61 == nil then
        return (1 / 0)
    end
    local v62 = p58.part.Position
    local v63 = v62.Y - v61.Y
    local v64 = p60 and math.abs(v63) < 5 and 0 or v63
    return (v62.X - v61.X) ^ 2 + v64 ^ 2 + (v62.Z - v61.Z) ^ 2
end
function v7.get_visibility(p65)
    return p65.visible or false
end
function v7.run(p_u_66, p_u_67)
    if p_u_66.interactions_engine:is_enabled() then
        if not p_u_66.in_use then
            p_u_66.in_use = true
            p_u_66:step()
            local v_u_68 = nil
            v_u_4.pcall_print_error(function()
                v_u_68 = p_u_67(p_u_66)
            end)
            p_u_66.in_use = false
            return v_u_68
        end
    end
end
function v7.destroy(p69)
    p69.interactions_engine:__deregister(p69)
    p69._is_destroyed = true
    if p69.visible then
        p69.interactions_engine:get_gui_callback("delete_gui")(p69)
    end
    p69.destroyed:Fire()
end
return v7