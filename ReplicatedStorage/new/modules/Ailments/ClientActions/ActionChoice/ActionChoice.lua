--// ReplicatedStorage.new.modules.Ailments.ClientActions.ActionChoice (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Helpers.ActionHelper)
local v2 = require(script.Parent.Parent.AilmentAction)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v_u_4 = require(script.Parent.Parent.Parent.LegacyLoad)("UIManager")
local v_u_5 = {}
v_u_5.__index = v_u_5
setmetatable(v_u_5, v2)
function v_u_5.new(p6)
    local v7 = v_u_5
    return setmetatable({
        ["choices"] = p6
    }, v7)
end
function v_u_5.start(p_u_8, p_u_9)
    p_u_8._current_action = nil
    local v_u_11 = v_u_3.List.filter(p_u_8.choices, function(p10)
        return not p10.is_valid and true or p10.is_valid(p_u_9)
    end)
    p_u_8._promise = v_u_4.apps.FocusPetApp:select_choice(v_u_11):andThen(function(_, p12)
        if p12 then
            p_u_8._current_action = v_u_11[p12].action
        end
    end):done(function()
        v_u_4.apps.FocusPetApp:stop_selecting_choice()
    end)
    v_u_1.run_promise(p_u_8._promise, { "dialog" })
    local v13 = p_u_8._promise:awaitStatus()
    local v14 = v_u_1.get_result_from_status(v13)
    if v14 and p_u_8._current_action then
        return p_u_8._current_action:start(p_u_9)
    else
        return v14
    end
end
function v_u_5.stop(p15)
    if p15._promise then
        p15._promise:cancel()
    end
    if p15._current_action then
        p15._current_action:stop()
    end
end
return v_u_5