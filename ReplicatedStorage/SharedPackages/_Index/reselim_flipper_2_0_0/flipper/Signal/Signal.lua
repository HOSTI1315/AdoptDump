--// ReplicatedStorage.SharedPackages._Index.reselim_flipper@2.0.0.flipper.Signal (ModuleScript)

local v_u_1 = {}
v_u_1.__index = v_u_1
function v_u_1.new(p2, p3)
    local v4 = v_u_1
    return setmetatable({
        ["signal"] = p2,
        ["connected"] = true,
        ["_handler"] = p3
    }, v4)
end
function v_u_1.disconnect(p5)
    if p5.connected then
        p5.connected = false
        for v6, v7 in pairs(p5.signal._connections) do
            if v7 == p5 then
                table.remove(p5.signal._connections, v6)
                return
            end
        end
    end
end
local v_u_8 = {}
v_u_8.__index = v_u_8
function v_u_8.new()
    local v9 = v_u_8
    return setmetatable({
        ["_connections"] = {},
        ["_threads"] = {}
    }, v9)
end
function v_u_8.fire(p10, ...)
    for _, v11 in pairs(p10._connections) do
        v11._handler(...)
    end
    for _, v12 in pairs(p10._threads) do
        coroutine.resume(v12, ...)
    end
    p10._threads = {}
end
function v_u_8.connect(p13, p14)
    local v15 = v_u_1.new(p13, p14)
    local v16 = p13._connections
    table.insert(v16, v15)
    return v15
end
function v_u_8.wait(p17)
    local v18 = p17._threads
    local v19 = coroutine.running
    table.insert(v18, v19())
    return coroutine.yield()
end
return v_u_8