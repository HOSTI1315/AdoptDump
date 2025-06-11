--// ReplicatedStorage.SharedPackages._Index.reselim_flipper@2.0.0.flipper.Linear.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.SingleMotor)
    local v_u_2 = require(script.Parent.Linear)
    describe("completed state", function()
        local v_u_3 = v_u_1.new(0, false)
        v_u_3:setGoal((v_u_2.new(1, {
            ["velocity"] = 1
        })))
        for _ = 1, 60 do
            v_u_3:step(0.016666666666666666)
        end
        it("should complete", function()
            expect(v_u_3._state.complete).to.equal(true)
        end)
        it("should be exactly the goal value when completed", function()
            expect(v_u_3._state.value).to.equal(1)
        end)
    end)
    describe("uncompleted state", function()
        local v_u_4 = v_u_1.new(0, false)
        v_u_4:setGoal((v_u_2.new(1, {
            ["velocity"] = 1
        })))
        for _ = 1, 59 do
            v_u_4:step(0.016666666666666666)
        end
        it("should be uncomplete", function()
            expect(v_u_4._state.complete).to.equal(false)
        end)
    end)
    describe("negative velocity", function()
        local v_u_5 = v_u_1.new(1, false)
        v_u_5:setGoal((v_u_2.new(0, {
            ["velocity"] = 1
        })))
        for _ = 1, 60 do
            v_u_5:step(0.016666666666666666)
        end
        it("should complete", function()
            expect(v_u_5._state.complete).to.equal(true)
        end)
        it("should be exactly the goal value when completed", function()
            expect(v_u_5._state.value).to.equal(0)
        end)
    end)
end