--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Component.spec.willUnmount.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Parent.createElement)
    local v2 = require(script.Parent.Parent.createReconciler)
    local v_u_3 = require(script.Parent.Parent.createSpy)
    local v4 = require(script.Parent.Parent.NoopRenderer)
    local v_u_5 = require(script.Parent.Parent.Type)
    local v_u_6 = require(script.Parent.Parent.Component)
    local v_u_7 = v2(v4)
    it("should be invoked when unmounted", function()
        local v8 = v_u_6:extend("MyComponent")
        local v9 = v_u_3()
        v8.willUnmount = v9.value
        function v8.render(_)
            return nil
        end
        local v10 = v_u_1(v8)
        local v11 = v_u_7.mountVirtualNode(v10, nil, "Test")
        v_u_7.unmountVirtualNode(v11)
        expect(v9.callCount).to.equal(1)
        local v12 = v9:captureValues("self")
        expect(v_u_5.of(v12.self)).to.equal(v_u_5.StatefulComponentInstance)
    end)
end