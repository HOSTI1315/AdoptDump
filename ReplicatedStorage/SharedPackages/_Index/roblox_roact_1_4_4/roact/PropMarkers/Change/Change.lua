--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.PropMarkers.Change (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Type)
local v_u_2 = {}
local v_u_4 = {
    ["__tostring"] = function(p3)
        return ("RoactHostChangeEvent(%s)"):format(p3.name)
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