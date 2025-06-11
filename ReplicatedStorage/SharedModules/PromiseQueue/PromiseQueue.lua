--// ReplicatedStorage.SharedModules.PromiseQueue (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Class")("PromiseQueue")
function v1.enqueue(p2, p3)
    if not p2.destroyed then
        local v4 = p2.queue
        table.insert(v4, p3)
        if #p2.queue == 1 then
            p2:_fire_next_callback()
        end
    end
end
function v1.cancel(p5)
    if not p5.destroyed then
        if p5.current_promise then
            p5.current_promise:cancel()
            p5.current_promise = nil
        end
        p5.queue = {}
    end
end
function v1.destroy(p6)
    if not p6.destroyed then
        p6:cancel()
        p6.destroyed = true
    end
end
function v1._fire_next_callback(p_u_7)
    if not p_u_7.destroyed and #p_u_7.queue ~= 0 then
        p_u_7.current_promise = p_u_7.queue[1]():andThen(function()
            table.remove(p_u_7.queue, 1)
            p_u_7:_fire_next_callback()
        end)
    end
end
function v1.__init(p8)
    p8.queue = {}
    p8.current_promise = nil
    p8.destroyed = false
end
return v1