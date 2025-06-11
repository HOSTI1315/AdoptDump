--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.strict.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.strict)
    it("should error when getting a nonexistent key", function()
        local v_u_2 = v_u_1({
            ["a"] = 1,
            ["b"] = 2
        })
        expect(function()
            return v_u_2.c
        end).to.throw()
    end)
    it("should error when setting a nonexistent key", function()
        local v_u_3 = v_u_1({
            ["a"] = 1,
            ["b"] = 2
        })
        expect(function()
            v_u_3.c = 3
        end).to.throw()
    end)
end