--// ReplicatedStorage.SharedPackages._Index.reselim_flipper@2.0.0.flipper.GroupMotor.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.GroupMotor)
    local v_u_2 = require(script.Parent.Instant)
    local v_u_3 = require(script.Parent.Spring)
    it("should complete when all child motors are complete", function()
        local v4 = v_u_1.new({
            ["A"] = 1,
            ["B"] = 2
        }, false)
        expect(v4._complete).to.equal(true)
        local v5 = {
            ["A"] = v_u_2.new(3),
            ["B"] = v_u_3.new(4, {
                ["frequency"] = 7.5,
                ["dampingRatio"] = 1
            })
        }
        v4:setGoal(v5)
        expect(v4._complete).to.equal(false)
        v4:step(0.016666666666666666)
        expect(v4._complete).to.equal(false)
        for _ = 1, 30 do
            v4:step(0.016666666666666666)
        end
        expect(v4._complete).to.equal(true)
    end)
    it("should start when the goal is set", function()
        local v6 = v_u_1.new({
            ["A"] = 0
        }, false)
        local v_u_7 = false
        v6:onStart(function()
            v_u_7 = not v_u_7
        end)
        v6:setGoal({
            ["A"] = v_u_2.new(1)
        })
        expect(v_u_7).to.equal(true)
        v6:setGoal({
            ["A"] = v_u_2.new(1)
        })
        expect(v_u_7).to.equal(false)
    end)
    it("should properly return all values", function()
        local v8 = v_u_1.new({
            ["A"] = 1,
            ["B"] = 2
        }, false):getValue()
        expect(v8.A).to.equal(1)
        expect(v8.B).to.equal(2)
    end)
    it("should error when a goal is given to GroupMotor.new", function()
        local v9 = pcall(function()
            v_u_1.new(v_u_2.new(0))
        end)
        expect(v9).to.equal(false)
    end)
    it("should error when a single goal is provided to GroupMotor:step", function()
        local v10 = pcall(function()
            v_u_1.new({
                ["a"] = 1
            }):setGoal(v_u_2.new(0))
        end)
        expect(v10).to.equal(false)
    end)
end