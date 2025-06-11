--// ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialSteps.HungryStep (ModuleScript)

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
function v_u_10.start(p_u_14)
    v_u_8.get("TutorialAPI/SpawnPetTreat"):FireServer()
    local v15 = p_u_14.tutorial.memory.controllers.sir_woofington
    local v16 = p_u_14.tutorial.memory.sir_woofington
    local v17 = p_u_14.tutorial.use_blocks.sir_woofington
    local v18 = v_u_2.run_dialog(v15, v16, v17, 3, {
        ["pet_kind"] = p_u_14.tutorial.memory.pet_kind,
        ["pet_name"] = p_u_14.tutorial.memory.pet_name,
        ["play_now"] = true
    })
    p_u_14.maid:GiveTask(v18)
    p_u_14:_update_minigame_forced_state()
    local v19 = v_u_6:getValue("tutorial", "waitTimeBeforeSpotlight")
    p_u_14.maid:GiveTask(v_u_2.highlight_ailment("hungry", v19))
    p_u_14.maid:GiveTask(v_u_3.fromEvent(v_u_9.app_visibilities_changed, function(p20, p21)
        if p20 ~= "FocusPetApp" then
            p21 = false
        end
        return p21
    end):andThen(function()
        v_u_8.get("TutorialAPI/ReportDiscreteStep"):FireServer("focused_pet_2")
    end))
    v_u_2.spawn_ailment("hungry", function()
        v_u_9.set_app_visibility("FocusPetApp", false)
        p_u_14.signal:Fire()
    end)
end
function v_u_10._update_minigame_forced_state(p22)
    v_u_7.disable()
    local v23 = v_u_7.enable
    local v24 = v_u_4.Dictionary.mergeDeep
    local v25 = v_u_7.RESTRICT_ALL
    local v26 = {
        ["app_visibility"] = {
            ["app_names"] = {
                "BackpackApp",
                "BucksIndicatorApp",
                "FocusPetApp",
                "NewSpotlightApp"
            }
        },
        ["can_click_tap_owned_characters"] = true,
        ["disable_interactions"] = false,
        ["hide_ailments"] = false,
        ["hide_age_bar"] = false,
        ["forced_equips"] = {
            ["pets"] = { p22.tutorial.memory.pet_kind }
        }
    }
    v23(v24(v25, v26))
end
function v_u_10.skip(p27)
    p27:_update_minigame_forced_state()
    p27.signal:Fire()
end
return v_u_10