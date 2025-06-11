--// ReplicatedStorage.ClientModules.Game.PetEntities.PetPerformancesFolder.FollowPresetPathPerformance (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("UIManager")
local v_u_3 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_4 = v1("PetMovementTarget")
local v5 = v1("package:t")
local v6 = {
    ["name"] = script.Name
}
local v_u_7 = {
    ["TextColor3"] = Color3.fromRGB(59, 0, 255),
    ["always_on_top"] = true
}
local v_u_8 = {
    ["confused"] = {
        "\226\157\147\226\157\147\226\157\147",
        "\240\159\152\149\240\159\152\149\240\159\152\149",
        "\240\159\152\170\240\159\152\170\240\159\152\170",
        "\240\159\141\149\240\159\141\149\240\159\141\149",
        "\240\159\152\180\240\159\152\180\240\159\152\180",
        "\240\159\153\132\240\159\153\132\240\159\153\132"
    },
    ["silly"] = { "\240\159\153\131\240\159\153\131\240\159\153\131", "\240\159\152\155\240\159\152\155\240\159\152\155", "\226\157\151\226\157\151\226\157\151" },
    ["happy"] = {
        "\240\159\153\130\240\159\153\130\240\159\153\130",
        "\240\159\152\138\240\159\152\138\240\159\152\138",
        "\240\159\152\132\240\159\152\132\240\159\152\132",
        "\240\159\152\142\240\159\152\142\240\159\152\142"
    }
}
local v9 = v5.every
local v10 = v5.interface
local v11 = {
    ["path"] = v5.array(v5.interface({
        ["position"] = v5.Vector3,
        ["action"] = v5.optional(v5.string),
        ["wait_time"] = v5.optional(v5.number),
        ["jump_height"] = v5.optional(v5.number)
    })),
    ["looped"] = v5.optional(v5.boolean),
    ["disable_obstacle_detection_proximity"] = v5.optional(v5.number),
    ["start_node_index"] = v5.optional(v5.integer)
}
local v_u_13 = v9(v10(v11), function(p12)
    if p12.start_node_index and p12.start_node_index > #p12.path then
        return false, "start_node_index must be <= #path or nil"
    else
        return true
    end
end)
function v6.validate(_, p14)
    local v15, v16 = v_u_13(p14)
    if not v15 then
        warn("Preset path validation failed:", v16)
    end
    return v15
end
function v6.init_performance(_, p17)
    local v18 = p17.start_node_index or 1
    local v19 = p17.path[v18]
    local v20 = v_u_4.new({
        ["target"] = v19.position,
        ["target_reach_threshold"] = 0.5
    })
    local v21 = p17.path
    local v22 = v21[v18].wait_time == nil and (-1 / 0) or tick() + v21[v18].wait_time
    local v23 = {
        ["path"] = v21,
        ["total_nodes"] = #v21,
        ["current_node_num"] = v18,
        ["current_movement_target"] = v20,
        ["resume_timestamp"] = v22,
        ["did_jump_this_node"] = false,
        ["disable_obstacle_detection"] = p17.disable_obstacle_detection,
        ["disable_obstacle_detection_proximity"] = p17.disable_obstacle_detection_proximity,
        ["has_gotten_close_to_first_node"] = not p17.disable_obstacle_detection_proximity,
        ["looped"] = p17.looped or false
    }
    if v23.disable_obstacle_detection == nil then
        v23.disable_obstacle_detection = true
    end
    return v23
end
function v6.step(p24, p25)
    if p24.is_changing_interiors then
        return v_u_3.Cancel
    else
        local v26 = p25.current_movement_target
        local v27 = p25.current_node_num
        local v28 = p25.total_nodes
        local v29 = p25.path
        if p25.disable_obstacle_detection_proximity and not p25.has_gotten_close_to_first_node then
            local v30 = p25.path[1].position
            if ((p24.base.root.Position - v30) * Vector3.new(1, 0, 1)).Magnitude <= p25.disable_obstacle_detection_proximity then
                p25.has_gotten_close_to_first_node = true
            end
        end
        if tick() >= p25.resume_timestamp then
            if v26:has_been_reached(p24) then
                if v27 == v28 and not p25.looped then
                    return v_u_3.Complete
                end
                local v31 = v27 % #v29 + 1
                local v32 = v29[v31]
                p25.current_node_num = v31
                p25.did_jump_this_node = false
                local v33 = v29[v31]
                p25.current_movement_target = v_u_4.new({
                    ["target"] = v33.position,
                    ["target_reach_threshold"] = 0.5
                })
                local v34 = v32.action ~= nil and v_u_8[v32.action]
                if v34 then
                    local v35 = v34[Random.new():NextInteger(1, #v34)]
                    v_u_2.apps.SpeechBubbleApp:create(p24.base.char.Head, v35, v_u_7)
                end
                local v36 = v32.wait_time
                if v36 ~= nil then
                    p25.resume_timestamp = tick() + v36
                end
            end
        end
    end
end
function v6.calculate_modifiers(_, p37)
    local v38 = p37.current_node_num
    local v39 = p37.path[v38]
    local v40 = p37.did_jump_this_node
    local v41, v42
    if v39.action == "jump" and not v40 then
        p37.did_jump_this_node = true
        v41 = v39.jump_height
        v42 = true
    else
        v42 = nil
        v41 = nil
    end
    local v43 = tick() < p37.resume_timestamp
    local v44 = p37.disable_obstacle_detection
    if v44 then
        v44 = p37.has_gotten_close_to_first_node
    end
    return {
        ["dont_allow_sit_states"] = true,
        ["walkspeed"] = v43 and 0 or 16,
        ["shouldnt_pathfind"] = v44,
        ["movement_target"] = p37.current_movement_target,
        ["should_jump"] = v42,
        ["jump_height"] = v42 and v41 and v41 or nil,
        ["shouldnt_avoid_obstacles_by"] = {
            ["jumping"] = v44,
            ["pathfinding"] = v44,
            ["teleporting"] = v44
        }
    }, {}
end
return v6