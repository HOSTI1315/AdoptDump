--// ReplicatedStorage.SharedModules.SharedDB.VehicleDB.VehicleProperties (ModuleScript)

local v1 = require(script.Parent.VehicleRender)
local v2 = {}
for _, v3 in script:GetChildren() do
    for v4, v5 in require(v3) do
        local v6 = not v2[v4]
        local v7 = ("There\'s a kind overlap in the Vehicle Properties DB for [%*]"):format(v4)
        assert(v6, v7)
        v5.vehicle_render_effects = v5.vehicle_render_effects or {}
        if v1[v4] and not table.find(v5.vehicle_render_effects, v4) then
            local v8 = v5.vehicle_render_effects
            table.insert(v8, v4)
        end
        v2[v4] = v5
    end
end
return v2