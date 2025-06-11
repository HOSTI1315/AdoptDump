--// ReplicatedStorage.new.modules.Ailments.ClientActions.NavigationAction (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Helpers.ActionHelper)
local v2 = require(script.Parent.Parent.AilmentAction)
local v_u_3 = require(game.ReplicatedStorage.SharedPackages.Promise)
local v_u_4 = require(game.ReplicatedStorage.SharedPackages.Sift)
local v5 = require(script.Parent.Parent.Parent.LegacyLoad)
local v_u_6 = v5("InteriorsM")
local v_u_7 = v5("UIManager")
local v_u_8 = {}
v_u_8.__index = v_u_8
setmetatable(v_u_8, v2)
function v_u_8.new(p9)
    local v10 = v_u_8
    return setmetatable({
        ["options"] = p9
    }, v10)
end
function v_u_8.start(p11, p12)
    v_u_7.apps.FocusPetApp:release_focus()
    p11._promise = v_u_7.apps.GuideArrowApp:navigate_promise(v_u_4.Dictionary.join(p11.options, {
        ["pet_unique"] = p12.pet_unique
    })):andThen(function()
        if v_u_6.entering then
            return v_u_3.new(function(p13, _, p14)
                while v_u_6.entering and not p14() do
                    task.wait()
                end
                p13()
            end)
        end
    end)
    v_u_1.run_promise(p11._promise, { "navigation" })
    local v15 = p11._promise:awaitStatus()
    return v_u_1.get_result_from_status(v15)
end
function v_u_8.stop(p16)
    if p16._promise then
        p16._promise:cancel()
    end
end
return v_u_8