--// ReplicatedStorage.SharedModules.SimpleEvents.SimpleEventsSignal (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load
local v_u_2 = v1("Maid")
local v_u_3 = v1("Debug")
local v_u_11 = {
    ["connect"] = function(p_u_4, p_u_5)
        coroutine.wrap(function()
            v_u_3.pcall_warn_error(function()
                local v6 = p_u_4.setup
                local v7 = p_u_5
                local v8 = p_u_4.maid
                local v9 = p_u_4.params
                v6(v7, v8, unpack(v9))
            end)
        end)()
        return p_u_4
    end,
    ["disconnect"] = function(p10)
        p10.maid:DoCleaning()
    end
}
v_u_11.Connect = v_u_11.connect
v_u_11.Disconnect = v_u_11.disconnect
return {
    ["new"] = function(p12, ...)
        local v13 = {
            ["__index"] = v_u_11
        }
        local v14 = setmetatable({}, v13)
        v14.setup = p12
        v14.maid = v_u_2.new()
        v14.params = { ... }
        return v14
    end
}