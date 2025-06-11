--// ReplicatedStorage.SharedPackages._Index.jsdotlua_react-roblox@17.2.1.react-roblox.client.roblox.getDefaultInstanceProperty (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Parent.Parent:WaitForChild("shared")).Symbol.named("Nil")
local v_u_2 = {}
local function v_u_5(p3, p4)
    return p3[p4]
end
return function(p6, p7)
    local v8 = v_u_2[p6]
    if v8 then
        local v9 = v8[p7]
        if v9 == v_u_1 then
            return true, nil
        end
        if v9 ~= nil then
            return true, v9
        end
    else
        v8 = {}
        v_u_2[p6] = v8
    end
    local v10 = Instance.new(p6)
    local v11, v12 = pcall(v_u_5, v10, p7)
    v10:Destroy()
    if v11 then
        if v12 == nil then
            v8[p7] = v_u_1
            return v11, v12
        end
        v8[p7] = v12
    end
    return v11, v12
end