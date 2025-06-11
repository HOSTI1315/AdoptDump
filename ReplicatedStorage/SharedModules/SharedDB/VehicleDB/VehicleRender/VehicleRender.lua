--// ReplicatedStorage.SharedModules.SharedDB.VehicleDB.VehicleRender (ModuleScript)

local v1 = {}
local function v_u_2() end
for _, v3 in script:GetChildren() do
    for v4, v5 in require(v3) do
        local v6 = not v1[v4]
        local v7 = ("There\'s a kind overlap in the Vehicle Render DB for [%*]"):format(v4)
        assert(v6, v7)
        if v5.client then
            local v_u_8 = v5.client
            function v5.client(...)
                return v_u_8(...) or v_u_2
            end
        end
        if v5.server then
            local v_u_9 = v5.server
            function v5.server(...)
                return v_u_9(...) or v_u_2
            end
        end
        v1[v4] = v5
    end
end
v1.default = {
    ["server"] = function(_, _, _, _)
        return v_u_2
    end,
    ["client"] = function(_, _, _, _)
        return v_u_2
    end
}
return v1