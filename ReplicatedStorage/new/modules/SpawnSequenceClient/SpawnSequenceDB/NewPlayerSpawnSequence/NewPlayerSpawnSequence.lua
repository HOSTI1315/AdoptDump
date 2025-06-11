--// ReplicatedStorage.new.modules.SpawnSequenceClient.SpawnSequenceDB.NewPlayerSpawnSequence (ModuleScript)

local v1 = require(script.Parent.Parent.BaseSpawnSequence)
local v_u_2 = require(script.Parent.Parent.SpawnSequenceHelper)
local v_u_3 = require(script.Parent.Parent.Parent.Tutorial.TutorialClient.Tutorial)
local v_u_4 = require(script.Parent.Parent.Parent.ABTest.ABTests.TutorialAB)
local v_u_5 = require(script.Parent.Parent.Parent.Tutorial.TutorialClient.TutorialHelper)
local v6 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_7 = v6("ControlsDisabler")
local v_u_8 = v6("InteriorsM")
local v_u_9 = v6("RouterClient")
local v10 = {}
v10.__index = v10
setmetatable(v10, v1)
v10.priority = 5
function v10.is_valid()
    if not v_u_4:get_value("use_new_tutorial") then
        return false
    end
    if v_u_5.is_completed() then
        return false
    end
    local v11 = v_u_2.get_should_skip_tutorial()
    if v11 then
        v_u_9.get("TutorialAPI/SkipTutorial"):FireServer()
    end
    return not v11
end
function v10.run(p12)
    v_u_7.disable_controls("tutorial")
    local v_u_13 = v_u_9.get("TutorialAPI/StartTutorial"):InvokeServer()
    v_u_2.preload_main_map(v_u_13)
    v_u_2.enter_starting_interior(function()
        v_u_8.enter(v_u_13, "MainDoor")
    end)
    v_u_2.exit_loading_screen(p12, function()
        v_u_3.new(v_u_13):start()
    end)
    v_u_2.connect_apps()
    v_u_2.enable_house_exit()
end
return v10