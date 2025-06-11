--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Component.spec.didUpdate.spec (ModuleScript)

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
        v9.didUpdate = v10.value
        function v9.render(_)
            return nil
        end
        local v11 = {
            ["a"] = 5
        }
        local v12 = v_u_2(v9, v11)
        local v13 = v_u_8.mountVirtualNode(v12, nil, "Test")
        expect(v10.callCount).to.equal(0)
        local v14 = v_u_2(v9, {
            ["a"] = 6,
            ["b"] = 2
        })
        v_u_8.updateVirtualNode(v13, v14)
        expect(v10.callCount).to.equal(1)
        local v15 = v10:captureValues("self", "oldProps", "oldState")
        expect(v_u_6.of(v15.self)).to.equal(v_u_6.StatefulComponentInstance)
        v_u_1(v15.oldProps, v11)
        v_u_1(v15.oldState, {})
    end)
    it("should be invoked when updated via setState", function()
        local v16 = v_u_7:extend("MyComponent")
        local v17 = v_u_4()
        v16.didUpdate = v17.value
        local v_u_18 = {
            ["a"] = 4
        }
        local v_u_19 = nil
        function v16.init(p_u_20)
            v_u_19 = function(...)
                return p_u_20:setState(...)
            end
            p_u_20:setState(v_u_18)
        end
        function v16.render(_) end
        local v21 = v_u_2(v16)
        v_u_8.mountVirtualNode(v21, nil, "Test")
        expect(v17.callCount).to.equal(0)
        v_u_19({
            ["a"] = 5
        })
        expect(v17.callCount).to.equal(1)
        local v22 = v17:captureValues("self", "oldProps", "oldState")
        expect(v_u_6.of(v22.self)).to.equal(v_u_6.StatefulComponentInstance)
        v_u_1(v22.oldProps, {})
        v_u_1(v22.oldState, v_u_18)
    end)
end