--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Component.spec.render.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Parent.assertDeepEqual)
    local v_u_2 = require(script.Parent.Parent.createElement)
    local v3 = require(script.Parent.Parent.createReconciler)
    local v_u_4 = require(script.Parent.Parent.createSpy)
    local v5 = require(script.Parent.Parent.NoopRenderer)
    local v_u_6 = require(script.Parent.Parent.Type)
    local v_u_7 = require(script.Parent.Parent.Component)
    local v_u_8 = v3(v5)
    it("should throw on mount if not overridden", function()
        local v_u_9 = v_u_2((v_u_7:extend("MyComponent")))
        local v10, v11 = pcall(function()
            v_u_8.mountVirtualNode(v_u_9, nil, "Test")
        end)
        expect(v10).to.equal(false)
        expect(v11:match("MyComponent")).to.be.ok()
        expect(v11:match("render")).to.be.ok()
    end)
    it("should be invoked when a component is mounted", function()
        local v12 = v_u_7:extend("Foo")
        local v_u_13 = nil
        local v_u_14 = nil
        local v16 = v_u_4(function(p15)
            v_u_13 = p15.props
            v_u_14 = p15.state
        end)
        v12.render = v16.value
        local v17 = v_u_2(v12)
        v_u_8.mountVirtualNode(v17, nil, "Foo Test")
        expect(v16.callCount).to.equal(1)
        local v18 = v16:captureValues("self")
        expect(v_u_6.of(v18.self)).to.equal(v_u_6.StatefulComponentInstance)
        v_u_1(v_u_13, {})
        v_u_1(v_u_14, {})
    end)
    it("should be invoked when a component is updated via props", function()
        local v19 = v_u_7:extend("Foo")
        local v_u_20 = nil
        local v_u_21 = nil
        local v23 = v_u_4(function(p22)
            v_u_20 = p22.props
            v_u_21 = p22.state
        end)
        v19.render = v23.value
        local v24 = {
            ["a"] = 2
        }
        local v25 = v_u_2(v19, v24)
        local v26 = v_u_8.mountVirtualNode(v25, nil, "Foo Test")
        expect(v23.callCount).to.equal(1)
        local v27 = v23:captureValues("self")
        local v28 = v_u_20
        local v29 = v_u_21
        expect(v_u_6.of(v27.self)).to.equal(v_u_6.StatefulComponentInstance)
        v_u_1(v28, v24)
        v_u_1(v29, {})
        local v30 = {
            ["a"] = 3
        }
        local v31 = v_u_2(v19, v30)
        v_u_8.updateVirtualNode(v26, v31)
        expect(v23.callCount).to.equal(2)
        local v32 = v23:captureValues("self")
        local v33 = v_u_20
        local v34 = v_u_21
        expect(v_u_6.of(v32.self)).to.equal(v_u_6.StatefulComponentInstance)
        expect(v33).never.to.equal(v28)
        v_u_1(v33, v30)
        expect(v34).to.equal(v29)
    end)
    it("should be invoked when a component is updated via state", function()
        local v35 = v_u_7:extend("Foo")
        local v_u_36 = nil
        function v35.init(p_u_37)
            v_u_36 = function(...)
                return p_u_37:setState(...)
            end
        end
        local v_u_38 = nil
        local v_u_39 = nil
        local v41 = v_u_4(function(p40)
            v_u_38 = p40.props
            v_u_39 = p40.state
        end)
        v35.render = v41.value
        local v42 = v_u_2(v35)
        v_u_8.mountVirtualNode(v42, nil, "Foo Test")
        expect(v41.callCount).to.equal(1)
        local v43 = v41:captureValues("self")
        local v44 = v_u_38
        local v45 = v_u_39
        expect(v_u_6.of(v43.self)).to.equal(v_u_6.StatefulComponentInstance)
        v_u_36({})
        expect(v41.callCount).to.equal(2)
        local v46 = v41:captureValues("self")
        expect(v_u_6.of(v46.self)).to.equal(v_u_6.StatefulComponentInstance)
        expect(v_u_38).to.equal(v44)
        expect(v_u_39).never.to.equal(v45)
    end)
    itSKIP("Test defaultProps on initial render", function() end)
    itSKIP("Test defaultProps on prop update", function() end)
    itSKIP("Test defaultProps on state update", function() end)
end