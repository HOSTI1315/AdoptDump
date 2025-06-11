--// ReplicatedStorage.SharedModules.tpcall (ModuleScript)

return function(p1, ...)
    local v_u_2 = nil
    local v_u_3 = nil
    local v5 = table.pack(xpcall(p1, function(p4)
        v_u_2 = p4
        v_u_3 = debug.traceback(nil, 2) or "No traceback"
    end, ...))
    if not v5[1] then
        return false, v_u_2, v_u_3
    end
    local v6 = v5.n
    return true, table.unpack(v5, 2, v6)
end