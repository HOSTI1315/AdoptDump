--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Component.spec.validateProps.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Parent.createElement)
    local v2 = require(script.Parent.Parent.createReconciler)
    local v_u_3 = require(script.Parent.Parent.createSpy)
    local v4 = require(script.Parent.Parent.NoopRenderer)
    local v_u_5 = require(script.Parent.Parent.GlobalConfig)
    local v_u_6 = require(script.Parent.Parent.Component)
    local v_u_7 = v2(v4)
    it("should be invoked when mounted", function()
        v_u_5.scoped({
            ["propValidation"] = true
        }, function()
            local v8 = v_u_6:extend("MyComponent")
            local v9 = v_u_3(function()
                return true
            end)
            v8.validateProps = v9.value
            function v8.render(_)
                return nil
            end
            local v10 = v_u_1(v8)
            v_u_7.mountVirtualNode(v10, nil, "Test")
            expect(v9.callCount).to.equal(1)
        end)
    end)
    it("should be invoked when props change", function()
        v_u_5.scoped({
            ["propValidation"] = true
        }, function()
            local v11 = v_u_6:extend("MyComponent")
            local v12 = v_u_3(function()
                return true
            end)
            v11.validateProps = v12.value
            function v11.render(_)
                return nil
            end
            local v13 = v_u_1(v11, {
                ["a"] = 1
            })
            local v14 = v_u_7.mountVirtualNode(v13, nil, "Test")
            expect(v12.callCount).to.equal(1)
            v12:assertCalledWithDeepEqual({
                ["a"] = 1
            })
            local v15 = v_u_1(v11, {
                ["a"] = 2
            })
            v_u_7.updateVirtualNode(v14, v15)
            expect(v12.callCount).to.equal(2)
            v12:assertCalledWithDeepEqual({
                ["a"] = 2
            })
        end)
    end)
    it("should not be invoked when state changes", function()
        v_u_5.scoped({
            ["propValidation"] = true
        }, function()
            local v16 = v_u_6:extend("MyComponent")
            local v_u_17 = nil
            local v18 = v_u_3(function()
                return true
            end)
            v16.validateProps = v18.value
            function v16.init(p_u_19)
                v_u_17 = function(p20)
                    p_u_19:setState(p20)
                end
            end
            function v16.render(_)
                return nil
            end
            local v21 = v_u_1(v16, {
                ["a"] = 1
            })
            v_u_7.mountVirtualNode(v21, nil, "Test")
            expect(v18.callCount).to.equal(1)
            v18:assertCalledWithDeepEqual({
                ["a"] = 1
            })
            v_u_17({
                ["b"] = 1
            })
            expect(v18.callCount).to.equal(1)
        end)
    end)
    it("should throw if validateProps is not a function", function()
        v_u_5.scoped({
            ["propValidation"] = true
        }, function()
            local v22 = v_u_6:extend("MyComponent")
            v22.validateProps = 1
            function v22.render(_)
                return nil
            end
            local v_u_23 = v_u_1(v22)
            expect(function()
                v_u_7.mountVirtualNode(v_u_23, nil, "Test")
            end).to.throw()
        end)
    end)
    it("should throw if validateProps returns false", function()
        v_u_5.scoped({
            ["propValidation"] = true
        }, function()
            local v24 = v_u_6:extend("MyComponent")
            function v24.validateProps()
                return false
            end
            function v24.render(_)
                return nil
            end
            local v_u_25 = v_u_1(v24)
            expect(function()
                v_u_7.mountVirtualNode(v_u_25, nil, "Test")
            end).to.throw()
        end)
    end)
    it("should include the component name in the error message", function()
        v_u_5.scoped({
            ["propValidation"] = true
        }, function()
            local v26 = v_u_6:extend("MyComponent")
            function v26.validateProps()
                return false
            end
            function v26.render(_)
                return nil
            end
            local v_u_27 = v_u_1(v26)
            local v28, v29 = pcall(function()
                v_u_7.mountVirtualNode(v_u_27, nil, "Test")
            end)
            expect(v28).to.equal(false)
            local v30 = v29:find("MyComponent")
            expect(v30).to.be.ok()
        end)
    end)
    it("should be invoked after defaultProps are applied", function()
        v_u_5.scoped({
            ["propValidation"] = true
        }, function()
            local v31 = v_u_6:extend("MyComponent")
            local v32 = v_u_3(function()
                return true
            end)
            v31.validateProps = v32.value
            function v31.render(_)
                return nil
            end
            v31.defaultProps = {
                ["b"] = 2
            }
            local v33 = v_u_1(v31, {
                ["a"] = 1
            })
            local v34 = v_u_7.mountVirtualNode(v33, nil, "Test")
            expect(v32.callCount).to.equal(1)
            v32:assertCalledWithDeepEqual({
                ["a"] = 1,
                ["b"] = 2
            })
            local v35 = v_u_1(v31, {
                ["a"] = 2
            })
            v_u_7.updateVirtualNode(v34, v35)
            expect(v32.callCount).to.equal(2)
            v32:assertCalledWithDeepEqual({
                ["a"] = 2,
                ["b"] = 2
            })
        end)
    end)
    it("should not be invoked if the flag is off", function()
        v_u_5.scoped({
            ["propValidation"] = false
        }, function()
            local v36 = v_u_6:extend("MyComponent")
            local v37 = v_u_3(function()
                return true
            end)
            v36.validateProps = v37.value
            function v36.render(_)
                return nil
            end
            local v38 = v_u_1(v36, {
                ["a"] = 1
            })
            local v39 = v_u_7.mountVirtualNode(v38, nil, "Test")
            expect(v37.callCount).to.equal(0)
            local v40 = v_u_1(v36, {
                ["a"] = 2
            })
            v_u_7.updateVirtualNode(v39, v40)
            expect(v37.callCount).to.equal(0)
        end)
    end)
end