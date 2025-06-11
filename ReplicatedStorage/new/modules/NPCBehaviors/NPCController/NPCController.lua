--// ReplicatedStorage.new.modules.NPCBehaviors.NPCController (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_2 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.t)
local v4 = require(script.Parent.Parent.LegacyLoad)
local v_u_5 = v4("AnimationManager")
local v_u_6 = v4("CollisionsClient")
local v_u_7 = v4("DownloadClient")
local v_u_8 = v4("FurnitureDB")
local v_u_9 = v4("InventoryDB")
local v_u_10 = v4("ModifierPriority")
local v_u_11 = v4("NPCProxyPetEntity")
local v_u_12 = v4("PetEntityHelper")
local v_u_13 = v4("PetEntityManager")
local v_u_14 = v4("PetMovementTarget")
local v_u_15 = v4("PetPerformanceName")
local v_u_16 = game:GetService("PathfindingService")
local v_u_17 = {}
v_u_17.__index = v_u_17
function v_u_17.create_from_pet_kind_async(p_u_18)
    return v_u_7.promise_download_copy("Pets", p_u_18):andThen(function(p19)
        p19.Parent = workspace
        local v20 = {
            ["model"] = p19,
            ["entity"] = v_u_13.create_pet_entity(p19, v_u_9.pets[p_u_18])
        }
        return v_u_17.new(v20)
    end):expect()
end
function v_u_17.create_from_npc_kind_async(p21, p_u_22)
    local v_u_23 = v_u_8[p21]
    local v24 = v_u_23.model_name
    return v_u_7.promise_download_copy("Furniture", v24):andThen(function(p25)
        p25.Parent = workspace
        local v26 = {
            ["model"] = p25,
            ["entity"] = v_u_11.new(p25, v_u_2.Dictionary.join({
                ["name"] = v_u_23.name
            }, p_u_22))
        }
        return v_u_17.new(v26)
    end):expect()
end
function v_u_17.new(p27)
    local v28 = {
        ["model"] = p27.model,
        ["_tracks"] = {},
        ["_entity"] = p27.entity,
        ["_walkspeed"] = p27.walkspeed or 16,
        ["_action"] = nil
    }
    local v29 = v_u_17
    local v30 = setmetatable(v28, v29)
    v30._entity.base.root.Anchored = false
    v30._entity.jump_state.base_jump_height = 0
    v_u_6.set_model_collision_group(v30._entity.base.char, "players_no_player_collision")
    v30._entity.base.humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    v30:stop_movement()
    for _, v31 in v30._entity.base.pet_model:FindFirstChild("Animator", true):GetPlayingAnimationTracks() do
        v31:Stop()
    end
    return v30
end
function v_u_17.performance_promise(p_u_32, p33, p34)
    local v_u_35 = v_u_15[p33]
    v_u_12.stage_performance(p_u_32._entity, {
        ["name"] = v_u_35,
        ["options"] = p34
    })
    return v_u_1.new(function(p36, _, p37)
        p37(function()
            v_u_12.end_performance(p_u_32._entity, v_u_35)
        end)
        repeat
            task.wait()
        until v_u_12.was_performance_ended(p_u_32._entity, v_u_35)
        p36()
    end)
end
function v_u_17.follow_promise(p38, p39)
    return p38:performance_promise("TargetProvider", {
        ["movement_target"] = p39
    })
end
function v_u_17.pathfind_promise(p_u_40, p_u_41, p_u_42)
    local v_u_43 = v_u_16:CreatePath({
        ["AgentRadius"] = 2,
        ["AgentHeight"] = 5,
        ["AgentCanJump"] = false
    })
    return v_u_1.try(function()
        return v_u_43:ComputeAsync(p_u_40._entity.base.root.CFrame.Position, p_u_41)
    end):andThen(function()
        local v45 = v_u_2.List.map(v_u_43:GetWaypoints(), function(p44)
            return {
                ["position"] = p44.Position
            }
        end)
        local v46 = v_u_1.race
        local v47 = {}
        local v48 = p_u_40
        local v49 = {
            ["modifiers"] = {
                ["walkspeed"] = p_u_42 or p_u_40._walkspeed
            },
            ["priorities"] = {
                ["walkspeed"] = v_u_10.Higher
            }
        }
        __set_list(v47, 1, {v48:performance_promise("ModifiersProvider", v49), p_u_40:performance_promise("FollowPresetPath", {
    ["path"] = v45,
    ["disable_obstacle_detection"] = true
})})
        return v46(v47)
    end):finally(function()
        p_u_40:stop_movement()
        v_u_43:Destroy()
    end)
end
function v_u_17.play_animation(p50, p51, p52)
    if v_u_3.string(p51) then
        p51 = v_u_5.get_track(p51)
    end
    local v53 = p50._entity.base.pet_model:FindFirstChild("Animator", true):LoadAnimation(p51)
    p50._tracks[v53.Name] = v53
    v53:Play()
    if p52 and p52.speed then
        v53:AdjustSpeed(p52.speed)
    end
    if p52 and p52.looped ~= nil then
        v53.Looped = p52.looped
    end
    return v53
end
function v_u_17.stop_animation(p54, p55)
    if p54._tracks[p55] then
        p54._tracks[p55]:Stop()
    end
end
function v_u_17.wait_promise(p56, p57)
    local v_u_58, v_u_59
    if v_u_3.Instance(p57) then
        v_u_58 = p57
        v_u_59 = false
    else
        v_u_58 = Instance.new("Part")
        v_u_58.CollisionGroup = "no_collisions"
        v_u_58.Anchored = true
        v_u_58.Transparency = 1
        v_u_58.Parent = workspace.Minigames
        v_u_58.CFrame = p57 or p56._entity.base.root.CFrame * CFrame.new(0, 0, -5)
        v_u_59 = true
    end
    return p56:performance_promise("NoticeObject", {
        ["object"] = v_u_58,
        ["notice_delay_time"] = 0,
        ["acknowledgement_time"] = (1 / 0),
        ["sounds_on_notice"] = {}
    }):finally(function()
        if v_u_59 then
            v_u_58:Destroy()
        end
    end)
end
function v_u_17.look_at_player_promise(p60)
    return p60:performance_promise(v_u_15.LookAtObject, {
        ["object"] = game.Players.LocalPlayer,
        ["head_only"] = true
    })
end
function v_u_17.do_action(p61, p_u_62)
    if p61._action then
        p61._action:cancel()
        p61._action = nil
    end
    p61._action = v_u_1.defer(function(p63)
        p63(p_u_62())
    end)
    return p61._action
end
function v_u_17.stop_action(p64)
    if p64._action then
        p64._action:cancel()
        p64._action = nil
    end
end
function v_u_17.stop_movement(p65)
    local v66 = v_u_12.stage_performance
    local v67 = p65._entity
    local v68 = {
        ["name"] = "ModifiersProvider"
    }
    local v69 = {}
    local v70 = {
        ["walkspeed"] = 0,
        ["movement_target"] = v_u_14.new({
            ["target"] = p65._entity.base.root
        })
    }
    v69.modifiers = v70
    v68.options = v69
    v66(v67, v68)
end
function v_u_17.destroy(p71)
    if p71._action then
        p71._action:cancel()
        p71._action = nil
    end
    v_u_13.remove_pet_entity_by_entity(p71._entity)
    p71.model:Destroy()
end
return v_u_17