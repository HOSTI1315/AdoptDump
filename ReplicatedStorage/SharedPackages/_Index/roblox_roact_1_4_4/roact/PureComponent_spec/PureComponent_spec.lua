--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.PureComponent.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.createElement)
    local v2 = require(script.Parent.NoopRenderer)
    local v3 = require(script.Parent.createReconciler)
    local v_u_4 = require(script.Parent.PureComponent)
    local v_u_5 = v3(v2)
    it("should be extendable", function()
        local v6 = v_u_4:extend("MyComponent")
        expect(v6).to.be.ok()
    end)
    it("should skip updates for shallow-equal props", function()
        local v_u_7 = 0
        local v_u_8 = nil
        local v_u_9 = v_u_4:extend("PureChild")
        function v_u_9.willUpdate(_)
            v_u_7 = v_u_7 + 1
        end
        function v_u_9.render(_)
            return nil
        end
        local v10 = v_u_4:extend("PureContainer")
        function v10.init(p11)
            p11.state = {
                ["value"] = 0
            }
        end
        function v10.didMount(p_u_12)
            v_u_8 = function(p13)
                p_u_12:setState({
                    ["value"] = p13
                })
            end
        end
        function v10.render(p14)
            return v_u_1(v_u_9, {
                ["value"] = p14.state.value
            })
        end
        local v15 = v_u_1(v10)
        local v16 = v_u_5.mountVirtualTree(v15, nil, "PureComponent Tree")
        expect(v_u_7).to.equal(0)
        v_u_8(1)
        expect(v_u_7).to.equal(1)
        v_u_8(1)
        expect(v_u_7).to.equal(1)
        v_u_8(2)
        expect(v_u_7).to.equal(2)
        v_u_8(1)
        expect(v_u_7).to.equal(3)
        v_u_5.unmountVirtualTree(v16)
    end)
end