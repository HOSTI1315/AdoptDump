--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.Type.roblox (ModuleScript)

local v1 = require(script.Parent:WaitForChild("Symbol.roblox"))
local v_u_2 = newproxy(true)
local v4 = {
    ["HostChangeEvent"] = v1.named("RoactHostChangeEvent"),
    ["HostEvent"] = v1.named("RoactHostEvent"),
    ["of"] = function(p3)
        if typeof(p3) == "table" then
            return p3[v_u_2]
        else
            return nil
        end
    end
}
getmetatable(v_u_2).__index = v4
getmetatable(v_u_2).__tostring = function()
    return "RoactType"
end
return v_u_2