--// ReplicatedStorage.new.modules.Utilities.makeRingBuffer (ModuleScript)

return function(p1)
    local v_u_14 = {
        ["size"] = p1,
        ["_buffer"] = table.create(p1),
        ["_head"] = {
            ["write"] = 1,
            ["read"] = 1,
            ["readHeadBacklog"] = 0
        },
        ["push"] = function(p2)
            v_u_14._buffer[v_u_14._head.write] = p2
            v_u_14.advanceWriteHead()
        end,
        ["pushMany"] = function(p3)
            for _, v4 in p3 do
                v_u_14._buffer[v_u_14._head.write] = v4
                v_u_14.advanceWriteHead()
            end
        end,
        ["pop"] = function()
            if not v_u_14.canRead() then
                error("read head is caught up with write head", 2)
            end
            local v5 = v_u_14._buffer[v_u_14._head.read]
            v_u_14.advanceReadHead()
            return v5
        end,
        ["popMany"] = function(p6)
            local v7 = table.create(p6)
            for v8 = 1, p6 do
                if not v_u_14.canRead() then
                    break
                end
                v7[v8] = v_u_14.pop()
            end
            return v7
        end,
        ["canRead"] = function()
            return v_u_14._head.readHeadBacklog > 0
        end,
        ["getReadBacklogSize"] = function()
            return v_u_14._head.readHeadBacklog
        end,
        ["advanceWriteHead"] = function()
            local v9 = v_u_14._head.write == v_u_14._head.read
            local v10 = v_u_14._head
            v10.write = v10.write + 1
            if v_u_14._head.write > v_u_14.size then
                v_u_14._head.write = 1
            end
            if v9 and v_u_14._head.readHeadBacklog > 0 then
                v_u_14._head.read = v_u_14._head.write
            else
                local v11 = v_u_14._head
                v11.readHeadBacklog = v11.readHeadBacklog + 1
            end
        end,
        ["advanceReadHead"] = function()
            if v_u_14._head.readHeadBacklog == 0 then
                error("read head is caught up with write head", 2)
            end
            local v12 = v_u_14._head
            v12.read = v12.read + 1
            local v13 = v_u_14._head
            v13.readHeadBacklog = v13.readHeadBacklog - 1
            if v_u_14._head.read > v_u_14.size then
                v_u_14._head.read = 1
            end
        end
    }
    table.freeze(v_u_14)
    return v_u_14
end