--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.assign.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.None)
    local v_u_2 = require(script.Parent.assign)
    it("should accept zero additional tables", function()
        local v3 = {}
        local v4 = v_u_2(v3)
        expect(v3).to.equal(v4)
    end)
    it("should merge multiple tables onto the given target table", function()
        local v5 = {
            ["a"] = 5,
            ["b"] = 6
        }
        local v6 = {
            ["b"] = 7,
            ["c"] = 8
        }
        local v7 = {
            ["b"] = 8
        }
        v_u_2(v5, v6, v7)
        expect(v5.a).to.equal(5)
        expect(v5.b).to.equal(v7.b)
        expect(v5.c).to.equal(v6.c)
    end)
    it("should remove keys if specified as None", function()
        local v8 = {
            ["foo"] = 2,
            ["bar"] = 3
        }
        v_u_2(v8, {
            ["foo"] = v_u_1
        })
        expect(v8.foo).to.equal(nil)
        expect(v8.bar).to.equal(3)
    end)
    it("should re-add keys if specified after None", function()
        local v9 = {
            ["foo"] = 2
        }
        local v10 = {
            ["foo"] = 3
        }
        v_u_2(v9, {
            ["foo"] = v_u_1
        }, v10)
        expect(v9.foo).to.equal(v10.foo)
    end)
end