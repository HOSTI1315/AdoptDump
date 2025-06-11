--// ReplicatedStorage.new.modules.Tutorial.TutorialClient.Tutorial (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Parent.ABTest.ABTests.TutorialAB)
local v_u_2 = require(script.Parent.TutorialHelper)
local v_u_3 = require(script.Parent.TutorialSteps)
local v_u_4 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_5 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v6 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_7 = v6("ClientData")
local v_u_8 = v6("InteriorsM")
local v_u_9 = v6("RouterClient")
local v_u_10 = v6("Signal")
local v_u_11 = {}
v_u_11.__index = v_u_11
function v_u_11.get_saved_step()
    local v12 = v_u_7.get("tutorial_manager")
    return not v12 and 1 or v12.current_step
end
function v_u_11.get_saved_pet_kind()
    local v13 = v_u_7.get("tutorial_manager")
    if v13 then
        return v13.pet_kind
    else
        return nil
    end
end
function v_u_11.new(p14)
    local v15 = v_u_8.get_current_location().interior:WaitForChild("Tutorial")
    local v16 = v15:WaitForChild((v_u_1:get_value("stand_layout_name")))
    local v17 = game.ReplicatedStorage.Resources.TutorialStatic
    local v18 = v15:WaitForChild("Shared")
    for _, v19 in v15:GetChildren() do
        if v19 ~= v16 and v19 ~= v18 then
            v19:Destroy()
        end
    end
    local v23 = {
        ["destination_id"] = p14,
        ["model"] = v16,
        ["shared_model"] = v18,
        ["placement_cframes"] = v_u_5.Dictionary.map(v16:WaitForChild("PlacementBlocks"):GetChildren(), function(p20)
            return p20.CFrame, p20.Name
        end),
        ["static_placement_cframes"] = v_u_5.Dictionary.map(v17:WaitForChild("PlacementBlocks"):GetChildren(), function(p21)
            return p21.CFrame, p21.Name
        end),
        ["use_blocks"] = v_u_5.Dictionary.map(v16:WaitForChild("UseBlocks"):GetChildren(), function(p22)
            return p22, p22.Name
        end),
        ["memory"] = {
            ["pet_kind"] = v_u_11.get_saved_pet_kind()
        },
        ["_saved_step_index"] = v_u_11.get_saved_step(),
        ["_current_step_index"] = 1,
        ["_step_signal"] = v_u_10.new()
    }
    local v24 = v_u_11
    local v_u_25 = setmetatable(v23, v24)
    v_u_25._step_signal:connect(function(p26, p27)
        if v_u_25._saved_step_index <= p26 then
            v_u_9.get("TutorialAPI/ReportStepCompleted"):FireServer(p26, p27)
        end
    end)
    v_u_2.get_completed_signal():connect(function()
        v_u_9.get("TutorialAPI/ReportTutorialCompleted"):FireServer()
    end)
    return v_u_25
end
function v_u_11.start(p_u_28)
    task.spawn(function()
        while p_u_28._current_step_index <= #v_u_3 do
            local v29 = v_u_3[p_u_28._current_step_index].new({
                ["destination_id"] = p_u_28.destination_id,
                ["model"] = p_u_28.model,
                ["shared_model"] = p_u_28.shared_model,
                ["placement_cframes"] = p_u_28.placement_cframes,
                ["static_placement_cframes"] = p_u_28.static_placement_cframes,
                ["use_blocks"] = p_u_28.use_blocks,
                ["memory"] = p_u_28.memory
            })
            local v30 = v29:completed_promise()
            if p_u_28._current_step_index >= p_u_28._saved_step_index then
                v29:start()
            else
                v29:skip()
            end
            local v31 = v30:expect()
            v29:destroy()
            local v32 = p_u_28._current_step_index
            local v33 = p_u_28
            v33._current_step_index = v33._current_step_index + 1
            p_u_28._step_signal:Fire(v32, v31)
        end
        v_u_2.flags.set("completed_this_session", true)
        v_u_2.get_completed_signal():Fire()
    end)
    local v34 = p_u_28._saved_step_index - 1
    p_u_28:completed_step_promise((math.max(1, v34))):expect()
end
function v_u_11.completed_step_promise(p_u_35, p_u_36)
    if p_u_36 and p_u_35._current_step_index == p_u_36 + 1 then
        return v_u_4.resolve()
    else
        return v_u_4.fromEvent(p_u_35._step_signal, function()
            return not p_u_36 and true or p_u_35._current_step_index == p_u_36 + 1
        end)
    end
end
function v_u_11.destroy(p37)
    p37._step_signal:destroy()
end
return v_u_11