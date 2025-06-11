--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Component.spec.willUpdate.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Parent.assertDeepEqual)
    local v_u_2 = require(script.Parent.Parent.createElement)
    local v3 = require(script.Parent.Parent.createReconciler)
    local v_u_4 = require(script.Parent.Parent.createSpy)
    local v5 = require(script.Parent.Parent.NoopRenderer)
    local v_u_6 = require(script.Parent.Parent.Type)
    local v_u_7 = require(script.Parent.Parent.Component)
    local v_u_8 = v3(v5)
    it("should be invoked when updated via updateVirtualNode", function()
        local v9 = v_u_7:extend("MyComponent")
        local v10 = v_u_4()
        v9.willUpdate = v10.value
        function v9.render(_)
            return nil
        end
        local v11 = v_u_2(v9, {
            ["a"] = 5
        })
        local v12 = v_u_8.mountVirtualNode(v11, nil, "Test")
        local v13 = {
            ["a"] = 6,
            ["b"] = 2
        }
        local v14 = v_u_2(v9, v13)
        v_u_8.updateVirtualNode(v12, v14)
        expect(v10.callCount).to.equal(1)
        local v15 = v10:captureValues("self", "newProps", "newState")
        expect(v_u_6.of(v15.self)).to.equal(v_u_6.StatefulComponentInstance)
        v_u_1(v15.newProps, v13)
        v_u_1(v15.newState, {})
    end)
    it("it should be invoked when updated via setState", function()
        local v16 = v_u_7:extend("MyComponent")
        local v_u_17 = nil
        local v18 = v_u_4()
        v16.willUpdate = v18.value
        function v16.init(p_u_19)
            v_u_17 = function(p20)
                p_u_19:setState(p20)
            end
            p_u_19:setState({
                ["foo"] = 1
            })
        end
        function v16.render(_)
            return nil
        end
        local v21 = v_u_2(v16)
        v_u_8.mountVirtualNode(v21, nil, "Test")
        expect(v18.callCount).to.equal(0)
        v_u_17({
            ["foo"] = 2
        })
        expect(v18.callCount).to.equal(1)
        local v22 = v18:captureValues("self", "newProps", "newState")
        expect(v_u_6.of(v22.self)).to.equal(v_u_6.StatefulComponentInstance)
        v_u_1(v22.newProps, {})
        v_u_1(v22.newState, {
            ["foo"] = 2
        })
    end)
end