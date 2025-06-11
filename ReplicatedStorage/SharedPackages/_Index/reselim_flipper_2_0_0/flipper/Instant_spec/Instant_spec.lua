--// ReplicatedStorage.SharedPackages._Index.reselim_flipper@2.0.0.flipper.Instant.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.Instant)
    it("should return a completed state with the provided value", function()
        local v2 = v_u_1.new(1.23):step(0.1, {
            ["value"] = 0,
            ["complete"] = false
        })
        expect(v2.complete).to.equal(true)
        expect(v2.value).to.equal(1.23)
    end)
end