--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Component.spec.legacyContext.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Parent.assertDeepEqual)
    local v_u_2 = require(script.Parent.Parent.createElement)
    local v3 = require(script.Parent.Parent.createReconciler)
    local v4 = require(script.Parent.Parent.NoopRenderer)
    local v_u_5 = require(script.Parent.Parent.Component)
    local v_u_6 = v3(v4)
    it("should be provided as a mutable self._context in Component:init", function()
        local v7 = v_u_5:extend("Provider")
        function v7.init(p8)
            p8._context.foo = "bar"
        end
        function v7.render(_) end
        local v9 = v_u_2(v7)
        v_u_1(v_u_6.mountVirtualNode(v9, nil, "Provider").legacyContext, {
            ["foo"] = "bar"
        })
    end)
    it("should be inherited from parent stateful nodes", function()
        local v_u_10 = v_u_5:extend("Consumer")
        local v_u_11 = nil
        function v_u_10.init(p12)
            v_u_11 = p12._context
        end
        function v_u_10.render(_) end
        local v13 = v_u_5:extend("Parent")
        function v13.render(_)
            return v_u_2(v_u_10)
        end
        local v14 = v_u_2(v13)
        local v15 = {
            ["hello"] = "world",
            ["value"] = 6
        }
        local v16 = v_u_6.mountVirtualNode(v14, nil, "Parent", nil, v15)
        expect(v_u_11).never.to.equal(v15)
        expect(v_u_11).never.to.equal(v16.legacyContext)
        v_u_1(v16.legacyContext, v15)
        v_u_1(v_u_11, v15)
    end)
    it("should be inherited from parent function nodes", function()
        local v_u_17 = v_u_5:extend("Consumer")
        local v_u_18 = nil
        function v_u_17.init(p19)
            v_u_18 = p19._context
        end
        function v_u_17.render(_) end
        local v20 = v_u_2(function()
            return v_u_2(v_u_17)
        end)
        local v21 = {
            ["hello"] = "world",
            ["value"] = 6
        }
        local v22 = v_u_6.mountVirtualNode(v20, nil, "Parent", nil, v21)
        expect(v_u_18).never.to.equal(v21)
        expect(v_u_18).never.to.equal(v22.legacyContext)
        v_u_1(v22.legacyContext, v21)
        v_u_1(v_u_18, v21)
    end)
    it("should contain values put into the tree by parent nodes", function()
        local v_u_23 = v_u_5:extend("Consumer")
        local v_u_24 = nil
        function v_u_23.init(p25)
            v_u_24 = p25._context
        end
        function v_u_23.render(_) end
        local v26 = v_u_5:extend("Provider")
        function v26.init(p27)
            p27._context.frob = "ulator"
        end
        function v26.render(_)
            return v_u_2(v_u_23)
        end
        local v28 = v_u_2(v26)
        local v29 = {
            ["dont"] = "try it"
        }
        local v30 = v_u_6.mountVirtualNode(v28, nil, "Consumer", nil, v29)
        local v31 = {
            ["dont"] = "try it",
            ["frob"] = "ulator"
        }
        expect(v30.legacyContext).never.to.equal(v29)
        expect(v_u_24).never.to.equal(v29)
        expect(v_u_24).never.to.equal(v30.legacyContext)
        v_u_1(v29, {
            ["dont"] = "try it"
        })
        v_u_1(v30.legacyContext, v31)
        v_u_1(v_u_24, v31)
    end)
    it("should transfer context to children that are replaced", function()
        local v_u_32 = v_u_5:extend("ConsumerA")
        local v_u_33 = nil
        function v_u_32.init(p34)
            p34._context.A = "hello"
            v_u_33 = p34._context
        end
        function v_u_32.render(_) end
        local v_u_35 = v_u_5:extend("ConsumerB")
        local v_u_36 = nil
        function v_u_35.init(p37)
            p37._context.B = "hello"
            v_u_36 = p37._context
        end
        function v_u_35.render(_) end
        local v38 = v_u_5:extend("Provider")
        function v38.init(p39)
            p39._context.frob = "ulator"
        end
        function v38.render(p40)
            if p40.props.useConsumerB then
                return v_u_2(v_u_35)
            else
                return v_u_2(v_u_32)
            end
        end
        local v41 = v_u_2(v38)
        local v42 = v_u_6.mountVirtualNode(v41, nil, "Consumer")
        v_u_1(v_u_33, {
            ["frob"] = "ulator",
            ["A"] = "hello"
        })
        local v43 = v_u_2(v38, {
            ["useConsumerB"] = true
        })
        v_u_6.updateVirtualNode(v42, v43)
        v_u_1(v_u_36, {
            ["frob"] = "ulator",
            ["B"] = "hello"
        })
    end)
end