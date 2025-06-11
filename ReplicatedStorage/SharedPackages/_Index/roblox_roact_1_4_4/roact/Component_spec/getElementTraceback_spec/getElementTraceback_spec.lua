--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Component.spec.getElementTraceback.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Parent.createElement)
    local v2 = require(script.Parent.Parent.createReconciler)
    local v_u_3 = require(script.Parent.Parent.GlobalConfig)
    local v4 = require(script.Parent.Parent.NoopRenderer)
    local v_u_5 = require(script.Parent.Parent.Component)
    local v_u_6 = v2(v4)
    it("should return stack traces in initial renders", function()
        local v_u_7 = v_u_5:extend("TestComponent")
        local v_u_8 = nil
        function v_u_7.init(p9)
            v_u_8 = p9:getElementTraceback()
        end
        function v_u_7.render(_)
            return nil
        end
        v_u_3.scoped({
            ["elementTracing"] = true
        }, function()
            local v10 = v_u_1(v_u_7)
            v_u_6.mountVirtualNode(v10, nil, "Some key")
        end)
        expect(v_u_8).to.be.a("string")
    end)
    itSKIP("it should return an updated stack trace after an update", function() end)
    it("should return nil when elementTracing is off", function()
        local v_u_11 = nil
        local v_u_12 = v_u_5:extend("TestComponent")
        function v_u_12.init(p13)
            v_u_11 = p13:getElementTraceback()
        end
        function v_u_12.render(_)
            return nil
        end
        v_u_3.scoped({
            ["elementTracing"] = false
        }, function()
            local v14 = v_u_1(v_u_12)
            v_u_6.mountVirtualNode(v14, nil, "Some key")
        end)
        expect(v_u_11).to.equal(nil)
    end)
end