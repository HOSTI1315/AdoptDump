--// ReplicatedStorage.SharedPackages._Index.reselim_flipper@2.0.0.flipper.Signal.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Signal)
    it("should invoke all connections, instantly", function()
        local v2 = v_u_1.new()
        local v_u_3 = nil
        local v_u_4 = nil
        v2:connect(function(p5)
            v_u_3 = p5
        end)
        v2:connect(function(p6)
            v_u_4 = p6
        end)
        v2:fire("hello")
        expect(v_u_3).to.equal("hello")
        expect(v_u_4).to.equal("hello")
    end)
    it("should return values when :wait() is called", function()
        local v_u_7 = v_u_1.new()
        spawn(function()
            v_u_7:fire(123, "hello")
        end)
        local v8, v9 = v_u_7:wait()
        expect(v8).to.equal(123)
        expect(v9).to.equal("hello")
    end)
    it("should properly handle disconnections", function()
        local v10 = v_u_1.new()
        local v_u_11 = false
        v10:connect(function()
            v_u_11 = true
        end):disconnect()
        v10:fire()
        expect(v_u_11).to.equal(false)
    end)
end