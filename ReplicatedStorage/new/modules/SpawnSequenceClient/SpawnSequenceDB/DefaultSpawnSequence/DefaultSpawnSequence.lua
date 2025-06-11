--// ReplicatedStorage.new.modules.SpawnSequenceClient.SpawnSequenceDB.DefaultSpawnSequence (ModuleScript)

local v1 = require(script.Parent.Parent.BaseSpawnSequence)
local v_u_2 = require(script.Parent.Parent.SpawnSequenceHelper)
local v_u_3 = require(script.Parent.Parent.Parent.ABTest.ABTests.StarterPackAB)
local v_u_4 = require(script.Parent.Parent.Parent.ABTest.ABTests.TutorialAB)
local v5 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_6 = v5("LegacyTutorial")
local v_u_7 = v5("RouterClient")
local v_u_8 = v5("ServerType")
local v_u_9 = v5("UIManager")
local v10 = {}
v10.__index = v10
setmetatable(v10, v1)
v10.priority = 1
function v10.is_valid()
    return true
end
function v10.run(p11)
    local v12 = not v_u_4:get_value("use_new_tutorial")
    if v12 then
        v12 = not v_u_6.is_tutorial_completed()
    end
    if v12 and v_u_2.get_should_skip_tutorial() then
        v_u_7.get("TutorialAPI/SkipTutorial"):FireServer()
        v12 = false
    end
    if v_u_2.get_saved_spawn() == "Home" then
        v_u_2.preload_house()
    else
        v_u_2.preload_main_map()
    end
    v_u_2.exit_loading_screen(p11, function()
        v_u_9.set_app_visibility("MainMenuApp", true)
    end)
    if v_u_8.use_test_lab_behavior() then
        v_u_9.apps.ExperimentalNewsApp:show_news()
    else
        v_u_9.apps.NewsApp:show_news()
    end
    v_u_9.apps.MainMenuApp:show_reward_notifications(true)
    v_u_2.pick_theme_color()
    local v_u_13 = v12 and "Home" or v_u_2.choose_spawn()
    v_u_2.callback_in_transition(function()
        if v_u_13 == "Home" then
            v_u_2.enter_house()
        else
            v_u_2.enter_main_map()
        end
        v_u_9.set_app_visibility("MainMenuApp", false)
    end)
    v_u_2.connect_apps()
    if v12 then
        v_u_2.run_legacy_tutorial()
    elseif v_u_3:get_value("show_starter_pack") then
        v_u_9.apps.FTUEStarterPackApp:try_show(true):expect()
    end
    v_u_2.enable_house_exit()
    v_u_2.show_intro_popups()
    v_u_2.show_minigame_popups()
    task.wait(0.5)
    v_u_2.finish_sequence()
end
return v10