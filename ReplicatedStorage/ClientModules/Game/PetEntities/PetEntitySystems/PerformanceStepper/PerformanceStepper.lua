--// ReplicatedStorage.ClientModules.Game.PetEntities.PetEntitySystems.PerformanceStepper (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("AdoptMeEnums/PetEntities/PerformanceExitType")
local v_u_3 = v1("PetPerformances")
local v_u_4 = v1("PetEntityHelper")
local v_u_5 = v1("ModifierPriority")
local v_u_6 = v1("package:Sift")
local v_u_7 = v1("ValidatePerformanceModifiers")
local function v_u_13(p8)
    local v9 = tostring(p8)
    local v10 = string.gsub(v9, "^[\r\n]+", "")
    local v11 = string.gsub(v10, "[\r\n]+$", "")
    local v12 = string.gsub(v11, "\n", "\n  ")
    return string.format("{\n  %s\n}", v12)
end
local v_u_14 = game:GetService("RunService")
local v15 = {}
local function v_u_27(p16, p17, p18, p19)
    for v20, v21 in p18 do
        local v22 = p19[v20] or v_u_5.Medium
        local v23 = p17[v20] or v_u_5.Medium
        local v24 = p16[v20]
        if v22 == v23 and (typeof(v21) == "table" and typeof(v24) == "table") then
            if v21[1] and v24[1] then
                table.move(p18, 1, #p18, #p16 + 1, p16)
            else
                for v25, v26 in pairs(p18) do
                    p16[v25] = v26
                end
            end
        elseif v23 <= v22 or not v24 then
            p17[v20] = v22
            p16[v20] = v21
        end
    end
end
v15.optimization_prioritize = "owned"
function v15.step(p_u_28, p_u_29)
    if p_u_28.client_has_control then
        p_u_28.performances_cancelled_this_frame = {}
        p_u_28.performances_completed_this_frame = {}
        local v30 = {}
        local v31 = {}
        for v32, v_u_33 in pairs(p_u_28.active_performances) do
            local v_u_34 = v_u_3[v32]
            if v_u_33.manager_reaction_name and not v_u_4.has_reaction(p_u_28, v_u_33.manager_reaction_name) then
                p_u_28.active_performances = v_u_6.Dictionary.merge(p_u_28.active_performances, {
                    [v32] = v_u_6.None
                })
                p_u_28.performances_cancelled_this_frame[v32] = true
            else
                local v_u_35 = nil
                if v_u_34.step then
                    local v_u_36 = nil
                    local v_u_37 = nil
                    if not xpcall(function()
                        v_u_35 = v_u_34.step(p_u_28, v_u_33.state, p_u_29)
                    end, function(p38)
                        v_u_36 = p38
                        v_u_37 = debug.traceback(nil, 2)
                    end) then
                        v_u_35 = v_u_2.Cancel
                        warn(string.format("Error executing performance %s:\nPerformance error: %s\nPerformance traceback: %s\nPerformance staged at: %s", v32, v_u_13(v_u_36), v_u_13(v_u_37), v_u_13(v_u_33.staged_from_traceback)))
                    end
                end
                if v_u_35 == v_u_2.Complete or v_u_35 == v_u_2.Cancel then
                    p_u_28.active_performances = v_u_6.Dictionary.merge(p_u_28.active_performances, {
                        [v32] = v_u_6.None
                    })
                    if v_u_35 == v_u_2.Complete then
                        p_u_28.performances_completed_this_frame[v32] = true
                    else
                        p_u_28.performances_cancelled_this_frame[v32] = true
                    end
                elseif v_u_34.calculate_modifiers then
                    local v39, v40 = v_u_34.calculate_modifiers(p_u_28, v_u_33.state, p_u_29)
                    if v_u_14:IsStudio() then
                        local v41, v42 = v_u_7(v39)
                        if not v41 then
                            error(string.format("Assertion failed (%s):\n%s", v32, v42))
                        end
                    end
                    v_u_27(v30, v31, v39, v40)
                    for v43, v44 in v30 do
                        if v44 == v_u_6.None then
                            v30[v43] = nil
                        end
                    end
                end
            end
        end
        v30.shouldnt_avoid_obstacles_by = v30.shouldnt_avoid_obstacles_by or {}
        p_u_28.last_modifier_values_from_performances = p_u_28.modifier_values_from_performances
        p_u_28.modifier_values_from_performances = v30
    elseif next(p_u_28.active_performances) ~= nil then
        p_u_28.active_performances = {}
    end
end
return v15