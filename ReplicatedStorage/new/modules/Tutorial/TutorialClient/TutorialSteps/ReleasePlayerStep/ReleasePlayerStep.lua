--// ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialSteps.ReleasePlayerStep (ModuleScript)

local v1 = require(script.Parent.BaseTutorialStep)
local v_u_2 = require(script.Parent.Parent.Parent.Parent.SpawnSequenceClient.SpawnSequenceHelper)
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
    p8.tutorial.memory.model_cache = nil
    v_u_3.disable()
    p8.tutorial.memory.restore_categories()
    v_u_2.show_minigame_popups()
    p8.signal:Fire()
end
function v_u_4.skip(p9)
    v_u_2.enter_house()
    p9:start()
end
return v_u_4