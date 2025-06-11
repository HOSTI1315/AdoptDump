--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.Component.spec.defaultProps.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Parent.assertDeepEqual)
    local v_u_2 = require(script.Parent.Parent.createElement)
    local v3 = require(script.Parent.Parent.createReconciler)
    local v_u_4 = require(script.Parent.Parent.None)
    local v5 = require(script.Parent.Parent.NoopRenderer)
    local v_u_6 = require(script.Parent.Parent.Component)
    local v_u_7 = v3(v5)
    it("should fill in when mounting before init", function()
        local v8 = {
            ["a"] = 3,
            ["b"] = 2
        }
        local v9 = v_u_6:extend("Foo")
        v9.defaultProps = v8
        local v_u_10 = nil
        function v9.init(p11)
            v_u_10 = p11.props
        end
        function v9.render(_) end
        local v12 = {
            ["b"] = 4,
            ["c"] = 6
        }
        local v13 = v_u_2(v9, v12)
        v_u_7.mountVirtualNode(v13, nil, "Some Foo")
        v_u_1(v_u_10, {
            ["a"] = v8.a,
            ["b"] = v12.b,
            ["c"] = v12.c
        })
    end)
    it("should fill in when updating via props", function()
        local v14 = {
            ["a"] = 3,
            ["b"] = 2
        }
        local v15 = v_u_6:extend("Foo")
        v15.defaultProps = v14
        local v_u_16 = nil
        function v15.render(p17)
            v_u_16 = p17.props
        end
        local v18 = v_u_2(v15, {
            ["b"] = 4,
            ["c"] = 6
        })
        local v19 = v_u_7.mountVirtualNode(v18, nil, "Some Foo")
        local v20 = {
            ["c"] = 5
        }
        local v21 = v_u_2(v15, v20)
        v_u_7.updateVirtualNode(v19, v21)
        v_u_1(v_u_16, {
            ["a"] = v14.a,
            ["b"] = v14.b,
            ["c"] = v20.c
        })
    end)
    it("should respect None to override a default prop with nil", function()
        local v22 = {
            ["a"] = 3,
            ["b"] = 2
        }
        local v23 = v_u_6:extend("Foo")
        v23.defaultProps = v22
        local v_u_24 = nil
        function v23.render(p25)
            v_u_24 = p25.props
        end
        local v26 = {
            ["b"] = v_u_4,
            ["c"] = 4
        }
        local v27 = v_u_2(v23, v26)
        v_u_7.mountVirtualNode(v27, nil, "Some Foo")
        v_u_1(v_u_24, {
            ["a"] = v22.a,
            ["b"] = nil,
            ["c"] = v26.c
        })
    end)
end