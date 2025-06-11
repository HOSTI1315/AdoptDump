--// ReplicatedStorage.SharedModules.QueueEffect (ModuleScript)

local v1 = require(game.ReplicatedStorage:WaitForChild("Fsys")).load("Class")("QueueEffect")
function v1.__init(p2, p3)
    local v4 = p3.refresh
    assert(v4)
    p2.refresh = p3.refresh
    p2.queue = {}
end
function v1.set(p5, p6, p7)
    if p7 then
        local v8 = typeof(p7) == "table"
        assert(v8, "Supplied @param data must be a table or nil")
    end
    if p7 then
        p7.id = p6
    end
    p5:clear(p6)
    local v9 = p5.queue
    table.insert(v9, p7 or p6)
    p5.refresh(p5.queue[1])
end
function v1.clear(p10, p11)
    for v12, v13 in pairs(p10.queue) do
        if typeof(v13) == "table" and v13.id == p11 or v13 == p11 then
            table.remove(p10.queue, v12)
            break
        end
    end
    p10.refresh(p10.queue[1])
end
return v1