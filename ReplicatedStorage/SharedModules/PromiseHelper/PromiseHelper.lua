--// ReplicatedStorage.SharedModules.PromiseHelper (ModuleScript)

return {
    ["hard_cancel"] = function(p1)
        local v2 = { p1 }
        local v3 = {}
        while #v2 > 0 do
            local v4 = table.remove(v2)
            if not v3[v4] then
                v3[v4] = true
                if v4._parent then
                    local v5 = v4._parent
                    table.insert(v2, v5)
                end
                for v6, _ in v4._consumers or {} do
                    table.insert(v2, v6)
                end
            end
        end
        p1:cancel()
        for v7, _ in v3 do
            v7:cancel()
        end
    end
}