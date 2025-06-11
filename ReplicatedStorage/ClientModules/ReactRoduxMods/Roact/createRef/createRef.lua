--// ReplicatedStorage.ClientModules.ReactRoduxMods.Roact.createRef (ModuleScript)

local v_u_3 = {
    ["__tostring"] = function(p1)
        local v2 = p1.current
        return ("RoactReference(%s)"):format((tostring(v2)))
    end
}
return function()
    local v4 = v_u_3
    return setmetatable({
        ["current"] = nil
    }, v4)
end