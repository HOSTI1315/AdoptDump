--// ReplicatedStorage.SharedPackages._Index.jsdotlua_shared@17.2.1.shared.PropMarkers.Change (ModuleScript)

local v_u_1 = require(script.Parent.Parent:WaitForChild("Type.roblox"))
local v_u_2 = {}
local v_u_4 = {
    ["__tostring"] = function(p3)
        return string.format("RoactHostChangeEvent(%s)", p3.name)
    end
}
setmetatable(v_u_2, {
    ["__index"] = function(_, p5)
        local v6 = {
            [v_u_1] = v_u_1.HostChangeEvent,
            ["name"] = p5
        }
        local v7 = v_u_4
        setmetatable(v6, v7)
        v_u_2[p5] = v6
        return v6
    end
})
return v_u_2