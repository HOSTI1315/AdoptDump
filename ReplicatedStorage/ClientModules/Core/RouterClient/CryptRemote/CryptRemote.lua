--// ReplicatedStorage.ClientModules.Core.RouterClient.CryptRemote (ModuleScript)

local _ = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v1 = {}
local v_u_2 = nil
local v_u_3 = nil
local v_u_6 = {
    ["FireServer"] = function(p4, ...)
        v_u_2:FireServer(p4.crypt_route, ...)
    end,
    ["InvokeServer"] = function(p5, ...)
        return v_u_3:InvokeServer(p5.crypt_route, ...)
    end
}
function v1.new(p7)
    local v8 = {
        ["crypt_route"] = p7
    }
    local v9 = {
        ["__index"] = v_u_6
    }
    setmetatable(v8, v9)
    return v8
end
function v1.init()
    v_u_2 = game.ReplicatedFirst:WaitForChild("API"):WaitForChild("_remote_event")
    v_u_3 = game.ReplicatedFirst:WaitForChild("API"):WaitForChild("_remote_function")
end
return v1