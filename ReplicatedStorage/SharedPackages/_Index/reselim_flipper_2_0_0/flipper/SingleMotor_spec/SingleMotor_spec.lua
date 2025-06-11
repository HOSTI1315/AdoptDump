--// ReplicatedStorage.SharedPackages._Index.reselim_flipper@2.0.0.flipper.SingleMotor.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.SingleMotor)
    local v_u_2 = require(script.Parent.Instant)
    it("should assign new state on step", function()
        local v3 = v_u_1.new(0, false)
        v3:setGoal(v_u_2.new(5))
        v3:step(0.016666666666666666)
        expect(v3._state.complete).to.equal(true)
        expect(v3._state.value).to.equal(5)
    end)
    it("should invoke onComplete listeners when the goal is completed", function()
        local v4 = v_u_1.new(0, false)
        local v_u_5 = false
        v4:onComplete(function()
            v_u_5 = true
        end)
        v4:setGoal(v_u_2.new(5))
        v4:step(0.016666666666666666)
        expect(v_u_5).to.equal(true)
    end)
    it("should start when the goal is set", function()
        local v6 = v_u_1.new(0, false)
        local v_u_7 = false
        v6:onStart(function()
            v_u_7 = not v_u_7
        end)
        v6:setGoal(v_u_2.new(5))
        expect(v_u_7).to.equal(true)
        v6:setGoal(v_u_2.new(5))
        expect(v_u_7).to.equal(false)
    end)
end