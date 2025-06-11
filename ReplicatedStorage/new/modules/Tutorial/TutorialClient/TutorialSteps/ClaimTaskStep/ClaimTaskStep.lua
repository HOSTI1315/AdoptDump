--// ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialSteps.ClaimTaskStep (ModuleScript)

local v1 = require(script.Parent.BaseTutorialStep)
local v_u_2 = require(script.Parent.Parent.Parent.Parent.ABTest.ABTests.TutorialAB)
local v_u_3 = require(script.Parent.Parent.TutorialHelper)
local v_u_4 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v5 = require(script.Parent.Parent.Parent.Parent.LegacyLoad)
local v_u_6 = v5("ClientData")
local v_u_7 = v5("ClientToolManager")
local v_u_8 = v5("CloudValues")
local v_u_9 = v5("RouterClient")
local v_u_10 = v5("Signal")
local v_u_11 = v5("UIManager")
local v_u_12 = {}
v_u_12.__index = v_u_12
setmetatable(v_u_12, v1)
function v_u_12.new(p13)
    local v14 = v_u_12
    local v15 = setmetatable({
        ["tutorial"] = p13
    }, v14)
    v15:init()
    return v15
end
function v_u_12.start(p16)
    if v_u_2:get_value("skip_park_step") then
        p16:skip()
    else
        local v17 = v_u_8:getValue("tutorial", "waitTimeBeforeSpotlight")
        local v_u_18 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("QuestIconApp")
        if v_u_18 then
            v_u_18 = v_u_18:FindFirstChild("ImageButton")
        end
        local v_u_19 = v_u_10.new()
        p16.maid:GiveTask(v_u_19)
        p16.maid:GiveTask(v_u_6.register_callback("quest_manager", function(p20, p21, _)
            if p20 == game.Players.LocalPlayer then
                v_u_19:Fire(p21)
            end
        end))
        local v24 = v_u_3.highlight(function()
            if v_u_11.is_visible("QuestApp") then
                local v22 = v_u_11.apps.QuestApp.instance:FindFirstChild("QuestTemplate", true)
                local v23
                if v22 then
                    v23 = v22.Body.ButtonFrame.Button
                else
                    v23 = nil
                end
                if v23 then
                    return v23, Vector2.yAxis
                else
                    return nil
                end
            else
                return v_u_18, Vector2.xAxis
            end
        end, v17)
        v_u_4.fromEvent(v_u_11.app_visibilities_changed, function(p25, p26)
            if p25 ~= "QuestApp" then
                p26 = false
            end
            return p26
        end):expect()
        v_u_9.get("TutorialAPI/ReportDiscreteStep"):FireServer("opened_taskboard_2")
        v_u_4.fromEvent(v_u_19, function(p27)
            for _, v28 in p27.quests_cached do
                if v28.entry_name == "tutorial_age_up_pet" then
                    return false
                end
            end
            return true
        end):expect()
        v24()
        v_u_4.fromEvent(v_u_11.app_visibilities_changed, function(p29, p30)
            local v31
            if p29 == "QuestApp" then
                v31 = not p30
            else
                v31 = false
            end
            return v31
        end):expect()
        for _, v32 in v_u_7.get_equipped_by_category("toys") do
            v_u_7.unequip(v32)
        end
        task.wait(0.5)
        p16.signal:Fire()
    end
end
function v_u_12.skip(p33)
    p33.signal:Fire()
end
return v_u_12