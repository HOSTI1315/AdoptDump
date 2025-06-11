--// ReplicatedStorage.SharedModules.CriticalSection (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Signal")
local v2 = {}
local v_u_3 = {}
function v2.new()
    local v4 = {
        ["__index"] = v_u_3
    }
    local v5 = setmetatable({}, v4)
    v5.queue = {}
    v5.running = false
    return v5
end
function v_u_3.run(p6, p7, ...)
    p6:wait()
    local v8 = { p7(...) }
    p6:signal()
    return unpack(v8)
end
function v_u_3.wrap(p_u_9, p_u_10)
    return function(...)
        return p_u_9:run(p_u_10, ...)
    end
end
function v_u_3.wait(p11)
    if p11.running then
        local v12 = v_u_1.new()
        local v13 = p11.queue
        table.insert(v13, v12)
        v12:Wait()
    end
    p11.running = true
end
function v_u_3.signal(p14)
    p14.running = false
    if #p14.queue > 0 then
        local v15 = p14.queue[1]
        table.remove(p14.queue, 1)
        v15:Fire()
        v15:Destroy()
    end
end
function v_u_3.destroy(p16)
    for _, v17 in pairs(p16.queue) do
        v17:Destroy()
    end
    p16.queue = {}
end
return v2