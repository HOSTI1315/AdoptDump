--// ReplicatedStorage.SharedPackages._Index.roblox_roact@1.4.4.roact.oneChild.spec (ModuleScript)

return function()
    local v_u_1 = require(script.Parent.createElement)
    local v_u_2 = require(script.Parent.oneChild)
    it("should get zero children from a table", function()
        expect(v_u_2({})).to.equal(nil)
    end)
    it("should get exactly one child", function()
        local v3 = v_u_1("Frame")
        expect(v_u_2({
            ["foo"] = v3
        })).to.equal(v3)
    end)
    it("should error with more than one child", function()
        local v_u_4 = {
            ["a"] = v_u_1("Frame"),
            ["b"] = v_u_1("Frame")
        }
        expect(function()
            v_u_2(v_u_4)
        end).to.throw()
    end)
    it("should handle being passed nil", function()
        expect(v_u_2(nil)).to.equal(nil)
    end)
end