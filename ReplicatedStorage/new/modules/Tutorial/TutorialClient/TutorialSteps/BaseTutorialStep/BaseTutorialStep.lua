--// ReplicatedStorage.new.modules.Tutorial.TutorialClient.TutorialSteps.BaseTutorialStep (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v2 = require(script.Parent.Parent.Parent.Parent.LegacyLoad)
local v_u_3 = v2("Maid")
local v_u_4 = v2("Signal")
local v_u_5 = {}
v_u_5.__index = v_u_5
function v_u_5.new(p6)
    local v7 = v_u_5
    local v8 = setmetatable({
        ["tutorial"] = p6
    }, v7)
    v8:init()
    return v8
end
function v_u_5.init(p9)
    p9.maid = v_u_3.new()
    p9.signal = v_u_4.new()
    p9.promise = v_u_1.fromEvent(p9.signal)
    p9.maid:GiveTask(p9.signal)
end
function v_u_5.start(_)
    error("Not implemented.")
end
function v_u_5.skip(_)
    error("Not implemented.")
end
function v_u_5.completed_promise(p10)
    return p10.promise
end
function v_u_5.destroy(p11)
    p11.maid:DoCleaning()
end
return v_u_5