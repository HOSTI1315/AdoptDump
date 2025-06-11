--// ReplicatedStorage.ClientModules.Game.PetEntities.PetReactions.BoredAilmentReaction (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("InterestScore")
local v_u_3 = v1("PetPerformanceName")
local v_u_4 = v1("AdoptMeEnums/PetEntities/ReactionExitType")
local v_u_5 = v1("SteppedTask")
local v_u_6 = v1("SteppedTaskUtils")
local v_u_7 = v1("ModifierPriority")
local v8 = v1("AdoptMeEnums/PetEntities/ExclusiveStateType")
local v_u_9 = v1("PetMovementTarget")
local v_u_10 = v1("Utilities")
local v_u_11 = Random.new()
local v_u_12 = {
    ["generic_water_bowl"] = true,
    ["generic_food_bowl"] = true,
    ["generic_shower"] = true
}
local v_u_13 = {
    ["name"] = script.Name,
    ["allowed_exclusive_states"] = { v8.Sitting, v8.Carried }
}
local function v_u_18(p14, _)
    local v15 = workspace:WaitForChild("StaticMap"):WaitForChild("Park"):WaitForChild("BoredAilmentTarget")
    local v16 = workspace:WaitForChild("StaticMap"):WaitForChild("Park"):WaitForChild("BoredAilmentPerimeter")
    local v17 = (v15.Position - p14).magnitude < 400 and v_u_10.point_in_points(p14, {}, v16)
    if v17 then
        if p14.Y > v15.Position.Y - 20 then
            v17 = p14.Y < v15.Position.Y + 170
        else
            v17 = false
        end
    end
    return v17
end
function v_u_13.calculate_score(p19, _)
    if v_u_18(p19.base.root.Position) then
        return v_u_2.Anticipate
    else
        return v_u_2.InformationPersistent
    end
end
function v_u_13.calculate_threshold(p20, _)
    if v_u_18(p20.base.root.Position) then
        return v_u_2.Gameplay
    else
        return v_u_2.Information
    end
end
function v_u_13.step(p_u_21, p22)
    if not p_u_21.ailments.bored then
        return v_u_4.Complete
    end
    if v_u_12[p_u_21.current_furniture_use_id] then
        return v_u_4.Cancel
    end
    p22.task = p22.task or v_u_5.new(function(p23)
        while true do
            while v_u_18(p_u_21.base.root.Position) do
                local v24 = v_u_6.run_performance
                local v25 = p_u_21
                local v26 = {
                    ["name"] = v_u_3.NoticeObject,
                    ["manager_reaction_name"] = v_u_13.name
                }
                local v27 = {
                    ["object"] = workspace:WaitForChild("StaticMap"):WaitForChild("Park"):WaitForChild("BoredAilmentTarget"),
                    ["eyes_on_notice"] = "wide_open_eyes",
                    ["effects_on_notice"] = { "surprised" },
                    ["acknowledgement_time"] = 1.5,
                    ["notice_delay_time"] = 0
                }
                v26.options = v27
                function v26.should_end_performance()
                    return not v_u_18(p_u_21.base.root.Position)
                end
                v24(p23, v25, v26)
                local v28 = v_u_6.run_performance
                local v29 = p_u_21
                local v30 = {
                    ["name"] = v_u_3.RunInCircles,
                    ["manager_reaction_name"] = v_u_13.name
                }
                local v31 = {}
                local v32 = v_u_9.new
                local v33 = {
                    ["target"] = workspace:WaitForChild("StaticMap"):WaitForChild("Park"):WaitForChild("BoredAilmentTarget")
                }
                v31.target = v32(v33)
                v31.walkspeed = 30
                v31.radius = 10
                v31.duration = 5
                v31.effects = { "smoke_trail", "emit_smoke" }
                v31.eyes_id = "super_squinting_eyes"
                v31.looping_sounds = { "FetchingRunLoop" }
                v31.play_sounds = { "FetchingRunStart" }
                v30.options = v31
                function v30.should_end_performance()
                    return not v_u_18(p_u_21.base.root.Position)
                end
                v28(p23, v29, v30)
                local v34 = v_u_6.run_performance
                local v35 = p_u_21
                local v36 = {
                    ["name"] = v_u_3.EyesProvider,
                    ["manager_reaction_name"] = v_u_13.name
                }
                local v37 = {
                    ["eyes_id"] = "happy_eyes",
                    ["priority"] = v_u_7.Higher
                }
                v36.options = v37
                function v36.should_end_performance()
                    return not v_u_18(p_u_21.base.root.Position)
                end
                v34(p23, v35, v36)
            end
            local v38 = v_u_6.run_performance
            local v39 = p_u_21
            local v40 = {
                ["name"] = v_u_3.WaitForIdling,
                ["manager_reaction_name"] = v_u_13.name
            }
            local v41 = {
                ["duration"] = v_u_11:NextInteger(2, 5)
            }
            v40.options = v41
            function v40.should_end_performance()
                return v_u_18(p_u_21.base.root.Position)
            end
            v38(p23, v39, v40)
            local v42 = v_u_6.run_performance
            local v43 = p_u_21
            local v44 = {
                ["name"] = v_u_3.Bored,
                ["manager_reaction_name"] = v_u_13.name,
                ["should_end_performance"] = function()
                    return v_u_18(p_u_21.base.root.Position)
                end
            }
            v42(p23, v43, v44)
        end
    end)
    return p22.task:step()
end
return v_u_13