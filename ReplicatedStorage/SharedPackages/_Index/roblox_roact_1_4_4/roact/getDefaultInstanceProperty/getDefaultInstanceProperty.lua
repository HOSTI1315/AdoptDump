--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.getDefaultInstanceProperty (ModuleScript)

local v_u_1 = require(script.Parent.Symbol).named("Nil")
local v_u_2 = {}
return function(p3, p_u_4)
    local v5 = v_u_2[p3]
    if v5 then
        local v6 = v5[p_u_4]
        if v6 == v_u_1 then
            return true, nil
        end
        if v6 ~= nil then
            return true, v6
        end
    else
        v5 = {}
        v_u_2[p3] = v5
    end
    local v_u_7 = Instance.new(p3)
    local v8, v9 = pcall(function()
        return v_u_7[p_u_4]
    end)
    v_u_7:Destroy()
    if v8 then
        if v9 == nil then
            v5[p_u_4] = v_u_1
            return v8, v9
        end
        v5[p_u_4] = v9
    end
    return v8, v9
end