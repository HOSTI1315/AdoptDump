--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Component.spec.getDerivedStateFromProps.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Parent.assertDeepEqual)
    local v_u_2 = require(script.Parent.Parent.createSpy)
    local v_u_3 = require(script.Parent.Parent.createElement)
    local v_u_4 = require(script.Parent.Parent.createFragment)
    local v5 = require(script.Parent.Parent.createReconciler)
    local v6 = require(script.Parent.Parent.NoopRenderer)
    local v_u_7 = require(script.Parent.Parent.Component)
    local v_u_8 = v5(v6)
    it("should be invoked on initial mount", function()
        local v9 = v_u_2()
        local v10 = v_u_7:extend("WithDerivedState")
        v10.getDerivedStateFromProps = v9.value
        function v10.render(_)
            return nil
        end
        local v11 = v_u_3(v10, {
            ["someProp"] = 1
        })
        v_u_8.mountVirtualNode(v11, nil, "WithDerivedState")
        expect(v9.callCount).to.equal(1)
        local v12 = v9:captureValues("props", "state")
        v_u_1(v12.props, {
            ["someProp"] = 1
        })
        v_u_1(v12.state, {})
    end)
    it("should be invoked when updated via props", function()
        local v13 = v_u_2()
        local v14 = v_u_7:extend("WithDerivedState")
        v14.getDerivedStateFromProps = v13.value
        function v14.render(_)
            return nil
        end
        local v15 = v_u_8.mountVirtualNode(v_u_3(v14, {
            ["someProp"] = 1
        }), nil, "WithDerivedState")
        v_u_8.updateVirtualNode(v15, v_u_3(v14, {
            ["someProp"] = 2
        }))
        expect(v13.callCount).to.equal(2)
        local v16 = v13:captureValues("props", "state")
        v_u_1(v16.props, {
            ["someProp"] = 2
        })
        v_u_1(v16.state, {})
    end)
    it("should be invoked when updated via state", function()
        local v17 = v_u_2()
        local v18 = v_u_7:extend("WithDerivedState")
        v18.getDerivedStateFromProps = v17.value
        function v18.init(p19)
            p19:setState({
                ["someState"] = 1
            })
        end
        function v18.render(_)
            return nil
        end
        local v20 = v_u_3(v18)
        local v21 = v_u_8.mountVirtualNode(v20, nil, "WithDerivedState")
        v_u_8.updateVirtualNode(v21, v20, {
            ["someState"] = 2
        })
        expect(v17.callCount).to.equal(4)
        local v22 = v17:captureValues("props", "state")
        v_u_1(v22.props, {})
        v_u_1(v22.state, {
            ["someState"] = 2
        })
    end)
    it("should be invoked when updating via state in init (which skips reconciliation)", function()
        local v23 = v_u_2()
        local v24 = v_u_7:extend("WithDerivedState")
        v24.getDerivedStateFromProps = v23.value
        function v24.init(p25)
            p25:setState({
                ["stateFromInit"] = 1
            })
        end
        function v24.render(_)
            return nil
        end
        local v26 = v_u_3(v24, {
            ["someProp"] = 1
        })
        v_u_8.mountVirtualNode(v26, nil, "WithDerivedState")
        expect(v23.callCount).to.equal(3)
        local v27 = v23:captureValues("props", "state")
        v_u_1(v27.props, {
            ["someProp"] = 1
        })
        v_u_1(v27.state, {
            ["stateFromInit"] = 1
        })
    end)
    it("should receive defaultProps", function()
        local v28 = v_u_2()
        local v29 = v_u_7:extend("WithDerivedState")
        v29.defaultProps = {
            ["someDefaultProp"] = "foo"
        }
        v29.getDerivedStateFromProps = v28.value
        function v29.render(_)
            return nil
        end
        local v30 = v_u_3(v29, {
            ["someProp"] = 1
        })
        local v31 = v_u_8.mountVirtualNode(v30, nil, "WithDerivedState")
        expect(v28.callCount).to.equal(1)
        v_u_1(v28:captureValues("props", "state").props, {
            ["someDefaultProp"] = "foo",
            ["someProp"] = 1
        })
        local v32 = v_u_3(v29, {
            ["someProp"] = 2
        })
        v_u_8.updateVirtualNode(v31, v32)
        expect(v28.callCount).to.equal(2)
        v_u_1(v28:captureValues("props", "state").props, {
            ["someDefaultProp"] = "foo",
            ["someProp"] = 2
        })
    end)
    it("should derive state for all setState updates, even when deferred", function()
        local v_u_33 = v_u_7:extend("Child")
        local v_u_34 = v_u_2(function()
            return {}
        end)
        local v35 = v_u_2()
        function v_u_33.render(_)
            return nil
        end
        function v_u_33.didMount(p36)
            p36.props.callback()
        end
        local v37 = v_u_7:extend("Parent")
        v37.getDerivedStateFromProps = v35.value
        function v37.render(p_u_38)
            local function v39()
                p_u_38:setState(v_u_34.value)
            end
            local v40 = v_u_4
            local v41 = {
                ["ChildA"] = v_u_3(v_u_33, {
                    ["callback"] = v39
                }),
                ["ChildB"] = v_u_3(v_u_33, {
                    ["callback"] = v39
                })
            }
            return v40(v41)
        end
        local v42 = v_u_3(v37)
        v_u_8.mountVirtualNode(v42, nil, "Test")
        expect(v_u_34.callCount).to.equal(2)
        expect(v35.callCount).to.equal(3)
    end)
    it("should have derived state after assigning to state in init", function()
        local v_u_43 = nil
        local v44 = v_u_2(function()
            return {
                ["derived"] = true
            }
        end)
        local v45 = v_u_7:extend("WithDerivedState")
        v45.getDerivedStateFromProps = v44.value
        function v45.init(p_u_46)
            p_u_46.state = {
                ["init"] = true
            }
            v_u_43 = function()
                return p_u_46.state
            end
        end
        function v45.render(_)
            return nil
        end
        local v47 = v_u_3(v45)
        v_u_8.mountVirtualNode(v47, nil, "WithDerivedState")
        expect(v44.callCount).to.equal(2)
        v_u_1(v_u_43(), {
            ["init"] = true,
            ["derived"] = true
        })
    end)
end