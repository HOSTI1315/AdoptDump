--// ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialSteps.PlayCatchStep (ModuleScript)

local v1 = require(script.Parent.BaseTutorialStep)
local v_u_2 = require(script.Parent.Parent.Parent.Parent.ABTest.ABTests.TutorialAB)
local v_u_3 = require(script.Parent.Parent.TutorialHelper)
local v_u_4 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_5 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v6 = require(script.Parent.Parent.Parent.Parent.LegacyLoad)
local v_u_7 = v6("ClientToolManager")
local v_u_8 = v6("CloudValues")
local v_u_9 = v6("InventoryDB")
local v_u_10 = v6("MinigameForcedState")
local v_u_11 = v6("RouterClient")
local v_u_12 = v6("UIManager")
local v_u_13 = {}
v_u_13.__index = v_u_13
setmetatable(v_u_13, v1)
function v_u_13.new(p14)
    local v15 = v_u_13
    local v16 = setmetatable({
        ["tutorial"] = p14
    }, v15)
    v16:init()
    return v16
end
function v_u_13.start(p_u_17)
    if v_u_2:get_value("skip_park_step") then
        p_u_17:skip()
    else
        p_u_17:_force_toys_in_backpack()
        p_u_17:_update_minigame_forced_state(true, false)
        local v18 = v_u_8:getValue("tutorial", "waitTimeBeforeSpotlight")
        local v_u_19 = v_u_3.highlight_ailment("play", v18)
        p_u_17.maid:GiveTask(v_u_19)
        p_u_17.maid:GiveTask(v_u_4.fromEvent(v_u_12.app_visibilities_changed, function(p20, p21)
            if p20 ~= "FocusPetApp" then
                p21 = false
            end
            return p21
        end):andThen(function()
            v_u_11.get("TutorialAPI/ReportDiscreteStep"):FireServer("focused_pet_3")
        end))
        p_u_17.maid:GiveTask(v_u_4.fromEvent(v_u_3.flags.get_changed_signal(), function(p22, p23)
            if p22 ~= "started_playground_nav" then
                p23 = false
            end
            return p23
        end):andThen(function()
            p_u_17:_on_navigation_started(v_u_19)
        end))
        p_u_17.maid:GiveTask(v_u_4.fromEvent(v_u_7.get_equipped_changed(), function()
            return v_u_7.is_kind_equipped({
                ["category"] = "toys",
                ["kind"] = "squeaky_bone_default"
            })
        end):andThen(function()
            p_u_17:_update_minigame_forced_state(false, true)
            v_u_12.set_app_visibility("ScreenTapApp", true)
            p_u_17.maid:GiveTask(v_u_4.fromEvent(v_u_3.get_unequipped_signal(), function(p24, p25)
                return p24.category == "toys" and (p25 and p25.from_throw_toy) or false
            end):andThen(function()
                v_u_11.get("TutorialAPI/ReportDiscreteStep"):FireServer("throw_toy")
            end))
        end))
        p_u_17.maid:GiveTask(v_u_4.fromEvent(v_u_3.get_unequipped_signal(), function(p26, p27)
            local v28
            if p26.category == "toys" then
                v28 = not (p27 and p27.from_throw_toy) or false
            else
                v28 = false
            end
            return v28
        end):andThen(function()
            v_u_11.get("TutorialAPI/ReportDiscreteStep"):FireServer("tutorial_toy_unequipped")
        end))
        v_u_3.spawn_ailment("play", function()
            p_u_17.signal:Fire()
        end)
    end
end
function v_u_13._on_navigation_started(p29, p30)
    p30()
    p29:_destroy_start_clips()
    p29:_update_minigame_forced_state(false, false)
    v_u_11.get("TutorialAPI/ReportDiscreteStep"):FireServer("started_playground_nav")
    local v31 = v_u_9.pets[p29.tutorial.memory.pet_kind]
    v_u_12.apps.HintApp:hint({
        ["text"] = ("Your %* wants you to follow them!"):format(v31.name),
        ["length"] = 4,
        ["yields"] = false,
        ["overridable"] = true
    })
end
function v_u_13._destroy_start_clips(p32)
    p32.tutorial.shared_model:FindFirstChild("PlayerClips"):FindFirstChild("Start"):Destroy()
    p32.tutorial.shared_model:FindFirstChild("Border"):Destroy()
end
function v_u_13._force_toys_in_backpack(p33)
    p33.tutorial.memory.restore_categories = v_u_12.apps.BackpackApp:force_visible_categories({ "toys" })
end
function v_u_13._update_minigame_forced_state(p34, p35, p36)
    v_u_10.disable()
    local v37 = v_u_10.enable
    local v38 = v_u_5.Dictionary.mergeDeep
    local v39 = v_u_10.RESTRICT_ALL
    local v40 = {
        ["app_visibility"] = {
            ["app_names"] = {
                "BackpackApp",
                "BucksIndicatorApp",
                "FocusPetApp",
                "GuideArrowApp",
                "NewSpotlightApp",
                "QuestApp",
                "QuestIconApp",
                "ScreenTapApp",
                "ToolApp"
            }
        },
        ["tool_app_lock"] = not p36,
        ["tool_app_world_tap_enabled"] = p36,
        ["can_click_tap_owned_characters"] = p35,
        ["disable_interactions"] = not p35,
        ["hide_ailments"] = false,
        ["hide_age_bar"] = false,
        ["forced_equips"] = {
            ["pets"] = { p34.tutorial.memory.pet_kind },
            ["toys"] = v_u_5.None
        }
    }
    v37(v38(v39, v40))
end
function v_u_13.skip(p41)
    p41:_destroy_start_clips()
    p41:_force_toys_in_backpack()
    p41:_update_minigame_forced_state(false, true)
    v_u_3.flags.set("hide_pet_prompt_when_moving", true)
    v_u_3.flags.set("picked_up_squeaky_bone", true)
    p41.signal:Fire()
end
return v_u_13