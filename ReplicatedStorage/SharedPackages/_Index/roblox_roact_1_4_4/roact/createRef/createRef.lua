--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.createRef (ModuleScript)

local v_u_1 = require(script.Parent.Binding)
return function()
    local v_u_2, _ = v_u_1.create(nil)
    local v3 = {}
    setmetatable(v3, {
        ["__index"] = function(_, p4)
            if p4 == "current" then
                return v_u_2:getValue()
            else
                return v_u_2[p4]
            end
        end,
        ["__newindex"] = function(_, p5, p6)
            if p5 == "current" then
                error("Cannot assign to the \'current\' property of refs", 2)
            end
            v_u_2[p5] = p6
        end,
        ["__tostring"] = function(_)
            local v7 = v_u_2
            return ("RoactRef(%s)"):format((tostring(v7:getValue())))
        end
    })
    return v3
end