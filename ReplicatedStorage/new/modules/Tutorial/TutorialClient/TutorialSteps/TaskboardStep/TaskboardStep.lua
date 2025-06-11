--// ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialSteps.TaskboardStep (ModuleScript)

local v1 = require(script.Parent.BaseTutorialStep)
local v_u_2 = require(script.Parent.Parent.TutorialHelper)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_4 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v5 = require(script.Parent.Parent.Parent.Parent.LegacyLoad)
local v_u_6 = v5("CloudValues")
local v_u_7 = v5("MinigameForcedState")
local v_u_8 = v5("RouterClient")
local v_u_9 = v5("UIManager")
local v_u_10 = {}
v_u_10.__index = v_u_10
setmetatable(v_u_10, v1)
function v_u_10.new(p11)
    local v12 = v_u_10
    local v13 = setmetatable({
        ["tutorial"] = p11
    }, v12)
    v13:init()
    return v13
end
function v_u_10.start(p14)
    v_u_8.get("TutorialAPI/AddTutorialQuest"):FireServer()
    local v15 = p14.tutorial.memory.controllers.sir_woofington
    local v16 = p14.tutorial.memory.sir_woofington
    local v17 = p14.tutorial.use_blocks.sir_woofington
    local v18 = v_u_2.run_dialog(v15, v16, v17, 4, {
        ["pet_kind"] = p14.tutorial.memory.pet_kind,
        ["pet_name"] = p14.tutorial.memory.pet_name,
        ["play_now"] = true
    })
    p14.maid:GiveTask(v18)
    p14:_update_minigame_forced_state()
    v_u_9.apps.QuestIconApp:enable_animations()
    local v19 = v_u_6:getValue("tutorial", "waitTimeBeforeSpotlight")
    local v_u_20 = nil
    v_u_3.race({ v_u_3.delay(v19):andThen(function()
            local v_u_21 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("QuestIconApp")
            if v_u_21 then
                v_u_21 = v_u_21:FindFirstChild("ImageButton")
            end
            v_u_20 = v_u_9.apps.NewSpotlightApp:target(function()
                return v_u_21, Vector2.xAxis
            end)
            return v_u_3.new(function() end)
        end), v_u_3.fromEvent(v_u_9.app_visibilities_changed, function(p22, p23)
            if p22 ~= "QuestApp" then
                p23 = false
            end
            return p23
        end) }):expect()
    if v_u_20 then
        v_u_20()
    end
    v_u_8.get("TutorialAPI/ReportDiscreteStep"):FireServer("opened_taskboard")
    v_u_3.race({ v_u_3.fromEvent(v_u_9.app_visibilities_changed, function(p24, p25)
            local v26
            if p24 == "QuestApp" then
                v26 = not p25
            else
                v26 = false
            end
            return v26
        end), v_u_9.apps.DialogApp:queue_with_override({
            ["text"] = "This is your personal task board.",
            ["button"] = "Next"
        }):andThen(function()
            return v_u_9.apps.DialogApp:queue_with_override({
                ["text"] = "Complete tasks to earn Bucks!",
                ["button"] = "Okay!"
            })
        end):andThen(function()
            return v_u_3.new(function() end)
        end) }):expect()
    task.wait(0.5)
    p14.signal:Fire()
end
function v_u_10._update_minigame_forced_state(p27)
    v_u_7.disable()
    local v28 = v_u_7.enable
    local v29 = v_u_4.Dictionary.mergeDeep
    local v30 = v_u_7.RESTRICT_ALL
    local v31 = {
        ["app_visibility"] = {
            ["app_names"] = {
                "BucksIndicatorApp",
                "NewSpotlightApp",
                "QuestApp",
                "QuestIconApp"
            }
        },
        ["hide_ailments"] = false,
        ["hide_age_bar"] = false,
        ["forced_equips"] = {
            ["pets"] = { p27.tutorial.memory.pet_kind }
        }
    }
    v28(v29(v30, v31))
end
function v_u_10.skip(p32)
    p32:_update_minigame_forced_state()
    v_u_9.apps.QuestIconApp:enable_animations()
    p32.signal:Fire()
end
return v_u_10