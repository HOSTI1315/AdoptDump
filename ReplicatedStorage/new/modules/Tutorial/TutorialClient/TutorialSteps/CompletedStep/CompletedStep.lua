--// ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialSteps.CompletedStep (ModuleScript)

local v1 = require(script.Parent.BaseTutorialStep)
local v_u_2 = {}
v_u_2.__index = v_u_2
setmetatable(v_u_2, v1)
function v_u_2.new(p3)
    local v4 = v_u_2
    local v5 = setmetatable({
        ["tutorial"] = p3
    }, v4)
    v5:init()
    return v5
end
function v_u_2.start(p6)
    local v7 = p6.tutorial.memory.controllers
    p6.tutorial.model:Destroy()
    p6.tutorial.shared_model:Destroy()
    for _, v8 in v7 do
        v8:destroy()
    end
    p6.tutorial.memory.controllers = nil
    p6.signal:Fire()
end
function v_u_2.skip(p9)
    p9:start()
end
return v_u_2