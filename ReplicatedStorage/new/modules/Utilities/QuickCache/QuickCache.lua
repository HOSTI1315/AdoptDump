--// ReplicatedStorage.new.modules.Utilities.QuickCache (ModuleScript)

local v_u_1 = {}
local v_u_2 = false
return function(p3, p4)
    local v5 = v_u_1[p3]
    if v5 then
        return v5
    end
    local v6 = p4()
    v_u_1[p3] = v6
    if not v_u_2 then
        v_u_2 = true
        task.defer(function()
            table.clear(v_u_1)
            v_u_2 = false
        end)
    end
    return v6
end