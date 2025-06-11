--// ReplicatedStorage.new.modules.Ailments.ClientActions.ActionQueue (ModuleScript)

local v1 = require(script.Parent.Parent.AilmentAction)
local v_u_2 = {}
v_u_2.__index = v_u_2
setmetatable(v_u_2, v1)
function v_u_2.new(p3)
    local v4 = v_u_2
    return setmetatable({
        ["actions"] = p3,
        ["_is_running"] = false
    }, v4)
end
function v_u_2.start(p5, p6)
    p5._is_running = true
    p5._current_action = nil
    local v7 = false
    for _, v8 in p5.actions do
        p5._current_action = v8
        local v9 = v8:start(p6)
        if v9 == nil then
            return nil
        end
        if v9 then
            return true
        end
        task.wait()
        if not p5._is_running then
            break
        end
    end
    return v7
end
function v_u_2.stop(p10)
    p10._is_running = false
    if p10._current_action then
        p10._current_action:stop()
    end
end
return v_u_2