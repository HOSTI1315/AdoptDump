--// ReplicatedStorage.new.modules.Ailments.ClientActions.DialogAction (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Helpers.ActionHelper)
local v2 = require(script.Parent.Parent.AilmentAction)
local v_u_3 = require(script.Parent.Parent.Parent.LegacyLoad)("UIManager")
local v_u_4 = {}
v_u_4.__index = v_u_4
setmetatable(v_u_4, v2)
function v_u_4.new(p5)
    local v6 = v_u_4
    return setmetatable({
        ["options"] = p5
    }, v6)
end
function v_u_4.start(p7, _)
    local v8, v9 = v_u_3.apps.DialogApp:queue_with_override(p7.options)
    p7._promise = v8
    local v_u_10 = v9
    p7._promise:finally(function()
        v_u_10(nil)
    end)
    v_u_1.run_promise(p7._promise, { "dialog" })
    local v11, v12 = p7._promise:awaitStatus()
    local v13 = v_u_1.get_result_from_status(v11)
    if not v13 then
        return v13
    end
    local v14 = p7.options.confirm
    return not v14 and true or v12 == v14
end
function v_u_4.stop(p15)
    if p15._promise then
        p15._promise:cancel()
    end
end
return v_u_4