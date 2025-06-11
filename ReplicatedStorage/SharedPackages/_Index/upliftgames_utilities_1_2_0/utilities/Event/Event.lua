--// ReplicatedStorage.SharedPackages._Index.upliftgames_utilities@1.2.0.utilities.Event (ModuleScript)

local v1 = require(script.Parent.Class)
local v_u_2 = game:GetService("HttpService")
local v3 = v1("Event")
function v3.__init(p4)
    p4.callbacks = {}
end
function v3.connect(p_u_5, p6)
    local v_u_7 = v_u_2:GenerateGUID(false)
    p_u_5.callbacks[v_u_7] = p6
    return {
        ["disconnect"] = function()
            p_u_5.callbacks[v_u_7] = nil
        end
    }
end
function v3.fire(p8, ...)
    for _, v9 in pairs(p8.callbacks) do
        coroutine.wrap(v9)(...)
    end
end
return v3