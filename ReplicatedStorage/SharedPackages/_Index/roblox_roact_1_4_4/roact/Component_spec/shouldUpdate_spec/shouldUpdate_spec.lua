--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Component.spec.shouldUpdate.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Parent.assertDeepEqual)
    local v_u_2 = require(script.Parent.Parent.createElement)
    local v3 = require(script.Parent.Parent.createReconciler)
    local v_u_4 = require(script.Parent.Parent.createSpy)
    local v5 = require(script.Parent.Parent.NoopRenderer)
    local v_u_6 = require(script.Parent.Parent.Type)
    local v_u_7 = require(script.Parent.Parent.Component)
    local v_u_8 = v3(v5)
    it("should be invoked when props update", function()
        local v9 = v_u_7:extend("MyComponent")
        local v_u_10 = nil
        local v_u_11 = nil
        local v13 = v_u_4(function(p12)
            v_u_10 = p12.props
            v_u_11 = p12.state
            return true
        end)
        v9.shouldUpdate = v13.value
        function v9.render(_)
            return nil
        end
        local v14 = {
            ["a"] = 5
        }
        local v15 = v_u_2(v9, v14)
        local v16 = v_u_8.mountVirtualNode(v15, nil, "Test")
        expect(v13.callCount).to.equal(0)
        local v17 = {
            ["a"] = 6,
            ["b"] = 2
        }
        local v18 = v_u_2(v9, v17)
        v_u_8.updateVirtualNode(v16, v18)
        expect(v13.callCount).to.equal(1)
        local v19 = v13:captureValues("self", "newProps", "newState")
        expect(v_u_6.of(v19.self)).to.equal(v_u_6.StatefulComponentInstance)
        v_u_1(v19.newProps, v17)
        v_u_1(v_u_10, v14)
        expect(v19.newState).to.equal(v_u_11)
        v_u_1(v_u_11, {})
    end)
    it("should be invoked when state is updated", function()
        local v20 = v_u_7:extend("MyComponent")
        local v_u_21 = {
            ["a"] = 1
        }
        local v_u_22 = nil
        local v_u_23 = nil
        function v20.init(p_u_24)
            v_u_22 = function(...)
                return p_u_24:setState(...)
            end
            p_u_24:setState(v_u_21)
            v_u_23 = p_u_24.state
        end
        local v_u_25 = nil
        local v_u_26 = nil
        local v28 = v_u_4(function(p27)
            v_u_25 = p27.props
            v_u_26 = p27.state
            return true
        end)
        v20.shouldUpdate = v28.value
        function v20.render(_)
            return nil
        end
        local v29 = v_u_2(v20)
        v_u_8.mountVirtualNode(v29, nil, "Test")
        expect(v28.callCount).to.equal(0)
        local v30 = {
            ["a"] = 2,
            ["b"] = 3
        }
        v_u_22(v30)
        expect(v28.callCount).to.equal(1)
        local v31 = v28:captureValues("self", "newProps", "newState")
        expect(v_u_6.of(v31.self)).to.equal(v_u_6.StatefulComponentInstance)
        expect(v31.newProps).to.equal(v_u_25)
        v_u_1(v_u_25, {})
        v_u_1(v_u_26, v_u_21)
        expect(v_u_26).to.equal(v_u_23)
        v_u_1(v31.newState, v30)
    end)
    it("should not abort an update when returning true", function()
        local v32 = v_u_7:extend("MyComponent")
        function v32.shouldUpdate(_)
            return true
        end
        local v33 = v_u_4()
        v32.render = v33.value
        local v34 = v_u_2(v32)
        local v35 = v_u_8.mountVirtualNode(v34, nil, "Test")
        expect(v33.callCount).to.equal(1)
        local v36 = v_u_2(v32)
        v_u_8.updateVirtualNode(v35, v36)
        expect(v33.callCount).to.equal(2)
    end)
    it("should abort an update when retuning false", function()
        local v37 = v_u_7:extend("MyComponent")
        function v37.shouldUpdate(_)
            return false
        end
        local v38 = v_u_4()
        v37.render = v38.value
        local v39 = v_u_2(v37)
        local v40 = v_u_8.mountVirtualNode(v39, nil, "Test")
        expect(v38.callCount).to.equal(1)
        local v41 = v_u_2(v37)
        v_u_8.updateVirtualNode(v40, v41)
        expect(v38.callCount).to.equal(1)
    end)
end