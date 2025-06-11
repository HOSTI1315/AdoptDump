--// ReplicatedStorage.new.modules.Ailments.ClientActions.InlineAction (ModuleScript)

local v1 = require(script.Parent.Parent.AilmentAction)
local v_u_2 = {}
v_u_2.__index = v_u_2
setmetatable(v_u_2, v1)
function v_u_2.new(p3)
    local v4 = v_u_2
    return setmetatable({
        ["callback"] = p3
    }, v4)
end
function v_u_2.start(p5, p6)
    p5._current_action = nil
    local v7 = p5.callback(p6)
    if v7 == nil or typeof(v7) == "boolean" then
        return v7
    else
        p5._current_action = v7
        if p5._current_action then
            return p5._current_action:start(p6)
        else
            return false
        end
    end
end
function v_u_2.stop(p8)
    if p8._current_action then
        p8._current_action:stop()
    end
end
return v_u_2