--// ReplicatedStorage.ClientModules.Utilities.CoreCall (ModuleScript)

local v_u_1 = game:GetService("StarterGui")
local v_u_2 = game:GetService("RunService")
return function(p3, ...)
    local v4 = {}
    for _ = 1, 8 do
        v4 = table.pack(pcall(v_u_1[p3], v_u_1, ...))
        if v4[1] then
            break
        end
        v_u_2.Stepped:Wait()
    end
    local v5 = v4.n
    return unpack(v4, 1, v5)
end