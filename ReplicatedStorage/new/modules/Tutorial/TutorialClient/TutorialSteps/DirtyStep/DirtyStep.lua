--// ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialSteps.DirtyStep (ModuleScript)

local v1 = require(script.Parent.BaseTutorialStep)
local v_u_2 = require(script.Parent.Parent.Parent.Parent.SpawnSequenceClient.SpawnSequenceHelper)
local v_u_3 = require(script.Parent.Parent.TutorialHelper)
local v_u_4 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_5 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v6 = require(script.Parent.Parent.Parent.Parent.LegacyLoad)
local v_u_7 = v6("CloudValues")
local v_u_8 = v6("InteriorsM")
local v_u_9 = v6("MinigameForcedState")
local v_u_10 = v6("RouterClient")
local v_u_11 = v6("UIManager")
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
function v_u_12.start(p_u_16)
    p_u_16:_destroy_default_door()
    p_u_16:_update_minigame_forced_state()
    local v17 = v_u_7:getValue("tutorial", "waitTimeBeforeSpotlight")
    local v_u_18 = v_u_3.highlight_ailment("dirty", v17)
    p_u_16.maid:GiveTask(v_u_18)
    p_u_16.maid:GiveTask(v_u_4.fromEvent(v_u_11.app_visibilities_changed, function(p19, p20)
        if p19 ~= "FocusPetApp" then
            p20 = false
        end
        return p20
    end):andThen(function()
        v_u_10.get("TutorialAPI/ReportDiscreteStep"):FireServer("focused_pet_4")
    end))
    p_u_16.maid:GiveTask(v_u_4.fromEvent(v_u_3.flags.get_changed_signal(), function(p21, p22)
        if p21 ~= "started_home_nav" then
            p22 = false
        end
        return p22
    end):andThen(function()
        p_u_16:_on_navigation_started(v_u_18)
    end))
    v_u_3.spawn_ailment("dirty", function()
        v_u_10.get("TutorialAPI/ReportDiscreteStep"):FireServer("cured_dirty_ailment")
        task.wait(2.5)
        v_u_2.show_intro_popups()
    end)
    v_u_4.fromEvent(v_u_8.on_location_changing):andThen(function()
        p_u_16.signal:Fire()
    end)
end
function v_u_12._on_navigation_started(p23, p24)
    p24()
    p23:_destroy_tunnel_clips()
    v_u_10.get("TutorialAPI/ReportDiscreteStep"):FireServer("started_home_nav")
    v_u_3.flags.set("hide_pet_prompt_when_moving", true)
end
function v_u_12._destroy_default_door(_)
    local v25 = v_u_8.get_current_location().interior.Doors:FindFirstChild("MainDoor")
    if v25 then
        v25:Destroy()
    end
end
function v_u_12._destroy_tunnel_clips(p26)
    p26.tutorial.shared_model:FindFirstChild("PlayerClips"):FindFirstChild("Tunnel"):Destroy()
end
function v_u_12._update_minigame_forced_state(_)
    v_u_9.disable()
    local v27 = v_u_9.enable
    local v28 = v_u_5.Dictionary.mergeDeep
    local v29 = v_u_9.RESTRICT_ALL
    local v30 = {
        ["app_visibility"] = {
            ["app_names"] = {
                "BackpackApp",
                "BucksIndicatorApp",
                "FocusPetApp",
                "GuideArrowApp",
                "NewSpotlightApp",
                "QuestApp",
                "QuestIconApp",
                "ToolApp"
            }
        },
        ["can_enter_doors"] = true,
        ["tool_app_lock"] = false,
        ["can_click_tap_owned_characters"] = true,
        ["disable_interactions"] = false,
        ["hide_ailments"] = false,
        ["hide_age_bar"] = false,
        ["forced_equips"] = v_u_5.None
    }
    v27(v28(v29, v30))
end
function v_u_12.skip(p31)
    p31:_destroy_default_door()
    p31:_destroy_tunnel_clips()
    p31:_update_minigame_forced_state()
    v_u_2.show_intro_popups()
    p31.signal:Fire()
end
return v_u_12