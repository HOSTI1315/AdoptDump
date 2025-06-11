--// ReplicatedStorage.ClientModules.ReactRoduxMods.RoactRodux.StoreProvider (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Roact)
local v_u_2 = require(script.Parent.storeKey)
local v3 = v_u_1.Component:extend("StoreProvider")
function v3.init(p4, p5)
    local v6 = p5.store
    if v6 == nil then
        error("Error initializing StoreProvider. Expected a `store` prop to be a Rodux store.")
    end
    p4._context[v_u_2] = v6
end
function v3.render(p7)
    return v_u_1.oneChild(p7.props[v_u_1.Children])
end
return v3