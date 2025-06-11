--// ReplicatedStorage.SharedModules.Lock (ModuleScript)

local v_u_1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Signal")
local v2 = {}
local v_u_3 = {}
function v2.new()
    local v4 = {
        ["__index"] = v_u_3
    }
    local v5 = setmetatable({}, v4)
    v5.locked = false
    v5.queue = {}
    return v5
end
function v_u_3.run(p6, p7)
    if not p6:acquire() then
        return false
    end
    local v8 = p7()
    p6:release()
    return v8
end
function v_u_3.wait(p9)
    while p9.locked do
        local v10 = v_u_1.new()
        local v11 = p9.queue
        table.insert(v11, v10)
        v10:Wait()
    end
end
function v_u_3.is_locked(p12)
    return p12.locked
end
function v_u_3.acquire(p13)
    if p13.locked then
        return false
    end
    p13.locked = true
    return true
end
function v_u_3.release(p14)
    p14.locked = false
    if #p14.queue > 0 then
        local v15 = p14.queue[1]
        table.remove(p14.queue, 1)
        v15:Fire()
        v15:Destroy()
    end
    return true
end
function v_u_3.destroy(p16)
    for _, v17 in pairs(p16.queue) do
        v17:Destroy()
    end
end
return v2