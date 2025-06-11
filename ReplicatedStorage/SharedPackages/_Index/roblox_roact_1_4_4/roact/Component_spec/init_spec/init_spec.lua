--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Component.spec.init.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Parent.assertDeepEqual)
    local v_u_2 = require(script.Parent.Parent.createElement)
    local v3 = require(script.Parent.Parent.createReconciler)
    local v_u_4 = require(script.Parent.Parent.createSpy)
    local v5 = require(script.Parent.Parent.NoopRenderer)
    local v_u_6 = require(script.Parent.Parent.Type)
    local v_u_7 = require(script.Parent.Parent.Component)
    local v_u_8 = v3(v5)
    it("should be invoked with props when mounted", function()
        local v9 = v_u_7:extend("MyComponent")
        local v10 = v_u_4()
        v9.init = v10.value
        function v9.render(_)
            return nil
        end
        local v11 = {
            ["a"] = 5
        }
        local v12 = v_u_2(v9, v11)
        v_u_8.mountVirtualNode(v12, nil, "Some Component Key")
        expect(v10.callCount).to.equal(1)
        local v13 = v10:captureValues("self", "props")
        expect(v_u_6.of(v13.self)).to.equal(v_u_6.StatefulComponentInstance)
        local v14 = expect
        local v15 = v13.props
        v14((typeof(v15))).to.equal("table")
        v_u_1(v13.props, v11)
    end)
end