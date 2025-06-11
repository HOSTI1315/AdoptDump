--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Component.spec.context.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Parent.assertDeepEqual)
    local v_u_2 = require(script.Parent.Parent.createElement)
    local v3 = require(script.Parent.Parent.createReconciler)
    local v4 = require(script.Parent.Parent.NoopRenderer)
    local v_u_5 = require(script.Parent.Parent.oneChild)
    local v_u_6 = require(script.Parent.Parent.Component)
    local v_u_7 = v3(v4)
    it("should be provided as an internal api on Component", function()
        local v8 = v_u_6:extend("Provider")
        function v8.init(p9)
            p9:__addContext("foo", "bar")
        end
        function v8.render(_) end
        local v10 = v_u_2(v8)
        v_u_1(v_u_7.mountVirtualNode(v10, nil, "Provider").context, {
            ["foo"] = "bar"
        })
    end)
    it("should be inherited from parent stateful nodes", function()
        local v_u_11 = v_u_6:extend("Consumer")
        local v_u_12 = nil
        function v_u_11.init(p13)
            v_u_12 = {
                ["hello"] = p13:__getContext("hello"),
                ["value"] = p13:__getContext("value")
            }
        end
        function v_u_11.render(_) end
        local v14 = v_u_6:extend("Parent")
        function v14.render(_)
            return v_u_2(v_u_11)
        end
        local v15 = v_u_2(v14)
        local v16 = {
            ["hello"] = "world",
            ["value"] = 6
        }
        local v17 = v_u_7.mountVirtualNode(v15, nil, "Parent", v16)
        expect(v_u_12).never.to.equal(v16)
        expect(v_u_12).never.to.equal(v17.context)
        v_u_1(v17.context, v16)
        v_u_1(v_u_12, v16)
    end)
    it("should be inherited from parent function nodes", function()
        local v_u_18 = v_u_6:extend("Consumer")
        local v_u_19 = nil
        function v_u_18.init(p20)
            v_u_19 = {
                ["hello"] = p20:__getContext("hello"),
                ["value"] = p20:__getContext("value")
            }
        end
        function v_u_18.render(_) end
        local v21 = v_u_2(function()
            return v_u_2(v_u_18)
        end)
        local v22 = {
            ["hello"] = "world",
            ["value"] = 6
        }
        local v23 = v_u_7.mountVirtualNode(v21, nil, "Parent", v22)
        expect(v_u_19).never.to.equal(v22)
        expect(v_u_19).never.to.equal(v23.context)
        v_u_1(v23.context, v22)
        v_u_1(v_u_19, v22)
    end)
    it("should not copy the context table if it doesn\'t need to", function()
        local v24 = v_u_6:extend("Parent")
        function v24.init(p25)
            p25:__addContext("parent", "I\'m here!")
        end
        function v24.render(_)
            return v_u_2(function() end)
        end
        local v26 = v_u_2(v24)
        local v27 = v_u_7.mountVirtualNode(v26, nil, "Parent")
        v_u_1(v27.context, {
            ["parent"] = "I\'m here!"
        })
        local v28 = v_u_5(v27.children)
        expect(v27.context).to.equal(v28.context)
    end)
    it("should not allow context to move up the tree", function()
        local v_u_29 = v_u_6:extend("ChildProvider")
        function v_u_29.init(p30)
            p30:__addContext("child", "I\'m here too!")
        end
        function v_u_29.render(_) end
        local v31 = v_u_6:extend("ParentProvider")
        function v31.init(p32)
            p32:__addContext("parent", "I\'m here!")
        end
        function v31.render(_)
            return v_u_2(v_u_29)
        end
        local v33 = v_u_2(v31)
        local v34 = v_u_7.mountVirtualNode(v33, nil, "Parent")
        local v35 = v_u_5(v34.children)
        v_u_1(v34.context, {
            ["parent"] = "I\'m here!"
        })
        v_u_1(v35.context, {
            ["parent"] = "I\'m here!",
            ["child"] = "I\'m here too!"
        })
    end)
    it("should contain values put into the tree by parent nodes", function()
        local v_u_36 = v_u_6:extend("Consumer")
        local v_u_37 = nil
        function v_u_36.init(p38)
            v_u_37 = {
                ["dont"] = p38:__getContext("dont"),
                ["frob"] = p38:__getContext("frob")
            }
        end
        function v_u_36.render(_) end
        local v39 = v_u_6:extend("Provider")
        function v39.init(p40)
            p40:__addContext("frob", "ulator")
        end
        function v39.render(_)
            return v_u_2(v_u_36)
        end
        local v41 = v_u_2(v39)
        local v42 = {
            ["dont"] = "try it"
        }
        local v43 = v_u_7.mountVirtualNode(v41, nil, "Consumer", v42)
        local v44 = {
            ["dont"] = "try it",
            ["frob"] = "ulator"
        }
        expect(v43.context).never.to.equal(v42)
        expect(v_u_37).never.to.equal(v42)
        expect(v_u_37).never.to.equal(v43.context)
        v_u_1(v42, {
            ["dont"] = "try it"
        })
        v_u_1(v43.context, v44)
        v_u_1(v_u_37, v44)
    end)
    it("should transfer context to children that are replaced", function()
        local v_u_45 = v_u_6:extend("ConsumerA")
        local function v_u_47(p46)
            return {
                ["A"] = p46:__getContext("A"),
                ["B"] = p46:__getContext("B"),
                ["frob"] = p46:__getContext("frob")
            }
        end
        local v_u_48 = nil
        function v_u_45.init(p49)
            p49:__addContext("A", "hello")
            v_u_48 = v_u_47(p49)
        end
        function v_u_45.render(_) end
        local v_u_50 = v_u_6:extend("ConsumerB")
        local v_u_51 = nil
        function v_u_50.init(p52)
            p52:__addContext("B", "hello")
            v_u_51 = v_u_47(p52)
        end
        function v_u_50.render(_) end
        local v53 = v_u_6:extend("Provider")
        function v53.init(p54)
            p54:__addContext("frob", "ulator")
        end
        function v53.render(p55)
            if p55.props.useConsumerB then
                return v_u_2(v_u_50)
            else
                return v_u_2(v_u_45)
            end
        end
        local v56 = v_u_2(v53)
        local v57 = v_u_7.mountVirtualNode(v56, nil, "Consumer")
        v_u_1(v_u_48, {
            ["frob"] = "ulator",
            ["A"] = "hello"
        })
        local v58 = v_u_2(v53, {
            ["useConsumerB"] = true
        })
        v_u_7.updateVirtualNode(v57, v58)
        v_u_1(v_u_51, {
            ["frob"] = "ulator",
            ["B"] = "hello"
        })
    end)
end