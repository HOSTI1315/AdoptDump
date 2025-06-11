--// ReplicatedStorage.ClientModules.ReactRoduxMods.RoactRodux.connect (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Roact)
local v_u_2 = require(script.Parent.storeKey)
local function v_u_9(p3, p4)
    for v5, v6 in pairs(p3) do
        if p4[v5] ~= v6 then
            return false
        end
    end
    for v7, v8 in pairs(p4) do
        if p3[v7] ~= v8 then
            return false
        end
    end
    return true
end
local function v_u_17(p10, p11)
    local v12 = {}
    for v13, v14 in pairs(p10) do
        v12[v13] = v14
    end
    for v15, v16 in pairs(p11) do
        v12[v15] = v16
    end
    return v12
end
local function v_u_18(...)
    error(table.concat({ ... }, "\n"))
end
return function(p_u_19)
    local v_u_20 = debug.traceback()
    return function(p_u_21)
        if p_u_21 == nil then
            error("Expected component to be passed to connection, got nil.")
        end
        local v22 = ("Connection(%s)"):format((tostring(p_u_21)))
        local v23 = v_u_1.Component:extend(v22)
        function v23.init(p24, p25)
            local v26 = p24._context[v_u_2]
            if not v26 then
                local v27 = p_u_21
                v_u_18("Cannot initialize Roact-Rodux component without being a descendent of StoreProvider!", ("Tried to wrap component %q"):format((tostring(v27))), "Make sure there is a StoreProvider above this component in the tree.")
            end
            p24.store = v26
            local v28 = {}
            local v29 = p_u_19(v26, p25)
            if type(v29) ~= "table" then
                v_u_18("mapStoreToProps must return a table! Check the function passed into \'connect\' at:", v_u_20)
            end
            v28.storeProps = v29
            p24.state = v28
        end
        function v23.didMount(p_u_30)
            p_u_30.eventHandle = p_u_30.store.changed:connect(function(_)
                local v31 = p_u_19(p_u_30.store, p_u_30.props)
                if type(v31) ~= "table" then
                    v_u_18("mapStoreToProps must return a table! Check the function passed into \'connect\' at:", v_u_20)
                end
                if not v_u_9(p_u_30.state.storeProps, v31) then
                    p_u_30:setState({
                        ["storeProps"] = v31
                    })
                end
            end)
        end
        function v23.willUnmount(p32)
            p32.eventHandle:disconnect()
        end
        function v23.render(p33)
            local v34 = v_u_17(p33.props, p33.state.storeProps)
            return v_u_1.createElement(p_u_21, v34)
        end
        return v23
    end
end