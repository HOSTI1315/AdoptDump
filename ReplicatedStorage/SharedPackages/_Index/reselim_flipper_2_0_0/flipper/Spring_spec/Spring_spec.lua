--// ReplicatedStorage.SharedPackages._Index.reselim_flipper@2.0.0.flipper.Spring.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.SingleMotor)
    local v_u_2 = require(script.Parent.Spring)
    describe("completed state", function()
        local v_u_3 = v_u_1.new(0, false)
        v_u_3:setGoal((v_u_2.new(1, {
            ["frequency"] = 2,
            ["dampingRatio"] = 0.75
        })))
        for _ = 1, 100 do
            v_u_3:step(0.016666666666666666)
        end
        it("should complete", function()
            expect(v_u_3._state.complete).to.equal(true)
        end)
        it("should be exactly the goal value when completed", function()
            expect(v_u_3._state.value).to.equal(1)
        end)
    end)
    it("should inherit velocity", function()
        local v4 = v_u_1.new(0, false)
        v4._state = {
            ["complete"] = false,
            ["value"] = 0,
            ["velocity"] = -5
        }
        v4:setGoal((v_u_2.new(1, {
            ["frequency"] = 2,
            ["dampingRatio"] = 1
        })))
        v4:step(0.016666666666666666)
        expect(v4._state.velocity < 0).to.equal(true)
    end)
end