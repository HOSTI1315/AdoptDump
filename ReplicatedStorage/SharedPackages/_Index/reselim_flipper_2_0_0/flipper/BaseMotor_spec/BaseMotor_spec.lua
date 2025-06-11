--// ReplicatedStorage.SharedPackages._Index.reselim_flipper@2.0.0.flipper.BaseMotor.spec (ModuleScript)

return function()
    local v_u_1 = game:GetService("RunService")
    local v_u_2 = require(script.Parent.BaseMotor)
    describe("connection management", function()
        local v_u_3 = v_u_2.new()
        it("should hook up connections on :start()", function()
            v_u_3:start()
            local v4 = expect
            local v5 = v_u_3._connection
            v4((typeof(v5))).to.equal("RBXScriptConnection")
        end)
        it("should remove connections on :stop() or :destroy()", function()
            v_u_3:stop()
            expect(v_u_3._connection).to.equal(nil)
        end)
    end)
    it("should call :step() with deltaTime", function()
        local v_u_6 = v_u_2.new()
        local v_u_7 = nil
        function v_u_6.step(_, ...)
            v_u_7 = { ... }
            v_u_6:stop()
        end
        v_u_6:start()
        local v8 = v_u_1.RenderStepped:Wait()
        v_u_1.RenderStepped:Wait()
        expect(v_u_7).to.be.ok()
        expect(v_u_7[1]).to.equal(v8)
    end)
end