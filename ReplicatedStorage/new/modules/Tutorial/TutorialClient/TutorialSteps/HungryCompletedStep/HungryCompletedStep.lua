--// ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialSteps.HungryCompletedStep (ModuleScript)

local v1 = require(script.Parent.BaseTutorialStep)
local v_u_2 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_3 = require(script.Parent.Parent.Parent.Parent.LegacyLoad)("MinigameForcedState")
local v_u_4 = {}
v_u_4.__index = v_u_4
setmetatable(v_u_4, v1)
function v_u_4.new(p5)
    local v6 = v_u_4
    local v7 = setmetatable({
        ["tutorial"] = p5
    }, v6)
    v7:init()
    return v7
end
function v_u_4.start(p8)
    p8:_update_minigame_forced_state()
    task.wait(4)
    p8.signal:Fire()
end
function v_u_4._update_minigame_forced_state(p9)
    v_u_3.disable()
    local v10 = v_u_3.enable
    local v11 = v_u_2.Dictionary.mergeDeep
    local v12 = v_u_3.RESTRICT_ALL
    local v13 = {
        ["app_visibility"] = {
            ["app_names"] = { "BucksIndicatorApp" }
        },
        ["hide_ailments"] = false,
        ["hide_age_bar"] = false,
        ["forced_equips"] = {
            ["pets"] = { p9.tutorial.memory.pet_kind }
        }
    }
    v10(v11(v12, v13))
end
function v_u_4.skip(p14)
    p14:_update_minigame_forced_state()
    p14.signal:Fire()
end
return v_u_4