--// ReplicatedStorage.ClientModules.ReactRoduxMods.RoactRodux.connect2 (ModuleScript)

local v_u_1 = require(script.Parent.Parent.Roact)
local v_u_2 = require(script.Parent.storeKey)
local v_u_3 = require(script.Parent.shallowEqual)
local v_u_4 = require(script.Parent.join)
local function v_u_5()
    return nil
end
return function(p_u_6, p_u_7)
    local v_u_8 = debug.traceback()
    if p_u_6 == nil then
        p_u_6 = v_u_5
    else
        local v9 = typeof(p_u_6) == "function"
        assert(v9, "mapStateToProps must be a function or nil!")
    end
    if p_u_7 == nil then
        p_u_7 = v_u_5
    else
        local v10 = typeof(p_u_7) == "function"
        assert(v10, "mapDispatchToProps must be a function or nil!")
    end
    return function(p_u_11)
        if p_u_11 == nil then
            local v12 = { v_u_8 }
            local v13 = table.concat({ "connect returns a function that must be passed a component.", "Check the connection at:", "%s" }, "\n"):format(unpack(v12 or {}))
            error(v13, 2)
        end
        local v14 = ("RoduxConnection(%s)"):format((tostring(p_u_11)))
        local v15 = v_u_1.Component:extend(v14)
        function v15.getDerivedStateFromProps(p16, p17)
            return p17.stateUpdater(p16, p17)
        end
        function v15.init(p_u_18)
            p_u_18.store = p_u_18._context[v_u_2]
            if p_u_18.store == nil then
                local v19 = {}
                local v20 = p_u_11
                __set_list(v19, 1, {(tostring(v20))})
                local v21 = table.concat({ "Cannot initialize Roact-Rodux connection without being a descendent of StoreProvider!", "Tried to wrap component %q", "Make sure there is a StoreProvider above this component in the tree." }, "\n"):format(unpack(v19 or {}))
                error(v21)
            end
            local v22 = p_u_18.store:getState()
            local v23 = p_u_6
            local v24 = v23(v22, p_u_18.props)
            local v25
            if typeof(v24) == "function" then
                v25 = v24(v22, p_u_18.props)
            else
                v25 = v24
                v24 = v23
            end
            if v25 ~= nil and typeof(v25) ~= "table" then
                local v26 = { tostring(v25), (typeof(v25)) }
                local v27 = table.concat({ "mapStateToProps must either return a table, or return another function that returns a table.", "Instead, it returned %q, which is of type %s." }, "\n"):format(unpack(v26 or {}))
                error(v27)
            end
            local v28 = p_u_7(function(...)
                return p_u_18.store:dispatch(...)
            end)
            local v_u_29 = p_u_18.store
            local function v33(p30, p31, p32)
                if p32 == nil then
                    p32 = p31.mapStateToProps(v_u_29:getState(), p30)
                end
                return {
                    ["mappedStoreState"] = p32,
                    ["propsForChild"] = v_u_4(p30, p32, p31.mappedStoreDispatch)
                }
            end
            p_u_18.state = {
                ["stateUpdater"] = v33,
                ["mapStateToProps"] = v24,
                ["mappedStoreDispatch"] = v28,
                ["propsForChild"] = nil
            }
            p_u_18.state.propsForChild = v33(p_u_18.props, p_u_18.state, v25)
        end
        function v15.didMount(p_u_34)
            p_u_34.storeChangedConnection = p_u_34.store.changed:connect(function(p_u_35)
                p_u_34:setState(function(p36, p37)
                    local v38 = p36.mapStateToProps(p_u_35, p37)
                    if v_u_3(v38, p36.mappedStoreState) then
                        return nil
                    else
                        return p36.stateUpdater(p37, p36, v38)
                    end
                end)
            end)
        end
        function v15.willUnmount(p39)
            p39.storeChangedConnection:disconnect()
        end
        function v15.render(p40)
            return v_u_1.createElement(p_u_11, p40.state.propsForChild)
        end
        return v15
    end
end